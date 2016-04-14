Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC3165CB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 14:38:38 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id g184so111302652lfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2016 07:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=BsocOvFSnf5aFsbwujq78YQtMunnXT9KJzAw9d8cJYU=;
	b=ZnYSbujrTxB34ppN390WQv9XS0uzaqE8+fpfv66zO40B+lBEGv+gIZFtEasCQeWsGu
	MPcTs0O4FgWoxFaIF9LFO8zW8W0Yx7LZqGa1xW5eHWFT6jhblkLsYiDJ9YUKrt/aGumJ
	yYyi/dx2Qp39P2Z8cCP5DmLWB+ymDHOG+3HjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BsocOvFSnf5aFsbwujq78YQtMunnXT9KJzAw9d8cJYU=;
	b=la/N9aQGMOu0aMEXXhPfV8mGQq8VJrwBqEwOI6Ylg6F1DqYSAuYGszezi07/rDBw5Q
	tW8lcV4k4a9aPrrzvAwVcVbIv7fKJre6zxcw1DxV//2jKq5n45e2ER1B0CX1t43uNjLU
	fmX6dvaKAqayvkjvrJaLrWL1RNl/iICpbx+lEZmizhTbZma+T57Zmk1E7/I0z589S5Wa
	GZGFAYHvpeSN8PuP1YirGYINrmotR6sGbey89KMvGZN/HOEr+bsRXMkPI4XdLH4kMi56
	AkAQmVqK2Dfrjh1TboHK56fy3Sru5ESdOj6Al8JHElrROTwZJ//6P101FscY/Vb3HKuH
	QhPg==
X-Gm-Message-State: AOPr4FXdvWUcRZOQR2CjijyN8a1jAj+XPeH72/bQXHJh+ZSUrQc5R070G+ftDZVNiNydsWgy
X-Received: by 10.25.151.149 with SMTP id z143mr5906790lfd.72.1460644718910;
	Thu, 14 Apr 2016 07:38:38 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	mt4sm5234692lbc.31.2016.04.14.07.38.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Apr 2016 07:38:38 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Apr 2016 17:38:36 +0300
Message-Id: <1460644716-29000-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.8.1
Cc: Brendan Le Foll <brendan.le.foll@intel.com>,
	Kevron Rees <kevron.m.rees@intel.com>
Subject: [PATCH][meta-intel-iot-middleware] upm: update to 0.6.1 release
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
X-List-Received-Date: Thu, 14 Apr 2016 14:38:44 -0000

* update SRC_URI to 0.6.1 revision
* drop patch - merged upstream
* fix packageconfig: python/nodejs bindings are always turned off
  whatever the packageconfig value is

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...438-CMakeLists.txt-stop-RPATH-being-added.patch | 31 ----------------------
 .../upm/{upm_0.4.1.bb => upm_0.6.1.bb}             |  8 +++---
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 recipes-devtools/upm/upm/0001-adafruitms1438-CMakeLists.txt-stop-RPATH-being-added.patch
 rename recipes-devtools/upm/{upm_0.4.1.bb => upm_0.6.1.bb} (60%)

diff --git a/recipes-devtools/upm/upm/0001-adafruitms1438-CMakeLists.txt-stop-RPATH-being-added.patch b/recipes-devtools/upm/upm/0001-adafruitms1438-CMakeLists.txt-stop-RPATH-being-added.patch
deleted file mode 100644
index 61822e3..0000000
--- a/recipes-devtools/upm/upm/0001-adafruitms1438-CMakeLists.txt-stop-RPATH-being-added.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0e89657449e320bf2cf71bbdd955b190102c7806 Mon Sep 17 00:00:00 2001
-From: Brendan Le Foll <brendan.le.foll@intel.com>
-Date: Tue, 2 Jun 2015 14:31:23 +0100
-Subject: [PATCH] adafruitms1438/CMakeLists.txt: stop RPATH being added to swig
-
-This stops an rpath warning in SWIG
-
-Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
----
- src/adafruitms1438/CMakeLists.txt | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/adafruitms1438/CMakeLists.txt b/src/adafruitms1438/CMakeLists.txt
-index e14d1d5..baf6c99 100644
---- a/src/adafruitms1438/CMakeLists.txt
-+++ b/src/adafruitms1438/CMakeLists.txt
-@@ -9,9 +9,11 @@ add_dependencies(${libname} pca9685)
- target_link_libraries(${libname} pca9685)
- if (BUILDSWIG)
-   if (BUILDSWIGNODE)
-+    set_target_properties(${SWIG_MODULE_jsupm_${libname}_REAL_NAME} PROPERTIES SKIP_BUILD_RPATH TRUE)
-     swig_link_libraries (jsupm_${libname} pca9685 ${MRAA_LIBRARIES} ${NODE_LIBRARIES})
-   endif()
-   if (BUILDSWIGPYTHON)
-+    set_target_properties(${SWIG_MODULE_pyupm_${libname}_REAL_NAME} PROPERTIES SKIP_BUILD_RPATH TRUE)
-     swig_link_libraries (pyupm_${libname} pca9685 ${PYTHON_LIBRARIES} ${MRAA_LIBRARIES})
-   endif()
- endif()
--- 
-2.4.1
-
diff --git a/recipes-devtools/upm/upm_0.4.1.bb b/recipes-devtools/upm/upm_0.6.1.bb
similarity index 60%
rename from recipes-devtools/upm/upm_0.4.1.bb
rename to recipes-devtools/upm/upm_0.6.1.bb
index fa79529..a045175 100644
--- a/recipes-devtools/upm/upm_0.4.1.bb
+++ b/recipes-devtools/upm/upm_0.6.1.bb
@@ -7,9 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d1cc191275d6a8c5ce039c75b2b3dc29"
 
 DEPENDS = "nodejs swig-native mraa"
 
-SRC_URI = "git://github.com/intel-iot-devkit/upm.git;protocol=git;rev=74691914fb3bb108f2f37e09e4a9851a52b4d504 \
-           file://0001-adafruitms1438-CMakeLists.txt-stop-RPATH-being-added.patch \
-"
+SRC_URI = "git://github.com/intel-iot-devkit/upm.git;protocol=git;rev=655ccee9afd259bff1773e9e8aea860f6e06b69f"
 
 S = "${WORKDIR}/git"
 
@@ -18,5 +16,5 @@ inherit distutils-base pkgconfig python-dir cmake
 FILES_${PN}-doc += "${datadir}/upm/examples/"
 
 PACKAGECONFIG ??= "python nodejs"
-PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=OFF, -DBUILDSWIGPYTHON=OFF, swig-native python"
-PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=OFF, -DBUILDSWIGNODE=OFF, swig-native nodejs"
+PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON, -DBUILDSWIGPYTHON=OFF, swig-native python"
+PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs"
-- 
2.8.1


