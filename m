Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D4C397C675
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 07:26:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44FMdb36PGz4x
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 08:26:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551943619;
	bh=SoQYPHIU+7qSqtI4jVsiVYRLfn1RHCdO9A8G3U/+uYo=;
	h=From:To:Subject:Date:From;
	b=mfITxGcXgpkv7EnTHyjEnMOBVG9c5hDNxxUMBCWX2fvC9A92t/g36uka12xyJ+OZD
	29whZskZdpjk54HvV/ILtJAyRl09fAEoZ9/mrHvR4QcE07x7njgiMDO6EKUWvJJghw
	vNA0Dl5Qoz6wTxP8Aj9X70HidST0vNf085aOdCh6nNsECbqmdwmI9oaiQZrLoT8PN3
	fg8og5nIWqOk2ROXCqj4VsZgZGA/lmE49iw74RvWsq0xvB1Fhu7hElC8De6TpqHaHV
	oiDaUH/F+vOsaLq8I1lUkhXRfuucQWJKxJMixv02rkJY9C885xd15M1aL/lwYwa/8m
	ABMnWUHiPK4iXF2HgpzqM9MfZKqGm/chWz2eam424tztL2QQjaHVJ61vv/fALWhWKw
	1z1w24x5tK3RfM1kakjY4CEr7HyfCVf8oMFOl2++v11zowUMj5ecAx3v67I7nOdCXA
	Z+GIFcmQeyGyeFL4r1IR52p4xVlu3u01RuinpPZxfy+TN9l1mran4rON38UY6YEf7e
	AxSLBj/IvlQEggIsEiyOYsNXdp5QAd52iidG4TzNXUPSpppoZlpt0rjGT1EqsXQdSd
	2wu9R+OUDrIMdw6nKGiQICxk2zCEpRHLFZwpq/Pnd0hz/4V4+v1ajc8fI39Le+HQy8
	G2MRIy6nkI7ZW70Ht9/BwLKg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2019 09:26:58 +0200
Message-Id: <20190307072658.26656-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] android-tools: Add patch from Debian to build with OpenSSL 1.1
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
X-List-Received-Date: Thu, 07 Mar 2019 07:26:59 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../android-tools/core/adb_libssl_11.diff     | 39 +++++++++++++++++++
 .../android-tools/android-tools_5.1.1.r37.bb  |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff b/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
new file mode 100644
index 000000000..3ead649b1
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/adb_libssl_11.diff
@@ -0,0 +1,39 @@
+Description: adb: Make compatible with openssl 1.1
+ OpenSSL version 1.1 brought some API changes which broke the build here,
+ fix that by accessing rsa->n (and e) directly, using RSA_get0_key instead.
+Author: Chirayu Desai <chirayudesai1@gmail.com
+Last-Update: 2016-11-10
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+---
+ system/core/adb/adb_auth_host.c |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+--- a/adb/adb_auth_host.c
++++ b/adb/adb_auth_host.c
+@@ -75,6 +75,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
+     BIGNUM* rem = BN_new();
+     BIGNUM* n = BN_new();
+     BIGNUM* n0inv = BN_new();
++    BIGNUM* e = BN_new();
+ 
+     if (RSA_size(rsa) != RSANUMBYTES) {
+         ret = 0;
+@@ -82,7 +83,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
+     }
+ 
+     BN_set_bit(r32, 32);
+-    BN_copy(n, rsa->n);
++    RSA_get0_key(rsa, &n, &e, NULL);
+     BN_set_bit(r, RSANUMWORDS * 32);
+     BN_mod_sqr(rr, r, n, ctx);
+     BN_div(NULL, rem, n, r32, ctx);
+@@ -96,7 +97,7 @@ static int RSA_to_RSAPublicKey(RSA *rsa,
+         BN_div(n, rem, n, r32, ctx);
+         pkey->n[i] = BN_get_word(rem);
+     }
+-    pkey->exponent = BN_get_word(rsa->e);
++    pkey->exponent = BN_get_word(e);
+ 
+ out:
+     BN_free(n0inv);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index d49e53714..e09cd829d 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
 DEPENDS = "libbsd libpcre zlib libcap"
-DEPENDS_append_class-target = " openssl10"
+DEPENDS_append_class-target = " openssl"
 
 ANDROID_MIRROR = "android.googlesource.com"
 
@@ -37,6 +37,7 @@ SRC_URI = " \
     file://core/0010-Use-linux-capability.h-on-linux-systems-too.patch;patchdir=system/core \
     file://core/0011-Remove-bionic-specific-calls.patch;patchdir=system/core \
     file://core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch;patchdir=system/core \
+    file://core/adb_libssl_11.diff;patchdir=system/core \
     file://extras/0001-ext4_utils-remove-selinux-extensions.patch;patchdir=system/extras \
     file://extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch;patchdir=system/extras \
     file://libselinux/0001-Remove-bionic-specific-calls.patch;patchdir=external/libselinux \
-- 
2.17.1


