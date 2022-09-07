Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7BDC6FA8E
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.2844.1662594070794028296
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RiT2c/0R;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d12so16113314plr.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1uNrUmhozEbvX9Zgp7WiHqFhJweGKgvS/k5Mkzbe6pI=;
        b=RiT2c/0ReT4Uzmd6J1Dculs2DCm3dwJDMdh6rPRBTWfYRkfMcGPN6cfyHdiCAVTXTH
         2oUr8wvWYRyvu1JPBQMcaWLgOeke0S9VwTdYaL8zxGJHXrurPQFhTGyf0DrUglhkPFnp
         R1qwN+iXOyODr1qHYfmPYm0QzBJuEx57l1FtLWIvNZGhEl+/3oiH+SxMe3dczDwUkSnR
         iAy2Lw/zor2rcE/JZxgQpT1ZQZO86EnKXyyrh7OtLyP1mqy0RN02XPbi+upc8yB5Sk+E
         pJ3ZQ/7WNRqyR8L1zfceAQnRB/sQGQ3G2khJIpYxNerf+8T5ViHeOorM+rMfkoJE10Hi
         mh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1uNrUmhozEbvX9Zgp7WiHqFhJweGKgvS/k5Mkzbe6pI=;
        b=7zrqyNv3c72nLKneDSs+2S7Rw3VKnZbldmr535Q2epo4DdaO4D61AX3jLxwqZpwnON
         qm4b4kHIqQS0lyTN2pxhdOc2U6JLJO81GJRSLCG68x0/MgprCt+Czp7KQDwiQSy3gyIv
         OnhKFjs8mctnANkZyDdoPuazx+2IHt2zDDOyUJrVYQRJxyWHjpB1YL7aZw30mpIfMvGt
         J6+dHrLIru7PxXJWksRKJYgOdj3CzKRL++kKPr4ERIkoCxQtztx2Ahz4oE3hycZW0KKo
         +SkOnssG1wDRXWEvLx/VC/rdkV763MIDzC5UjrHN9Urzdp988LozhAwLeyzf+9ZGkqqY
         5ZCw==
X-Gm-Message-State: ACgBeo3pPfZ1UUXRzZHzJyTmyyJ4meZos7FlKaCF/UrMsYq6Pw2L8AX6
	PoRNjSgQS6LJOQ7Df7H38bUB6D+T54MCNg==
X-Google-Smtp-Source: 
 AA6agR7HWO2rZSpXEund0fZSMfLxDcKwjiD64n5BcXDoKCD1yoJ4DqzmKgGyBVySdzoJSrP2QeG20Q==
X-Received: by 2002:a17:90a:7088:b0:200:4e9f:a206 with SMTP id
 g8-20020a17090a708800b002004e9fa206mr951717pjk.173.1662594076000;
        Wed, 07 Sep 2022 16:41:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/22] mcpp: Fix build with clang
Date: Wed,  7 Sep 2022 16:40:54 -0700
Message-Id: <20220907234102.3312797-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98704

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...figure-Fix-checks-for-system-headers.patch | 44 +++++++++++++++++++
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb   |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/mcpp/files/0001-configure-Fix-checks-for-system-headers.patch

diff --git a/meta-oe/recipes-devtools/mcpp/files/0001-configure-Fix-checks-for-system-headers.patch b/meta-oe/recipes-devtools/mcpp/files/0001-configure-Fix-checks-for-system-headers.patch
new file mode 100644
index 0000000000..d9bdc01ca1
--- /dev/null
+++ b/meta-oe/recipes-devtools/mcpp/files/0001-configure-Fix-checks-for-system-headers.patch
@@ -0,0 +1,44 @@
+From c1e9f2f3d086e0df3c10a2468fd7b37fd0c5038c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Sep 2022 00:02:08 -0700
+Subject: [PATCH] configure: Fix checks for system headers
+
+Define _DEFAULT_SOURCE in system.c so unistd.h can expose readlink API
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 2 +-
+ src/system.c | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index cdf1eba..6fc81e6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -152,7 +152,7 @@ fi
+ 
+ dnl Checks for header files.
+ 
+-AC_CHECK_HEADERS( [unistd.h, stdint.h, inttypes.h])
++AC_CHECK_HEADERS( [unistd.h stdint.h inttypes.h])
+ 
+ dnl Checks for typedefs, and compiler characteristics.
+ 
+diff --git a/src/system.c b/src/system.c
+index 4e008fa..98631a6 100644
+--- a/src/system.c
++++ b/src/system.c
+@@ -36,6 +36,8 @@
+  *      1. specify the constants in "configed.H" or "noconfig.H",
+  *      2. append the system-dependent routines in this file.
+  */
++
++#define _DEFAULT_SOURCE
+ #if PREPROCESSED
+ #include    "mcpp.H"
+ #else
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
index f8125f72d9..9445856730 100644
--- a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
+++ b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5ca370b75ec890321888a00cea9bc1d5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://ice-mcpp.patch \
+           file://0001-configure-Fix-checks-for-system-headers.patch \
            file://CVE-2019-14274.patch"
 SRC_URI[md5sum] = "512de48c87ab023a69250edc7a0c7b05"
 SRC_URI[sha256sum] = "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864"
-- 
2.37.3


