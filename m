Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB39CAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 13:38:00 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.10617.1759671477117224775
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 06:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NzwqfuJj;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62f24b7be4fso7077194a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759671475; x=1760276275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OWJIBLYd3JAXhIz7zgv1Lu7XGTdHnVxwxowu/zJaU6k=;
        b=NzwqfuJj9IChA9jkWXwRxtuGDDcIzAGKDBdbjHfGBbDocYwtgda/DCrW/LUHePjYTB
         CMT/48MO+62L947TPlpp3LCDiupsQK0kd9tfIokgZ8yS5MnoYx+lhbLVhMt7NHN3/d2t
         fexm8rcxkaYg5mPh8vxq1vbGr0NRUMiY1gabpnHkxYriK4QPySZwEM+MM3sONQGLaVK6
         3Kb7ae/Q8T2C3ZkuOz8ww4Nv7c0DzwxOGC6a6nM2gZ7BdmA5VmG51cBAPI57+RyI9jD3
         FrhVdZZLCOnbVj+wE2+ld30cT9r+LH1Vxmf4x1ond4+6lRZ2yg1xlDD+LJp8MuuvWaso
         kC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759671475; x=1760276275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWJIBLYd3JAXhIz7zgv1Lu7XGTdHnVxwxowu/zJaU6k=;
        b=qvt+y2tOHT0o9GC2XuFj3GIEpwGa76Qx+yytRkV9vVGz+qtPB4W9hObnX7u4hkGPti
         W8tWlVC6sdom3KkCZcROKVD+rIm+C/wzpy4SLvSwtWgpg+h4Jw95ferbzKObzRZgRgB/
         mVocPGtz6Mq8J2lOtrDYCppaJWxTt0lzqXcK30qo3Fn3fJ3I9RtJGIgxnDOS6OGlR/Jp
         xT4X+AMnHbBjUb2djprV5gbgj5f7MI6xcT7Lrgsuax7gEt7beOdjNh1hov4g6xFSRRs8
         v+/U4n4P5IfcmvXuZ/aLSZt03BxBQkcw4QVxKfCmrQG0x7nFp1qTM7tfTXvoTydE9GIE
         pwHg==
X-Gm-Message-State: AOJu0Yxq62Vs8SzJE1FeCw557M/GJKtWXvCmF4iOz42dAqIxEmurssjM
	WS9mTlihf1qBeGIE5jzhdsL9qtfaizBDV598BZU82SmE9at9z5FoqhDs6u6ktQ==
X-Gm-Gg: ASbGncusR+DC/3oG+FxZO/+Ehk+lO4nrphfRKZtlwQFe8gU/7mwp0wLM8DJfiE6dl6F
	3jGe86+fHWGGjZsz1T0qvch2j3gK/Y+joNDXzbnIsW4Bsu9qDKb4Tpc0nbDzdYttDWl03gwWpEz
	9envWK+kA+o/L/z8y6JQaq62lkPpFA1f18bIJAcD0JvbmKaSJT1NwGadTlnkkaaggjgnSxlWzps
	to3cKrvaEiPzPKcQZNknQf9qLBt3TRTqAWWZNoHbn3btrud4Ag98dAKcfLNm80EDXAW1FkNYrko
	LafHsXKtoTmcbd1vQo/WnXi4/w8ViwMaz3rcCgPFkt+GNF5YMQNXMwskVO4e0zUmYjRYx/TeuoW
	hd5gLqdHWsFzj+TSY0/HODiX7HfOprf6lV5vuReYbaLSf
X-Google-Smtp-Source: AGHT+IH/xrz2HFOgLVz15ZKgwYMXl2ZbUt3h+kbMsIkvaNsMhT7Vs1u+VSfkqQBNHOWF296vZvkosA==
X-Received: by 2002:a17:906:f590:b0:b3e:b226:5bad with SMTP id a640c23a62f3a-b49c146e760mr882207366b.8.1759671475279;
        Sun, 05 Oct 2025 06:37:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865c81e3esm918383366b.33.2025.10.05.06.37.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 06:37:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] botan: patch CVE-2024-50382 and CVE-2024-50383
Date: Sun,  5 Oct 2025 15:37:54 +0200
Message-ID: <20251005133754.658709-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 13:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120250

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-50382
https://nvd.nist.gov/vuln/detail/CVE-2024-50383

Pick patch mentioned in the URL list of the nist page - the
same patch fixes both vulnerabilities.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...arriers-to-avoid-compiler-induced-si.patch | 67 +++++++++++++++++++
 meta-oe/recipes-crypto/botan/botan_2.19.1.bb  |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-si.patch

diff --git a/meta-oe/recipes-crypto/botan/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-si.patch b/meta-oe/recipes-crypto/botan/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-si.patch
new file mode 100644
index 0000000000..caf21f0bd3
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-si.patch
@@ -0,0 +1,67 @@
+From 932feeb38783b539ee49e7ba3c1729830984f019 Mon Sep 17 00:00:00 2001
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
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/utils/donna128.h      | 5 +++--
+ src/lib/utils/ghash/ghash.cpp | 2 +-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/utils/donna128.h b/src/lib/utils/donna128.h
+index ff57190..dbf2f38 100644
+--- a/src/lib/utils/donna128.h
++++ b/src/lib/utils/donna128.h
+@@ -8,6 +8,7 @@
+ #ifndef BOTAN_CURVE25519_DONNA128_H_
+ #define BOTAN_CURVE25519_DONNA128_H_
+ 
++#include <botan/internal/ct_utils.h>
+ #include <botan/mul128.h>
+ 
+ namespace Botan {
+@@ -61,7 +62,7 @@ class donna128 final
+          l += x.l;
+          h += x.h;
+ 
+-         const uint64_t carry = (l < x.l);
++         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x.l).if_set_return(1);;
+          h += carry;
+          return *this;
+          }
+@@ -69,7 +70,7 @@ class donna128 final
+       donna128& operator+=(uint64_t x)
+          {
+          l += x;
+-         const uint64_t carry = (l < x);
++         const uint64_t carry = CT::Mask<uint64_t>::is_lt(l, x).if_set_return(1);
+          h += carry;
+          return *this;
+          }
+diff --git a/src/lib/utils/ghash/ghash.cpp b/src/lib/utils/ghash/ghash.cpp
+index e24f5e0..8f0afa7 100644
+--- a/src/lib/utils/ghash/ghash.cpp
++++ b/src/lib/utils/ghash/ghash.cpp
+@@ -139,7 +139,7 @@ void GHASH::key_schedule(const uint8_t key[], size_t length)
+          m_HM[4*j+2*i+1] = H1;
+ 
+          // GCM's bit ops are reversed so we carry out of the bottom
+-         const uint64_t carry = R * (H1 & 1);
++         const uint64_t carry = CT::Mask<uint64_t>::expand(H1 & 1).if_set_return(R);
+          H1 = (H1 >> 1) | (H0 << 63);
+          H0 = (H0 >> 1) ^ carry;
+          }
diff --git a/meta-oe/recipes-crypto/botan/botan_2.19.1.bb b/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
index 71e805b655..a961bc775f 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://0003-FIX-missing-validation-of-authority-of-delegation-re.patch \
            file://0004-review-comments.patch \
            file://0001-Address-various-name-constraint-bugs.patch \
+           file://0001-Add-more-value-barriers-to-avoid-compiler-induced-si.patch \
            "
 SRC_URI[sha256sum] = "e26e00cfefda64082afdd540d3c537924f645d6a674afed2cd171005deff5560"
 

