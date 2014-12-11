Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 156D46017E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 12:23:33 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so14395614wiv.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Dec 2014 04:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1yNgZMRXX19fLsUc52+hXCkud8PJ90WE+i5wZl1Ya+o=;
	b=lX1dEgMwF/kGXR5mYxyAomGWbOrUjE8NA1RH3G13vuHAEbUHgonrIEEpa4CN9iebzZ
	9ZY/da7mL3deXz318aUYetPTjKnsU3D6O98nvHtMfen+QUwI5Yv9L//HWsP3Lbtqu0x/
	sUN6dGT8ayagy2fEyUpoUGuwgm634uk8YALZeWhn4A8emeFM5S1i0c18Gw4nf4dpE6qZ
	UydAfo/BzbCgjYzw8QjHG1MkAQYCTWj0yOjdXkf1qbwJuQB4SwgB2NI+d74peTmHyL5y
	LfmK1pX5Nfxa6DHqtwqMiXMVkM8qXqkSf5iA9XyKrVvE44ULZEmfKWw+cYRSK8Lu5j6B
	FX/g==
X-Received: by 10.180.72.199 with SMTP id f7mr22479586wiv.58.1418300614064;
	Thu, 11 Dec 2014 04:23:34 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fq1sm2754374wib.12.2014.12.11.04.23.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 04:23:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Dec 2014 13:23:31 +0100
Message-Id: <1418300612-1383-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1418300612-1383-1-git-send-email-Martin.Jansa@gmail.com>
References: <1418300612-1383-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCH 2/3] qt5-git: Update to 5.4.0+, latest revision in 5.4 branch
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
X-List-Received-Date: Thu, 11 Dec 2014 12:23:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/qt5-versions.inc     | 2 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb   | 2 +-
 recipes-qt/qt5/nativesdk-qttools_git.bb  | 4 ++--
 recipes-qt/qt5/qt5-git.inc               | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb      | 2 +-
 recipes-qt/qt5/qtbase_git.bb             | 2 +-
 recipes-qt/qt5/qtconnectivity_git.bb     | 2 +-
 recipes-qt/qt5/qtdeclarative_git.bb      | 2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb | 2 +-
 recipes-qt/qt5/qtlocation_git.bb         | 2 +-
 recipes-qt/qt5/qtmultimedia_git.bb       | 2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb    | 2 +-
 recipes-qt/qt5/qtscript_git.bb           | 2 +-
 recipes-qt/qt5/qtsensors_git.bb          | 2 +-
 recipes-qt/qt5/qtserialport_git.bb       | 2 +-
 recipes-qt/qt5/qtsvg_git.bb              | 2 +-
 recipes-qt/qt5/qtsystems_git.bb          | 2 +-
 recipes-qt/qt5/qttools-native_git.bb     | 2 +-
 recipes-qt/qt5/qttools_git.bb            | 2 +-
 recipes-qt/qt5/qtwayland-native_git.bb   | 2 +-
 recipes-qt/qt5/qtwayland_git.bb          | 2 +-
 recipes-qt/qt5/qtwebengine_git.bb        | 4 ++--
 recipes-qt/qt5/qtwebkit_git.bb           | 2 +-
 recipes-qt/qt5/qtwebsockets_git.bb       | 2 +-
 24 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index 9acde7f..3ea8916 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -1,5 +1,5 @@
 # Select which version you prefer by defining QT5_VERSION and including this file
-# possible values now "5.4.0", "5.3.99+5.4.0-rc1+git%"
+# possible values now "5.4.0", "5.4.0+git%"
 
 QT5_VERSION ?= "5.4.0"
 
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 728cefc..1e93891 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -37,4 +37,4 @@ SRC_URI += " \
     file://OEQt5Toolchain.cmake \
 "
 
-SRCREV = "cc23ebace8b7f343aca6e10f9ebd31b87c17c782"
+SRCREV = "47326b9c5c38fea39f8539f50f32667d2c391b70"
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index 13305d1..00c4ee4 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-# prepend this again, because ${PN}.inc prepneds ${PN}
+# prepend this again, because ${PN}.inc prepends ${PN}
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
-SRCREV = "f3abe81d510bef5b984544a6d58551ce04cb8b48"
+SRCREV = "33eb6cdf9313f0ad969b4af8fc7160859c2a6319"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 8631e10..26fa264 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -10,7 +10,7 @@ SRC_URI += " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.3.99+5.4.0-rc1+git${SRCPV}"
+PV = "5.4.0+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index dc10d0d..8989fc2 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -30,4 +30,4 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "cc23ebace8b7f343aca6e10f9ebd31b87c17c782"
+SRCREV = "47326b9c5c38fea39f8539f50f32667d2c391b70"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 441a281..f67ea16 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -24,4 +24,4 @@ SRC_URI += "\
     file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
 "
 
