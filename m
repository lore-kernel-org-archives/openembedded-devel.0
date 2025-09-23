Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58019CAC5B6
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:06:51 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.14125.1758625608385257407
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MNVEfUUS;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b29e8a3e453so381790166b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758625607; x=1759230407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qs8mkw9bY6StpNjPljlXWjaY8dfxtRQq4xs1B4PI6c=;
        b=MNVEfUUSTheDW2al3QafwLWaF/1dfdXo7pBJ1QaqVVjuZdHe3GO40Vr+GibONMsRLC
         zEPo7Didi7g+Y9m9+219pGEisWEVU8WopsP9JoLKOGTXVNewORp8rSOm2tW7TuE4gkJd
         NhJj3LWsXfUJrEzLh0i/Ce1EvRXzRFXVhW4pBYb/HJF9F3SbW8fGHnBBl3WnwW4M8nSw
         Y+V7C7LW2d+1FKoDQsK6rCHPyHrQFLwQyvkxCsfWIwqDI6kFJn/o0U3VCBNyzKDDI3D7
         tBMZdbwoGda79+6U4CVTQxd49oI9ErVb8jj0KdRY+K3lHdFY5QakOptD/lt1yGzkps2z
         9WCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758625607; x=1759230407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0qs8mkw9bY6StpNjPljlXWjaY8dfxtRQq4xs1B4PI6c=;
        b=LTBXh2aYM3UCpgAcXkwcZ0BZVvz7GhSoO5QTYBB4x0aCZoJH/gaLp5EZycBOEFotz/
         fEqX8IMFA4sJTYuD+2MZkbsKqifRgb1OSjy+NM/tHwuHBHNA9k4TVPTrw4xiZfq+FR6P
         cB6I2miR9E+YOAtw2Z5x7WSKa7X7onAVGbAEiGQQqE78XJBxtjPNCqtPejj6cNg5aw7O
         fvaFrNVnczrPotUVaTOqCqnVIZs3ayZ+I5FGycJCflfC7k/1YMh0pptgwHyDCAINeU84
         t6kM1krC1O7Om9tUE31eOIG9HEZKfM+Ggz+HCHX4OwcxS52gstERJMkDvzAQnyGED2n1
         pYxA==
X-Gm-Message-State: AOJu0YwtUDrJM1nHm4XyVPSYCN4gQ7n63MWOLEItE11YTGhUC06Og/nF
	AjTd+vZSTSTtSVrdJbbHBHNyp5As6dMUBO/ZQ8vvd2JMMlNrS5vPYxaINAou5g==
X-Gm-Gg: ASbGncu1mB/WGXkswwVL5Pm7241fIJeXsjCU0+C0aPFB/ZFhEYOqXqsaJ1MJOO93IZw
	2tS4+z2p8LVgUi1MRKh0/NCO+DpyMS9ac2cJv5VnVZ3iXAzvzazSbOCF4NZOJbP0oUMuvBz+mZN
	Rx6FxMQO+abYoC0MyYY74GbvMm7KMbREjH5oWg2jGH4Drve5/eDwEemeiQy/wAxx5KSyZhaWNpd
	ljwI0Jw/zxQQjyd0/Bfx7XAdQonvoJQ5+gV8y1FcDye/b7so4rK4jCUe2ydn/ML444/vn69k2x5
	ecb1WQlB5kqrLZLID8oFFBZ6HVUIxkaOoK2kto+8JoOqozUGBLYbrhjSsYQDf9kZaEYyUCN5B1+
	wZFRpmBnvwF6/n/NUYOVD
X-Google-Smtp-Source: AGHT+IF1RyyAYmwvON/zUj/z5JFzNHH/tdShEw/IN6LG71hx5QFhuHDShCEJNXca/Olq6l2aXQ96Yg==
X-Received: by 2002:a17:907:9287:b0:b07:653d:56a8 with SMTP id a640c23a62f3a-b302689488dmr212323866b.5.1758625606561;
        Tue, 23 Sep 2025 04:06:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b293fa07816sm709263166b.50.2025.09.23.04.06.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:06:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 14/22] gnome-bluetooth: upgrade 42.2 -> 42.3
Date: Tue, 23 Sep 2025 13:06:28 +0200
Message-ID: <20250923110636.3413021-15-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923110636.3413021-1-skandigraun@gmail.com>
References: <20250923110636.3413021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119678

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 08304fa543b081f0ac36a175cd8d3afcac510c0c)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{gnome-bluetooth_42.2.bb => gnome-bluetooth_42.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-bluetooth/{gnome-bluetooth_42.2.bb => gnome-bluetooth_42.3.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb
rename to meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb
index df0c33ca9b..7bb8500206 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.3.bb
@@ -26,7 +26,7 @@ inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "8ce8ecfab28272db1830a63f08f9ccb5304734d1be2dbfce795fe4029e629f0c"
+SRC_URI[archive.sha256sum] = "c37a2a07f77d4816b261e6c2086a056ed9767c3881dfabc826f4f82f6e1aa302"
 
 BT_PULSE_PACKS = " \
     pulseaudio-lib-bluez5-util \

