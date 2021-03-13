Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.4620.1615671279646048503
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 13:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12DLYOsA026220
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 13:34:33 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sat, 13 Mar 2021 13:34:17 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Sat, 13 Mar 2021 13:34:16 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/2] xterm: upgrade 362 -> 366
Date: Sat, 13 Mar 2021 16:34:15 -0500
Message-ID: <20210313213415.396489-2-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210313213415.396489-1-Randy.MacLeod@windriver.com>
References: <20210313213415.396489-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../recipes-graphics/xorg-app/{xterm_362.bb => xterm_366.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_362.bb => xterm_366.bb} (92%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_362.bb b/meta-oe/recipes-graphics/xorg-app/xterm_366.bb
similarity index 92%
rename from meta-oe/recipes-graphics/xorg-app/xterm_362.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_366.bb
index 2bbcd9211..969159bc5 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_362.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_366.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[md5sum] = "ee6710bbbe18000236c6e6d7b55b54d5"
-SRC_URI[sha256sum] = "1d4ffe226fa8f021859bbc3007788ff63a46a31242d9bd9a7bd7ebe24e81aca2"
+SRC_URI[sha256sum] = "858b2885963fe97e712739066aadc1baeba2b33a0016303a7fec7d38bc73bf6e"
+
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
 
-- 
2.27.0

