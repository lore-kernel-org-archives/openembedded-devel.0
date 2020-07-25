Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web12.7276.1595672122422246021
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 03:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=pQfdHvUm;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.181, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f181.google.com with SMTP id q6so12401685ljp.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 03:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tRYTOwiqwwdYsoNrO/FYRj5TSr4SLAqtti42YAWRRpI=;
        b=pQfdHvUmBdCLkAWXgoC0e+fCcjUfChZ3brZOIWl43OB0ADvTk+dWOdrivLZ+The0yv
         4z/JcfYcV9WdRVwxAU9Zdeqa5mhHowY5WJncZzt5kA3n5Zpb1KAzyucKEUDn3OiqqfSr
         x+iHbXGAjrydG69+2SpX+Drmg3MRhChEhoI1XO6Ki7OgBgsFRX9yPGQAoZLTLAkcSLJK
         N58N7o9ezT5EQnJ84uU35ix8dZrVTbM/PGFM4Y/Xhe/idlJGhfUAuUjnelMUDLFoXekE
         rwQpRa3rlmugNVwhBz+6uNHr1LXDQ+PD89NvMUir43wr81gqNJyZ7Knh7sheN7zrYwRM
         3T2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tRYTOwiqwwdYsoNrO/FYRj5TSr4SLAqtti42YAWRRpI=;
        b=sR2xOVtrUEVz37oohwoDGxpR6CF833yPW1iKneaEjtT4zqKxUeokU9FOk0jRZQYZ56
         g1yYJsDbTeTa0PRwN39NOmupGt5ltnKr7paUjMdRPFVaqE5M95b/2QeI7QPE076jVWIa
         TkLHok9c+sJyNqX20HplltSZvKe7I4UmZECNVxsqcYNVvkCV8EO5N0NVEYn8kK9fLJGK
         u4qHKUFGCJYgV1uiIztNL8zN1nj3gsvOINOtJ15v++ZyvPrToODsc5CDhSOBfZ7hVoet
         d1IRlWKe6CSdqeJn/nozLJQmPMukPjGHogF9I2W0pLyaddFvTcMRbIhfFH0DINeXTdWq
         Uvow==
X-Gm-Message-State: AOAM531xa8bWaO9a1+8vbH/+XDWNBJTu6Jrj/QT3EU2X3HyCtlrQxU/P
	eMckAI+ZynwzPHbo2N79qaCmPB3carw=
X-Google-Smtp-Source: ABdhPJxKDgf/XKErhoV5FeAcr5vXGsHwvaHSRNJNNhITxhwT6NcUUp6ek+iyodGMV4Enh4gWXSxjiQ==
X-Received: by 2002:a2e:9207:: with SMTP id k7mr6107345ljg.120.1595672120220;
        Sat, 25 Jul 2020 03:15:20 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id h15sm907045ljj.105.2020.07.25.03.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 03:15:19 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] dialog: update to 1.3-20200327
Date: Sat, 25 Jul 2020 12:15:17 +0200
Message-Id: <20200725101517.1937244-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../dialog/{dialog_1.3-20190808.bb => dialog_1.3-20200327.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/dialog/{dialog_1.3-20190808.bb => dialog_1.3-20200327.bb} (86%)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
similarity index 86%
rename from meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb
rename to meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
index a1acfcd005..5ac9b89020 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20190808.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20200327.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
-SRC_URI[md5sum] = "f48b597251a26c522002736652e0300c"
-SRC_URI[sha256sum] = "886e12f2cf3df36cde65f32f6ae52bc598eb2599a611b1d8ce5dfdea599e47e2"
+SRC_URI[md5sum] = "f7a3c240af305b5282af590541e8f4b7"
+SRC_URI[sha256sum] = "466163e8b97c2b7709d00389199add3156bd813f60ccb0335d0a30f2d4a17f99"
 
 # hardcoded here for use in dialog-static recipe
 S = "${WORKDIR}/dialog-${PV}"
-- 
2.25.1

