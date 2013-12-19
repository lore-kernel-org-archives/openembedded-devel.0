Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5EE6B71B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2013 18:30:09 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id a1so6063717wgh.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2013 10:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=/y6a3XTMV6lP7ls8FQ7k4cj2WAwLN4D4JoJrMRZhpew=;
	b=CUJlH5dy6NFjkexJ0YTRxYhwuqIygyR5S/nxVDAKKE8QUYYfxkBY5KcE406nCDGbYK
	mBR7HNkfHrQxJjaOy7EdaHD8n7p2xDaqdQ84PbBXHObdRPMy49Vvyep0OBuNC9i6fZ49
	EbfFkktfPZJzU0nKOlyQ5Q354qqSwDfSzgdc7Z+ggQQCzaB13LOUnjSYlYllncYTFFq5
	rYHsEdUPNMpT+8NhRvAuW1wLPvOFXky8Ip6f6Sq041TsCdpGGf9dy7fQUzqcanviJZs6
	Vym3NdwLPPRRI3OWKws6O861zacg1Is2EyRO255cPbKsn7lv2AqnOZHqPP0GIHGlYsPZ
	nDVw==
X-Received: by 10.180.72.242 with SMTP id g18mr4139149wiv.7.1387477809939;
	Thu, 19 Dec 2013 10:30:09 -0800 (PST)
Received: from localhost.localdomain (ip-109-91-251-248.unitymediagroup.de.
	[109.91.251.248])
	by mx.google.com with ESMTPSA id 1sm11606551eeg.4.2013.12.19.10.30.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Dec 2013 10:30:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Dec 2013 19:29:57 +0100
Message-Id: <1387477797-28104-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1387477797-28104-1-git-send-email-schnitzeltony@googlemail.com>
References: <1387477797-28104-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-qt / branch jansa/qt5-5.2.0][PATCH 1/1] qtbase: fix paths in packageconfig *.pc files
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
X-List-Received-Date: Thu, 19 Dec 2013 18:30:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

include- and lib-paths contained build-sysroot paths

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0020-fix-paths-in-packageconfig-files.patch    | 42 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase-git/0020-fix-paths-in-packageconfig-files.patch

diff --git a/recipes-qt/qt5/qtbase-git/0020-fix-paths-in-packageconfig-files.patch b/recipes-qt/qt5/qtbase-git/0020-fix-paths-in-packageconfig-files.patch
new file mode 100644
index 0000000..8e7842b
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0020-fix-paths-in-packageconfig-files.patch
@@ -0,0 +1,42 @@
+From c5768c394beac79f9e888f6afbd47c8dac37eb50 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 19 Dec 2013 18:04:57 +0100
+Subject: [PATCH] fix paths in packageconfig files
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This reverts parts of:
+
+enable path replacement in installed prl files on all platforms
+
+Task-number: QTBUG-33794
+Change-Id: Id0d38715673b8a1c0c034e9c15783eb255c4315b
+Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ mkspecs/features/qt_module.prf | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
+index f9dfb01..2f95684 100644
+--- a/mkspecs/features/qt_module.prf
++++ b/mkspecs/features/qt_module.prf
+@@ -164,8 +164,11 @@ QMAKE_PRL_INSTALL_REPLACE += include_replace lib_replace
+ 
+ unix|win32-g++* {
+    CONFIG += create_pc
+-   QMAKE_PKGCONFIG_LIBDIR = $$lib_replace.replace
+-   QMAKE_PKGCONFIG_INCDIR = $$include_replace.replace
++   host_build: \
++       QMAKE_PKGCONFIG_LIBDIR = $$[QT_HOST_LIBS]
++   else: \
++       QMAKE_PKGCONFIG_LIBDIR = $$[QT_INSTALL_LIBS/raw]
++   QMAKE_PKGCONFIG_INCDIR = $$[QT_INSTALL_HEADERS/raw]
+    QMAKE_PKGCONFIG_CFLAGS = -I${includedir}/$$MODULE_INCNAME
+    QMAKE_PKGCONFIG_DESTDIR = pkgconfig
+    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace pkgconfig_lib_replace
+-- 
+1.8.3.1
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 07bf28a..5ca50e8 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -26,6 +26,7 @@ SRC_URI += "\
     file://0017-enables-tslib-device-to-be-read-from-env-variable.patch \
     file://0018-qtbase-allow-build-of-examples.patch \
     file://0019-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0020-fix-paths-in-packageconfig-files.patch \
 "
 
 SRCREV = "313a74cc4a9a5d200b2059d3d8767fe1a274c50d"
-- 
1.8.3.1


