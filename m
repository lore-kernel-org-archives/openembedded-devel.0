Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148BFCED613
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 11:03:40 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9800.1763463810606153130
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 03:03:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HHo+ez+h;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297d4ac44fbso47059465ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 03:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763463810; x=1764068610; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPc+Jrp2dHqkN4fo+kyOvAd+VFui7HxBVpbj3cXWFuw=;
        b=HHo+ez+h/2Yzp97MpplyliqkcXe+Lq3ydVYmlQQQ8j3d63Fl78bU0RW2G49D5PtQW1
         oUoZ0wW7+E6nend3Rbs+6jYaDxcuRvcXJhaN5tsx084PonP0a1nsSNwwMJ/QSiwEnDNj
         avJSaTaF/FV+o++Mt1mE17J+kjkEudQUA3o2QtfQdpyFLl7NWoJ9dQhRanxc4qlf9Tb9
         E1K6Hpws4rzyfL16lljEOLnKIoxoNbATtvUbHe45LeHxXN02vX4FGs/KuuMLZn6QonS1
         57ISl+cktLQP4CA/oUrHpE7HQyp3LKfOc8Lv6eEapZvEs1L3yzYVTxrtwwhaaOWXt/+H
         n70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763463810; x=1764068610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fPc+Jrp2dHqkN4fo+kyOvAd+VFui7HxBVpbj3cXWFuw=;
        b=H5FlEnua2QRfp0kUDGCeAAu54hHtY0UUaVRH2+r8f/u58G1I3a8Lj2TouuUUkDm82B
         R0uuroTi2jIoPo6nFjdYaz0S+K1DOI3RsMAUsLFnKMNJdhmGEfnawj/5CaIaho4+kRAS
         0NqznJW4mC+/G9NWZ/rJN4wEa3O9tyQ+1ewQTWIAgjtGrsvm/ccgpuyIUHuAp0/PZXNp
         Fh5Udg++x/w5gLvVi4O5XHArxO1MhnbYIi00UzOR8GB+lLqnqTfl+1Hoy4znqC8kp+jj
         EQg5kZ8qNfzH00tou5zpcbOEIh8RB5pLOVsqX62flfyxyX0EEAZBmx5oQiyb4Nh8Fft/
         qz3Q==
X-Gm-Message-State: AOJu0YzsmD9SD5++efc93a+o9RxD3fK8SNYK+bAiVhPIAZTTtRLAl0JJ
	VtjYjrzJ7Kru6yy9c8SRmrqJx3w8jNVuATY/QuyU8obhu/oVAzjf3++pvG7eSg==
X-Gm-Gg: ASbGncvW5yoxKERzbkB2UvP9BgBOd60vg7l6eIUEguFJqh0le2RVSLiHJJB17nOB1Lb
	xgBY2c7rWM6OKfCFD4/fqR/TkBmQBlu2Ad5lMUOuXgwDWz91ll4u+UT1LAsOq6PEp+4I6I6ecvm
	J0n9KZQV4uIvsvrEaI6lPk8CTZykorKWwSRs+fDPC7/SK6nG9CkXP5LSfnDCbCDKvsELbm5ZSu0
	JiCBHwWKw0wsZX727Xj5gA0ko4odR36xK+6hK3KeU6qYoCJvRWEibbN4F77FLLh23MpXGfHJDXg
	OQqrrkm25Lm1Bcshe/jwuald0gNNhfu+dwXA51GQG+jB0Vr/GwDZ6ihxCqLmrUnnhezpeLY7zXw
	mB+JMmtuCko3uRxZ96KVIYM13f0LmIhd9k2CW8iGfWxIVzur6GnC0YcIQSksaajxOfAB3D+xljQ
	wPvcVcKRysg+2f3v3xkSLxuClDdr6mnFDP5O0=
X-Google-Smtp-Source: AGHT+IFg88pOsMJt8pwjuRm8ly1fiImy5h6zWZePiEbhM7j1bQmUJBin57W0jjuVjvKuErF1Va0G2Q==
X-Received: by 2002:a17:902:cec7:b0:296:547a:4bf2 with SMTP id d9443c01a7336-299f55b6333mr27599045ad.27.1763463809738;
        Tue, 18 Nov 2025 03:03:29 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c244e46sm167431675ad.25.2025.11.18.03.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 03:03:29 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/5] botan: patch CVE-2024-50382 and CVE-2024-50383
