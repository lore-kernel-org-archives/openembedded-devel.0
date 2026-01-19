Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4754ACA6012
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:28:29 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31575.1768811304343284819
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lKo8j+WD;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29f1bc40b35so41537265ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811303; x=1769416103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+/ruiaunyGt0UK5QS+w0puuJbny2tFP0lUWXeJetUU=;
        b=lKo8j+WDM684zKrrIRbZGj5YKywy6poyxpHDsheiysyBHlAYtWPut7FdAmqhtgDOBb
         TMRG+dPcSjJLl6a9m+97ShueobUq13tMKwDIxzZUndUNosEJ/UVX0aam04OZzEVDtE21
         +rxo3f3+sIemlSphVtDMwyKNrSCdQ6VEfU2hr9VNyr9Rdak5GkJorrQSp2fPf4EEVvWL
         uKxfwaMBPrTwCL5ON343NvfLm9Yi0pCXLWFarifz/Na+SkopE+3crYMjOrX1a2Hpkdhv
         TtF7LGED/oAzg242giNKjQkJcFgP8jFf4fbwgvEhx66nQH9EuNGfr8RWL19/Scb1MW/9
         baEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811303; x=1769416103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l+/ruiaunyGt0UK5QS+w0puuJbny2tFP0lUWXeJetUU=;
        b=bukNXUy98ipElc0RaW4uoK12WJKSUgWehuAvde2NGfJJdwNxo3DXlb1yxyF7e1NufM
         oBn4v+O9Mwv9IBgDgxHC7Dc10U40gSbODzN1CZbVMZ9SQQIzYbraDjDNUzBpnFsTKv2n
         q7t/CZopzCuaUSABswIqaWlnRZCgD/OGlKLNTCfzHf7ta6gKKRYaE0bUuMcjeBte/ZRr
         uLsBbLJyQTZkzOGJedp8Q+qDadGjTK3znGFrQv83mTu8nf4zTjJCpEB9oPaJF05/vkTw
         TxrkbTJKXi7vV5042LnJneZg2XFU0vHBWBhhAQdieDfEn/JKr2e3Fg4li2136DoDttFQ
         lsJQ==
X-Gm-Message-State: AOJu0Yz4Kj1e2KQ/sRsdRA6n1FOLrGC0lhqCGlm6u1qEMKlsf1BQxM6r
	3LszQ3nikItDu5inY+pEFTPoBUxg44+kyOT8i1y8ICckDQwGaEbq0N3McER28g==
X-Gm-Gg: AZuq6aJnYMHjOrTA4NmgrD7GLDeEJwMIpM79fe+fEM4yxBS0q1dXFw1RDDSBuOAcFs3
	q9IFMmCs4qZgKykJ2jlxTzvDDTJAoTnY4EmZnsKSeo2D/TFLsrsgyI8xFhIPDMAThNmtySF3eWd
	RrM1ODhl8JmUNr1UCLM2kOKIYsH9xsXKfTn2NXvrIHoGTGhd1V6VgmJinfyAFuNvKAH3Q1/O8pi
	Bp4bmhWA306sMzn+pLmbyhQabBIxXUHfWLyCCUC7HQN7Wig2xsghvTc1pZWHwPhENqKGJpB2g6r
	jyzKWXdqGHcYvyqZzPnBB+WNx+3S9TWRYRRpgfCRbJXiv64OcJU27uCeAznKrX/zSs0tXqWCtWC
	wU5wBizGF8RGNPbLWt09HP3KD4GxlfANO8mapRVLtt20Yxj6PH0gSPFlYBJyBO1F4aV/RZQmJ/n
	nrg1QhDJ2CV3gNOa7wsbLpqJg=
X-Received: by 2002:a17:902:ce92:b0:295:592f:94a3 with SMTP id d9443c01a7336-2a7177da2c4mr102110955ad.48.1768811303518;
        Mon, 19 Jan 2026 00:28:23 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:28:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 09/28] microsoft-gsl: upgrade 4.2.0 -> 4.2.1
Date: Mon, 19 Jan 2026 21:27:31 +1300
Message-ID: <20260119082752.4120991-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123603

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1d33fb39d9700a125a02d5bbd8292db2756b6f6c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{microsoft-gsl_4.2.0.bb => microsoft-gsl_4.2.1.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/microsoft-gsl/{microsoft-gsl_4.2.0.bb => microsoft-gsl_4.2.1.bb} (93%)

diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.1.bb
similarity index 93%
rename from meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
rename to meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.1.bb
index 16a0af334d..87a8cbbb88 100644
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.0.bb
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_4.2.1.bb
@@ -8,10 +8,10 @@ HOMEPAGE = "https://github.com/microsoft/GSL"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=363055e71e77071107ba2bb9a54bd9a7"
 
-SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=main \
-        file://run-ptest \
-"
-SRCREV = "2828399820ef4928cc89b65605dca5dc68efca6e"
+SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=rel/4.2;tag=v${PV} \
+           file://run-ptest \
+           "
+SRCREV = "249146590e322123cd0b378b1f364d6069717687"
 
 inherit cmake pkgconfig ptest
 

