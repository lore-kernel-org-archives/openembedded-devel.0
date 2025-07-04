Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693D4C83030
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 05:38:25 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.6250.1751607499483673119
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 22:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nnSE/hJZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-74b52bf417cso476260b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 22:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751607499; x=1752212299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGnl2d3p4/P+XFH5JxmDvJ2h4V5wmZFlIgEIvqJu1Hc=;
        b=nnSE/hJZPOLaZUusKMTpdJ/xeq826C2YSWbnpkwLxDRIDaLd5witq2mghTK9Pncmxm
         OezntnLatbeHOkh6ZqbsH4gxVA59/1utYdgeFJcdgjyTFcckAKA+9ADi/2eAn5BN5kaS
         h35JTsFATgnCSUe6H7SC+ZdsDiSDS2pix0recP3PUhr570GzLbK/RqoUI0qdPMTrIBez
         6Pe3cbVYaRlJbDnfOp939cFJ0pZtxmXZNfCsvTNcUOJtF6IXi28nJkmZBnUxP7hbGw7Y
         UFZfqQS3DQ84NPQ/bntNp5POxtA8Hhm9N+A9BELN5YvSXifh3mJANv3FU9xtc1qpujGF
         ka9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751607499; x=1752212299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGnl2d3p4/P+XFH5JxmDvJ2h4V5wmZFlIgEIvqJu1Hc=;
        b=jUkpDqA1RHDZyVlbG2HQgJRpjcg61QZq6mnz/cwrXCFAtYijvM/iKlO7PgDS3dwfzD
         elBdOKkYqrby/onjo9PmU/JhsH5W0pJkvQPiS8BvQ1kgZWR4mYRDeSpCS0PJS8djCQ/V
         ITw3eVfd8m+H+d9OdaQ/YahsOySpGNV6UObQDSJMJ/8NvT5l8jL+HyLwh7U2V2LeT0Fc
         Jat1KtK0NW36hPrfZEW5p9CZvVB60ilzQOrg+8HIu6uN3zwcDpc5IPuyr/gCf3ORVCtM
         Jqa8tb9T9iBp/M4Vj5IcNYFUQR+bym7AQ4wljVV2XQmRT9c0sCVb5JGc/OPoZBBmgsWL
         YIEA==
X-Gm-Message-State: AOJu0YywXDC/VIzipplM60HZBZ+J2WYylV4nBqv+guqE92CgK59cy88w
	aDDsff8xgMIOf2ggITEB6IWMCrkjFWiPXBLWBv+JA9LNn1I0RuYnjOQg+lcJPJkp
X-Gm-Gg: ASbGncsIrat776zPPB8IBbbMEiuNFPbHjRQLJxSiokRauRM4/pgFOS87fk2sUl0YJsy
	XwdbtUhtZE3evqzqOXmHKIBbkT+BkpZLQ4PW1g5sCTYHmXESzrel+yM4WuBL7QK18+ON8LTas9I
	fyiyylWOOnRLHHiaagsTOlgcEnl3rq4aol8M8218lnMB9IwjsI4wvuFH4hR76VkBDvFjVA59HG9
	rX0DwgrVLa6HqtX3JZhhCfp8X8Ok4bik+2SDxvD3VwVEVj/OyefS4DpJSibhvRtgVHVkJecFAya
	qTcQ0u75nRbSQ8vuPdcklkoDzIpJlhITaCFMmnL8Y04pIButX95VUg==
X-Google-Smtp-Source: AGHT+IF2lGzD7AheUCZdArlmvq0vLc0s3FHk/kBGOxKP//lo5AGUEKYil9Su6PLzYlZfxRIFU01FqQ==
X-Received: by 2002:a05:6a20:e613:b0:1f5:9208:3ad6 with SMTP id adf61e73a8af0-225ba1569cdmr2764241637.41.1751607498406;
        Thu, 03 Jul 2025 22:38:18 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::857e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee7407f2sm1129589a12.70.2025.07.03.22.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 22:38:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pstack: Disable build on riscv
Date: Thu,  3 Jul 2025 22:38:15 -0700
Message-ID: <20250704053815.16701-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Jul 2025 05:38:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118231

It is not yet ported to riscv architecture

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/pstack/pstack.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/pstack/pstack.inc b/meta-oe/recipes-devtools/pstack/pstack.inc
index 1c85b12061..ef5ba03e59 100644
--- a/meta-oe/recipes-devtools/pstack/pstack.inc
+++ b/meta-oe/recipes-devtools/pstack/pstack.inc
@@ -39,3 +39,6 @@ PACKAGES += "${PN}-dev"
 FILES:${PN}-dev += "${base_libdir}/*.so"
 
 TOOLCHAIN = "gcc"
+
+COMPATIBLE_HOST:riscv64 = "null"
+COMPATIBLE_HOST:riscv32 = "null"

