Received: from [82.182.55.65] (helo=pcjr2.rosbacke.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mikael@rosbacke.org>) id 1KzUZf-0001oF-Pv
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Nov 2008 12:04:51 +0100
Received: from [192.168.0.195] by pcjr2.rosbacke.org with esmtp (Exim 4.63)
	(envelope-from <mikael@rosbacke.org>) id 1KzU4H-00016l-TC
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Nov 2008 11:32:26 +0100
From: Mikael Rosbacke <mikael@rosbacke.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Nov 2008 08:37:27 +0100
Message-Id: <1226302647.2015.24.camel@akaza1>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
X-SA-Exim-Connect-IP: 192.168.0.195
X-SA-Exim-Mail-From: mikael@rosbacke.org
X-SA-Exim-Scanned: No (on pcjr2.rosbacke.org); SAEximRunCond expanded to false
Subject: Building x86 base image.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Nov 2008 11:04:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello!

First time post here so go easy on the flames for obvious questions. ;-)

I'm trying to get familiar with open embedded with a plan of having a
good way of building distributions for small x86 based and arm based
embedded systems. So far, there has been a bumpy road.

I got the beagleboard image. Once I get some HW I'm gonna try it out
properly. But I've had more problems trying to get x86 working.

From git head, I've tried to build the 'task-base' target using
DISTRO='minimal' and MACHINE='i586-generic'. (i686 failed on glibc-2.5,
epia failed on gcc 3.3.4)
I got a compilation error in a Linux kernel script file which could be
solved but then some other packet failed.

Checked out the stable branch and tried to build 'anstrom-2007.1' using
target 'task-base'. It failed on libxml2-native, which could be solved
by upgrading it 2.6.29 -> 2.6.31 but later failed on dbus-native 1.0.1.
Tried 1.0.3 version there but no use.

I'm currently using Ubuntu 8.10 x86_64 as host.

Now, the questions (finally):
Is there some known good distribution/target I could build for x86 using
my current host?

Is there some known good host to use to build the stable anstrom-2007.1
distribution? (or any other target)

When I find these issues, are they mostly well known stuff or should I
try to report them on this mailing list? Is there some guide for
preferred error reporting format?

Tnx in advance for any replies,

--- Mikael Rosbacke
 



