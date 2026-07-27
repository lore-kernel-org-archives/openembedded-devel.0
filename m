Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7945BC53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 07:45:24 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26372.1785138321601119150
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 00:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S0g1JBUQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so25373355ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 00:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785138321; x=1785743121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+vUjxPQ8GwRmkZ5Vx8QDeD9y2a7QLu46cDwRxsM8Uc=;
        b=S0g1JBUQAe8b+6y0WXzLz/5UjecnnReU2TXU2AhDh92XvEf4HyRYus39Uf9wMilCR5
         nganFsNDJjqVdNCPsBPpBg2whqTL0dNkusZ0Nc3oV5X6av0G6W3GPn3WtxX6T6f3V2Wi
         zps/AgQRdvXbhcB8SHD29z2p9O4OttQiNplIDVvKMZAG49XCv6gctHsO9tdXRCsf/1vS
         SQMMAmoJ06XgDPZyqysWHYm5VF0L0R4vBlm9OFMlkwGZ29LbO0EOWWz2v9nmXKhuaKCJ
         PWtzkfdQ9VD+6KK2uakHPnvLoTRnYLETbyEjUvOqNimbCHSAtjmqHGan8O5ns+l1SGo5
         g3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138321; x=1785743121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R+vUjxPQ8GwRmkZ5Vx8QDeD9y2a7QLu46cDwRxsM8Uc=;
        b=TBDP10G+1jwxNElrkXtw4QOZiZVR3MIkkAXuUghS9B9POiwkln+ytd4Cc6q8sCn8Xu
         ZZ2eqYcuAv0xRHJCPMUKH5aPCP2+vaW0SKBejKlOQQBs0ujXzIBNQmpuyoTGVQKjoqG+
         hTymUDSp9DhENlFfQn+ngdXeqGTxYJvIMtOmenix1O8s7wT8C91MhG/oIak3e8Zl3Ed0
         vL5vFUDxYSI4+8qom7gBVFZpTtPt0cjGhUKp0wBpdyNZbHKzUwoo9DYzGYHLF2cLdkQt
         FWJfQ4i0t9BKN2iSb1JxYOScWR4QaXDPqYuPdLw6SbVN7G46c+ENJoopSt/4UvRjlPwM
         3wVQ==
X-Gm-Message-State: AOJu0YwSo0WiIXxKvQQs60DwzllgZNr52QRFlcZKo5cBJS4XvF7Ke45G
	iPM7yfpmK8xLpXr3LVVSH0DurqvIzqOOG1gVEs7dp7lU46dAmv3/33yM612NLQ==
X-Gm-Gg: AR+sD11CazWAtCPa7E1DljgswIrWW7AxqLXuWDWWFqK9BlXAHL/z1W8GZMj6+CXH3Tl
	D5tZHytPVdjxXnr4Kp7BWD9CrAvHRTKtqhRzp7/+tRdteGm8V6LQ1s+J6jw+X/MjjMNPQEObbxD
	Zt+vY2vVI5npmprIBKwZXtEF6QKuylxS15zh6+5j+7Q+cv7g5/FXZEeVG82cg4Lu3VTqoIvM4li
	Kics3RU4b303cLYzJckBiKizIqVua2aaXUTmrhn9CmEEOVjc/bbifstMSsAu9hgmi5EvcT0vraI
	KKs+ZhJpCov77ATb+UQ3ZJfnCVBMJJsCq7eha4BBdWT1TYHPBEnR0XYPW5OxLtG558stsNO+N/A
	emMqwNYoy9WZTA9VBVLU4FDIPaqXTnDWieIrh78hsVNFky+QsQvTYnbapegYLc3ttKe3ewlhIlr
	W8ZP0IfAFhpr4S9IQP8HchJ6na8w==
X-Received: by 2002:a17:902:f789:b0:2cf:8363:5ab7 with SMTP id d9443c01a7336-2cfde8253c3mr76167395ad.26.1785138320898;
        Mon, 27 Jul 2026 00:45:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cffa9243fcsm8648945ad.64.2026.07.27.00.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:45:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 6/6] swagger-ui: upgrade 5.32.9 -> 5.32.11
Date: Mon, 27 Jul 2026 19:45:01 +1200
Message-ID: <20260727074501.3707659-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727074501.3707659-1-ankur.tyagi85@gmail.com>
References: <20260727074501.3707659-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 07:45:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128460

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.10
https://github.com/swagger-api/swagger-ui/releases/tag/v5.32.11

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.32.9.bb => swagger-ui_5.32.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.9.bb => swagger-ui_5.32.11.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.9.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.9.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
index 8878f2ea00..19000d6f35 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.9.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.32.11.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "08bb057df45fa778351ccea63dfedf848d5c5edf"
+SRCREV = "414a60c9a40408d37821297682b8a190a840a79b"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

