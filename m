Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.28433.1595769278041361433
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 06:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=0VFzLd0X;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.171, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f171.google.com with SMTP id h19so14361062ljg.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 06:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jvqCgIixB0565sivnNW5g7nsp+RI0mnfJ7U00kKWV0U=;
        b=0VFzLd0Xxfvg8o5KBgmyu7EstQD5LY0IG1Mcv2in2VS9ehxyIp89QkNBlb4na5kfmD
         KIXhdNjRaxiw8MlFnvUQAyDcl0cz0/3L/1Bmqa6XcFaxVp6myzETNb9sp8XInxyg8oca
         1dDE72dfj2QpmxKOASyKsoxrdDLzoDy2AsLyyM1+NYrDwjY/eo/1JdjgYzhVl7eccehz
         R64FPTX2WZoGv1IcIgCZxmDr0OBipARJkzEEWA8QC46LJ+V6Lb5AfPKwqQ8XOaobOdIw
         LD0f/qz+31eDf1t1jwRhE7/62ikAeNxr1exYe07fgPgg8sXHDoMRtaaJSnD96XgzZEIh
         /a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jvqCgIixB0565sivnNW5g7nsp+RI0mnfJ7U00kKWV0U=;
        b=t7WmOwV2XfxZ0oINJWY7wDEe9RrozMF8xjlxXc5XK7srXpdXXXNf7zimCXGEL56As0
         JCtTiCKnv6SY3sYmfeTV2WACGq2PVrzFXL+ksyYxK6vLxoLafmp1rKXjYQkDIcveKhIf
         rcnl6un3t4EQ0bxoKPNaZUI/gcMPFamz+4xKbrRW9ENJvNjvPBfuwSI2EJVdt9MY4es0
         bWnOAzz9XpvBh8PSRJhNWUUICOvVNvjhH2ufBgizmjC4gi1GYjS9yDMET5tQrlpUL7P+
         zIj2SFvTmofgLaAtEbra9La53aNQAEG6DNinYBIlrQFbA5ZmIgG6C2N0cFyKFZG3jSiY
         d0GA==
X-Gm-Message-State: AOAM532PTp5B5tYUVD+wq8Wp5iiz2nOkcJE4UYLW9t0vq7otQ0Sg87YT
	Tq762K/dV/uqdP8u0k2fAB/DICAwGic=
X-Google-Smtp-Source: ABdhPJx6kRwPmm71eP4nfjEIfWvmNEmEqt2CYG1NLwewIo0KOZP6htGIKW2iZoYKzwZdJH53g5iwFQ==
X-Received: by 2002:a05:651c:106e:: with SMTP id y14mr7815629ljm.49.1595769275811;
        Sun, 26 Jul 2020 06:14:35 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id 197sm384965ljf.103.2020.07.26.06.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 06:14:35 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] ostree: update to 2020.4
Date: Sun, 26 Jul 2020 15:14:33 +0200
Message-Id: <20200726131433.152735-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../ostree/{ostree_2020.3.bb => ostree_2020.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2020.3.bb => ostree_2020.4.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb b/meta-oe/recipes-extended/ostree/ostree_2020.4.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2020.3.bb
rename to meta-oe/recipes-extended/ostree/ostree_2020.4.bb
index 43021c5342..559aa0ffdf 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2020.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.4.bb
@@ -25,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree \
     file://run-ptest \
 "
-SRCREV = "6ed48234ba579ff73eb128af237212b0a00f2057"
+SRCREV = "901747f98561cbeedb2ed150793d9b8f94451f20"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.25.1

