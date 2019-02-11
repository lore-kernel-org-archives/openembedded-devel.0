Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id D74A179CCB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 15:30:16 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q17so2043856pfh.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2019 07:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ETJZonBE15Ds/XyeLvQh/4nE9bV8ja/0KwcxhX85k7g=;
	b=A+LIGSDgSgMddRkTds7vyfxcTibldQMbDT+/HB6v5AbPGrWQzj9YXLQV/YqYn8uoh8
	RQkXGpnxdCec9X1yd88+j/F+/OwTyWgIIamkV/qXMhJ191bAcNpwR7ZbesdkH8kehhic
	YsFXsxtdlxL2S4tb28DfO0YS/0c1PkmLSHKOfEIfX1mRVxKwWAJeB/q+TxmJF0Yk58Cr
	bLE/2D8KdN0k1u4DcxDwrnUvsPdXLDkZf0/Aia4yTD/Qi005wi77F8u/dVfVUjl5x2qd
	chE4yuwnQ7Ru3qg+h7npLkQVawS451Nr9mo46s+3WbOn/MzmEYjt++9OvDauRfCec5WZ
	OsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ETJZonBE15Ds/XyeLvQh/4nE9bV8ja/0KwcxhX85k7g=;
	b=d7DoYTTDfkDpga2bNxQbYamgCc5wcBY05n0yH3BtUoG0eplu8DKMwh1HWo0anC4Xru
	3CCz0vBUIfHfyr4MEqoZWfKyx80+n1ZyH+Ii7PF/JfxBFuX3VI8kK5IY/8+ogVhTTy9o
	v8AG+6kx1T27fEOet4a9Wvqm/CI3cvswBIn2hOT2O0MMsrGBwiVAV7bePHZh5NEAxocy
	aX3OdNiSfv9VmHriKcxlJsNqAUF8oG2FgrkBl+IVkG+/l8cKNsqWtKTAAp7KHX0ldCm4
	Uu3IOssV6gcYwODmgxUb4ukWeF6hvS47j/wrMX4kNE2PbUGIpvy5oW9Bp9QNuOMmDvoa
	pNnw==
X-Gm-Message-State: AHQUAuYOS3yAmFVPa0800K4AsmA+shPs1KzopH7pRSKCpFgMHpvwAc3v
	aEUdotX8dcE+dq5AUETMO4NK1x6R
X-Google-Smtp-Source: AHgI3IZtG8Qnx7jhrwUErM8GNhkLAbPO+cRj0V1mAe7venohB9YV4W57TClGccymjsHDExJtDmJdxw==
X-Received: by 2002:a63:ce08:: with SMTP id y8mr28955313pgf.388.1549899017251; 
	Mon, 11 Feb 2019 07:30:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	a187sm9341860pfb.61.2019.02.11.07.30.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Feb 2019 07:30:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2019 07:30:08 -0800
Message-Id: <20190211153009.24991-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] espeak: Generate phondata based on endianness of targer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Feb 2019 15:30:17 -0000
Content-Transfer-Encoding: 8bit

Use qemu usermode to generate it, so we are always in correct
endian-ness

espeak-data is no longer needed now, since sole purpose of it was to
provide the data for bigendian systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../espeak/espeak-data_1.48.04.bb             | 24 ----------
 meta-oe/recipes-support/espeak/espeak.inc     | 15 ------
 .../recipes-support/espeak/espeak_1.48.04.bb  | 47 +++++++++++++++----
 ...ages-cast-string_ordinal-init-values.patch | 34 ++++++++++++++
 .../espeak/files/espeak-1.48-gcc-6-fix.patch  | 12 -----
 5 files changed, 71 insertions(+), 61 deletions(-)
 delete mode 100644 meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb
 delete mode 100644 meta-oe/recipes-support/espeak/espeak.inc
 create mode 100644 meta-oe/recipes-support/espeak/files/0002-tr_languages-cast-string_ordinal-init-values.patch
 delete mode 100644 meta-oe/recipes-support/espeak/files/espeak-1.48-gcc-6-fix.patch

