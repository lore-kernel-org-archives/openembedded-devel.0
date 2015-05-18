Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id E5E1A65D48
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 04:55:19 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so38643111igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 May 2015 21:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=dc5WHPJg96zVFaUQSzFLBXtMCWIMzfSSnUvK33vnRmY=;
	b=ZR5yAibOy/MOHESqAJ30wz9vtp4+V4lMVh4cSfdm1BWU3Q9fovGiTVzacB1GAs8VIY
	yvClKYvrEPX4dJp2icYv5KFxY/IwT77npXVgG1EtIegvWRRHJMc6vxDlDzXNMEuUcimR
	JPrN5z4YLZ0WpX/k7MeNaSpoU1iFuklMyUpm577BjjK4GZJeemR5N+Qgr/CGxFG4zCPk
	VXVFR+wDgFDQgT4BzCwbSb4lr52Hy0M+EiSWsSdvdmtt8LhIdK73+wJ1j8XArogzfB9M
	77Wu9+3I3A/rimPXPPYl0nUETQHsGRJUEoBzSBZWeBNEJnS6lG+X02jVtp5Hzz9pSJhF
	6hsQ==
X-Received: by 10.50.221.98 with SMTP id qd2mr12000229igc.37.1431924920647;
	Sun, 17 May 2015 21:55:20 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 35sm6981948ior.34.2015.05.17.21.55.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 May 2015 21:55:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 May 2015 21:55:13 -0700
Message-Id: <1431924914-22516-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-qt5][PATCH 1/2] qtwebkit: Backport fix to build with gcc5
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
X-List-Received-Date: Mon, 18 May 2015 04:55:20 -0000

This is already committed upstream to 5.4 branch
may be next minor upgrade will get it but until then
we need it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../qt5/qtwebkit/0004-gcc5-qtbug-44829.patch       | 36 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebkit_5.4.1.bb                   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwebkit/0004-gcc5-qtbug-44829.patch

diff --git a/recipes-qt/qt5/qtwebkit/0004-gcc5-qtbug-44829.patch b/recipes-qt/qt5/qtwebkit/0004-gcc5-qtbug-44829.patch
new file mode 100644
index 0000000..81295d1
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0004-gcc5-qtbug-44829.patch
@@ -0,0 +1,36 @@
+From 650c6ee8e76bb574d3a1bea09e2494992d8f070e Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
+Date: Fri, 6 Mar 2015 11:20:13 +0100
+Subject: Fix g++ 5.0 build
+
+A non-inline template needs to be explicitly instantiated if used
+outside the object where it is declared.
+
+Patch suggested by Khem Raj.
+
+Task-number: QTBUG-44829
+Change-Id: Ib0adbd9273bd1cef01e5863bc8aaa9c373022792
+Reviewed-by: Andras Becsi <andras.becsi@theqtcompany.com>
+---
+ Source/JavaScriptCore/runtime/JSObject.cpp | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Source/JavaScriptCore/runtime/JSObject.cpp b/Source/JavaScriptCore/runtime/JSObject.cpp
+index 5637e20..bd55919 100644
+--- a/Source/JavaScriptCore/runtime/JSObject.cpp
++++ b/Source/JavaScriptCore/runtime/JSObject.cpp
+@@ -1909,6 +1909,11 @@ void JSObject::putByIndexBeyondVectorLengthWithoutAttributes(ExecState* exec, un
+     }
+ }
+ 
++// Used in JSArray.cpp so we must instantiate explicit
++template void JSObject::putByIndexBeyondVectorLengthWithoutAttributes<Int32Shape>(ExecState* exec, unsigned i, JSValue value);
++template void JSObject::putByIndexBeyondVectorLengthWithoutAttributes<DoubleShape>(ExecState* exec, unsigned i, JSValue value);
++template void JSObject::putByIndexBeyondVectorLengthWithoutAttributes<ContiguousShape>(ExecState* exec, unsigned i, JSValue value);
++
+ void JSObject::putByIndexBeyondVectorLengthWithArrayStorage(ExecState* exec, unsigned i, JSValue value, bool shouldThrow, ArrayStorage* storage)
+ {
+     VM& vm = exec->vm();
+-- 
+cgit v0.11.0
+
diff --git a/recipes-qt/qt5/qtwebkit_5.4.1.bb b/recipes-qt/qt5/qtwebkit_5.4.1.bb
index 909696b..454e470 100644
--- a/recipes-qt/qt5/qtwebkit_5.4.1.bb
+++ b/recipes-qt/qt5/qtwebkit_5.4.1.bb
@@ -3,6 +3,7 @@ require ${PN}.inc
 
 SRC_URI += "\
     file://0003-Fix-building-with-glib-2.43.patch \
+    file://0004-gcc5-qtbug-44829.patch \
 "
 
 SRC_URI[md5sum] = "186627b1ea5b614811fbd0cfa9b4d073"
-- 
2.1.4


