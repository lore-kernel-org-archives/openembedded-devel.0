Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1792.1617124482328181559
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 10:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C8BAFD6E
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 10:14:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57BC33F719
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 10:14:41 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] flashrom: recipe cleanup
Date: Tue, 30 Mar 2021 18:14:37 +0100
Message-Id: <20210330171437.2556065-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use Meson to build instead of the bare Makefiles, as the Meson build also
generates pkgconfig files which are needed fwupd.

Add PACKAGECONFIG options for the platform dependencies (libpci, libusb,
libftdi).  Add a patch to the meson.build to ensure that these options
work as intended.

Fix LICENSE, as this is GPLv2-or-later.

Replace 0001-typecast-enum-conversions-explicitly.patch with upstreamed
patch.

Drop 0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch as
this is only needed for the Makefile build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...or-last-line-only-from-preprocessed-.patch | 57 ----------------
 ...typecast-enum-conversions-explicitly.patch | 66 ++++++------------
 .../flashrom/flashrom/meson-fixes.patch       | 68 +++++++++++++++++++
 meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb  | 15 ++--
 4 files changed, 96 insertions(+), 110 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-C=
heck-for-last-line-only-from-preprocessed-.patch
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.pat=
ch

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-fo=
r-last-line-only-from-preprocessed-.patch b/meta-oe/recipes-bsp/flashrom/=
flashrom/0001-Makefile-Check-for-last-line-only-from-preprocessed-.patch
deleted file mode 100644
index 7a8be83746..0000000000
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-Makefile-Check-for-last-=
line-only-from-preprocessed-.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 3c078497e506bd6acb406da5cde7ce20e8896353 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 23 Jul 2020 14:13:59 -0700
-Subject: [PATCH] Makefile: Check for last line only from preprocessed ou=
tput
-
-This started to fail with glibc 2.32 since glibc added additional
-attributes to functions in signal.h therefore existing regexp started to
-fail as it is not able to handle these functions e.g.
-
-extern int siginterrupt (int __sig, int __interrupt) __attribute__ ((__n=
othrow__ , __leaf__))
-  __attribute__ ((__deprecated__ ("Use sigaction with SA_RESTART instead=
")));
-
-grep -v '^\#' | grep '"' | cut -f 2 -d'"'
-bit outside of fd_set selected
-Use sigaction with SA_RESTART instead
-arm
-
-So changing it to
-tail -1 | grep '"' | cut -f 2 -d'"'
-arm
-
-Produces the expected result, this was hidden until now
-
-Upstream-Status: Submitted [https://review.coreboot.org/c/flashrom/+/437=
70]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Change-Id: I123a046e142d54632f12d54e2aa09b0928c02b91
----
- Makefile | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 803529f..3795681 100644
---- a/Makefile
-+++ b/Makefile
-@@ -106,7 +106,7 @@ endif
- # IMPORTANT: The following line must be placed before TARGET_OS is ever=
 used
- # (of course), but should come after any lines setting CC because the l=
ine
- # below uses CC itself.
--override TARGET_OS :=3D $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E=
 os.h 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
-+override TARGET_OS :=3D $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E=
 os.h 2>/dev/null | tail -1 | grep '"' | cut -f 2 -d'"'))
-=20
- ifeq ($(TARGET_OS), Darwin)
- override CPPFLAGS +=3D -I/opt/local/include -I/usr/local/include
-@@ -460,8 +460,8 @@ endif
- # IMPORTANT: The following line must be placed before ARCH is ever used
- # (of course), but should come after any lines setting CC because the l=
ine
- # below uses CC itself.
--override ARCH :=3D $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E arch=
test.c 2>/dev/null | grep -v '^\#' | grep '"' | cut -f 2 -d'"'))
--override ENDIAN :=3D $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E en=
diantest.c 2>/dev/null | grep -v '^\#'))
-+override ARCH :=3D $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E arch=
test.c 2>/dev/null | tail -1 | grep '"' | cut -f 2 -d'"'))
-+override ENDIAN :=3D $(strip $(call debug_shell,$(CC) $(CPPFLAGS) -E en=
diantest.c 2>/dev/null | tail -1))
-=20
- # Disable the internal programmer on unsupported architectures (everyth=
ing but x86 and mipsel)
- ifneq ($(ARCH)-little, $(filter $(ARCH),x86 mips)-$(ENDIAN))
---=20
-2.27.0
-
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-con=
versions-explicitly.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-ty=
pecast-enum-conversions-explicitly.patch
index 7ac53650f2..f2302dbcc3 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversion=
s-explicitly.patch
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversion=
s-explicitly.patch
@@ -1,69 +1,45 @@
-From 8a236330f2af56bde21e9f69208ea3e59f529f0c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Mar 2020 17:02:30 -0700
-Subject: [PATCH] typecast enum conversions explicitly
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
-clang complains like below
+From 3a0c1966e4c66f91e6e8551e906b6db38002acb4 Mon Sep 17 00:00:00 2001
+From: Angel Pons <th3fanbus@gmail.com>
+Date: Wed, 27 May 2020 12:15:51 +0200
+Subject: [PATCH] libflashrom.c: Use casts on enum conversions
=20
-libflashrom.c:191:43: error: implicit conversion from enumeration type '=
const enum test_state' to different enumeration type 'enum flashrom_test_=
state' [-Werror,-Wenum-conversion]
-                        supported_boards[i].working =3D binfo[i].working=
;
-                                                    ~ ~~~~~~~~~^~~~~~~
-libflashrom.c:229:46: error: implicit conversion from enumeration type '=
const enum test_state' to different enumeration type 'enum flashrom_test_=
state' [-Werror,-Wenum-conversion]
-                        supported_chipsets[i].status =3D chipset[i].stat=
us;
-                                                     ~ ~~~~~~~~~~~^~~~~~
+This allows flashrom to build with GCC 10.
=20
-However these enums are exactly same so they can be typecasted
-
-libflashrom.h
-
-/** @ingroup flashrom-query */
-enum flashrom_test_state {
-        FLASHROM_TESTED_OK  =3D 0,
-        FLASHROM_TESTED_NT  =3D 1,
-        FLASHROM_TESTED_BAD =3D 2,
-        FLASHROM_TESTED_DEP =3D 3,
-        FLASHROM_TESTED_NA  =3D 4,
-};
-
-flash.h
-
-enum test_state {
-          OK =3D 0,
-          NT =3D 1, /* Not tested */
-          BAD,    /* Known to not work */
-          DEP,    /* Support depends on configuration (e.g. Intel flash =
descriptor) */
-          NA,     /* Not applicable (e.g. write support on ROM chips) */
-  };
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Change-Id: I2166cdf3681452631ef8e980face2924e9a6c81a
+Signed-off-by: Angel Pons <th3fanbus@gmail.com>
+Reviewed-on: https://review.coreboot.org/c/flashrom/+/41775
+Tested-by: build bot (Jenkins) <no-reply@coreboot.org>
+Reviewed-by: HAOUAS Elyes <ehaouas@noos.fr>
 ---
