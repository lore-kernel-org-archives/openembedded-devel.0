Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7B5713B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:47 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id eu11so14794071pac.39
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=1dzvNuKIogck966ctGZTwWKO/f6Gwofk6jmComodNxo=;
	b=wOoxwMQRPmhCB2EpQwy3Uh+1WajIg0h7oYFn0hDZ2Ixr2w8hf2c1K+vRQaXRHs+jcR
	ogRo97Ng3+SQdqCszWCg8LQaN+EMKxyEGc15s/yLf0DzvHHaJZVfsawwWq9zlP1Kmkk0
	P+LU6hJlGTSj4k0JVRnjvRpTZsrxtzOTmioAuZeymMtcNH0DYbBRYhP90FZ2yLdbacSF
	el+M5EEJsRZpzwpmrBtQM+Iq7b6vyS8IxLijl5UvQjqAeXQFjZ/iYuF8HYpTeV/Wy2Hy
	oLhbvFSa/ngFTR6elgmCosPvUJq7LdHIRrn0UGbx3jaTQwXlQOKMuZue5Benx05d//ja
	+IXw==
X-Received: by 10.66.164.234 with SMTP id yt10mr76338534pab.110.1419700968035; 
	Sat, 27 Dec 2014 09:22:48 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:05 -0800
Message-Id: <2b524c31f7b1750e7976284b099f24c9c196c876.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 18/27] libhugetlbfs: Make cross-devel recognize all ix86 arches
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:49 -0000

From: "Gary S. Robertson" <gary.robertson@linaro.org>

In a non-native cross-development scenario, the Makefile
only recognized i386 or x86_64 PC architectures.
Extended this to also recognize i486, i586, and i686

Upstream Status: Accepted but not yet applied by libhugetlbfs project

Signed-off-by: Gary S. Robertson <gary.robertson@linaro.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Makefile-Recognize-all-ix86-arches.patch  | 32 ++++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |  1 +
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
index c2262ea..c906217 100644
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
1.9.1


