Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40674.1793014745897315595
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 04:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BScAc1k3;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0a28a720aso25819357b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014745; x=1793619545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d3dD8NOD8CKEy9JV2WBx35Erf5MvDd7d9eamZPioVTE=;
        b=BScAc1k3ffQnMmJptieiXRTDo+JhjZDL6cNae/+ZgDIdFWH9kmCHbPRpKSPvnVoEYV
         oe2EFIx5HoVpNiLnb4G027uwiLEHqG2oOUULukx40B0m6MYH58ICcegqnbG2ZfjoNwIl
         uxMz/EH/Zsp+yYW738xTuyTJXpUQrkcrlyoVRnB18ZGfb7vE0s0wp/25gbmqNMOG+4gY
         NKRCtYWPndTH6S5xPZ1Xog/cjj7K+SyLnbSKg7NHd7B7tAUiefraqhI9ecn99fhu2UDY
         BkVrYNrtURdY2zt4aBKSG+u6aErB4lzh6G4sr1PivbXpLyE+H39NPN5ceakZgg2IbFhf
         Abfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014745; x=1793619545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3dD8NOD8CKEy9JV2WBx35Erf5MvDd7d9eamZPioVTE=;
        b=peEm6LueosSKbFlNoOwl1MmgxyU57zKD+Gd6L3ourX3f65w0WOCF5H9gNs0idu9YKP
         K+v5threQjXzZGWnIWfZl8CtIvdg2s+Gznd3reYH0eavXei6BFBPQc7o7OzmXDjPSv0h
         chzhkkNe4+NpicNIMUY9pOizipX/NQoTQ5pRI2inOMS+uZxbbYu7jEMpRQRW0q7Q/hcH
         wvj55dQVQ7ZyZI9Q46OMoX4UkdDo+unbSDZlXWmrZuVU2dDqMqBqQbQ4ZGZOadiznspw
         MbPMz+qGV4qCYybtCQhUq2POkVxop+exHKcgUFnYCgavwca4e1MXT/tJ0te9NZEKpjEz
         9jtQ==
X-Gm-Message-State: AFq9FYKm9Mjx1aGcngb1wPwtZTX/MwTIUYJCacqW3insccTra76gAA6k
	Kb5O2rnwbbNPldwaJv0VEVZOfRMrCFXNzCv7m2lliv7Fk3VR0zSvb9glwtX/LdUn
X-Gm-Gg: AYBFou1sV+DOyeAtcTfG3LL0++h+ZZw7pMpK7XxziBAnRE7w+5Rsc1UO8IWdWUuFrH2
	U2iK/3ura3ZZJPWjbqRYWQQm/x2fgqGpl25vF3X8kKei9kynqIb/JOgnu4LZg3eIIDMM09rthnD
	F5iEsjm4K6fiT9mnIVRmcitk6rm+gLfRefTwpbT0XYgp2Jpk2N2UU+heePvy8guNpRIo61pXhHK
	/ERFRHWh1wYTOnQFigvWtpSDCcDWPD1WRVFArOzsjns8zMZL8HmE51o/W3whXFNm8zpWHMwVT4K
	7mz8tnt5XjnjdnEmEPQ7yxfX+qQjgw1z6Z8dvormc66YK/EULF5RQ6JBFfrZ2GlgBoj43kxRuC7
	4O6H9Rg9dmGtFgTCNZxG6w3Gbx5FyY0SUhnwsTq49OwAybM2WCIgnbnMvws+A5CMxJjcMqCH3aB
	X/uKMKsR+H90ovNfeOXQIPBDLQ0YrQr23JK6C2yeo+i8A+klOTRghJbmvBIQI+XLqdJABDnkPQ5
	KLdoDnVw7VckOWn7uZJcRAIVCMkyIalpwtnHTtKqS5CK/r0zcjBr0u10POBcqNQ+yDSGQAx9xW7
	OpDJu3D0ox7Hiz9AUtXZjt15DCuJQtZBiUZwB5JQpm0r30RljewkcDmbLDaHV/gnDtxB+aU2HTa
	NTl0=
X-Received: by 2002:a05:690c:60c4:b0:8b0:f0cb:80d9 with SMTP id 00721157ae682-8b166bd6fb3mr38632067b3.29.1793014744655;
        Mon, 26 Oct 2026 04:39:04 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166dcf54esm28985747b3.10.2026.10.26.04.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:39:04 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][scarthgap][PATCH v2] brotli: upgrade 1.1.0 -> 1.1.1
Date: Mon, 26 Oct 2026 07:38:43 -0400
Message-ID: <20261026113843.15018-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 11:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131435
Content-Type: text/plain; charset="utf-8"

This is a security release

CVE-2026-111497: out-of-bounds write permits remote code execution

Changelog: https://github.com/google/brotli/releases/tag/v1.1.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../brotli/{brotli_1.1.0.bb => brotli_1.1.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/brotli/{brotli_1.1.0.bb => brotli_1.1.1.bb} (80%)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.1.1.bb
similarity index 80%
rename from meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.1.1.bb
index 32524094c6..2d87b63303 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.1.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.1.1.bb
@@ -6,8 +6,8 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
-SRCREV= "ed738e842d2fbdf2d6459e39267a633c4a9b2f5d"
+SRC_URI = "git://github.com/google/brotli.git;branch=v${@oe.utils.trim_version('${PV}')};protocol=https"
+SRCREV = "db0631dfea829194206d269bc7b25d0908cdb97d"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0

