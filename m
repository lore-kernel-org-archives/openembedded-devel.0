Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E15C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 23:57:09 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.2420.1634774228695221272
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 16:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dALi+Zk8;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id q19so4315981pfl.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 16:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zJ4I2ziq+FPLpPej6Egr9CuFTc7UQOE1BZFmyZ3GX8I=;
        b=dALi+Zk8iYzM2vXKP4O1Xbk58aCGwaCvfJRUY2u4mlq0/vKuJK1b0bhudcop+JNKGm
         eU3B291BPWFk//PgapEKx26BBfNs4YZ0KDdo1qJzUI9LhNp7AqSUkuQ6yaVjdBJ/G/DN
         WwpU/q4nWuCutu5e1X78Wjn1UQetZfe0YLTW4DaxE0ymqnaREt8Hy9RihiY95LTVeh8s
         D7mLDfehT2Pq6gZGQQItqF2AZvLyv609tuLaQJx3I1DXPiaPWgwjD6OGMWdqec44TuP0
         hI/PvGucWQ9soR9vh9vGA0zwyiY9WDn3i/JgUE7j4sBbhP453KReiNWviWmdL/0DnGUp
         KcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zJ4I2ziq+FPLpPej6Egr9CuFTc7UQOE1BZFmyZ3GX8I=;
        b=pmldtTnMJSG0J/EqL8QQsuaaRuPcOjMvKwJbwtnAu6VjGeHe72NMwt4fuVrPrAXuh6
         NrlmOfKn5Q6vlWxmrsiYnpwe8br5ytpJX92NAxxf6HN8FCk39W743EkE62z2pbQw3Ede
         o+RPsKZv9xnbLg1y3CPIbE6ewj8kS+u1Rpzbmj+efMTnGzL5x/tbQ+NPnbWcYuesmLYu
         ExT2PgQIPmDYlzuUn0fxbJZY81rKq2IEd+n1dxKFGEDhN+61dxGgSpWxct83zEraQ6Xe
         sCtKAtOswfLzb3woFsYbYeL2+8UFM2tKsn2u7IGcLsWz/IYRICHQDmhJ5NYP7HIyawRX
         Fg1A==
X-Gm-Message-State: AOAM531PWDODzrvmkksdQgqn94RNY9EEfpO/+FFEgiJwKRyLdmd3//a/
	/gS0CP6nGHsD+3yLRkTX3CxrCREcry4r0Q==
X-Google-Smtp-Source: 
 ABdhPJweMjapY7Wj+WppaJxyq9CkbMXECK8M4dVGxOfkqOi/QBYLPM/TEnGTJTULbdrIOvNDkiwVQA==
X-Received: by 2002:a63:e510:: with SMTP id r16mr1826226pgh.34.1634774227743;
        Wed, 20 Oct 2021 16:57:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 u23sm4222718pfg.162.2021.10.20.16.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 16:57:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mozjs: Fix build on mips/musl
Date: Wed, 20 Oct 2021 16:57:05 -0700
Message-Id: <20211020235706.826702-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 23:57:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93507

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mozjs/mozjs/0004-use-asm-sgidefs.h.patch  | 35 +++++++++++++++++++
 .../recipes-extended/mozjs/mozjs_91.1.0.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0004-use-asm-sgidefs.h.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0004-use-asm-sgidefs.h.patch b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0004-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..b56f0b95b5
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/0004-use-asm-sgidefs.h.patch
@@ -0,0 +1,35 @@
+From 65acc8800dba7e10da882871d4648241805c47ce Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH] use <asm/sgidefs.h>
+
+Build fix for MIPS with musl libc
+
+The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
+but not by musl. Regardless of the libc, the kernel headers provide
+<asm/sgidefs.h> which provides the same definitions, so use that
+instead.
+
+Upstream-Status: Pending
+
+[Vincent:
+Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=21070]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ gdb/mips-linux-nat.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/mfbt/RandomNum.cpp
++++ b/mfbt/RandomNum.cpp
+@@ -52,7 +52,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PV
+ #  elif defined(__s390__)
+ #    define GETRANDOM_NR 349
+ #  elif defined(__mips__)
+-#    include <sgidefs.h>
++#    include <asm/sgidefs.h>
+ #    if _MIPS_SIM == _MIPS_SIM_ABI32
+ #      define GETRANDOM_NR 4353
+ #    elif _MIPS_SIM == _MIPS_SIM_ABI64
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
index 88aeb2dae5..cc985661d6 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
@@ -7,6 +7,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0001-Cargo.toml-do-not-abort-on-panic.patch \
            file://0002-moz.configure-do-not-look-for-llvm-objdump.patch \
            file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch \
+           file://0004-use-asm-sgidefs.h.patch \
            file://0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch \
            "
 SRC_URI[sha256sum] = "3b913d6a52c95a8986123c98543f1273812a2d59f2891b4b1c604e35f4580766"
-- 
2.33.1


