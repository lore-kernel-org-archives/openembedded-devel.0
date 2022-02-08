Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CEEC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:15:37 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.13198.1644336936401171403
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XswzLhJR;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id s21so25432766ejx.12
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DG+xA3x/LUYa7+0jHA6phyrw5QpEx2ktDVB5xAHHhCA=;
        b=XswzLhJRidiaenOazH6wsXiiRaHLlMXpLvteHQGr0i8FTetOrePmJ3ixllBKedAIwy
         819h8yOJyxZ3jzYMonrRwJJOSHL7uC/siRJMZMxA3BHkswnScBJhrTtd+OtXtVaz1omZ
         8Z6OvIT/Rha8NlyV4TYm8ew+NN2dplLbZYoraSNND7RmNxYGgQYHHwsMfJvDTW/fSIoq
         6Hjj6EWsgI33Ye1zlIv57QFZ3+Irx/Hyv96mTfGD/op0t4ZbL1pr7qn+DcvCXGXMtGTq
         yyKFDhOXHSls4oSiD1GSHN9qdzmISCj3UdTdd3ovm+ub8moqT7fAcyfFfNslnf6BnIqq
         9Cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DG+xA3x/LUYa7+0jHA6phyrw5QpEx2ktDVB5xAHHhCA=;
        b=XJEUwJPtoUv7qwzdxtM946egGkTN5sYO+JLu3NI6tmqpngzVd54zk9YL8jl0D1rjEU
         06uN9VQGUkMl9OX5OPmsaZ6mX9/QYDXW7n+7nItNcCoYlWQs5d61+rIJJ5ZsGlreeY69
         BrF+Lb5ZTRHW/iK+ebInLzE8DV1uUtOYUyryHGuPpn5E1Boy8GKIpVw2eSVFHpeXTH2/
         jv3ndL95gixsZXB0sLKR4KS3yUQiYGb+0LxWENmrP3qyLdVBpJluQqRLbLllaVDUV2mt
         byJElsMCN3iXPpvIOK2p7cN7KcRBz9I16IrFOOL3DrTVzA24u0PGribFFtirSb7/+s7f
         kGMw==
X-Gm-Message-State: AOAM531dQd1I77bx7xTYXt8l9ZpAgfeGaP6M7HA+Zgr9tjSvKvVTfhPV
	2Ye1qiTbsQlyt8+BiIBc7it9G+PMwDWjlA==
X-Google-Smtp-Source: 
 ABdhPJyjlmuBzKU9jv544EieXoX1cRXMqYYcWEmxodZZ9b2xCp5v+GYUNRNS6NF8vQanh6BuQIC/jg==
X-Received: by 2002:a17:907:60cf:: with SMTP id
 hv15mr4143593ejc.488.1644336934522;
        Tue, 08 Feb 2022 08:15:34 -0800 (PST)
Received: from Unimatrix08-Focal.lan (mob-31-157-145-185.net.vodafone.it.
 [31.157.145.185])
        by smtp.gmail.com with ESMTPSA id
 r14sm1530582edp.38.2022.02.08.08.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 08:15:34 -0800 (PST)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] mosquitto: upgrade 2.0.12 -> 2.0.14
Date: Tue,  8 Feb 2022 17:15:32 +0100
Message-Id: <20220208161532.1629033-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 16:15:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95267

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

- Upgrade license hash due to whitespace changes
- refresh patch 1571.patch

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../recipes-connectivity/mosquitto/files/1571.patch         | 2 +-
 .../mosquitto/{mosquitto_2.0.12.bb => mosquitto_2.0.14.bb}  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.12.bb => mosquitto_2.0.14.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
index 37560f30c..627638ec8 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
+++ b/meta-networking/recipes-connectivity/mosquitto/files/1571.patch
@@ -19,4 +19,4 @@ Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
 +	LINK_FLAGS "-Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/linker.version"
  )
  
- install(TARGETS libmosquitto RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}" LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}")
+ install(TARGETS libmosquitto
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.14.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.14.bb
index 06d8211a2..739b7de62 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.12.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.14.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "http://mosquitto.org/"
 SECTION = "console/network"
 LICENSE = "EPL-2.0 | EDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca9a8f366c6babf593e374d0d7d58749 \
-                    file://edl-v10;md5=c09f121939f063aeb5235972be8c722c \
-                    file://epl-v20;md5=d9fc0efef5228704e7f5b37f27192723 \
+                    file://edl-v10;md5=9f6accb1afcb570f8be65039e2fcd49e \
+                    file://epl-v20;md5=2dd765ca47a05140be15ebafddbeadfe \
                     file://NOTICE.md;md5=a7a91b4754c6f7995020d1b49bc829c6 \
 "
 DEPENDS = "uthash cjson"
@@ -19,7 +19,7 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[sha256sum] = "31cf0065cb431d6f4e57a5f4d56663e839c9d177362eff89582d7cfde191c933"
+SRC_URI[sha256sum] = "d0dde8fdb12caf6e2426b4f28081919a2fce3448773bdb8af0d3cd5fe5776925"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-- 
2.25.1