Date: Wed, 19 Nov 2025 00:03:17 +1300
Message-ID: <20251118110320.1635988-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118110320.1635988-1-ankur.tyagi85@gmail.com>
References: <20251118110320.1635988-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 11:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121853

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Same patch fixes both vulnerabilities.

Details:
https://nvd.nist.gov/vuln/detail/CVE-2024-50382
https://nvd.nist.gov/vuln/detail/CVE-2024-50383

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../CVE-2024-50382-and-CVE-2024-50383.patch   | 66 +++++++++++++++++++
 meta-oe/recipes-crypto/botan/botan_3.2.0.bb   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2024-50382-and-CVE-2024-50383.patch

diff --git a/meta-oe/recipes-crypto/botan/botan/CVE-2024-50382-and-CVE-2024-50383.patch b/meta-oe/recipes-crypto/botan/botan/CVE-2024-50382-and-CVE-2024-50383.patch
new file mode 100644
index 0000000000..d1b625f19b
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/CVE-2024-50382-and-CVE-2024-50383.patch
@@ -0,0 +1,66 @@
+From 157bf1cd6877e16084e910d68c1844ac73b4f6ff Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Sat, 19 Oct 2024 07:43:18 -0400
+Subject: [PATCH] Add more value barriers to avoid compiler induced side
+ channels
+
+The paper https://arxiv.org/pdf/2410.13489 claims that on specific
+architectures Clang and GCC may introduce jumps here. The donna128
+issues only affect 32-bit processors, which explains why we would not
+see it in the x86-64 valgrind runs.
+
+The GHASH leak would seem to be generic but the authors only observed
+it on RISC-V.
+
+CVE: CVE-2024-50382
+CVE: CVE-2024-50383
+Upstream-Status: Backport [https://github.com/randombit/botan/commit/53b0cfde580e86b03d0d27a488b6c134f662e957]
+(cherry picked from commit 53b0cfde580e86b03d0d27a488b6c134f662e957)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lib/utils/donna128.h      | 5 +++--
+ src/lib/utils/ghash/ghash.cpp | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/utils/donna128.h b/src/lib/utils/donna128.h
+index f39f57f97..ab7fb4c83 100644
+--- a/src/lib/utils/donna128.h
++++ b/src/lib/utils/donna128.h
+@@ -8,6 +8,7 @@
+ #ifndef BOTAN_CURVE25519_DONNA128_H_
+ #define BOTAN_CURVE25519_DONNA128_H_
+ 
++#include <botan/internal/ct_utils.h>
+ #include <botan/internal/mul128.h>
+ 
+ namespace Botan {
+@@ -54,14 +55,14 @@ class donna128 final {
+          l += x.l;
+          h += x.h;
+ 
+-         const uint64_t carry = (l < x.l);
++         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x.l).if_set_return(1);
+          h += carry;
+          return *this;
+       }
+ 
+       donna128& operator+=(uint64_t x) {
+          l += x;
+-         const uint64_t carry = (l < x);
++         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x).if_set_return(1);
+          h += carry;
+          return *this;
+       }
+diff --git a/src/lib/utils/ghash/ghash.cpp b/src/lib/utils/ghash/ghash.cpp
+index 38604afdb..5c244b4f8 100644
+--- a/src/lib/utils/ghash/ghash.cpp
++++ b/src/lib/utils/ghash/ghash.cpp
+@@ -129,7 +129,7 @@ void GHASH::key_schedule(std::span<const uint8_t> key) {
+          m_HM[4 * j + 2 * i + 1] = H1;
+ 
+          // GCM's bit ops are reversed so we carry out of the bottom
+-         const uint64_t carry = R * (H1 & 1);
++         const uint64_t carry = CT::Mask<uint64_t>::expand(H1 & 1).if_set_return(R);
+          H1 = (H1 >> 1) | (H0 << 63);
+          H0 = (H0 >> 1) ^ carry;
+       }
diff --git a/meta-oe/recipes-crypto/botan/botan_3.2.0.bb b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
index 3c603a9b26..ef3e63a93b 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
@@ -6,6 +6,7 @@ SECTION = "libs"
 
 SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://CVE-2024-34703.patch \
+		   file://CVE-2024-50382-and-CVE-2024-50383.patch \
 "
 SRC_URI[sha256sum] = "049c847835fcf6ef3a9e206b33de05dd38999c325e247482772a5598d9e5ece3"
 

