Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.458.1795102824334145085
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MTZbzpqP;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dee593f18so2388418f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 07:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795102822; x=1795707622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVayKdMi9FFHlfilt7xwlQXczpvX91/ZD0JkBYrzcs8=;
        b=MTZbzpqPpiQC5mDfqT4aqxlaKZfk7q9cXNSFlN1t4KSKraAKUKBhMn9V8r02DxYuJf
         RW6Q5JpExNZfDBCAV7+vH39ug38a+5uR4o606GY208LEgOVS7N/7RVHANcUneZB+o5aU
         ULfVj6SvbWZPCAscywnBmRmlyqrHvVU8+YJqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102822; x=1795707622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVayKdMi9FFHlfilt7xwlQXczpvX91/ZD0JkBYrzcs8=;
        b=TzafXWOsjdz5sPkf0eJYgQZfIs2lruCUD1r59XWVnYhZ6tJuO5FY7UCfEZ8m29wTUV
         vTbUTVwpdC6wE72SeMii3cHlJ4adMxdEaBiDh4d2ZWMzIqD6eemFIWZnntqJXCW29Czq
         qaMyOTN4dgm6G+xdVr4nyiID943hfbl7ZueeHTAJ1i/EwLvpZE6RoOtbeRE7G+VvheaY
         H7JvsnrUfQkgkyz4yRE9bkFLIrieJVHrk1VkV4cBWifRUdlw7ySi5gtobZcjGJCQMzrB
         mNUsrJWDAo6ZOG4tW8XY4L8+Bs0cUB/bT/gfJnM2Nuht4WU9QfYnzMt1O+exL5atu7oB
         QWyA==
X-Gm-Message-State: APuU4Z9tdr0llk/d9GbA1S/VnNcx2ZNMMCBrlX1UMWPVvGdL2PDev55h
	DAx1C2LQD/k6bXb4fkpkZJSPMMaLd4ZjWcbZ22yGRG0QZvgIzuq4xTb+Xt2lufN1ulcD6k6n2hn
	s3W+D
X-Gm-Gg: AZFdTZe2SdHpTW8OY1/lyLhrXQVAWrxZS/eo+7pDqasxg+Vb4j50Ox52viXlCMZ7Xg1
	NqF6/nojsHQkx2cUjQIIEaeFUoG2V1UTTxU950eALbC+IyyhS2xedt7sgkMLat7GiAOLnDZxRCy
	eSiGw8SzIAEhKaZzk7TIh+IW43GN2Kew9G3ia5I0c5gaqeB5HjnPDp/ZsMweWz0o8jvTI5uurBe
	8XbPXwtbqhaZi+94caun3vPGjHUrnN3aH7oQJrMoCbQmVU9l/IYu8jEg3aG3xNRo33q9SPrIWwq
	60J6+QwoVOo07zN/kaIxg5Rhqih9FEDLvU4So3Mg8icOWTxI9Nta1JqJ4ThVT7UvG0qA90giUYc
	/G8N0Sy9+OmOL6503n+KT8Ktktu3AdUdjeM7kbERbWPBPGvjy3wIA3LKAVcRNWdpPHA03SIpEvB
	dUK2P2RfhOuQfbi2mUzvBiGOwVL7xqUIguTy375KDLNWmpEhcBxgNtix0/TJLZQwm4usTlrlunD
	upqevGYrAv6m5zUVFJ1o/DRUvnlHnJJIgWMwz878AIELD1+utOWsOSkAvYYPCrWkJTMCTBOilmk
	0f1h8lahy1ApktuaTnaFK9XpFwCUQ1O/PlfR0xNwp+NKcXEeDlVkT/q2S78EaMkp1smB6ppXimC
	gwuIkS0WT1VrbTM3UePvJdP12G27zr1/wcfXvxpYXbADz4hxnwDYvrQ==
X-Received: by 2002:a05:6000:4102:b0:48e:3bc4:a367 with SMTP id ffacd0b85a97d-4a639ff61aemr11581265f8f.33.1795102822545;
        Thu, 19 Nov 2026 07:40:22 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm225495f8f.52.2026.11.19.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:40:22 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/11] python3-grpcio-reflection: Upgrade 1.85.1 -> 1.85.3
Date: Thu, 19 Nov 2026 17:40:07 +0200
Message-ID: <20261119154014.1039002-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119154014.1039002-1-leon.anavi@konsulko.com>
References: <20261119154014.1039002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 15:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132682
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.85.3:

- Fixed a deadlock that could freeze the entire Python process when
  closing a channel (synchronous API) while gRPC's background
  threads were running Python callbacks (for example, call
  credentials plugins).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...reflection_1.85.1.bb => python3-grpcio-reflection_1.85.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.85.1.bb => python3-grpcio-reflection_1.85.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.3.bb
index 2ddfdca5d4..4acfacf01f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.85.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fe8c552b7748e45c00ac55ac0257f6c9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a3257f35cc817e372cfe330ba3411fc0c61f23b09a94dd2d8f91185955c5533c"
+SRC_URI[sha256sum] = "12433efd1fb76a2c34611843763330f43c26167419209a55a0383f6a85457e5a"
 
 DEPENDS += "python3-grpcio python3-wheel-native"
 
-- 
2.47.3

