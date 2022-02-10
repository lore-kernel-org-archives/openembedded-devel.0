Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A788C433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 16:27:02 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.12538.1644510420891950769
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:27:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=orX0EJE3;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id f41so4276061lfv.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dd7rDKnOlHTBclqkn4LxNgfr6m8mOYvNHsR/Jea0CsU=;
        b=orX0EJE3fN1WlyD2a9h9cpvpxu93Y4u1sDaShb72LGru1729o+RpTtypqlpKogNayU
         khEy9QOaR62HKWGeEsft7iZCjepW5baWE2SAnD2ha1eucmby4fNB7bC3tzYRKEQTuIqv
         wQkV9OwoG3Ky5RDeEK3A4TPw/bJc5S1sxe2lzvo+MVcRV5Lfh2lydU/VX04L+nWyaO5u
         NDWzPQiQxGpnQBkCBeSrNHkAmF30vZ0vf10oe0DLr0orYbfjRl8MywWDukgrtRalrWo4
         TvURPPQ0sVG1LhMpM/tl3ehdhFAz+cfheFxz0JHJylGppZZL2HGW2fDwDd1EXDKJjtNc
         /Yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dd7rDKnOlHTBclqkn4LxNgfr6m8mOYvNHsR/Jea0CsU=;
        b=bBFvsBHMj78oetSa+xjHCMuhO9TrnjMOEEsZ/HxlPP1c3wyMjnDyvz/uSIzNFvxAkd
         JjYEu85uIlbILt50PwZYm9lEcq4EiEOanyW/tFfnEBjy+g8o3GhqenWSS4c+ZksV7V5P
         Sno5tFg0t9aZo1j7AFCdtMeeg60wclsAz4letHUPFMayfLfhcBFMOelkTNWDIjb51Zyt
         lNJhIuvKIuDBWD3cmcW250QynOE5nysQz5e+jA62FLIVrjjuU3dVGNEtrrBzA4OeHP9t
         YITAS6QnkJ1SzBlLE8S7vX/ursu2FbjKz7nE4Sde+HIkoeGhepoJtjgZY+BnxVB/lbxX
         WWow==
X-Gm-Message-State: AOAM533tqlVA2hhcECu9WLt7ppG6tWfHtHXy/89+bJq62Wk/bNDpBrsi
	yuQf6jM7SphoZkothoFLwbEXGEVt2/vQTI+M
X-Google-Smtp-Source: 
 ABdhPJypdbbjZRAoQ/RYxIbMoa1NEzJfTVZsEDHgMZwuW0WNXWb7BWJvkfMwhzIJGfap+F6ocyJvGg==
X-Received: by 2002:a05:6512:3991:: with SMTP id
 j17mr5645147lfu.391.1644510418477;
        Thu, 10 Feb 2022 08:26:58 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 b26sm2841638lff.28.2022.02.10.08.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 08:26:58 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] capnproto: update to 0.9.1
Date: Thu, 10 Feb 2022 17:26:54 +0100
Message-Id: <20220210162654.2253271-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 16:27:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95290

Removed upstreamed patch.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...on-32-bit-architectures-using-64-bit.patch | 38 -------------------
 ...{capnproto_0.8.0.bb => capnproto_0.9.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/capnproto/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit.patch
 rename meta-oe/recipes-devtools/capnproto/{capnproto_0.8.0.bb => capnproto_0.9.1.bb} (81%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit.patch b/meta-oe/recipes-devtools/capnproto/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit.patch
deleted file mode 100644
index 43da4a9ef7..0000000000
--- a/meta-oe/recipes-devtools/capnproto/capnproto/0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From e2a05a19e9dc51287e19cc9f11fd91449219e361 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Nov 2020 12:10:28 -0800
-Subject: [PATCH] mutex: Fix build on 32-bit architectures using 64-bit time_t
-
-mutex code uses SYS_futex, which it expects from system C library.
-in glibc (/usr/include/bits/syscall.h defines it in terms of of NR_futex)
-rv32 is using 64bit time_t from get go unlike other 32bit architectures
-in glibc, therefore it wont have NR_futex defined but just NR_futex_time64
-this aliases it to NR_futex so that SYS_futex is then defined for rv32
-
-Upstream-Status: Submitted [https://github.com/capnproto/capnproto/pull/1103]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- c++/src/kj/mutex.c++ | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/c++/src/kj/mutex.c++ b/c++/src/kj/mutex.c++
-index c81cead7..e1594b11 100644
---- a/c++/src/kj/mutex.c++
-+++ b/c++/src/kj/mutex.c++
-@@ -39,7 +39,13 @@
- 
- #ifndef SYS_futex
- // Missing on Android/Bionic.
-+#ifdef __NR_futex
- #define SYS_futex __NR_futex
-+#elif defined(SYS_futex_time64)
-+#define SYS_futex SYS_futex_time64
-+#else
-+#error "Need working SYS_futex"
-+#endif
- #endif
- 
- #ifndef FUTEX_WAIT_PRIVATE
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.8.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
similarity index 81%
rename from meta-oe/recipes-devtools/capnproto/capnproto_0.8.0.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
index 774423192e..164bb2cf8a 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.8.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
@@ -6,9 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https \
-           file://0001-mutex-Fix-build-on-32-bit-architectures-using-64-bit.patch;patchdir=../ \
            "
-SRCREV = "57a4ca5af5a7f55b768a9d9d6655250bffb1257f"
+SRCREV = "b49431c48d40490ef979247d308af63345376cee"
 
 S = "${WORKDIR}/git/c++"
 
-- 
2.25.1


