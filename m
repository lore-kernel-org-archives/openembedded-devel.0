Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE63C35FFF
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 09:57:09 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.17545.1742551012873430897
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Mar 2025 02:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zgh9B4O1;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaecf50578eso353483866b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 02:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742551011; x=1743155811; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZl6mRp+1dNhciCBcY0erKBZMi85JFumFk8m8wZrE7A=;
        b=Zgh9B4O1345pm8ZKZ4ipLC+6zhYVAO5N3vwQPizE4ozp7CFeogf7SnVKmvJcnWtpeY
         TTC49lrqgEtCdhIzSSLs6nz7Jy06iW9FzWK4aNP+2sEHQHyUuDzxA84z2as/oQjlJkke
         KiyhqITjtVGdQbYuCvYFNdiK2JqlwIq3VAwaoZfVtFDIV38HlaXchM7mo/uePf3uhwsz
         Nek2HJO+a5QwXelAZMT1py/axFxK03gZ9yO/EZ1Ov0X4AkFK5NnVsecxAnFVpVwbCgGh
         pvQIrceSnpg8O+w9w3j3Wtz62Ml/9yqzi0+7B/xG6qU+0lRJi6RgG2k5oPeV2oTR6PGY
         wWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742551011; x=1743155811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZl6mRp+1dNhciCBcY0erKBZMi85JFumFk8m8wZrE7A=;
        b=lQqCaxdT3VTdZhQ5jBxOPRETwc58j6UruYhpGnJpjKTsf1YUXJTDfdTGN0alfOIujE
         Og6qWsexbZ43OH2oWepXROdPXQ9RVw1TvFJaZCFYNIUaB6zEghodQWLNt7T28KGUDq2Q
         6BGB3gUmCcrxVPF5DCZGMW1iZHVcFw24tnF0knDyjXhiJ5QR4xzThBb53CcE8UuuYx8m
         4BFv4oFATWGm3C04PqrGb4HTVrGSLeEH8qRpOhR3mwBbTB164SUpedegtJSkTND6/u6+
         Od1pNjL/z+MxBGEO+kCKmZxSmqWuifS3J78s4CXoF2VAjkZk2EgtCrShslxEzbNUwyQZ
         z+vg==
X-Gm-Message-State: AOJu0YyMEsH2VFzdOA2R8yI/rvJHq1Sc5j9RUy8wSwcw0uBgIhH7+QwC
	26eQeqtXz9hjkG6HDUikAUfDTgaNlTwDz4ci4/j4/wdeHDKLSaEDJj9qiQ==
X-Gm-Gg: ASbGnctLbX3z3V+M6foQ3GesLXkP0/2t9EcYirRutDiQBVhu2iDALeNJTiW68jAwJay
	toHXRMgLcpIAxptysZH3twigYAoFj2Cf16dSGFGvEx+OW3bLLq+tB44/XCyl97jPETHigkEam0O
	KtO8my2SRdZj4RWWZ8m422CaRDzSSeDv4H7es7Wd6y28K6qIsTlAoT5NuYEHVlAWfaQMj8NFJeT
	uZKY3RQFBkSBOrUhElSXNK1xPjhyS2ALNWFh8SA6FiXGKzI9ZXq6exPIaYNx6w2M08wJJDvOQam
	5gXMGas3j4YV0v6wm90a2thONQ7V5OCh7Hi5uHXgNfaLZyxZNDfS9mVqOmncFzi0jVguyRA8TYA
	T2XHXa4A7NzOo
X-Google-Smtp-Source: AGHT+IHO5ltYnqvX95/2x4P8k+RiJeT+sdGLmRaDNPYotwBT2hw92vSEEQ2PLkygH+tu2slQuQMgQg==
X-Received: by 2002:a17:906:d7cc:b0:ac3:c4a0:c525 with SMTP id a640c23a62f3a-ac3f25300fcmr275409366b.51.1742551010923;
        Fri, 21 Mar 2025 02:56:50 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac3efb64895sm119257966b.113.2025.03.21.02.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 02:56:50 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] android-tools: fix build with gcc-15
Date: Fri, 21 Mar 2025 10:56:40 +0100
Message-ID: <20250321095640.1847235-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250321095640.1847235-1-martin.jansa@gmail.com>
References: <20250321095640.1847235-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Mar 2025 09:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116180

From: Martin Jansa <martin.jansa@gmail.com>

* fixes build with gcc-15:
  http://errors.yoctoproject.org/Errors/Details/848455/

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...unused-parameter-from-allocate_inode.patch | 69 +++++++++++++++++++
 .../android-tools/android-tools_5.1.1.r37.bb  |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/extras/0003-ext4_utils-drop-unused-parameter-from-allocate_inode.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/extras/0003-ext4_utils-drop-unused-parameter-from-allocate_inode.patch b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0003-ext4_utils-drop-unused-parameter-from-allocate_inode.patch
