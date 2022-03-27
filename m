Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FF7C43217
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 01:14:43 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.1347.1648343679822693338
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PYFoH6kB;
 spf=pass (domain: gmail.com, ip: 209.85.210.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id y10so6245832pfa.7
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pbrjDhCO/Ghv8ypSc1wesxo+p30iTfcCpkDsARTpUA4=;
        b=PYFoH6kBBe9g1tD5N29/7d99hXoLLTgmrg8ytLz6on5+qtSFLwgTQAJcoxs4wq7a/F
         FL6O8l1FKys/0rzWUmCROv2Y1zgatnHUZQflZ08rcroPE5WIsefR0mARwjytIcTsOgHn
         sj9HrMMLrs0baVFgKjNqOukm6xzW1BiYVswz2tESxwU+fRminimNYMhVpifEHi6S2a3c
         UlpNNH2wWlqx51UV3LWPVZRQOJu1ubFedVD3bQgHk0zxEjYWMWvwYb4GOfwbM2HFg+0K
         sQdUiETr/y3Bl19MXLQEldtG1FBx94GaU/sJHENx2ZVS250b2uqSLkyUuRCPt1itpC4d
         SFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pbrjDhCO/Ghv8ypSc1wesxo+p30iTfcCpkDsARTpUA4=;
        b=VMGlERXDPKE7vuHY0Dvj3SYKA8Os0yLLFtJC9P/fqxi8DnSEtW1Dpl7jCey39oRtqK
         ps0cCrEQtR/aI2XjF5Al9HGhu+CVE2UpjXAgnc9b/eulZdAtlZf0EWTghGlbMcevnWVT
         KpFG0iJvcNN9PZ8UBKMNDOZFERAbp/lHsNozo+RqdvYTtgxmPXW/4uSpKUNjlI/vJi2N
         yB5IQgc99NKrSzE9rUch9wZnqkR8pMaSbUvi3wIL+jFszcfBS/lJEuPOvbU22yuymYQz
         lbF+rM55OJMUNZtk0XpSHKV+5/uA5y6PuA/PgHbjEc10VE7kOrPpPX7FZvMv9az679Qw
         y72g==
X-Gm-Message-State: AOAM533w1v1c3RF0+cEh+9aM3qw8qXDK+vsGuHa+NJNXBGVxAHObJ2jS
	fAHzupYMfO+mdoMqeWTH2UhB0A09cCU=
X-Google-Smtp-Source: 
 ABdhPJyE7TzDcMDu6KrYmopmPZIjxzrFY8BFtM/P/4cjnOq1wFWeIeLwfqsmfq7gQ5Hs+oagPloGCg==
X-Received: by 2002:a63:a808:0:b0:398:dad:ce1a with SMTP id
 o8-20020a63a808000000b003980dadce1amr5143871pgf.8.1648343679189;
        Sat, 26 Mar 2022 18:14:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 b1-20020a17090aa58100b001bcb7bad374sm16525147pjq.17.2022.03.26.18.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 18:14:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/6] gperftools: Disable cpu profiles for ppc/musl
Date: Sat, 26 Mar 2022 18:14:31 -0700
Message-Id: <20220327011432.555592-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327011432.555592-1-raj.khem@gmail.com>
References: <20220327011432.555592-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Mar 2022 01:14:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96220

Enable heap profiler and heap checker for ppc64/musl as it works now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
index bd42e7c4ec..d056622b2b 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
@@ -39,7 +39,8 @@ COMPATIBLE_HOST:riscv32 = "null"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:toolchain-clang:arm = "arm"
 
-EXTRA_OECONF:append:libc-musl:powerpc64le = " --disable-cpu-profiler --disable-heap-profiler --disable-heap-checker"
+EXTRA_OECONF:append:libc-musl:powerpc64le = " --disable-cpu-profiler"
+EXTRA_OECONF:append:libc-musl:powerpc = " --disable-cpu-profiler"
 PACKAGECONFIG ?= "libunwind static"
 PACKAGECONFIG:remove:arm:libc-musl = "libunwind"
 PACKAGECONFIG:remove:riscv64 = "libunwind"
-- 
2.35.1


