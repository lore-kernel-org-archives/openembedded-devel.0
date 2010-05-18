Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <top.grzechu@gmail.com>) id 1OEGtY-0000md-3n
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 09:07:16 +0200
Received: by fxm8 with SMTP id 8so448950fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 00:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=n6gACkJOLhYovKrIlRn43bwBEUJCPtC70ByVyjjKKv8=;
	b=trUsH8dvHsD8HRmpjFGqZmgyQZcQkQNYy0HDWRUSxmR/OkCjVDjAqrw9S2o7Ji115c
	bQSECfswbVW+9br29wjutyWmJ+fRLx/pYKSkxtwf83DuSuGxtUdHFcIR/u1mgjFuRRMs
	9BCkMOMJmc+04/HAP9y1ABDyZSXkfF5Y+6C1g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=huFlnaryanYfsyanGSD77ad2bUCQc7Y2w5dEKi6EtMsCDV+VQHE5yJbEK4dNL9bNoe
	F1X4Z5UAKafofkOXxIzkvUlqn1Z0JKEVrJXdSq/6/YBURHd/MVWNkKPHBCwQXujKiLRf
	qCh26K168UNef1y1iS8cYkSzS5qC9ax+v0HJY=
MIME-Version: 1.0
Received: by 10.204.155.68 with SMTP id r4mr78378bkw.208.1274166195686; Tue, 
	18 May 2010 00:03:15 -0700 (PDT)
Received: by 10.204.76.131 with HTTP; Tue, 18 May 2010 00:03:15 -0700 (PDT)
Date: Tue, 18 May 2010 09:03:15 +0200
Message-ID: <AANLkTinL4kGrM6P5Di1N4KI-95sFuEwDn-RM_SZ32cjS@mail.gmail.com>
From: Grzegorz Toporek <top.grzechu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: top.grzechu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problem at the very beginning
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
X-List-Received-Date: Tue, 18 May 2010 07:07:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I'm new to the mailing list so I would like to say hello to everyone. I'm
new to OE/bitbake as well so please be patient...

I was trying to build busybox package but unfortunately I got this error. Is
it a type conversion problem?  I got this with "Simple Helloworld" either...

What should be mentioned, there was no a problem to build this for
angstrom-2008.1 distribution (machine om-gta01). Now I have changed it to
colibri, which is my boar, and the problem occurred.

I have attached all my .conf files to this e-mail.

Please help me with this problem. Looking forward to your reply.

ERROR:

NOTE: Handling BitBake files: \ (7927/8366) [94 %]NOTE: <type
'exceptions.TypeError'>:unsupported operand type(s) for +: 'NoneType' and
'str' while evaluating:
  task-x11-illume   task-fonts-truetype-core   e-wm-menu-shr   shr-wizard
shr-theme-gry   xcursor-transparent-theme   xinput-calibrator
libx11-locale   ${@get_rdepends(bb, d)}   e-wm-config-illume2-shr
ERROR: unsupported operand type(s) for +: 'NoneType' and 'str' while parsing
/home/grzesiek/tele/openembedded/recipes/tasks/task-shr-minimal.bb
NOTE: Handling BitBake files: / (8366/8366) [100 %]
NOTE: Parsing finished. 7584 cached, 453 parsed, 328 skipped, 0 masked.
ERROR: Parsing errors found, exiting...

MY FILES:

${OEBASE}/openembedded/conf/distro/colibri.conf

DISTRO                = "colibri"
DISTRO_NAME            = "Colibri"
DISTRO_VERSION            = "0.2"
DISTRO_REVISION            = "1"
DISTRO_FEATURES            = "nfs smbfs ppp alsa bluetooth ext2 irda pcmcia
usbgadget usbhost screen"
DISTRO_TYPE            = "release"

IMAGE_NAME            =
"${DISTRO_NAME}-${IMAGE_BASENAME}-${DISTRO_VERSION}-${MACHINE}"
IMAGE_LINGUAS            = ""
DEPLOY_DIR_IMAGE        = "${DEPLOY_DIR}/images/${MACHINE}"

