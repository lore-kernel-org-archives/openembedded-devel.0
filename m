Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83F7C7EE32
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 09:56:01 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.4560.1750931758146600906
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 02:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PvouY5Tp;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad572ba1347so133870466b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 02:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1750931756; x=1751536556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=syEaqIIdLM3E6MUkyIf66IaUnIyD+CmntBYB19ELvXs=;
        b=PvouY5TpXK11zihHtng/FryQopc/iO24Vo+oFOk+pNvQadKF3YIXsDaS6QaY6RV3iA
         URjmeuXG63JnC8tAbnXLca3dU1J62CSDVZXK1Sroh8djDVC6N5p3ZUGYqdWQ3c9N3tuv
         lox6WVOCwqcIsGUfq6ZG6pG4eHlCHNP2FKlGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931756; x=1751536556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syEaqIIdLM3E6MUkyIf66IaUnIyD+CmntBYB19ELvXs=;
        b=vYcP2NSUKJDRCy22DgH2YzXH/aOiy9r1rRK4KkjZGyQk5lWPnxKijqPVKrV9TbFYn3
         RK9amCGfqWvwU0t+6tFno2Kx5/iY44KlmU76RLLQ5HdRrpQXkFtnA3a+EhBwBSwT+YYQ
         qjoKz8oXj+YZXXC/zlzSzzxsonVnRTuV1hg+vJi507iESDZYsRYxhcdTdQ64oYHvH8zo
         zLFh4aHUdaJXD6DtBrxhZXEIqbyxr4mD5Tl0dMgtIGuU6I0IB9kzFe37uznjcZRq4tXf
         QecLC66eD9OWl/OWwMlU30zMrZdyybuJFpkI7hjBmKchmvXO8pM/nwQBr5j3NPyn8Jox
         sqkQ==
X-Gm-Message-State: AOJu0YyIHKx1fY6OD6aRWKQPf/pHv76dABngyG8Lc1+Nmlv6Pv4kWZpA
	8wYAISqruGURVutl3ujKdW4JhrTYBUn9O2byU9IHlEZOewNGGXV9SZHqeve5pq1Kl4JnToaUTyY
	MyVNG
X-Gm-Gg: ASbGncsHc0xW5iXpbTspSt44eV68kWKKNySAXf/H1plY9Y61NnXc4g1szdJRZEN1U2c
	hPECJbUNV9nP0KswOB8lhGr+oGhO5luXXBKmphibvXoZzetJAGKpdQ5PjAmAxjECy0xxIAIfsBS
	G35x+pYKgT63NPH+ECgRS9Zvw64VP4XVGpsOf5A3BfxZmr2XE+0ukhYrNZKJ2jpb+uepeOv0YFH
	5KgstHvP6Pk49vu0PNbwnQH3M/DNuYIjz1E4exx0fN0j6ahfDu8sVkPFn0Y3zfRyrb6HvqXTkyA
	oPCz6TxzQVg5zzZ1+ffWcfoUgc+tKgMw54d5D7eZ1eZIJY603enmR5DpWpb8rwnAlgdgEDcTP59
	Z
X-Google-Smtp-Source: AGHT+IEoB39PuTRlpRMKkmkaV8hLqWYis83gA/mwte50j+Q21zueq7yNg1ii5cyZ4VgLR59waBJykg==
X-Received: by 2002:a17:907:2d92:b0:ae0:ad5c:418b with SMTP id a640c23a62f3a-ae0bef3fef3mr659461766b.45.1750931755883;
        Thu, 26 Jun 2025 02:55:55 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0ab44620csm449628966b.163.2025.06.26.02.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 02:55:55 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-multidict: Upgrade 6.5.0 -> 6.5.1
Date: Thu, 26 Jun 2025 12:55:52 +0300
Message-Id: <20250626095553.585599-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 09:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118119

Upgrade to release 6.5.1:

- Fixed a bug in C implementation when multidict is resized and it
  has deleted slots.
- A pair of code formatters for Python and C have been configured
  in the pre-commit tool.
- Shorted fixture parametrization ids.
- The :file:reusable-cibuildwheel.yml workflow has been refactored
  to be more generic and :file:ci-cd.yml now holds all the
  configuration toggles

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-multidict_6.5.0.bb => python3-multidict_6.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.5.0.bb => python3-multidict_6.5.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.5.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.5.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-multidict_6.5.0.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.5.1.bb
index 6c30c55cff..2a21b39471 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.5.1.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PV .= "+git"
 
-SRCREV = "df5b5dbb6e3e262b9311755cf130c669e121eb81"
+SRCREV = "df0379fe7f27682359e3298a9ad1507f650cc690"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${UNPACKDIR}/python3-multidict-${PV}"
 
-- 
2.39.5


