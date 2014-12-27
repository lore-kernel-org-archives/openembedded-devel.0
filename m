Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id D5447726D7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:23:04 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so14543846pdi.35
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=ysh2M6QyQ4mXDOk79qeMjJQf75hLKAVufTJrdIIylhU=;
	b=Q5U7FriZgaX+MBwcSs6pVeQak6+T6t1srY3r6gxFJS1vJRB688f0C7CMLH8BOp7YxO
	OWz7R5uXX/tbPjbdrgvwZweCW9WefN4s0B1iEnC9NmuANy84SG57+csk05rpD2UvyyYN
	S6rINtu8D0ilMifVb7LIoh6PO6nvMkHLKQM8fa7cVSJyfu/RPlT2wBdKXkO7Ujh5Mc5b
	shHndlFUHJyMC1ZY3KcjlkFdwJHyojS0p+BsnFSQsRsh/veER4+2ZLCm2xHPxMaVOPOh
	sEMnE5Z+2fj3xafhnGohy5DcLWfHEgL+uqjHBDD3/Z6DfzxX9sQbBdHEk9hz8vcUMGlX
	ofvQ==
X-Received: by 10.66.141.42 with SMTP id rl10mr25964238pab.100.1419700985637; 
	Sat, 27 Dec 2014 09:23:05 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.23.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:23:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:14 -0800
Message-Id: <8769665d9efb22405435d730c01c1a41d7251b29.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 27/27] xf86-video-glamo: fix build with xserver 1.16
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
X-List-Received-Date: Sat, 27 Dec 2014 17:23:05 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


