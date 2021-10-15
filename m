Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CCFC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:16 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.4289.1634338635441922064
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=XfJ0Ia8d;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id j21so48223601lfe.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UvMDR1gCSfWdp1WhLuBpNqYC9cAWDX7xZgRCJOJWt7M=;
        b=XfJ0Ia8d3oAWkMCeeR875ZxVrMuAKTnXt/OiACtcc7MAmz+jx/vCEGcgTVcIpGPuy5
         DpK5wDDJjhxB2Zc6Q7aOICLlsXJft1ckWPbfxZf9MlJPiycwZb3uyDBq0NpsFGZ1T+fR
         mh5BIAx2rBvC4WlA5TFGBrsWbxn9n/D5Tz/9z72aJg5o+5n8OQW8QaZX6boWc9ymXal/
         prW7b0zYecz0vaPInXBRbHjVYg/RFcLh7PG8kNYWKcIIU+GBbG19sPp0o8tbLWBi1ab0
         /TkGl5W48OzQp2xkByKoy7CsPNvwZhuG1QCM2XtF+3bMm5tmJU0q73DywejeYehOtpR9
         d8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UvMDR1gCSfWdp1WhLuBpNqYC9cAWDX7xZgRCJOJWt7M=;
        b=TThB4lmMd21w+Mlk64gxDH1HRYDfgLCzM4D3JNuvFG+RSQUEUqwnBAG7xKYqCthTGV
         xlvvzQwrHTOtFQK8Z5ozVzW0xXByercBdEMTwlqi2vxFKBXHMiM5rhq8vtyct/T4GfH9
         liYz6iwi5SxjtiRChn4ZW4iubdSX9uMgvzwODc6Ib7Nik8nQXTD/zkp6VnBeNUJl5L7N
         eHR+UIg/gbn0sahbVCUoM8iYjTDEO9rGG5LfnNSICFzkH7klxxM6DRwolpjkbuN51OuN
         M9x2o/jo9R/L/32Q2dnmY1dl/KbpJ0xnKV/PzSNP7yf0wXJBIyf/6tARXD+BYD2wnC5Z
         o5nA==
X-Gm-Message-State: AOAM532ZW6YxuQkazEibl3ydqek7cUMoC6ZJvu8CbBR0iHTfLJ2CPIp7
	RzaXS3N3arQZl0Pl/RJNOtSkvbNBNvtW8w==
X-Google-Smtp-Source: 
 ABdhPJzs5KBUcjQv6urrQBgj+0F3ojEaRady0roTedQNfsF2Mb3Efx5tJ+8z8KAwe5ktbFdTkRuJaw==
X-Received: by 2002:a05:6512:6c8:: with SMTP id
 u8mr14083192lff.453.1634338633535;
        Fri, 15 Oct 2021 15:57:13 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 x15sm610967lfu.21.2021.10.15.15.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:57:13 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-httplib2: update to 0.20.1
Date: Sat, 16 Oct 2021 00:57:11 +0200
Message-Id: <20211015225711.4163673-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:57:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93368

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-httplib2_0.19.1.bb => python3-httplib2_0.20.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httplib2_0.19.1.bb => python3-httplib2_0.20.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb b/meta-python/recipes-devtools/python/python3-httplib2_0.20.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb
rename to meta-python/recipes-devtools/python/python3-httplib2_0.20.1.bb
index 3f244eccd..8a0b6c9e5 100644
--- a/meta-python/recipes-devtools/python/python3-httplib2_0.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-httplib2_0.20.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56e5e931172b6164b62dc7c4aba6c8cf"
 
-SRC_URI[sha256sum] = "0b12617eeca7433d4c396a100eaecfa4b08ee99aa881e6df6e257a7aad5d533d"
+SRC_URI[sha256sum] = "0efbcb8bfbfbc11578130d87d8afcc65c2274c6eb446e59fc674e4d7c972d327"
 
 inherit pypi setuptools3
 
-- 
2.25.1


