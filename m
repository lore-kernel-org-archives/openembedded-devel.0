Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E57C636D3
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 21:00:53 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.25725.1675026045420040873
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 13:00:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mi1IBkxK;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id s66so8559578oib.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 13:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbChMfugD+5lXPTj857swDpIncH/h78jxpmDV+kczPc=;
        b=Mi1IBkxKcDqn7GPx5Q4hftMtTQpp/pd1PMeYxl04M37lhWy0DjYwsTj86vn+4uKeyg
         9449QF0aFYsqk6/mM0vN2GgHs/Bex2xPR2tujzPwWDGeVK77N9ihxudWjjMVnpMt+5FQ
         R3QggBdgLz6K8SXoSirrue65QQIv9/pynPE98/fz9uh68x9Q9OmiSYqbJk178dQWxVsE
         eo6OWDdfeWRzWYADxapZ8e+G56TdfFiSq8vabko6+D8PRqRY/dm2BeIleHhY3EodgtZK
         zH65N7zvlObL5iKYmKXZ5ppc0/EDfRt3xfgQrU6L1h5FkR1BOY+rUltr3S0ArWy6uM1m
         7Wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbChMfugD+5lXPTj857swDpIncH/h78jxpmDV+kczPc=;
        b=wi5EWU2LFsYG1FLk+Pcw3pO7jd/nPvCadNns0m1jsy51KzWDlRCuhsVIOozrREx3ft
         obKyK+mrxf2BcpJqX7lzaLhHT5/QK5volE0Lbed0zZz9kOJAMg10Ab/FyywXvw8EttO8
         hhamk6EQFrmkvGIbhmTJr+3+b32E57VKH6LgICK7zSWzc7KGoImjh59PzfRcWlWiTouD
         GmsEeeCIPtfytMYS3Ykd+i3mBSopQEA7H7xaBAixPDWEKAOXzzdYjzNOza8HrqXpMH6t
         ra2lLFPuX6zxiTDiJzMR57QvWFT5Y7w8oO0rzsm0XZhF9xTe0edUK2QMTJ0g4XQ+zZKt
         nn0A==
X-Gm-Message-State: AO0yUKX4e1duOVZCXBTFR2andKo0c+6zKVyC6PzvFEemv8ITNXRHX5GK
	l/lToA+4cxsok7tcFpgUlsyW6+2+TP4=
X-Google-Smtp-Source: AK7set94OS7uiQVF/mob5ZT/7hQTQa5rF9nNuxuNkWes0G6mq835TdFMNQpBO/ITn5sHk2BMSclFEQ==
X-Received: by 2002:a05:6808:1385:b0:364:8f2c:186c with SMTP id c5-20020a056808138500b003648f2c186cmr3664843oiw.7.1675026044568;
        Sun, 29 Jan 2023 13:00:44 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:9bdc:8bb4:6dc0:aa04])
        by smtp.gmail.com with ESMTPSA id m17-20020a0568080f1100b0035028730c90sm4024065oiw.1.2023.01.29.13.00.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 13:00:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 03/10] redis: 6.2.7 -> 6.2.8
Date: Sun, 29 Jan 2023 16:00:31 -0500
Message-Id: <0287453b9cf4d1d104cffcbd98a434b00e537a71.1675025970.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675025970.git.akuster808@gmail.com>
References: <cover.1675025970.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 21:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100837

From: Changqing Li <changqing.li@windriver.com>

This upgrade include fix for CVE-2022-3647

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0006-Define-correct-gregs-for-RISCV32.patch   | 15 +++++++++------
 .../redis/{redis_6.2.7.bb => redis_6.2.8.bb}      |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.7.bb => redis_6.2.8.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
index b2d1a32eda..9d7e502717 100644
--- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From 6134b471c35df826ccb41aab9a47e5c89e15a0c4 Mon Sep 17 00:00:00 2001
+From 26bd72f3b8de22e5036d86e6c79f815853b83473 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
@@ -13,10 +13,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 24 insertions(+), 2 deletions(-)
 
 diff --git a/src/debug.c b/src/debug.c
-index e7fec29..5abb404 100644
+index 5318c14..8c21b47 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -1039,7 +1039,9 @@ static void *getMcontextEip(ucontext_t *uc) {
+@@ -1055,7 +1055,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
      #endif
  #elif defined(__linux__)
      /* Linux */
@@ -24,10 +24,10 @@ index e7fec29..5abb404 100644
 +    #if defined(__riscv) && __riscv_xlen == 32
 +    return (void*) uc->uc_mcontext.__gregs[REG_PC];
 +    #elif defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)) && defined(__ILP32__))
-     return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
+     GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
      #elif defined(__X86_64__) || defined(__x86_64__)
-     return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
-@@ -1206,8 +1208,28 @@ void logRegisters(ucontext_t *uc) {
+     GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
+@@ -1222,8 +1224,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
@@ -57,3 +57,6 @@ index e7fec29..5abb404 100644
      serverLog(LL_WARNING,
      "\n"
      "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.7.bb b/meta-oe/recipes-extended/redis/redis_6.2.8.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.7.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.8.bb
index 7f922a4e0f..02ee19fb7d 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.7.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.8.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "b7a79cc3b46d3c6eb52fa37dde34a4a60824079ebdfb3abfbbfa035947c55319"
+SRC_URI[sha256sum] = "f91ab24bcb42673cb853292eb5d43c2017d11d659854808ed6a529c97297fdfe"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


