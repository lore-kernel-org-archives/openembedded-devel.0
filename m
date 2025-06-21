Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E4BC7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 02:22:50 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.210.1750472568783231574
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Jun 2025 19:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EqYjxYLL;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e447507a0so19129897b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Jun 2025 19:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750472568; x=1751077368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qtXobtdGY8AJimHIhk9g7vB6aOOWX0qjYf/H15YovAg=;
        b=EqYjxYLLklpeXNqPdZEsspT1gnZ8+Eaiyy6qQJWjEqlS40/wtkryAHy52d1SyN+PoR
         QqZDNnMvNXMZK9yHNK5eAffiwvn8VgUcoadzDd+mgLiootJqyeB2zcCZUqPRWILeaYT3
         PujESbnjTtFFUGWhaLcQIPWFSqkQQuoLA8hrbktpwg8fTGTpf4czkFiR4iyHbuEYPRDY
         Cvsml0cyFi71AIgIFzcH9+XcgcBIvd8Sx+1LpXfr1KzxxFyXMdUZBBnWGe7jLlPG/q1L
         0JTujbSvOdtyzwWCfqerRiHkk9onuUQjmTeag7Fgf3e5ZCVP+AIWAh3ZFMY4BSZYcIm2
         xLRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750472568; x=1751077368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtXobtdGY8AJimHIhk9g7vB6aOOWX0qjYf/H15YovAg=;
        b=WpB/A2r3ycwR9nlRd0t3mktHAQEmex/k0OSMag6hpoVMmkLvF48oqf3DdGMdaKQHNU
         TSG9fVhahjLR5m+RJtcKbLU6UYGKgMS3Hh6T42itIwZGRFFz/LxCGlQ169c+umFHsFiF
         ksoHWulCSJQFYV54U75MNTZmGaYXpe25GSDpSp/lgs+lPk9qV7hREBcS32jhzSjqvyYA
         m8/mHyrA2DUZA2XSvVYCitWPNlWR7bpXGEc/pSENtmTYRRjhoiF4oB1WWmKG92Dl5fZM
         rh7CjLxA1zosVkRD+ZbKX9fWANS4bkDHJ3Ul4P8XQrTOn/S0mYCMOyEuiLA4c15kWa1U
         hStw==
X-Gm-Message-State: AOJu0YyH6YkQtc/d7IEubUOysMCfqAXq1njvEInG9mGq14xgQcZmt2Ln
	D8N0WZoyGYQwCu1fbp/5kmibC06RZqUYQI4uFtmanFMF6d94ANFFvka4KWx0t0r+
X-Gm-Gg: ASbGncsFHPe2ekLtFv3CbEb+WCkyKVWfL0woXR+GK1uz9ayVyhR3fjnPTkh2QgCehx6
	ORdNgrrYvMom3FfYrumTNnHtb0c2H5ynTNP2mSY+ctZM7OG1Uq63OH57CqHlEzsDvrXkMf/Xg+s
	iJ+FRSN/0mkkfQ4UCYr7plZwpJMyII8wuhRySAWOFISiW6BU0wKriv2/wVZ9+xBbwVC1Ywh8XtK
	4vn/O3EdQYgXBWgbxtr2klsGriHDrrlEGu7cy2HK7TKkOVqZ7G2SB4mvVs2jc09iNXbCaOLKwa4
	tniKOLpM8HUKpCBGeU8eDDIT1CpmdePfBMy6XeNPTI9dTy0uCUoaZNh4R8eDs7uJtRpFtUIgLVr
	JwGyCtZJPDCM7CsW5tRdXoUznO4JYsfw=
X-Google-Smtp-Source: AGHT+IE1oLzoDCzLYI9KUHRjt/uuAtL7OEYn4WACcJmdBOwsvo4aCBASko0S+tddFFUbaQBS8OvjvA==
X-Received: by 2002:a05:690c:601:b0:70f:84c8:3105 with SMTP id 00721157ae682-712c675ccd3mr75389987b3.37.1750472567376;
        Fri, 20 Jun 2025 19:22:47 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c49c109bsm6740337b3.2.2025.06.20.19.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 19:22:47 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-networking][PATCH] libcpr: upgrade 1.10.5 -> 1.11.0
Date: Fri, 20 Jun 2025 22:21:51 -0400
Message-ID: <20250621022151.87050-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 02:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117987

Changelog: https://github.com/libcpr/cpr/releases/tag/1.11.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libcpr/{libcpr_1.10.5.bb => libcpr_1.11.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libcpr/{libcpr_1.10.5.bb => libcpr_1.11.0.bb} (90%)

diff --git a/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb b/meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb
similarity index 90%
rename from meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb
rename to meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb
index 8af763fee9..03cd877901 100644
--- a/meta-networking/recipes-support/libcpr/libcpr_1.10.5.bb
+++ b/meta-networking/recipes-support/libcpr/libcpr_1.11.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=08beaae5deae1c43c065592da8f38095"
 
 DEPENDS = "curl openssl"
 
-SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;branch=1.10.x"
-SRCREV = "3b15fa82ea74739b574d705fea44959b58142eb8"
+SRC_URI = "git://github.com/libcpr/cpr.git;protocol=https;branch=1.11.x"
+SRCREV = "bb01c8db702fb41e5497aee9c0559ddf4bf13749"
 
 
 inherit cmake
-- 
2.43.0


