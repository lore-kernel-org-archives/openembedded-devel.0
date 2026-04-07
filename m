Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4CFEDB7E0
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 09:19:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77211.1775553557143659000
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 02:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MSjTdQwa;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso4094169f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775553555; x=1776158355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ohr2+H9bLpP0Fz8QZXXmDeubiZ3jrwofIldSqdb2M5U=;
        b=MSjTdQwafnY+sWEoBmjV6eByk6ZbuwE51ekU0Frlk8Wk0cVf4C3+RzZH71olyanurs
         NQsyNMEdm5WjVDVkyugG+P8oznX24XRAjuyfvihTELLb9PctdOp/kj9cwHYOrSVLf5td
         qPbw08WbFojYt7bPq6IXq5MqgEpgKsFdagutTQvMbtK5elG4/f7uz1tVnLwqPNw2NdH1
         RDNdOuErB7p2WlFaSjYiGFkuIoj8ipbA+lTA9piigJpFEMptAhazZxMQXlxhA/YbojCB
         hW4IAMIGRmShRf+rBhyPim64j+92LYlzA1wPRsWSovnAq0TgALOTdegR27i4W0CMKJyB
         FSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775553555; x=1776158355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ohr2+H9bLpP0Fz8QZXXmDeubiZ3jrwofIldSqdb2M5U=;
        b=Ycb8Zw1DIExDIufFFqOIQGtxqrR8Sebf6jBQCk24vOtCXasxv84jxO3qII5pOPm2XV
         DRjZ4oeERjKmAQtfVlZavNBczBaSqTx/kwMsj2p7nqJwqk6QEJCHxBUs+XnxzvjfHlIo
         thSW/XC2CQaCuTyc44zHyc62VIciwvlrn6tiL0/3o0ghkHtSRupDNh2jK8BdmCVZHjxg
         z2TS9WTuv1C0swhc7FWVBKCUSfMuh2Ivr4sziKibQ7Nl/9Cq9UUNJM1VgCvJfFtJUCQY
         Sapv+Vl7TaeW5kgLhFxBgfZ5SQlPbQ3Mtvfm2/5RD/eRQgrbUJYs3h4U408x54ele9hR
         0Btw==
X-Gm-Message-State: AOJu0YyKSHTbrfoQy5nFpgWrXRQVvUyeyJqzoWLAs1ss03sW7SLESX0d
	2lLC1MIXSVzxvgvGAjIi8kfwyDsS92ZzuGknWMsdyryMLIkpAh9oOORipLShOQ==
X-Gm-Gg: AeBDieu60DjQkDGTgwLlz2OYkgF3GjTCLJsjHjiQVuNelmhWWxps247CJqlvaDVZm4T
	URvZCegzB28W6bsmN+cBWn/w+hWQjAAaP4RwN6X1T91/bUlXzAWoOJqGrFqavsofSBBmN2eiLY+
	q12KRgHvyoeDh8BKj05V21V6JAwEUVic8KmxQCY803uqMsI61PNXOH5B4X1onZnYMbsQYFXVseq
	UWe63SJVER+WA8RrLMgbE4KuHPTgVRzivlkpE9wkQrGiMxsnPk7DTVZmFqTxBZxK75FsiQmZAfg
	QdHU6X1UL0vqIanL7CMPH6n6rMshDY3XqwM6QD8qmFOHXRLv+beMxjcoptxhOrkdc6AFLVWqY6H
	Sr1FcTMPHkfGtvx6CseZjLWi++sLzdVmBgtVmsqLFyj8srODXPHfp07fN4ZvkmxZnDMlNE9zXsa
	ui2KWu7nM+rNFjAW0qvuGs+IP518YJBhk=
X-Received: by 2002:a5d:5f85:0:b0:43b:3b80:6776 with SMTP id ffacd0b85a97d-43d292dac9cmr23770746f8f.30.1775553555445;
        Tue, 07 Apr 2026 02:19:15 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm48749374f8f.4.2026.04.07.02.19.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 02:19:15 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 2/3] nodejs: upgrade 22.22.1 -> 22.22.2
Date: Tue,  7 Apr 2026 11:19:12 +0200
Message-ID: <20260407091913.3963112-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407091913.3963112-1-skandigraun@gmail.com>
References: <20260407091913.3963112-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2026 09:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126079

From: Jason Schonberg <schonm@gmail.com>

This is the March 2026 security release.

  2 high severity issues.
  5 medium severity issues.
  2 low severity issues.

High priority fixes:
  CVE-2026-21637
  CVE-2026-21710

Medium priority fixes:
  CVE-2026-21711 (affects only nodejs v25)
  CVE-2026-21712 (affects only nodejs v24 & v25)
  CVE-2026-21713
  CVE-2026-21714
  CVE-2026-21717

Low priority fixes:
  CVE-2026-21715
  CVE-2026-21716

https://nodejs.org/en/blog/vulnerability/march-2026-security-releases

Changelog: https://github.com/nodejs/node/releases/tag/v22.22.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit d32cd27eaaa13b296c268df234d2fb2cefa62946)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nodejs/{nodejs_22.22.1.bb => nodejs_22.22.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.1.bb => nodejs_22.22.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
index d737a0ba72..2fad3f362d 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.2.bb
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "87104b07e7acee748bcc5391e1bc69cf3571caa0fdfb8b1d6b5fd3f9599b7849"
+SRC_URI[sha256sum] = "b6bedd3a8cacd5df7df015a5088264b12c74a277ba60684cb9642ae8eb743132"
 
 S = "${UNPACKDIR}/node-v${PV}"
 