diff --git a/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb
deleted file mode 100644
index a4e5d14d17..0000000000
--- a/meta-oe/recipes-support/espeak/espeak-data_1.48.04.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require espeak.inc
-
-inherit native
-
-PACKAGES = "${PN}"
-FILES_${PN} = "${layout_datadir}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-TARGET_ARCH = "${MACHINE_ARCH}"
-
-do_compile() {
-    # Fixing byte order of phoneme data files
-    cd "${S}/platforms/big_endian"
-    sed -i '/^ *CC *=/d' Makefile
-    sed -i 's/\(.*BYTE_ORDER\)/#undef BYTE_ORDER\n#define BYTE_ORDER BIG_ENDIAN\n\1/' espeak-phoneme-data.c
-    oe_runmake
-    ./espeak-phoneme-data "${S}/espeak-data" "." "${S}/espeak-data/phondata-manifest"
-    cp -f phondata phonindex phontab "${S}/espeak-data"
-}
-
-do_install() {
-    install -d ${D}${layout_datadir}/espeak-data
-    install -m 0644 ${S}/espeak-data/phon* ${D}${layout_datadir}/espeak-data
-}
diff --git a/meta-oe/recipes-support/espeak/espeak.inc b/meta-oe/recipes-support/espeak/espeak.inc
deleted file mode 100644
index f45455c7e1..0000000000
--- a/meta-oe/recipes-support/espeak/espeak.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "eSpeak is a compact open source software speech synthesizer"
-SECTION = "base"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://License.txt;md5=cb7a20edb4c9f5f478de6523dcd7362c"
-
-SRC_URI = "http://downloads.sourceforge.net/espeak/espeak-1.48.04-source.zip \
-           file://0001-Fix-build-of-shared-library-on-architectures-needing.patch \
-           file://espeak-1.48-gcc-6-fix.patch \
-"
-SRC_URI[md5sum] = "cadd7482eaafe9239546bdc09fa244c3"
-SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659"
-
-S = "${WORKDIR}/espeak-${PV}-source"
-
-DEPENDS = "portaudio-v19"
diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
index 57e30f0710..78f8f85c96 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -1,8 +1,20 @@
-require espeak.inc
-inherit siteinfo
+DESCRIPTION = "eSpeak is a compact open source software speech synthesizer"
+SECTION = "base"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://License.txt;md5=cb7a20edb4c9f5f478de6523dcd7362c"
+
+SRC_URI = "http://downloads.sourceforge.net/espeak/espeak-1.48.04-source.zip \
+           file://0001-Fix-build-of-shared-library-on-architectures-needing.patch \
+           file://0002-tr_languages-cast-string_ordinal-init-values.patch \
+"
+SRC_URI[md5sum] = "cadd7482eaafe9239546bdc09fa244c3"
+SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b207f0659"
+
+S = "${WORKDIR}/espeak-${PV}-source"
+
+DEPENDS = "portaudio-v19 qemu-helper-native"
+inherit siteinfo qemu
 
-EXTRA_PHONEMES = '${@bb.utils.contains("SITEINFO_ENDIANNESS", "be",  "espeak-data (= ${PV})", "", d)}'
-RDEPENDS_${PN} = "portaudio-v19 ${EXTRA_PHONEMES}"
 
 CXXFLAGS += "-DUSE_PORTAUDIO"
 TARGET_CC_ARCH += "${LDFLAGS}"
