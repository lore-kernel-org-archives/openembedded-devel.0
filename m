Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568BFD3F2A5
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.30097.1729278825501466810
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IeumfLa3;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e34fa656a2so23957807b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278824; x=1729883624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RLEX+e34XHRXpkDg+/oPXUiJImJWkODDSfIdMHXByY=;
        b=IeumfLa3ASY/PgKxoXjk1q5/YZWRDaj19lgImgNK5No9QlQX0ODdOOIrp6IRZdhlr8
         wJyIAxABNoZ0lUKlk5F1TD1wKY5qqgMYz84F8O6BhEOyEe5F1mzXsxtWOAZ+35KtCjRY
         svYlpvNoggi38eH2qmaN7/E3nqfFpypzGtrqun/igNut0mngcOEJPZYiMMhrTSQjg4AQ
         cG+tN/r58Zf/yoACcUCYuJOpLLaWFiNaJWrpjmZWGfBoLQQhsAhYGABzo+HvQ8nR9oZy
         q+e6zSdSiZ9eYAfLvhlZk4odSEyyDFIPJwq6VMW/jkdQe3DHIPWgipTIKihCJLjQV2dr
         deVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278824; x=1729883624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RLEX+e34XHRXpkDg+/oPXUiJImJWkODDSfIdMHXByY=;
        b=gXMb/4jOJbknUQjcSPaAszH5ZsnJ9aMYX0TM5Ctjj++pNr9DYaCfOHqvnTDwoZ3AwS
         b5KpCRjUsFH+nQfBogt3mI6ConC1JIb0LKzDDt1dmGYfdpqAZ4KNq5UByXTWpTEMgASJ
         ySMpQr1Bwm5Ys3EXRCae1dYZL5ntkNPrW3pp0jEas8zDmxmWFq/Jkh8/Rk0KnQlLK1YB
         rmw3d4yxzT9VrFn4i9oxqMwxbkhSLJHUEky3pqVcthpUWeboWLR3hyEVtsR/CYzF/of3
         kskm0G+FamDQsiIhwB6UN8Y5esg4qc6rokQnLKWr79+C7G/UuydblU4l1Pz+nPVa0mes
         5fEw==
X-Gm-Message-State: AOJu0Yz+uJs9+Tgy4TxbY82SwJy9BdcA46aycxSUMQm7ncKws+XFvLt8
	9iV8fKsRm5ZZBDAmWiNenYBgECtx8qLZcaKQO9K5MGwQ4e9G5+MsdyQCvA==
X-Google-Smtp-Source: AGHT+IFFEuYsbNN7w19MpQRHC4gT+QuemYiw4d95I+p+O2u8aVYoEuwymKGf20YP5/DRfaNvxFAvug==
X-Received: by 2002:a05:690c:6706:b0:6e2:446f:422c with SMTP id 00721157ae682-6e5bf9ff55cmr40159467b3.21.1729278824287;
        Fri, 18 Oct 2024 12:13:44 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:44 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 52/68] python3-pyjks: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:39 -0400
Message-ID: <20241018191101.25184-53-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113039

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
index c0cca98ff..61e2b205c 100644
--- a/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjks_20.0.0.bb
@@ -6,7 +6,6 @@ HOMEPAGE = "http://github.com/kurtbrose/pyjks"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9694d6cc724caf7f7386be88a4a81958"
 
-SRC_URI[md5sum] = "1a6bce95484f1f62f8ff59755972c632"
 SRC_URI[sha256sum] = "0378cec15fb11b2ed27ba54dad9fd987d48e6f62f49fcff138f5f7a8b312b044"
 
 inherit pypi setuptools3
-- 
2.43.0


