Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9487C7825D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:07:13 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 184so724363wmo.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 05:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=+aXdY6Nrvku0U0kbI69DejrCJnhNX8rTjuohmM4Hzgg=;
	b=cPV0IfvV6s3a99aMZVGiLB14fSOMiicfCt3vA/f5GoZDJpWKf9PXmNuVsAg5UKIbYA
	QcYGMMG0wVYAYAzaO/MntL7OwsW9vdVEPrQ3ZCXXk5C+ExdpRrBKZK9UfjC7jMSbbosF
	klij4Bjhl3Y3/8wAikZ1AInwTsj9j4B8Po4BVySFYMOoJ3Fe59EGnCJxXViWYcanKROR
	0fLGpD4nw6DfL6Q3pT4eYH3Jne5YQNHUupg0vFj/M48rk7aW801XEO1pjQAwe1f+WSvv
	boU2jYxhHjzbhdMXuPKHUz+UXjyhzgmnGrE6xLGg2hCCMuDqqcrLiu6bM3TvME0pUdo8
	wSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+aXdY6Nrvku0U0kbI69DejrCJnhNX8rTjuohmM4Hzgg=;
	b=PbSMhum6Z9CGaM4VhLnVgmxJPg95buJ7hk35WGEaG4Wl3KYqQwKJs9V/pMmBmOo4eQ
	TEZFEr9WeEUqdf8j1W7KnQQQznphZwWVhQL1cOKinvRHw46Bo21dOEnwfZaU8PLY8jIQ
	Md2rCidYT1417cmbb6AntV5i3oyYEMlGyNN05wQjePuUdowMGUaIFzqd4w8uwJoZvg7i
	mBUbGKQKmZ9MmwKisD45WShZdGEkzbnwMQObqvEwHTHrzd5gMWWjcwmC9k1DF6//kz5Y
	b+tlcju3YKHgGzDqBoxvjc/vTCUkVDSvvYRI1v9qbAVfTG1AnLyBCAicu6+D07Xfm81S
	oe8A==
X-Gm-Message-State: AIVw110tCgclfn9Ym5HPyVREF/bhURxU6rU4KPHgWfxzLSXiEa1ekcr8
	2tSmPSj0lO7BBV0PYQc=
X-Received: by 10.28.15.75 with SMTP id 72mr1108158wmp.177.1500552433852;
	Thu, 20 Jul 2017 05:07:13 -0700 (PDT)
Received: from yoctovde.kynetics.it
	(host57-224-static.7-79-b.business.telecomitalia.it. [79.7.224.57])
	by smtp.gmail.com with ESMTPSA id
	q21sm3533595wra.86.2017.07.20.05.07.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Jul 2017 05:07:13 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 14:07:01 +0200
Message-Id: <1500552421-10582-1-git-send-email-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.7.4
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [meta-qt5][PATCH] python-pyqt5: include QtWidgets module
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
X-List-Received-Date: Thu, 20 Jul 2017 12:07:13 -0000

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 ...sip-fix-build-with-accessibility-disabled.patch | 35 ++++++++++++++++++++++
 recipes-python/pyqt5/python-pyqt5_5.8.2.bb         |  5 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 recipes-python/pyqt5/files/0001-qtabbar.sip-fix-build-with-accessibility-disabled.patch

diff --git a/recipes-python/pyqt5/files/0001-qtabbar.sip-fix-build-with-accessibility-disabled.patch b/recipes-python/pyqt5/files/0001-qtabbar.sip-fix-build-with-accessibility-disabled.patch
new file mode 100644
index 0000000..7e1c7bf
--- /dev/null
+++ b/recipes-python/pyqt5/files/0001-qtabbar.sip-fix-build-with-accessibility-disabled.patch
@@ -0,0 +1,35 @@
+From 8a2f852417414e19d060da66cd7c5cba76e43c7d Mon Sep 17 00:00:00 2001
+From: Diego Rondini <diego.rondini@kynetics.com>
+Date: Wed, 19 Jul 2017 14:17:51 +0200
+Subject: [PATCH] qtabbar.sip: fix build with accessibility disabled
+
+Upstream-Status: Submitted
+
+Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
+---
+ sip/QtWidgets/qtabbar.sip | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/sip/QtWidgets/qtabbar.sip b/sip/QtWidgets/qtabbar.sip
+index ffe2d3b..80ad816 100644
+--- a/sip/QtWidgets/qtabbar.sip
++++ b/sip/QtWidgets/qtabbar.sip
+@@ -166,11 +166,15 @@ protected:
+ 
+ public:
+ %If (Qt_5_8_0 -)
++%If (PyQt_Accessibility)
+     QString accessibleTabName(int index) const;
+ %End
++%End
+ %If (Qt_5_8_0 -)
++%If (PyQt_Accessibility)
+     void setAccessibleTabName(int index, const QString &name);
+ %End
++%End
+ 
+ private:
+     QTabBar(const QTabBar &);
+-- 
+2.7.4
+
diff --git a/recipes-python/pyqt5/python-pyqt5_5.8.2.bb b/recipes-python/pyqt5/python-pyqt5_5.8.2.bb
index 3fa3d64..fdfa120 100644
--- a/recipes-python/pyqt5/python-pyqt5_5.8.2.bb
+++ b/recipes-python/pyqt5/python-pyqt5_5.8.2.bb
@@ -11,6 +11,7 @@ DEPENDS = "sip sip-native qtbase python"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/pyqt/PyQt5_gpl-${PV}.tar.gz \
     file://fix-sm.patch \
+    file://0001-qtabbar.sip-fix-build-with-accessibility-disabled.patch \
 "
 SRC_URI[md5sum] = "c3048e9d242f3e72fd393630da1d971a"
 SRC_URI[sha256sum] = "ebd70515b30bbd6098fee29e6271a6696b1183c5530ee30e6ba9aaab195536e8"
@@ -31,8 +32,8 @@ DISABLED_FEATURES = "PyQt_Desktop_OpenGL PyQt_Accessibility PyQt_SessionManager"
 
 DISABLED_FEATURES_append_arm = " PyQt_qreal_double"
 
-PYQT_MODULES = "QtCore QtGui QtNetwork"
-PYQT_MODULES_aarch64 = "QtCore QtGui QtNetwork"
+PYQT_MODULES = "QtCore QtGui QtNetwork QtWidgets"
+PYQT_MODULES_aarch64 = "QtCore QtGui QtNetwork QtWidgets"
 
 do_configure_prepend() {
     cd ${S}
-- 
2.7.4


