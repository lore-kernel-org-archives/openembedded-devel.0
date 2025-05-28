Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03C06C5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 13:22:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.15477.1748438525581246023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 May 2025 06:22:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Sa0RfxiQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C0A1439AE;
	Wed, 28 May 2025 13:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748438523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JX71z6fiklsYKq4fwDRJYnZSkqMuMmEdaL4ALfcC/+g=;
	b=Sa0RfxiQGru14BW3s3e4Qx/uxjLnaYIuDkQgWKDw+6i4juGU+U21Hwcxxp02yTLfRxOlu5
	dkIRQDxJLvEEmLkXf5G7sl0wd4XeaqfL/EbH8iojtBv3zFyeRotCQOUIN3+YapnbUijCsW
	Tp882rXs5aW6MkOj49d47FEJQBWS8lk5NHAnon/HO4ZdEPaeb7ndbFdLqaSjmdnaZojFYm
	KEiyd+qnLJWnbiR4UKWdgd/+gODq5s9KthxswKtgyx8VgmVH3oasI6zqL+LYpIUvKFozG3
	5SJp/GEhAyQIgrn8DdWPi+LMlTV40bfoQbvok674uo47rq2smiMR91oiOJ5EZA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 28 May 2025 15:21:50 +0200
Subject: [meta-oe PATCH v3] cryptopp: add a recipe for version 8.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-add-cryptopp-v3-1-6ad49cdb41bb@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAO0NN2gC/3XMQQ6CMBCF4auQWVvDTLFQV97DuIBSpInSpm0aC
 eHuFlZq4vK95PsXCNobHeBcLOB1MsHYKQ9+KECN7XTXzPR5A5VUIRKytu+Z8rOL1jk21E0tq05
 LwRVk4rwezGvPXW95jyZE6+e9nnB7/4QSMmRc8IZaUSqtuktnbXyY6ajsE7ZUok9OP5wyR1mdR
 CloqCV+83Vd30As2j3pAAAA
X-Change-ID: 20241121-add-cryptopp-f78794be963c
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Martin Jansa <martin.jansa@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6375;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Atj1JVu+GoWfoomorYmZsn1iLsTNZCvVYZEVfqtgmMc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoNw37zZJlTus9aRdrJYm6qtWt6ye32KRbdtbQB
 CJL8KvboMCJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaDcN+wAKCRDRgEFAKaOo
 NlO6D/9pZ6wQ7+9e7/pi13CKrARzg0EPl8eOxgV1y1xT0o4V3p5VDPCr2eHDDqWlTgMJm3GjhC/
 qaeWpLBZVuQtIjWr7VRZDQKYHuMxhe/3b8wl+yMfwmK4PDpcRJ0IcHBMLUOAFLFUmajzAlO1wg9
 p4WTVnA8yOp0hjWwI6VCgqgAfekfGwcdXncoYqeaaqH4GB8aB/ROVuLE8uHm8f9na8vdGPA+3Fz
 6g9GYIENvetbbvKDunnbQA1V69z90+9JnFTrSx/RJHqRJjkqUlG0mo2WfCe+XwETlJH+rxMa6Ry
 1t4LTLWYupchf1XOfEl1wKUA24hLJ+FhvVt4kzmBcRm/FV5jijw5ANHIaTUVntP49GuFZScw08H
 4aDNyv+LkoccdLc7MavqSaD9Ffji2fayb+Izt7rWJkKVcMbDKanG6FqvxmirPNXMSny2hrtcXNS
 pLi/bOkjPJ0aOyXGheqCOVWKnMtENzDYBZPdWV6o+forfVGurMYe/F7IP1DjFdplWE2ue13oLEs
 0u8xb1reYBR/UycTeh6JP1gbinZb82hgc8UgyPvOC40KOgnEQNesgXNaiQzTunUViNF2L9gp/M2
 L1UT0N62zXENbCfVE+tlLsDmWgSZ1hp7NdJ1g8OPXY1O29AGYgwlnd5l0UFyqRKcUHyGTwzQ7lg
 Y8miP7scMpU3hmQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeefieculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeetnhhtohhnihhnucfiohgurghrugcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffggfffudekfeetuedtueehkedvjedtgfekveetgfffueekfedtjeeujeefveetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdgtrhihphhtohhpphdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeisgelleemvghfheegmedvtdgrfeemiehfgedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeisgelleemvghfheegmedvtdgrfeemiehfgedvpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopehmrghrthhinhdrjhgrnhhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehthhhomhgrs
 hdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 May 2025 13:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117647

