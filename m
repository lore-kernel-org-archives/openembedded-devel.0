Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6228DC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:54:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.11926.1749027280322992896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oLcvO/Uk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C67714327B;
	Wed,  4 Jun 2025 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749027277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AYB+WSBFULORvGVL5GAcVsj8bJFScEcVfv49G4gMNyg=;
	b=oLcvO/Uk51LCVYYvyL+ptxq23ST92ktAWlsVP/6DYqjior+ul4G4rl/6EKcwCAzidRIEVX
	Cu51uXnAkR+Uub8W9bblDG+sQ+mWUqomAZ4f08tiVvvMmjM6e7Njp3jWbRIMGJb67Qt1OO
	TZzZUP3iCKJrUo9VuMt/RI55so7PYDHfGvldoXU039KNZ78ZhumIytfILjcf6TVwJQ49pO
	Pri5q8jyCIeaspR5T+xVLfVie8ziuDRKBfTPVbXz3tqJFiKUYEmMeWTMYtTsd1IPhy8Q+9
	s9vfZA9ECLPwRrCkleynMjb3OMDSTyMSJJGEQAq3yA5KR9nBZulJnmact6husg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 04 Jun 2025 10:54:30 +0200
Subject: [meta-oe PATCH v4] cryptopp: add a recipe for version 8.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-add-cryptopp-v4-1-9e9400a9e877@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMUJQGgC/3XN3wqCMBTH8VeJXbfwnM3puuo9oov9MwflZMpIx
 HdvCkEYXf4OfL5nJoOL3g3kfJhJdMkPPnR58OOBmFZ1d0e9zZtggRwAgSprqYlTP4a+p01VV5J
 rJwUzJJM+usa/ttz1lnfrhzHEaasnWK9/QgkoUCZYjUoUxhl90SGMD9+dTHiSNZXwm+OOY+Yge
 SkKgU0l4ZezDy+LEusdZ5kLZbk0VnPQu+/LsrwBoJYIrSgBAAA=
X-Change-ID: 20241121-add-cryptopp-f78794be963c
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Martin Jansa <martin.jansa@gmail.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6618;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=7W8q3iudfLP5aqi0FMsGwEcjNf3s8iL7hsyFSv0ftMM=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBoQAnMqTZkwe1eYSJkDyxZhZSDEl+av2aR9i2+t
 22KbixdluGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaEAJzAAKCRDRgEFAKaOo
 NmJfEACc/yrRcliPTGLAPzR4Xtxb+R5DVMClpqgL+SdR1Muf4MyhMBYOtHpMMgtJVYSCVUXlYLI
 7UxHQ4PkHXCpSvLnVWDwUmCk/qXZQFnHDMoR3plicRI/e4fki15MJms3rqFYtI5miJnCXWwO3vA
 zn4E4IJdsuAfSVMycZB+5j33Izmh5ydpOqLK2r3emFMYnNhGj69ljsPuIwpyJN/G2vM4zRtYKpm
 +pprKgcnI6cTccQl/upLicZa/ZJaGQqo9TCGYwi0iVjesfgSmPP4Fb9HDOhVjpP7l6Epu+DIDUu
 cogV+eA+a0ZOY5IGotlSxFGLjhplISR30q+uvvwhc/l6kIhgdESJFj78vmMef93npgvKqzGLWB8
 hW/+F+xq2FAi6JgiWReW7Ie1Geeal+qscim9xIFUYRZgvnvZ9tNEXVI3mgRteZ7jxaW1kg+3d4v
 5L20p4R/c1z5eKhmu4KmHHL33HGTSFSaVSyQlcryoDnbEnNpkVyo1mSZ5qKzv5+19HIyaHOjG/o
 PYs88i3oJ02Rjo9xRpJUs5QvDJafVtL3jBdT8oZbAxnOBMM4xNUy+PpnyTScF6go4d0Gklu71LH
 sjtBsPPyvRUCdYRm3mFh6FmD3yyjioVwFl3hVecDDqyB3zA5qfE5xdj9T0JIs5vk/7FaFoDiDS8
 k+HZCuM+gbZ08sw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddukeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgffgffdukeefteeutdeuheekvdejtdfgkeevtefgffeukeeftdejueejfeevteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdptghrhihpthhophhprdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhtihhnrdhjrghnshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvn
 hgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 08:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117733

Cryptopp is a library of cryptographic schemes written in C++.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Note: I had no issue building with MACHINE to "qemux86-64" and TCLIBC =
"musl", as reported here:
https://lore.kernel.org/r/CAMKF1sreBnjjX0GW-G9+15Y+EgFQUmKUPX_cqYE7J3WaZ9=94g@mail.gmail.com
Any extra steps to reproduce the issue would be appreciated.
---
Changes in v4:
- Make the recipe inherit dos2unix as it was preventing the patch from
  applied after going through the mailing list. Remove the CRLF from the
  patch file accordingly.
- Link to v3: https://lore.kernel.org/r/20250528-add-cryptopp-v3-1-6ad49cdb41bb@bootlin.com

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
index 0000000000..ec040bc1cd
--- /dev/null
+++ b/meta-oe/recipes-crypto/cryptopp/cryptopp-8.9.0/0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch
@@ -0,0 +1,57 @@
+From 9cbe7e5165e8bfa1bbb632682e049e2f92f79717 Mon Sep 17 00:00:00 2001
+From: Antonin Godard <antonin.godard@bootlin.com>
+Date: Fri, 30 May 2025 13:33:39 +0200
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
index 0000000000..4e34c60888
--- /dev/null
+++ b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
@@ -0,0 +1,45 @@
+SUMMARY = "A C++ class library of cryptographic schemes"
+DESCRIPTION = "Crypto++ Library is a C++ class library of cryptographic schemes"
+CVE_PRODUCT = "cryptopp"
+HOMEPAGE = "http://www.cryptopp.com/"
+SECTION = "libs"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://License.txt;md5=51c7d279a47eba5246eb5a5123bc1b77"
+
+SRC_URI = "git://github.com/weidai11/cryptopp.git;protocol=https;branch=master \
+           file://0001-Fix-arm-crypto-logic-issue-in-config_asm.h.patch \
+           "
+SRCREV = "843d74c7c97f9e19a615b8ff3c0ca06599ca501b"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig dos2unix
+
+CXXFLAGS += "-fPIC"
+EXTRA_OEMAKE += "HAS_SOLIB_VERSION=1"
+
+do_compile() {
+    oe_runmake -f GNUmakefile-cross libcryptopp.a libcryptopp.so cryptest.exe
+}
+
+do_install() {
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


