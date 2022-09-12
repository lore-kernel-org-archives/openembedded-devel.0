Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06E2C6FA8A
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 03:41:36 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.3715.1662954090633906407
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b+1CzHIz;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id jm11so7328195plb.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Sep 2022 20:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PMT5/GN04BaQZeQZ3giU1l48xLTyKeOUDn8tmAa4nCY=;
        b=b+1CzHIzZQgep/O5tjGK+a8AFi+xI/GRofjZxp4h6dctENesmOAEEiI71ab1nMWJtd
         vBzrvwgKdQ6F7p4860vzFPbr74G79JO6qAQLxOfYcJzAVSa0njssBA+yHntFCnlp4UNx
         QV68rwXlizfLPo4g9OxSMQWbC8AFpgHPArT/JGqz8k0XkVeZi6L3EMdASWi89QWLzreD
         qaJKffRCLeL4M9c37RGUSotrzErCd9GVq7vX1WVq+/uX7xwWQ0kcOgEAWBsRHk3BShdO
         tNdFdvU3mbfyBuAM35oM0kHFnQVW65j5AOQ653sHoeJw84AzI1hI+te4UeiXxEJAc6UB
         zfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PMT5/GN04BaQZeQZ3giU1l48xLTyKeOUDn8tmAa4nCY=;
        b=POOQLTv1ZIZBrxlCeIDPqoxOehHR4v+9XPgnYCh5rV+wXjByVuS1XQvGlIErMBH/9m
         RlvnECNhKZUJKayMmUY3xlq7K20sLnHlU9TWLW5Vvf9MZIPnTl1EtC8A75uCFCwNZ1Sh
         Md7JIpZ1PMKhCXwlqIpOheAsmuDsr0yN20qtvG6vizbtGAiyt8ywG/HpGBtWZEMZc9fq
         GDhklBAjNcm6vcvXU127RsRmoTR2mMNmsm9AE5i/QQfZQl0J/+bZ/xiyYBr1qA6MEdFQ
         PtxwZzaYKGQZEQIZZPHvSqdIs7WgSzUwq5pGWM+ivR2AZUvb6WWLfk+F2e6muBwDD3oR
         qLyg==
X-Gm-Message-State: ACgBeo31PPhMmh5zJ5q7MEI6e34RTEkWIRV2Di7dI0cgjddSW+HkAIiH
	8knxbPPaVEzxbwptXJ1OEVFh0HNqsSPpEA==
X-Google-Smtp-Source: 
 AA6agR6SKrEirRpOrWTIWM6qOpkIgVB5puXPpxcHT99lP6Q4J/boNsU2uZQzyVx+etD3eVFAXV8g+A==
X-Received: by 2002:a17:902:dac7:b0:178:2aab:6313 with SMTP id
 q7-20020a170902dac700b001782aab6313mr4534445plx.147.1662954089781;
        Sun, 11 Sep 2022 20:41:29 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fc7])
        by smtp.gmail.com with ESMTPSA id
 d7-20020a170902cec700b00176ea6ce0efsm4664940plg.109.2022.09.11.20.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 20:41:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/7] luajit: Use builtin for __clear_cache on clang
Date: Sun, 11 Sep 2022 20:41:20 -0700
Message-Id: <20220912034123.1885229-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912034123.1885229-1-raj.khem@gmail.com>
References: <20220912034123.1885229-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Sep 2022 03:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98744

Fixed build on mips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-builtin-for-clear_cache.patch    | 29 +++++++++++++++++++
 meta-oe/recipes-devtools/luajit/luajit_git.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/luajit/luajit/0001-Use-builtin-for-clear_cache.patch

diff --git a/meta-oe/recipes-devtools/luajit/luajit/0001-Use-builtin-for-clear_cache.patch b/meta-oe/recipes-devtools/luajit/luajit/0001-Use-builtin-for-clear_cache.patch
new file mode 100644
index 0000000000..2c41180d91
--- /dev/null
+++ b/meta-oe/recipes-devtools/luajit/luajit/0001-Use-builtin-for-clear_cache.patch
@@ -0,0 +1,29 @@
+From ca8f7d968a212f2da64492faac4f80384a5ba395 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 11 Sep 2022 13:23:19 -0700
+Subject: [PATCH] Use builtin for clear_cache
+
+This makes it compile on mips/clang and also portable across platforms
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lj_mcode.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lj_mcode.c b/src/lj_mcode.c
+index 163aada4..471897da 100644
+--- a/src/lj_mcode.c
++++ b/src/lj_mcode.c
+@@ -46,7 +46,7 @@ void lj_mcode_sync(void *start, void *end)
+ #elif LJ_TARGET_PPC
+   lj_vm_cachesync(start, end);
+ #elif defined(__GNUC__) || defined(__clang__)
+-  __clear_cache(start, end);
++  __builtin___clear_cache(start, end);
+ #else
+ #error "Missing builtin to flush instruction cache"
+ #endif
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-devtools/luajit/luajit_git.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
index 3f3939eeb4..dd1cd51698 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_git.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
@@ -6,6 +6,7 @@ HOMEPAGE = "http://luajit.org"
 SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1 \
            file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
            file://clang.patch \
+           file://0001-Use-builtin-for-clear_cache.patch \
            "
 
 # Set PV to a version tag and date (YYMMDD) associated with SRCREV if it is later.
-- 
2.37.3


