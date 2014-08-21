Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id A28AB601A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 13:31:56 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so8453881wiv.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 06:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ovuLqZbYDYRZu3QtijRqbI5n0eZy6Labw6UsvPc8v68=;
	b=LdQb7Pr5BnE3xAZ+4KFPZbKEYn9zWyTUfxXPQ/ONOBp+yj4JEODn85x4YO9uYhGuzm
	II/k95+DX0zKOYs9gjUP/t3nHyYb1OYMAkaxDGeOFnmGa18gnJev/3B3cqHhxs1jkh5n
	G/7MjXngXoQ2Hc2+5WrSh3oxA0qgBEkDt6bC/9AFUOsET/e83KxV8ZwQVSbXUPPjtWes
	Wt9Wu/B2lBbhrDrKLh62kso5bMULz0fVzOe6g4iVER9suaIJARrv3FhdPiVUbVW1NO7t
	5IaAcLK+RvuazvbIi59WK2bpo5vbQgXIQ2XS2NEXX0HUkjSNL0M6aKPRq7YSIaWALwvk
	QAcw==
X-Received: by 10.180.93.8 with SMTP id cq8mr4498555wib.17.1408627917533;
	Thu, 21 Aug 2014 06:31:57 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	je3sm20101688wic.11.2014.08.21.06.31.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Aug 2014 06:31:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Aug 2014 15:31:56 +0200
Message-Id: <1408627916-20280-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-efl][PATCH] efl: upgrade to 1.11.0
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
X-List-Received-Date: Thu, 21 Aug 2014 13:32:05 -0000

* announcement:
  https://phab.enlightenment.org/phame/post/view/74/
  https://phab.enlightenment.org/phame/post/view/77/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/efl.inc                            | 13 +++++++++++--
 meta-efl/recipes-efl/efl/{efl_1.10.2.bb => efl_1.11.0.bb}   |  4 ++--
 .../efl/{elementary_1.10.2.bb => elementary_1.11.0.bb}      |  4 ++--
 meta-efl/recipes-efl/efl/emotion-generic-players_1.10.0.bb  |  8 --------
 meta-efl/recipes-efl/efl/emotion-generic-players_1.11.0.bb  |  8 ++++++++
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.0.bb     |  8 --------
 meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.0.bb     |  8 ++++++++
 7 files changed, 31 insertions(+), 22 deletions(-)
 rename meta-efl/recipes-efl/efl/{efl_1.10.2.bb => efl_1.11.0.bb} (92%)
 rename meta-efl/recipes-efl/efl/{elementary_1.10.2.bb => elementary_1.11.0.bb} (79%)
 delete mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.10.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.11.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.10.0.bb
 create mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.0.bb

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
diff --git a/meta-efl/recipes-efl/efl/efl_1.10.2.bb b/meta-efl/recipes-efl/efl/efl_1.11.0.bb
similarity index 92%
rename from meta-efl/recipes-efl/efl/efl_1.10.2.bb
rename to meta-efl/recipes-efl/efl/efl_1.11.0.bb
index 76a9ba7..45ee389 100644
--- a/meta-efl/recipes-efl/efl/efl_1.10.2.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.11.0.bb
@@ -4,8 +4,8 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "c74888bfdc774e69eac26978557a89bb"
-SRC_URI[sha256sum] = "44acf012f0dd3b0c01bb2c5e53231076d7ed463166f581d22ef441b127e8c85f"
+SRC_URI[md5sum] = "83a1e983d7e9d3efcbba9a7a29cad54d"
+SRC_URI[sha256sum] = "0a8ab66e012820cad7dd78de371f8dcbbd79cb316302e1e6c354181de35d727f"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.10.2.bb b/meta-efl/recipes-efl/efl/elementary_1.11.0.bb
similarity index 79%
rename from meta-efl/recipes-efl/efl/elementary_1.10.2.bb
rename to meta-efl/recipes-efl/efl/elementary_1.11.0.bb
index eb182bb..d188c23 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.10.2.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.11.0.bb
@@ -8,8 +8,8 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "2ccc130e137319accd81ccf3d321905b"
-SRC_URI[sha256sum] = "48fcfbd66b90df8b21203307d66364fb1d773b3e979476116b2ad1a5eab67378"
+SRC_URI[md5sum] = "cfcf3b0620cbb6e86021286631274d9a"
+SRC_URI[sha256sum] = "47ee79f7fc4e355557e6809e2001468bc8e40939562e3a96f689969ab67c17b4"
 
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
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.11.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.11.0.bb
new file mode 100644
index 0000000..4cb74f5
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.11.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "432febd580ed1a4d7d7b42984ee4c693"
+SRC_URI[sha256sum] = "5d2e7923a6e4e909df2f9fc3bf7508086ea04b0146e62015dbc93a8bf58bca74"
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
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.0.bb
new file mode 100644
index 0000000..0b98b11
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.11.0.bb
@@ -0,0 +1,8 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "b99fd8dc1e79efacd4e212374a4f0668"
+SRC_URI[sha256sum] = "4cf55717d75214d22e6c9955bd5b2e74656cc454f011496bac74ae3df6c924e2"
-- 
2.0.4


