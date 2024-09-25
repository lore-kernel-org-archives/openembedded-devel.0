Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9466FCF9C6C
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:24:43 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.8983.1727245475550095757
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P5+U1wqi;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71b0d9535c0so217657b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 23:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727245475; x=1727850275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nd/icvXyTtknlL0kGOr9z5aNaz/Ql9tRajDeieeKkwY=;
        b=P5+U1wqizAkM9yQPQND+EnD2dXbWZG2vwA92mmfnkrA2VTpaC9FRO8QIQibm2S2bjY
         D97vIE5FfZTqYAVBPVVn+vgOFnYkxd8UpA5X8acqqBm55ggsC9/XZpksLT/KETlq2zMZ
         LFXTevTtrnSEpLdszKRK8EuJRzqX9Kz76ohDdONILSNP+5Q5mAdJC/khGRz+p9ezrJta
         X078r/kuE9PSB1iaf4nHF65bc3emDe0+39denj+sYOT4gzt6MFNmAFxwiErtXxOXYZ7p
         pixs83NaiXl+T5UiZGdCfD4/RXFChMS3h4v065j52qXbcnxKdasAEe5cL9PJnuRPnISO
         RxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727245475; x=1727850275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nd/icvXyTtknlL0kGOr9z5aNaz/Ql9tRajDeieeKkwY=;
        b=qWX5c4D10pOVrXQ4OSuVCislHBMhbcUKSi+ZTDUs4tenUMJ7nUe/iuEOu4uVr5f4Pu
         2Fb+8qWyQuhscaU4NyQVGEnLMMwtOB/wTTO+1vhzCu14dXAP2BRkJVpOFD+9Hp2F2uRi
         /oRELDhTTKGWEyP+68mVV5OvGSpskTkk+SQJRfAI9L2L18j1l+3IPfryLUHdhYq4NYZZ
         hOsdEXa+Uhj8dv2zd0nu/3B979PpUORLgGAVhroy2XRxpmwOPnQlAEdegFEW6VOqFNGo
         WibBasnV8k0wJ07jlbaGYd4pF64PtHNx7MH3HwbD0HdcCvz2ERu48rEpYkzgUOrTlZF4
         YDGQ==
X-Gm-Message-State: AOJu0YxkfArNMW0SFetLQsjTou+aKdsQuCDrK9pk5EJ+DFecl4d1LdXj
	1DjvuTt0ON2gzE5cqmDvGMeaYox9ap6kFRZQ7H9L9JbBFPC3nfQnf0YQo2F8
X-Google-Smtp-Source: AGHT+IF2QN41S878y+BTG/bmo800X+NwwXCw67hvQZQy3ghqqoetAnn6qr+vk2sJpXeXElCwYmDtKg==
X-Received: by 2002:a05:6a00:9a3:b0:713:f127:ad5c with SMTP id d2e1a72fcca58-71b0ac9d005mr2343173b3a.28.1727245474569;
        Tue, 24 Sep 2024 23:24:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f72b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c46f04sm2106309a12.38.2024.09.24.23.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 23:24:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 9/9] python3-trio: Add recipe
Date: Tue, 24 Sep 2024 23:24:22 -0700
Message-ID: <20240925062422.3146738-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240925062422.3146738-1-raj.khem@gmail.com>
References: <20240925062422.3146738-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Sep 2024 06:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112492

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-trio_0.26.2.bb  | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-trio_0.26.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-trio_0.26.2.bb b/meta-python/recipes-devtools/python/python3-trio_0.26.2.bb
new file mode 100644
index 0000000000..1272606f6e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-trio_0.26.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A friendly Python library for async concurrency and I/O"
+HOMEPAGE = "https://github.com/python-trio/trio"
+LICENSE = "Apache-2.0 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=447ea202d14d2aee40d8a2c26c865da9 \
+                    file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+                    file://LICENSE.MIT;md5=5f229c828e5a6f0a2ce90c7d3c054721"
+
+SRC_URI[sha256sum] = "0346c3852c15e5c7d40ea15972c4805689ef2cb8b5206f794c9c19450119f3a4"
+
+inherit pypi python_setuptools_build_meta
+
+PYPI_PACKAGE = "trio"
+RDEPENDS:${PN} = "python3-idna python3-sniffio"

