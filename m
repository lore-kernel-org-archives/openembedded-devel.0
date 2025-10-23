Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A95CCD1AB
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 02:51:08 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.11511.1761187868041789007
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 19:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PczRuLHN;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-78125ed4052so419230b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 19:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761187867; x=1761792667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xg2hR9ovP29PsCuP1YhwLlOxwkKD7gBEFGTCnl7Sm1I=;
        b=PczRuLHNKLcTXD5L/v2RURSnGckYw2gM/t1P23nZ4gc6e3MY2dXbQ8t33iJwrgqYPN
         UmVhMQHDw9y7c68boPc9B9WMswFhjJSzoqFOu82B6cv7AeEaJHgyYTcbZyYVaOXt8ZQm
         7O1cOvxFS8GLb/ocSthw5Zjl4P97EElj2AUM8N0BDQAAblZIzI1M0diuRkctVdZOF9Xz
         02o1Y+sGDjweiPq+AWxpeWeM3MTX28SkcCDLjZJwpuSAa/B1QuFPDtBaxTuB/jMknb5m
         bVhFzMEh69tq8Ce3l1XkmO8rMbXV7Gyrx5PyoASLPpNKB8TF0AjQefNEp+zOVl+wjz64
         497w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761187867; x=1761792667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xg2hR9ovP29PsCuP1YhwLlOxwkKD7gBEFGTCnl7Sm1I=;
        b=cI2WOvT5x03R7WSXAVfOR3Fzkirz0JdbUxI2OxmZ0rIBh7DXiKJPCvkgHFZkGmKz6+
         2bSqo0mIjYWqYf6xeq/iUB9KY5EVutplCPzf1cXdG/kz0KWTZW+MImXt4B5PKnJGsEwN
         AJLF4TEp7qVjYExVV/5cVAPWiuiOSbkpi9tvlc5SXW8m1MCZ7wUeDa6J6UoiBvVCrxl9
         r0BRXye67YhRd6nRaJzr01NxFDVaEHcWnM5Q1PXiDJkW9ClvvKnSgx/Zh2i4bjSNRBxi
         cl2k78EsKlmxBBKBasq+N3WACeGb39hjpshsSZu5tP8VbYvCn13TnFlJrWfG385urbAL
         cP7g==
X-Gm-Message-State: AOJu0YyqzgEPcZgM851+izRU7oBuU+ljOqHJyRK+Y2hZCImmnuZDMg5W
	c5CX8kbMNZFSSQa+gaeyV34jvMGp4VW/mhagV2DO/1jUTKYo3rPSNW/EuWNVhztw
X-Gm-Gg: ASbGncuOki/DS5pt4zjwZKnF6Lrsg6A8reiS75MtAZSMvjOVL0RejgsNSmv6ITtA9an
	z6BV75UQnBkLW5K2CQ/f9XPcP2NnmghiKer+VUktJKutCyRHQTbIuNB+l0YzGZDiIvbKVLfFmJC
	UFeNAMM6DbmdAcceO2PcwXJKLUN+OQzocvGmlnbeDAA4BGGNTuEPgRvb0J6inVaPbVCcxE+Eg/a
	oVn/JFB+KgRWV0GoeDxV77gMSzwZ4BlL7q+k7Z1R9ZRJhbL2SNS7AsZSvw7C0RSYvwQe+nPPipf
	lqTXKs+YUZpG41MyaLQEX97rzifQ2K6bgBLecl5WutRjzbz3kAPSSEzRurLWPswpmxULtBfOt5Y
	zMVdKdQ384mDPk5jyqGCVGYcUrk31WeFg5j4SNAxCVA1X5SDO0i775rPerVDOfHH97CHxCUr3q5
	G4o/5ZCng9t+e3U+tp2kP1BKkJ0SLNZXa5pj0xfaYtSf5NzplxWWnjRq4npdmfBUBJjpQrNky5
X-Google-Smtp-Source: AGHT+IFsjvL7ZDsvYCukH2N1n0l8tdbhslWwJDua6vcFgmU4F40UN9LiQmHpPO9Xdal76E2dDHnXfg==
X-Received: by 2002:a05:6a20:914b:b0:2be:81e3:1124 with SMTP id adf61e73a8af0-334a8534446mr31799160637.2.1761187867092;
        Wed, 22 Oct 2025 19:51:07 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b6ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223e223esm4084328a91.7.2025.10.22.19.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 19:51:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-setuptools-git-versioning: Add recipe
Date: Wed, 22 Oct 2025 19:51:01 -0700
Message-ID: <20251023025102.3182631-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 02:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120911

Some packages e.g. python3-cytoolz are needing it now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...python3-setuptools-git-versioning_2.1.0.bb | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-setuptools-git-versioning_2.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_2.1.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_2.1.0.bb
new file mode 100644
index 0000000000..0da9d26dd3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_2.1.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Use git repo data for building a version number according PEP-440"
+HOMEPAGE = "https://setuptools-git-versioning.readthedocs.io"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=92e79e3a844e66731724600f3ac9c0d8"
+
+SRC_URI[sha256sum] = "6aef5b8bb1cfb953b6b343d27cbfc561d96cf2a2ee23c2e0dd3591042a059921"
+
+inherit pypi setuptools3
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[python-version-smaller-3-dot-11] = ",,,python3-tomli"
+
+RDEPENDS:${PN} += "python3-packaging python3-setuptools \
+                   python3-core python3-datetime python3-logging \
+				   python3-packaging python3-pprint python3-setuptools \
+				   python3-tomllib"
+
+PYPI_PACKAGE = "setuptools_git_versioning"
+
+BBCLASSEXTEND += "native"

