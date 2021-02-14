Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.11770.1613265560169887783
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Feb 2021 17:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=g3BWgHNz;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.68, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f68.google.com with SMTP id v30so5106690lfq.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Feb 2021 17:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+KjLvl8OqZkqnNaAWdxkTJRgoEENucuD9A5ZzADl1js=;
        b=g3BWgHNzimAXUSLdO62BgffjQwz3O73rb53kVwW6tfAYEbSruy9gNjByoiX4OTAPu0
         boLh2B4Cuv32ASdjn5tDhvzMp7QmfTO+2tBHgdorN0oVaCFF7xhgXW9Xi27ro2EziTIV
         vp+CDxovcJqQrDVx7IOdy5A9+CkyCwW4gqF/cBzEHL+FAUzmREy3Del+TLYdgccGsNJU
         ERx8eOqSqIykxA9ARw/DqqVVAT8DF9fYW27h9ezl4FnRm3ym+sPXrgWskP4QBXBhz6au
         A8pVI57fCMlzPGnLGapIEYYThgTIxryHQL9qZcn6Vrj1GSqkiSTAY09aGwl5TdWwSBDm
         5i8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+KjLvl8OqZkqnNaAWdxkTJRgoEENucuD9A5ZzADl1js=;
        b=hkUqjSPH47Et8fX/B261rmh+4U+MBFuJimYu4rCTPCD2RH9Jz3wqlmNanIxhRr0uWh
         X3l4AVsFy5hJcaTYVa3MlC7hH/vSk7qUjpmAzJukRCSVlDBnXNUupQfSmomjkA5RfMX9
         80luU6CHK+xUo4k8jf4YOG2LOkzQOAR7PxI78tVW+C8bdXkmXWdVyb1vpInK+3QZ9ES3
         wLNHlSUJ4jIrQnu/KogONVRDTdDmgSZf6hEay8bkHpbm9AuEJeKvy4ZQBW4nEbzLFPFC
         npJbeL1a/rEJ7HYq3KMaNCtxInMS22EUbsHnmhQ2ql+4KkP3V3/akWtrtZs4ffUCDw4X
         Ks6g==
X-Gm-Message-State: AOAM5301eVzP8IxD0S3VNDhJy9DX67OxyAXAbD7S4TWCUp1Zk/9rA7D/
	zgNDKvRYNACGz8zGVsZphsKAxyae8oIW45MF
X-Google-Smtp-Source: ABdhPJy5YcvD4mZ0C7CwlG93Vv5nFJ/IYlYtUravmGfrGsn8iVHXxVnzA4s5nU60HwtXTXWkLnvngQ==
X-Received: by 2002:a19:342:: with SMTP id 63mr5080787lfd.297.1613265558070;
        Sat, 13 Feb 2021 17:19:18 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id e25sm2180095ljl.44.2021.02.13.17.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 17:19:17 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-watchdog: update to 2.0.0
Date: Sun, 14 Feb 2021 02:19:15 +0100
Message-Id: <20210214011915.446967-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-watchdog_1.0.2.bb => python3-watchdog_2.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_1.0.2.bb => python3-watchdog_2.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
index 698dfe770..3dd1f8182 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.0.0.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "376cbc2a35c0392b0fe7ff16fbc1b303fd99d4dd9911ab5581ee9d69adc88982"
+SRC_URI[sha256sum] = "fd4b56cfbe0d0d9c4fc431aceca75700a7f12d3737dc2e9cb2ec2ba649680425"
 
 inherit pypi setuptools3
 
-- 
2.25.1

