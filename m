Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA8FCAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 19:46:33 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.35830.1758483985645666243
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 12:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BRReA01H;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0418f6fc27so638744966b.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 12:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758483983; x=1759088783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8OT0KISo078jwtfUzrhaBTeOelmi88/Ybotgx68T/A=;
        b=BRReA01HXthtrXPgROOrmNuNWLncNOjnM9cXHSJPtuzzfZiyh+xLarYIQ7fdoWj3a0
         lJq+ZhYfpikTw4fH3Imm8J3DkXoHp1PYPr0x/AzuF4ZLHr1FvApiu74FSrkAtLlnAKS+
         5Gv/lb/uIR7L1YXhsNdibls+B0bnGFUv6xzfyZ8TSeiMTd4C7aa0HcYyyFBFpMiaSXfJ
         eGS7XZ2LSbqKScoz68Rou5tLrKRXd4HWzFPhRrOovSzIO26M9azIkseXRLHjBeSPWITj
         kRlDEdAzJIHhYLKcj7nioWCelbdI/U/dL4i0sND0YK9E5YSMAyRE+XQXTmAheq9+C01l
         JkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758483983; x=1759088783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8OT0KISo078jwtfUzrhaBTeOelmi88/Ybotgx68T/A=;
        b=vHwpiEuhCmYIqwNYVDMcKkwSjNnH+OvltilKTP7W7H13+VEjafVvudGcl4T9I0SFpE
         v8Y+mFE5Zukgbms3tvgQs6JnGp16MtpWDFYImnyqYAiGD++djzK+VMcJCqIglVIpJsMn
         Ky7Q/jYNtSk5YeWqtvcMMR39vyfw59FaukO7Ef/gQg0harjm7loGtpZDHoCItonvBuWS
         W1evwV6X3cRNTBpGyLUfjHB5btqSFgHk18PBIYw3EPfTWw8pJjb+pukZc7tqWuGxaLaZ
         e4xc6H4HCAtmp+zUrnaBFpwfehe6JP1X4sPF20pGrbtku/907mT/ve3vvGmqFHV1Zqk2
         FVsg==
X-Gm-Message-State: AOJu0YzqoxMZsPAq4/2E+RzgBq3HNk0zh6fNHU0qrdCYxMqoPO7JYrb5
	C9BgZA+LvEgtHcVErZL4S67t15U1bpvpfvyo/0xwA9EKoyIw6tgypUhl4w1VhfLC
X-Gm-Gg: ASbGnctXsvIjcvvJEOJspEzSRFoOKpKOsgf4bLbynwqL0NOxT0LUeFkHJWECU/gxHM3
	NYLJzOthTP3tUkaNIYkVNTqSrzYzWZySacAJahC4dFZxgGzIhJLdrBVyzPtyFJ3LSgPtDQQWhHT
	AAAx2q8BGVxw7onzulbXa7tUw3Kliw0GswmprtdHoDNzNH4bBhgiTJM+HKsmw80+yZ6KWUynlJf
	8WSBxESbjJoitjp7YMk6Vhw5UUDsTiIRbMDteI8lsVvRr6q1eI13500VmynoLhJITSadNpEgugq
	WMAkigF0Ysl/RvpLsTQmRGHlmKqQsMuLG6FRXBpxG2KkggTf+9C6EkcTqMaMfq5SpvNHn/VV1vV
	2e8+XXiTN2mV8nGe8zlSblyGzpgpNCAftptVuQnbFJh7nHkxKrNKv2+BuEHm4sVdiyf2iFEKYET
	rrqp0XQwD87h4uAarRKP9jwXpmABVVHXlt
X-Google-Smtp-Source: AGHT+IHHCLekGAjPXJOpeu518OdKI7IGNA+QueAypkJF2EL1jowE6EtSAlJAHbkVcbHwa++gwLwtMQ==
X-Received: by 2002:a17:907:3fa0:b0:b04:26f2:b83 with SMTP id a640c23a62f3a-b24f3e58447mr865259766b.35.1758483983462;
        Sun, 21 Sep 2025 12:46:23 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b29abf51da3sm315549566b.75.2025.09.21.12.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 12:46:23 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/5] python3-pytest-pylint: 3.3.7 -> 3.3.8
Date: Sun, 21 Sep 2025 21:46:00 +0200
Message-ID: <20250921194602.1207268-3-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250921194602.1207268-2-t.f.g.geelen@gmail.com>
References: <20250921194602.1207268-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 19:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119634

---
 .../0001-Adjust-test-expectations-for-ptest.patch               | 2 +-
 ...0002-pyproject.toml-Keep-tool.setuptools.license-files.patch | 2 +-
 .../python/{python3-pylint_3.3.7.bb => python3-pylint_3.3.8.bb} | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_3.3.7.bb => python3-pylint_3.3.8.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
index 46dbe39aef..0f3e7d45e8 100644
--- a/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
+++ b/meta-python/recipes-devtools/python/python3-pylint/0001-Adjust-test-expectations-for-ptest.patch
@@ -1,4 +1,4 @@
-From b23f3031db65e6e98826639755e26f4b169f9e52 Mon Sep 17 00:00:00 2001
+From ed93b7d7f629e95528560f84ead6919b5f1c9d37 Mon Sep 17 00:00:00 2001
 From: Dan McGregor <dan.mcgregor@vecima.com>
 Date: Wed, 13 Mar 2024 14:08:25 -0600
 Subject: [PATCH] Adjust test expectations for ptest
diff --git a/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch b/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
index a0496232cd..d30e852025 100644
--- a/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
+++ b/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
@@ -1,4 +1,4 @@
-From a1ec7fa97cb73754cb250a9cf0ea95b9d0511e0c Mon Sep 17 00:00:00 2001
+From b559c86a8e6efb7f2081c4aacf9ce1c552d60abb Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Thu, 20 Mar 2025 12:09:42 +0000
 Subject: [PATCH] pyproject.toml: Keep tool.setuptools.license-files
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.7.bb b/meta-python/recipes-devtools/python/python3-pylint_3.3.8.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pylint_3.3.7.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.3.8.bb
index c4885ff7b4..9864084355 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "f798a4a3508bcbb8ad0773ae14bf32d28dcfdcbe"
+SRCREV = "98942ba4126a6fe1657bad77027bcc11016d16da"
 SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://0002-pyproject.toml-Keep-tool.setuptools.license-files.patch \
-- 
2.43.0


