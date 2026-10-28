Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36051.1793161493910221067
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NB/eysYU;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso404661a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161493; x=1793766293; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWHSEGhn65ZHQj4gikc3tmOBP0zoM5i3QBpymrh2M/8=;
        b=NB/eysYUK5KpMiU3Lizg9bWw7CgxVeyKlWJEqQ/ymdFSUSg3j0oyfyu9jFBDSaXJwo
         OAprTCiLVIgbTHbcW9sY0FFKN0QRlx2N5+Bw/PKz/I0UVYbP30Ubuvt2AHAK0zjFPwtg
         be8JHp3kAkgAlVcbbssQ8OqtLWuHt6gZwLQbh5MBrF2rndUC7PMpznP1hnY1TkHP6mXP
         F8b+bUkdSdTrtE1auAPVXCWhiYq3dMwgIgf5FOLIBZf/1hQv/AS/RirMN/hr1gcoTc31
         aXYBHH57DwevvNzagsRW4K0qqIpaqDOhsCoBGdEJYB1+mbY856LLc/IcwiAHO5KsPlt8
         3vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161493; x=1793766293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NWHSEGhn65ZHQj4gikc3tmOBP0zoM5i3QBpymrh2M/8=;
        b=m1FcAmezmo01DIuXRCD6F4LDT3yl/6Smk+7RjCPx5JAV4+9bkYG/QQR5HOCkVkhMpD
         7M/s3DBZqJcKxiXePxD2lOnoZTFx7WYJSgCFj8BL/n6P/AFFZ7DjMwDgw+19uCsQu31I
         FOaamVq53qDjnDf7sY+S0CRcJysyNwQkwlelebiL9ywgc4FEqhKLUqZX1n5a38exLt/Q
         3qwrYZRvBWYd4tB+mrHVHgFA0FNV/x20z2f2rLA7utu1U+jUjIX46at5tQ2hvevvQw7h
         +7A9apjewJHjc7l5h+3AHiVcAcnVr4TMTDTvPqinhk/3RiXpTHcHn4HaAVZfox6TluD1
         boeg==
X-Gm-Message-State: AFq9FYK2r9kz85k/HsRjoZq9Qlc7ssjLnIEQUe3apEPMW8gUjqmIKPEt
	qmfw03fK2QLsiyI4OWa7S4biRGR+oqS3PgiB3FUFNds8hhJ75BQ0fun6DamrUQ==
X-Gm-Gg: AYBFou3FDAyaznvFLjgOPZl9LX23W0NUDt/haEVxOa6LdF+2zFyIErzZHH2lMNBN5rI
	xlJIIijZX9cf5oOmzqVG2E2dw1P8E9z6pBqxoD5pReqZp+Y2y6MlC1g+LmzLGiXBJ0GplA/yfzi
	xQmUxjKGJ6xKXcFyrRy1+uUGgArtUzId0NwAEj+tDLQFvleByHY3SKxjmGvHTlMRpmroDFP/zn+
	vOB9h6jdYCnFHdX3rYQk6Rio8vbzQ9nX4CasPt60lhDEtmgKrxQiz+Z/+EQzpzEbBr2o6IbYTXo
	Y13GsOECwpfzsKrQE+bLB1NBiaPANSEIAJv/GOd5UkXJGpOl72wa23xPIx99XABZ52QawvhxCuE
	rNMm8ZczeRjngK5oyPKipnmESicHBKDjUsw7SBoqtw5uXyzh19TJh3WOABdDU1AbCdkN19HdA1X
	kdD/DE7kAqGKBpT7HIPNtvHIN6vHhpaVWU67MNzW7/6FSM+hCPlWyRuV1XfTx986htT3vCOsiff
	S9X5BTA6ynLUq4hn/V1lhtaJ4uqnZ6iKrlo7Z6ILeFfLdKMusNkXJ9Rl3vyqLwaju35czKCODPQ
	b4cTl0W8oczk6131ucrGxwltT4YNwLzyRXQbgRifOBz9Rw6NAB9juD2Oebb2GQ==
X-Received: by 2002:a17:90a:ec90:b0:3ae:2961:14db with SMTP id 98e67ed59e1d1-3ae580af9aamr880409a91.21.1793161493177;
        Tue, 27 Oct 2026 21:24:53 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:52 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 20/60] poppler: patch CVE-2026-102621
Date: Wed, 28 Oct 2026 17:23:18 +1300
Message-ID: <435cd16e9bdccb260aa7f9d248869dc2334b733b.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131572
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-102621

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../poppler/poppler/CVE-2026-102621.patch     | 40 +++++++++++++++++++
 .../poppler/poppler_26.08.0.bb                |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-102621.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2026-102621.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2026-102621.patch
new file mode 100644
index 0000000000..823c3a33db
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2026-102621.patch
@@ -0,0 +1,40 @@
+From eaeeb2fe58aad490bc82aa33d75217dead0dd0de Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Sat, 8 Aug 2026 15:02:27 +0200
+Subject: [PATCH] Fix integer overflow in SplashClip::clipToPath
+
+Issue #1763
+
+(cherry picked from commit 323c91036d99926a8b90dc14329f7b40aece22f8)
+
+CVE: CVE-2026-102621
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/323c91036d99926a8b90dc14329f7b40aece22f8]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ splash/SplashClip.cc | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/splash/SplashClip.cc b/splash/SplashClip.cc
+index 78249652c..b096beebd 100644
+--- a/splash/SplashClip.cc
++++ b/splash/SplashClip.cc
+@@ -23,6 +23,8 @@
+ #include <config.h>
+ 
+ #include <algorithm>
++#include "goo/GooCheckedOps.h"
++#include "goo/GooLikely.h"
+ #include "SplashErrorCodes.h"
+ #include "SplashMath.h"
+ #include "SplashPath.h"
+@@ -211,7 +213,9 @@ SplashError SplashClip::clipToPath(const SplashPath &path, const std::array<doub
+     } else {
+         if (antialias) {
+             xPath.aaScale();
+-            yMinAA = yMinI * splashAASize;
++            if (unlikely(checkedMultiply(yMinI, splashAASize, &yMinAA))) {
++                return SplashError::Generic;
++            }
+             yMaxAA = (yMaxI + 1) * splashAASize - 1;
+         } else {
+             yMinAA = yMinI;
diff --git a/meta-oe/recipes-support/poppler/poppler_26.08.0.bb b/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
index 8b0783d001..f24ca34366 100644
--- a/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            file://0001-workaround-build-racing.patch \
+           file://CVE-2026-102621.patch \
            "
 SRC_URI[sha256sum] = "dc906e68cea698109706ac6aa3d2c9d4512fcfcac42d90b8afcda486d1b9abd0"
 
