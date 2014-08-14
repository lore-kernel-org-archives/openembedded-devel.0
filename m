Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id C55C170CE4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:46:37 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id pn19so735874lab.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 01:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YHkY0pZFvjttIhj34/Z2OnRT9CdeLc4E+FwGiq2CJFQ=;
	b=H1tRzE8Bv15ZJ3IUwUMnNTOf1GNrfxUt1h+E0zuk8+Wb5mWGvW5tsD6NrJigjo4L7O
	ZVlE0qFxKzS5ZSHnFmqJ1sr6Apof1qnYcQZ63baQWkroPDPthdkk9JVKe1DZ/74SFyxk
	PRPtc6nOkgNLFO1MmNru0h854XSGkteZ7qqqWaYnsUqRozzsEnVivcQtvQpj5gTIwUZy
	COX+kjUSrZgKFamVDP58LRFWgJZcojstdCsPEZDkFIpNxYeWez9Bqt5V5g7wEPOT9VRh
	+1hqYjXVlSoW03zq1aHlrWyyW3myKnDtjTCrmS7loChu1t5p3Tl8smp5yK1JBjVr9qg4
	Mkbg==
X-Received: by 10.152.164.229 with SMTP id yt5mr3367385lab.19.1408005998147;
	Thu, 14 Aug 2014 01:46:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id p4sm2733863lap.0.2014.08.14.01.46.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Aug 2014 01:46:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Aug 2014 10:47:11 +0200
Message-Id: <1408006032-21762-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-oe][WIP][PATCH 1/2] efl: upgrade to 1.11.0-beta2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Aug 2014 08:46:38 -0000

* announcement:
  https://phab.enlightenment.org/phame/post/view/74/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc                            | 13 +++++++++++--
 .../efl/{efl_1.10.2.bb => efl_1.10.2+1.11.0-beta2.bb}       |  6 ++++--
 ...ementary_1.10.2.bb => elementary_1.10.2+1.11.0-beta2.bb} |  6 ++++--
 meta-efl/recipes-efl/efl/emotion-generic-players_1.10.0.bb  |  8 --------
 .../efl/emotion-generic-players_1.10.2+1.11.0-beta2.bb      | 10 ++++++++++
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.0.bb     |  8 --------
 .../efl/evas-generic-loaders_1.10.2+1.11.0-beta2.bb         | 10 ++++++++++
 7 files changed, 39 insertions(+), 22 deletions(-)
 rename meta-efl/recipes-efl/efl/{efl_1.10.2.bb => efl_1.10.2+1.11.0-beta2.bb} (90%)
 rename meta-efl/recipes-efl/efl/{elementary_1.10.2.bb => elementary_1.10.2+1.11.0-beta2.bb} (76%)
 delete mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.10.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.10.2+1.11.0-beta2.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.2+1.11.0-beta2.bb

diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 648c5b6..6c870c5 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -19,7 +19,7 @@ PROVIDES += "ecore edje eet eeze efreet eina eio embryo emotion ethumb evas eldb
 # your own in terms of ensuring everything works if you do this
 EXTRA_OECONF = " \
     --disable-physics \
-    --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aaa \
+    --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba \
 "
 EXTRA_OECONF_append_class-target = " \
     --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
@@ -60,13 +60,16 @@ PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[luajit] = "--disable-lua-old,--enable-lua-old,luajit"
 PACKAGECONFIG[lua-old] = "--enable-lua-old,--disable-lua-old,lua"
+PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
+# currently we don't provide doxygen-native
+PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,doxygen-native"
 
 # new efl doesn't have option to disable eeze build and we don't want to provide udev-native just to build eeze-native we don't need
 do_configure_prepend_class-native() {
     sed -i 's/EFL_LIB_START_OPTIONAL(\[Eeze\], \[test "${have_linux}" = "yes"\])/EFL_LIB_START_OPTIONAL([Eeze], [test "${no-we-really-dont-want-native-eeze}" = "yes"])/g' ${S}/configure.ac
 }
 
-PACKAGES =+ "edje-utils embryo-utils embryo-tests efreet-trash efreet-mime libeet libefreet ecore-audio ecore-input-evas ecore-input ecore-imf-evas ecore-imf ecore-file ecore-con ecore-ipc ecore-x ecore-evas libemotion eo ecore edje eet eeze efreet eina eio embryo emotion ethumb evas eldbus"
+PACKAGES =+ "edje-utils embryo-utils embryo-tests efreet-trash efreet-mime libeet libefreet ecore-audio ecore-input-evas ecore-input ecore-imf-evas ecore-imf ecore-file ecore-con ecore-ipc ecore-x ecore-evas libemotion eo ecore edje eet eeze efreet eina eio embryo emotion ethumb evas eldbus elua"
 
 # upgrade path from 1.7
 DEBIAN_NOAUTONAME_ecore-audio = "1"
