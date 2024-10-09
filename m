Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4FACEE340
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 18:21:23 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.24245.1728498080638376480
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 11:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RY1I8QX3;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fac6b3c220so1015051fa.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 11:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728498078; x=1729102878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHW12/DMicKcWzVEWh18XuZ3hiEM3Go+qVLdAEeTBiU=;
        b=RY1I8QX37EqIrjhjWfZiQn97NUKT0/9tfG7842yDUXeH+9eIhcRyU3mQzonw1U/Z4L
         mTHgFvi1h74N5Q8f5WQyMVSmp8DukvOqFaTQwsWOcZV4mivEq5EnKcqSw0ro7YlEcSPD
         6txBVKoUB4BwFR3o5rzh/QrTLHp+rHgu0vuBVF/ksMv69C4y539rHKBpjOpj28Mp0s2F
         XpSbtXTnMCXMFG8w1cMee7GISsPQiUoLXaDfeoe91iE1ZvxFapw+Euc1pN268h1sHj1M
         CWxV0Qj11Q9CHjUsCffpPLTsbWaT+l//pestk2j2FLD7rLcFqxlf8aX/y38k08vEsHEg
         iieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728498078; x=1729102878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHW12/DMicKcWzVEWh18XuZ3hiEM3Go+qVLdAEeTBiU=;
        b=nY6nx8npna2/0LzIXhfb3h+IeZVlq27FLqb4YsuhfTzkiy1g10gXvSDHleWZrrHYKC
         yqBzEiD0/XTvi5VNrB6yEgjI0NV73ElM3uI1lq36sXBmd52JW1xot6OnPMPfytiD7SQa
         Q2fY1VtMbMbwAkNQ+I05PTxCpFhYchoGe1l/bp45be3ULZeHQVzkChrCbBCL2wuwhCT+
         7gPraPV7MMVzI6hBmGbx58ekxhAjYcV9vbbtQ+9eCIIK8sBxwHTd9Qtrv8+/ygY5E7QW
         bwqLr6iw2MXV0NmvloWOAd2lCXFPjwy+I5SGDo+xj4eSu0CS+r6lqu9+gGmP6yaRDr0S
         j1Dw==
X-Gm-Message-State: AOJu0YxfipaYrshZPLwvnwzfLPihQpKZnGn7n8B0oiO8uBx0vDyhNkMs
	8C+t5neZ5Jh194e+1e2zYJbMNMr2JfhjqXYwq4Dq2VIBkhDfS2Vp48Vm4A==
X-Google-Smtp-Source: AGHT+IG8oMbzdbC3UvvY36eDN8WUfDzXhVNcUR/zM9SBwEc5XVtlL0oeqjpiDOACQoc8cQbaI+1duA==
X-Received: by 2002:a2e:5109:0:b0:2f7:4c9d:7a8c with SMTP id 38308e7fff4ca-2fb187ca5f7mr25317981fa.29.1728498078091;
        Wed, 09 Oct 2024 11:21:18 -0700 (PDT)
Received: from localhost.localdomain ([176.33.66.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9954cd8395sm446754466b.30.2024.10.09.11.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 11:21:17 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 2/7] python3-alembic: switch to PEP-517 build backend
Date: Wed,  9 Oct 2024 21:20:26 +0300
Message-Id: <20241009182031.242045-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241009182031.242045-1-alperyasinak1@gmail.com>
References: <20241009182031.242045-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112738

- The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.
- The PyPi package name (defaults to PN without the python3- prefix), so there is no need to set PYPI_PACKAGE as alembic, it is by default.

WARNING: python3-alembic-1.13.3-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
index 0e6dc6265..f046c3ebc 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
@@ -2,12 +2,10 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=00f8f5c8aab58c3e1cd61525a6675174"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "203503117415561e203aa14541740643a611f641517f0209fcae63e9fa09f1a2"
 
-PYPI_PACKAGE = "alembic"
-
 RDEPENDS:${PN} += "\
     python3-dateutil \
     python3-editor \
-- 
2.25.1


