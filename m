Return-Path: <gary.robertson@linaro.org>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 86AC07221D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 22:59:53 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id gq1so7893675obb.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 14:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LTeAPBihl1e5gZ2L6nHQxMjTeGVckKnq+PDgaBO+rJ8=;
	b=Psk9M1TFgtlZsto8qW0jda+CEWgakjuzpqZjr6JcB14jvilBHrMfcKIPqTswK17AsJ
	kAUs9SsKfvAs0TqgRQqBKi+P8ZePqXSLJV/cb9j96ZgCNQ/VwJuSXuh2M0WYXcvBLXBy
	2567CxpjID0wTi2KFd9XjHVci1NG5sBT4XlA0VV3sT5N0g7omPSniaRxYwPLyEsxouHL
	QJecoLsJKrZByg7wuSWWHijCQgs+hlas1E5yA9+WyReZZLfmSyMxxSs8/sP3rAbG+wNN
	iSZDXL5b6R3Gq1a7kRWyZnnxqa948zswTYgMzxGh/GTsLXKtM/5/vY29rIwJ65fzJr46
	Q0/g==
X-Gm-Message-State: ALoCoQlAKzUYSVO7UFBLWlPXroI8JJ2wphVWW2RajGiX2WXk1fqtAH3dYFcUlQ7aaVWPbO9DS9z+
X-Received: by 10.182.216.137 with SMTP id oq9mr13331571obc.70.1416869994096; 
	Mon, 24 Nov 2014 14:59:54 -0800 (PST)
Received: from honkintosh.cybertech.lan (65-120-133-114.dia.static.qwest.net.
	[65.120.133.114])
	by mx.google.com with ESMTPSA id n7sm6298616obh.25.2014.11.24.14.59.52
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Nov 2014 14:59:53 -0800 (PST)
From: "Gary S. Robertson" <gary.robertson@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Nov 2014 16:59:14 -0600
Message-Id: <1416869955-13519-3-git-send-email-gary.robertson@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
References: <1416869955-13519-1-git-send-email-gary.robertson@linaro.org>
Subject: [meta-oe][PATCH 2/3] libhugetlbfs: Make cross-devel recognize all ix86 arches
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
X-List-Received-Date: Mon, 24 Nov 2014 22:59:58 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

In a non-native cross-development scenario, the Makefile
only recognized i386 or x86_64 PC architectures.
Extended this to also recognize i486, i586, and i686

Upstream Status: Accepted but not yet applied by libhugetlbfs project

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
---
 .../0001-Makefile-Recognize-all-ix86-arches.patch  |   32 ++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |    1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Makefile-Recognize-all-ix86-arches.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Makefile-Recognize-all-ix86-arches.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Makefile-Recognize-all-ix86-arches.patch
new file mode 100644
index 0000000..2718275
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Makefile-Recognize-all-ix86-arches.patch
@@ -0,0 +1,32 @@
+From a0166583ba5f7b6a6d2de434f633126fb12c9d29 Mon Sep 17 00:00:00 2001
+From: "Gary S. Robertson" <gary.robertson@linaro.org>
+Date: Wed, 24 Sep 2014 15:27:31 -0500
+Subject: [PATCH] Makefile: Recognize all ix86 arches
+
+In a non-native build scenario, the makefile
+only recognized i386 or x86_64 arches.  Added support
+to recognize i486, i586, i686.
+
+Upstream Status: Accepted by libhugetlbfs project
+
+Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 91502e1..0bfaee8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -71,7 +71,7 @@ ELF64 = aarch64elf
+ TMPLIB64 = lib64
+ CUSTOM_LDSCRIPTS = no
+ else
+-ifeq ($(ARCH),i386)
++ifneq (,$(filter i386 i486 i586 i686,$(ARCH)))
+ CC32 = $(CC)
+ ELF32 = elf_i386
+ TMPLIB32 = lib
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 737acb9..5111935 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://0001-aarch64-fix-page-size-not-properly-computed.patch \
     file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
     file://0001-Extend-arm32-support-to-include-BE-variants.patch \
+    file://0001-Makefile-Recognize-all-ix86-arches.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


