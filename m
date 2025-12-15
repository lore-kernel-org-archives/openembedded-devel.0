Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45E4D5B876
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 22:52:10 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8049.1765839121701835842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 14:52:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P5yKdBtd;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7cee045187so75316666b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 14:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765839120; x=1766443920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxQFJGyhN8NwlY0i0noSsg3zDkjXmMAHQkg4In//KeY=;
        b=P5yKdBtdLNEBrK3CsFGzBF1XEL7GgNkSRoiwXnvw/5yY7uUXI15h0Q12293ChO/4dr
         CpYcGvYmcaIksOE6e+agPFS634tpLp/hkXcTveIGDeFaQWoEGnfI6kIeENSe8Vak6q/i
         Bdf2Jj6PeJu2/k14MURFyMdqedclDViFIJ51gJKT+X3/BAqjjzqfpm6cmPe2aq1FOjPH
         2VVjlF8WlrHkgmNUSpgd9AZQxVIpMPPSnRsgekBEGs2opbtK3FNMu+k+ugMABA3hLxXO
         HNDhMYek4Sg7iUeJU+Jvi4v6VRdQh5B4tAXkTAuiDElsoo0qe1IDUTK33edTzs7NJ4g2
         9y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765839120; x=1766443920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xxQFJGyhN8NwlY0i0noSsg3zDkjXmMAHQkg4In//KeY=;
        b=qN5ZuFq2JQvufAzFgGSj1+MctZqMwvX2xMb+xfdB1XpuydyL87FJpoii/tegAVtOSF
         Xq13M0iKiDPe+f9rEIYvugdJumPFFOpGzW86vCEMEOXge2z8PRI8ixO4IwRHtbQhmmZn
         xP5EskJLKpVy9j1ssngtSjaIObBRpwCp+hyggScdi/z++OdlZw6Lk8U4jR6MZTWok8xw
         KQCyOW6wypaeN4KpYMwb5/dVMoQW+l7SYLP/952NRaTVd0t07zDjdnlnFB0ewvhA+NeC
         Vi6TQhmZ10t2kvKmTxI2DvGoR1wDA1o3+4vOs9r0lgDnABoXh5tNpYP4HSn4jsTkTqEn
         2q/Q==
X-Gm-Message-State: AOJu0Yyh9xRRps14A5KwLJWy47fLch/bk2bocJJU64rT9lgg7Liiq9iN
	4NItyzjtiYTsiggfxcI2tuUzLi/aRfBRmp9Gg2dujWNfpJSH4nppMQfBWnuuhQ==
X-Gm-Gg: AY/fxX7gsReTvbB0zwZu/TnTlMzO/C7FJ2fJG/GW/swTtnxMHxjLTUc5uTGnapAXXhc
	ldIyQyTaYnVkAJdJiwB9wFL/8vH4nDLH3AIaYPdMSxmH1ZbDKG6nwJbiXqN5p5ArJJ0mc2Rgcuj
	42OWHX01L8HXFi67GU4cl9cUoE+xKUKkHRs9MSyB/RDCfn6x2P5g2TRkaxDMdCeIN7nLspkUT4e
	DA2Eh1m0b9+3qDmz0DKGdcsvK78sazlWCDcGxjCVW7sO9pdWs6FZqiUadwFhaM1WI56IIcgOktT
	5Rmb9Fr6xOMNiaVrbHToFB0KrYk9WYtb1B2HVU1Qg9YVfKSC83HcYfavF9MNzcM21tcwAJzim+2
	UamByG0sRL8wyTo5LaN7NqJQupq5j2JnwIwtavmDPWEC1zQAyhKYvLpLkEL6oExDrdHhtq9KPG7
	eabv/fM4wDDuhTxcwdUlmOayJtUbd77QeqJCHu59LOPduxXX59/gjaniq+rS3HuvwH7I2ajjK42
	wg=
X-Google-Smtp-Source: AGHT+IHpwKq3vn+Nb2lCTKg70s/l+pFifPPJMql80A9PLSu8Vg6JT9VnfLdSSrrzCQks86YmidHtEQ==
X-Received: by 2002:a17:907:3f21:b0:b72:5629:1789 with SMTP id a640c23a62f3a-b7d021d05dfmr2007611266b.13.1765839119695;
        Mon, 15 Dec 2025 14:51:59 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498204fbb3sm14464617a12.8.2025.12.15.14.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 14:51:59 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 3/5] python3-aiohttp: add optional PACKAGECONFIG for the extras mentioned in the build requirements
Date: Mon, 15 Dec 2025 23:51:20 +0100
Message-ID: <20251215225122.2243816-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215225122.2243816-2-t.f.g.geelen@gmail.com>
References: <20251215225122.2243816-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 22:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122672

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../recipes-devtools/python/python3-aiohttp_3.13.2.bb        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
index 5419db3535..e249f99860 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.13.2.bb
@@ -6,10 +6,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
 SRC_URI[sha256sum] = "40176a52c186aefef6eb3cad2cdd30cd06e3afbe88fe8ab2af9c0b90f228daca"
 
-inherit python_setuptools_build_meta pypi
+inherit python_setuptools_build_meta pypi 
 
 DEPENDS = "python3-pkgconfig-native"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[extras] = ",,,python3-aiodns python3-brotli"
+
 RDEPENDS:${PN} = "\
     python3-aiohappyeyeballs \
     python3-aiosignal \
-- 
2.43.0


