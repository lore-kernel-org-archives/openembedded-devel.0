Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377AAC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:04 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4183.1788429002714832160
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JhJQVq28;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-851cbd64814so928488b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429002; x=1789033802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJWhQ89mlZxBs0tH9Nf4DA03qSw+ZPa6DOcbs9r+6vY=;
        b=JhJQVq28fqNa3MF9lUIU3yEFn6p7WDDVnMkxbM4Ovr4ouvC0llSw+ZyuWrZkqfvqVD
         72j0wmdDNeDKGrZo9STGlcIAon3vw+qjdt3ixi5qtK58KdbyN15P54XsaoQF1mfkNWZE
         sv3GBqSfuOjxpI6dmDbPiuyrokRyp5H/YcGw4kudsaI3dVnhDv8Ru70ixtndDMPXw3C8
         m4tKIlpJIXVcWC+In2EyHaSzB2ZuKAt1k1egPmzkUyG6Z6Tz7zbXeOJo2AVSCPK7i16/
         P2Q2HMzwFTM4JboeEiJJzD01Q7w0kkcp3x262xntaJPNfzY6J7qiKxcfU3U1FN+NBntl
         TyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429002; x=1789033802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJWhQ89mlZxBs0tH9Nf4DA03qSw+ZPa6DOcbs9r+6vY=;
        b=PcsCFqoCdzsH23jJwm86ng3cHQFmqkcJWPtpmgCXs4pWletQV/zRryY8yVaeLh3diL
         zGxMzc5E22iva3ZmjGKEKKvsn/HGpfqFaSRwLEiQpaPcN41+mz2//AxXOMr9k/9pidT9
         qqTetOC82BhAi5M9uQLC0IMNwQZqRxfw5Sbsm1fQaQKEByNODS2BfElzOiP3wCUZrwLn
         dk+GkaR7LEpcwEmHhlnx4PbppWWmRdb95XfB08ynrsPph8uV5hHVUxFgD4OoaQXwVpPM
         15xBEf/cqdx3mEm3tsVi+XbelPMjl2UapdbvlIhyEzyg+zIjV75RvBUijlRCarVXW1bv
         EDvA==
X-Gm-Message-State: AFuF++l8xHbgnecoQRXVBTiRhG6C+JBCvx+tcmzDt9pcJ+q+6WHwMNLg
	+MvKuwgxKKEgbwx2r4EcFR+SbOYYKsM8DOj7gIInlDxW4aHaD8my7bs/TrOrZkV2
X-Gm-Gg: AYBFou2OGtlgN2eQIEMEx4FSfmu9ZbZZE60P/g23PeTDQwaNf0QiR0taW0E3+Mpu7uw
	vt7tKbBebmxXr8etl3v4P9P+bqEALrsrOGzgm1Div7OnGtutZ9SoDOJpPOYNZ4r/mFrbiWcrgap
	uNX/8kZY75Psh80HMRLrEGjUDLvlcKC2YJpVKOYzuHozNm8N52GcTdOgpWiFVEyEwlvvnODPrMz
	cuInE2GJ4XCultbp1znaqBAjF/W9Z6T+a4nSZU4AgN+g1YQTFDBMGbUIsOCtNEydDROlYH8PFaq
	eg5KjkIk+qEp8UehmplLFlfwr8GllhuhCi34a4Y4ddriwOcoI7APOmD5codpiayb9v4I6HGS0TW
	uJnKJqxW/7tzSHZkPymZv2HGCvj+0ZihQJgjPdmxnRoaFk9i+l6hEaqmLncInOI5uEDv6OZy618
	JI3E8h4YC+C3sk5NJxBhX1KJBCqjhcLsUGhAklRZI05RsjIc+SaVvZW+oXcY44Ceb2e0vkCnzo
X-Received: by 2002:a05:6a00:3d88:b0:85f:3dd6:f421 with SMTP id d2e1a72fcca58-85f3de63c41mr13387523b3a.25.1788429001929;
        Thu, 03 Sep 2026 02:50:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/22] jq: ignore CVE-2025-49014
Date: Thu,  3 Sep 2026 21:49:32 +1200
Message-ID: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129717

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-49014

Fixes:
WARNING: jq-1.8.1-r0 do_sbom_cve_check_recipe: jq-1.8.1: Found unpatched CVEs: CVE-2025-49014

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 5d2a1be398..9d4ae74c00 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -30,6 +30,8 @@ SRC_URI = "git://github.com/jqlang/jq.git;protocol=https;branch=master;tag=jq-${
            file://CVE-2026-39956.patch \
            "
 
+CVE_STATUS[CVE-2025-49014] = "fixed-version: fixed in v1.8.1"
+
 inherit autotools ptest
 
 UPSTREAM_CHECK_GITTAGREGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"

