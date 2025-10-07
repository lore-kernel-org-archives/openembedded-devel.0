Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A5ACCD184
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 09:11:22 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.14358.1759828279064542004
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 02:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mfUc9eh6;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b50206773adso34580866b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759828277; x=1760433077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mmPwYNxnuvubY+fnTRsteIsw/3C/aI17T33JAjuhTk4=;
        b=mfUc9eh6AA2NbzKol1xHihUpWzj82bGZQDp7RKyoyJrya36sI+LTiAffEEKue4ue4H
         T1YVCANif+83/Btu0u5+8cxeqvUVT57eOMQV9izNVvAibNakBGZVsanBknfKKEJ/Egk2
         /bz+QTIjtvgVNr4HbEQQAIxm+Gsm2vPhNCCU7PahFFuqztD/o8sELmG2CC7KLdSvSIjE
         pwHj3ZyTd0fb22T78+R1S8jypebggUP4Kx3Key0H+q7OjMMYvpBilf6mjyKfo25CPbOQ
         TiS2b6TU3GQ8Gbhm62mFJM6UXgAQF+1s/abm6JK2PEzbJFiKRXEXcBjXCMo+7JIxF7UZ
         ucSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828277; x=1760433077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmPwYNxnuvubY+fnTRsteIsw/3C/aI17T33JAjuhTk4=;
        b=IGVSyvrkw2aMxErzlwOPAMMhRVnKDMkL+dIZZFv2Yf2dtPONKlmaU7esPCkwKzxaex
         SY8YoXl3y2b/Kd/uEfkyB/UsgWfZS6M4zKc3RxmLfOXxdMRxAD/ilNKTdXx4ZMeYATl4
         X1iS00p8kL0i9DMcKdRmHGNIt48UpSKrWvQU4IcIlmIbp636B3Lbqo5dMvfW/GqiV8bT
         bs0RIftAO2EZKkiX2/tUv6YkwQK4DvJuvUU0yBwPmXpkzUq13yJMNQo7ZKOUWiNSE6Nx
         H0u2hfe/2rG9sn+gVJ2KWDFISWCkX4VSGoVrzHhQJlL4B0ReNgb6cEkNwuz0ZqTCJMGG
         69mg==
X-Gm-Message-State: AOJu0YyvmGoK98psfJfathpm/KHV2yQKHm7kLNKvcGm8S62rDqwWI2hM
	CP207CUPwo09z4E1EXvadkeSyO03N0XQbcJDdEVQ5D7lbKbV+xXRHXNzYEzr2Q==
X-Gm-Gg: ASbGnct10rMtd9OuMg9MAha4t4HmDQZhDAUYc/qIWclyRJKmNgwfVfaEMPC3dqVNQfq
	5UJ8f8d6PdrY0a7oqjMnJAjUkM3S45TeB6jiGFmIl4xTr6nusYpxxJn0RDxWo2HYhJPFE5gLhg4
	QQnfLC8YzjJHm4rgYLgpHyUeu40+hSV3zixA56BLDnedTCIfPgsp/GbqtgsF3K1RbD7/gG2AnaV
	sDEUQWv80iO0apB78dYMByikqbM4zyjcjB6Odo3TtoxqtVN/kiJP8+oAe9hjtPdngToCmIvZJSj
	SjlxJrIakwlPKcIsnqy7YJgp+RcAS0u2DuBtPXNjmCV5J4wiD+XFbgvlGedFKC91KmUTqQDYehC
	IFveGkfYrxIG1bxIJ6BmnGDz33qugN0O085eyRCdZwmrk
X-Google-Smtp-Source: AGHT+IH2S5t8AH3RZBX6xFiTAy10sp/FjbGt8u2+cjXVxrnpR0jq5+LA7m6mqop7UmRm/0Su5ZMt0g==
X-Received: by 2002:a17:906:6c96:b0:b2f:4970:8720 with SMTP id a640c23a62f3a-b4f41b7ca95mr282822166b.8.1759828277189;
        Tue, 07 Oct 2025 02:11:17 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e78242sm1345916266b.35.2025.10.07.02.11.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:11:16 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] redis: ignore CVE-2025-21605
Date: Tue,  7 Oct 2025 11:11:15 +0200
Message-ID: <20251007091115.3908146-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 09:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120325

The fix has been backported to both redis versions by upstream, and
both versions contain it already.

For 6.2.20 [1] contains the backported fix.

For 7.2.11 [2] contains the backported fix.

[1]: https://github.com/redis/redis/commit/5e93f9cb9dbc3e7ac9bce36f2838156cbc5c9e62
[2]: https://github.com/redis/redis/commit/42fb340ce426364d64f5dccc9c2549e58f48ac6f

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_6.2.20.bb | 2 ++
 meta-oe/recipes-extended/redis/redis_7.2.11.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.20.bb b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
index f2e6175462..175e0a9fc2 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.20.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.20.bb
@@ -20,6 +20,8 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
 
 SRC_URI[sha256sum] = "7f8b8a7aed53c445a877adf9e3743cdd323518524170135a58c0702f2dba6ef4"
 
+CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
+
 inherit update-rc.d systemd useradd
 
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.11.bb b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
index 5aea249133..a57ee2d05c 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.11.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
@@ -21,6 +21,8 @@ SRC_URI[sha256sum] = "2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e63
 
 RPROVIDES:${PN} = "virtual-redis"
 
+CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
+
 inherit pkgconfig update-rc.d systemd useradd
 
 FINAL_LIBS:x86:toolchain-clang = "-latomic"

