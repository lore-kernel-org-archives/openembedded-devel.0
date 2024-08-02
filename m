Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C67C52D71
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 15:30:44 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.95646.1722612643311913904
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Aug 2024 08:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oRo0MCl3;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5a20de39cfbso10636667a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1722612641; x=1723217441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtvCM/3D0DysEfP+YIco0N9XS/+SG7HvPFqWfjIXIDk=;
        b=oRo0MCl3Ln2awOSbob35TckU6J1AMprgoxtAc+zMWNIAZPJEtFNrtRIstRN/Beocei
         MsjuuU7afobB2cmHGHYUwv/yWgtkdkEtoT4MBwKEKb03HW/KA4uFOkKCrJcTV80Ksz2X
         YZInx1w1KIeuf0AkiQIlPv8V/dfJG5ArPHZnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722612641; x=1723217441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtvCM/3D0DysEfP+YIco0N9XS/+SG7HvPFqWfjIXIDk=;
        b=H9R5a27f7LQ73q4o6fOToZQBp6iPRZ8grU4OfGG+fC/x4PLuvZgV74oRAgW31n2LNP
         gnK2D8z7UiwGHYML1yauPq9M+QAI1qi37pZ7bqBhmQ3c/t0qDapP1jbuFuHFBrCl94Yu
         rH0vQUSIfljcnRih44Ua0+DTZ2NIZ8iNJHTRK/2bqabeSGgqbfGTadedtvy9bxckcvXi
         AtAgNJ0daDkb3kWiJ0eac4MzsEwQgdZwcdx4BguaYCDh2Xch9I3xUUW9Vhq78K+Q/dNJ
         X4ZFjT9/G08blFBcgTBpJfR8sAtZxiy3VhTehZGGtt7bEqK09INF+5VU/UfsBFAdsCX1
         HYYw==
X-Gm-Message-State: AOJu0Yxw9GXO8FDzoTOirGeNXvdlpQofj6YROT4RtApiCYlkSfGrJ7ql
	Bk7DU55yEH/thpvhVEFS5/s2TVGsHhbFC9lvkL1x3JbSgMxm8X5gRuvlSXVBm7p2hVJ08qVVcty
	L
X-Google-Smtp-Source: AGHT+IHOwe1r8M+k0VLkH9HIw5ehOHIY7u12BIiYK/K2ADJ8jPy8oyZL53cdsg37QUSoeaa7GvLHOw==
X-Received: by 2002:a05:6402:1642:b0:57d:10c7:aa4b with SMTP id 4fb4d7f45d1cf-5b7f54135b2mr2709214a12.30.1722612641112;
        Fri, 02 Aug 2024 08:30:41 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b839719fdesm1246863a12.8.2024.08.02.08.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:30:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pycares: switch to PEP-517 build backend
Date: Fri,  2 Aug 2024 18:30:34 +0300
Message-Id: <20240802153036.2649396-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802153036.2649396-1-leon.anavi@konsulko.com>
References: <20240802153036.2649396-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 15:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111499

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes:
WARNING: python3-pycares-4.4.0-r0 do_check_backend:
QA Issue: inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb b/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
index b6b0de880..13ccaf99f 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.4.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "f47579d508f2f56eddd16ce72045782ad3b1b3b678098699e2b6a1b307
 
 PYPI_PACKAGE = "pycares"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-cffi-native"
 
-- 
2.39.2


