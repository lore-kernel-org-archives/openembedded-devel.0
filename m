Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2F2CD4F4B
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:21:15 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17734.1763014874069278440
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ar3uwLbq;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso450502b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014873; x=1763619673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6+Utl5nCiNObSPBkMyF9PjkFzRflKUejAJKfTR6yOc=;
        b=Ar3uwLbqAiGTvlRva7JNXXY5iZ1x3ea1w7wzsX3/GMtufae6sAenAFfanMx77EhEv1
         KsBvPyGLJM85eHVx0vS69BADom72Q/iTk0pY3Idvt9ozDVHLVixKyO4jDBUmdr0J3W7W
         kZvs4/dey2A1f1KQJrPpBYAQ2eyFHMkrP9reMZYFjc/jq3ZT8jadqrowxeuE/I5gh1ue
         iNBlvs5RdcUPiWEqDyGETLOo2sZO4aaEuUZSksjjQvh5Ick9v2Rq881FVudvirnUUG6/
         RT5a01DG6pUS9aWeYHDQodBcrt3y06QnHOWGS6X5n6D8Z44dmnjRX40dSskVNMYqSNPl
         FoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014873; x=1763619673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t6+Utl5nCiNObSPBkMyF9PjkFzRflKUejAJKfTR6yOc=;
        b=h3ydpWPGWYy+ExADZAyidjlQw54z8/0Aju95xRWQzqgqoMfUBqsl0MyQ9JJsnyt6m+
         dbJ++oKU2CmlRwTORGO/KeXKErLeTSs9qxnbG1F/Rw1poKJIJhqDbwOrOV45XJG+IsxF
         b4+3NK3Px94S2zQ+gcpWfe09mD196WHBJY5jjrEdY1mrvP2fqrH7giXsVFoIzm7recF3
         4wHORYYlUqeGwkQl0U8lKaE7eoFmKjbLdW/2F7yrxEzJ+DjIedo5UoNSWRoWC14sxsa4
         C0oxmoNDEaKVHI78T0L6XiQ0EONWk45KlQ2/l154JR27B0Znh3+Zq8tMMQz2YAgmXfpT
         nXSg==
X-Gm-Message-State: AOJu0YyTkN+OaWkr4NEWWmoZUMxYUTjMMrJeueBGXMDcF1fvjdYI8JeV
	TVw0UM3/otmAqRZspg48cwK245KFQ0UmvlR9u7ltSNLxOLt24oILsabFqQjTOQ==
X-Gm-Gg: ASbGncucP3PBo/BAyxi/S9WzCulwtuDTm0FKPPXL9UymtPSoAO6v8GHe/YmIE5bWqXk
	rP1fx5zp1PqS4YUs/9KHDdkoUL4qXFMVpxzKkbTeI1n4i5FTVdFJuijg6BexIr3zn6PnW1HpQEq
	0ALq99Gnj+/UBl09SOyUA/x+grFdniojp7+twaNnz3tMOtWlsHQzWPGT7in4MBljOLozM0DkAl2
	xgp+3dx7aG7A8PU75roq8VRU8N3fowoemwYrfu8L7+eOvjnNoMb5CqB240wlgsyWd6k1xRKW9il
	j5OckpSHGaDL77YCWNJye6v4EUchy/UM/7wWl/Ik3Te1a9TlLb9EYvQ0SomYzH53YxTemWxqMgw
	U9b5MccMQZRvNHk0FIlJQxiH8dfs1Z9MrhUxG6efnMxSBX/R229yPF8BlPTKxsCidolySNMO4ga
	oNvjLTRu9Sv1d3xw==
X-Google-Smtp-Source: AGHT+IH0qEStbEtkYq9PZ9GNB0pmXShpNrVEQJsb0Qs7mcBYZabid1AaYiDzcF8bP/wKUj3uzmMujQ==
X-Received: by 2002:a05:6a00:2e08:b0:7a2:70c5:f74f with SMTP id d2e1a72fcca58-7b7a50d0ec2mr8256675b3a.32.1763014873313;
        Wed, 12 Nov 2025 22:21:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:21:12 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 36/38] cryptsetup: upgrade 2.7.3 -> 2.7.4
Date: Thu, 13 Nov 2025 19:19:11 +1300
Message-ID: <20251113061914.3756301-36-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121634

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a403ed1c3e852fddc29bf102e92f934677420648)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cryptsetup/{cryptsetup_2.7.3.bb => cryptsetup_2.7.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.7.3.bb => cryptsetup_2.7.4.bb} (98%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb
similarity index 98%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb
index 7c83fec439..a57d79d6f7 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.4.bb
@@ -20,7 +20,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 LDFLAGS:append:libc-musl = " -largp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "b772ae4f6df0cee7200b28cea960e4daaff2a203d2fd502beab3c1317b07a456"
+SRC_URI[sha256sum] = "dce29903a58f7b774fe61191e7e6de955de0f40d9e27b0028ffcf3438c0e9480"
 
 inherit autotools gettext pkgconfig
 

