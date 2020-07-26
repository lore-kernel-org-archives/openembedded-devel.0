Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.25858.1595754053807672529
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 02:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=sTUrSrrE;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.47, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f47.google.com with SMTP id i80so7369157lfi.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ujGDFOaAdA6KkhQT9+W6MesXIDpAdZ6roIplvwfd7rw=;
        b=sTUrSrrEJiPGFJ1jW5i5OityWDaZ8kyXLn7Nj4O3UnRwUXpi2iuMzkM6BTaYZM6QRZ
         I8OdMJpWz2AzqmJzrPGiPG90Ol2o31sKSbuyBQnwngQkElGbZJyLdGTIhzG97fg5FEnd
         nI+jCgfWOjE+UIcqo9Toc5ZnG1CRm1j63SCwZw3anGDYU6BL9GeAfGiOx2N22n3mnzDi
         xJqzrBU/X/+rDBZGSiMt/mSE1+2EP0YcDVT8C4d9QUWVSIJZrKhDt8oVskgbRPtQAfhT
         Vaowfz1y6riS13zWXXc5GfSmZAU+Tjd1A8oFiSvaOmWd6zZ8A+dKujA3i1ssj9w7OE1A
         R9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ujGDFOaAdA6KkhQT9+W6MesXIDpAdZ6roIplvwfd7rw=;
        b=ZhVX0XdJLzRcizHgWMTSEshQDseYoTcTEq9eAmmyckgINSvewjyDYHZqENDWsDwBgp
         KHAtEuRCS14/FElXNNecERVSjKa7PUyTdOMGRJZlKzYsJV+roArh4KFW3C5NlwrTtTtT
         QnTgOBVmraOxwOVAcuqjXg7C743BljsZI+QTkOr7WxQOGj/vIstULpAGYLV0keFDFh8P
         g9AZKt9h+LZC3NbGq93WxRrF21dOwc4Qfyg7g4pJ1C0YN7mEaA1+hJ3Mx5e/m5MxFYrg
         2nhNnbVUxxe7yswKwExTV26y4DMdG09ffDf8jOGOCfL/RlUaO1ocA0OpUi0DlktVD34o
         1BTA==
X-Gm-Message-State: AOAM5330Mmr41wAAv2kpczE9laA/ZWC892+OZg09t9f9AiX1F2GgdU5m
	Dpx7N4lqxWl4yjzExAxIO25RsPRVQa0=
X-Google-Smtp-Source: ABdhPJyvErkXfQyCuPYGGnw9vw5iQwceEl0d1Z0pNw3F+R6V534aHlC210+sRX5w3N9rNNQXUT/7ew==
X-Received: by 2002:ac2:4adb:: with SMTP id m27mr9318463lfp.90.1595754051405;
        Sun, 26 Jul 2020 02:00:51 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id k25sm1695136ljk.87.2020.07.26.02.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 02:00:50 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libvncserver: update to 0.9.13
Date: Sun, 26 Jul 2020 11:00:44 +0200
Message-Id: <20200726090044.3879493-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libvncserver_0.9.12.bb => libvncserver_0.9.13.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libvncserver/{libvncserver_0.9.12.bb => libvncserver_0.9.13.bb} (96%)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
similarity index 96%
rename from meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
rename to meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
index dfdf82458c..11bba430e7 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.12.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.13.bb
@@ -45,8 +45,7 @@ FILES_libvncclient = "${libdir}/libvncclient.*"
 inherit cmake
 
 SRC_URI = "git://github.com/LibVNC/libvncserver"
-SRCREV = "1354f7f1bb6962dab209eddb9d6aac1f03408110"
-PV .= "+git${SRCPV}"
+SRCREV = "2aa20dad4c23c18948d3f63b33f9dfec1f837729"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

