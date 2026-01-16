Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A009D4A60F
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 07:38:24 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1312.1768549096185335231
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 23:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/naQnou;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso11247445e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 23:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768549094; x=1769153894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZcR/9TMIE2iw5NdmIqe64csk75LDfOXnfcRgOU5TwA=;
        b=M/naQnouVQbR4OEdu9U0H3/mPH0fZbPhKjwxiHqfwjJy299cjTgHNwOm9cM012aGRZ
         Ygpphxn30zx8mHEutPsuCojcRkNrCRYBMJBRQC1mppvogTGtxO5UvQ9Wltd1OLPFtguB
         PnvhS2fYwlyoC+ducTiJnppUaUB2pteAENj/xfewFZ+uBRPjWh1Cl+0BaQNrVa8vwXII
         V1lq+rbAqzBxbfJeS6yeB5+WSy9lLwappXycCBwwyiUILSxOdOoMtO1AJUTRGQHbMkBB
         siF185hbHqOIRTdm+D3fqQzd64G08QJdG3deXRab4RnB0231CqnE0MOFUBo3dg1F4xwS
         8uQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768549094; x=1769153894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fZcR/9TMIE2iw5NdmIqe64csk75LDfOXnfcRgOU5TwA=;
        b=AuafdKXb2KRXHIT4/dUIufYpB5BbKLF7lumPgSQg36z6vF+faPga3um4co7nqR+UR1
         vi28BWlhHLqqjnvMte0s2T3/4/oLzijM2cHH0+GggDCTGQe+HiQqkRDJ+uPNLqDpQFVZ
         cY6OgfuGDlPUop1Egj2dy9LJj9u8EYGMd+Wg40POsu6EsXmyRWbR6zGcWTMchrUu+7dq
         q0RK9Ey+PthlsUECQ4MHMnPTpHXmP/owumTJ6dUY+O5fmRQ/Clh+idgbplxCuIpkG2An
         0Tk/n9NOHOUT4EnmFzWL0tFhZWZXqYVi2NdQsIYXG3273E9WzxNmC7SWkBDVeXlHmp+T
         JYeQ==
X-Gm-Message-State: AOJu0Yz1MDNxR3ZCQ48oXLdqxvckkiQIdZTYWK0gAlq4+B9djhGdFovh
	fCXqAYtfu2xhLsRIQIyd2a1kJlsCt8prLmsr17VXD7cmt9G71kY4nFqow+3oNg==
X-Gm-Gg: AY/fxX7QXXOiaULw+lFawanExPq+P0i6bDo3ERtVtGKBfeAQWIUG/h9iwbPRFksaKVt
	KX+x6O9UhV3k0yIG/2O0pZd/ZeNAr/1aQfNxC8Rxas24ckHOXR2vycjtLeONaLrw6/hbWGECxlb
	5GerOkX8jfvWx8Q2FEyvDAGRFTxZFmBuFnfb/mQz/PI1zKKGzkLjYAMLjy9Hhx2ZQCYLVXBnfvN
	07nW/QP96cs1In8CxDtxrw4pCHwU+ElylJtLRnLOiwIXhyO24QkJL3ffhi7yyaf7NQDENLhIfKR
	DcTPg1CNBWoq/m8Gjw0YHIVsspcCLDJGigQRCVXNEa4XXOf11qRL72Ebf4s2qYRiKIfsc/Sj4O5
	cp/QzH3xlfYIetWV0bAkg9kIaAVvcWpjG0vYnMVNIkIQavBvgKFxYh4eIaYz7d/AZ486CMscHvv
	lIWBlSZUsM
X-Received: by 2002:a05:600c:8b56:b0:477:79f8:daa8 with SMTP id 5b1f17b1804b1-4801e34307emr27207665e9.17.1768549094561;
        Thu, 15 Jan 2026 23:38:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm84992495e9.12.2026.01.15.23.38.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:38:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/6] python3-django: upgrade 4.2.26 -> 4.2.27
Date: Fri, 16 Jan 2026 08:38:06 +0100
Message-ID: <20260116073810.3290097-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116073810.3290097-1-skandigraun@gmail.com>
References: <20260116073810.3290097-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 07:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123522

Changelog:
- Fix CVE-2025-13372
- Fix CVE-2025-64460
- Fixed a regression in Django 4.2.26 where DisallowedRedirect was
  raised by HttpResponseRedirect and HttpResponsePermanentRedirect
  for URLs longer than 2048 characters. The limit is now 16384 characters

https://docs.djangoproject.com/en/6.0/releases/4.2.27/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-django_4.2.26.bb => python3-django_4.2.27.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.26.bb => python3-django_4.2.27.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.26.bb b/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-django_4.2.26.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.27.bb
index 7f0b1c9239..32fd235937 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.26.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
@@ -2,7 +2,7 @@ require python-django.inc
 #From 4.2.22 onwards setuptools configuration migrated to pyproject.toml
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9398e487bcb55e3f142cb56d19fbd9a83e15bb03a97edc31f408361ee76d9d7a"
+SRC_URI[sha256sum] = "b865fbe0f4a3d1ee36594c5efa42b20db3c8bbb10dff0736face1c6e4bda5b92"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -13,5 +13,5 @@ PYPI_PACKAGE = "django"
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.26" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.27" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"

