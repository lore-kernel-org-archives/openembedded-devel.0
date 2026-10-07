Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6E7CA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:02 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6881.1791371280813142824
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kl9B2mLH;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso1224154a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371280; x=1791976080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZQH60X4Kqymw++2ddQq8/ihIHK3b1sTxhx/eTY0BDg=;
        b=Kl9B2mLHFA1Ucc3gwgiGEBY95YPTsUsxCqUO5ppQLjQ5zZAFx34gPxHjn80bTs7ulV
         9SesirxVLOpBKFIMrsLVi/zvIqnLsVQEVmzOzc9qpnhp56YqzzwBihcgLXBdpxZngzph
         kgkIAXD+nVsAtpiX9ZJY8vfTmzE9B6adF+faJVhBlWDpOCgxXBdoJ8Zvualb4Cku0f07
         F80pzJi4q8nDFknx3OAlEXr2KW5Ie3DCvImHEOkGb7/ptwx2n2OBqsSf+XFA0t1X3Ae6
         byXGRHGXxjLMtfvH/yn1Mewj7enMzw/wkgLTbLN7a1+WjgnBPVV+Cd4NBfDbYQVgPyZR
         nhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371280; x=1791976080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZQH60X4Kqymw++2ddQq8/ihIHK3b1sTxhx/eTY0BDg=;
        b=mFlmGPgeoHDfXU87kIDVcnZT1yuAexG1dvwMi1+SB5L6A3MSKK3bdGIZ4H1R5FlwQP
         70KIqANEzkz69/RCGjZbnLbSaNQX9E+3fMA3XkFu3HWKWA8A+2iU7v3lkwy49BVxYGWt
         BngUw0FFTQxp8eMp2bFOaeBsYPT7vA/qe3NwOjuinJA+S7fDXuEVG4jUYAIfvMdPwTHj
         I65ei+ze0cqsKvRYXDZwtT0krNOfoJkPlT72BUUiIawdTwu/5TEM0iUQFgECj6mrOwB1
         W5ZNYDxNrjn63oPua/PSJAfNDCBhO2dpuHeY3tdpHl6zQa+3k/C+SPQpadTWmG6fhest
         OSyw==
X-Gm-Message-State: AFq9FYIHvqVwgRFZMpy5gOB0BCvfuKbDQmiCAr3vhrtdYKmXjVn4Ko3x
	3N5fo1iLPNnolMRl4tuZBNsLie05Nh0KOTDedZcgWK3IsQ3hmXrVrcdxzAXERKDy
X-Gm-Gg: AYBFou30A+gDOIC2MaHi53PYLUT6vdKcVBmH7ZPg/+woOJg7nf357wY7ftoR1d6hfGc
	jWcJCQQP/l97Zo7mPYlwuECoF8SYVmnJfB4m7egXv8wgeHQzICUQJaSWa7fFTImQ8BXeU1ddtMV
	hCFB3Gf2a6JygbDuZby/VqB2WPm37loVfjldFWpie6sd4MtdM3XmoFXpUPu+TBVkeBN0rFihAMR
	obkjvAnNbdAPKst6MXxiQa1b5wRQDkgDrQdAoouyJPgWBJ3gZjNUQ2u8Z3o/hMDFBhoPd5KDS8C
	xy0Z+2FXev/qxi0OcwElyWRQa0f+dSX55sRW3Nj9PptSL2yrfNe5v+ut+aNUYLMRd2WwNhupduU
	3zytVRykPZQfUxyCKqZbAjAR4J1050lZfWfOddNvjBJnykFwyNlf2eF8dh+maCQ6EvD5X/IsU7r
	V8cMXJ2ZQ9WIG6BJKfelPsPOETmF1tAhfQ5tAQWftAKUOu7hiY40vk3QQEq/3uas1x9fwBOKgP5
	dAwCRiKPhoe+mxpgFT2c1o=
X-Received: by 2002:a17:90b:3b4a:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3a89f672051mr1586390a91.2.1791371279993;
        Wed, 07 Oct 2026 04:07:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:07:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 4/15] python3-tzdata: upgrade 2026.4 -> 2026.5
Date: Thu,  8 Oct 2026 00:07:29 +1300
Message-ID: <20261007110740.3179543-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130646

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/python/tzdata/releases/tag/2026.5

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tzdata_2026.4.bb => python3-tzdata_2026.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.4.bb => python3-tzdata_2026.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb b/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
index 9bd29afa61..4590cec28d 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2026.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2026.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=804220b73c90950be376e7ff7b2066bb \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     "
 
-SRC_URI[sha256sum] = "f1b8bd365d8d210c55353f4d7f8d6d8561c0ba50d704b700d195a9424bba0d79"
+SRC_URI[sha256sum] = "8cc73c0a0bfca7dbfa59235d60b2eff82231dee33f53d206db1acd9173cfc0a7"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 

