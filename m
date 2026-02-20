Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF1AC5B55D
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 20:19:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6542.1771618783996101799
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Feb 2026 12:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NWjNPyJy;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483487335c2so23196375e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 12:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771618782; x=1772223582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D2cgXxxjpfle+aw3swVdu42dEYSyVa3EBM/B3Is1488=;
        b=NWjNPyJy0zA51WbojwOyB7Ou51ljWS76umfsCKt2EBM597Dkd1UNN0b2nOuTR5mFIq
         d2DPmtWGs0izmQhh6++iSZ7BvLJIvwQjmuBj/hxDqh/Y1wKwhcwq2FN5E7lVfSuizq0j
         CRmQBbP+BLxppk3eNEr6tQ9wL/nIK8klY19Q8KUGuTGPypEDYAybWEFMhnjXx/rREAez
         c4CNIindo9AIQ3eFd564I85h2YOR2sIlfchCeLBUX6owSYEDII08FbWEeBxuuUrzZ6bu
         ywmcjei4nvmaNcetVtdJ3bj6HnJOtpCi2f/gWu6VDALi41MSykKjRfY/42CGjRgIxIrF
         T6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771618782; x=1772223582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2cgXxxjpfle+aw3swVdu42dEYSyVa3EBM/B3Is1488=;
        b=Ld5d2SRnuos4/M1CXwD8TSDZnQY1NhqdNk2ES8b8/8wzkpPQ9+bTxHD3aRLbbKnovf
         UjwMH04QQjuHEkbYayHMCiSRFKoZtgjKT7bJIBjQDINbXFYTYU0hIlq3uhx/VVsYsVMb
         NAUCEjD1b8PP4xh+v5f91WDg/gkFyq+21hwu2VVg4Tm32ASAFvUCmwTCajib7Dk6afdd
         4GJ57yYGo+sHM4xq5eYM+l1KWE4KlZFWh1EX5SnGjd/OBRb6DIVGZx6jIzqdVHncMyPC
         6NoiKuRoj3ZOLY4S3xhYGh9+WK8PdB4A7eBnw5BQYa2lZvYzADM89JCZFYlc+bbbjWQ2
         L97A==
X-Gm-Message-State: AOJu0YxjLxiZduV6NoXfhau7NrJF3N1hblivmbARgeboj7xmiEvsjPjT
	kqPwq+uAodUyoTxylCnH1o0ze6uu+UJcqWGdsqYVBo2/IwFshQbF7dMePNMm9A==
X-Gm-Gg: AZuq6aJZBOXFoa3B81M8TxNTZ08GD96S1/syO7qnz+pRnNtgPJWUY4YgfwgJrHC2FnU
	oblLmBLRJ7asgFwA0lzAOOXCzI7uNaO/q79qJYutrrD9NWBt+rSyOUVV/JeVGY8KOYtp4vYLc9S
	4F8Hmd9m1G+Lf1sYpLPSyY34LENmDcYPEjo3VZ+x4WXqRou9pnzaeH6AD++JSsOa8UiOQwgFYir
	B0ZOfY7IzGw2LiyWNrJPt0zj6COdHfAquTUxoJLQWmKNLiifsMO6FOCO17h+HLMYAViY2O76q7A
	TTV4bKv0m5z1xHumnL3pcdkv0UD+EilZa7j6jo8HhrgonZrQ4yctF5QJaF+sWjRMjNDeM2rHYrx
	W9R/C29/9JgEu3nch4jmd1LuuYdFpKtcbPo3TlEWkJFsn5kEl/SlBxYSozaZVXG3h33BFYovV2j
	ugwwHy/WWxMCNg8NNdbrTZfB8IC2KbgZE=
X-Received: by 2002:a05:600c:8b2c:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-483a95e24ebmr14743735e9.16.1771618782079;
        Fri, 20 Feb 2026 12:19:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b75e63sm11818425e9.6.2026.02.20.12.19.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 12:19:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] hplip: set CVE_PRODUCT
Date: Fri, 20 Feb 2026 21:19:40 +0100
Message-ID: <20260220201940.1720185-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 20:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124526

This recipe gets CVEs with two CPEs: hplip and linux_imaging_and_printing.

Set the CVE_PRODUCT accordingly.

See CVE db query:

sqlite> select * from PRODUCTs where PRODUCT in ('hplip', 'linux_imaging_and_printing');
CVE-2009-0122|hp|hplip|2.7.7|=||
CVE-2009-0122|hp|hplip|2.8.2|=||
CVE-2015-0839|hp|linux_imaging_and_printing|||3.17.7|<=
CVE-2025-43023|hp|linux_imaging_and_printing|||3.25.2|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/hplip/hplip_3.22.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
index ffc18d90c6..2b53d19f9f 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
@@ -20,6 +20,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-upstream-CFLAGS-override.patch"
 SRC_URI[sha256sum] = "533c3f2f6b53e4163ded4fd81d1f11ae6162a0f6451bd5e62a8382d0c1366624"
 
+CVE_PRODUCT = "hplip linux_imaging_and_printing"
+
 UPSTREAM_CHECK_URI = "https://sourceforge.net/p/hplip/activity"
 
 DEPENDS += "cups python3 libusb1 python3-setuptools-native"

