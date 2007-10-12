Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IgKkN-0006rN-E6
	for openembedded-devel@openembedded.org; Fri, 12 Oct 2007 15:40:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9CDY5Kg013648;
	Fri, 12 Oct 2007 14:34:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13397-06; Fri, 12 Oct 2007 14:34:02 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l9CDXvQi013641
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Fri, 12 Oct 2007 14:33:57 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Fri, 12 Oct 2007 14:33:56 +0100
Message-Id: <1192196037.24680.21.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Kdrive 1.4 resume issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Oct 2007 13:40:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I mentioned I knew something about the resume problem seen in Kdrive at
OEDEM. I don't know if the details below apply to the problem people are
seeing with 1.4 or not, just that this potential problem does exist
(this was reported to happen in 1.1.something iirc). FWIW, I'm not the
one who found this, I'm just passing on the info.

There is a potential race condition with the virtual terminal refresh
during resume:

a) Device suspends

b) The kernel VT subsystem delivers a signal to KDrive, requesting that
the virtual console be released

c) Kernel stalls suspend until KDrive makes an ioctl's on the terminal
to switch it out of graphical mode

d) Kernel immediately starts executing, and nothing from userspace ever
gets scheduled again before suspending. This means that KDrive's main
event loop (in os/WaitFor.c) is just done processing the VT release
request, but hasn't yet made a select() call for the next iteration of
its loop.

e) System sleeps...

f) Kernel resume code takes over, begins restoring things. Partway
along, it attempts to restore the VT. So another signal is delivered to
KDrive to restore the graphics.

g) Async signal handler runs in KDrive (hw/kdrive/linux/linux.c,
LinuxVTRequest), setting a flag ("kdSwitchPending") for inspection on
the next time that select() returns in the main event loop.

h) Unfortunately, since KDrive isn't yet scheduled after the resume,
the main event loop hasn't even gotten around to doing select() yet. So
this flag is never consulted before WaitForSomething() (os/WaitFor.c)
goes to sleep blocking on input. The VT restoration is never processed.

All this is not normally a problem, since there's some time between
successive arrivals of VT signals.

The patch below is not really a fix, but it checks whether a VT
reset is needed immediately before making the select() call. 

An alternative that was suggested would be to stick the receiving end of
a pipe into the set of fd's checked by the select() call. Then the
LinuxVTRequest() signal handler would write a dummy byte into the pipe
instead of setting a flag. 

I can't help feeling there must be a better solution entirely though.
I'd be interested to hear if this patch below helps or not...

Cheers,

Richard

diff -Nur xorg-server-X11R7.1-1.1.0.orig/os/WaitFor.c
--- xorg-server-X11R7.1-1.1.0.orig/os/WaitFor.c
+++ xorg-server-X11R7.1-1.1.0/os/WaitFor.c
@@ -152,6 +152,8 @@
  *     pClientsReady is an array to store ready client->index values into.
  *****************/
 
+extern Bool kdSwitchPending;
+
 int
 WaitForSomething(int *pClientsReady)
 {
@@ -232,7 +234,7 @@
        }
 #endif /* XTESTEXT1 */
        /* keep this check close to select() call to minimize race */
-       if (dispatchException)
+       if (dispatchException || kdSwitchPending)
            i = -1;
        else if (AnyClientsWriteBlocked)
        {




