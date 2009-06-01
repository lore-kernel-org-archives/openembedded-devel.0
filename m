Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MB8xJ-00012d-BC
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 16:57:41 +0200
Received: (qmail 24942 invoked by uid 813007); 1 Jun 2009 14:48:56 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 1 Jun 2009 14:48:55 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon,  1 Jun 2009 16:49:16 +0200
Message-Id: <1243867762-16540-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
Subject: EP93xx - update of GCC support for this sick CPU/FPU
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
X-List-Received-Date: Mon, 01 Jun 2009 14:57:41 -0000

Hi

This patchset is taken from http://martinwguy.co.uk/martin/crunch/

It is enabled by default for ep93xx devices as EDB9301 boots into rootfs
built with this toolchain without problems. Running "openssl speed"
works but end table with results contains broken calculations.

Binary locales do not work as QEMU do not handle ep93xx cpu.

Patches are a bit ugly maybe (in conf/machine/include/*) but I want to
show it finally to people before it rust.

Text from page:

On 10 March there were no known bugs in this stuff (again). On 19 March
libvorbisenc managed to find a bug in GCC whereby it incorrectly
optimizes certain code sequences that use single-precision floats. The
Maverick code generator exhibits similar symptoms for the same code, but
only at optimization levels -O2 and above, so the fastest reliable
optimization options for Maverick at present are -O -ffast-math.

I've been working on GCC-4.3.3 to make it generate working code for the
Cirrus Logic MaverickCrunch FPU, as found in their ARM-based EP9302,
EP9307, EP9312 and EP9315 chips, making floating point-intensive code
about 2.5 times faster.

This follows on from Hasjim Williams' earlier work with gcc-4.1.2 and
4.2.0, a bundle of his more recent ideas and more hacks from me.

If you want to understand the patches themselves, there is an article
about the MaverickCrunch FPU and GCC's problems with it on the Debian
wiki [1] and I have added commentary at the top of the individual patch
files.

1. http://wiki.debian.org/ArmEabiMaverickCrunch





