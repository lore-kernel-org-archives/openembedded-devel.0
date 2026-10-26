Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39573.1793009947776813867
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ro+A5AnY;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so1962819a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009947; x=1793614747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rjv6WFBMQzG1BHncFUbXUizK8biVToiSEkCYlL2AO20=;
        b=Ro+A5AnYUbWBnbL+b+99W1U5G4Cl9EVhXsgXfkyDfz8JZeJRgEhlHFps9bXvJMWvZe
         U2w9QKCpEe0ap+Aymk1JZZT+GBZV/7epMkWpKOfZb47Lw3FEsOs21Xp5gK5ebhjrIwgR
         FRi1gnSlzdwjIfV4W/WiHjnojADfIMacsWqzosNLA+oFbQUaUsLsGz2oqksHO5O+DGyr
         gZgEFvpbDfN3UkIwhAxjugiE6rXVOhXE77GhRMkb2ChpAfoaayGP/p1UhgcF0U8ndAzF
         38vZP1zQm8HTqrU9Pzg+kXqWfJd21l2BmGc0OY2QabhR2otb2vlVIO9RhY4JALXSeIq2
         ow/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009947; x=1793614747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rjv6WFBMQzG1BHncFUbXUizK8biVToiSEkCYlL2AO20=;
        b=Pc3ZA7DqBThZJsCM95ZPLRU28tcRT2tnY07iWHoXETwPeoLYRTD53sJPZOZ7O6fVAJ
         uKdZqVeE4VKVOR6cjpvmesBSk6DaB66xnDl6v9eqxZq/OhjMbOZj2g0Is0M2sdrP0GSX
         Vnj5pwWZvcwpT9pOijZ1aojY/J4IOsp4ZCoOu3H9IuUUiV5d9WW2ZPaCZr8zI038PQUz
         GUSRGkTOGTB7N5o0ZiQPQCmucNVCV+xR8cAo2udXMTbTXbBAo+j60j1c63wnoI+2uBtP
         fKfdiU1HxJ2NHYWAdEyFXnWQqvo/xvH/lN/fw0WiCkdUwF1IYli/Imu39FafBfRp+m6u
         DnBA==
X-Gm-Message-State: AFq9FYJ9e8ESWKnKXFZ3BHv5l5WQt6L9FW3Q5EA73r1FvmpHsjajyDa4
	YARyejjvq+KrfK1nwBDiVsL2G8Uy5h9Doag41ICNHcckxkgvaAbMFzs9BFqQrA==
X-Gm-Gg: AYBFou3zwQfxDh54fuHfyqY8B0MXPQE4Res/6EDyasvgS3DRFcAoknjzeRJH1cvdUZX
	+A0OApWfIlGeVRFwJI55kf7+/jYxsmVHuMMS3fNwoAXgXWTTmxa+eL+4sg2Z+xDlDSPnvf/GaYX
	wdTNpCnZMEAXtpcqzIgTroutI+Dp07gj0ixURW+bteSxAHB1c1jCIQ4X7+NYYecg1O5kOohRnp7
	OuXLRFUlT35/D/qrTWCwIj09oZUspcnr/3mbNV3sNNzZQonhiNa+T6yf0nMi5YqEjN6dGf9Rq4R
	wUHaXUvVP1JZasHLXmrj1MlJKem9SEGuL3hPIzVTZEi7eotdjAYO3tmhDF6iZFTTfd5QTsn7Jtf
	1yDyj8yWS7y5BC/2nY5UIg3DyQIYj9hYmfbvsANmrvkAZzCfXi1Ul6d0+gA1IZigcyXriU0MBO9
	yNI/v+7+EcS7Ec/c1Y2PMrt/WA7aiHkLEXmTparnnnql8h15/4hzpk+PwQWwBdXYDiQkfESfCq1
	mVllGuEBFV6aQ6p8WxgTKhWGFLLtTWZqcDakGj9NaHFvh1crKVGHVnVNUZEqCTuHrXAMO1SWju+
	b/UDYojPr4qDz+RJZgJoaVfYqeBqQ2k=
X-Received: by 2002:a17:90b:37ce:b0:3a4:adea:50ad with SMTP id 98e67ed59e1d1-3adeae8b8demr5326696a91.27.1793009946973;
        Mon, 26 Oct 2026 03:19:06 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc4648dsm1383583a12.14.2026.10.26.03.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:19:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 2/10] unbound: upgrade 1.26.1 -> 1.26.2
Date: Mon, 26 Oct 2026 23:18:42 +1300
Message-ID: <20261026101850.1470035-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
References: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131424
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://github.com/NLnetLabs/unbound/releases/tag/release-1.26.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/{unbound_1.26.1.bb => unbound_1.26.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.26.1.bb => unbound_1.26.2.bb} (98%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.26.1.bb b/meta-networking/recipes-support/unbound/unbound_1.26.2.bb
similarity index 98%
rename from meta-networking/recipes-support/unbound/unbound_1.26.1.bb
rename to meta-networking/recipes-support/unbound/unbound_1.26.2.bb
index f426ce351e..8894a59d07 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.26.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.26.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://run-ptest \
            "
 
-SRCREV = "13b6717f1716810523ffb60f971a6c9c5e8ce127"
+SRCREV = "f0cd7067d950921427c91ade4ecf060e944f88eb"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 
