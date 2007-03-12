Received: from [195.234.128.72] (helo=scotty.chl-informatik.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <christopher.lang@plus.cablesurf.de>)
	id 1HQjWU-0007S7-Ob
	for openembedded-devel@openembedded.org; Mon, 12 Mar 2007 13:21:06 +0100
Received: from linux64.chl-informatik.de (linux64.chl-informatik.de
	[192.168.10.17])
	by scotty.chl-informatik.de (8.12.3/8.12.3/SuSE Linux 0.6) with ESMTP
	id l2CBWifl019353 for <openembedded-devel@openembedded.org>;
	Mon, 12 Mar 2007 12:32:44 +0100
From: Christopher Lang <christopher.lang@plus.cablesurf.de>
To: openembedded-devel@openembedded.org
Date: Mon, 12 Mar 2007 13:21:32 +0100
User-Agent: KMail/1.9.1
MIME-Version: 1.0
Message-Id: <200703121321.32299.christopher.lang@plus.cablesurf.de>
Subject: ...gcc/specs: Invalid argument when building meta-sdk or meta-toolchain for i586 on x86_64
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
X-List-Received-Date: Mon, 12 Mar 2007 12:21:07 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


While testing bb 1.8 I ran into the following issue. I do not think it is bb 
1.8 related, it might rather be an issue with building on x86_64:
 
When building meta-sdk or meta-toolchain to following error occurs:

xgcc: /home/chris/tmp/oe-test-linux-bb18/build/tmp/work/x86_64-oe-linux/gcc-cross-sdk-4.1.1-r10/gcc-4.1.1/build.x86_64-linux.i586-oe-linux/./gcc/specs: 
Invalid argument
| make[2]: *** [crtbegin.o] Error 1

I think that sdk and toolchain are quite important for OE. So any help is 
appreciated!

(entered as bug  http://bugs.openembedded.org/show_bug.cgi?id=1977)

many thanks
Chris



Configuration:

chris@linux64:~/tmp/oe-test-linux-bb18/build> bitbake meta-toolchain
NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to 
increase performance.
NOTE: Handling BitBake files: - (4266/4266) [100 %]
NOTE: Parsing finished. 4083 cached, 0 parsed, 183 skipped, 0 masked.
NOTE: build 200703121121: started

OE Build Configuration:
BB_VERSION     = "1.7.999"
OE_REVISION    = "2e1d1df32e14f9dd87ba08d9fa77c9b537683276"
TARGET_ARCH    = "i586"
TARGET_OS      = "linux"
MACHINE        = "i586-OE-MACHINE"
DISTRO         = "generic"
DISTRO_VERSION = ".dev-snapshot-20070312"
TARGET_FPU     = ""


Machine file:

TARGET_ARCH = "i586"
TARGET_VENDOR = "-oe"

# stuff that I use for embedded development
BOOTSTRAP_EXTRA_DEPENDS = "udev mc lrzsz gdb ncurses pciutils"
BOOTSTRAP_EXTRA_RDEPENDS = "udev mc lrzsz gdbserver ncurses libstdc++ pciutils 
pciutils-ids"

udevdir = "/dev"

# we need to clear HOTPLUG because task-bootstrap puts in linux-hotplug 
otherwise
HOTPLUG = ""

IPKG_ARCHS = "all ${TARGET_ARCH} ${MACHINE}"

# substitute your own kernel here
PREFERRED_PROVIDER_virtual/kernel = "linux-x86"

#nptl, I prefer nptl over linuxthreads
GLIBC_ADDONS = "nptl"
GLIBC_EXTRA_OECONF = "--with-tls"



