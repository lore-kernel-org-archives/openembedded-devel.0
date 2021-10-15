Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4350C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:16 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.4264.1634338575246952367
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=p78IVFy6;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id t9so46906413lfd.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lFFxEEfDZFSkPyDfjmBYPmKHTCWDTngGU/p4BUOV/80=;
        b=p78IVFy69/LarGoWzcDeJ3A7En/D7QtBiinAqPoqe3aFivbvbuWklG8PTIkDz8XQzY
         gd2TIX7jlOnHO5Z4O6zStb5FIXo5ZjZaanHHiQVm980sFNJmxtHEyvM4X9xFb3eq5GSi
         I8s3igx4UTmv9T+8M7zNpFyCB/O8qrEFk54neSGmITMaCMoQ83MF2zi+xNcWjcVlFzWr
         qltwV0QNLkj7atpKNDKrCA6gNumQxLSf3XLqYU9+AfwY03t/KFYPWkr5pDM4sMQhKIsy
         K4NZXTdQO7r96URV05N362dEiit+iIAlbKgucdozffftSt1wWkNcHXK9dG+6dZ+51GC5
         +HGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lFFxEEfDZFSkPyDfjmBYPmKHTCWDTngGU/p4BUOV/80=;
        b=4sHNpiz8psYJiqgWecdGqGz6DY8futOv9S2niSRURrFiPt2F4BDgW4X6U66+OGv/rt
         zMZb9a9Osm+KE/iEZivbNaXOqmNtlL37dpotAnj2ofQGBSXnV2bA5OKtC0SERmO1blxU
         j2U5h17fkCl2CI1lZPvE+GwF8hhtxiw/w1VPhnjPwfeCFlKAIJCGNade7UKeicsL0JYP
         i4EJvrRV2exbFYJCubwc5KgYbENS38euZ2wNS+EjN1w9aQHKyXw1Q12/0Xi9AC/Y5Y/2
         x8R/E4qhIrUFHfJo9F6BK9oBClxiSlj3WubeIOOP6WbfNkC6YVzCZlhZq/Ll2KmzLNc7
         edqA==
X-Gm-Message-State: AOAM5327Vbn+YtRqlf3EjNYcAZKBSY99vGEcnTB9omqUz6eMTn9019gH
	jRDWyc6014heECF6Z1DeNVljCpF3FuU0EaD4
X-Google-Smtp-Source: 
 ABdhPJwweygsMVtp7rsjFyHsH2kiPzJLrX66wxlSADHS8EZxrDFeLClvCH8DJVH1biEy+p167mbZCA==
X-Received: by 2002:a05:651c:1542:: with SMTP id
 y2mr15501035ljp.172.1634338573361;
        Fri, 15 Oct 2021 15:56:13 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 a11sm762032lji.90.2021.10.15.15.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:12 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pyperf: update to 2.3.0
Date: Sat, 16 Oct 2021 00:56:11 +0200
Message-Id: <20211015225611.4162475-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93351

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-pyperf_2.2.0.bb => python3-pyperf_2.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.2.0.bb => python3-pyperf_2.3.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.2.0.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.3.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.3.0.bb
index 89d22ee89..5172b0a05 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.3.0.bb
@@ -13,7 +13,7 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "498bb4d1fe21350c2b7c1aa8bb3eae9c9979358d0b66327954bc66839fcba8b6"
+SRC_URI[sha256sum] = "8a85dd42e067131d5b26b71472336da7f7f4b87ff9c97350d89f5ff0de9adedc"
 
 DEPENDS += "${PYTHON_PN}-six-native"
 
-- 
2.25.1


