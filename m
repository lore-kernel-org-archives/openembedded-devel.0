Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.11391.1601980318264447756
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 03:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WOXF+tqm;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: wickbergster@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id b22so14404790lfs.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2020 03:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHKcjuMv2737nE4mvFo8Uuzq/pH6jN/NpgQbsHkYBhU=;
        b=WOXF+tqmQui+IyGf8IubP5qyIInvYC7BZP+K2AXi46/FK1u41S/FoQ7TrZ4iRisNQg
         qZeho4kGn+RnG5TiaXTUvcsWMmLNaKVqzD+xF4UzLDMUfF+4JEen4m+y20iDNHKmrC5D
         9I/jJNpGdu90Op9SGw310FtheYOl9tshC0/I3KcO6LpalGI8j4pB/oh9RtjaNNE7wsCg
         asRkuI5b6ePJRTm5ZxY5SdKRSHNqbQBEjwJoQY9XhAJeDgMJsVqr8V1VQ5afyhwrsOX7
         2BaTjV+A6ZAO0aZOwKFS8HFrPosCLlrd/D92Hp2CQSFVplRWrkbu+b0fGdsFVZ7DD6Yl
         PyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHKcjuMv2737nE4mvFo8Uuzq/pH6jN/NpgQbsHkYBhU=;
        b=p68Kk4SPTCVTwTphDDGjMVEm2H/mVuADRrpQ1HrSz+WXFckOE08sfpnGVMzc3FoXGt
         z7LsR9c0J2a6Hn9BQ5H4yk8hdruxuLWI+oDcsyvPhLTGa6f5vLxp7WD1JkfZOysEl71S
         g4sm4ZRQND/M7TO5Q4Ulx+0r3JUHGdbJvBxp4IMVpnybpBGgwVHnJ+tRoYpR3BiUxcwx
         /ZPHYilrzKwxXD/v5ADV8aJelVVplnuyuSFcmbk0Etw5157mXFPopjfPRYdICZ458E3R
         6fFJShBiSazYyraFUwwwhvinkZagNjRuTNjPgZ896mVeKE5bQOpXMfLCYZ3olv+V5I/F
         A2mA==
X-Gm-Message-State: AOAM530v3GUfxJIvFm5h44pzfjphUsWdp3WdN7e8nWKDIX5MKUnBw+w/
	G/k/EHKqGuJxU3GGG99S5lC19QJT772MUg==
X-Google-Smtp-Source: ABdhPJy1Kq146minVaJog3nRAGFQrw1dN3Xx6V0EF4LQrhRvedhhlqB9l5g4zxVmQZ9Oz2WypsPyiQ==
X-Received: by 2002:a05:6512:214c:: with SMTP id s12mr286813lfr.578.1601980315845;
        Tue, 06 Oct 2020 03:31:55 -0700 (PDT)
Return-Path: <wickbergster@gmail.com>
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id b16sm643256ljh.34.2020.10.06.03.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 03:31:55 -0700 (PDT)
From: "Alexander Vickberg" <wickbergster@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [meta-networking][PATCH] wolfssl: upgrade 4.4.0 -> 4.5.0
Date: Tue,  6 Oct 2020 12:30:23 +0200
Message-Id: <20201006103023.86516-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add patch from upstream which fixes building on big endian.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 ...Words-available-for-big-and-little-e.patch | 32 +++++++++++++++++++
 .../{wolfssl_4.4.0.bb => wolfssl_4.5.0.bb}    |  6 ++--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-e.patch
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_4.4.0.bb => wolfssl_4.5.0.bb} (77%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-e.patch b/meta-networking/recipes-connectivity/wolfssl/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-e.patch
new file mode 100644
index 000000000..4676769a4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl/0001-Make-ByteReverseWords-available-for-big-and-little-e.patch
@@ -0,0 +1,32 @@
+From b90acc91d0cd276befe7f08f87ba2dc5ee7122ff Mon Sep 17 00:00:00 2001
+From: Tesfa Mael <tesfa@wolfssl.com>
+Date: Wed, 26 Aug 2020 10:13:06 -0700
+Subject: [PATCH] Make ByteReverseWords available for big and little endian
+
+---
+ wolfcrypt/src/misc.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/wolfcrypt/src/misc.c b/wolfcrypt/src/misc.c
+index fe66ee0a1..23bfa1adc 100644
+--- a/wolfcrypt/src/misc.c
++++ b/wolfcrypt/src/misc.c
+@@ -120,7 +120,6 @@ WC_STATIC WC_INLINE word32 ByteReverseWord32(word32 value)
+     return rotlFixed(value, 16U);
+ #endif
+ }
+-#if defined(LITTLE_ENDIAN_ORDER)
+ /* This routine performs a byte swap of words array of a given count. */
+ WC_STATIC WC_INLINE void ByteReverseWords(word32* out, const word32* in,
+                                     word32 byteCount)
+@@ -131,7 +130,6 @@ WC_STATIC WC_INLINE void ByteReverseWords(word32* out, const word32* in,
+         out[i] = ByteReverseWord32(in[i]);
+ 
+ }
+-#endif /* LITTLE_ENDIAN_ORDER */
+ 
+ #if defined(WORD64_AVAILABLE) && !defined(WOLFSSL_NO_WORD64_OPS)
+ 
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb
similarity index 77%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb
index db7b0d486..61cf1cc62 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.4.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_4.5.0.bb
@@ -12,8 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 PROVIDES += "cyassl"
 RPROVIDES_${PN} = "cyassl"
 
-SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https"
-SRCREV = "e116c89a58af750421d82ece13f80516d2bde02e"
+SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https \
+           file://0001-Make-ByteReverseWords-available-for-big-and-little-e.patch \
+"
+SRCREV = "0fa5af9929ce2ee99e8789996a3048f41a99830e"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.25.1

