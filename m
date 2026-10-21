Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7498.1792574960514205059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fw6djZ8Y;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so997080eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574960; x=1793179760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTjVlb+otFRnQCorDsRBLqqwQiAElB9jBQmGoR879kA=;
        b=fw6djZ8YxJy4jTdYNOA5wVdFKjgrMiZX4XzAZW8abjSiD1grZvvet3tynPLf/RMaFx
         Mie7zjCJPpbYFNH9YjXLc9rcYZqzReLQtOGJsO6r/nLCyKcEW8Xcf6dnDUQkFyZmLtis
         /GBwV+FvPvjZZUQqR6LaBVp6DlxoMj6CVl9tKmqc7jc9wrxpT7ukWr6JYUz4xzGFIIov
         csx+/Hr2jsbvsp1EKgoEUU/QlXKA+JpAEzCNWFeIlj6OYXNvlK/6PEtTsHrEo4/zHXin
         IiYpN8GOjoGNMha6nz/3IWJYuXo5xgsw70TuvXKoCavnyJy/Od3B2EO1J6vprvZskQD7
         AJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574960; x=1793179760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTjVlb+otFRnQCorDsRBLqqwQiAElB9jBQmGoR879kA=;
        b=YmRtvl5tOzwDeU6e3VNXTQRSytBFOVtDP/JwWiUrrHocB9zdCV4qBAvi3P0KecHw9Z
         G+K7mdAH3ZtQXvjDpx4mgojkgsiO/iw9ngAKuQFMMDAYow0zuF8PRbv6r1ZIln8C3ikI
         KG3aJXNfB7ceyyyjjhIeyc0Fu+n3dBdevGJmF5vWjSTX5JzZ4Vq8wo/j/HEEigWIApVx
         b/UzolBvZf0fk67x01s71r0oIbyNF+z0Ff5rkM1FRZWQ4QFNpE8aoKdP4TzHVSdTvQ3i
         MOJTp7JYpnHb1rmtyeKDhjb4fRrvi3exu+1Gp8Sp+tHGan/xK4L2MB37vY/CWHi/fQcI
         n62w==
X-Gm-Message-State: AFq9FYIy1xVk9G4o+oJbAQJABPxDJWfg4yqmUYmRAGr8atwXuYR9i83T
	a2YcrroeGlND1okqlhVny/t4G5n+VuhftdZ7iQnDDfLTyUD2HWErWBjTpwcbGw==
X-Gm-Gg: AYBFou2a2rzVMy+7uaRDO+0K7qU/xGqRefgsM8hbqi2bYLrLfDSfXKEQ9Lbeyln74DY
	ymAqamVuVKMFcPlsC5ZAjwkwaramGyQce/e0tYt63CIJT4Q1InEb1JW+rgBL8yLxKCaHUqQOE1s
	Yyjy2Z1jCVi65srZIdd++ki97NfZ9+bKsAHbHs6UJ7BZz2rnL06UTISCAwuYlK2TFET8aBF44Dj
	OvxDxA8g9FiIB6LR7qi6c6XqGJywLkBaPUdSWC97bBAwnsD59wvSzaw1Ltujkz54tE+CqEX3JgE
	PFz6zIwT5a8WIM/lkczTSJD5WF6uaUxnbt1DpBi5AmRriwyX79HdFG7svaWNFXV1pWWTC8KeGL+
	Qu4TmGsJTSlQgsnYl2qXbvKhDjw2zhheqQN46Og/ku3OGwvkXZPaf0dMkZ4d+TyfGVukPNledAd
	QnSwtlr9bLfSzAcEiqCadGp8aqsRqDpA41f+G8jTZJeGEE6oWYOtJqvGxwqjBiPhG+ufSwRRaT4
	B8Z9jjFGTEk2aw7lAiMGOItxK68zVjMAflQmTuUGIS34wj22+u1GnadEoHYieP3ImAeII3oR7eq
	gZb/3vwe9jQzDwmfPSElSW8QMa1kdXWKBj9wQ+lGduUlXSB5hnyt
X-Received: by 2002:a05:7022:438d:b0:143:6525:f9f6 with SMTP id a92af1059eb24-190a437d59bmr2755513c88.13.1792574959638;
        Wed, 21 Oct 2026 02:29:19 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][blacksail][PATCH 7/44] swagger-ui: upgrade 5.33.1 -> 5.33.2
Date: Wed, 21 Oct 2026 22:28:20 +1300
Message-ID: <20261021092857.3585453-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131194
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.33.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.33.1.bb => swagger-ui_5.33.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.1.bb => swagger-ui_5.33.2.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
index db2bb498a8..aeee9e4da6 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "cac3d136b5e37bfbe3288c8591f6f4fcf9870599"
+SRCREV = "e89a91f13cdee432d97ca9d3d1ac1969ff797036"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 
