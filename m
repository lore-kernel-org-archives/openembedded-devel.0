Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CC93F71C30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:43 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id s8so1421561pfj.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2qddh/1R8PlSzjRd2PaKPURL5dit8eNb6eA7dYW5TRM=;
	b=CIyTPc/33b2BULTQkLbf7hFeh1pAmNT0/8jsFnDRxIsM6j8lB6y+4bYJMnkJfjQLdo
	bha131pIO/mCBBJIWbg1267FDllPp1VQWj8Q8m7zqN1kPXQVVxjPbA5WSuJiNzkwg7/w
	SXsr9mvLBj4cVUG5N5F3ITyQ3RrVHM+1AI88t+y/wc1tg6JR4BXxeDW4DfTuEXQ0Q1ng
	nB0otn1nnvwhl5nzcHBsuG6ht2rcV9j3zMejtQAZs+qMyhwy5cgau3M6Mns7S3i83rdP
	swp1+igZrgEAcvjSzanKIsy9KtbNdd1FyhLmn5FLwUU7z78BOIrU79e9ve7AtihjaxWf
	Endg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2qddh/1R8PlSzjRd2PaKPURL5dit8eNb6eA7dYW5TRM=;
	b=l+B9cV7N1o1A8Ij59E2lLURsmQXUE9i8lAwTa+BsQu+9DWCQYU8R8i0MXxmGNGPQKu
	IWs5rwQF8Ql2lDazD7HuNX+3xzx+bv6gtk3htLPHhScQU4P7tVQapMQdLSkkW8UKrvSV
	0zKgy0hMM1hjeIs5MESUIL0aF34dOJtUDsFO0oscE1QbBLj1+4uoOqvzxIaVMV/ErPVO
	C/lwHZfiBVIGZzTtHTUpa2OFfXMDNCfKawQGtrB/TzI6Y/DGUEs7VZcjSa1iaRzDOjQ9
	6yV3YveCTAPscDkSaPecKPW5JJCRaFZXdmCd4FIOs/aYr/G0YTjR+2UPfsMiMBpbFGRl
	i4vw==
X-Gm-Message-State: AA6/9RnFR+xw6APuUCIuytgsiZh9tq6L1e3zI4xe02Q6HM40sVE6+uuRGwn43uIhKyWvoQ==
X-Received: by 10.98.66.149 with SMTP id h21mr7778267pfd.32.1476855525136;
	Tue, 18 Oct 2016 22:38:45 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:22 -0700
Message-Id: <20161019053834.11523-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/16] libplist: Squash warnings found by clang
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-Fix-warnings-found-with-clang.patch | 51 ++++++++++++++++++++++
 .../libimobiledevice/libplist_1.8.bb               |  3 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libimobiledevice/files/0001-Fix-warnings-found-with-clang.patch

diff --git a/meta-oe/recipes-extended/libimobiledevice/files/0001-Fix-warnings-found-with-clang.patch b/meta-oe/recipes-extended/libimobiledevice/files/0001-Fix-warnings-found-with-clang.patch
new file mode 100644
index 0000000..f8114a0
--- /dev/null
+++ b/meta-oe/recipes-extended/libimobiledevice/files/0001-Fix-warnings-found-with-clang.patch
@@ -0,0 +1,51 @@
+From ad1be542b87b3186f8ef7bee2c594daefe5bb4c8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 18 Oct 2016 21:31:40 +0000
+Subject: [PATCH] Fix warnings found with clang
+
+| /mnt/oe/openembedded-core/build/workspace/sources/libplist/src/base64.c:107:12: error: non-void function 'base64decode' should return a value [-Wreturn-type]
+|         if (!buf) return;
+|                   ^
+| /mnt/oe/openembedded-core/build/workspace/sources/libplist/src/base64.c:109:16: error: non-void function 'base64decode' should return a value [-Wreturn-type]
+|         if (len <= 0) return;
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcnary/node.c | 2 +-
+ src/base64.c    | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libcnary/node.c b/libcnary/node.c
+index 1f9f669..d6f3f63 100644
+--- a/libcnary/node.c
++++ b/libcnary/node.c
+@@ -104,7 +104,7 @@ int node_detach(node_t* parent, node_t* child) {
+ 
+ int node_insert(node_t* parent, unsigned int index, node_t* child)
+ {
+-	if (!parent || !child) return;
++	if (!parent || !child) return -1;
+ 	child->isLeaf = TRUE;
+ 	child->isRoot = FALSE;
+ 	child->parent = parent;
+diff --git a/src/base64.c b/src/base64.c
+index 65c6061..531a06a 100644
+--- a/src/base64.c
++++ b/src/base64.c
+@@ -104,9 +104,9 @@ static int base64decode_block(unsigned char *target, const char *data, size_t da
+ 
+ unsigned char *base64decode(const char *buf, size_t *size)
+ {
+-	if (!buf) return;
++	if (!buf) return 0;
+ 	size_t len = strlen(buf);
+-	if (len <= 0) return;
++	if (len <= 0) return 0;
+ 	unsigned char *outbuf = (unsigned char*)malloc((len/4)*3+3);
+ 
+ 	unsigned char *line;
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
index 6e8d69f..10d40fb 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
@@ -10,7 +10,8 @@ inherit cmake pkgconfig
 
 SRC_URI = "http://www.libimobiledevice.org/downloads/libplist-${PV}.tar.bz2 \
            file://fix-parallel-make.patch \
-"
+           file://0001-Fix-warnings-found-with-clang.patch \
+           "
 
 SRC_URI[md5sum] = "2a9e0258847d50f9760dc3ece25f4dc6"
 SRC_URI[sha256sum] = "a418da3880308199b74766deef2a760a9b169b81a868a6a9032f7614e20500ec"
-- 
2.10.0