TARGET_OS            = "linux-gnueabi"
TARGET_VENDOR            = "-colibri"
INHERIT                += "package_ipk package_tar debian sanity insane"

PREFERRED_PROVIDER_qemu-native    = "qemu-native"
ENABLE_BINARY_LOCALE_GENERATION    = "0"

FEED_ARCH            = "${TARGET_ARCH}"

KERNEL                = "kernel26"
MACHINE_KERNEL_VERSION        = "2.6"
PCMCIA_MANAGER            = "pcmciautils"

PREFERRED_PROVIDER_virtual/libiconv    = "glibc"
PREFERRED_PROVIDER_virtual/libintl    = "glibc"
PREFERRED_PROVIDER_virtual/libc        = "glibc"

USE_NLS                    = "no"
USE_NLS_glib-2.0            = "yes"

FULL_OPTIMIZATION            = "-pipe -fexpensive-optimizations
-fomit-frame-pointer -frename-registers -Os"
BUILD_OPTIMIZATION            = "-pipe -Os"
CXXFLAGS                += "-fvisibility-inlines-hidden"

PREFERRED_VERSION_gcc            = "4.2.2"
PREFERRED_VERSION_gcc-cross        = "4.2.2"
PREFERRED_VERSION_gcc-cross-sdk        = "4.2.2"
PREFERRED_VERSION_gcc-cross-initial    = "4.2.2"

PREFERRED_VERSION_binutils        = "2.18"
PREFERRED_VERSION_binutils-cross    = "2.18"
PREFERRED_VERSION_binutils-cross-sdk    = "2.18"

PREFERRED_VERSION_linux-libc-headers    = "2.6.22"

PREFERRED_VERSION_glibc            = "2.6.1"
PREFERRED_VERSION_glibc-initial        = "2.6.1"
PREFERRED_VERSION_glibc-intermediate    = "2.6.1"

PREFERRED_VERSION_busybox        = "1.7.4"

PREFERRED_PROVIDER_virtual/arm-colibri-linux-gnueabi-binutils            =
"binutils-cross"

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial                =
"gcc-cross-initial"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc                    =
"gcc-cross"
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++                    =
"gcc-cross"

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc                =
"glibc-intermediate"
PREFERRED_PROVIDER_virtual/arm-colibri-linux-gnueabi-libc-for-gcc        =
"glibc-intermediate"
PREFERRED_PROVIDER_virtual/arm-colibri-linux-libc-for-gcc            =
"glibc-intermediate"

PREFERRED_PROVIDER_virtual/db                            = "db"
PREFERRED_PROVIDER_virtual/db-native                        = "db-native"

PREFERRED_PROVIDER_gconf                            = "gconf"
PREFERRED_PROVIDER_libgsmd                            = "libgsmd"
PREFERRED_PROVIDER_linux-libc-headers                        =
"linux-libc-headers"
PREFERRED_PROVIDER_task-bootstrap                        = "task-bootstrap"

SRCREV_pn-gsm0710muxd                                = "76"

require conf/distro/include/sane-srcdates.inc
require conf/distro/include/sane-srcrevs.inc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%${OEBASE}/openembedded/conf/machine/colibri.conf

TARGET_ARCH        = "arm"
TARGET_FPU        = "soft"
PACKAGE_EXTRA_ARCHS    = "armv4t armv5te"

require conf/machine/include/tune-iwmmxt.inc

GUI_MACHINE_CLASS    = "bigscreen"
MACHINE_FEATURES    = "kernel26 apm alsa ext2 uboot irda usbgadget usbhost
keyboard touchscreen screen bluetooth pcmcia"

MACHINE_TASK_PROVIDER    = "task-boot dropbear"

PREFERRED_PROVIDER_virtual/kernel    = "linux-colibri"

