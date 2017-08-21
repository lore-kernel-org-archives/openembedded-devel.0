Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 297F2782DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 21:01:24 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p14so14262605wrg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 14:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f5kMZZHKkSSvia3gk0lQwnw6yDajCIo/yS906wSdNec=;
	b=pZgl19dZhbxFRcqB97FR/ChC0zCbVOD7D6Q+CH9w9o92voK3I0mbMaqlQHfUC46h/w
	o3l7hAfXC81FitadP1r4ffjv2mOXZpbsbjPH4/dYVHcHebNAnR4ZjcQMbYPU7mjfzSKm
	FYWBX0cTprhrKeScJjyL6R/s9DTNc7QrQw4PLC9Ve4aJ4KdqsbPI4U9qqagQxItOiYxe
	RbktnqN3qrBjZU19Wt2S2dpHpe0hFa89ic3WgGtLxMOgtOQNuzXBdFz0w74EM/fmXBcq
	F5z1J5Wm0JHrfvMRp++gK1EHzpZU/tWzJXK6w/9kI1cxbqRmEoeSvMRHHyzEaH/SCJVE
	DKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f5kMZZHKkSSvia3gk0lQwnw6yDajCIo/yS906wSdNec=;
	b=PG/PvOzQrb2/R72G6O6dql2xwcGvxK/B+nn2IRXsyOpmKTWuem/Cz0L5mlnwdWPYLP
	txgC53ccaw6MdaN63cqi6L/WYA9FnzNpHPQ1ACKdpvJ0jNgcjLSPVIgzwYoYUtB2yTNg
	jhNbWZtgctVkYkerA+CSyaRm8rfZ9FlX1vgUpgh0Hs4e9J6ddEHmw/V6cudDEsGIx3+c
	oMrueViU3efsrLmzKqk0S4zOzDCqkIMK7q8ghTMcobo9wLhV3DKRe0fJPCulxW5pu80n
	d/PtHZU7+lc+L5wWD93V1Bf9tbfEAMnYssO2ZyddknF6EBDNfi/bMJFTr1EvPCbBUmFU
	SYeg==
X-Gm-Message-State: AHYfb5hRfWEA4E/XNkT1bCTCD7CioJLYcfRY9XLSwpI7woSqkt1+5raJ
	Zlv+NulhZ7zADeZ2
X-Received: by 10.28.196.12 with SMTP id u12mr6229412wmf.165.1503349285084;
	Mon, 21 Aug 2017 14:01:25 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id f4sm6845185wmh.28.2017.08.21.14.01.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 14:01:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Aug 2017 23:02:58 +0200
Message-Id: <20170821210259.20276-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170821210259.20276-1-Martin.Jansa@gmail.com>
References: <20170821210259.20276-1-Martin.Jansa@gmail.com>
Subject: [meta-qt5][PATCHv2 6/7] qtwebengine: fix build with glibc-2.26
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
X-List-Received-Date: Mon, 21 Aug 2017 21:01:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...qtbug-61521.cpp-use-free-instead-of-cfree.patch | 25 ++++++++++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch

diff --git a/recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch b/recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch
new file mode 100644
index 0000000..7375ff7
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch
@@ -0,0 +1,25 @@
+From b4eb5c926cf822ee5d5cf398d1bcdb0fdca6e47a Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 20 Aug 2017 20:37:38 +0200
+Subject: [PATCH] qtbug-61521.cpp: use free instead of cfree
+
+* as cfree man says:
+  This  function  should  never  be used.  Use free(3) instead.
+  Starting with version 2.26, it has been removed from glibc.
+---
+ src/core/api/qtbug-61521.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/core/api/qtbug-61521.cpp b/src/core/api/qtbug-61521.cpp
+index 86d5998e..1dcc4cfa 100644
+--- a/src/core/api/qtbug-61521.cpp
++++ b/src/core/api/qtbug-61521.cpp
+@@ -100,7 +100,7 @@ SHIM_HIDDEN void* ShimCalloc(size_t n, size_t size) {
+ }
+ 
+ SHIM_HIDDEN void ShimCFree(void* ptr) {
+-    cfree(ptr);
++    free(ptr);
+ }
+ 
+ SHIM_HIDDEN void* ShimMemalign(size_t align, size_t s) {
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 2815cb9..cdb4512 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -130,13 +130,14 @@ RDEPENDS_${PN}-examples += " \
 QT_MODULE_BRANCH_CHROMIUM = "56-based"
 
 # Patches from https://github.com/meta-qt5/qtwebengine/commits/b5.9
-# 5.9.meta-qt5.2
+# 5.9.meta-qt5.3
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};protocol=${QT_GIT_PROTOCOL};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-allow-build-for-linux-oe-g-platform.patch \
     file://0002-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch \
     file://0003-Include-dependency-to-QCoreApplication-translate.patch \
     file://0004-Force-host-toolchain-configuration.patch \
+    file://0005-qtbug-61521.cpp-use-free-instead-of-cfree.patch \
 "
 
 # Patches from https://github.com/meta-qt5/qtwebengine-chromium/commits/56-based 
-- 
2.14.1


