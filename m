Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.8077.1609725839626266836
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 18:04:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,472,1599494400"; 
   d="scan'208";a="103150290"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 04 Jan 2021 10:03:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DA28148990D2
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Jan 2021 10:03:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 4 Jan 2021 10:03:28 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 4.5.0 -> 4.6.0
Date: Mon, 4 Jan 2021 22:03:25 +0800
Message-ID: <1609769005-7036-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DA28148990D2.A09D2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Make-ByteReverseWords-available-for-big-and-little-e.patch
Removed since this is included in 4.6.0

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...Words-available-for-big-and-little-e.patch | 32 -------------------
 .../{wolfssl_4.5.0.bb => wolfssl_4.6.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/wolfssl/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-e.patch
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_4.5.0.bb => wolfssl_4.6.0.bb} (84%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-e.patch b/meta-networking/recipes-connectivity/wolfssl/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-e.patch
deleted file mode 100644
index 4676769a4..000000000
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-e.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b90acc91d0cd276befe7f08f87ba2dc5ee7122ff Mon Sep 17 00:00:00 2001
-From: Tesfa Mael <tesfa@wolfssl.com>
-Date: Wed, 26 Aug 2020 10:13:06 -0700
-Subject: [PATCH] Make ByteReverseWords available for big and little endian
-
----
- wolfcrypt/src/misc.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/wolfcrypt/src/misc.c b/wolfcrypt/src/misc.c
-index fe66ee0a1..23bfa1adc 100644
---- a/wolfcrypt/src/misc.c
-+++ b/wolfcrypt/src/misc.c
-@@ -120,7 +120,6 @@ WC_STATIC WC_INLINE word32 ByteReverseWord32(word32 value)
-     return rotlFixed(value, 16U);
- #endif
- }
--#if defined(LITTLE_ENDIAN_ORDER)
- /* This routine performs a byte swap of words array of a given count. */
- WC_STATIC WC_INLINE void ByteReverseWords(word32* out, const word32* in,
-                                     word32 byteCount)
-@@ -131,7 +130,6 @@ WC_STATIC WC_INLINE void ByteReverseWords(word32* out, const word32* in,
-         out[i] = ByteReverseWord32(in[i]);
- 
- }
--#endif /* LITTLE_ENDIAN_ORDER */
- 
- #if defined(WORD64_AVAILABLE) && !defined(WOLFSSL_NO_WORD64_OPS)
- 
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.6.0.bb
similarity index 84%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_4.6.0.bb
index 61cf1cc62..ad7e92341 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.6.0.bb
@@ -13,9 +13,8 @@ PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https \
-           file://0001-Make-ByteReverseWords-available-for-big-and-little-e.patch \
 "
-SRCREV = "0fa5af9929ce2ee99e8789996a3048f41a99830e"
+SRCREV = "9c87f979a7f1d3a6d786b260653d566c1d31a1c4"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.25.1



