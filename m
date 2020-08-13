Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.12989.1597333905964992796
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bF8Zh8o5;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id ep8so2946376pjb.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rfISbywdGyQxCulMMQlEq8FvPvEB/9tj+Y1Oa9lL4aQ=;
        b=bF8Zh8o57AC6Bc3QoF0SsC6j5TFu/W8SkrrQRtNf1J/yU19OoJjH4itg45weLKh4w5
         L5s1wAeQa3K00pqedHrLhrrS+YtfzA3e5dWImlGBg24DSEIAXdYTq7IbONqzoGvSQRRk
         C1MaTaANTmI5G0mehi5gDHyQ4oJBtGSvFM0F9pZoWIEcRVXsd3l/a6DREY8J4ji+xrbL
         SvhqktZCOFeEgby8zdhf58HbWWpHwcinLqurs332ZuwEG4ge3IxFRkxTemT80YGyLLKu
         ybPb3mDfeLJOjK/tjOa8Ujqzm/P5OnqOUfD5U9zP+7I77EtoYgSHpiKKnC3weTwpChx5
         cznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rfISbywdGyQxCulMMQlEq8FvPvEB/9tj+Y1Oa9lL4aQ=;
        b=MheP0TCYFykN9fPdLSAVspu7nYXLHoFBZys67QZjM1AbY995Nft2M+nA2kDMiL80Xq
         zU4fmtKtz8VGqDQA9JOwTTS+BXfrBjW1qD/VumdsIXbuvpFhF36el0I9OJk3oB6FvICh
         Yvs/yKlYZ1VWp0eULnn7SGA15jfi0S7xIt+fThhWjSaUozad84+hMFBpzOKD4NjZiwzq
         8IdeOpjbmanfXnzMr/m+/sxLR2JJcqaypI12KE0Y6t6SQUGboyZIzEZFmZj7IVhavFLa
         KwP5vgONddaBeDYd0bjSVHCl9W4n4BauEBXryJKGHU18maw3DLqCC7BxRVOS4d6EE8Wk
         QVXg==
X-Gm-Message-State: AOAM531Y6bAHz6w3TCcVU+H02qmq6OoCjtBTEt3tpSAufZuqV3pwbq/Y
	2vY31OtFn54UGo6ZD0GHBjKUPheeNuY=
X-Google-Smtp-Source: ABdhPJyMpqGD5oownBd5Ty9V05Ww2uwpgXxnA/J94iBc4Z3SUCe1Nx6+RNjfsA+utntzWKdsc0km3Q==
X-Received: by 2002:a17:902:76c5:: with SMTP id j5mr4531056plt.87.1597333904895;
        Thu, 13 Aug 2020 08:51:44 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id a4sm5664407pju.49.2020.08.13.08.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 08:51:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2] drbd: Upgrade to 9.0.24-1
Date: Thu, 13 Aug 2020 08:51:40 -0700
Message-Id: <20200813155141.774110-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Blacklist it

 .../drbd/{drbd_9.0.19-1.bb => drbd_9.0.24-1.bb}            | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/drbd/{drbd_9.0.19-1.bb => drbd_9.0.24-1.bb} (72%)

diff --git a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb b/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
similarity index 72%
rename from meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
rename to meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
index c296c3bc1c..3ce63c457b 100644
--- a/meta-networking/recipes-support/drbd/drbd_9.0.19-1.bb
+++ b/meta-networking/recipes-support/drbd/drbd_9.0.24-1.bb
@@ -11,15 +11,14 @@ DEPENDS = "virtual/kernel"
 SRC_URI = "http://www.linbit.com/downloads/drbd/9.0/drbd-${PV}.tar.gz \
            file://check_existence_of_modules_before_installing.patch \
            "
-SRC_URI[md5sum] = "bd1202eaaf81641752d0c9b003b10f6c"
-SRC_URI[sha256sum] = "5b3d2bcb99542940e40af903dea783cf04524e9f41cc530e210d2c15ef84fa58"
+SRC_URI[sha256sum] = "14970459f55bc465503b88b24d1a266b2ace0d69fe3cb387005b8477cd6475ed"
 
 inherit module
 
-EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}'"
+EXTRA_OEMAKE += "KDIR='${STAGING_KERNEL_DIR}' SPAAS=true"
 
 do_install () {
     oe_runmake install DESTDIR="${D}"
 }
 
-PNBLACKLIST[drbd] ?= "Kernel module Needs forward porting to kernel 5.2+"
+PNBLACKLIST[drbd] ?= "Needs coccinelle to build with SPAAS"
-- 
2.28.0

