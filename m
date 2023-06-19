Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF902EB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:23:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.7383.1687180973395079884
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=A7mZl27H;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.53, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f9b0f139feso12598995e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180972; x=1689772972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56a+TtA/43hlKUDfP6j66MC3RA8BXrHAxnNq5ym+Q2k=;
        b=A7mZl27HCPvzUAqGR9ZacG8Wz1MRX5TEmpSxOAr2sWHkD2RVBf9yHrGrRJEaVwOdEV
         08+SjVqNgcvex819rfoyT9Yys2MPh5+GgfPu7rDuxL8ckNWyDs1RKxYGFBz+JaTL8Mli
         s2xNVaJVF6g3u+yMVTpWdxnTOWzGyOhwDKqsdhBYxnUKrfQdU1sumzF6rtDX0wf+W2/m
         Bf0q9eSDJ7D+75HOmyC1l090q21/XjPnoeJi48/x/zQ489e3k+ZXI17duCBL3LZ12pA+
         /KsyPgZtvzEkX/u9yMFA9uyikqf/WF8MpWJIKmMGW+Ap/wyAXKJbjUexKxjCsxEQFFHK
         8h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180972; x=1689772972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56a+TtA/43hlKUDfP6j66MC3RA8BXrHAxnNq5ym+Q2k=;
        b=MiMOgNxWJBur6PxVn/2R34vfQqXuUPGScVjsq6PNGOZDEaL7c01ykrVnWjTxMzwPn+
         DGDh65GVoh4zZtZ3mkuZ6pk5fp94jnFy43U4fXbpLcQkp1vtWWMfJOhfkkCdZjlf4i5B
         2JgnmifOIAIrmGKHPVm7UYDTaPP5fnRveZOx5JTV7pdjXJelef/E8qCeWA8YG5Im5ZCf
         T2+59nlkfZ9t/kPOOSfp1f2DwYJF5jTL06K6MyKpeO3zg6Ccmf1YGpC51/5R0jmyux27
         rN2PJ6ncqjlFzvNKz2M5CmMk+dlAHAaN42A3/a6RjMaMTX+kVDbBb1chrOvnZ/xibeEz
         mjOQ==
X-Gm-Message-State: AC+VfDwnK8/pBIH+r02kVrlQRVoNSUTlOpdqBfX/aB1eN8VqVW8WZvIJ
	xy29H0oah8H2MJ65qf0jV0vKWg==
X-Google-Smtp-Source: ACHHUZ4yRaD0WuZykDGM25Xf6c1+Aom2HUjnOZ0ITveyEVxkW5sITzE9yHbQpxb5aBSFM1Q6jd0Oyg==
X-Received: by 2002:a7b:c342:0:b0:3f4:d18f:b2fb with SMTP id l2-20020a7bc342000000b003f4d18fb2fbmr9454872wmj.8.1687180971945;
        Mon, 19 Jun 2023 06:22:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 30/54] python3-flask-script: remove recipe
Date: Mon, 19 Jun 2023 15:21:50 +0200
Message-Id: <20230619132214.213417-31-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103414

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This package has long been deprecated by upstream maintainers and doesn't
even work in meta-openembedded due to a run-time import error. Remove
the recipe.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../packagegroups/packagegroup-meta-python.bb        |  1 -
 .../recipes-devtools/python/python-flask-script.inc  | 12 ------------
 .../python/python3-flask-script_2.0.6.bb             |  2 --
 3 files changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-script.inc
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 982e41303..b23d24c6d 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -137,7 +137,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-flask-nav \
     python3-flask-pymongo \
     python3-flask-restful \
-    python3-flask-script \
     python3-flask-sijax \
     python3-flask-socketio \
     python3-flask-sqlalchemy \
diff --git a/meta-python/recipes-devtools/python/python-flask-script.inc b/meta-python/recipes-devtools/python/python-flask-script.inc
deleted file mode 100644
index 3a7adb32c..000000000
--- a/meta-python/recipes-devtools/python/python-flask-script.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Scripting support for flask"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e686048adb69341fc8a08caeda528b41"
-
-SRC_URI[md5sum] = "3fbd91fe13cebedfb2431331f6eabb68"
-SRC_URI[sha256sum] = "6425963d91054cfcc185807141c7314a9c5ad46325911bd24dcb489bd0161c65"
-
-PYPI_PACKAGE = "Flask-Script"
-
-RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-flask \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb b/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb
deleted file mode 100644
index 9f885191b..000000000
--- a/meta-python/recipes-devtools/python/python3-flask-script_2.0.6.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools3
-require python-flask-script.inc
-- 
2.39.2


