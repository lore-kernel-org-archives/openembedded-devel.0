Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74F5FE7DF03
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 16:37:19 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57421.1770050238903657854
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 08:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FePasm2+;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so34365025e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 08:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050237; x=1770655037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHHhhzYZgameLcJAFMBUJziV9geO6jEeMnOcLLVesAE=;
        b=FePasm2+R5h0tzTnxSXGc610ESPhDsc8jeECgtJWaEOqv/ccN/o35C6X4gZBeGjZu1
         vPTwz8flTy4RgSvld9qTRlGdrBO4XPgL6ZRF0lHXxYB/oCzR82pE/yJCtcgwUM8eapEX
         3N29zjtxjFt3PsYyBc2if8USwFQxMkkrGmiotmnTv5EwsKfJ2L7aymbs5rvdptmJ37T6
         FGwN/VkJLBUMnGRetQsgGUTYrTmfndyCmg4/T8Am/zgixTe7WrlG3qj2uFzsDme7p+gm
         pL7Hz5E3RudJu+yafhEnOANFu2ePVuvOnHuRa51MsBr8iCQZu5gwTM4h9QpQbeQrBSem
         NADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050237; x=1770655037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wHHhhzYZgameLcJAFMBUJziV9geO6jEeMnOcLLVesAE=;
        b=EzizpC+ty7EI3Anpv+HhshkMxaOcjU38amBAXJ/J6tZ4/fuWxQ1yLSBRmD2pUIYfrg
         t4oc3zwSjAbO0B/cjZdFOwLSlduVG4s4eRBE/4hoB8cGnDgSDd1bbVx18CO8nbDWRiZM
         goJHta9FF4T9aJ6/4g/M3FcXlIO1R0LO4Ws92J9cn377/bbNvrSvTtdhhso+iFagixnU
         +CEJ0SOmChK/yeZAe+MTMpgWu7i77fr5Q2fohomA3V+Cz3zwYWcItaogNgvBznyp0C7y
         6CO9fihlhwwXSzq89T0e0fomVda6icAe5Xk7RiOHITSSS7Te/MY4PaJ9ZGEF2dEwaeTj
         onFw==
X-Gm-Message-State: AOJu0Yyr6A3zkCXe05pDrMBBf62/JgvyIa/ZZZUe1vOGZYOxTy+5v6Gc
	dcoM2bG8F+dnedbwkMufKLgdwwl5swo/9vJrbYLK1I5ge4lR7M1OxtvNZFfg5w==
X-Gm-Gg: AZuq6aJ6YICvyVlUt/OBqA4U5LfUi64pC4iZwxPVz9chlqFDAB0fz2H3QrFC1ZbR4YO
	DDLmbmXEbMWm8EyvIcC2atacwksL+bVDRb0M9h2bTPFtrLALemmhT+7QhznfESIWNKepFY+XAg7
	zZZ8rNtjEYaOfg9QxQp/boxvlmX+W0mh8RB2YSmgfjWPJhvZETVPYsDyguY9DxGoVTW29K63ozu
	q0szmOddvDeuK2MRYn5iYvDrVfm82oS0mYDTjoKKsIaAkgbhpuDeZgVw2+jESNF1DFxJzIMT6cG
	KjfwTF2jf8E68IFT8oxto3GNXa6ODroMGzHchNYBCpzJLnylvTU6grLoxrQfuIbwI4fBXIrrmHQ
	MDRZNgpn2dOXpOirtMv5qwXY/0HlVC4QIDX+vISBb6GnXQzHvHQWX/MSeBwPORYO88bIRULeBSR
	tcwGywEB5rju36DjTZbiA=
X-Received: by 2002:a05:600c:6214:b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-482db4973c7mr148016175e9.37.1770050237082;
        Mon, 02 Feb 2026 08:37:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051372cdsm451395e9.13.2026.02.02.08.37.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:37:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/9] libcdio: upgrade 2.2.0 -> 2.3.0
Date: Mon,  2 Feb 2026 17:37:08 +0100
Message-ID: <20260202163714.2359370-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202163714.2359370-1-skandigraun@gmail.com>
References: <20260202163714.2359370-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 16:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124064

Includes fix for CVE-2024-36600

Changelog: https://github.com/libcdio/libcdio/releases/tag/2.3.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libcdio/{libcdio_2.2.0.bb => libcdio_2.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libcdio/{libcdio_2.2.0.bb => libcdio_2.3.0.bb} (92%)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
similarity index 92%
rename from meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb
rename to meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
index c443d9b891..11e84c6505 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_2.2.0.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_2.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.bz2"
 
-SRC_URI[sha256sum] = "6f8fbdf4d189cf63f2a7a1549c516cd720c7b222c7aaadbc924a26e745a48539"
+SRC_URI[sha256sum] = "53e83d284667535a767fd2d31edad1a6701591960459df373a10f1f21e80a7ed"
 
 inherit autotools pkgconfig github-releases
 

