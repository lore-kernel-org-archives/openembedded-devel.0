Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F87FCC05C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 18:33:56 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1710.1772822031537406587
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lMC6Y2Kr;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso4212302f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 10:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772822030; x=1773426830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPiXQyL5qwE/d8h6qwynLd3KryQ/skAVmnWIFSgVZso=;
        b=lMC6Y2KrARcmLSI9zZKlifReUwW6QflqhxWukFlMqBRIduKVlp/gfQxZWn+BpiNBsZ
         fkdaiU05wySoZpKAgIquH2zUStVbLukxa3SEoXxPW3N3FBbBcean09HufVdvNisGB8Jh
         hbgTo70Z04BuMqJbqFBxATzI34K6QNFDTrv7IYaSFY1hPedwWZAhDPZOXKGKQ9FNCPjh
         EE3tP2inAUwn/acCvYy8/c7aTK8TSEWRpRqt2kybSphwGYVmAhmCSutRAq3aRIfLDn8S
         a0V25p6M2hJKlSjRVHtCqVK8gHfwSefJL7Do1qlyXrUB6oRMq4at/BOFBBiPNt3O+1dD
         /kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822030; x=1773426830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cPiXQyL5qwE/d8h6qwynLd3KryQ/skAVmnWIFSgVZso=;
        b=uaLGr68x3zqsutSY3dSECrtxxJZ1EODyoutG3URYQF2pynDXPLjrd/ZYiYKLfzDfWt
         zNI0nl/XFkGFENaiqMIGpLb9gor8vIIm8ePpuJnhW+CfDQRo/Y/+HGSS+0JaUclrjqT2
         jOP96NtXicCVZsaEOuORZ6y61o/2kCTCcpxuCYx/I3huuOHdEDqP49QHI0LF/LU59/ek
         jIHUE5Q8g3HF2WuPAW2uUbxiAP7dNDZwX5F5E+7Hqwj/FFuw7X+cUUuIKqhQibgs7AsY
         52WXKZmzIb++TKFAITJzgynYs7aE5AyNjRw2fu1s0/MwPA5LVMXVCCwTyVQYwldY33oP
         QOOA==
X-Gm-Message-State: AOJu0YzsnOu7dSXGTBcr8CuWS0DveUy7/3eqk6hJho110WPJG0nvHoUi
	/7z5O+8OPHmudakcTP9YX3UFXAsxpa21amosrOCnRcQ/n+He0o+ULdXJ0LmyTg==
X-Gm-Gg: ATEYQzxLegdCtjJFyRCdFFWdUO1wNAhx2gNTdbU36ytKPv2c+Nea+klKgWpZgEa/S4M
	oqQNUtv0CnzKr/Qy7bRfOhuX5RJTsafaiLXHCTyCpTpRSL0AU+28rduZQ+gzbM0M4NLEoTdcuN1
	6W8kf1t0ZIoUHKlZ4H4xuicwm48T3Qhktc30O4hn+ssJ/hFd4JMcKBCmYItNrfl3WGPaRNmd563
	iy//Lr2E0xijLdie1DpfP/dDAk5C82AceA2nVveFxJ2/5PDhQ8qkY/M5DPs6Wpc+CxvDC0rGyUX
	30/7nXD2oZHZ31lx3oUlrcORFIFXyZ3H2qZTxQhBoUQHKMJM1dXhiq+ScjTfpz8PO5BE3YmkoBn
	aBJG9Gzng7hQjuBPrulx0tU/ExsTbaiHej14qQde4HMajzgs8hDYd530MTu2iuCNenPrUsyuLGg
	0DSw8w4w1SYfA4hHKyEjmT
X-Received: by 2002:a05:6000:2902:b0:439:be86:5051 with SMTP id ffacd0b85a97d-439da8a35e6mr5352828f8f.59.1772822029839;
        Fri, 06 Mar 2026 10:33:49 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae4b860sm5846929f8f.36.2026.03.06.10.33.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:33:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 3/6] python3-nltk: upgrade 3.9.2 -> 3.9.3
Date: Fri,  6 Mar 2026 19:33:44 +0100
Message-ID: <20260306183347.1014705-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306183347.1014705-1-skandigraun@gmail.com>
References: <20260306183347.1014705-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 18:33:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124919

Contains fix for CVE-2026-14009.

Changelog:
* Fix CVE-2025-14009: secure ZIP extraction in nltk.downloader
* Block path traversal/arbitrary reads in nltk.data for protocol-less refs
* Block path traversal/abs paths in corpus readers and FS pointers
* Validate external StanfordSegmenter JARs using SHA256
* Add optional sandbox enforcement for filestring()
* Maintenance: downloader/zipped models, CI/tooling updates

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 14d464c15094d1758dc14706646a8aa645a3bf34)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-nltk_3.9.2.bb => python3-nltk_3.9.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python3-nltk/{python3-nltk_3.9.2.bb => python3-nltk_3.9.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb
rename to meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb
index 8a1e0cc047..1748cf6826 100644
--- a/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.2.bb
+++ b/meta-python/recipes-devtools/python3-nltk/python3-nltk_3.9.3.bb
@@ -21,4 +21,4 @@ RRECOMMENDS:${PN} = "\
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "0f409e9b069ca4177c1903c3e843eef90c7e92992fa4931ae607da6de49e1419"
+SRC_URI[sha256sum] = "cb5945d6424a98d694c2b9a0264519fab4363711065a46aa0ae7a2195b92e71f"

