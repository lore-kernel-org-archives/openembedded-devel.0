Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.1149.1590006764639547358
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2020 13:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=hqhrk+Cu;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.196, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f196.google.com with SMTP id i5so4963372qkl.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 May 2020 13:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=0jAwGjXJ33ZQuTCtRSTBpuhDMMkr4km6Sf0cBA3jHhY=;
        b=hqhrk+CufTztHzHq96K5SzJ0a5Nyik9apa2qHLgPPR4gxyXk77teKR0nJvO+KGcaiU
         JvBjzxI6bx7skMMJaVSmtH6IwCrqa9AmDrTeBxE5BMGZginEmQ+kd3jnfGHneZPTa94U
         JqXFBcoSws99PqGiS7BDOvycMxD5UEsH2GMLpdiLRUB6yRgbVQ2jbJb9ZwWpJ+LN8jbq
         tMGXz0yjYYW9K7B994T2e2BSwjcAcvzrjgsIkVQ0gbAOyhFp8tiFp6hTqCJ/rlNJPc6V
         GC6G/CuaRAddGL79//WUpcUqCEu7XBtS3knNPFVnesF1wNvmbPSHq/T5zlG8QjjkgJBP
         NRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0jAwGjXJ33ZQuTCtRSTBpuhDMMkr4km6Sf0cBA3jHhY=;
        b=Ia609EStqGAVnhgiG0odiL/JUveXHBUsNBDTmMSl1sC/4z5qqM75UOVyd60mVjfKqI
         y/z5limklt9kasSHmA6FYuM/siTlxKxEC5CxhUubOEE8LHkhUfzk6gZg5FAONrMrWs47
         +ZCmEi+DPD+dMmQd8Lqq1L7lANZAyBhfWKuGdcTIylo18vcnbsZBI/EYmV5Qd1grWudk
         yNKNDHMQbEObVlxEQGNSybBaw3xQ/hgHejheL8N9hZ8DLBpSBSg0SkwaRduoV+Yv0PYd
         GyXsPP8me5stnxOxhiZU3sjBT3YfwJBWy7ofUAafSVVdEn5XeJqQAR3lmFTJ/yoj05GB
         IYsg==
X-Gm-Message-State: AOAM532FKxIf5DKCICFoHBxU2g6dr8DIFeWad47UUQm7WwG2LttN2hP5
	QRF7k5p5ccC0xKu34G1d+uidWfRTk4s=
X-Google-Smtp-Source: ABdhPJy6E0U3/zrAFVaT0qunujtwSoWwxYLL5X/8GrMZpb0MX0xJ/LmQ18tLCG7/SNDLfYmDGtWQRg==
X-Received: by 2002:a37:78c1:: with SMTP id t184mr6678642qkc.213.1590006763724;
        Wed, 20 May 2020 13:32:43 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:2dc9:bb48:7a95:b828])
        by smtp.gmail.com with ESMTPSA id l133sm3140178qke.105.2020.05.20.13.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 13:32:43 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH] python3-ansicolors: Add recipe version 1.1.8
Date: Wed, 20 May 2020 17:32:17 -0300
Message-Id: <20200520203217.26010-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-ansicolors_1.1.8.bb               | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb

diff --git a/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
new file mode 100644
index 000000000..9ba710cb7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ansicolors_1.1.8.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Add ANSI colors and decorations to your strings"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
+
+SRC_URI[sha256sum] = "99f94f5e3348a0bcd43c82e5fc4414013ccc19d70bd939ad71e0133ce9c372e0"
+
+PYPI_PACKAGE_EXT = "zip"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

