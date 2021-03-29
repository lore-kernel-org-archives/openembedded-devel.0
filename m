Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.364.1617039291353751014
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 10:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nVujei+T;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id c8so13656359wrq.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Mar 2021 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FrzZsql95r6iujv4hAixE7/9k8lU5V3EW974t5WCxxU=;
        b=nVujei+TiwaEPutRxP2MHPoLX8j+M9gNNS1t8BGPoyUfNbQl2WU1UqwTGDR1GKKD4V
         qSF94P7wvFr+PU0KhZ0L2W8il6g4Je97Q0gC8JMABla8BTVEHyEbCHlo8s8A1v8ozB/P
         w1jnxfztO2qHKJQ2ayu6w6g89SZzLBrVEdMsrMBYkgmB76v/+aOssfA22o3AeejAPo8k
         /8t6VEtjHXsywzPSMzQiOaCRUqX4mGzC8roBw9EdSv7iIk5mhvA4nbESuvBS9iyXBrPg
         KJftHg4KvwBTUPVkcnmbcDUaJxZoGd2a3jvyDAgRj9f8EiqPF6L+2rOiK83bmpXyuPa8
         cITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FrzZsql95r6iujv4hAixE7/9k8lU5V3EW974t5WCxxU=;
        b=kfNMNowALEqGKM5ZXwCb0tw/eL9DPpS34/YR7gTMPHeA+39UCbTM37vU07j/82MEKr
         R5q2MenGsi4IoxnQteHoAENp0B2OfkZYnzi+ebnBEHS2/9gfQ9s4GV1RGLN4ej5fI4yM
         SEoXo6+V0f5NB0XvikLCuzaGzmd0pD6T+M8szeW5fKHE8c5pvToNw6cPKg8oG9UyGIxl
         yeuu1owyVk3Upo5QJsZ9qSw5m6VX1w09irlnaFbdjL7sTZBBzA3s70gUS9q1/nnclv2+
         uXUCAFHH4PBfIczAsNYH1vWATaAaROTvpSum3SGKVLh7YH6MXHhmi3jvH/XmsRbvcD28
         86CA==
X-Gm-Message-State: AOAM531AD9S6Ak5vPse/Pchxa/H2mEvVsJDjhFe5EYZBrKpZXHBi3CYC
	HVgNZoRKM9zEUGiaHjgOaKQYUpz24si6zg==
X-Google-Smtp-Source: ABdhPJx4+zlQisKZBiXX2Pv4TlweVrDDZRzMv4mv20/UcMpZLtBx1QtiV5vWKik6+yBqMmUSwT3syg==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr30382512wrt.18.1617039289534;
        Mon, 29 Mar 2021 10:34:49 -0700 (PDT)
Return-Path: <peron.clem@gmail.com>
Received: from localhost.localdomain (2a01cb0003ba9b00a5c6a66723ed8fd3.ipv6.abo.wanadoo.fr. [2a01:cb00:3ba:9b00:a5c6:a667:23ed:8fd3])
        by smtp.gmail.com with ESMTPSA id l1sm30357113wrv.87.2021.03.29.10.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 10:34:49 -0700 (PDT)
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] nodejs: 12.20.2 -> 12.21.0
Date: Mon, 29 Mar 2021 19:34:36 +0200
Message-Id: <20210329173436.201230-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes :
 - CVE-2021-22883
 - CVE-2021-22884
 - CVE-2021-23840

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../nodejs/{nodejs_12.20.2.bb => nodejs_12.21.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.2.bb => nodejs_12.21.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
index 209d09caa9f4..3a2822c38d10 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "961ad600f0706c396390ebc7767fb01d5e3792a5022dc2e7774796756eec6d3c"
+SRC_URI[sha256sum] = "052f37ace6f569b513b5a1154b2a45d3c4d8b07d7d7c807b79f1566db61e979d"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.25.1

