Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.10723.1593562057148640451
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UQgwlX5m;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id g67so9860526pgc.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=aEizeECvJs10zhIWGhsLoDS0fPhyD9kXqoUcXL8I1yA=;
        b=UQgwlX5mNTWM487VKxHhqETC6HLlxOfojA5/fQmpZPI6sgoBD+dXQcB5PC+hUxLa3R
         WmdjvPVrWuJCfzOqHEfU4AqAzWgrhhSTLEolEIsTsM7xvp3RbUYDgfjyFRm/XgoUXCvq
         fw4uHvjqjg7Cov5pLhXorFbIe2/VhH3DJ0b3l6G/FnDgEMrY0ZBB19A+51aapIezYMrx
         uDY5tRJToSoTrRfy0KHaAdYvIrfnWyiY9/VqCRApIVwqKegFyXp7hoPtuHug098gkwLO
         g0fyROHGdzhfhSRfLOTWS3yN1KhXsLwpDoNz6azq9glsRm7eCHErzCX60+hxRC1M85Kp
         XonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=aEizeECvJs10zhIWGhsLoDS0fPhyD9kXqoUcXL8I1yA=;
        b=tcm1ix8DiwKvCe5dBhBHjsFOIjOQZq/4ikAaEFZyLz/xUb6rZ3Gi7Zvt29x4F70ZIu
         SbUqDQW7V3SiomKSKbcWsSBcKCriqlywTPzwXX3i5UXNg27CMjLka8cX/II5W4uqLAjG
         WoCET81IQWSNc5WS8czBAUCQ8Wz880nhtIcCcsF+zAmVCFM1Wm7MjwGzbqRVRvgFYyRS
         nEUPttKKuOyXYFhk8RLt9yB51OXnsLnM+HlEqwwCAHdzIagXto1foiNtB+JlXBUq7OiV
         tBEKRII4Qo22ksvP7T+UZQjUVrUA+CthMQnw8MYNyLsJp9kFiztYYwkLwpRl5v/cJy9j
         8fVg==
X-Gm-Message-State: AOAM530Zyshh/UHBIoF+Ca98ctbKvP+anx5+GmL/H4wSFhwZ8dLlyvNU
	6fh3ceiysrtacPYjsgLdYjZqUgVpUk8=
X-Google-Smtp-Source: ABdhPJyo9v5g1X8UHjlwDlDuY2pHxMJdmPcSRtPsfI2t6fnuq7CbW8cvb8iBP3xAfSRvq3gupTp7+A==
X-Received: by 2002:a63:5b55:: with SMTP id l21mr9799201pgm.348.1593562056361;
        Tue, 30 Jun 2020 17:07:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:35 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 13/32] libnftnl: upgrade 1.1.6 -> 1.1.7
Date: Tue, 30 Jun 2020 17:06:58 -0700
Message-Id: <cbf4d9a0875e8c1e504d6bc779b68f6a89ffef77.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

See https://lwn.net/Articles/822353/

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9e7912b8fd841001a2ffb78dc32edc86fd70b8cd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libnftnl/{libnftnl_1.1.6.bb => libnftnl_1.1.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.1.6.bb => libnftnl_1.1.7.bb} (88%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.6.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.7.bb
similarity index 88%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.1.6.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.1.7.bb
index db42954542..4ff00bf873 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.6.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.1.7.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 
-SRCREV = "ac0778e403eb51986ce19bcf1a6e8ae3cd83dcfa"
+SRCREV = "eedafeb6db330b8adff1b7cdd3dac325f9144195"
 SRC_URI = "git://git.netfilter.org/libnftnl \
            file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            "
-- 
2.17.1

