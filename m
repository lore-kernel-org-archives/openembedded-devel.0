Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6B9C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 20:34:12 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.2272.1646166850928933156
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NO6fustA;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id z4so15221046pgh.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Mar 2022 12:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LPL6xSDHpiHwQjbnX/dTOj4Q6KJr8Dc+wFPJwjGEzRg=;
        b=NO6fustAXl6/1vTE4G022XSluq7Imzf3VYpJBZrVsm6gzWge3Q+nmEVYCqgZg5MbrT
         lxjcDXvV+czt/VmZXWGmNiScodb7175QqRTjQo7AjbLolcvv5Td3+lYIhQo46ML50Xl8
         M/jBy491MudevCVi2w74GFdYmWe+wJDcBuQKR50K5RGOtux1fSr2Z+6y8Upd7GnlKEDR
         xcb0GpfjKBGaikUmz+sOsKwwEHpftJ/byYXgnEefeSI1iKMjf4lfzEXD/wr2ZPtErY7j
         JHPkvex3xN6DV3fSeISObyNF7axQFIDJ8R67R4BPylqPL/rzJxp63QR4PYtyGAlNM0/j
         oTvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LPL6xSDHpiHwQjbnX/dTOj4Q6KJr8Dc+wFPJwjGEzRg=;
        b=ttU1ZmnzbXo+HQpXugAmeSYsvk/xNcPLQ/9WZd3/JrDglNFIggz3p+4LiucvKlr3bL
         7L5IhbWYhxcmpQ+LG2/0GofcR3ONjW/Ai/5c1U0uXfEfzl0oSMurXOSDg0HFDxHqkBAE
         NIAKiUQuvB+JQnK0zV5BOgnRBJ3wGK5zpj7RFVCtK1ZO5CBlzRem0ys4BydMG1q96LNZ
         g9aXpqh/4MIf419qberQ4lUs0oK5IlIZpQv5i9oqlb8tmgazx9WhaXSUqatt7A/TLX7c
         CdsJsV2vEDzzTO8c/bIjdYa7i31cGkvIbV3uFpsz5f1AHLjZmXhX7YYgJn3F5SllV5Z0
         geSw==
X-Gm-Message-State: AOAM531e+XD+bLe6wQX8CqD6wqPyw3MazsfxY9Dg+N0HIEaEzBbKkUmL
	YjjzP8LQwOz5pN1lwIXVZ8ORlr/NAhM=
X-Google-Smtp-Source: 
 ABdhPJyGXzMyReJcpWIIy2Hs4e96ZxOfVP6ZNoAGRkmvs9Pxtz4ttRaI6T5GAHAhezx+3/AwVNnqMw==
X-Received: by 2002:a63:de55:0:b0:374:2526:3596 with SMTP id
 y21-20020a63de55000000b0037425263596mr23648926pgi.592.1646166850073;
        Tue, 01 Mar 2022 12:34:10 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a17090ad20600b001b8d01566ccsm2896968pju.8.2022.03.01.12.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 12:34:09 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-python][PATCH 7/9] python3-isort: inherit poetry_core
Date: Tue,  1 Mar 2022 12:33:52 -0800
Message-Id: <20220301203354.3839755-7-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301203354.3839755-1-tim.orling@konsulko.com>
References: <20220301203354.3839755-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Mar 2022 20:34:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95654

Use PEP-517 build-backend instead of setuptools3.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-isort_5.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb b/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
index 5cb41c5fcf..6a6d5ed130 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.10.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148
 
 SRC_URI[sha256sum] = "e8443a5e7a020e9d7f97f1d7d9cd17c88bcb3bc7e218bf9cf5095fe550be2951"
 
-inherit pypi setuptools3
+inherit pypi poetry_core
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
-- 
2.30.2


