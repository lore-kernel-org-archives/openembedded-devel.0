Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.389.1613771689116537648
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 13:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=JC/bn0Om;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id v6so29147797ljh.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 13:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cna1xx5K73d/EUFlTNy+GaF/boF48zEJqRD4i17vfwA=;
        b=JC/bn0Om9Tu3qzpao46I7cy7TivIIwq6y1Xwd5mdWBBBHQqxP/4nuLKrW68vcsG9TF
         f3NQ/356hD1jpcsi5QjbP92pNDp4BYXuB+kMYRGyUOqsOv18Uoevk8/oQdUIhrfaRAUB
         QkyCbr7Z9xYLb/9y+mM5iGbhGgq9b3GARGee0mPzBWij6W12xnFYUmnbx0lv/JK3kBeG
         MqwkQtxhFmESxp7XDW4RaPS+gr48NM+XQJPMgHD/L+8ISAZqrbF72AAb+X2BEKS6b2A4
         mBASRsQllGBe3MGdkms8dKe+p2gQ/vieCz4tIyl0Uap2taY+5vH2ehBW4X4tvXeXqBgN
         bLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cna1xx5K73d/EUFlTNy+GaF/boF48zEJqRD4i17vfwA=;
        b=DnzuLOM7K/7Px9GhRpCykkvtSp/+uIcLJmIBkLpwQPxSXFBIVNfLXoEUK2rQCaUBkp
         UXt+Es8ZTTolbpEXFdhDgy4ZxqO1AJ36RaiiXCp/ItIYil4AaBAcSA2c2pkePOL5vGqH
         clVDdnen+c50IhrT23ScjFJ8BwhclTbqYU2ebc01jvgpp0m6RBFlzRgEptxeJUPSl7qx
         qKWf3E6ZGQ+YnSt7HhmG25ga+/OwSRfcfzL/Hehba5t1l1YoMR9DJd2XO1LdekI3Eq3S
         ehPX3hJ2KYdFJoSyAsKywRb4c5ceVxohNvVtStjn+R4xF5/1ZKRMqNkhHd8Q9WoBd2pt
         uoIQ==
X-Gm-Message-State: AOAM530/hFrzCzGu+u718Z2XWyykNbOQeRL2eb6zxn2pbRSzade244xI
	8KDH6tMPLEn33TOSrmzskcd9h6AXjJGlPVUa
X-Google-Smtp-Source: ABdhPJwiNlKA/9kXe6+i9JdtwrJ4OAUp3gM7OBCVYGbqUytKV0nj09k6jKSFJabnWsVtTgClyB1HpA==
X-Received: by 2002:a2e:b179:: with SMTP id a25mr7373130ljm.351.1613771687063;
        Fri, 19 Feb 2021 13:54:47 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id v4sm1047575lfr.42.2021.02.19.13.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 13:54:39 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-soupsieve: update to 2.2
Date: Fri, 19 Feb 2021 22:54:36 +0100
Message-Id: <20210219215436.2368058-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-soupsieve_2.1.bb => python3-soupsieve_2.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_2.1.bb => python3-soupsieve_2.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
index 7cb0efbf9..9507f60d7 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_2.2.bb
@@ -2,9 +2,9 @@ SUMMARY = "CSS selector library for python-beautifulsoup4"
 HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5a6fd3b0c24fc5a041a3d1bbb22c81b5"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=33c3a77def9b3ad83e01c65bdcc1af67"
 
-SRC_URI[sha256sum] = "6dc52924dc0bc710a5d16794e6b3480b2c7c08b07729505feab2b2c16661ff6e"
+SRC_URI[sha256sum] = "407fa1e8eb3458d1b5614df51d9651a1180ea5fedf07feb46e45d7e25e6d6cdd"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1

