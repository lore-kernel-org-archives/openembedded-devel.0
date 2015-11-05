Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 39CDA75D4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 11:31:49 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so10611630wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 03:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1oN8sD/57IzQFe22HPRJuOPj7b42JuvjSLXqxLAqo4E=;
	b=ivug36RO5OeJrz+2j7rJbGyX/e3QT7n/Qf+wyBhSxwxif/EiRe53rGzv0/zklWapqu
	HwczlQebi/XaAydF76A//8T66sZV1K03GnOPcno1AKBwJf8aWia+18CPBjBEeWi4GV9K
	hUahW0ghHkAi2vDUQ4SMGYOU7ny/QX7oVUavVwJHewWwpEGWalRrv5prIkrrAa/3stF4
	dU6leVVZ026iHtvAvqi8eicqWT/c379eCCedy7GNTO+tWbGaNHCWVlgljaZ7G38+iUt1
	mWB0thl96mlayOvONlv2GATNL3AHIlV8fGhzeP7+iCN/3w278pS34V56ENY/Wu48n5N5
	vjSg==
X-Received: by 10.28.130.85 with SMTP id e82mr2851958wmd.21.1446723109631;
	Thu, 05 Nov 2015 03:31:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v191sm33657759wmd.24.2015.11.05.03.31.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 03:31:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 12:31:59 +0100
Message-Id: <1446723119-1028-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH][meta-qt5] qtsvg: fix incorrect heart.svg installation path
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
X-List-Received-Date: Thu, 05 Nov 2015 11:31:52 -0000

* fixes:
WARNING: QA Issue: qtsvg: Files/directories were installed but not shipped in any package:
  /OE
  /OE/build
  /OE/build/owpb
  /OE/build/owpb/webos-ports
  /OE/build/owpb/webos-ports/tmp-glibc
  /OE/build/owpb/webos-ports/tmp-glibc/work
  /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux
  /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtsvg
  /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtsvg/5.5.99+5.6.0-alpha1+gitAUTOINC+9ee5ee12a7-r0
  /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtsvg/5.5.99+5.6.0-alpha1+gitAUTOINC+9ee5ee12a7-r0/git
  /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtsvg/5.5.99+5.6.0-alpha1+gitAUTOINC+9ee5ee12a7-r0/git/examples
  /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtsvg/5.5.99+5.6.0-alpha1+gitAUTOINC+9ee5ee12a7-r0/git/examples/svg
  /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtsvg/5.5.99+5.6.0-alpha1+gitAUTOINC+9ee5ee12a7-r0/git/examples/svg/richtext
  /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtsvg/5.5.99+5.6.0-alpha1+gitAUTOINC+9ee5ee12a7-r0/git/examples/svg/richtext/textobject
  /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtsvg/5.5.99+5.6.0-alpha1+gitAUTOINC+9ee5ee12a7-r0/git/examples/svg/richtext/textobject/files
  /OE/build/owpb/webos-ports/tmp-glibc/work/i586-webos-linux/qtsvg/5.5.99+5.6.0-alpha1+gitAUTOINC+9ee5ee12a7-r0/git/examples/svg/richtext/textobject/files/heart.svg
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
qtsvg: 16 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...pro-use-DEPLOYMENT-only-for-wince-like-ot.patch | 30 ++++++++++++++++++++++
 recipes-qt/qt5/qtsvg_git.bb                        |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch

diff --git a/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch b/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
new file mode 100644
index 0000000..4c9c643
--- /dev/null
+++ b/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
@@ -0,0 +1,30 @@
+From d539c7e4ef98fd4933573eac606a4edee6655d8c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 5 Nov 2015 12:25:05 +0100
+Subject: [PATCH] textobject.pro: use DEPLOYMENT only for wince like other
+ examples
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ examples/svg/richtext/textobject/textobject.pro | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/examples/svg/richtext/textobject/textobject.pro b/examples/svg/richtext/textobject/textobject.pro
+index 794ad32..0ecd2c7 100644
+--- a/examples/svg/richtext/textobject/textobject.pro
++++ b/examples/svg/richtext/textobject/textobject.pro
+@@ -12,6 +12,8 @@ RESOURCES       = resources.qrc
+ target.path = $$[QT_INSTALL_EXAMPLES]/svg/richtext/textobject
+ INSTALLS += target
+ 
+-filesToDeploy.files = files/*.svg
+-filesToDeploy.path = files
+-DEPLOYMENT += filesToDeploy
++wince* {
++    filesToDeploy.files = files/*.svg
++    filesToDeploy.path = files
++    DEPLOYMENT += filesToDeploy
++}
+-- 
+2.6.2
+
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index b3bc50f..57e9b4f 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -14,3 +14,5 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtbase"
 
 SRCREV = "9ee5ee12a7b92a57624dafed935b3ac1fad426d9"
+
+SRC_URI += "file://0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch"
-- 
2.6.2