Cryptopp is a library of cryptographic schemes written in C++.
Add a recipe for it in meta-oe/recipes-crypto.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Note: I had no issue building with MACHINE to "qemux86-64" and TCLIBC =
"musl", as reported here:
https://lore.kernel.org/r/CAMKF1sreBnjjX0GW-G9+15Y+EgFQUmKUPX_cqYE7J3WaZ9=94g@mail.gmail.com
Any extra steps to reproduce the issue would be appreciated.
---
Changes in v3:
- Add 0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch to fix the
  arm64 build issue.
- Revert UNPACKDIR -> WORKDIR.
- Use += not append.
- Link to v2: https://lore.kernel.org/r/20241122-add-cryptopp-v2-1-19456062f791@bootlin.com

Changes in v2:
- WORKDIR -> UNPACKDIR in S
- remove bb.utils.contains in CXXFLAGS:append:aarch64 (forgot to remove
  after adding aarch64 override)
- Link to v1: https://lore.kernel.org/r/20241121-add-cryptopp-v1-1-36382a60cecb@bootlin.com
---
 ...ix-arm-crypto-logic-issue-in-config_asm.h.patch | 57 ++++++++++++++++++++++
 meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb  | 45 +++++++++++++++++
 2 files changed, 102 insertions(+)

