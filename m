Return-Path: <philip.balister@gmail.com>
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id D4B18755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 20:43:21 +0000 (UTC)
Received: by ykek133 with SMTP id k133so55990476yke.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 13:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Xg3MgD4aZLbnUp3IjmySRTSrzAk7E/DkSX3aIIC8+Mw=;
	b=IhSk51GyHkv9WtPBEohzmC2xrVKPdGElTBkUNNZkFjrizlqNkrclxwvvSFRndBOsy/
	xGIh3f5+MEJVlVccL5OSsN+v3bPpSUpO9Ua53XV9IDVTg9gx6430iHq5l1cWfC5M9DOU
	82VloakXCLgH9nYLyzB/xhY420l4wCMJnwHqFGy4Ef50rZBxsnSEQxDh4HCd/+Yt5eqw
	Hk7H4lTg2UB34/GVejoaK8v+s8acYGpfFkG7KWgOlhiC5tVfziFcw3WDkMGFoNtTj04i
	T4V6LUramOzFweMPPyY1fbOsWbY2CHZrU3QUkH3som/ANOBZ3SJ2kuVKP2bCjBn9ZQh7
	WQ6g==
X-Received: by 10.129.146.85 with SMTP id j82mr3211995ywg.315.1446151401316;
	Thu, 29 Oct 2015 13:43:21 -0700 (PDT)
Received: from thuvia.localdomain (pool-71-171-10-68.ronkva.east.verizon.net.
	[71.171.10.68]) by smtp.gmail.com with ESMTPSA id
	x185sm1924061ywf.13.2015.10.29.13.43.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 13:43:20 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Oct 2015 16:43:14 -0400
Message-Id: <1446151394-12106-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH] python-pyqt: Fix build for aarch64.
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
X-List-Received-Date: Thu, 29 Oct 2015 20:43:23 -0000

Qt for aarch64 disable QtWebKit due to a build failure. We need to disable
QtWebKit here also until the problem is resolved in the Qt recipe.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
index 160a5d5..cfddee8 100644
--- a/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
+++ b/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb
@@ -30,6 +30,9 @@ DISABLED_FEATURES = "PyQt_Desktop_OpenGL PyQt_Accessibility PyQt_SessionManager"
 
 DISABLED_FEATURES_append_arm = " PyQt_qreal_double"
 
+PYQT_MODULES = "QtCore QtGui QtDeclarative QtNetwork QtSvg QtWebKit"
+PYQT_MODULES_aarch64 = "QtCore QtGui QtDeclarative QtNetwork QtSvg"
+
 do_configure() {
     echo "py_platform = linux" > pyqt.cfg
     echo "py_inc_dir = %(sysroot)/$includedir/python%(py_major).%(py_minor)" >> pyqt.cfg
@@ -42,7 +45,7 @@ do_configure() {
     echo "pyqt_disabled_features = ${DISABLED_FEATURES}" >> pyqt.cfg
     echo "qt_shared = True" >> pyqt.cfg
     echo "[Qt 4.8]" >> pyqt.cfg
-    echo "pyqt_modules = QtCore QtGui QtDeclarative QtNetwork QtSvg QtWebKit" >> pyqt.cfg
+    echo "pyqt_modules = ${PYQT_MODULES}" >> pyqt.cfg
     echo yes | python configure-ng.py --verbose --qmake  ${STAGING_BINDIR_NATIVE}/qmake2 --configuration pyqt.cfg --sysroot ${STAGING_DIR_HOST}
 }
 do_install() {
-- 
2.1.0


