Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6236.1793787892955072851
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 02:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SqJzFD9U;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so3977765e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 02:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793787891; x=1794392691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2/UT8NoRwMXel4lMLf7vPVoRzNmtHLKENb9YA10Q9pU=;
        b=SqJzFD9Ug2mm3s9xCBXW+LEMGBE+Ym37HPolO1b3p8rPER21L+AU5RM40miN5R0csK
         CB04GwpJSeQbX+cJ2u3cTHZtfVFz9kR4VvkM+J1v3dGUCBGBPD1t7qCOVmBRkGlglSU5
         nKj724Z0auMAmEv3ZNxY666Xid+FPXKGeFoqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787891; x=1794392691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/UT8NoRwMXel4lMLf7vPVoRzNmtHLKENb9YA10Q9pU=;
        b=EAMp9vjMpBoYGzs3bsjYZX7hfYGXOIxKDd1eTq/7QZjBDbbyAn8F8Ok5yJYzN0gQ5y
         wE6qqxJSYnKDyFYa2R6r3T/N1JrVXy5yNRcFfsCMLJh3jevwqc+eofI9L1/B8QXAUfcn
         /Id+R8ajykik65I/wHZW3vWRSb5qBYkZlDdXnmt9rNcubkuOf29LmvofAf7Hlr2D12g8
         blrzZR9RHbLIgN758fBSzzwo27xui+oITtR3LeFkFE0HfyGTQ6yMi2QaBbM03QZdr9iq
         DSRHurUdHJl4PEdL0te9CvDGVEbkD6YtZK8DOED6hANKbK1hdcBYBZ7XqsLtF9X3JQtM
         XSbA==
X-Gm-Message-State: APuU4Z/Uj51pjy+SSw4breIcpFGdt6Am7SXfv7HaRacpbfpZw28V8Vz+
	evmeUOv3xgiTWNNk++F8Lp2WqU5Cx/KGyFZMMRxROHXkVbG9x52nfoiw2dEEo5ZlJy2FPCZaHkc
	p0RTH
X-Gm-Gg: AYBFou2B25dA9LjiifjZ1uFh6P5d74T0bnaWA5cacOxznA3V9FMKPAZNjgH4anPIAL8
	y/LB2481bjcs3TKMFvdX7ukllTdUWS9BemqpnzvGMp3w70ph2BbPckGzV0JkvPGlujssqW1h6WB
	oomPDf2Xzlo2PDvnq6v7CTemx2Po2BuPM4oIQSBs/pS03lNM9f6X4K+zIcccprwyZ6R0Ni8hwUj
	Wh+6BnRKiVY0fxrJlVJlfFkYr/jYD1XKisO8CpCXBxj1nrKWmoDxZuX0un7OJ14I5UlkO2NUzQw
	vCsBQZ5P6g/MyOd5tpUZj+RlBPDaChJvvmVSZt+caahzOjqoJ5+/R9rdEyIvzHQh5rQOHBpyz3u
	iryIsvvmQ8P2p2Hh8WXmfWorVY63O85SZJ92stmG9+YGvokoDuL0vd8zHGztdafvZaI+1LWjbZW
	OOq5N163O7OnSvFDRxlqhu+1YfFjY60jSOvkbJA749v+9/DUs3C7ffB0oKSSpeCLlOC7uavkMLC
	kSKE1MeE3OJAqzsaIdngNM5h8h0sQRYPDpG7kDMvBT40+/hIcfvl5YfNAGu3CLX9IZ9a5tC9xld
	vefGpFimuLAHYxvz/SievUvzmphJ1Hg6bVusyxZ1hFPO54QMucRFxu6DH9rTKmtQe2FipLj+ZHI
	cA0z9mZPHNn8GcTNXingPJlyRv5B3pCOwSkYvEVuK+9vJZfEtftb04A==
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4ac1275c26emr340176575e9.0.1793787890906;
        Wed, 04 Nov 2026 02:24:50 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b437864e3fsm41853705e9.0.2026.11.04.02.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:24:50 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] opensc: add PACKAGECONFIG for ctapi
Date: Wed,  4 Nov 2026 12:24:48 +0200
Message-ID: <20261104102448.3433828-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 10:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131841
Content-Type: text/plain; charset="utf-8"

Add a PACKAGECONFIG option for OpenSC's CT-API reader driver so it
can be enabled without modifying the recipe, e.g. from local.conf:

PACKAGECONFIG:pn-opensc = "ctapi"

Please note that OpenSC's configure allows only one reader driver:

Only one of --enable-pcsc, --enable-cryptotokenkit,
--enable-openct, --enable-ctapi can be specified!

So to use it, ctapi should replace the default pcsc rather than
being just added to it. Not enabled by default. Existing builds are
unaffected.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-support/opensc/opensc_0.27.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
index 70406513ad..1613dc3da6 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.27.1.bb
@@ -39,6 +39,7 @@ PACKAGECONFIG[openct] = "--enable-openct,--disable-openct,openct"
 PACKAGECONFIG[pcsc] = "--enable-pcsc,--disable-pcsc,pcsc-lite,pcsc-lite pcsc-lite-lib"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[notify] = "--enable-notify,--disable-notify,glib-2.0"
+PACKAGECONFIG[ctapi] = "--enable-ctapi,--disable-ctapi"
 
 FILES:${PN} += "\
     ${libdir}/opensc-pkcs11.so \
-- 
2.47.3