- libflashrom.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ libflashrom.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
=20
 diff --git a/libflashrom.c b/libflashrom.c
-index 0dec22e..7956685 100644
+index ab7e364..c20d9c7 100644
 --- a/libflashrom.c
 +++ b/libflashrom.c
-@@ -188,7 +188,7 @@ struct flashrom_board_info *flashrom_supported_board=
s(void)
+@@ -188,7 +188,8 @@ struct flashrom_board_info *flashrom_supported_board=
s(void)
  		for (; i < boards_known_size; ++i) {
  			supported_boards[i].vendor =3D binfo[i].vendor;
  			supported_boards[i].name =3D binfo[i].name;
 -			supported_boards[i].working =3D binfo[i].working;
-+			supported_boards[i].working =3D (enum flashrom_test_state)binfo[i].w=
orking;
++			supported_boards[i].working =3D
++				(enum flashrom_test_state) binfo[i].working;
  		}
  	} else {
  		msg_gerr("Memory allocation error!\n");
-@@ -226,7 +226,7 @@ struct flashrom_chipset_info *flashrom_supported_chi=
psets(void)
+@@ -226,7 +227,8 @@ struct flashrom_chipset_info *flashrom_supported_chi=
psets(void)
  			supported_chipsets[i].chipset =3D chipset[i].device_name;
  			supported_chipsets[i].vendor_id =3D chipset[i].vendor_id;
  			supported_chipsets[i].chipset_id =3D chipset[i].device_id;
 -			supported_chipsets[i].status =3D chipset[i].status;
-+			supported_chipsets[i].status =3D (enum flashrom_test_state)chipset[i=
].status;
++			supported_chipsets[i].status =3D
++				(enum flashrom_test_state) chipset[i].status;
  	  }
  	} else {
  		msg_gerr("Memory allocation error!\n");
 --=20
 2.25.1
-
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch b/me=
ta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
new file mode 100644
index 0000000000..e45236ee07
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/meson-fixes.patch
@@ -0,0 +1,68 @@
+Add a ftdi option alongside USB and PCI to control the external dependen=
cy, and
+ensure that the build is successful in all combinations of options.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/meson.build b/meson.build
+index 375089c..0df9d69 100644
+--- a/meson.build
++++ b/meson.build
+@@ -91,6 +91,8 @@ else
+   config_digilent_spi =3D false
+   config_developerbox_spi =3D false
+   config_pickit2_spi =3D false
++  config_stlinkv3_spi =3D false
++  config_usbblaster_spi =3D false
+ endif
+=20
+ # some programmers require libpci
+@@ -118,6 +120,21 @@ else
+   config_satasii =3D false
+ endif
+=20
++# some programmers require libftdi
++if get_option('ftdi')
++  deps +=3D dependency('libftdi1')
++else
++  config_ft2232_spi =3D false
++  config_usbblaster_spi =3D false
++endif
++
++if not (target_machine.cpu_family() =3D=3D 'x86' or target_machine.cpu_=
family() =3D=3D 'x86_64')
++  config_satamv =3D false
++  config_nic3com =3D false
++  config_rayer_spi =3D false
++  config_nicrealtek =3D false
++endif
++
+ # set defines for configured programmers
+ if config_atahpt
+   srcs +=3D 'atahpt.c'
+@@ -163,7 +180,6 @@ endif
+ if config_ft2232_spi
+   srcs +=3D 'ft2232_spi.c'
+   cargs +=3D '-DCONFIG_FT2232_SPI=3D1'
+-  deps +=3D dependency('libftdi1')
+   cargs +=3D '-DHAVE_FT232H=3D1'
+ endif
+ if config_gfxnvidia
+@@ -216,6 +232,7 @@ endif
+ if config_nicintel
+   srcs +=3D 'nicintel.c'
+   cargs +=3D '-DCONFIG_NICINTEL=3D1'
++  need_raw_access =3D true
+ endif
+ if config_nicintel_eeprom
+   srcs +=3D 'nicintel_eeprom.c'
+diff --git a/meson_options.txt b/meson_options.txt
+index ea87311..b6b842d 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,5 +1,6 @@
+ option('pciutils', type : 'boolean', value : true, description : 'use p=
ciutils')
+ option('usb', type : 'boolean', value : true, description : 'use libusb=
1')
++option('ftdi', type : 'boolean', value : true, description : 'use libft=
di')
+=20
+ option('config_atahpt', type : 'boolean', value : false, description : =
'Highpoint (HPT) ATA/RAID controllers')
+ option('config_atapromise', type : 'boolean', value : false, descriptio=
n : 'Promise ATA controller')
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb b/meta-oe/recip=
es-bsp/flashrom/flashrom_1.2.bb
index 66ae34af94..4e0b2d4a8c 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
@@ -1,21 +1,20 @@
 DESCRIPTION =3D "flashrom is a utility for identifying, reading, writing=
, verifying and erasing flash chips"
-LICENSE =3D "GPLv2"
+LICENSE =3D "GPLv2+"
 HOMEPAGE =3D "http://flashrom.org"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
-DEPENDS =3D "pciutils libusb libusb-compat"
-
 SRC_URI =3D "https://download.flashrom.org/releases/flashrom-v${PV}.tar.=
bz2 \
            file://0001-typecast-enum-conversions-explicitly.patch \
-           file://0001-Makefile-Check-for-last-line-only-from-preprocess=
ed-.patch \
+           file://meson-fixes.patch \
            "
 SRC_URI[md5sum] =3D "7f8e4b87087eb12ecee0fcc5445b4956"
 SRC_URI[sha256sum] =3D "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44=
f8a3cd032d9ea42b"
=20
 S =3D "${WORKDIR}/flashrom-v${PV}"
=20
-inherit pkgconfig
+inherit meson pkgconfig
=20
-do_install() {
-    oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
-}
+PACKAGECONFIG ??=3D "pci usb ftdi"
+PACKAGECONFIG[pci] =3D "-Dpciutils=3Dtrue,-Dpciutils=3Dfalse,pciutils"
+PACKAGECONFIG[usb] =3D "-Dusb=3Dtrue,-Dusb=3Dfalse,libusb"
+PACKAGECONFIG[ftdi] =3D "-Dftdi=3Dtrue,-Dftdi=3Dfalse,libftdi"
--=20
2.25.1

