Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id CA4A37054E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Oct 2014 17:13:35 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id cc10so2636808wib.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Oct 2014 10:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jGgYItUpDWJjD6tJHN67u0hGJegQJ2jUwPLJA1nyS+0=;
	b=rJ0ee+g9ITOmf8cCjZ9HIHrjVEN1/8UOVj1STfypW8ilYjlWHQlYB9Mc7fqFhel3fq
	KpYVrmj9SM0enK7tNqSJJ8VQSguyfuGG9obRzwtuTwcGQw4eoMgIUxb258FXAJZRKmpP
	UYWEBTouENgBRiAIpnXjd7eVHZSMsfOHHmQRKsPFTz1LAHSgWtrhHqtbiAG9JR3JW7jj
	58igccc3V803CgMGhxBHCeJ9o9KbW4ZSuXD6+PjaYOAuUQsJYehROzs1nKk+QCC594hU
	NV0l+BW9EYKip0pVSYOmeoZC6Z7ro0Ma3hfR+m8u25Wbl1+oqR/OwZ4OVbrGzMHyoQxA
	jCYA==
X-Received: by 10.180.186.230 with SMTP id fn6mr13806956wic.44.1412529216517; 
	Sun, 05 Oct 2014 10:13:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ua8sm14526159wjc.7.2014.10.05.10.13.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Oct 2014 10:13:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Oct 2014 19:14:32 +0200
Message-Id: <1412529272-10914-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412529272-10914-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412529272-10914-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 3/3] xf86-video-geode: fix build with new glibc-2.20
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
X-List-Received-Date: Sun, 05 Oct 2014 17:13:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...1-Add-config.h-include-to-src-lx_memory.c.patch | 41 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-geode_2.11.16.bb        |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch
new file mode 100644
index 0000000..fcd2f68
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode/0001-Add-config.h-include-to-src-lx_memory.c.patch
@@ -0,0 +1,41 @@
+From 621d946e56efac2c779b83b1a5c6b645169c4ebd Mon Sep 17 00:00:00 2001
+From: "Brian A. Lloyd" <brian.lloyd@familyhonor.net>
+Date: Wed, 1 Oct 2014 12:35:18 +0300
+Subject: [PATCH] Add config.h include to src/lx_memory.c
+
+The src/lx_memory.c file uses the xf86.h header file.  This file must have
+HAVE_STRNDUP defined before calling it when the building platform has a strndup
+function.  When using config.h, this file doesn't have that define and so fails
+to compile.
+
+The attached patch adds the conditional config.h to this file so it may compile
+on the affected platforms.
+
+The patch is trivial and may be included and used under whatever licensing
+desired.
+
+Closes: Free Desktop Bug #84541
+
+Signed-off-by: Brian A. Lloyd <brian.lloyd@familyhonor.net>
+Upstream-Status: Backport
+---
+ src/lx_memory.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/lx_memory.c b/src/lx_memory.c
+index f26d280..992446f 100644
+--- a/src/lx_memory.c
++++ b/src/lx_memory.c
+@@ -22,6 +22,9 @@
+  * contributors may be used to endorse or promote products derived from this
+  * software without specific prior written permission.
+  */
++#if HAVE_CONFIG_H
++#include "config.h"
++#endif
+ 
+ #include "xf86.h"
+ #include "geode.h"
+-- 
+2.1.1
+
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
index 4e8df46..478d088 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e7f3e39474aeea5af381a8e103dafc36"
 SUMMARY = "X.org server -- Geode GX2/LX display driver"
 PR = "${INC_PR}.0"
 
+SRC_URI += "file://0001-Add-config.h-include-to-src-lx_memory.c.patch"
 SRC_URI[md5sum] = "35fa387f6a33f6b22a56ce4bda424392"
 SRC_URI[sha256sum] = "38fc1f55e29fb7985b90c9021a4b7e5295d42888bd669174f42f3b7f681fc1a7"
 
-- 
2.1.1


