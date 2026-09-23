Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CE2C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:14 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4149.1790160065099702655
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OQREIxrW;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8623e5d435cso247843b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160064; x=1790764864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+C8i4eE/l0tyvQoCQ7yXFUHJdJ4sfG0AA5yiFQ9puow=;
        b=OQREIxrWnsvV4xQJTdarEg+uTjNMGQOv2/WArY8hZmT+DQ3YwCpUBZ4ruQgKx60tgb
         Ho21JmMiXpAM/EwUiBCvZ6c1AWKyPs3PD0TPgXCxHa2S6VLZTTP8eDJS8+BkXPpHa3B3
         DNLkI9OAREWK9r5iOmdx2gWcM4HPbcMD9aeVhHw4EXeUuXYi0/piGHvao2PVYVJml7dF
         dqMu2GZ6Se+yaxZQqW5jCi8/IFJVWhZsqCx6ImwrWQWcrJLF5U1JiAW7VdRsV7VOc6bi
         1UjmA7+V7J8ImWP9HgXCpLieP0BaMP2s7c9hzuFsVprrQFU54T9SICMyYR1uBK0hDDTA
         Me6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160064; x=1790764864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+C8i4eE/l0tyvQoCQ7yXFUHJdJ4sfG0AA5yiFQ9puow=;
        b=ynXm6p5C33jinTUDfvaN/gLJrTGZXcvBHOIEJvSjoMftFyM3etfdL1q3hlXVUXHcqm
         TzJcb/gAoUWLHpp5XKxS2M9nGPeUlS06LT0W1fB7zONuZSkye1EQ6XJzQfOwukMoWqvc
         Y0pd2Nv+KHDeEmp3Oyg+VSYysK77CKHMhZN81h/Uv2dYGKYTHh5f694ZEAyINT0cWsGV
         utCnYUwKqP0sxlLcriF1xGmfBSfjR3PtaVYy3gnnD1Wd+vQkWIoZUVTZ1HfLSQctHOsI
         NSNc6afkfu2bG50geR5jgleWghF9HfPme6Nro0wta6Y/pHMty5gFGbAf5zgFHu/kZmkz
         Q7hg==
X-Gm-Message-State: AFuF++kpj9gPs3eB0uUoWv+mL8AefcrOvwgcEDEViADPOLNwlgE68Wr9
	Z9RDKWS0N0WfXuStl612Yo0BS7ukDecW34g0hvjly5bttS3jU1jIPK/GtN8wEA==
X-Gm-Gg: AYBFou0NHmiP0ZOuRM+7FU21y9000elGniKX7D82nUKbK2lq8Kswcm1Q6bF3+yjUNXS
	PNcr22JPyaYCJjBuyXZGysEEVq8k3hz6UqwoKy4qQUtyQdRo7Wzte1WSjTNgG0mxRji/BG1Q3dl
	ESycyzEW29Gh9YtZsUiQGa4ubql6NHjdDgXu1vhGpO5ej6AAmP90QUT97SB8iyOwHtxtyCl7ToO
	lGfUjDJkBqJTbHV8bwfjSixMm9SWe6/Crp9CaM6ECspi5zvMf3XnEs31Rl9KaJ2ntDQgy1qD1p3
	gW+7ICkboDdxYrP+SOvwoZ60/nx3Bo7mld+C/f9ZgBoi6CAgHWtPrVmXl84knGIjNkn9RWxxNo+
	aon6JzaTYYM3lrjOparyjRVGVloVMs4uAjRDQx0ibnmD0dqeMTP5f6hQQecMT9zIpwqPRb8bVIW
	BYSPEAnVI7bBNpavLJV9N2c9rDFL4yse4mTJlLk1v24FCWL9xFccVw3zRvHfaR8ZD4r2CkW1+cD
	Is9q0/NT30FGzXs4pRsQ1I=
X-Received: by 2002:a05:6a00:4f84:b0:874:705d:f634 with SMTP id d2e1a72fcca58-87d24c67d88mr1446473b3a.14.1790160064298;
        Wed, 23 Sep 2026 03:41:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 2/42] cjose: mark CVE-2026-53938 and CVE-2026-53939 fixed
Date: Wed, 23 Sep 2026 22:40:16 +1200
Message-ID: <20260923104056.457360-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130189

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-53938
https://nvd.nist.gov/vuln/detail/cve-2026-53939

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb b/meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb
index 492ee0d143..594dadd686 100644
--- a/meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb
+++ b/meta-oe/recipes-support/cjose/cjose_0.6.2.8.bb
@@ -11,3 +11,5 @@ DEPENDS = "openssl libcheck jansson"
 
 inherit pkgconfig autotools
 
+CVE_STATUS[CVE-2026-53938] = "fixed-version: Fixed since v0.6.2.5"
+CVE_STATUS[CVE-2026-53939] = "fixed-version: Fixed since v0.6.2.6"