@@ -11,12 +23,30 @@ FILES_${PN} += "${datadir}/espeak-data"
 
 do_configure() {
     #  "speak" binary, a TTS engine, uses portaudio in either APIs V18 or V19, use V19
-    cp "${S}/src/portaudio19.h" "${S}/src/portaudio.h"
+    install -m 0644 "${S}/src/portaudio19.h" "${S}/src/portaudio.h"
 }
 
 do_compile() {
     cd src
     oe_runmake
+
+    cd "${S}/platforms/big_endian"
+    qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${S}/platforms/big_endian', '${STAGING_DIR_TARGET}${base_libdir}'])}"
+    cat >qemuwrapper <<EOF
+#!/bin/sh
+$qemu_binary "\$@"
+EOF
+    chmod +x qemuwrapper
+    sed -i '/^ *CC *=/d' Makefile
+    # Fixing byte order of phoneme data files
+    if [ "${SITEINFO_ENDIANNESS}" = "be" ]; then
+        sed -i 's/\(.*BYTE_ORDER\)/#undef BYTE_ORDER\n#define BYTE_ORDER BIG_ENDIAN\n\1/' espeak-phoneme-data.c
+    else
+        sed -i 's/\(.*BYTE_ORDER\)/#undef BYTE_ORDER\n#define BYTE_ORDER LITTLE_ENDIAN\n\1/' espeak-phoneme-data.c
+    fi
+    oe_runmake
+    ./qemuwrapper ./espeak-phoneme-data "${S}/espeak-data" "." "${S}/espeak-data/phondata-manifest"
+    cp -f phondata phonindex phontab "${S}/espeak-data"
 }
 
 do_install() {
@@ -31,10 +61,7 @@ do_install() {
     ln -sf espeak/espeak.h ${D}${includedir}/
     oe_libinstall -so -C src libespeak ${D}${libdir}
 
-    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
-        # the big-endian phon* files are provided by the package espeak-data
-        rm -f ${S}/espeak-data/phon*
-    fi
-
     cp -R --no-dereference --preserve=mode,links ${S}/espeak-data/* ${D}${datadir}/espeak-data
 }
+
+RDEPENDS_${PN} = "portaudio-v19"
diff --git a/meta-oe/recipes-support/espeak/files/0002-tr_languages-cast-string_ordinal-init-values.patch b/meta-oe/recipes-support/espeak/files/0002-tr_languages-cast-string_ordinal-init-values.patch
new file mode 100644
index 0000000000..cef360eaef
--- /dev/null
+++ b/meta-oe/recipes-support/espeak/files/0002-tr_languages-cast-string_ordinal-init-values.patch
@@ -0,0 +1,34 @@
+From 451330d09a6a3500b40bc4f5896ba790ab46cd6c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 15 Jan 2017 19:37:31 +0100
+Subject: [PATCH 2/2] tr_languages: cast string_ordinal init values
+
+On some architecture, "char" is signed (x86_64, nios2...) so the
+compiler try to convert int 0xc2 and 0xba to a signed char.
+This is an error since gcc6 (Wnarrowing).
+
+Fixes:
+http://autobuild.buildroot.net/results/bae/baef9888b1979d18171668a675985e3f3b45fda6
+
+Upstream-Status: Pending [imported from BR]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/tr_languages.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tr_languages.cpp b/src/tr_languages.cpp
+index 5c80286..dbc6e36 100644
+--- a/src/tr_languages.cpp
++++ b/src/tr_languages.cpp
+@@ -200,7 +200,7 @@ static const unsigned short chars_ignore_zwnj_hyphen[] = {
+ 	0x200d,  1, // zero width joiner
+ 	0, 0 };
+ 
+-const char string_ordinal[] = {0xc2,0xba,0};  // masculine ordinal character, UTF-8
++const char string_ordinal[] = {(char)0xc2,(char)0xba,0};  // masculine ordinal character, UTF-8
+ 
+ 
+ static Translator* NewTranslator(void)
+-- 
+2.9.3
+
diff --git a/meta-oe/recipes-support/espeak/files/espeak-1.48-gcc-6-fix.patch b/meta-oe/recipes-support/espeak/files/espeak-1.48-gcc-6-fix.patch
deleted file mode 100644
index 6e59c7892f..0000000000
--- a/meta-oe/recipes-support/espeak/files/espeak-1.48-gcc-6-fix.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff --git a/src/tr_languages.cpp b/src/tr_languages.cpp
---- a/src/tr_languages.cpp
-+++ b/src/tr_languages.cpp
-@@ -198,7 +198,7 @@ static const unsigned short chars_ignore_zwnj_hyphen[] = {
- 	0x200d,  1, // zero width joiner
- 	0, 0 };
- 
--const char string_ordinal[] = {0xc2,0xba,0};  // masculine ordinal character, UTF-8
-+const char string_ordinal[] = {'\xc2','\xba',0};  // masculine ordinal character, UTF-8
- 
- 
- static Translator* NewTranslator(void)
-- 
2.20.1