new file mode 100644
index 0000000000..b77c0ebc13
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/extras/0003-ext4_utils-drop-unused-parameter-from-allocate_inode.patch
@@ -0,0 +1,69 @@
+From c9f8cb184a7218c97ff966db44da6dd814c0e273 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 21 Mar 2025 09:49:32 +0000
+Subject: [PATCH] ext4_utils: drop unused parameter from allocate_inode()
+
+* fixes build with gcc-15:
+  http://errors.yoctoproject.org/Errors/Details/848455/
+
+TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extras/ext4_utils/contents.c: In function 'make_directory':
+TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extras/ext4_utils/contents.c:115:29: error: too many arguments to function 'allocate_inode'; expected 0, have 1
+  115 |                 inode_num = allocate_inode(info);
+      |                             ^~~~~~~~~~~~~~ ~~~~
+In file included from TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extras/ext4_utils/contents.c:32:
+TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extras/ext4_utils/allocate.h:61:5: note: declared here
+   61 | u32 allocate_inode();
+      |     ^~~~~~~~~~~~~~
+TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extras/ext4_utils/contents.c: In function 'make_file':
+TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extras/ext4_utils/contents.c:183:21: error: too many arguments to function 'allocate_inode'; expected 0, have 1
+  183 |         inode_num = allocate_inode(info);
+      |                     ^~~~~~~~~~~~~~ ~~~~
+TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extras/ext4_utils/allocate.h:61:5: note: declared here
+   61 | u32 allocate_inode();
+      |     ^~~~~~~~~~~~~~
+TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extras/ext4_utils/contents.c: In function 'make_link':
+TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extras/ext4_utils/contents.c:218:21: error: too many arguments to function 'allocate_inode'; expected 0, have 1
+  218 |         inode_num = allocate_inode(info);
+      |                     ^~~~~~~~~~~~~~ ~~~~
+TOPDIR/tmp/work/core2-64-oe-linux/android-tools/5.1.1.r37/git/system/extras/ext4_utils/allocate.h:61:5: note: declared here
+   61 | u32 allocate_inode();
+      |     ^~~~~~~~~~~~~~
+make: *** [<builtin>: contents.o] Error 1
+
+Upstream-Status: Pending [this whole code was removed in newer version android-9.0.0_r1 https://android.googlesource.com/platform/system/extras/+/7a837fcd6e9c0e0219f743052c78cc1c5988dfaf]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ ext4_utils/contents.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ext4_utils/contents.c b/ext4_utils/contents.c
+index 3144de93f..ac1b71706 100644
+--- a/ext4_utils/contents.c
++++ b/ext4_utils/contents.c
+@@ -112,7 +112,7 @@ u32 make_directory(u32 dir_inode_num, u32 entries, struct dentry *dentries,
+ 	len = blocks * info.block_size;
+ 
+ 	if (dir_inode_num) {
+-		inode_num = allocate_inode(info);
++		inode_num = allocate_inode();
+ 	} else {
+ 		dir_inode_num = EXT4_ROOT_INO;
+ 		inode_num = EXT4_ROOT_INO;
+@@ -180,7 +180,7 @@ u32 make_file(const char *filename, u64 len)
+ 	struct ext4_inode *inode;
+ 	u32 inode_num;
+ 
+-	inode_num = allocate_inode(info);
++	inode_num = allocate_inode();
+ 	if (inode_num == EXT4_ALLOCATE_FAILED) {
+ 		error("failed to allocate inode\n");
+ 		return EXT4_ALLOCATE_FAILED;
+@@ -215,7 +215,7 @@ u32 make_link(const char *link)
+ 	u32 inode_num;
+ 	u32 len = strlen(link);
+ 
+-	inode_num = allocate_inode(info);
++	inode_num = allocate_inode();
+ 	if (inode_num == EXT4_ALLOCATE_FAILED) {
+ 		error("failed to allocate inode\n");
+ 		return EXT4_ALLOCATE_FAILED;
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index 7c27efb093..fe915c3e30 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -48,6 +48,7 @@ SRC_URI = " \
     file://core/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch;patchdir=system/core \
     file://extras/0001-ext4_utils-remove-selinux-extensions.patch;patchdir=system/extras \
     file://extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch;patchdir=system/extras \
+    file://extras/0003-ext4_utils-drop-unused-parameter-from-allocate_inode.patch;patchdir=system/extras \
     file://libselinux/0001-Remove-bionic-specific-calls.patch;patchdir=external/libselinux \
     file://libselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch;patchdir=external/libselinux \
     file://android-tools-adbd.service \

