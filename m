Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF79EDF17B
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 15:42:44 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74626.1770997354939897918
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 07:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GaCYQK6j;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43767807da6so663395f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 07:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770997353; x=1771602153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKWgP3zigrUFy5PZXdn4TiZsyx5tromN75RyQ8ifs+4=;
        b=GaCYQK6joGNvBysnu01Wvt48l2U7BW87W7s5BX/aePtgTnaBZHUMOynOJPQNTD+TTM
         bnQr3y9e64VQYDT4CmNieM9G2+Ge/LZED/HAJPJuqBEYqeLpmiYs48j9TsdvmosyPr8V
         9vJlglukY+gMtPLUzakR8T1qOMrTAa55y2/bzv8V5hQEjn5TzhXDcf63iCT8y8kwgxu4
         GVDn9jbIcymhXWIXARuvmxHPenDQi02D0m1uW/fOqONc30NExqvE+ouK+/pL/nzY46g7
         JTiK/FeKtH7qvypdtz0YnB45vHIS6zakVMcthbA+BytDtXsVtGkT4nk0fnM2XLiegLe/
         izaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770997353; x=1771602153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uKWgP3zigrUFy5PZXdn4TiZsyx5tromN75RyQ8ifs+4=;
        b=M2pebJTlaQEjxtluZFLyri7kA3bhvGl/UINfbNKAkKU8g1oak/Rfcw9uSTY2ez7P6Q
         L7/40/M02C+RP0r0Sqozq4r01/6nKVWnOkNkOXCIy2nK+O0QJrA/zofG6otUD++XjoHj
         zZgRThS+z7/n0XxDfDs7OqWm+arkrKg/Culeix5cPsXr/bej3HW2gHl+ncuhtThIpc+C
         MsyZWtpJ7ur+JsKXeUf8wiAtaBnB4gBoDYaTgrp+KDcedtsPN/lbO8RO7cutOuCQCFhO
         /dgP8s+2rhbFsnfm3eQREw/J/qXUuinoHsltG3P1w9r78u2cB1cjNouPcGTJb8vKivMh
         REfQ==
X-Gm-Message-State: AOJu0Yx7KmaXxC58hxf6h2SZgyEBBXXPENlNScdCKwMKBi212RHU0rc9
	xOoJx+vAHXk/QZ0scwuiJW9Q6FFeJsYVY1WXYExM9Heh7KUl/Wf7ybriLoJLHA==
X-Gm-Gg: AZuq6aIGEDXYWMx4fBVCoJHjRWK8NdxDLYRYZNE18+O4uYi9Jm4Cd8bkdgkcEbchIK5
	P4zhCno4Pqn6g3wQkUe132dtpWilzUxnUOzdRUwPeenXbGmjFp9sb4SBCpAgy0EJhGKneOqAzbO
	CxemAomzinw9RaZDEj0Tt/toBu9x5PJBMS6tUko2YNgpvyXfQu29sjMj6xN6xtk6SNH1BmTaEw/
	5vrABeiBFsdhwEAFdum8kKwuzP7OUF4iHly9VLcUcwplYKvNYZh0a5C3g4ciYCQtGuGW+IkaSN8
	sxRbIM/F7IJ4UoRssIuE8PggbfE7TPR63h6aRpt7JX0OCv8LDq8FfUBL/5HvnU+LjXru85I3dVq
	Hi0cVvXtACoYcjDw4st1/znUUzY0NaH0Nb6RMaXJMmV2XPWFVtK+7BxQNnNtPWZnwdMlcZzz5yR
	uzIS2UdmJ3N7IIRMmLoRTL
X-Received: by 2002:a05:6000:188e:b0:437:73a2:2d4c with SMTP id ffacd0b85a97d-437978c08ddmr4762800f8f.13.1770997353023;
        Fri, 13 Feb 2026 07:42:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1b4sm5807957f8f.14.2026.02.13.07.42.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 07:42:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 4/5] python3-django: upgrade 4.2.27 -> 4.2.28
Date: Fri, 13 Feb 2026 16:42:28 +0100
Message-ID: <20260213154229.1329476-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213154229.1329476-1-skandigraun@gmail.com>
References: <20260213154229.1329476-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 15:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124393

Contains fixes for CVE-2025-13473, CVE-2025-14550, CVE-2026-1207,
CVE-2026-1285, CVE-2026-1287 and CVE-2026-1312

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-add-back-setuptools-support.patch                      | 0
 .../{python3-django_4.2.27.bb => python3-django_4.2.28.bb}      | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django-4.2.27 => python3-django-4.2.28}/0001-add-back-setuptools-support.patch (100%)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.27.bb => python3-django_4.2.28.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.27/0001-add-back-setuptools-support.patch b/meta-python/recipes-devtools/python/python3-django-4.2.28/0001-add-back-setuptools-support.patch
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-django-4.2.27/0001-add-back-setuptools-support.patch
rename to meta-python/recipes-devtools/python/python3-django-4.2.28/0001-add-back-setuptools-support.patch
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.27.bb b/meta-python/recipes-devtools/python/python3-django_4.2.28.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-django_4.2.27.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.28.bb
index fba21cd75f..5357d12338 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.28.bb
@@ -3,7 +3,7 @@ require python-django.inc
 inherit pypi setuptools3
 
 SRC_URI += "file://0001-add-back-setuptools-support.patch"
-SRC_URI[sha256sum] = "b865fbe0f4a3d1ee36594c5efa42b20db3c8bbb10dff0736face1c6e4bda5b92"
+SRC_URI[sha256sum] = "a4b9cd881991add394cafa8bb3b11ad1742d1e1470ba99c3ef53dc540316ccfe"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \

