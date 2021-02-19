Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web08.353.1613771621758626074
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 13:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=biB+ZZib;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id r23so29220608ljh.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 13:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ayCofgM8OJjcFjRFYNTDDOAj0jToqpXxK+vjLs3ZMBQ=;
        b=biB+ZZibXtxPalFH0UFu1siwa/S6Sfd0G+/JaiVEBUcwt/8Bu44+ImrWJJE0GPWkZt
         mQCxtkaXJgyvAyraTlkfstVgVFjD3oDJS9rPw50tQYh9af7mb2/tWzASoNxhmjhXzXan
         oBx4wgmSO4WtI7GsX9u2MYD6c/ZC33cEfhOixL7Sx22ngY2XNLLCQV5VNkWYCWW3CjWd
         FEZEFs/Gy7tzbJ66zekKnvZcA5nlkC+P1ULUbsiOZ089cQ5vOgOvfa7dRqda2mpf3LLg
         /us1yp/CEYlxPQbbSrSLA5piusGPxcwhYIAZDCGT2bWyW921o/siyzQylRJvIY43pV+P
         3i0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ayCofgM8OJjcFjRFYNTDDOAj0jToqpXxK+vjLs3ZMBQ=;
        b=MesGARKzoDDkd7OCDmCmci6AIziaO9e3Wm0WUZzgQ1K9ApxLQDx2a/eMFWoXAMieu5
         bV8i/5rT/R+d0d2dUUCJmy/w8TRCGK1WcmADtd6RuFhyuWmoEKs7qmbNKLDN4ESmtZIg
         xRqNbS+reAOdQTdYpXtDg7hhnDAtaz4n2o2HPMdbsYTnySkixMeb+rP/5/JoE8XnF/iI
         x14bupkrmr8NHp++HNl4Bu0k5TiBAStriGmuicYpt1weFNMpnuXj614yk1w+cwDB/e+G
         Z+EekyZ4SoJaZ52XvcUIxniINjNTmb4s0Qy/xEy7Jj0MJ4G9XyulJDqFJPDkbw2eSod1
         nP0g==
X-Gm-Message-State: AOAM533nRv6xU9p9SEHliytTRVPpeHAmTdfWlRwJHq8oOLdWbAt9/EYc
	hyasK02jfwgXkUyqLvoCDJQk944lg8wak2nP
X-Google-Smtp-Source: ABdhPJxVpJ+zQFGRKeWD1u80IgqWDLCppmbiJug79PczOEkIGhNGPknoUxJ4lPDm31WDuFuCVOZwwQ==
X-Received: by 2002:a05:6512:3619:: with SMTP id f25mr6641567lfs.651.1613771617146;
        Fri, 19 Feb 2021 13:53:37 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 199sm1091259ljf.118.2021.02.19.13.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 13:53:31 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-xmlschema: update to 1.5.1
Date: Fri, 19 Feb 2021 22:53:27 +0100
Message-Id: <20210219215327.2367368-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-xmlschema_1.4.2.bb => python3-xmlschema_1.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.4.2.bb => python3-xmlschema_1.5.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb
index 055a82d4c..bdb15971b 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "f372005d08dfc231ce7f001c3a7a2c7f7ae138295349268bc551a9df3c700b82"
+SRC_URI[sha256sum] = "c4c72b457865f46394bb23525b4e233d6537d9e97b8c6144a6cda2d5ef0d6688"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1

