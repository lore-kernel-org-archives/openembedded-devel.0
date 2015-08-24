Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7879076B69
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 17:44:11 +0000 (UTC)
Received: by iodt126 with SMTP id t126so157964142iod.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 10:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6ES7toZwSFSCf7BPu4QV0G/Ql5xUZ1l8jFIfw7Ek9L4=;
	b=hSJrwcH1ct/+k40+ks+oJnb1SJWihcqS/wQk9Z8ogHY/maliQmn0jS/h7ttkzWW7FK
	3PickuRUoci4MO2J22sQ3TQd9XP0MagwP54/oBOXY9n8gHGJZ04W8pWIQm/6oCu69eKW
	c7x2uiXqLkr/7NdbvKb0V5CRTlCTodnew+am/WwFGXzPZkoSSFDNdTd7GulwBA/vSHQX
	+NJbSzx+3QagYjicJtyP8DqLQJTAOtTEboqseSeEnN/YfmjGAko9uYF1NiG3/7gvqkUa
	hJsCZuMumXS7gdeB3BMOe7H0gAXTaHuLMNA3UZuAK4G61sKKg0qI6Lz5/c5osqC6wzJU
	EN8g==
X-Received: by 10.107.131.20 with SMTP id f20mr20005004iod.100.1440438252307; 
	Mon, 24 Aug 2015 10:44:12 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	ht6sm9289129igb.11.2015.08.24.10.44.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 10:44:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 10:43:59 -0700
Message-Id: <1440438239-19765-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440438239-19765-1-git-send-email-raj.khem@gmail.com>
References: <1440438239-19765-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-qt5][PATCH V2 4/4] recipes, conf: Direct QT_GIT to use github mirrors
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
X-List-Received-Date: Mon, 24 Aug 2015 17:44:13 -0000

This helps in load balancing code.qt.io may be overloaded
and bails out occasionally when doing fresh clones

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf                              | 4 ++--
 recipes-qt/examples/qt5everywheredemo_1.0.bb | 2 +-
 recipes-qt/qt5/qt5-git.inc                   | 2 +-
 recipes-qt/qt5/qtwebengine_git.bb            | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 92558b3..f83bd96 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -5,7 +5,7 @@
 # Therefore if you want a given layer to be considered high priority
 # for the .inc and .conf etc. then consider it adding at the beginning
 # of BBPATH. For bblayers bitbake will use BBFILES_PRIORITY to resolve
-# the recipe contention so the order of directories in BBFILES does 
+# the recipe contention so the order of directories in BBFILES does
 # not matter.
 
 # We have a conf and classes directory, append to BBPATH
@@ -27,4 +27,4 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 IMAGE_FEATURES[validitems] += "qtcreator-debug"
 
-QT_GIT ?= "git://code.qt.io"
+QT_GIT ?= "git://github.com/qtproject"
diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/examples/qt5everywheredemo_1.0.bb
index 0546b00..057aaaa 100644
--- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
+++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://main.cpp;md5=1187cb795a0f96bce64e63dd1a67dc2b"
 DEPENDS = "qtdeclarative qtgraphicaleffects"
 
 SRCREV = "c17fe9e0ec0882ac4c4dc1168095f569acab5d09"
-SRC_URI = "${QT_GIT}/qt-labs/qt5-everywhere-demo.git"
+SRC_URI = "${QT_GIT}/qt-labs-qt5-everywhere-demo"
 
 S = "${WORKDIR}/git/QtDemo"
 
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index ea37b55..b73ce4f 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -5,7 +5,7 @@ QT_MODULE_BRANCH ?= "5.5"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
-    ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+    ${QT_GIT}/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
 
 S = "${WORKDIR}/git"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 2933bf7..27873b7 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -75,7 +75,7 @@ RDEPENDS_${PN}-examples += " \
 QT_MODULE_BRANCH_CHROMIUM = "40.0.2214-based"
 
 SRC_URI += " \
-    ${QT_GIT}/qt/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
+    ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
-- 
2.1.4


