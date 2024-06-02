Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16B8C27C44
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 12:52:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.57969.1717332722381009327
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Jun 2024 05:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AxB3XBWN;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-421392b8156so4038735e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Jun 2024 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717332720; x=1717937520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k5SVnfzTr2vxbL6rD20N9VovFKTsARFXEiFr/BNEtv8=;
        b=AxB3XBWNYOzueKZ08R4NVINn30YkZa0NN7bEBnIpEy9PZ6jlIWQFzt96FvX/9+yTEd
         xNcjKwCUGKtwI6keFVbsWQsVAF6OIc8E18w5v2sEIwqtDTmuSdmaJbuuAOj875mhXaGb
         d1G6PI9yL2vsNmfLHim2pTDtYHnfxfsNDrJVihqi32fP+dR/3w1qSNeaGKisIZqrOxJc
         z28fYeztXCrVUUEt8DWV1ZAiGDY0TC18QxpeR/gKI5e7lxi88OW14PH9/QN0L2h8zTLu
         BCXuw4fdHr7/Q5W04VkfYmlTKi+FCxJcJJn2jvOwt7wjAQNtDrZ7iT0G8Vj7o03cr8/t
         /Z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717332720; x=1717937520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5SVnfzTr2vxbL6rD20N9VovFKTsARFXEiFr/BNEtv8=;
        b=oHgpN0ZRAvwzImToDotYfVa+0L+tZa9bmJRNtveOxMn8Pj0QFn2SmlCb2UeJqeuc7S
         +jL7T+RoO82APswQeocZrDLQ7euPjnbYO673tHWjj1Jnz6kvK5nkalZUz9PKEHua+qg3
         TgfGa5TfGdmzyKIUFW7f2erkFxJfden6aZ/h1HB1zkQsSPpXeRuVhRwd1BwuZE0eTGWy
         oPkBWpUX8kOMg/JGqxVl9UYc3YmzpzrEoIGHbildt8MbBIqxM8kW/EVgKmvw7q3tC6jh
         U+A1UTgpSqAN4kytYaOd0sRC3Dy44KEImJqwHIcUqepimJxWtFJstHT/L1+WSO0z4IFz
         yOBQ==
X-Gm-Message-State: AOJu0YzY1ivH8eO4G39w4oDz1KMdbBpRfDMMxf1b1cPQgiW1HHOOLEPN
	sPN3wE1XEZ4bcQZVr7RvcCkpQE2aWbkUJv1jyi/nWw55roUYrDOWpGNzbg==
X-Google-Smtp-Source: AGHT+IFDxJ4TuBirSD5osgPXaGni2ROq0OlDG0GXKjP40LoZq2EeqvVg4uTc1mWIz7d9yihZNoV6jA==
X-Received: by 2002:a05:600c:1c20:b0:41c:ab7:fa0f with SMTP id 5b1f17b1804b1-4212e0b0915mr53438135e9.34.1717332720269;
        Sun, 02 Jun 2024 05:52:00 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be. [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212705692csm112463005e9.10.2024.06.02.05.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 05:51:59 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-trio: add new recipe
Date: Sun,  2 Jun 2024 14:49:57 +0200
Message-Id: <20240602124957.257126-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Jun 2024 12:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110662

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-trio_0.25.1.bb             | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-trio_0.25.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-trio_0.25.1.bb b/meta-python/recipes-devtools/python/python3-trio_0.25.1.bb
new file mode 100644
index 000000000..1ea844fb1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-trio_0.25.1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A friendly Python library for async concurrency and I/O"
+HOMEPAGE = "https://github.com/python-trio/trio"
+LICENSE = "Apache-2.0 & MIT"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+    file://LICENSE.MIT;md5=5f229c828e5a6f0a2ce90c7d3c054721 \
+"
+
+SRC_URI[sha256sum] = "9f5314f014ea3af489e77b001861c535005c3858d38ec46b6b071ebfa339d7fb"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "trio"
+
+RDEPENDS:${PN} = "\
+    python3-attrs \
+    python3-cffi \
+    python3-idna \
+    python3-sniffio \
+    python3-sortedcontainers \
+"
-- 
2.39.2


