Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1155E677E9
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 15:30:42 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82191.1766417433071386665
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 07:30:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C3vv3qVz;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7f651586be1so1869158b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 07:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766417432; x=1767022232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9huttlMDrpqHCTfcdQ3Q7YZgzB5apZ1QzJlAh+vFo0=;
        b=C3vv3qVzZsUgiX8lzQ/jncKKQEeer5D2Q74YCZ2o22Mae54FkoGD9vTRWfN8A7kSN/
         Zk1G4YXOPkTOjnkU2gQq00KR5X114hz7NpbVIo+I+l22xcGcEcFo+944cKWsBxdZXz+6
         pYat7OM++grG0vvibdL9cjl1LAO8GaIR1NuFTj421SrNJea1tHnhd4ZmZN6JMVcCLWde
         O4CPl9wCOKBy8B7M4QEl3jdqXAZWKI08mHM7GV5wpgZAfAJq8LMHq5nD9K/zqoA4aRke
         SXbc+Tt4LApWErHjLtz4GNyhupPCfkEM0wYJb2/q2O9oWP/DPVoyD3uHoCX3wItG3bQw
         iBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766417432; x=1767022232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9huttlMDrpqHCTfcdQ3Q7YZgzB5apZ1QzJlAh+vFo0=;
        b=nWtzTnBW1ZLlrc+P1YYiwW2HpxgA1P+22Z0cDv/dCse3Sip0FbbESoExCJ96cGn605
         Jb30C4sBwvQeIopz4JRhvSjisxYi7QOWn2WqF2GXThJ4jLejGskT2OC1Tyt+ujFI+P9e
         GgPmmgoiWQh81jQKWnoMfoHFqZ1h7ZBwhW6HMFgOU0xMnUfnzoqXdlDP/0pIE7x36isY
         INWsielSBzodmekpwVEzUsRg3LiStzN1AiUN2SS4hQzXxz1rDsmDm2iGiCWmsY9R1JgC
         3xP4uQtJVzrlSNq25bhy46tPO1M8XF0sNeSJKy/TENUEHYjfClxRClNAk4K4pyE4LN0G
         K+sw==
X-Gm-Message-State: AOJu0YwgZNUsRpgFeHkvYmvCOInIwwtHpoUVlzSgVGPnFY4mjhYvK4f+
	dHSp1e6gMtJXTOLKfpOBpOA4wOnC42JhgK2752aTTtElnIPsBwSXMfT/igB/NQJX
X-Gm-Gg: AY/fxX6HvwvnNVmIGLTYN99jSatcZE5agZwlHMZp8Ot6aAQ06GWrSzhFv+FbUGuZbhc
	JwXHjzOcqMnN301MfAoN/VkBLUjtHdIzrmLQcJbNbbrnWdZX6B15wyQZI4I4dW1pJx/qPwHa9Sm
	idEndI24aAbV+HC+73xU3nJggjT5glMD77atJC+2KsmSSI0FQdoF31+7Rh2Awtuo7c5mqKFLpDC
	xFJwdeTw2mHMpQMZ4Fu+a3zYgq5eHaY6EKljE5vKjk2SCjROgRfBh7m7v8XHulzl59peRbr4/v1
	tyV9OgvSKizZNv+XvpljWec5O/MwlWlPd5s9VJ4kR0Ar+Vu4O84F1ZgM7MCjBFdtdfnmqQDEm1w
	U34UmesT1AyarI6KtdLi6+k2IxX5z81lbFsq4NnL/buUl68cRnyAsU/lDjybYlzey5M0Hvd8kSp
	1rk1XSOkqhQ64I0OCC8o1cYU7OG/slL1doC/VlioUnkPKTtTKDoWTHxnuk5XOnFkD4uE5yQ47K6
	GZmUt3kYwiv6ZPF9+NcwvxCRPMsK1Yl
X-Google-Smtp-Source: AGHT+IHMqjHNujZP30jlI9cp94AN2ArYAGY9qUy97RmpinTBRSfWsj1ZIh/RIX0VPvofmOUNZyamzw==
X-Received: by 2002:a05:6a00:2886:b0:7e8:3fcb:bc4c with SMTP id d2e1a72fcca58-7ff551dcc82mr10727680b3a.33.1766417432071;
        Mon, 22 Dec 2025 07:30:32 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::8429])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm10768044b3a.50.2025.12.22.07.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:30:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-pytest-metadata: Upgrade to 3.1.1
Date: Mon, 22 Dec 2025 07:30:29 -0800
Message-ID: <20251222153029.106186-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 15:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122791

pytest-metadata version 2.0.2 has a bug where it tries to access
py.__version__, but the py library version 1.11.0
removed the __version__ attribute. This is a known incompatibility.

Switch to hatching build backend

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...metadata_2.0.2.bb => python3-pytest-metadata_3.1.1.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-metadata_2.0.2.bb => python3-pytest-metadata_3.1.1.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_3.1.1.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest-metadata_3.1.1.bb
index 9243f6646e..64589b31b6 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_3.1.1.bb
@@ -4,9 +4,13 @@ DEPENDS += "python3-setuptools-scm-native"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"

-SRC_URI[sha256sum] = "fcd2f416f15be295943527b3c8ba16a44ae5a7141939c90c3dc5ce9d167cf2a5"
+SRC_URI[sha256sum] = "d2a29b0355fbc03f168aa96d41ff88b1a3b44a3b02acbe491801c98a048017c8"

-inherit pypi python_poetry_core
+inherit pypi python_hatchling
+
+PYPI_PACKAGE = "pytest_metadata"
+
+DEPENDS += "python3-hatch-vcs-native"

 RDEPENDS:${PN} = " \
     python3-pytest \

