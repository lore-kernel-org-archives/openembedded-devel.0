Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id A216A723FE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 11:36:54 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id y19so8810506wgg.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 03:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lSCimhPHl2up4RphhkFTKrvz5uF0TZZABd5XHCzVbhw=;
	b=SPCbxh4JUiqbxk+5LipVUdsVZxTgtorCrpapfSj7nahsOXq4gm06OR0VXZwGFn+S5G
	Z47Bzhq8aozRylxJgitvAsxOY4L/CaMat/r71Lu/mNTLeLK5rRZlI+x/BzkuLKrh7q/b
	fzs/2/i10lqzodb6gWT5rQrkG5uGYBfGkotL6d/kNyXLNm2k/0euL1JggaibM+ml4uXA
	aQkv80xn2pg2M6vgLrQEO1EegmH8HKhFRVr6ADVE11JpIjbAS3lGoovot1igQF0PCafs
	5VLhA43aPuFaXPuz5QlMBohN4ERHumj9zULi64/kayCILJDp26DddMGXPDl7Stbpgat5
	A4gg==
X-Received: by 10.194.71.169 with SMTP id w9mr15020109wju.19.1418384215208;
	Fri, 12 Dec 2014 03:36:55 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wb9sm1703380wic.20.2014.12.12.03.36.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Dec 2014 03:36:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Dec 2014 12:36:57 +0100
Message-Id: <1418384217-22855-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [meta-oe][PATCH] xf86-video-glamo: fix build with xserver 1.16
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
X-List-Received-Date: Fri, 12 Dec 2014 11:36:56 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-glamo.h-use-const-for-jbt6k74_state_path.patch | 29 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-glamo_git.bb            |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0004-glamo.h-use-const-for-jbt6k74_state_path.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0004-glamo.h-use-const-for-jbt6k74_state_path.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0004-glamo.h-use-const-for-jbt6k74_state_path.patch
new file mode 100644
index 0000000..a820371
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0004-glamo.h-use-const-for-jbt6k74_state_path.patch
@@ -0,0 +1,29 @@
+From 180a00634f351a09ceabc5695d8e1acc3e585501 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 12 Dec 2014 12:00:10 +0100
+Subject: [PATCH] glamo.h: use const for jbt6k74_state_path
+
+* fix build issue with xserver 1.16:
+  glamo-driver.c:501:32: error: assignment discards 'const' qualifier from pointer target type [-Werror]
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/glamo.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/glamo.h b/src/glamo.h
+index 5fd5c04..5e072be 100644
+--- a/src/glamo.h
++++ b/src/glamo.h
+@@ -148,7 +148,7 @@ typedef struct {
+ #endif
+ 
+ #ifdef JBT6K74_SET_STATE
+-    char *jbt6k74_state_path;
++    const char *jbt6k74_state_path;
+     char saved_jbt6k74_state[14];
+ #endif
+ 
+-- 
+2.1.3
+
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 38c12f3..78c6564 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;branch=master \
            file://0001-fix-build-with-KMS-disabled.patch \
            file://0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch \
            file://0001-glamo-driver-remove-references-to-mibstore.patch \   
+           file://0004-glamo.h-use-const-for-jbt6k74_state_path.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.1.3