-SRCREV = "cc23ebace8b7f343aca6e10f9ebd31b87c17c782"
+SRCREV = "47326b9c5c38fea39f8539f50f32667d2c391b70"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index c68032b..61411cb 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-SRCREV = "73563f571e6dfd37a0e4cf90f4679d9901b9233c"
+SRCREV = "944dbb9b558719b3ff9e2d129a328142c0ae6228"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index a159edc..8479eaf 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "be6c91acc3ee5ebb8336b9e79df195662ac11788"
+SRCREV = "dbe67b8512bfd78ba3c68fcfff27418bbf54141c"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 71c912a..ed41baa 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "9e9600d92224084f7942a6bd83b926c630a29747"
+SRCREV = "1f7e818a8c6ad81299bd82738b191e7d3ba01faf"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 4cd5a64..980cb5a 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "486874134b83672ae46bce315f632943829d5303"
+SRCREV = "3c6693ee7f431320b2500c9c4440bb649ed50c89"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 9bfad28..aea75d0 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "59f2bf186400241c62a02044265d9ecab81c1749"
+SRCREV = "f420ac286a303bc235b8c1047f8c845314df1f8a"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index aba3d57..e6595d5 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "3704a616dfabb71ebd3ffc64f8efe32931c82a8b"
+SRCREV = "11df73e4ac2136b72e5fca06bdc4b624a525388a"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 94ee7fd..8f1ba7d 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "2bb2ebef4c86c588c3041569ffb090041ffc6b04"
+SRCREV = "c6170fa5ee26cf9d0f2140d998fba2420ad1ed79"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index d0a347d..7fae029 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "ff98a9a27a18e6a48afa705e5cd84bd9461ad554"
+SRCREV = "817a964c710e4bc08b56f45d942944a038d6ab9c"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index adafefb..8a5c84d 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "ab51ad6a5f4e533c31bd8e5b6f16a3bcd09a3ee6"
+SRCREV = "cd9c48833cf4fbf73df68dcdb83f261c03950f91"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 7940ee5..bf7bf38 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "78dcdd807c06009460a949a7015b63f0f75ac61b"
+SRCREV = "5decb627d19ddb2b2aea4d7c317b9abfb86b5b8f"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 320bc7f..7eb98b4 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -6,4 +6,4 @@ QT_MODULE_BRANCH = "dev"
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.4
 
-SRCREV = "3a0216301ad1338126abb326e8e4c22c6ea12f40"
+SRCREV = "44f70d99a2ecd5f3f320650461f1d69142d11bcc"
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index 7c6905a..f4eacd1 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "7e7d549d26028ff407a9a3d260955f95b403a406"
+SRCREV = "33eb6cdf9313f0ad969b4af8fc7160859c2a6319"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 7c6905a..f4eacd1 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "7e7d549d26028ff407a9a3d260955f95b403a406"
+SRCREV = "33eb6cdf9313f0ad969b4af8fc7160859c2a6319"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index da38195..b8f4a0d 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e47474cf91be5fa1d12bf329526d938be8293638"
+SRCREV = "26ec3626f1088c272e3232f0341781bb38f518f3"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 1ce3043..a78c34d 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e47474cf91be5fa1d12bf329526d938be8293638"
+SRCREV = "26ec3626f1088c272e3232f0341781bb38f518f3"
 
 SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index f5699bc..31467cb 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -10,8 +10,8 @@ SRC_URI += " \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
 "
-SRCREV_qtwebengine = "ff47f09a94a0a31edd40500985ff670e8f35cc2c"
-SRCREV_chromium = "66388297cf2ca42049fb099237134ec33465e2f5"
+SRCREV_qtwebengine = "8eefc3a0658d1b10de12f43534cfd63af825ebc8"
+SRCREV_chromium = "be4ec3fa64a4c6c2b641830a9811ab7847c7dd39"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index feb860c..0e780f1 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "18cb1a3ae907d76da9eb8c54528cf3bcb074d0e5"
+SRCREV = "88c4538698fbfd7bc7d4e546abb17f9014ed61bd"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index a4c0da2..05ecad0 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "64927e04f202d33b9a9a1f94141ef692c0b513ac"
+SRCREV = "df6cc41fbdbed5d61bb43e491c2f2eea32cdc596"
-- 
2.1.3


