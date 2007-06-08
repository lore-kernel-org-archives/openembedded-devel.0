Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <thommycheck@gmx.de>) id 1HwRy4-0008A9-AQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2007 02:04:45 +0200
Received: (qmail invoked by alias); 08 Jun 2007 00:02:09 -0000
Received: from BAA062c.baa.pppool.de (EHLO [192.168.178.22]) [77.128.6.44]
	by mail.gmx.net (mp056) with SMTP; 08 Jun 2007 02:02:09 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX1/mLApwFIvmLOq3d8VdFxnRqpr44pZclmYn7ybl1c
	C2Ie611nRYIPDS
Message-ID: <46689C95.6010209@gmx.de>
Date: Fri, 08 Jun 2007 02:02:29 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Icedove 1.5.0.10 (X11/20070328)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Y-GMX-Trusted: 0
Subject: arm kexec commandline support
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
X-List-Received-Date: Fri, 08 Jun 2007 00:04:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I have written a quick hack to support custom commandlines for arm with 
kexec. You need:

http://www2.informatik.hu-berlin.de/~tkunze/zaurus/patches/kexec_commandline-3.patch

and:

http://www2.informatik.hu-berlin.de/~tkunze/zaurus/patches/atag_support.patch

(from lak)


How to use:
Use kexec as usual. To change the commandline do:
echo "your commandline" > /sys/kernel/kexec_cmdline

This sets up a ataglist in memory which is copied to 0xc0000100 when 
machine is rebooted.
This address is given the new kernel as ataglist in r2.

This works on collie, but should work on any arm machine. I didn't find 
out why I can't give an arbitrary address to the new kernel in r2 but it 
doesn't work (machine hangs.)

Comments are welcome.

Thomas


