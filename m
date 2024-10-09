Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4056CCEE343
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 18:21:33 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.24247.1728498085590219512
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 11:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hyiPKHno;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a994c322aefso226167266b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 11:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728498084; x=1729102884; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akfqzeKaxchAF+kFfozR0LmvELdUb8R9vaEutuYlQQw=;
        b=hyiPKHnotYA21k6Uk3IJ0FIG5yTwEFOXl3Z1Y8VlP+AJjplKyOy8bpJDtUll1k1Uj7
         AXnJBuPPDuHhLZTPyT3JMEGyJeYfLKp0ixyiR2HIdWV3S+LCbh2OyZLfsfj+4ialkKSi
         dPRtJWOl3gm1hLd55gXcHHkUdgrQZIIAu4HrqUuVj745JKJeyjxatJ6BNG5L76478wcQ
         +HuxtRxdWCnlAAYls0z3bbfAggz/rKU/+BrgLO+yvN9L9YNOS4CRNHUt3zJnD8bGou9d
         1FVOa8s1lB7c+6Fa7D/Dh1jAZsFpQcaQBeVt4mDhYBolsfQ7a2eyMYAN7FCQotlLhayr
         enzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728498084; x=1729102884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akfqzeKaxchAF+kFfozR0LmvELdUb8R9vaEutuYlQQw=;
        b=ErpXCH54zBWWULe13pzjd9It+lgDSYJO1zd0r47Mi5KlndGe/mH8hge6hQ+rOfhVfX
         NBYI4qiCXHAM98tAl6C2q9oMjZMmWQ53Q+FXXCsjAheoS1nohqdh0huXByE896nqOIkO
         m1B1EG/xf8xLNUEgCO2XvqwPNF6hfdauP5/YbzMvBSsiuKT5v9nn2NP1V8/rFPXOovhr
         /IhosxUKsacpNIZqQdmrVrjl4wdmCNaQq3ddmU6sjOyzUUWfrjoRr6AZ+rxGDbLqXKOD
         FPh5zSBqr+jIz+VKmVxV7yujjVbzQ6s5k6czHU8L50tn1s2wi4TAPirbwZRZ/FBD+pnA
         DxNA==
X-Gm-Message-State: AOJu0YyxiHQHWwBfeJkFiZEm1cuyJ+h66hWWhLflhdGel/AUhzrouI9d
	vyjyXwPzhh77Bd0XQ2WR1aagbe9Yjuws/5G0VajxWjrcDSNeqliHs/aZzA==
X-Google-Smtp-Source: AGHT+IFVYwpDNAqVRwZggenCgzlJlj3g7HYkfrzutWyjp53whU+dFq45hLREULicPdK/Np2TwnJKQA==
X-Received: by 2002:a17:907:7ea1:b0:a8d:3fb6:33df with SMTP id a640c23a62f3a-a99a10e81acmr62796666b.8.1728498083509;
        Wed, 09 Oct 2024 11:21:23 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9954cd8395sm446754466b.30.2024.10.09.11.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 11:21:23 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 5/7] python3-pastedeploy: switch to PEP-517 build backend
Date: Wed,  9 Oct 2024 21:20:29 +0300
Message-Id: <20241009182031.242045-5-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241009182031.242045-1-alperyasinak1@gmail.com>
References: <20241009182031.242045-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112741

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

- Unnecessary dependencies dropped.

Fix:

WARNING: python3-pastedeploy-3.1.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../python/python3-pastedeploy_3.1.0.bb         | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
index 27f32bf1a..e3405939c 100644
--- a/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_3.1.0.bb
@@ -3,19 +3,22 @@ HOMEPAGE = "https://pylonsproject.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=1798f29d55080c60365e6283cb49779c"
 
-inherit pypi
+inherit pypi python_setuptools_build_meta
+
 PYPI_PACKAGE = "PasteDeploy"
 
 SRC_URI[sha256sum] = "9ddbaf152f8095438a9fe81f82c78a6714b92ae8e066bed418b6a7ff6a095a95"
 
-S = "${WORKDIR}/PasteDeploy-${PV}"
-
-inherit setuptools3
-
 # Uncomment this line to enable all the optional features.
 #PACKAGECONFIG ?= "paste docs"
 PACKAGECONFIG[paste] = ",,,python3-paste"
 PACKAGECONFIG[docs] = ",,,python3-sphinx python3-pylons-sphinx-themes"
 
-DEPENDS= "python3 python3-setuptools-scm-native python3-pytest-runner-native"
-RDEPENDS:${PN} += "python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core"
+RDEPENDS:${PN} += " \
+	python3-core \
+	python3-misc \
+	python3-netclient \
+	python3-pkgutil \
+	python3-setuptools \
+	python3-threading \
+"
-- 
2.25.1


