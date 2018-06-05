Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id F152A74E86
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 12:04:07 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id m129-v6so4578791wmb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2018 05:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p7g62V6+pbUHFUAOzQwkeDSEVPyBBl0TFAAxCP/9dhM=;
	b=C/TDUPnvCXTheZ+Apj7kCsiBkQePthipIOw+8Rqhq0G9TIkohshDsbwdvuNHLscRTF
	7KU+Iav+Np9a3093IN4BfMgvRHmZd4lACuSW1ASXJbT2u48R/GdHrIrqppgf078OE4RV
	qOMiaVofmkdDotDNvqE2BbVum5q1tt3X+lXHPROz24LYFZUtmbM+fuU51SEtIKVLkPs7
	Rxa2KiqP+uq0C2YBq1sizxtfL3xjhEyblbii9CxfvwUOO2hIgDq7DB6lvi2R5lmh6OSf
	rE3B79OJnnH2m9Z6COIKmLIvrHcLge6RWE6sSIr2+wguc5CpgU72DCRj2og89M1emtpR
	VhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p7g62V6+pbUHFUAOzQwkeDSEVPyBBl0TFAAxCP/9dhM=;
	b=NIe7m/aemppuMk6jBzrehi7UxrxphQNJJcqlYReVQ0/WsaPHPxOj6PAnOd/jwrpSbz
	wDxLlsWV3RLHqK/TuVpinfXy/fODLs4v2MPpjqjpXlnhe6ELUxy4Z27xbSL7flWfoj7T
	rmt1EsHJe+TwrMhLyV94/lSAeuJ/1zVnWaa9mq+mr3nJ4GT+2+nAsuyXP5Mkj5gWEYkH
	KjsP7XqnnnX2hLq1gU6SMHoo9uOmRwXjRRSjQHPNjCHEwx/ImeRLpHtqlpBOBNCrHEUi
	Rl1C7W+7C5x7Ot7s51rWQYB/vWqw85Xc5eIciN44jIzgtPJIcUQb+EzrsjIaMSU4nFTS
	y5Tw==
X-Gm-Message-State: APt69E1TBbo/uwNZQLhb/NiOZmay/wubm7n4+Pox5iRu2Maq6f+hP4J0
	fkAl1ashfGI8myo0RgriMo8ecQ==
X-Google-Smtp-Source: ADUXVKIFpTMMaSs+IvZQ0KJjupIhuglhYdHqVa2gTOiNTWtAQFIccaT5nrOYXSbQucPgFMcZEf9/QA==
X-Received: by 2002:a1c:6d2:: with SMTP id 201-v6mr871798wmg.47.1528200248071; 
	Tue, 05 Jun 2018 05:04:08 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local (p50971113.dip0.t-ipconnect.de.
	[80.151.17.19]) by smtp.gmail.com with ESMTPSA id
	l142-v6sm2187430wmd.16.2018.06.05.05.04.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Jun 2018 05:04:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Jun 2018 14:04:00 +0200
Message-Id: <20180605120400.5594-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [meta-qt5][PATCH] qtquick1: remove recipe and all references
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
X-List-Received-Date: Tue, 05 Jun 2018 12:04:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* webkit part is broken (at least)
* It is dead since 5.7 / 11/2016

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 lib/recipetool/create_qt5.py                       |  1 -
 .../packagegroup-qt5-toolchain-target.bb           |  5 ----
 recipes-qt/qt5/qtquick1_git.bb                     | 29 ----------------------
 3 files changed, 35 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtquick1_git.bb

diff --git a/lib/recipetool/create_qt5.py b/lib/recipetool/create_qt5.py
index 51708b4..3ac991f 100644
--- a/lib/recipetool/create_qt5.py
+++ b/lib/recipetool/create_qt5.py
@@ -79,7 +79,6 @@ class Qmake5RecipeHandler(RecipeHandler):
               'core': 'qtbase',
               'gui': 'qtbase',
               'dbus': 'qtbase',
-              'declarative': 'qtquick1',
               'designer': 'qttools',
               'help': 'qttools',
               'multimedia': 'qtmultimedia',
diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index f8662ec..8219aeb 100755
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -9,11 +9,6 @@ PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
 # Requires Ruby to work
 USE_RUBY = " \
-    qtquick1-dev \
-    qtquick1-mkspecs \
-    qtquick1-plugins \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtquick1-qmlplugins', '', d)} \
-    qttranslations-qtquick1 \
     qtwebkit-dev \
 "
 
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
deleted file mode 100644
index fd440b7..0000000
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require qt5.inc
-require qt5-git.inc
-require qt5-ptest.inc
-
-HOMEPAGE = "http://www.qt.io"
-LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
-LIC_FILES_CHKSUM = " \
-    file://LICENSE.LGPLv21;md5=4bfd28363f541b10d9f024181b8df516 \
-    file://LICENSE.LGPLv3;md5=e0459b45c5c4840b353141a8bbed91f0 \
-    file://LICENSE.GPLv2;md5=c96076271561b0e3785dad260634eaa8 \
-    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
-    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
-"
-
-DEPENDS += "qtscript qtsvg qtxmlpatterns"
-# qttools
-
-PACKAGECONFIG ??= "webkit"
-PACKAGECONFIG[webkit] = ",,qtwebkit"
-
-EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'webkit', '', 'CONFIG+=noqtwebkit', d)}"
-
-do_configure_prepend() {
-    sed -i 's#^qtHaveModule(webkitwidgets):#qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit):#g' ${S}/src/imports/imports.pro
-}
-
-QT_MODULE_BRANCH = "dev"
-
-SRCREV = "fa02271a18837f20e82006de23c2af1899294aa1"
-- 
2.14.3


