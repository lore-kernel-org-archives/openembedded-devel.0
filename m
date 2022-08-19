Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56066C25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:03:58 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.372.1660892632110862691
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cISAzG0u;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id s206so3071009pgs.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Y7wUvKWBu+Si1N2j0q8b1Gc547LIb+/blpvVUGz208M=;
        b=cISAzG0uQic32Ew2vfWaAUODkyuBeUk3Ov9CgRjKMoQMDu6WJwuOrSYU0VJeoTQg4e
         rdYTyeuhs2BwWRuK9SDu465Byi2OfmfluLHfCWWiuP8FPGVP6JjFuc7JEhNo3nRZkiui
         wOW9hMU7TKFa+ux5lhswoIYpWKW2wOgT7p240vm01cziHIZwK3P0ixxurDdM7LHl4lX5
         pzWKMbUzfjRWX7RiJDBgFU/t68j0PxFmJ5TlHXCOn152yro282RuAtlgN2OcCdzhrrNg
         cWrTtvwEyPgxEL7WzhESNilm8l0uc7DAj8d/vpftOqgAxBoFt/Y+PqNwNAYg4RHuTDEQ
         d10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Y7wUvKWBu+Si1N2j0q8b1Gc547LIb+/blpvVUGz208M=;
        b=MXRpRRQNT+jOElNJwY8fHPSjMpbXXTVz/V9/baLLIyEzDPP93L8ztRqOMo1EJnU2aB
         LQlT+WdAUH8/X1gyUZqyLr+ZeCJi80X/I/GnPBRGrAps2T6RiQJDUFppPI/xziT0JVSq
         Em0153JwIENZznsc5V2a0gHiz0959BwuvZDcV4UMZaSZODHJaLoJhYDGFC1OQzKIGLiu
         bMMdyCQsp56b6sZg3RAkcbQcQSkEoyYIt8GwqEVz+pwVoF2TnRnqTATcuxJPRWsWKFvf
         ZsSs1w18OjpCbDl75X1a4XhlftgZCbN/z5tR1oZRTE8RkPrXMUxAjziL7X7RX0NBVo1S
         0kHA==
X-Gm-Message-State: ACgBeo0X+SEj36ZAi173aojaZSUivYhMo0Gqd9sKpt0ta3xw4zV389CG
	KcVzaW+ZSDD7X5VWsRBNj20LC9FY0FcYfw==
X-Google-Smtp-Source: 
 AA6agR7m70AI3HF5j+vB/4dgyja7/+JcjicG+pa8B1NpbSZFEVsYWMRKYqkmJm3oNEd/nYeKTnDrcg==
X-Received: by 2002:a05:6a02:205:b0:420:8b7e:3ff with SMTP id
 bh5-20020a056a02020500b004208b7e03ffmr5059729pgb.427.1660892631230;
        Fri, 19 Aug 2022 00:03:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d53f])
        by smtp.gmail.com with ESMTPSA id
 202-20020a6304d3000000b0041bcd8f3958sm2314639pge.44.2022.08.19.00.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:03:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH] klibc: Fix build with kernel 5.19 headers
Date: Fri, 19 Aug 2022 00:03:48 -0700
Message-Id: <20220819070348.1490913-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Aug 2022 07:03:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98324

Backport relevant patch.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...failure-for-some-architectures-with-.patch | 34 +++++++++++++++++++
 .../recipes-devtools/klibc/klibc.inc          |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-initramfs/recipes-devtools/klibc/files/0001-fcntl-Fix-build-failure-for-some-architectures-with-.patch

diff --git a/meta-initramfs/recipes-devtools/klibc/files/0001-fcntl-Fix-build-failure-for-some-architectures-with-.patch b/meta-initramfs/recipes-devtools/klibc/files/0001-fcntl-Fix-build-failure-for-some-architectures-with-.patch
new file mode 100644
index 0000000000..4fc4b45fb1
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/klibc/files/0001-fcntl-Fix-build-failure-for-some-architectures-with-.patch
@@ -0,0 +1,34 @@
+From a33c262f828f803fffdad8e1f44d524dc9c75856 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 3 Aug 2022 01:10:01 +0200
+Subject: [PATCH] fcntl: Fix build failure for some architectures with Linux
+ 5.19
+
+Starting from Linux 5.19, the kernel UAPI headers now only define
+__ARCH_FLOCK64_PAD if the architecture actually needs padding in
+struct flock64.  Wrap its use with #ifdef,
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/klibc/klibc.git/commit/?id=bb2fde5ddbc18a2e7795ca4d24759230c2aae9d0]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usr/include/fcntl.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/usr/include/fcntl.h b/usr/include/fcntl.h
+index ed703a6..cb2e4e5 100644
+--- a/usr/include/fcntl.h
++++ b/usr/include/fcntl.h
+@@ -33,7 +33,9 @@ struct flock {
+ 	__kernel_loff_t l_start;
+ 	__kernel_loff_t l_len;
+ 	__kernel_pid_t  l_pid;
++#ifdef __ARCH_FLOCK64_PAD
+         __ARCH_FLOCK64_PAD
++#endif
+ };
+ 
+ #ifdef F_GETLK64
+-- 
+2.37.2
+
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 4c915af2fa..5acf679983 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -20,6 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/klibc/2.0/klibc-${PV}.tar.xz \
            file://0001-klibc-Kbuild-Accept-EXTRA_KLIBCAFLAGS.patch \
            file://cross-clang.patch \
            file://0001-workaround-for-overlapping-sections-in-binary.patch \
+           file://0001-fcntl-Fix-build-failure-for-some-architectures-with-.patch \
            "
 
 ARMPATCHES ?= ""
-- 
2.37.2