diff --git a/meta-oe/recipes-crypto/cryptopp/cryptopp-8.9.0/0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch b/meta-oe/recipes-crypto/cryptopp/cryptopp-8.9.0/0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch
new file mode 100644
index 0000000000..6200c575aa
--- /dev/null
+++ b/meta-oe/recipes-crypto/cryptopp/cryptopp-8.9.0/0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch
@@ -0,0 +1,57 @@
+From 553643dffef249ff70155ea4896d83649bc213a1 Mon Sep 17 00:00:00 2001
+From: Antonin Godard <antonin.godard@bootlin.com>
+Date: Tue, 27 May 2025 09:00:53 +0200
+Subject: [PATCH] Fix arm crypto logic issue in config_asm.h
+
+The current logic for enabling or disabling the CRYPTOPP_ARM_*_AVAILABLE
+macros seems wrong, because we do an OR between all of the conditions
+following `defined(__ARM_FEATURE_CRYPTO)`. Fix the logic so that the
+CRYPTOPP_ARM_*_AVAILABLE macros are set if __ARM_FEATURE_CRYPTO is set
+_AND_ any of the following condition is true.
+
+Upstream-Status: Submitted [https://github.com/weidai11/cryptopp/pull/1324]
+Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
+---
+ config_asm.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/config_asm.h b/config_asm.h
+index 71ffb9f8..d388124f 100644
+--- a/config_asm.h
++++ b/config_asm.h
+@@ -278,9 +278,9 @@
+ // Requires GCC 4.8, Clang 3.3 or Visual Studio 2017
+ #if !defined(CRYPTOPP_ARM_AES_AVAILABLE) && !defined(CRYPTOPP_DISABLE_ARM_AES)
+ # if defined(__aarch32__) || defined(__aarch64__) || defined(_M_ARM64)
+-#  if defined(__ARM_FEATURE_CRYPTO) || (CRYPTOPP_GCC_VERSION >= 40800) || \
++#  if defined(__ARM_FEATURE_CRYPTO) && ((CRYPTOPP_GCC_VERSION >= 40800) || \
+       (CRYPTOPP_LLVM_CLANG_VERSION >= 30300) || (CRYPTOPP_APPLE_CLANG_VERSION >= 40300) || \
+-      (CRYPTOPP_MSC_VERSION >= 1916)
++      (CRYPTOPP_MSC_VERSION >= 1916))
+ #   define CRYPTOPP_ARM_AES_AVAILABLE 1
+ #  endif  // Compilers
+ # endif  // Platforms
+@@ -290,9 +290,9 @@
+ // Requires GCC 4.8, Clang 3.3 or Visual Studio 2017
+ #if !defined(CRYPTOPP_ARM_PMULL_AVAILABLE) && !defined(CRYPTOPP_DISABLE_ARM_PMULL)
+ # if defined(__aarch32__) || defined(__aarch64__) || defined(_M_ARM64)
+-#  if defined(__ARM_FEATURE_CRYPTO) || (CRYPTOPP_GCC_VERSION >= 40800) || \
++#  if defined(__ARM_FEATURE_CRYPTO) && ((CRYPTOPP_GCC_VERSION >= 40800) || \
+       (CRYPTOPP_LLVM_CLANG_VERSION >= 30300) || (CRYPTOPP_APPLE_CLANG_VERSION >= 40300) || \
+-      (CRYPTOPP_MSC_VERSION >= 1916)
++      (CRYPTOPP_MSC_VERSION >= 1916))
+ #   define CRYPTOPP_ARM_PMULL_AVAILABLE 1
+ #  endif  // Compilers
+ # endif  // Platforms
+@@ -302,9 +302,9 @@
+ // Requires GCC 4.8, Clang 3.3 or Visual Studio 2017
+ #if !defined(CRYPTOPP_ARM_SHA_AVAILABLE) && !defined(CRYPTOPP_DISABLE_ARM_SHA)
+ # if defined(__aarch32__) || defined(__aarch64__) || defined(_M_ARM64)
+-#  if defined(__ARM_FEATURE_CRYPTO) || (CRYPTOPP_GCC_VERSION >= 40800) || \
++#  if defined(__ARM_FEATURE_CRYPTO) && ((CRYPTOPP_GCC_VERSION >= 40800) || \
+       (CRYPTOPP_LLVM_CLANG_VERSION >= 30300) || (CRYPTOPP_APPLE_CLANG_VERSION >= 40300) || \
+-      (CRYPTOPP_MSC_VERSION >= 1916)
++      (CRYPTOPP_MSC_VERSION >= 1916))
+ #   define CRYPTOPP_ARM_SHA1_AVAILABLE 1
+ #   define CRYPTOPP_ARM_SHA2_AVAILABLE 1
+ #  endif  // Compilers
diff --git a/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
new file mode 100644
index 0000000000..b1235d6b2c
--- /dev/null
+++ b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
@@ -0,0 +1,45 @@
+SUMMARY = "A C++ class library of cryptographic schemes"
+DESCRIPTION = "Crypto++ Library is a C++ class library of cryptographic schemes"
+CVE_PRODUCT = "cryptopp"
+HOMEPAGE = "http://www.cryptopp.com/"
+SECTION = "libs"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://License.txt;md5=ca6dacb7ef68b1ab5dfa3bed24c12003"
+
+SRC_URI = "git://github.com/weidai11/cryptopp.git;protocol=https;branch=master \
+           file://0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch \
+           "
+SRCREV = "843d74c7c97f9e19a615b8ff3c0ca06599ca501b"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+CXXFLAGS += "-fPIC"
+EXTRA_OEMAKE += "HAS_SOLIB_VERSION=1"
+
+do_compile () {
+    oe_runmake -f GNUmakefile-cross libcryptopp.a libcryptopp.so cryptest.exe
+}
+
+do_install () {
+    DESTDIR="${D}" \
+        BINDIR="${bindir}" \
+        DATADIR="${datadir}" \
+        INCLUDEDIR="${includedir}" \
+        LIBDIR="${libdir}" \
+        oe_runmake install
+
+    # Rename cryptest.exe to cryptest
+    if [ -f "${D}${bindir}/cryptest.exe" ]; then
+        mv "${D}${bindir}/cryptest.exe" "${D}${bindir}/cryptest"
+    fi
+}
+
+PACKAGE_BEFORE_PN += "${PN}-cryptest ${PN}-testdata ${PN}-testvectors"
+
+FILES:${PN}-cryptest = "${bindir}/cryptest"
+FILES:${PN}-testdata = "${datadir}/cryptopp/TestData"
+FILES:${PN}-testvectors = "${datadir}/cryptopp/TestVectors"
+
+BBCLASSEXTEND = "native nativesdk"

---
base-commit: 5df267759c953b9615290ea6b8d9051b83863bf9
change-id: 20241121-add-cryptopp-f78794be963c

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


