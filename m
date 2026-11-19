Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.491.1795102821997505830
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:40:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RU6LDovr;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a357b1c649so1561066f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 07:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795102820; x=1795707620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LL2wI27MklRHrCfgUs++wRhc86kdX6d+P9uFUe44obA=;
        b=RU6LDovrMIewYpoC37YVtD+iN6PDvzCUxRXvBzyfojv7rn5bvpwpghNawYt4O7y5MF
         /xY9JwyPd8LBoUXfiCsKiHbCGRNWu1tae+h6mwkImYkBZEuDCwehuMB4nU31/tkpTwxY
         9jSlcZwB7UliSCKuSMR506CAbz0R4yPVo263U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102820; x=1795707620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LL2wI27MklRHrCfgUs++wRhc86kdX6d+P9uFUe44obA=;
        b=d6U/BBkuanEjwJ/OSOLwKds4zBnCqNADEoLqdR1qGcpgFlXpQDzRYAfmG5g5hGXGUn
         T14yPo/uOQ7YnoapNUAaAGkUgTMv2Tv2luEPEFtfHPoSUf4tpbRahQU/N1e4N9J6Yb2T
         f46AZY2u2WXD/xJ2k6TXN5yEgH0w9cm0EvkyferILCD86NqNaI1PqhM4TaS+J9ApL4AP
         NWqIZEIOM6a8QCw3vn33XV3rnXNcMgsmlL9a+NT1cm4nKZrubM2K5fmv0Q6pyYz+KXii
         vqRLgoML4t/roscib5c9FbO1iKR5Hwbjgv2FdmaIeCD88GQ3OTlf6vuROezFJEDGVMhp
         hEvQ==
X-Gm-Message-State: APuU4Z+a2o5deXSifNn5ks4C2bPDYepV1wukCrdLcaJMnoWTJLYUdYdA
	Y8DPrxFbSVWsP4N1EdB+m3o/I/f7LwdKuNwG4bb5LJqHsPfW4hg1F/2fRC4QDTMVX/oj4dBV2/B
	enmRC
X-Gm-Gg: AYBFou2r37hdhxxpl9/LotPB8AbR08NFelnsz6du3dWY7+E2nqSuXMQ7JPNXlQqWwfI
	dypGg6O29WO3A2avNqdoZz2bZmCmVKXNsYlgv2355wmxV6Y0a5ZBYA+Qs/tQ+Gkvqz7gFMsOFmm
	WeJdSzbpTVytvNxYWY3R3nNFFmuYpAeZ9DlbBflXrFe7AVCLrFECiWpKxD0cuA3ExvnG1Um5YRa
	rdL94Xv+xetw0HzFeiv5eD6t/anqn750pg9hPd6wXh/GPnyfUPVgdWuu8B8w+klw/Cwr826UwiZ
	dfhaxFkRplf4lx5B5J6zFwnwh+0tdONajew+5zs/KaQbjKjRuox0djDW8cB9/RtAJJuG1eP2vZz
	MSbS0DoI2OlT2YS78PAZeu9afbCyX6eBjjMumukjw4iBgjN5MjqGggxS5m7LJwCj+JZ4xw1WqUK
	q14wo9gLJfCXYB3kWK3wBT1qaMe4G8FnYjvb6mmtAX2JTqOVHt8sB6Ln68RQD6PaVFb2hzJwz/S
	b+dTVo/VhIMdoskptXLeTn+sK/AZVByPHM7orqI64nHSCQjbaaXTxnAAMRP6/aBhejDk8qDg09a
	830mJ85k6a0I077bkfdAlX9mqKlg4Kiz8p+thNukZHt+c3tuQfnlzlwOSRusOGpPaN7vVezt9iK
	dILMJU1LfaMBMEbz/lmxNrIOBItuAboTmWsrlnH1XgmDZkJrOfcn1hw==
X-Received: by 2002:a05:600c:4fc5:b0:4bb:71c1:3ca6 with SMTP id 5b1f17b1804b1-4bb7da27e95mr127280345e9.21.1795102819631;
        Thu, 19 Nov 2026 07:40:19 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm225495f8f.52.2026.11.19.07.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:40:19 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/11] python3-cachetools: Upgrade 8.0.1 -> 8.0.2
Date: Thu, 19 Nov 2026 17:40:04 +0200
Message-ID: <20261119154014.1039002-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 15:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132679
Content-Type: text/plain; charset="utf-8"

- Fix deep-copying TTLCache and TLRUCache instances whose timer
  defines __deepcopy__.
- Fix updating TTLCache and TLRUCache items while iterating, which
  skipped or repeated keys.
- Minor code improvements.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-cachetools_8.0.1.bb => python3-cachetools_8.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_8.0.1.bb => python3-cachetools_8.0.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_8.0.1.bb b/meta-python/recipes-devtools/python/python3-cachetools_8.0.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-cachetools_8.0.1.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_8.0.2.bb
index 345713e4f1..b660595024 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_8.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_8.0.2.bb
@@ -18,6 +18,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "deb1d376d4d28c2f33f3e3058043b005e0af75c35c094bd54053e27d2906ad95"
+SRC_URI[sha256sum] = "30ac523adfc118b51d2b2e7bad8a0ddb31370dfe2700c7f10ca224f36ccf81e0"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3

