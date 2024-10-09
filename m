Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DB7CEE353
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 21:31:14 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.29047.1728509469430605386
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 14:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NCRZpmQq;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9953bdc341so31721266b.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 14:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728509467; x=1729114267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rKkXf1MKo7EZjcdPkMIGz0GJXU1jgvn9bPhthN3jriw=;
        b=NCRZpmQqx+6XYrpI5UpP70PpZhxA/JUhJwOWUAKUjcLVSKJ+NqdcGHFntjo/mhZVuu
         XVKRWEYYAwTMD2n/oNHoCUV+NompNb1dEbLPkSpHuqvY92TR0duQIILFoW2utNkPx/bP
         nHS3W+B3sfSi6pfgqJntxAbq/G0KtfOU+RSSaY5oGSSJDnFpbPu9ZlAy9+pKQpAmpVme
         hAys2i9cpq7mp9SvGU/irtO2HC8zSPONgsXS2Hey2eMPDGPRrslY9uTToZUlJeX9tefd
         Qgb5bDDQqrnOWDLaImFBidxx9QCWJWqjjv6g7IiOGcN3H49CP5IeTzYcQ3myZw0clrel
         RoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728509467; x=1729114267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKkXf1MKo7EZjcdPkMIGz0GJXU1jgvn9bPhthN3jriw=;
        b=HwAg7fpx89hnw/If5iJBt8Tj6zWZpe++BygWxn6ORrz3q+cWkq9jnIR96hZ43FRY9a
         gHrfpg48zSiMcD5KMEnbIIw87ZX3SQ3R9sXrb4PnAULk3IT1PJfyRx4YQvBrD1V4bDua
         bTLqzsUbvau4PRf6L85i9WxIKcloqJUJX50Dz3CXT3bfla1bHOFvcSKaiceXLl0kmttd
         KipGM8230QJu/VZZxHJPYB+FSal/xIoJvSulfeWgaYMv9ER3/tZ8q1fX8HeYZoi4VCF2
         se3cFIeA0xDfAgT/D5w1BiXWFCy2CqdI86N9+UUpGs07ZFPuN1F+F/fT+bHcnG9zLePp
         TKxw==
X-Gm-Message-State: AOJu0Yz1p1DJPJvn8qtYY31rjXCCPSnjbQ+Vny/9Os+JupVDOqELg2UU
	qw/qgI5ZxP5KAaUfiAqmhT4lAJ0GaoSe1GmV8PqTs8IV/Idu76HM1/7TbA==
X-Google-Smtp-Source: AGHT+IHzK6iaCXfoCpx96Uxyr3ACly8QiE0+OQo1e+4Fprfd+67zp6WVnLLoEkUCRZ6V43OGMn38KA==
X-Received: by 2002:a17:907:3f08:b0:a99:3d93:c8bc with SMTP id a640c23a62f3a-a998d124d5emr299285766b.13.1728509466321;
        Wed, 09 Oct 2024 14:31:06 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9954cd8395sm469885266b.30.2024.10.09.14.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 14:31:05 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/2] New recipe: python3-pytest-aiohttp 1.0.5
Date: Wed,  9 Oct 2024 21:30:46 +0000
Message-ID: <20241009213046.3065769-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 21:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112744

Based on https://pypi.org/project/pytest-aiohttp/
---
 .../python/python3-pytest-aiohttp_1.0.5.bb            | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb
new file mode 100644
index 000000000..977ce807f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.0.5.bb
@@ -0,0 +1,11 @@
+SUMMARY = "pytest plugin for aiohttp support"
+HOMEPAGE = "https://github.com/aio-libs/pytest-aiohttp"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c251ea89d32d196dddd14c669ed3d482"
+
+DEPENDS = "python3-setuptools-scm-native"
+SRC_URI[sha256sum] = "880262bc5951e934463b15e3af8bb298f11f7d4d3ebac970aab425aff10a780a"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "pytest-aiohttp"
-- 
2.43.0


