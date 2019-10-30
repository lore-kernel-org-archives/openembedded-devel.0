Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 132177FB21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 10:52:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4734zp365Pz8V
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 11:52:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572432774;
	bh=t4tlr88rE8PyNIiKKXq6Q1ARilYBWOWJjVtxbOUwdEY=;
	h=From:To:Subject:Date:From;
	b=f8iFaGEnFNNuU+McrdcfbbIRavVxjzV2SqlngmJ2dOspTTyj9OENFXLS7zdYm6QN6
	cNBE8XA3vR8u4uJtCrkzR6qqVYOajfT9CUAMwPk+2TS4Q+gDtYbYtNwFFvdHLKg5/D
	rxkq+MtxwCuC9ApNxxVQh4fisdzYPk77G8V4XbPrCjOlP7hGRHjE9SuK+8lmJy3abW
	C5PrZaRkqZOr7Jjlj3an7F5YYmo4eHFnoh2XNyKMY2eduBa5e2anSgCEAkNHET8GwA
	QYLz+0ixVp3lOoyX3RMu/l1WgS7fQoEANaO5UhU1WFdBWdoyAwhtNTRp7FuN3K7oxJ
	RjmEfV1Q1N2zi0Z2YMQDHL7fC0z4ZIPEHktxxhi1xfdFN7MQndHyZwThhXt4ThTkem
	eXuQoAbT+nyMo4dy9tsgzCWYl36PvRsmydEfUOR5AMRLyUME5yQ/IteUe5hF4kVM6Q
	SAp8xQcgyOVnC010Bq6bY84QM++h/6IEkQ2TvKLJ23A1I3wWWPFjY0nLIkSyTXSOQs
	847S2jn6Rea4XVGAiWvcrWdT9Xs1hiJlrGGIZv37feFt9cxJLXO0AvBMlMxnZsVi99
	fbnKNw0cF0dGftIT8WW2/SI/S1BNI1FRl55oceQyMLuvHS87YNepQRKKET8fDKKA3F
	oJ4pmWrODMjWywXhO4tJK3sM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Oct 2019 12:52:51 +0200
Message-Id: <20191030105252.17982-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] poco: Upgrade 1.9.0 -> 1.9.4
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
X-List-Received-Date: Wed, 30 Oct 2019 10:52:54 -0000

Removed patch for issue fixed upstream.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...riscv64-by-Manuel-A.-Fernandez-Monte.patch | 41 -------------------
 .../poco/{poco_1.9.0.bb => poco_1.9.4.bb}     |  3 +-
 2 files changed, 1 insertion(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poco/poco/0001-Support-of-arch-riscv64-by-Manuel-A.-Fernandez-Monte.patch
 rename meta-oe/recipes-support/poco/{poco_1.9.0.bb => poco_1.9.4.bb} (97%)

diff --git a/meta-oe/recipes-support/poco/poco/0001-Support-of-arch-riscv64-by-Manuel-A.-Fernandez-Monte.patch b/meta-oe/recipes-support/poco/poco/0001-Support-of-arch-riscv64-by-Manuel-A.-Fernandez-Monte.patch
deleted file mode 100644
index 72d89d09b..000000000
--- a/meta-oe/recipes-support/poco/poco/0001-Support-of-arch-riscv64-by-Manuel-A.-Fernandez-Monte.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From ed04c97abe015a226269de391e36c4d251292725 Mon Sep 17 00:00:00 2001
-From: Francis ANDRE <francis.andre.kampbell@orange.fr>
-Date: Sun, 6 May 2018 12:28:25 +0200
-Subject: [PATCH] Support of arch riscv64 by Manuel A. Fernandez Montecelo
- <mafm@debian.org>
-
----
- Foundation/include/Poco/Platform.h | 6 +++++-
- Foundation/src/utils.h             | 1 +
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
---- a/Foundation/include/Poco/Platform.h
-+++ b/Foundation/include/Poco/Platform.h
-@@ -134,6 +134,7 @@
- #define POCO_ARCH_NIOS2   0x0e
- #define POCO_ARCH_AARCH64 0x0f
- #define POCO_ARCH_ARM64   0x0f // same as POCO_ARCH_AARCH64
-+#define POCO_ARCH_RISCV64 0x10
- 
- 
- #if defined(__ALPHA) || defined(__alpha) || defined(__alpha__) || defined(_M_ALPHA)
-@@ -224,6 +225,9 @@
- #elif defined(__AARCH64EB__)
- 	#define POCO_ARCH POCO_ARCH_AARCH64
- 	#define POCO_ARCH_BIG_ENDIAN 1
-+#elif defined(__riscv) && (__riscv_xlen == 64)
-+	#define POCO_ARCH POCO_ARCH_RISCV64
-+	#define POCO_ARCH_LITTLE_ENDIAN 1
- #endif
- 
- 
---- a/Foundation/src/utils.h
-+++ b/Foundation/src/utils.h
-@@ -63,6 +63,7 @@
-     defined(__SH4__) || defined(__alpha__) || \
-     defined(_MIPS_ARCH_MIPS32R2) || \
-     defined(__AARCH64EL__) || \
-+    defined(__riscv) || \
-     defined(nios2) || defined(__nios2) || defined(__nios2__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(_M_IX86) || defined(__i386__) || defined(__i386)
diff --git a/meta-oe/recipes-support/poco/poco_1.9.0.bb b/meta-oe/recipes-support/poco/poco_1.9.4.bb
similarity index 97%
rename from meta-oe/recipes-support/poco/poco_1.9.0.bb
rename to meta-oe/recipes-support/poco/poco_1.9.4.bb
index 70b251034..212abe29b 100644
--- a/meta-oe/recipes-support/poco/poco_1.9.0.bb
+++ b/meta-oe/recipes-support/poco/poco_1.9.4.bb
@@ -11,10 +11,9 @@ DEPENDS = "libpcre zlib"
 SRC_URI = " \
     git://github.com/pocoproject/poco.git;branch=poco-${PV} \
     file://0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch \
-    file://0001-Support-of-arch-riscv64-by-Manuel-A.-Fernandez-Monte.patch \
     file://run-ptest \
    "
-SRCREV = "daf00da73ab917e4d4581e3aa00c0ee61e0cc58b"
+SRCREV = "b95393dcc3640807838e8323b4e600e54d2e8116"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


