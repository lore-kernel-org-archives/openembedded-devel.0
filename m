Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24630C531F9
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 11:45:49 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9503.1785239146956487871
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 04:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YIOVT2Wi;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so27834785e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 04:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785239145; x=1785843945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpNx1ZgDaG7JQQnRjEEN0yZnicGZf505EEZ5XmwXJmM=;
        b=YIOVT2Wi9VZz9S5n7s3VgJGaxjh51wM6ThP8TMa6FNgoNTQkNDPnaik5isE81gg5hv
         /feGf54dCP4AqIFjyPl25vhQVTLpO0inOHjWLCiRdEwdiagfziXBzvmcWnXcMx964TYR
         Pxk1GXIENoe+leDNC28043Q3R7cpWCD8g/8GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785239145; x=1785843945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XpNx1ZgDaG7JQQnRjEEN0yZnicGZf505EEZ5XmwXJmM=;
        b=nrfJSt+Sj2ePRGnM+nxcp5XEma8EwDy5rVrd4SzKhbPO8qbP+XaoLuh7mrsVKnw9po
         yLqTDNdRo3WP3kblPj8Mnp3lvPzdtTn3gGTyHfOawIWpmU8yq+oNkz8smyD1/fRVY/XR
         PGu51h2mc9u1K7ta/ZXjAdZGp2159JpSCx8N5lZ/tg5M3XhEWaFMQYn529NudHCmH1iy
         zUTbVKzZz/q5E2vhW0H/BajgceJVMKo8mLkM4btSTkvAtxaViOm6XcO5rXih0gy+bWzW
         g0zos5vCO143aQriS2I8v1BIj2X7AImoYYcaqyFua0b93HWik3a+saBvi1L8Eaz1Nt0X
         HdkA==
X-Gm-Message-State: AOJu0YwBimwchN6sk2PNywrwMMJdpLVcv9b9uU7FF3MYnnB1lxy3zvbZ
	EqOrtPoHRjIcxQyTR5DOLfNc5sJOUAEK3MRMttnasKg3ccdfBN+WszQBRRh+IodjsX5oI4yxjsh
	NGpv2
X-Gm-Gg: AR+sD11ICPVCFyZI9v8PMhfVFTFHUDft/JTWJZn2BrJYbJyI2c366LLpl63V590PVwc
	vJCxJ2CUMbRQU3viPlcBM3T3wdkNSFA0yVl0dLmB7eS8sHGyKAetg3LzCoV02pQ0YoNoHTyZZ/V
	aJ1R6+VE0sSU8GhsBBLATFPb4CpX3A5ykZqWOkmU0Q4d/qKgi07mtUuXJwc5ebZuNGqe00ltw/0
	4ef4pm9uPKDordBEJPlZ+MWGWutndRmx69XkDOhlqfjlKdoXDe3gsHiQ94PZZtFWrfTDKx6yRvr
	AMnmeqbvMAIq2h3Amu3BBtXJoZNPowTf4FHrsm0gGkzYUJdEEycHFzjpqasWSmHQCnb0cWGWJ3C
	bYUcXUGVVXg1sigF2+3n8sY2Ca7XObU/rr4HSitHKrqzzjTHZHB/itC4E5RsVjKP9eqUMoo0AaA
	/zYZ89V5sBxVwzNeSFZZq8le7s1VA1MYFOXvwl8kiyTCDTzIiijpIZcfDmOPsSGco6uS5N6f8YK
	/7FH+an0Yucew4GDSMiMUsJhHHKKl0aVWLf+EiKQg==
X-Received: by 2002:a05:600c:3b2a:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-496c642d67bmr20348155e9.13.1785239144999;
        Tue, 28 Jul 2026 04:45:44 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f96b9abc0sm37021654f8f.32.2026.07.28.04.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:45:44 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pytest-examples: Add recipe
Date: Tue, 28 Jul 2026 14:45:30 +0300
Message-ID: <20260728114533.1775490-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728114533.1775490-1-leon.anavi@konsulko.com>
References: <20260728114533.1775490-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 11:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128508

Add a recipe for pytest-examples, Pytest plugin for testing examples
in docstrings and markdown files. Release v0.0.18:

- Adapts tests to pytest 8.3.4
- Increases triple quote search

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pytest-examples_0.0.18.bb  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-examples_0.0.18.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-examples_0.0.18.bb b/meta-python/recipes-devtools/python/python3-pytest-examples_0.0.18.bb
new file mode 100644
index 0000000000..a4fd03cf56
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-examples_0.0.18.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Pytest plugin for testing examples in docstrings and markdown files."
+DESCRIPTION = "Pytest plugin for testing examples in docstrings and markdown files."
+HOMEPAGE = "https://github.com/pydantic/pytest-examples"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4914bbb433a7975b6b5c5f1bb48bb9d0"
+
+RDEPENDS:${PN} += "\
+    python3-pytest \
+    python3-core \
+    python3-crypt \
+    python3-io \
+    python3-black \
+    python3-ruff \
+"
+
+inherit pypi python_hatchling
+
+PYPI_PACKAGE = "pytest_examples"
+
+SRC_URI[sha256sum] = "9a464f007f805b113677a15e2f8942ebb92d7d3eb5312e9a405d018478ec9801"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


