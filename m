Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 21C89719DD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 05:56:27 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id 68so3698452pgj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 22:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6AERLOv4ZW1TZL/VuC5ekiDKmot4CqOu5WNwl3MeN+U=;
	b=UyYSV+zKvhmcvQUXJO/eDrEtLwL/zpxxnqVuCYvUSGMLOpI/+v3FFMAlS9Q6tZrFBz
	uKs+MQ/07aS8w2Gom3yIeFGaz9PvFBBt2voX82NkMW+jqskDWBlsc+b+/BvY5iUGpSkn
	SlzARUz5jBOsHz6rtl+B0HjW5ouTQMLWN1YwJwR9rWbv+JXzIU4F65AFhjOSzoT3bC6j
	mXyxWDYk79zkqwG8J92VTfTKdqHjXhTZeqOzY7yk7hYcROIoPjSfUlvP31+b8aNqtBpG
	wMlzUORl9k73EShop6rlvaNgeFS6vAhLUKepXqF0a/6+PN+M6smYSTqSMa8h2dcgH/3S
	803w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6AERLOv4ZW1TZL/VuC5ekiDKmot4CqOu5WNwl3MeN+U=;
	b=tGfdaaWVr7UgH/LzdXXWkaVO5Bi1na5CyMiPMOL84DLpY/vcG9jrRBWAPNSS17bUIo
	uDo1jbvygDvr18LmLeQhRrtHpKfmeeTjOuqnL73sEB+9QwDWTrMWK3Pr0nOxbTnwHpdh
	uOMBVhy08gUwUTnvlZTB1dD8grgq2r3lhXoFRWWPiFis/MnkiTSfxen9LxlModKun5r0
	gI1ZYczDu7s/gpqOp14lqlb8rulAfjjLQIFOsQFeKa1ZeiXE7Wk8tYirckUMF7OBOJuG
	9NXxi7hbQx3DmRL/ArvVnVRz/n5c2QmMdtc1kKhvjEFNfgCOCqCEZlGecVbGo9yZEzP/
	62eg==
X-Gm-Message-State: AN3rC/7LQxMZXoGvr2swRNl7bbaon3aox1MyWLSgc3T5EFPpW573CzMv
	N/dqnI2IdLzO0g==
X-Received: by 10.98.10.147 with SMTP id 19mr31307897pfk.193.1493186188839;
	Tue, 25 Apr 2017 22:56:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e22sm39796113pgn.11.2017.04.25.22.56.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Apr 2017 22:56:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Apr 2017 22:56:07 -0700
Message-Id: <20170426055607.23262-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-multimedia][PATCH] kodi: Make it build again and upgrade to 17.1
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
X-List-Received-Date: Wed, 26 Apr 2017 05:56:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kodi/jsonschemabuilder-native.bb                 |  6 +++---
 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb  | 20 ++++++++++++++------
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb b/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
index 094ccff98..fdb769943 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/jsonschemabuilder-native.bb
@@ -3,10 +3,10 @@ SUMMARY = "Kodi Media Center"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://JsonSchemaBuilder.cpp;beginline=2;endline=18;md5=1f67721215c03f66545390f6e45b99c7"
 
-SRCREV = "b587e98911fcedc4b800cd923a882c7aeeaa2146"
+SRCREV = "661dd08d221f5b2bf509a696a6aca5ee7d45bb27"
 
-PV = "16.0+gitr${SRCPV}"
-SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Jarvis"
+PV = "17.1+gitr${SRCPV}"
+SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Krypton"
 
 inherit autotools-brokensep gettext native
 
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index d6e19617d..b34bba56e 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -12,6 +12,7 @@ DEPENDS = " \
             jsonschemabuilder-native \
             nasm-native \
             swig-native \
+            unzip-native \
             yasm-native \
             zip-native \
             avahi \
@@ -61,9 +62,11 @@ DEPENDS = " \
 
 PROVIDES = "xbmc"
 
-SRCREV = "a10c5048f2487bd9b2dc1f35d2fee48a25945a70"
-PV = "17.0+gitr${SRCPV}"
+SRCREV = "661dd08d221f5b2bf509a696a6aca5ee7d45bb27"
+BASEPV = "17.1"
+PV = "${BASEPV}+gitr${SRCPV}"
 SRC_URI = "git://github.com/xbmc/xbmc.git;branch=Krypton \
+           https://repo.voidlinux.eu/distfiles/${BPN}-${BASEPV}-generated-addons.tar.xz;name=addons;unpack=0 \
            file://0003-configure-don-t-try-to-run-stuff-to-find-tinyxml.patch \
            file://0004-handle-SIGTERM.patch \
            file://0005-add-support-to-read-frequency-output-if-using-intel-.patch \
@@ -80,6 +83,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-Fix-file_Emu-on-musl.patch \
            file://0002-Remove-FILEWRAP.patch \
 "
+SRC_URI[addons.md5sum] = "719614fa764011a18665d08af5c8c92f"
+SRC_URI[addons.sha256sum] = "350da57408c27473eaf40e7f544bc94841bf101dc4346085260c5c4af0adac97"
 
 inherit autotools-brokensep gettext pythonnative
 
@@ -116,6 +121,7 @@ EXTRA_OECONF = " \
     --disable-optical-drive \
     --with-ffmpeg=shared \
     --enable-texturepacker=no \
+    ac_cv_path_JAVA_EXE=/bin/true \
 "
 
 FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O3 -ffast-math"
@@ -137,13 +143,18 @@ def enable_glew(bb, d):
     return ""
 
 do_configure() {
+    tar xf ${WORKDIR}/${BPN}-${BASEPV}-generated-addons.tar.xz -C ${S}/
+
     ( for i in $(find ${S} -name "configure.*" ) ; do
        cd $(dirname $i) && gnu-configize --force || true
     done )
+    ( for f in ${S}/xbmc/interfaces/python/generated/*.cpp; do
+       touch ${f/.cpp/.xml}
+    done )
     make -C tools/depends/target/crossguid PREFIX=${STAGING_DIR_HOST}${prefix}
 
     BOOTSTRAP_STANDALONE=1 make -f bootstrap.mk JSON_BUILDER="${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
-    BOOTSTRAP_STANDALONE=1 make -f codegenerator.mk JSON_BUILDER="${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
+    BOOTSTRAP_STANDALONE=1 make JAVA=/bin/true -f codegenerator.mk JSON_BUILDER="${STAGING_BINDIR_NATIVE}/JsonSchemaBuilder"
     oe_runconf
 }
 
@@ -191,6 +202,3 @@ RRECOMMENDS_${PN}_append_libc-glibc = " glibc-charmap-ibm850 \
 RPROVIDES_${PN} += "xbmc"
 
 TOOLCHAIN = "gcc"
-
-
-PNBLACKLIST[kodi] ?= "Depends on blacklisted libsdl-mixer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.12.2


