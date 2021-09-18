Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.838.1631984263231628584
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OTSp4z0D;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id l6so3506923plh.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Q+LKXchSA5uWR7ohTaDuGJpaorKp6JoGe+hCKIKjdj4=;
        b=OTSp4z0DmU6wsw3+Xe1Iz1OtDOaf9BbCmQpMvNvygFbg3GdQzO1FIHTyeRLog6XgaT
         zrMIujNSWEUz3inPozeA31mzjjSFS1hbM3+QF2SJ3RGqdrROWY6NAnftMI5pScro8EIU
         49OKo0b7GAyZEzY7sMKouirHdzK3sd/RXCRr/mpwU0f62XcxJ6DNAv8mKgmsmd+Iwlza
         1KcPeSRDmSJ3Xwf1aeDX82hcZWB/9Lu7nad2XbrBttFGZcVsIg/NDX6RkW0c1JEbNpGN
         kH9qiNXRxK0rEHBmb+TMxu+kofhXSQQI/oHMDR7/UA6QjayK4YB/D8mkpq3Aq4b9mUy/
         pg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q+LKXchSA5uWR7ohTaDuGJpaorKp6JoGe+hCKIKjdj4=;
        b=49a/MSBw6I+jSLWXBeB8u6KArAOzkVEjGhTJ9Yw5ZC+OxjwxwvuKWM1wfUbdfUuj+b
         wjpErDYMtbiWrlA/szXr1AGeuDN52c62c+ZG22FRw8YB8v7lvxF2YWPdlPU/CCIRkDNk
         Hi/nBT9KhiH5tR/ipGb1n6Rj78wjkBsawcUbIys+g/aQiy18Wi0MeXf0sq/cgkDiyAub
         IqKUAicWctu2UIarODruUYFMLTMbysvH2U0HyzrYqORg9u44eJmL1YtcgoOw9Au2JzDf
         +6j4DsP/BCIW0UP2XkhtE9jtq2KtShn4YX6vpS8hOz3PNuCSpwTd8z9wbYlC4qSyHyOn
         2R/Q==
X-Gm-Message-State: AOAM533uOS60ZQ/ATUiTOqOnX8szDN22DxaaryQyl06xNEc46LxIUgqm
	05in57UIt9Y5ZZ6Swi2g2E4QWKpLtu8=
X-Google-Smtp-Source: ABdhPJxgLnUsPud+DChBpbs1PvSgfFBYDqj3BDQC1kn1ZV35p1gnQLBogrK8gfn2w51vFJhdEAqunA==
X-Received: by 2002:a17:90a:eb02:: with SMTP id j2mr28352675pjz.174.1631984262652;
        Sat, 18 Sep 2021 09:57:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 05/18] python3-parallax: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:25 -0700
Message-Id: <20210918165738.2581429-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
index 00a4ec86b7..14c90ffb58 100644
--- a/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-parallax_1.0.6.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Execute commands and copy files over SSH to multiple machines at once."
 HOMEPAGE = "https://github.com/krig/parallax/"
-LICENSE = "BSD"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=52c67ffa6102f288a0347f8c5802fd18"
 
 SRC_URI[md5sum] = "e312397b083426af84db7076dc2a28d7"
-- 
2.25.1

