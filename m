Received: from [65.170.132.200] (helo=EXCHANGEVS1.comtechtel.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <vladislav.grinchenko@comtechmobile.com>)
	id 1H4j7y-000770-6d for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jan 2007 20:28:50 +0100
Received: from 10.5.0.222 ([10.5.0.222]) by EXCHANGEVS1.comtechtel.com
	([10.10.0.15]) via Exchange Front-End Server
	mail.comtechtel.com ([10.10.0.168]) with Microsoft Exchange
	Server HTTP-DAV ; Wed, 10 Jan 2007 19:27:01 +0000
Received: from zorro.comtechtel.com by mail.comtechtel.com;
	10 Jan 2007 14:27:25 -0500
From: Vladislav Grinchenko <vladislav.grinchenko@comtechmobile.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1104787648.20070109234416@vanille-media.de>
References: <1168361761.23671.36.camel@zorro>
	<1562609309.20070109175743@vanille-media.de>
	<1168376718.23671.54.camel@zorro>
	<1104787648.20070109234416@vanille-media.de>
Date: Wed, 10 Jan 2007 14:27:25 -0500
Message-Id: <1168457245.11470.36.camel@zorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.3 (2.6.3-1.fc5.5) 
Subject: Re: Q: build/install gpe-image from dev branch
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
X-List-Received-Date: Wed, 10 Jan 2007 19:28:51 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Michael,

thanks for the hint - of course, I overlooked a side note about gcc
2.95.3 toolchain on wiki!

That problem being solved, I still cannot complete 'gpe-image' build for
dev branch for collie target. The build process chokes on building
'hostap-modules-0.4.7-r4' package - somehow the package insists on
kernel version 2.6.18 (or it seems to be that way), but 'collie' as
rightly pointed out only accepts linux 2.4.18.

Here is my local.conf
------------------------------------------------------------------
DL_DIR = "/stuff/sources"
BBFILES="/stuff/org.openembedded.dev/packages/*/*.bb"
BBMASK = ""
PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"
ASSUME_PROVIDED += "virtual/arm-linux-gcc-2.95"
TMPDIR = /stuff/tmp.dev
MACHINE = "collie"
DISTRO="openzaurus-unstable"
IMAGE_FSTYPES = "jffs2 tar"
BBINCLUDELOGS = "yes"
------------------------------------------------------------------

and the last lines of the failed compilation:

------------------------------------------------------------------
NOTE: multiple providers are available (linux-rp, hostap-modules);
NOTE: consider defining a PREFERRED_PROVIDER to match runtime
hostap-modules
NOTE: package module-init-tools-cross-3.2.2: started
  ...
NOTE: package module-init-tools-cross-3.2.2-r2: task do_build: completed
NOTE: package module-init-tools-cross-3.2.2: completed
  ...
NOTE: package linux-rp-2.6.18: started
NOTE: package linux-rp-2.6.18-r7: task do_fetch: started
  ...
NOTE: package linux-rp-2.6.18-r7: task do_package: started
<string>:4: RuntimeWarning: tmpnam is a potential security risk to your
program
NOTE: the following files were installed but not shipped in any package:
NOTE:   /boot/zImage-2.6.18
NOTE: package linux-rp-2.6.18-r7: task do_package: completed
NOTE: package linux-rp-2.6.18-r7: task do_package_write: started
Packaged contents of kernel
into /stuff/tmp.dev/deploy/ipk/kernel_2.6.18-r7_collie.ipk
  ...
NOTE: Unpacking /stuff/sources/hostap-driver-0.4.7.tar.gz
to /stuff/tmp.dev/work/collie-linux/hostap-modules-0.4.7-r4/
NOTE: package hostap-modules-0.4.7-r4: task do_unpack: completed
NOTE: package hostap-modules-0.4.7-r4: task do_patch: started
NOTE: Applying patch 'kernel_updates.patch'
NOTE: package hostap-modules-0.4.7-r4: task do_patch: completed
NOTE: package hostap-modules-0.4.7-r4: task do_configure: started
NOTE: package hostap-modules-0.4.7-r4: task do_configure: completed
NOTE: package hostap-modules-0.4.7-r4: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows
(/stuff/tmp.dev/work/collie-linux/hostap-modules-0.4.7-r4/temp/log.do_compile.18558)
| NOTE: make -e MAKEFLAGS=
KERNEL_PATH=/stuff/tmp.dev/staging/collie-linux/kernel
KERNEL_SRC=/stuff/tmp.dev/staging/collie-linux/kernel
KERNEL_VERSION=2.6.18 CC=ccache arm-linux-gcc  LD=arm-linux-ld
KERNEL_PATH=/stuff/tmp.dev/staging/collie-linux/kernel MAKE=make -e
| *** Can't build for 2.4 with a non-2.4 source!
| make: *** [2.4] Error 1
| FATAL: oe_runmake failed
------------------------------------------------------------------

So, should I exclude 'hostap-modules' somehow with PREFERRED_PROVIDER?
And if so, what would be the syntax?

thanks in advance,
-Vlad

P.S. I promise to document my *journey* in OE world in a HOWTO for
newbies like myself if I ever get gpe-image built successfully.




