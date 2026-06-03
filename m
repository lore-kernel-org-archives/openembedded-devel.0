Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233C1CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 09:42:28 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15896.1780479740132059142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 02:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hoB0KDKV;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36bba9a1089so3242793a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 02:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780479739; x=1781084539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hb2f1h8Yn1NxKvbh5gtFR+bTeNUw0dSwyu1uhZxBohw=;
        b=hoB0KDKVK4vgFtWUbVk2SkXD2++EHTPOtZ1pPye5VzucW4nMdWfPFU5uJ5ezJw5ZlT
         qJEJsLTFUBopyxgAKNFllFx6pdPZDjs/IrFPj6263gtu+SDtRVeiEonNQEoO84Y5XNR9
         2TmAAleqkp8IrHhZ4fBu6pRNUXMhrpNfh76gYLA+egeU31eeHIKYDfiaVwbpYGtjYfE1
         BwkcouCbUPLHBlC2e0ixA7kzviJBqcVH1fm5Nlq5gZMIDIDNceoXvixO31Sp6O/x4Y0Z
         zKR9NSpmfipZf59GSGC50BSMrtnzEyS8I+br80f5Yay8upZxyeIIunKxtH6EXKIxaqgK
         +p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780479739; x=1781084539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hb2f1h8Yn1NxKvbh5gtFR+bTeNUw0dSwyu1uhZxBohw=;
        b=qWHrBt+37NlWK9lTPNtB7pKyUNk4PJBwsAxfNdEO2ByUFq6pViOnXZdhKdl8dqb6KL
         hL8i4nblhP9zCRNRPpSzdlOp3+Hnp1FQDh1gvblH5eWaB9/8XwcGmNGjcbXpHwzPO5bO
         iYI3y6I/D9YmNHNxLiM8/lk2ick6SqsL8k4GIu3Oe4xJ26AcWmfeWeHK+2KZsSN2YbbT
         dv3you1JJsKI7KRQl5IQd0sqNLKACYn6P5XWjHJvNPjQsEvUon7Q03y8BwOLShxUPITG
         8/Z22qWOOXIxQ0nTyzo4D80E5C2wQIkkA9ev6P5mbDXa5LM+lhV3qiR2dJWUZCJZRTcS
         ADSQ==
X-Gm-Message-State: AOJu0Yzuu9Oef/TxhFomcofFo3RGMLnWyWLJtdSFvD0oqkvXXbS7Wwsf
	sUrjDMvc2ols7OAs28P0y7RSDXIlguqYSb1Npr5mVf4VpWWFmcMi+6tzQqjRlw==
X-Gm-Gg: Acq92OFXclNShGtKnQBeSwH+RO+klSQ9VMYCzxG1/I3W6Yk1zOHIe8pk2Myn8VI92VM
	DNsr/NopLvksPDjHV3Y+M+vnsw4hD0cHaXSWU6HeOWv5i8sK87/zqKfHMHg5AT84/pbKSSF3nLF
	T9UMlHq26ixe9iw4AJRbJpoeKjMUcJTtU7tfsoBjzxTp6cVvrjHBf7E5wexMHCbN/SvE6z1oEEy
	qJas78C12OqkQVlcwxx+KwKmjPRvjGrhg7GZTsjWVZXb9lXa5zXZklGVjrGkuVX6ViajJsv0ccN
	d4h7WBcVPxD8bMyr/OABGag7o+o+z2PcHVsqFYCk5mING5LEuEyGw653OXgBg5ylvW97jGH1I+8
	TyMlfwAaMRvE/lwyv9Z53rKF+Qa7FFM88iOKIn1DIfRXMnHhuYhB2y9K1+WMtfk7MTzdScafiM1
	TKKtj/+Q4h+VdFXsyXOgnnYiB2geenR/dYrR6gp3WmkDpkCL4=
X-Received: by 2002:a17:903:22ce:b0:2c0:b5c1:8e3e with SMTP id d9443c01a7336-2c1639ec7f3mr27671965ad.8.1780479739440;
        Wed, 03 Jun 2026 02:42:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm19660035ad.52.2026.06.03.02.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 02:42:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/3] redis: upgrade 6.2.21 -> 6.2.22
Date: Wed,  3 Jun 2026 21:42:06 +1200
Message-ID: <20260603094207.218632-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603094207.218632-1-ankur.tyagi85@gmail.com>
References: <20260603094207.218632-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 09:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127378

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Bug and security fix release
https://github.com/redis/redis/releases/tag/6.2.22

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-extended/redis/{redis_6.2.21.bb => redis_6.2.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.21.bb => redis_6.2.22.bb} (97%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.21.bb b/meta-oe/recipes-extended/redis/redis_6.2.22.bb
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis_6.2.21.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.22.bb
index c47f51692d..01d461f55e 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.21.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.22.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2025-27151.patch \
            "
 
-SRC_URI[sha256sum] = "6383b32ba8d246f41bbbb83663381f5a5f4c4713235433cec22fc4a47e9b6d5f"
+SRC_URI[sha256sum] = "3ce191a727505b2d711bb45cfde8d9eeab1e061bdc0e5cb56a50201069a9729d"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 

