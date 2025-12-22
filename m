Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3D5E674BA
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 14:54:02 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81388.1766415235071834750
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 06:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YlPAtBMv;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so23134125e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 06:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766415233; x=1767020033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JYoBj7CIgVoTCt++qFY6IIRfh9KravMKVfei2wVLKag=;
        b=YlPAtBMvXvvrz35EjjC2RqRaHlwcgueJuagr0HNw4IddSHVYeS2aD8Jb2HBQCWkjPT
         h4kk28xHxiADDaKqzK3KNTrTVPf4DF6uD+rlEI60Kw/ZtWqtqTyRMJT2zYmtuBILQNo7
         6tFdwbYuKP6qK4XSfw/VJgrl+4Cj+KCs8DdsClFt8v7+/PuGg3P47yX/8ngll6P1WsXv
         ptlcExUlhEaG7Mj4aSF/gcag2EbaAKytGL6UA6Wvi6a5E+nNbjpS6sWYX2OkubqVksSL
         Xfnykb8d+Gxk5jhtk3JyRXBON0b6Wdn9ACiAc6tsLKI4lW1WSqkZiJlEpesHP3sprjAS
         2x/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766415233; x=1767020033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYoBj7CIgVoTCt++qFY6IIRfh9KravMKVfei2wVLKag=;
        b=C4Q/piEFAA26vCrB3kVTJBlcYYWGzoZFprQ7aMl5sSdJ3D3KpK5uGvsIEMtu1p7mud
         9O+HZRS3L+01cm6SMw48jRPR4kFQfzON6qUZQwsiPyivhuu7vSBOHemVnH5we8HtVcZq
         pnIvnPrMZ96xerzzkj2VvDBAy0xfW9KAC4B4KiAkKBloxgjJX400r3WMZI9WVZXq1rqG
         brE7c0swNkEgNzAjAaXPWJoZ4alDRt+5nGmVSf5x9LE+wBT7hsEjyKO6TuUZY5tBjZKB
         bhE891H0dDF07WKSayMaPAgTbvAcnbf4imxc0YrDAJ9WucB1DU4Vvg7y+isE92OjNrZV
         8gSw==
X-Gm-Message-State: AOJu0YwozI6bP+9bqcV3cTLp5NomwnU0rgfqk+vhm5Y1zRsefk2/PdId
	f0Yy/sR10zv1vinl9IKGhVgcLBOKIIUOKxsK98WaxdKBPIU7MbxGLBer/WzmDA==
X-Gm-Gg: AY/fxX7HSZvdtwod5q2/S0EbzaOzH4FKk1cdoi/LHal+LQmw+lAgcsFZLTaeyV01oju
	Ov4W0XONSVntAIE107+5SJJ+JhY5C0kGzNRUz9YsURxakVNzSqjTFFOKRGxjgrSsbFt41VSfU2k
	UWbx7EZCqqQPgHFm2EG3eZgYm2nMRLSTAzwYsIA3QOHmHU465CGuibXNpyNvBoBTaiKEgVGFq1d
	r4DE8pJkJGOaBTfETxJHjl8Wywwg8cZ2Y2wMkgtbn8iV2/GMn+imxKAT8Po53d3jOyIOorpT4BV
	gFJ7rqDdw50AYqfGWXPObEpReP8/3wqHjAnbEmy0Pxfksqnn0OE2vPmVxgN5afDb6dqW7k19fly
	R+YS8XEl4qkiAxEUzcHA9e0p44jh3GNyaQMQBepDOpuf60BGvI760CGsJaT5h4Wt1AEolrNEsXJ
	bF5hRgee4+
X-Google-Smtp-Source: AGHT+IHdtSJyy4JGEZgMTo6NSq1gyDfst8qqfqczrHTuujKaDD2xLIQsE9BriTvTbh2px9KCgGewpQ==
X-Received: by 2002:a05:600c:5248:b0:47a:8154:33e3 with SMTP id 5b1f17b1804b1-47d1958958dmr111841535e9.28.1766415233130;
        Mon, 22 Dec 2025 06:53:53 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac4c1esm96180175e9.14.2025.12.22.06.53.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 06:53:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] nodejs: fix CVE_PRODUCT
Date: Mon, 22 Dec 2025 15:53:52 +0100
Message-ID: <20251222145352.424208-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 14:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122789

The CVE_PRODUCT is set with a weak default assignment in the cve-check.bbclass,
which means that when the recipe uses +=, it overrides the original weak adefault
value instead of appending to it.

Set all applicable values in CVE_PRODUCT variable explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index ca5deda99e..05a6706c10 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -44,7 +44,7 @@ SRC_URI[sha256sum] = "576f1a03c455e491a8d132b587eb6b3b84651fc8974bb3638433dd44d2
 
 S = "${WORKDIR}/node-v${PV}"
 
-CVE_PRODUCT += "node.js"
+CVE_PRODUCT = "nodejs node.js"
 
 # v8 errors out if you have set CCACHE
 CCACHE = ""