@@ -153,6 +156,7 @@ FILES_ecore-ipc = "\
 "
 FILES_ecore-x = "\
     ${libdir}/libecore_x${SOLIBS} \
+    ${libdir}/ecore_x/bin/v-*/ecore_x_vsync \
 "
 FILES_ecore-evas = "\
     ${libdir}/libecore_evas${SOLIBS} \
@@ -241,9 +245,14 @@ FILES_edje = " \
     ${datadir}/edje \
     ${datadir}/mime \
 "
+FILES_elua = " \
+    ${bindir}/elua \
+    ${datadir}/elua \
+"
 FILES_${PN}-dbg += " \
     ${libdir}/efreet/*/.debug \
     ${libdir}/ecore*/*/*/*/.debug \
+    ${libdir}/ecore*/*/*/.debug \
     ${libdir}/evas*/*/*/*/*/.debug \
     ${libdir}/evas/cserve2/bin/*/.debug \
     ${libdir}/eeze*/*/*/*/*/.debug \
diff --git a/meta-efl/recipes-efl/efl/efl_1.10.2.bb b/meta-efl/recipes-efl/efl/efl_1.10.2+1.11.0-beta2.bb
similarity index 90%
rename from meta-efl/recipes-efl/efl/efl_1.10.2.bb
rename to meta-efl/recipes-efl/efl/efl_1.10.2+1.11.0-beta2.bb
index 76a9ba7..81b1e10 100644
--- a/meta-efl/recipes-efl/efl/efl_1.10.2.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.10.2+1.11.0-beta2.bb
@@ -1,11 +1,13 @@
 require ${BPN}.inc
 
+SRCVER = "1.11.0-beta2"
+
 SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "c74888bfdc774e69eac26978557a89bb"
-SRC_URI[sha256sum] = "44acf012f0dd3b0c01bb2c5e53231076d7ed463166f581d22ef441b127e8c85f"
+SRC_URI[md5sum] = "e995c4128c0469855c8e42bd098464a6"
+SRC_URI[sha256sum] = "2638ed950c84173c7ae25834d626db829984a377149c52ea3807326cbfa1b71a"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.10.2.bb b/meta-efl/recipes-efl/efl/elementary_1.10.2+1.11.0-beta2.bb
similarity index 76%
rename from meta-efl/recipes-efl/efl/elementary_1.10.2.bb
rename to meta-efl/recipes-efl/efl/elementary_1.10.2+1.11.0-beta2.bb
index eb182bb..40e1ebf 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.10.2.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.10.2+1.11.0-beta2.bb
@@ -1,5 +1,7 @@
 require ${BPN}.inc
 
+SRCVER = "1.11.0-beta2"
+
 SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
@@ -8,8 +10,8 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "2ccc130e137319accd81ccf3d321905b"
-SRC_URI[sha256sum] = "48fcfbd66b90df8b21203307d66364fb1d773b3e979476116b2ad1a5eab67378"
+SRC_URI[md5sum] = "e665f480b4cafd95286c0cf88eb0a901"
+SRC_URI[sha256sum] = "c65b3b61e2ac6a72e84394055ec4cbf433302c19990807aea9fc261ddba3e586"
 
 # autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.10.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.10.0.bb
deleted file mode 100644
index 5d5ed4b..0000000
--- a/meta-efl/recipes-efl/efl/emotion-generic-players_1.10.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "f73b1f73b38a323e37bd138b103191a5"
-SRC_URI[sha256sum] = "ccfb1c8c346ba1a84484b82ce1ce871fd2c6660421ca7fa5d911661bd3cc94db"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.10.2+1.11.0-beta2.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.10.2+1.11.0-beta2.bb
new file mode 100644
index 0000000..3d2c72d
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.10.2+1.11.0-beta2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+SRCVER = "1.11.0-beta2"
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "7a4ef3614f54f1886069c518a478d323"
+SRC_URI[sha256sum] = "e8b31d0609618333e9b61bb502243a9c37b6fae15a4b59badc641e2e0a0914c0"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.0.bb
deleted file mode 100644
index 732c296..0000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "ef5ac6a7960528bb12e997f3e304f151"
-SRC_URI[sha256sum] = "f5294c1a86dd4d7d4983ec4217c0d0d1a9cfa3fc2060d4af7eec5fa4ce23a463"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.2+1.11.0-beta2.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.2+1.11.0-beta2.bb
new file mode 100644
index 0000000..3d59565
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.2+1.11.0-beta2.bb
@@ -0,0 +1,10 @@
+require ${BPN}.inc
+
+SRCVER = "1.11.0-beta2"
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "e6b4792538df292e0a9735b15e02371c"
+SRC_URI[sha256sum] = "a77ae25ee30683a75dd4040f6547e2b9cc32cac8a274431750a90aafc8bdb9dc"
-- 
2.0.4


