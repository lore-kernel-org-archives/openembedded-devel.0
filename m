Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.12992.1589899418099321726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 07:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TiJZGeIE;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id n18so10667pfa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 07:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vnCmV9q7K7Lf79C84G5/geJ4jOaxSek2iWuO0D7QkDM=;
        b=TiJZGeIEdisYs4XzblSpJ6xIBHmmLXAwnt22sSUnAw/hxJssG3aXTCjjNVFsQHQ/k/
         QUH5HzsyXrcW5r/OQrVb50LnGIJEx2gVY4PY2FcpEGBL6tcdcVnxz/AWl6bmfWDRPSqa
         PI7rbwXdGrxhm+f6SKB08Qegmo6btx+eq4VbX23f374iHda77dcFhemInu9CwulSOsWP
         1EJW/Vo2j1xBsq0dSG+PPzoOCHuVoxSqxeZH4t0DwICTXtotDwT3Xh7vJ4VYY4ddoTG5
         o4elcz9Kk37t+0mJNV0EFo3l86n9y1zunaxT5Q9XJ0+ksYOnhqdrS3lDK8+H2Y+Y3zuZ
         UWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vnCmV9q7K7Lf79C84G5/geJ4jOaxSek2iWuO0D7QkDM=;
        b=nN6WLbgFj01Tw5ycT7PT4zKo1CPLtCeYqQfzLY/QFao74F4yiJMRczGAQkkCPvKGJr
         tYHHb2u/NzdByrrENrPXfsQvT739cIrtE8p2XqnIJfRYJ7YVoZFjAxMqJ7rNjdNTCeiL
         q/Que56EyPPkHSm06D49VXMlcotLV8WpQ2hcLMsRsEu7P8jAdczpXD1/hX8SKelAfKsY
         /FIUbHJRQknC+Q4pbZW3kF9KGgae6rsX/XyXB+tnbIVbm+nU82Kw7MU2C27Fj7NDHPZB
         jV7f+1hhfAtAfZ1Q5vd8yhaTUkTm2NE7FsbtBU9H1waO9bgSBd0SzFaYu5s6GzeAkjqG
         Id5g==
X-Gm-Message-State: AOAM532gSOPIFcy1x1sKc9q0loyaHPzdLjs7Ph+aF0aK3nttAe4hi9HV
	lhPDfbRsLqmMRO2s8F5b0w1R1bf8
X-Google-Smtp-Source: ABdhPJwd1A5Ndns7UxBiVMRjeccZ/mGuynX1YxWeS/0yyaKGDoy48c+4WJaS37oK4cAk8kRd1Em/Qw==
X-Received: by 2002:a65:614b:: with SMTP id o11mr11223349pgv.443.1589899417457;
        Tue, 19 May 2020 07:43:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id h3sm2382099pjk.10.2020.05.19.07.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 07:43:36 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [dunfell][PATCH 03/18] cpprest: upgrade 2.10.15 -> 2.10.16
Date: Tue, 19 May 2020 07:43:17 -0700
Message-Id: <20200519144332.12822-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519144332.12822-1-akuster808@gmail.com>
References: <20200519144332.12822-1-akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 22a3ff957ad1ac08239ca84e074af367c8fdf0dc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../cpprest/{cpprest_2.10.15.bb => cpprest_2.10.16.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cpprest/{cpprest_2.10.15.bb => cpprest_2.10.16.bb} (91%)

diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb b/meta-oe/recipes-support/cpprest/cpprest_2.10.16.bb
similarity index 91%
rename from meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
rename to meta-oe/recipes-support/cpprest/cpprest_2.10.16.bb
index dee5ae2564..5d7dbd8bda 100644
--- a/meta-oe/recipes-support/cpprest/cpprest_2.10.15.bb
+++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.16.bb
@@ -11,8 +11,8 @@ SRC_URI = "git://github.com/Microsoft/cpprestsdk.git;protocol=https;branch=maste
            file://disable-float-tests.patch \
            file://disable-outside-tests.patch "
 
-# tag 2.10.15
-SRCREV= "b94bc32ff84e815ba44c567f6fe4af5f5f6b3048"
+# tag 2.10.16
+SRCREV= "18212a2a7967e12d740bfb957e500892b3463c88"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

