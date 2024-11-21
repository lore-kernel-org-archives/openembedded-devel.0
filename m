Return-Path: <ryosuke.saito@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE775D6ED17
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 12:14:22 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.9357.1732191256774464756
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 04:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=w2R8BbLm;
 spf=pass (domain: linaro.org, ip: 209.85.214.170, mailfrom: ryosuke.saito@linaro.org)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-212581a0b33so7853195ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 04:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732191256; x=1732796056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ATVMMUTqQv5UtAGYk93Ma9p5VQNm7oCOsqecGCz66c=;
        b=w2R8BbLm0ieOGTUDdYc6JDVxvL6zAT2exuaUkTaxBsLWh9Z85ACSYBHqsjK6pj1wts
         Rhm4wUAILgBW0O57957oaO1cdF4sd/FJlEBo0fiRo9XIh277hGsPFLpqtGsH94bGchbl
         aMWDPrWy38QKMVUszzJYRwO69gOh5OhJhsduTIbP4Ydr3fZE6nUtfUFgDVpc9FwLJaha
         mRxPldht+zV88XTA4PmW3BLuRfuf6fYlCNnG6cPoO1St4fofgNPnS4jmx2ieiNUPzEbl
         S0Y6DN/x9yGkX5Njut27xGy8m3DBpxVHIkgYEureWQpbAVVzt5XQmhTLgZDJFROXNQwv
         08IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732191256; x=1732796056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ATVMMUTqQv5UtAGYk93Ma9p5VQNm7oCOsqecGCz66c=;
        b=Vy995k9YbYrdTpc8DK33Y6FCycQUYE+Wc/pVOvfxgi6f+4+/It341DfQVOY6+6Qju/
         TmNXS3DPDCv25Za7+Xj5V2nVSXeZDKVZxeqdioTH7WtHf4txEC6hgneVGXdSwOU4Z5aC
         5if5EoyK4eZc85akRqk3RNy34HSMA1AT8bfdP2FDCv+5zo/C75VmanqbgCATR2jNl8wM
         1MEjwODWXKum0L6R7V5JVRPb17zY37vsB5C85gn5slQlUi03NhKw5xdf5NCV30E/bcfo
         3IqsO6+qjBP1V38Fqk62BnaZROZ4RhaE4/wQM9KmxAL8UeGvTeKlWpjnUjzz5O7sxlIQ
         XyTw==
X-Gm-Message-State: AOJu0YzIvt2cRf4yQ/ryEfToB0Ctynn9vuBuDxsWm7vk/zfvKIslev6z
	lNrwSIH0kpoAI4YvlQVanHQRKNqAPGtRu7+h0fzM64/e7Q0RY1q2glVM5ncWP23fvIKFyEMKGpx
	y
X-Google-Smtp-Source: AGHT+IFOFePrUDxDcnTNQKvYhdLeZefWeCDI24eK99IvHgyVcCQNDSkL/s2pYJ8B9oz0P49Yajt3vQ==
X-Received: by 2002:a17:902:f551:b0:20c:aa41:9968 with SMTP id d9443c01a7336-2126a49ddfemr88117975ad.53.1732191255700;
        Thu, 21 Nov 2024 04:14:15 -0800 (PST)
Received: from fedora.. ([240d:1a:3a7:a400:9a57:aa11:487a:b54f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212883e5da5sm12251995ad.231.2024.11.21.04.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 04:14:15 -0800 (PST)
From: Ryosuke Saito <ryosuke.saito@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: raitosyo@gmail.com
Subject: [meta-oe] [PATCH] nvme-cli: Fix musl build erros for v2.11
Date: Thu, 21 Nov 2024 21:13:30 +0900
Message-ID: <20241121121412.490051-1-ryosuke.saito@linaro.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 12:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113969

Backport two patches from https://github.com/linux-nvme/nvme-cli to
resolve musl build errors in v2.11:

  - 0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch
  - 0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch

Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
---
 ...allback-for-non-standard-locale-cate.patch | 39 +++++++++++++++++++
 ...dd-include-of-libgen.h-for-basename-.patch | 34 ++++++++++++++++
 meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb |  4 +-
 3 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch
 create mode 100644 meta-oe/recipes-bsp/nvme-cli/nvme-cli/0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch
new file mode 100644
index 000000000000..981acb1b81f1
--- /dev/null
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch
@@ -0,0 +1,39 @@
+From 9444ce03a27b8d423f8170cf75f56d48d8a0a659 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20N=C3=A9ri?= <dne+commits@rb67.eu>
+Date: Mon, 11 Nov 2024 23:06:03 +0100
+Subject: [PATCH] nvme-print: add fallback for non-standard locale category
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+LC_MEASUREMENT is a GNU (libc) extension - fall back to LC_ALL if it's
+not defined.
+
+Fixes build with musl libc
+
+Signed-off-by: Daniel Néri <dne+commits@rb67.eu>
+
+Upstream-Status: Backport [https://github.com/linux-nvme/nvme-cli/commit/9444ce03a27b8d423f8170cf75f56d48d8a0a659]
+Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
+---
+ nvme-print.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/nvme-print.c b/nvme-print.c
+index 170e5c12fb22..5b1f2e827aef 100644
+--- a/nvme-print.c
++++ b/nvme-print.c
+@@ -797,6 +797,10 @@ static bool is_fahrenheit_country(const char *country)
+ 	return false;
+ }
+ 
++#ifndef LC_MEASUREMENT
++#define LC_MEASUREMENT LC_ALL
++#endif
++
+ static bool is_temperature_fahrenheit(void)
+ {
+ 	const char *locale, *underscore;
+-- 
+2.47.0
+
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch
new file mode 100644
index 000000000000..42ca7f534092
--- /dev/null
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli/0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch
@@ -0,0 +1,34 @@
+From ac4818952c872ba465a2d0f48634f9a79aae064f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20N=C3=A9ri?= <dne+commits@rb67.eu>
+Date: Mon, 11 Nov 2024 22:34:57 +0100
+Subject: [PATCH] plugins/netapp: add include of libgen.h for basename(3)
+ prototype
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build with musl libc.
+
+Signed-off-by: Daniel Néri <dne+commits@rb67.eu>
+
+Upstream-Status: Backport [https://github.com/linux-nvme/nvme-cli/commit/ac4818952c872ba465a2d0f48634f9a79aae064f]
+Signed-off-by: Ryosuke Saito <ryosuke.saito@linaro.org>
+---
+ plugins/netapp/netapp-nvme.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/plugins/netapp/netapp-nvme.c b/plugins/netapp/netapp-nvme.c
+index 5c2e3d4989b8..9f05ffc5d97e 100644
+--- a/plugins/netapp/netapp-nvme.c
++++ b/plugins/netapp/netapp-nvme.c
+@@ -22,6 +22,7 @@
+ #include <unistd.h>
+ #include <errno.h>
+ #include <string.h>
++#include <libgen.h>
+ 
+ #include "common.h"
+ #include "nvme.h"
+-- 
+2.47.0
+
diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb
index 13b7c4227e8c..7c030cd847f8 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
 DEPENDS = "json-c libnvme"
 SRCREV = "9f34fcb12e3ab098e9b30e0f31e92cefb497cc42"
 
-SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https \
+           file://0001-nvme-print-add-fallback-for-non-standard-locale-cate.patch \
+           file://0002-plugins-netapp-add-include-of-libgen.h-for-basename-.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.0


