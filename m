Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D451FA3736
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 11:29:08 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3573.1767353346692277396
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Jan 2026 03:29:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q/iu1N7a;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso5938691f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 03:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767353345; x=1767958145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPZwrD9SYFvs8Tm8aP9uC8cxqpU06cxf/MjktXuiPMA=;
        b=Q/iu1N7a+H/g6wcDAs4IopV10SeV2QTwkgVcjq16xiffyDNaVHM9VuiiVjr7XmTOwm
         zwYRQ6kvE/Tvi4q8p71znDrcu99MLQ4vYjG20i1TMtL+bL1RLJjyxFGQIdKU4sozjvJo
         6/RetSHpYNs3IpXR54eUrGceppiHZzHDovzPE11Aa45b3rIthaKuT8l8P7iKWgvwXGMD
         ejUXuJlDM0mPaFSxczBpA+JDkyMV46vsd9YHHBh1UTGt+2nRd2CPiyPz6OVwlKuIj8/4
         7mJMhcbJORmTryO9hRFzJcWBNE5pCrsjyKKDHFCZ0PbaupDxeZ5Fs4ulFS6tXMSKGrpG
         QwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767353345; x=1767958145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KPZwrD9SYFvs8Tm8aP9uC8cxqpU06cxf/MjktXuiPMA=;
        b=CclEb/1XOjbl5vH0GoMd3gCA94xO9uf2A2WQ6zh83zpLcwnIOKFrwGqvO8M2S9qbta
         4mkyFL6ELwOJ44zgiOVlO+EzJ+PPI96RnamRLlswYeADoyeCYimtSEHUqfHOjim4RgOd
         fvBEBUSPXV61oyis8cFtQ9If0jLEmwC5TeoTs4d0SMPhBzpdZjmDPuVa18zD7cUzpEfc
         VfUjqC69yNf/ISk6LkREih6UhtQRcISdj21d+1mGTcfUcsFxa5r10qCbE3P0H3ciFUAw
         MVy47WNUpKk308Td0/3oCVlxa3CuiOQOmEsGEJALWna3xtmbgKU1OvirrhPs42Up1nhf
         7t5w==
X-Gm-Message-State: AOJu0YxvyfxTGCJ570V6eYH2lM63Cnd2RQASufEgQywOs3xWPPtEmM3A
	OIcdpJX66Kgve6F0jkquZkakx4wEvlQ+MiRA6qqGOeMQ1zOpwRnjZwlWeKctSw==
X-Gm-Gg: AY/fxX7IZ6p4gX2mF0Z9sUZm/3U8308N9ysZqzezE9+C8MnGz5LtVYLOUMrIX4OCmNr
	/qcU+UcIY5z/Z2wMd99LLs2z0eOrUvwxiuoPe+uOeevTago+ScYGdlKV5VYcPO2EMUCzRzbld/u
	n6DfetnDgWxAfsDeD+IOvAA/lUqfsTYrt2fOBb7rlHgoT7cAMZ1vlbM0F9MfCRogHw6Ccq7eyFI
	J3ruSgnGAisEdMPUKqyV9XeC9ng4txnpyJ+yn5zlGyLzbG3m9X9ZTouDf9yyE21XdzhRt8G/lF8
	0v41VR6XSsMFOKx7q87Zjpge/t4VnBNTQ7v/6n8BmNGl+oMNx6cPZovDtzv3hpgXkUE7IvBOGR6
	Zj/FdUw2gAXm3L7V8Ej/1XTTgn0l6EJss8PLzvpp9d4XExVhKBQyzYId3c0rV/tZdnbvHRX34eR
	jIojZH2HR0
X-Google-Smtp-Source: AGHT+IHtsXL9BnK2V+4kZRzGDpLUPsFyzJTDmhSkBdHLG3k4Z1yEHEdaxfV9LDKN8iNfMRs1S1znQA==
X-Received: by 2002:a5d:5d0e:0:b0:42f:bad7:af55 with SMTP id ffacd0b85a97d-4324e4c70fbmr50606082f8f.6.1767353344998;
        Fri, 02 Jan 2026 03:29:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea22674sm85562757f8f.10.2026.01.02.03.29.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:29:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/5] nodejs: ignore CVE-2024-22017
Date: Fri,  2 Jan 2026 12:28:58 +0100
Message-ID: <20260102112900.1800006-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260102112900.1800006-1-skandigraun@gmail.com>
References: <20260102112900.1800006-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Jan 2026 11:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123093

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-22017

The vulnerability is related to the io_uring usage of libuv.

Libuv first introduced io_uring support in v1.45[1].
oe-core ships a non-vulnerable version (1.44.2), and nodejs
vendors also an older version (1.43).

Mark this CVE as ignored for this recipe version.

[1]: https://github.com/libuv/libuv/commit/d2c31f429b87b476a7f1344d145dad4752a406d4

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
index 2feec12f21..9c279d1463 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -50,6 +50,9 @@ CVE_PRODUCT = "nodejs node.js"
 # the vulnerabilities were introduced in v20
 CVE_CHECK_IGNORE = "CVE-2023-30583 CVE-2023-30584 CVE-2023-30587"
 
+# the vulnerability was introduced later (with libuv 1.45)
+CVE_CHECK_IGNORE += "CVE-2024-22017"
+
 # v8 errors out if you have set CCACHE
 CCACHE = ""
 

