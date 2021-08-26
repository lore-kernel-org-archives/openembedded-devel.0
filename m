Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web08.30469.1629985437327798450
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 06:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=okU/61oP;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.172, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f172.google.com with SMTP id s12so5322549ljg.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 06:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fck/A42bFS9TPh6foNaUrk1+evLGehQ08VNVdo67of8=;
        b=okU/61oPMlbkUzgOwAUi9vTWKlh2x9KhPGYpEMAosMnkWU24QMpxvlGoz8lfjp21bU
         LydHZNuwPb5OH42gWpJoVGWZprMcdB1DF7wSA4oW5cd61Le5GUaJ0w3/5Xu61Hf/JIHR
         JaJzZ23yw7K9fdrFU2C957u4qgCBrdxsY5JoWVVLB0Yng69V4FNlbQdKT/2MlNwEp6qa
         RaR9HB4oGxTgsBW3DI8pXpp7QPgUR2X9Kas983WPp+NiYTFF/7p2DGHo9iq9M6WJlcPf
         kfSLkle4iq4ZXTMy0jRxrrZY7TGULoDKsEF2NM8b1y/Z4aRZLC6Cf5LzsGH8WptxvDXe
         zeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fck/A42bFS9TPh6foNaUrk1+evLGehQ08VNVdo67of8=;
        b=Alo3odjOZAJgN6lyOb11f6B8pPGxmKy8/m/toBtxmOGe9+VTUKBivKTEZxBpC63UxC
         GstVbGy7iWmhufhjBNSVhH0e+lPxK5sguHpAgZWMs5kHVUY2LhTwTBeLivpJWraaRpYV
         KGHwxnA/pDT37eHKNXZDRYxMRSb5i+dCDAhddsrVB98E2stnuxLOx3HYVmP9hkJ8QMPg
         w2oOCtG2epQ6NacE8WWbDj37EWHcEDjqpYzBpAzlweeTgsDnPRuQqFvFjGd9S3JKfP6k
         GZFIOzr8Ipxb4dRFXKTcIk2l/3csYXMphUwVemUsRnqNJHW6RWMhKkbF8z7RSmg1urAV
         op+Q==
X-Gm-Message-State: AOAM5302akvF0vXYHwpb7Nnj/hGoyBXTlcxKyQCslnn2VF5g52sLuRKF
	7m82SYBGQ+OxfPWBOEfTM6GGeJImdiKpoweF
X-Google-Smtp-Source: ABdhPJyNsF5JVNSeJPAejcpUpO7RRQr0ykPArCEjhbM2X3Sd8p6NMNtgF+yvHawSfPHLQ0hZNr8qpA==
X-Received: by 2002:a2e:b4b0:: with SMTP id q16mr3272008ljm.184.1629985434711;
        Thu, 26 Aug 2021 06:43:54 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id p18sm327571lfr.12.2021.08.26.06.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:43:54 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH 1/5] font-adobe-100dpi: fix UPSTREAM_CHECK_REGEX
Date: Thu, 26 Aug 2021 15:43:23 +0200
Message-Id: <20210826134327.2535535-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'-100dpi' is part of the package name, not version.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
index 8fcdb7ca4..36f05b727 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
@@ -10,6 +10,8 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
 RDEPENDS:${PN}:class-native = "font-util-native"
 
+UPSTREAM_CHECK_REGEX = "font\-adobe\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.gz"
+
 inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.25.1

