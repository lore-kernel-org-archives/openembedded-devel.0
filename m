Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
 by mx.groups.io with SMTP id smtpd.web12.9445.1612633320192436066
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 09:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=TqAnU1wJ;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.196, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f196.google.com with SMTP id c18so11174275ljd.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 09:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8aPBu83CfOsRH8JSODEtEMIt3lV6tIGYdhiaA5Zyzgw=;
        b=TqAnU1wJHYymxKqcY00IoDD7HwTIOwPcsLwN5/vHGpvgeYQxdjnKLq9TR2eLoZ1u8X
         txoydExiGdpqIo2bKQlut7Jw7fAbkrER+D3/r/xi6ePHyioAE2M516CJhwqvz6/V3hic
         FqubxMqQi7Z03j+IxB0gXVPTdIQGTN2xiGXZXLEq3hWXtrna0P94Ouag56YpswYY2/J8
         tEpphoNcsQcbcG3r2z/Ejzp/qZOfyg6eeFDU+A96UyeXVoyaNVLKeug9CldCTCBt6ovv
         jNj5b0jvpV7JvpnKetSicn1UhqbkOMRRBvtJAyMUdGk2+ljecKxOo+kB3viotD7louSW
         2YSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8aPBu83CfOsRH8JSODEtEMIt3lV6tIGYdhiaA5Zyzgw=;
        b=Ht242hbWHK+InlepSq2n92TvhxXEcq08KYfJcr6lbAJUhZlPZljneyDG4tQUpkKyju
         TDXg5s9ZJzf3cRAFfCEvKcr073RRW9GFmM89UgHE/ziI4e2hhgT41EcM1NXX8qDQxn9S
         8ESN5b4yeaxg+53/L14t75LrT7vO15NVbZ4CSj0t8PEYj3NtY6SEPPizn59HXaOMTCt0
         572uIivqC++AMR+d/7jGV5c5X4P56bYj3IQ6DmBb87dCJJdcDxXFyUkGqp2df7c11teD
         tcKDCGnREf1FoSV7+7FKKTINT4m5d0RkYPuh45ENE81XV33+s2IneGCwFWd2WIxtlnf5
         mvmg==
X-Gm-Message-State: AOAM532qQ6/X+lSjbIInsGC3ROJD6kPnufSIuC1OxYQmVwkMSaQ6xUEV
	XZH3Xzru4uIthQGtMVQd5hBjSfLI5+mzBSLy
X-Google-Smtp-Source: ABdhPJzVmQmZ44dwidq/ROHOq3GhsI5r3PhIP5HIXstFcj0XvUkybwPuNSq57tgmpTlQJJs1ZxdXew==
X-Received: by 2002:a2e:7218:: with SMTP id n24mr5716238ljc.458.1612633317930;
        Sat, 06 Feb 2021 09:41:57 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id u6sm1374604lji.92.2021.02.06.09.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 09:41:57 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] cereal: update to 1.3.0
Date: Sat,  6 Feb 2021 18:41:55 +0100
Message-Id: <20210206174155.2670243-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../cereal/{cereal_1.0.bb => cereal_1.3.0.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/cereal/{cereal_1.0.bb => cereal_1.3.0.bb} (92%)

diff --git a/meta-oe/recipes-devtools/cereal/cereal_1.0.bb b/meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
similarity index 92%
rename from meta-oe/recipes-devtools/cereal/cereal_1.0.bb
rename to meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
index dd3dc189d..a4b7f3432 100644
--- a/meta-oe/recipes-devtools/cereal/cereal_1.0.bb
+++ b/meta-oe/recipes-devtools/cereal/cereal_1.3.0.bb
@@ -18,7 +18,7 @@ SRC_URI = " \
     file://0001-add-license-files-for-components-of-cereal.patch \
 "
 
-SRCREV = "48fda3f0a6b58f9a9278ec15c15e7b7c3dceeceb"
+SRCREV = "02eace19a99ce3cd564ca4e379753d69af08c2c8"
 
 EXTRA_OECMAKE += "\
     -DCEREAL_INSTALL=TRUE \
@@ -32,5 +32,5 @@ PROVIDES += "${PN}-dev"
 FILES_${PN}-dev = " \
     ${includedir} \
     ${libdir} \
+    ${datadir}/cmake \
 "
-
-- 
2.25.1

