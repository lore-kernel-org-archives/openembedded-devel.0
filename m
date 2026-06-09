Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534A1CD8CB9
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:17 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81022.1781014876017994235
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RGfUyk6r;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-304e83724bfso6826594eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014875; x=1781619675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xx2Fj+ji5Y1UuGw1lWEj9YNLhnrCw9IziBuNAEk2hMw=;
        b=RGfUyk6rBJd3HRCom8ZHF3KsM9cBADIC70O8pUuruJUSsqmkhZVTrnQQFiZQpaQe/m
         Dru+nesikm7p6Hmf9kGaR+Hf7Jg8EPwAyCUntQoLOcTPf/mooj5bNIfN0RzYaSlajU8r
         9P5QbqDyhD8mclnT5tT4g33dI0qnLYNyY2VECHLxUfNs4/BiOkQTZsajV3Aq2DkQCWSN
         11/P99tOkqiVYyCoOri4qT4ntq6ve7zot1QXynDBY182rCISBj/ffwNaBkLt5IgvC0CP
         QVzaBWhIzDeCsBdUBsjhWSIRwIHYFkiXWX+5ZfGi10a0MlXdSvQVUXexAz3S1WiRgUyA
         Bi4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014875; x=1781619675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xx2Fj+ji5Y1UuGw1lWEj9YNLhnrCw9IziBuNAEk2hMw=;
        b=Re3RUu/HbnZ7JP6G+PRS50GIfouQa1olj+QEU1PB8eZPa4FEMXpptjQdxl7ZgPrElh
         tcx2du4mBmVxcQSm9c16i3jylnXMvYcaccMTTs940RpFpcBV4t+BSyxEV0w3ArRwNDOX
         +lf2FmndkeeZZ/steYuAvoutPLmdCbCT/nXDSmrVuHZtdlE4lqRWmoU8lU8S3KXOjIT8
         bSSvO/0LrOv32UIC5H894CFNUMaLaYmY4tDSpiC1rYhFgp6earETqo65bUBn9xFwpxrz
         nLVfFjzbYDvhjSWbrAzLUFJa69WWELMeT1H2xw5n2OQ4ACjAHdllwX2TZli66RX7YNG0
         Y03A==
X-Gm-Message-State: AOJu0YxPCCZ4rFznvhA6kZfxkXnk7FDpq5BURq5acr6qwYHn7rb5q03O
	aJvfK0TgDnLiryO/sE1paHdth5Mgq+ypJnhXVQrXRRjf9CwblDtibpgwzOLMegXot9BcSw==
X-Gm-Gg: Acq92OFOO6U0iwfvBFrRHr7lIKFXdyt2TC75Fd4Jf+9GPcVpYgnsjEpRtTtNkCrHDPr
	GGXaOUVg39XRS7q9+Tpuk8k3m+fkVlWkLKao++gSV8Aoi38WjXTefmDN+O4yHkdvD6VYk6kL+iV
	VxZdRy08hzdxo5uq2D+eOp62d1/OOC8jXGP1vJ1srHrorwbYAhCuEbpVtdzdyBI3hQUKnOIo9Y5
	Ky3z/sZYRlKh6kHGJNmU1Yp3n2Vp8c5s0qRGvVwlmg7Y5/cl5111vbFKcOS8ieCujAhKIcCCWyb
	H9e4/coXLFNi2InIRCmOHX5FYGE/23gy5Uf/a59UYIsl+thDrJJYR1u2PEURnedSd5uO9KPUAlW
	phkzdUqpTCZujzyVWqo13E1bxH4bIgS7gckf/KQZtQLi/CPdLfCxD7Q2Xx0c4y+S9vhEFx47H1X
	W9nH3QVS/jCxlhzhlDRlORcs0PgFh7hRn4PDHh8OAToJxOiFH6r9LSKfO6OIUYK4N0PL0uiK8lA
	UAnoJlCHmh3ow2pxHD2Hi3K1CbshdVyV1gddOYSRaFkE5siq/gQch/YbeHDIe2qO78bTWzU+5NT
	sk8ABC1d7v5cpg8p2hyoYY2StvO3N7uxBzKHadk5pUqHlouxnIo=
X-Received: by 2002:a05:693c:69d9:b0:304:dfb2:2274 with SMTP id 5a478bee46e88-3077b782a7dmr7769113eec.28.1781014875295;
        Tue, 09 Jun 2026 07:21:15 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm27099386eec.23.2026.06.09.07.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:21:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 07/11] font-cursor-misc: upgrade 1.0.3 -> 1.0.4
Date: Tue,  9 Jun 2026 07:21:01 -0700
Message-ID: <20260609142105.1439225-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
References: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127494

Upstream now ships the release as .tar.xz (no .tar.bz2), so set
SRC_URI_EXT accordingly. The COPYING license checksum is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{font-cursor-misc_1.0.3.bb => font-cursor-misc_1.0.4.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-font/{font-cursor-misc_1.0.3.bb => font-cursor-misc_1.0.4.bb} (81%)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.4.bb
similarity index 81%
rename from meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
rename to meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.4.bb
index 787541d3b3..9ac3c19e0b 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.4.bb
@@ -13,4 +13,5 @@ inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"

-SRC_URI[sha256sum] = "17363eb35eece2e08144da5f060c70103b59d0972b4f4d77fd84c9a7a2dba635"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "25d9c9595013cb8ca08420509993a6434c917e53ca1fec3f63acd45a19d4f982"

