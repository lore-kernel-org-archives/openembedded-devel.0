Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645F5EE021C
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 15:49:13 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66630.1767109752500257031
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 07:49:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IF/ZF2ZU;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso81615535e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 07:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767109751; x=1767714551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcaCn56g9yncpAhR3k+RNu4CIxGoHf1nKUA9ILtFW3c=;
        b=IF/ZF2ZU/jRASremNUGfzJGiEY/xWv/ifS8P9ShKtzEUpWE4zVHCqB5YRjm0k2Vz0J
         7vnl5Ku9bSHSerqY4DHdA8StvIwsesk9PcT4kYHWrLFzwNB2/QUZRVV70uxEYh7Y8SW/
         eriZfuDJ8Iv+aI8zN++hp/vp25Yt6HkyeBOjggzy6dE18AFs15Gm/Yg1YpAVoxllnuDt
         Qao8FbYCmSxQYJ6yuJvvqh9wu/d/b/aedTj/QU0swU6ebyRtfAMY7aFvuc7OYxnbSmiw
         4r6zWLn3WMdzJtbuhWAa83lBKFWVCsknF32CtDy91srPVa7QxL2Xf7v2LSVYIYstYn3b
         uQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767109751; x=1767714551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QcaCn56g9yncpAhR3k+RNu4CIxGoHf1nKUA9ILtFW3c=;
        b=ncGpUjK/BooDHKkB38Z0llfRXDbzvpDEXPraWwjPk4YjnRfY7rjHCQLWXv05SiaXfL
         +fiT+515DP0Sv5Lx6v0LyA66uV2B80Ae++UND57vkjbk7Yh/zYo80JHlYee9q0+y5cmE
         6Tbu8MSxEtO1hv1RELdvnZrk6qRLmtcqkdunAvI6rbTeVJ6xhuRPGse6GwIk+traXstC
         WblOnqVz74/BR7Nb5kZxLGOUzFEYlbq6GfJ4BsX1+VonUs8OWaRY9KIAkRy50ICvsBly
         NYyJMdK/S9beCXZMlRab8LUft2roSCXtwZAnbNeVYiOR8IaVSF7albmPUaAPHvcV9hI3
         J8mg==
X-Gm-Message-State: AOJu0YxWMAZw85NpE3MsAkxZDyG57YrUq5sEolm+/Zd+ZEPPzZzSLio+
	55qMgNUczWtUxRunNtYfkLFeDYZ2PnWTNhZToTT5t4OrWoe/+81d4jRTUynrQQ==
X-Gm-Gg: AY/fxX7W43JukpqRdVcT8ofHQuH4tUR9pkts8Y9i6ZgCc1w3WfKDVDuQWKEqfoN/L9c
	+4W7TvhC92NYKPFomT+7zrFQ2UwcbLjp2ty4naKLPinRGXC06DZQv/g9mbb8j4aFz+RvNg/DjN2
	wkLcRCHj0raxqzeJtXrwk8dkK5kCQHU+uzqBTUBOzSt7lTgOWUJIzA01niBnoP0Q9rMWbLyvKPN
	AVehz1sDcek8/OgHIoVOsBKG+Xvsjj5eHnBU8QqwEqkRJhl8NMhQFB9lyHsDneQk+Zv6KFHvJ60
	MiTtEcsuTCJQ0+pgC5JeDeqt9+5yR9/UmqMaU+UM4dZ74yqQzj75Fgqh517XDuMeOgjbkViNuEp
	GK1dgmSQLNPGacHtP5KrzqrW3hEDXrlvrXxw61X09IlfF/tkbH2OfE9gg8D4u9JcPcNsAH5CZvA
	8cbG+uOQPb
X-Google-Smtp-Source: AGHT+IEoXvIvv5hxxcY/l3MC+PwozehBSXS3YeZOfKVzvd0DfjnGHiGX0Pj6weN18mXIdcM2TKxzDw==
X-Received: by 2002:a05:600c:1991:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-47d195aa354mr435756715e9.32.1767109750831;
        Tue, 30 Dec 2025 07:49:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a210e7sm253051225e9.3.2025.12.30.07.49.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:49:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 09/10] python3-webargs: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 16:49:02 +0100
Message-ID: <20251230154903.736590-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230154903.736590-1-skandigraun@gmail.com>
References: <20251230154903.736590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 15:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123035

The relevant CVEs for this recipe are tracked using webargs_project:webargs
CPE, which makes the default python:webargs CPE to miss CVEs.

See CVE db query:
sqlite> select * from products where product like '%webargs%';
CVE-2019-9710|webargs_project|webargs|||5.1.3|<
CVE-2020-7965|webargs_project|webargs|5.0.0|>=|5.5.2|<=

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-webargs_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-webargs_8.7.1.bb b/meta-python/recipes-devtools/python/python3-webargs_8.7.1.bb
index 307d2436c2..606796e287 100644
--- a/meta-python/recipes-devtools/python/python3-webargs_8.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-webargs_8.7.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=27586b20700d7544c06933afe56f7df4"
 
 inherit pypi python_flit_core
 
+CVE_PRODUCT = "webargs"
 SRC_URI[sha256sum] = "799bf9039c76c23fd8dc1951107a75a9e561203c15d6ae8f89c1e46e234636c1"
 
 RDEPENDS:${PN} += "\

