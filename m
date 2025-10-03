Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91531CCA472
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 18:20:52 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.1270.1759515643087939756
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 11:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nCeOCdO3;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-28e7cd34047so24700125ad.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 11:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759515642; x=1760120442; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DkAN3lP/NCVQG7UvaQx5hfd49qjWxIeHchKY9+SqW+Q=;
        b=nCeOCdO3cgUJjMObtv/fLftmlflKbIfIA+ItZ4bvq+fGJ3K2fYGBJTVgD943TPCN3g
         5qhdDJnbVZ2ytM9kU0WAM8w9hQNGefreItj9c/7JmTeQHHNZRm4R/Eo/tRk/fsWj8jup
         vfZMisrRkqGNOzFJSR6iZrjuG4j/+00TAYQM8DCZUwlrlIlXXTV3iePzliJvdSGwzlzy
         cEaqjhfZYO8nbuBZE95d7ASIrPL9iXKesbPIP9P0xEaL/G7FHAeKkeqjS+JOIPP3ODmi
         wOuTnv0A8BNPQTthPvcCrXjBoLV1VEyBGkwDYZVYqpvMaj/ADS4rThojH0yE4kKQvrvv
         YC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759515642; x=1760120442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DkAN3lP/NCVQG7UvaQx5hfd49qjWxIeHchKY9+SqW+Q=;
        b=IFjb80duHwOKtt4D8ZWTY7z6G1TJ6ZhTtyVzBKZNDL0mw3I0wUbHNmG9Xtoxud0gfO
         nnf4zEmiRpN10ho1TpTBUYRLBCT3SPsUTOXCtpvguiPAp2AezS0cojs003GOuhemQNQQ
         hAivs+pN7DXar+R8Hb1O4ZSpvEQMZDHJNvoaAnMY3noAqwmnIrd2BiNjKeAFYeXfHBZ7
         4TgGL8ny3Vefr3Q2EVqSnZLt5hfWk8ooczOmAZ4cZBxz69kHm12dLj7Cg0KhQKcX8oTT
         1gmyhrqvaSybtLQubywS8Ocpki7SaPgPDez7XBH4hMiMmJVnn4NYoH/dNUQypcfaW1rL
         DPfQ==
X-Gm-Message-State: AOJu0YxCYS8mnVJJdHrl/SHP28L0bgqP++epTpsz7HXfWHfjH3tX4u3r
	8gNskB1FEfaAhheZkXQnkQnV/cYznktjzEnVNqItkBBE1TL9TDpTMqR5K8K/U66O
X-Gm-Gg: ASbGnctLyfXVf7K/UsiERX4cE6TGKcclHX6JUT2zRLLTe0Uwzn7QZ2Y0gat0mtB/UAx
	wUuACHiiVoko7+EGhLPLfZOOSisticfoND5nNYwh67ZI/VfA+q4LZ9sFUhR0hiqf2ayQrNqdXGs
	5WmknjK53nLeiMRo/dZ56gwQtFljAsAt7p1OstjcEF6Qm3wP4RXgtfsRxmLgElmXKxHVr/QbCp6
	L8+WAueXvvSo9fe8o7SaNMqGgS5NbsJe81OsqmAn46WK/lGu++AQP5R7PjhmHjQwXGPiGuLOwe8
	qxtCVDgRVCAS8hvN269VcdukbKBaK8KjcqFhdFo2girIhWo0ZPCnMMm6I/hf7qLLlNp4t48vqPs
	qJuIMcn+4Ht4Jeun9+2Ee5ShueNNhfLpiMoUfnKerQtu9XXvPw9YnVYdK54qmMixHVeu8lzmvuv
	lDCknSii2IkQiILVSVWgX+I2QVXMu3emEItYgqvDnsPT7nvPO/MyMMStAfPx5G6Vk=
X-Google-Smtp-Source: AGHT+IEQcmGXpaI3x+3Ou4Jg63pRkrtDYvpNTuSqoPj4HoRIFJ9WtYdEl/0xvh2VEfOkERXScanaeQ==
X-Received: by 2002:a17:902:e54c:b0:276:842a:f9a5 with SMTP id d9443c01a7336-28e9a633f8amr45333895ad.48.1759515642130;
        Fri, 03 Oct 2025 11:20:42 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d24fdsm56682385ad.93.2025.10.03.11.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 11:20:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] taisei: Upgrade to 1.4.4 release
Date: Fri,  3 Oct 2025 11:20:39 -0700
Message-ID: <20251003182040.113937-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 18:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120223

Stable release with fixes

Fixed the macOS build crashing on startup.
Fixed audio distortion when the audio device uses a sample rate other than 48 kHz.
Fixed the internal mixer_chunksize setting being ignored. This resulted in a larger audio buffer than intended, increasing latency.
Fixed some minor SDL3 migration issues, particularly in handling of IO errors.
Fixed mimalloc being built incorrectly as a subproject.
Debugging symbols for the official builds are now available as a separate download.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../taisei/{taisei_1.4.3.bb => taisei_1.4.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/{taisei_1.4.3.bb => taisei_1.4.4.bb} (96%)

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.3.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
similarity index 96%
rename from meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.3.bb
rename to meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
index 239237ceaf..e0d77b375e 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.3.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.4.bb
@@ -33,7 +33,7 @@ RDEPENDS_${PN} = "\
 "
 
 SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=https;tag=v${PV}"
-SRCREV = "02b7c71ae7d7a53202378e384f2cb26df9164f22"
+SRCREV = "6a484e6e61cc51a22a9943762dc2ff6883914f38"
 
 inherit features_check meson mime mime-xdg pkgconfig python3native
 

