Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2215BCCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 19:49:47 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.28494.1759866579387236667
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 12:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HfHBzqqY;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-637e74e92easo11287698a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 12:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759866578; x=1760471378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IuftbTmidkUHlJrecnRJfsxDY7noQ6GjfdAQ0HNHX70=;
        b=HfHBzqqYltNVRv/pTSWlGXCCy4m1gOHxZ18VO95GTvhnf7ow9lHJmg9WofvxfpRNrE
         sl4U4r+7auec0Ay8HV4SDfvQm47+1n60Ng6ekfLfTYHouD0rFZFVzNBpnxwsQ0OlLZw3
         XWL6QKNs6BkabGaTzbRNNJwJuyOT36lexk9YZL+KlpJfGOmufzwQacRUpig/wa4bue5R
         6uhhzmCIkBiYVFFiqKFJQKhPV96mNnBY4BJQ1hPXtkGC47IKoi8sJVI/WpZRdGk23NI1
         Dc7NH3VmjznbZdcuu8p5pqfbv37dm/j8lpMDQDqfDv5+6xIEO+Epksp+8TDHv9x+efPe
         e76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759866578; x=1760471378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IuftbTmidkUHlJrecnRJfsxDY7noQ6GjfdAQ0HNHX70=;
        b=P0Nsi2YgQZ81R1URLL62NtmnIxj/Nm2LUs8Xvz+dxxZlrp4y2xxCgGPBbE9R2s59wT
         UbhxZzGSb0xqej8uCnc0kjIQd7E+fP/2wjjkaPDIwyX++1SOuUWCxAU84HQo1VCgdyw6
         0haNeG4As2EiCBmJpUkejW2f8wNqOsjQZa9urcdM6kkw5Utr0stRdmM7u3CSl/28gLzC
         9eKRt1kJSzkDMuNKcmpEqWvhdKYzwyMzA+ZO5rqJMjybo+01myIOjH49vdvI4UnlIupX
         tGgahez4748NHIECdDCJyWP8opn950cmQGiDBbGCEDN9u6Cu6DxLiP76DuOX/CJRlNSl
         HUDg==
X-Gm-Message-State: AOJu0Yzcf25EeUopCECrQkvFh4N1Ex6G7GkftB74NzwlMS9Bmti6b3hf
	32l6NYBpDoCuO3MXsCEVnMC7Z4KqnhNV1c2xy5F8RT+6bmZSL+zE5tCihGKLMg==
X-Gm-Gg: ASbGnctfwyX+x6IHxXPQwjUsD7hG/HRWUoTGPqphlWjXJuHHZa2w72j0odz9eN2iVxm
	OSir5IJORET8x59mxlwuSGCN6O3VCwW8jz/ZKSaunjhj35TzBHPrM2hYEzyDmfWFGC4/C466hjq
	DSC2j6MRyL7iXeJGkbMNgje3u3nBbfoxNPIDeLMapPWKrWDmvjoBOoUPPkrhXz+iGu2lWnIUqYN
	rd0imYO6cEYmoDgJLRFUodcCLwsTNL6s/J+icQ8cnHe/qqj74KRTiXe6gW/zmRQnZ8YYhltlRbz
	EzhrXoJVXvPFGYcE1A13RstY3l5hheM1n+N3y6QqzzNxj/KvfjfxQSQc+i45jvLsGOkyvcM6ADJ
	8vPzq+H4BqxWSok6ueT/0EnNvS4yqK4bKumOWsNplwP/R
X-Google-Smtp-Source: AGHT+IFKhXWokga3EooND7NS7PXntt1XXA//CJX9ojYdPocK+FqvlKhPGsrmOXflcC2CtgRP5zSvEA==
X-Received: by 2002:a05:6402:13d0:b0:62f:d87d:c36d with SMTP id 4fb4d7f45d1cf-639d5b57a4cmr603689a12.8.1759866577316;
        Tue, 07 Oct 2025 12:49:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6378810112bsm12961955a12.26.2025.10.07.12.49.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 12:49:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 1/4] redis: ignore CVE-2025-21605
Date: Tue,  7 Oct 2025 21:49:33 +0200
Message-ID: <20251007194936.146845-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 19:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120346

The vulnerability has been fixed in the used versions already,
upstream has backported it.

6.2.18: https://github.com/redis/redis/commit/5e93f9cb9dbc3e7ac9bce36f2838156cbc5c9e62
7.2.8: https://github.com/redis/redis/commit/42fb340ce426364d64f5dccc9c2549e58f48ac6f

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.18.bb | 2 ++
 meta-oe/recipes-extended/redis/redis_7.2.8.bb  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.18.bb b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
index 171c6640f2..13344beae4 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.18.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
@@ -65,3 +65,5 @@ INITSCRIPT_NAME = "redis-server"
 INITSCRIPT_PARAMS = "defaults 87"
 
 SYSTEMD_SERVICE:${PN} = "redis.service"
+
+CVE_STATUS[CVE-2025-21605] = "fixed-version: The backported fix by upstream is included in the used version"
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.8.bb b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
index 3c4d84085b..38d8e5ffe9 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
@@ -74,3 +74,4 @@ SYSTEMD_SERVICE:${PN} = "redis.service"
 
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
 CVE_STATUS[CVE-2022-0543] = "not-applicable-platform: Debian-specific CVE"
+CVE_STATUS[CVE-2025-21605] = "fixed-version: The backported fix by upstream is included in the used version"

