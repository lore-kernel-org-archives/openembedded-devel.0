Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1507F738B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 14:00:43 +0000 (UTC)
Received: by wggz12 with SMTP id z12so53707274wgg.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 06:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oEhb91GvxBHIdpJc2yfxOhvGlsmrta4kO3Rhjzi2GTE=;
	b=FK06EkT0zB5xotl1EPZsmWMqenaStosFRVFr2tTYL6svzmmXVIBXjuF/Z/ktX8xrrF
	L/5WiWOLjcT2vFrXARvpnECwQmaLTIgG+7avQfbnBP6yYEFdBowIJX81FDK8AeKBSxQa
	B9NsEQR0bak31ye3Exy/DwKxinGTAEXAhA6Nw2jZElwG8IyJi3Y5+A50S3Y+Yj14Fh07
	7dnWjRVVqqPwJD5NWrmsO0ymOqSEv9x4YXlzJAURFsVh1gjUYHs3wq/Dyl+2Zg80+Ngo
	cqE6nKwtc6kxVKZD4sJhLeQFvdZSF/lHMcgESsjXVythJo+fDWMaMrpDJ4r6pC9J4QED
	mNww==
X-Received: by 10.194.120.132 with SMTP id lc4mr19558478wjb.92.1425564044663; 
	Thu, 05 Mar 2015 06:00:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m4sm10652310wjb.25.2015.03.05.06.00.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 06:00:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Mar 2015 15:00:46 +0100
Message-Id: <1425564046-18281-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.1
In-Reply-To: <20150303182827.GC2337@jama>
References: <20150303182827.GC2337@jama>
Subject: [meta-qt5][PATCHv1] qtwebengine: Fix build with accessibility enabled
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
X-List-Received-Date: Thu, 05 Mar 2015 14:00:46 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...et_host_view_qt-Fix-build-with-accessibil.patch | 30 ++++++++++++++++++++++
 ...et_host_view_qt-Fix-build-with-accessibil.patch | 30 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_5.4.1.bb                |  1 +
 recipes-qt/qt5/qtwebengine_git.bb                  |  1 +
 4 files changed, 62 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebengine-git/0004-render_widget_host_view_qt-Fix-build-with-accessibil.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0005-render_widget_host_view_qt-Fix-build-with-accessibil.patch

diff --git a/recipes-qt/qt5/qtwebengine-git/0004-render_widget_host_view_qt-Fix-build-with-accessibil.patch b/recipes-qt/qt5/qtwebengine-git/0004-render_widget_host_view_qt-Fix-build-with-accessibil.patch
new file mode 100644
index 0000000..e938474
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine-git/0004-render_widget_host_view_qt-Fix-build-with-accessibil.patch
@@ -0,0 +1,30 @@
+From bb798fc9ad6bde88ecfd06841b6f4de8d4543853 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 5 Mar 2015 14:58:32 +0100
+Subject: [PATCH 4/4] render_widget_host_view_qt: Fix build with accessibility
+
+* fixes following error when accessibility is enabled:
+  ../../../src/core/render_widget_host_view_qt.cpp:311:12: error: return-statement with a value, in function returning 'void' [-fpermissive]
+  |      return 0;
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/core/render_widget_host_view_qt.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/render_widget_host_view_qt.cpp b/src/core/render_widget_host_view_qt.cpp
+index 18d64e8..1ca9dea 100644
+--- a/src/core/render_widget_host_view_qt.cpp
++++ b/src/core/render_widget_host_view_qt.cpp
+@@ -308,7 +308,7 @@ void RenderWidgetHostViewQt::CreateBrowserAccessibilityManagerIfNeeded()
+         content::BrowserAccessibilityManagerQt::GetEmptyDocument(),
+         this));
+ #else
+-    return 0;
++    return;
+ #endif // QT_NO_ACCESSIBILITY
+ }
+ 
+-- 
+2.3.1
+
diff --git a/recipes-qt/qt5/qtwebengine/0005-render_widget_host_view_qt-Fix-build-with-accessibil.patch b/recipes-qt/qt5/qtwebengine/0005-render_widget_host_view_qt-Fix-build-with-accessibil.patch
new file mode 100644
index 0000000..a94cb50
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0005-render_widget_host_view_qt-Fix-build-with-accessibil.patch
@@ -0,0 +1,30 @@
+From 039965ecfe950cd530a2a466505cafca2672f155 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 5 Mar 2015 14:58:32 +0100
+Subject: [PATCH 5/5] render_widget_host_view_qt: Fix build with accessibility
+
+* fixes following error when accessibility is enabled:
+  ../../../src/core/render_widget_host_view_qt.cpp:311:12: error: return-statement with a value, in function returning 'void' [-fpermissive]
+  |      return 0;
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/core/render_widget_host_view_qt.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/render_widget_host_view_qt.cpp b/src/core/render_widget_host_view_qt.cpp
+index 18d64e8..1ca9dea 100644
+--- a/src/core/render_widget_host_view_qt.cpp
++++ b/src/core/render_widget_host_view_qt.cpp
+@@ -308,7 +308,7 @@ void RenderWidgetHostViewQt::CreateBrowserAccessibilityManagerIfNeeded()
+         content::BrowserAccessibilityManagerQt::GetEmptyDocument(),
+         this));
+ #else
+-    return 0;
++    return;
+ #endif // QT_NO_ACCESSIBILITY
+ }
+ 
+-- 
+2.3.1
+
diff --git a/recipes-qt/qt5/qtwebengine_5.4.1.bb b/recipes-qt/qt5/qtwebengine_5.4.1.bb
index 867d5bd..e1930f5 100644
--- a/recipes-qt/qt5/qtwebengine_5.4.1.bb
+++ b/recipes-qt/qt5/qtwebengine_5.4.1.bb
@@ -9,5 +9,6 @@ SRC_URI += " \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0004-Enable-building-Qt-WebEngine-without-accessiblity-en.patch \
+    file://0005-render_widget_host_view_qt-Fix-build-with-accessibil.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
 "
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 89a83d4..650811c 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -9,6 +9,7 @@ SRC_URI += " \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
+    file://0004-render_widget_host_view_qt-Fix-build-with-accessibil.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
 "
 SRCREV_qtwebengine = "9d1a77b5be56a6a1dade613573eaeea63070969f"
-- 
2.3.1


