Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.21052.1610905010858980116
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ctB1OvNP;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 30so9474976pgr.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=keMUm3G9ojcu084/k1TDSbX9dabsqDZ+n7XETgqsq4E=;
        b=ctB1OvNPwimJ4NAuY/Nuj6+XswPBYziMCZ3cOD/HSf3Mk3y7u8SoEZsaFgkbltrdHT
         1TaNDKVGuAbWrsKnNq030YpBVqwaq63OnFGBnAlocsgJGxj3Qew+BLnS/xlU/KN78KJk
         O6M5NHblXNYyqRCvPzitz9j+ZqyHDmZ5I9ZHzh6WHeueWoDHrlo8EFSfcnRSYS04YpUL
         LsmCCFAlwbqJYEIlvjZynsTu1/xF2YmNcFAiiV/a7eidvypVhkvLJskfheyoQNxlh6Zf
         8lRItAnbYi1ba/Aa15u3/UjIUnvwRBznFHaREWwNvFzl+v8zN4yDaSQ2gEHI5EUxoRCC
         DBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=keMUm3G9ojcu084/k1TDSbX9dabsqDZ+n7XETgqsq4E=;
        b=d33hRlfswN8GvpnTJOWyoFSMC8KeCE27dyVVCFAveM2ypz4O110XTqzBclr4brKprr
         vpwBXgKsP/Doejfpa5VwcnzC1NJ4mGqKSM3DchDteWkymgZdDwVPFcrmm5Eck7Of8LBU
         PCMWnUECD4K0sF1CBYVholdTecMGkZMoztgzsQ645kguVKP+IK4SUDbKNhtfxmZirxNa
         XGaMjXUf/V5aioALTAQ3aV54ovle3BA451YjJlQq+hBuXASxEMzd5sDtsvv3R3Tjktn2
         uZX6nVeeLzPlAcMzztc6aYcvQtlkcvdEsqL2HDro3Fs58sjkaufEWzZJyvXRX8+Gbt5f
         7gNA==
X-Gm-Message-State: AOAM531B7eFTb3SJO/X7W3tL2ekaIW8IDxZ1MMPaQG3s5vnNdB6OlsFe
	yDJ8lDZmlr5+3S9qwRWpfluNz9z2ChY74g==
X-Google-Smtp-Source: ABdhPJzY0CpdQVTNyLjNI9DyJbJS+ro5/U9C6hJFiBr6EWhKPeXlZE59MBQqxGEU/JYrF+u/HKSG8w==
X-Received: by 2002:a62:d5:0:b029:1b4:144c:f217 with SMTP id 204-20020a6200d50000b02901b4144cf217mr11492184pfa.13.1610905010307;
        Sun, 17 Jan 2021 09:36:50 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:50 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 10/31] lockfile-progs: use DEBIAN_MIRROR in SRC_URI
Date: Sun, 17 Jan 2021 09:36:15 -0800
Message-Id: <db892b5e626302009146eafcf0decbc78b7fe800.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Roland Hieber <rhi@pengutronix.de>

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7b8efbbd0f22d1871cfe2e90adec6aa9f5e9483d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb
index c76e0f69e0..a82f10b919 100644
--- a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb
+++ b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.18.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 DEPENDS = "liblockfile"
 
-SRC_URI = "http://ftp.de.debian.org/debian/pool/main/l/${BPN}/${BPN}_${PV}.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.gz"
 SRC_URI[md5sum] = "4eb83bdf88016db836b7cc09591fb0f3"
 SRC_URI[sha256sum] = "a42995a4b97e6188efc90fcc1a761163c4b2cff5c81b936f85c84301ddb05ce6"
 
-- 
2.17.1

