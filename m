Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66208CAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 13:24:30 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.10401.1759670665060841508
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 06:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d9+kHaBN;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso7435340a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 06:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759670663; x=1760275463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gRoffpN9T4N7c18CbRXgvc+e8/KIQAXR3/AOnz0SyDE=;
        b=d9+kHaBNn4+TSwfwXAANRG1q7w83fxYxnjcOhmVExsECsen+RFCY3o2PJsBWMGBTEQ
         X0qeztxi3/PmHiOjsn44fme0pGI5XTH4/pDmITnxQFlitqase1PTl188tplfrTYxt05h
         IPuAH/5AdlXakulQByjOUdHmYP0VXjZ0dngZ8zn7sMAIJlRT3iX0JU9xjaGSzvK233B4
         mDT/LphpO+50Cqtp3UvUhDEQXwpLHY6vGVz+sUPcDkEH0SDKGF6S0VFUCdVOAXbCIHP0
         eal75oklUo0B3ErOmjv/9j1lJZo9JtNluNileulAFBaVzXXo1FV9KIeY849NMxjRehzf
         EdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759670663; x=1760275463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRoffpN9T4N7c18CbRXgvc+e8/KIQAXR3/AOnz0SyDE=;
        b=FIQjc7ls2XOoO+4I7NYlNbSKEitSPIgebYmDw8rhduTiqlM2zeKjWUrPcb/HkC3S9J
         db9FlA1FfsWKicv8PpCTQGSL5XdaY1LXUch7no8jPyFZMomVxmnwfReAy49KU2WARprn
         sflh0EgLdMu7F7G/f8xUf9GhyxwJEKeTyDHSh4HoueaPgsgJzBrI/UoVPkmK2Wi6CyW5
         FK+3sU5SpqnnycHENzx5rkmRuEeCgz/75zfMHJKRpqwjMq364Ja7pjUcu7Zxj997W98K
         JHWf9YdXEsjJxs+668JUBUOV7oqTuz2ij/cSpgbc8nZGJy9d8gaoatOxyT4cUnt/nsyo
         tUpg==
X-Gm-Message-State: AOJu0YygHcqQR9bwxnuOB9AEpA/F0tdsmgl1GWghy/kqqI4c+tSkq/Xf
	zWGoOaMpoDH4mAyyR0RKYpbmDtg7Ma3nyg5D+ObTVUiInXGwuvZGICvxws00BA==
X-Gm-Gg: ASbGncvsVEJI4KBm0AQ7e7F6Tq2LOsjj5y+8dOn4W6GjvmTBd4gmRZPebiZef/peK/s
	g6x0aAN7uz+W/eGliVzUammLG7Bji7Y+JYK7LgvUd2OfHBGWv5mYIURFUQN6Vo7WoOWyG8rVJRt
	Fh6smRLF9aJaX98LN60OWy+ZKzkSOfG7tyFy0DpnEDCfKdiLdDAd/pvVIDkfkIAvvEIXksRhN0m
	o2ZwP5vgFh7qCGWPIZ5l5wj2CQbs0il55TESZX4U6PlkMIGKdSZaqt7QI+FGhKOLq5z3OfyuStR
	zDThE1Ve/Atc+IbTTm5dYKxXE4naU6lkQFC+lHxinecXgYiiJhH6R7FwAMRh1aTpk57oYB6Lsmh
	XhswTRf5gthxWWjpoDuTsS/ldklX9Ei1VjXIIhkY27oZw
X-Google-Smtp-Source: AGHT+IFUPw51U7bGYCGIIR5eXioIJpiZ+Qsa9UUM2nQ0sSZUvXY3hLklmLTAoaNuwcdIHzLdAl8Ceg==
X-Received: by 2002:a05:6402:3511:b0:637:dfb1:339e with SMTP id 4fb4d7f45d1cf-639348bc970mr9726128a12.5.1759670663098;
        Sun, 05 Oct 2025 06:24:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63788111f1fsm8238598a12.36.2025.10.05.06.24.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 06:24:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] botan: patch CVE-2024-50382
Date: Sun,  5 Oct 2025 15:24:20 +0200
Message-ID: <20251005132420.657151-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 13:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120249

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-50382

Pick patch mentioned in the URL list of the nist page.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...arriers-to-avoid-compiler-induced-si.patch | 66 +++++++++++++++++++
 meta-oe/recipes-crypto/botan/botan_2.19.1.bb  |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-si.patch

diff --git a/meta-oe/recipes-crypto/botan/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-si.patch b/meta-oe/recipes-crypto/botan/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-si.patch
new file mode 100644
index 0000000000..389e8fdaa5
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/0001-Add-more-value-barriers-to-avoid-compiler-induced-si.patch
@@ -0,0 +1,66 @@
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
 

