Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web09.406.1613771768808871615
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 13:56:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=uhiAl6Jt;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id a22so29151917ljp.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 13:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qIYgmySr7J0Gqrl1I4bg+2bdtoWCAu7RSeFbqQ69RX4=;
        b=uhiAl6Jtww925hyLaIlqx1X3Q/+Y+UrkF/9ByagRpQVCpyTg2KxkAbmUqDxulCy62n
         AMoHscQC6p7QsiJSPnk3bKCeVJvVzzYLsD1jHxXvIkSG53DmxT8fO1eeQyjampBgPU/g
         SAym5b9TK6PJX1ZYTsAj5tPn44O+bYo4+nJKXaswxJS6rqrNuhdrSmx+qPYHpszWKJpE
         TpOdakh8vC5ZhM9IV6LK4ayH1UqVz4H3csqzJavRYQADHE8Q5XE9s5mgOquwYgcIImOh
         pcLeSjJbKLUg61k7uWrgDd8Uip0goDrE5G62wm58ADq56Can/uFvCp1fi+OqxdHGv2Zr
         L/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qIYgmySr7J0Gqrl1I4bg+2bdtoWCAu7RSeFbqQ69RX4=;
        b=aRkb3sp0/Zh8LwkXiXTQOdmLJzN/YDeDQbbSOWJ7WzFoMrLlgQ87SOrYnvb4JInreV
         Zod7hZHz8QiuDDRB7H4w84YwEEAurDGFLrTOuDtKCoA/3gMKl5URjs+++lG9Pu68dYjw
         7dilDETKLmtVU9a4kP8e2HULRhWg6GdMhGgQDFopZzcOpLvOcz772KQaTMhVO4s1H/NO
         t5H+ujGyFcI9E31aYofo0JNIoSsAyLtrZLwn1kxVHMlwBHWuQ9Ewus7YQ9mT2dfsowna
         uHRO7WpUQa7hrqqHpsXtvVIDmj4BcF0/0pnEdi12TaF+zeu3INE6UmIH/KH7xv15FUI9
         xHag==
X-Gm-Message-State: AOAM531jvBfEOFic4hv4UvuqZleKqs3cb4p8WcGXjeELHt6LoCRGhsts
	8te41cTCl7QDP2ed40kue+aaYI3PKD5tUByg
X-Google-Smtp-Source: ABdhPJwG8zzJCv6QVXuvKRdCLUE8AfhbacXZSpxf8eBCXH/oPNZWodT0i5nJ5Lb5rvkHIMNe/3OQRA==
X-Received: by 2002:a2e:9ccc:: with SMTP id g12mr7223867ljj.6.1613771766610;
        Fri, 19 Feb 2021 13:56:06 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u12sm1040851lfb.16.2021.02.19.13.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 13:56:05 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-configargparse: update to 1.3
Date: Fri, 19 Feb 2021 22:55:51 +0100
Message-Id: <20210219215551.2368621-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...-configargparse_1.2.3.bb => python3-configargparse_1.3.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.2.3.bb => python3-configargparse_1.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
index 54841c243..aac58de37 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.3.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[md5sum] = "8978866babc7ff0994f691ebe48b5aba"
-SRC_URI[sha256sum] = "edd17be986d5c1ba2e307150b8e5f5107aba125f3574dddd02c85d5cdcfd37dc"
+SRC_URI[sha256sum] = "0428b975ab6c48bb101ccb732e1b5cb616296e28268e032aa806f32b647a1cc1"
 
 PYPI_PACKAGE = "ConfigArgParse"
 
@@ -19,4 +18,3 @@ RDEPENDS_${PN} += "\
 "
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.25.1

