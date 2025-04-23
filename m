Return-Path: <fleuryhugo7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A03C369D1
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 14:36:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.10369.1745418972142596677
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Apr 2025 07:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JAmvTXdB;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: fleuryhugo7@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso56507695e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745418970; x=1746023770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oCP4Cyz/tSnKI6hv9dfwz20Xa6KzqNIDLSzvSN7/LH0=;
        b=JAmvTXdBeN3IQhQSmXsS5sAVGvwn7kOC1aTBF62PK59pwhUXA2l8Hc09zdGKBAT2Y4
         cx1fGa9vaAsCihVVs0t/cLbSBx8GmOxDkCM5JUZJfLE+npg4cSBN9FqZylWNfpmZdruD
         oljxRp/A/bGIUJqQioVVr7mzCkVoktXwKBtM7fkjBvKKtYuf9n6904c0s+SrX2iQpb6j
         JbmOV9itWt4JFaM8iHhX7rR68b8evSMs3xTxKzSAhCKghrV5k/BY1DykmgnxVrJZ5Uzp
         r/9F1M3+3LGoB6buI/KLfN2m1ZRI1/3dkgn224j+5uV6q0A0i2A/KBW+sBQ27Wo74QFS
         Sd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745418970; x=1746023770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oCP4Cyz/tSnKI6hv9dfwz20Xa6KzqNIDLSzvSN7/LH0=;
        b=DM9egE2ES0GshqgDZvC8rvTfp7JrPd7grEO7sMTkJMVsj3h/TS6xgK1KtVyQgUP+g0
         JBYF6AllE8axZalbbdqoRVeluFnkvnwnWeiHUrHReDFA6aAvFQ4sEHrbILLTejB1Q6Sf
         42F4lVjJKwfQCaPvOa1gDxeW/+jiEI4H3gXbGgS2IvLEZiODuPcRtqEAno9BTwprQGWW
         BLvAPwBgvs0t8yruuTVkjYIsIvtTXdI+bsJE1XdIyZSKk3fb48Hqp8cQvt9onNMkgNW9
         8R7Yui9vDVVpHTDsPnCkJSgJLS5EFfrv1x6cjrxIFjyLIchoJFLgf+8PgYHSehYBWLgI
         NW8A==
X-Gm-Message-State: AOJu0YxMJJBKp2ka+SGO6hLcIJNS0WopGZ9wExUxTViLKgFD0CYGMasT
	VtoHSkYbVLa6FPVI0O5fHqfbdqBiG72I8oiUxDHgG8L7J4KmAW0CRGtDR4em
X-Gm-Gg: ASbGncsh0PEPVJWKy8RxeJ01VYNdtZRDhwdcjq0r4NXZ5DHjmfoo7PzpKRAAR0Hojm6
	D7AV/dCQWzjVdGaoEmOHQ1ORv9s+fp6fBUQYLUP9X5zfKjWktfXR9zlqnHKsUgrJYTPrCz4JGXr
	n9Dmlhs5toQmzKzdEmPRMHB/Y2BXbBOfqDczubwQCnYn10gzZCxOnABeOGdBLaTJJ2Sag2N3PuX
	T9KChlfLy8KM6l8P2wDzyhBvei5loel1t7pZLhFLhBQ6HPNmiPze8ByQSMcvX1QEQbBkU8BFXiV
	bQnbHQlPuoWZwFAWv6yH+cFvX3W1ORaq2NTjpugrjmA=
X-Google-Smtp-Source: AGHT+IGpNFt5l+ow1WSIP8s1pP8kthXJ71VS5O6b5/UZ5sEyyKf32wdZsXJCKwzbCoPld7N/mv6jdg==
X-Received: by 2002:a5d:5985:0:b0:39c:e28:5f0d with SMTP id ffacd0b85a97d-39efba5b065mr15966440f8f.25.1745418970081;
        Wed, 23 Apr 2025 07:36:10 -0700 (PDT)
Received: from ixpehess.. ([2a01:e0a:c13:c5e0:56fc:ca67:b1be:cc71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d233c2sm27820455e9.14.2025.04.23.07.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 07:36:09 -0700 (PDT)
From: Hugo FLEURY <fleuryhugo7@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Hugo FLEURY <fleuryhugo7@gmail.com>
Subject: [meta-python][PATCH] python3-fastapi: add FastAPI (0.115.2)
Date: Wed, 23 Apr 2025 16:36:06 +0200
Message-ID: <20250423143607.453363-1-fleuryhugo7@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Apr 2025 14:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117080

FastAPI is a modern, high-performance web framework for building APIs with Python 3.7+ based on standard Python type hints.

This adds the FastAPI recipe to meta-python, along with its dependencies.

Signed-off-by: Hugo FLEURY <fleuryhugo7@gmail.com>
---
 .../python/python3-fastapi_0.115.12.bb        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fastapi_0.115.12.bb

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.115.12.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.115.12.bb
new file mode 100644
index 0000000000..e03aa08c5d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.115.12.bb
@@ -0,0 +1,23 @@
+SUMMARY = "FastAPI - high performance API framework"
+HOMEPAGE = "https://fastapi.tiangolo.com/"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
+
+SRC_URI[sha256sum] = "1e2c2a2646905f9e83d32f04a3f86aff4a286669c6c950ca95b5fd68c2602681"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " \
+    ${PYTHON_PN}-pdm-native \
+    ${PYTHON_PN}-pdm-backend-native \
+"
+
+RDEPENDS:${PN} += " \
+    ${PYTHON_PN}-pydantic \
+    ${PYTHON_PN}-pydantic-core \
+    ${PYTHON_PN}-starlette \
+    ${PYTHON_PN}-typing-extensions \
+"
+
+PYPI_PACKAGE = "fastapi"
-- 
2.43.0


