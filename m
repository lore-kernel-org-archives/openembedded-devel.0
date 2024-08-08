Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5E6C52D73
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 12:23:07 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.58578.1723119786523326409
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 05:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Uf1ZE4sL;
 spf=pass (domain: konsulko.com, ip: 209.85.167.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-530e2548dfdso915955e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723119784; x=1723724584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OKxi/F90fanpnMJzeWvoGSVhzyL52xTbaSdfvYyINbY=;
        b=Uf1ZE4sLx/5rHg4t2zzFQ4HR8JI7qHKcfelFEcJwJ29jjIC0QW1mJOycHr1L4X6YVM
         TODOoUm48H5vNcFB9N0/s9jIkIbj0HmpoLzmeRTsmwXs6psqEb/E2Mw/pQc6CBAzXrmu
         HSeNpBs4WRWQuVqoxAuEdjFsU4NkTqCD/LVZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723119784; x=1723724584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKxi/F90fanpnMJzeWvoGSVhzyL52xTbaSdfvYyINbY=;
        b=Ix6GZErxo4tc09RLaEzIbwp+GcJ4LphCHx1ReROlYK//nPytEhNdZHf3Co+jKh5W2K
         6QlKx1Lsme5ocYLNTVKYGZvbLSn/u6YmytWo9m0Red/EPCGoEQAIj22byNr/EXACnD0+
         gMPILOIpRVHofRkMijgV2tbgZCrq7O3384w+4jSzjk8uVgjteD8Cru5mvVcByXY2mI8x
         C+au4o/5ztAqrIh74XG+fl5JDjhhnfPcbtOASbe9vRYGfQZefWFZRNlu6Ux/PmBwPDNb
         N3QLfOJZ1+tMBztDkr51HKWeldIjsFQJmaq5KmIsqxUxkCvKd7n66Bzy6ZkYt5ybRRTt
         8syQ==
X-Gm-Message-State: AOJu0YwUYruv/3e2xWtsg/7CTi912Cn+5V9o202GDyo1hBTYY+1GIUYm
	tgsww/weqFTdBSy7uWQAwR2Kfj5aY65tylAR93UbQbxl3YWeXnY+cV+t7QFavNZGj2XEVpUzKI5
	4
X-Google-Smtp-Source: AGHT+IH7V6tuuAxSqRigcVBfavjKw7aMS30y9gOkECY6g5R2pXYnw96gSulrycEfX4HuoT70rLZBew==
X-Received: by 2002:a05:6512:692:b0:52c:8a39:83d7 with SMTP id 2adb3069b0e04-530e58c6e28mr1311460e87.52.1723119783924;
        Thu, 08 Aug 2024 05:23:03 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9ec886esm736135366b.203.2024.08.08.05.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 05:23:03 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-pydantic: Upgrade 2.7.3 -> 2.8.2
Date: Thu,  8 Aug 2024 15:22:56 +0300
Message-Id: <20240808122301.2271346-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 12:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111654

Upgrade to version 2.8.2:

- Fix issue with assertion caused by pluggable schema
- Fix breaking change in to_snake from v2.7 -> v2.8
- Fix list constraint json schema application
- Support time duration more than 23
- Fix millisecond fraction being handled with the wrong scale
- Handle negative fractional durations correctly
- Update citation version automatically with new releases
- Add support for Python 3.13
- Experimental: support defer_build for TypeAdapter
- Implement deprecated field in json schema
- Experimental: Add pipeline API
- Add support for programmatic title generation
- Implement fail_fast feature
- Add ser_json_inf_nan='strings' mode to produce valid JSON

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pydantic_2.7.3.bb => python3-pydantic_2.8.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.3.bb => python3-pydantic_2.8.2.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
rename to meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb
index 423fe7673..fb1e7b3ac 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.8.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=09280955509d1c4ca14bae02f21d49a6"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "c46c76a40bb1296728d7a8b99aa73dd70a48c3510111ff290034f860c99c419e"
+SRC_URI[sha256sum] = "6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816604f7c2a"
 
 DEPENDS += "python3-hatch-fancy-pypi-readme-native"
 
-- 
2.39.2


