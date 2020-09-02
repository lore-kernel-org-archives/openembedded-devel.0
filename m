Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.2493.1599033817376029582
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 01:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IXXPd505;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id l9so3516817wme.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 01:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=zNWb/yOnHyHKlAYTxVwhvble7IAajHVx/10fDq4u3hI=;
        b=IXXPd505xalA7Vnyck6SBq1xTaDlsrkDWqeRWmWyJgU3+afiqxSWfA03aknDiPCig6
         uCk+ZipOD9pETl/Bd4TNYpApfVYnAXkjkKvxW5AZTamxSUAJsB7zMx9QSHVxnQr6e9Ke
         0xx8MOMv576Z/RZOT2YmxHI8iEz5kwifst/pxHvyvzr/4rbhFHQqqMqgdMkU6hBYM3xb
         V1TWglM0DiNJQC1V4aGxI4jahvVnENLcX0C68wrgQ3AZr1jWnF/PzK86P5B2MnmMleSi
         CHLmtowU/0+UWUwrXm+dSowbTHzeG6iDu1Qum+Oitj9KsnD/HaTg8PEAUfdpuAV3W+HB
         JgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=zNWb/yOnHyHKlAYTxVwhvble7IAajHVx/10fDq4u3hI=;
        b=dcN5ju83puEHdjZsBOw4T4E7Z/DMoXMjXAvTeomnkOTLQS/towJGUpw6z+oNEbM7p/
         +WwrAJzmcwsu+Wbn3MWblwcmv4flbM/cTj2cEe/0BO3wSAYBtDqnfIRzVdTsCJefSW9d
         FI0ofjgP/WBMQ0vKsYYdNU1asw8MVise+WonYzEbKrS9DntnrAT5xCEFzhpG8mjaWkYi
         XESp98fJahRBXrD02+TnWM7uWvu99UkEjuuCKs9QJh9aUuVuBfuQZ9MO5MqzWb5zQXHO
         ukZFaIcRXqplQ9YVbyXXST7HpOceFF3bkh2QcHGb8Nmst+bRYyJN/HFY/XDRnQwv3rkJ
         qs8Q==
X-Gm-Message-State: AOAM531a6C7J6JwpFhnJuO6v6XGNlfwYWKpzD0DLx2Tv7XHOpveBT23P
	vnvFfBBmb49BZDj3WBT7fbFrlqfMtn4=
X-Google-Smtp-Source: ABdhPJy8VKR59Q7DBjZP9m/AJlYxquq5xkCDQyr15tDR96h2KgYEITx3dMvoXBl8d4BxjeZlnE/uiA==
X-Received: by 2002:a1c:2854:: with SMTP id o81mr5319785wmo.61.1599033815378;
        Wed, 02 Sep 2020 01:03:35 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from Unimatrix05-Bionic.lan ([2001:b07:5d32:c012:3f:a5ba:1524:a0bb])
        by smtp.gmail.com with ESMTPSA id t16sm5971146wrm.57.2020.09.02.01.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 01:03:34 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] brotli: update to 1.0.9
Date: Wed,  2 Sep 2020 10:03:32 +0200
Message-Id: <20200902080332.6083-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../brotli/{brotli_1.0.7.bb => brotli_1.0.9.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/brotli/{brotli_1.0.7.bb => brotli_1.0.9.bb} (91%)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
similarity index 91%
rename from meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
index 32f855844..642e18f4a 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.0.7.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.0.9.bb
@@ -7,8 +7,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
 SRC_URI = "git://github.com/google/brotli.git"
-# tag 1.0.7
-SRCREV= "d6d98957ca8ccb1ef45922e978bb10efca0ea541"
+# tag 1.0.9
+SRCREV= "e61745a6b7add50d380cfd7d3883dd6c62fc2c71"
 S = "${WORKDIR}/git"
 
 inherit cmake lib_package
-- 
2.17.1

