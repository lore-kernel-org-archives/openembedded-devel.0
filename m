Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CE3C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 14:29:20 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.13147.1718375353554458085
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jun 2024 07:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jya+/hT3;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f6fd08e0f2so17025525ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 07:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718375353; x=1718980153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGt215orjcQleg+FyAPDhoFcNAI+WCOovUxmCKJXlZ8=;
        b=jya+/hT3v58NT3nOwtBLMhCQfIrfrrd2YsxTwsDCfT6yU9jYJgsAApXF8VqPaScB82
         LaR4TulzD2ejI5IKujy1ysxG0X4o2822zOUrjS/JK+26ggPC6L7L6LNz+2vxbGxwohtw
         3RXYSm0VUpRw0gLT15HIcUJySWIinshA6wbbLz2Z+Xlvtl3twZbMyx+EFX3IjbS+7sY+
         90QwrpV9RPyFcvLKo3GWmbN0PIinXLubTsxMpivByUNFJucXFFh8KEAfxGGptRKrRP+W
         vtnSDu1n7pevs5GG1dpZM9jmNctcK5bGNs6zqV5KGTEc4T5gs1ce2XXvtHR1Lr12nH+C
         AYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718375353; x=1718980153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGt215orjcQleg+FyAPDhoFcNAI+WCOovUxmCKJXlZ8=;
        b=ROjiVTy61HEL8dPpYwXNKSaplO3L3qYUBkk3ra+CfrqDyWH24o8j17UKx0WxJEmpRL
         8uGy2qdFodmiWrk3Ol67FT2rfBRw+gsR7/lmMgJ8kllKFCjMcyg5Gm9XedBp+gxixypb
         VVZRr1kFfHWdun8fowaN1KCU6lUnT38hPiy2vBWersWtkyPMApBqKioZSXQfzBDUwc4y
         ZcJvEuM+IuuLNLc7kc8FyVb4KQDOcqZtF8v79MR22fwTuArpT56TwB91+211hn9NnfGX
         c28fBy0eorF+W/H6ONEXumQTuylUoSGNzqkQ3eNCQS57V69fhvK3DyuhHGY7y2/k3Haw
         31Sw==
X-Gm-Message-State: AOJu0YyjyqyiYP3NMfRsncfuc5yWwmRO6V1dSozFYCW9SU2eZwELvg8h
	o7ya1uuyKmp0/7T3CN0ZmrY8RbvFnHyOV25fSKcTTsJ4+Dai7nRJqO+DTg==
X-Google-Smtp-Source: AGHT+IFGEZj+WwbxM6FhzPxchyhIzxYW56t4V4OsrPVmvx+9zATuuYjvZD1BrTYQctAX+cg5xAQVmQ==
X-Received: by 2002:a17:902:cf08:b0:1f7:3163:831e with SMTP id d9443c01a7336-1f8627cac58mr30995485ad.32.1718375352668;
        Fri, 14 Jun 2024 07:29:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::91d2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee80fesm32573455ad.124.2024.06.14.07.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 07:29:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] nss: Upgrade to 3.101 release
Date: Fri, 14 Jun 2024 07:29:10 -0700
Message-ID: <20240614142910.4167269-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jun 2024 14:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110911

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/nss/{nss_3.98.bb => nss_3.101.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.98.bb => nss_3.101.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.98.bb b/meta-oe/recipes-support/nss/nss_3.101.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.98.bb
rename to meta-oe/recipes-support/nss/nss_3.101.bb
index 0ceefb5e3e..5a01efb7e4 100644
--- a/meta-oe/recipes-support/nss/nss_3.98.bb
+++ b/meta-oe/recipes-support/nss/nss_3.101.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "f549cc33d35c0601674bfacf7c6ad683c187595eb4125b423238d3e9aa4209ce"
+SRC_URI[sha256sum] = "859748f0b4b7bb51e7e600ae5a88ef4d71f93e6964b1beed2727784dd9ed85e7"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"

