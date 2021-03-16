Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.3938.1615866212261706541
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 20:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12G3h2iY012341
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Mar 2021 20:43:12 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 20:42:40 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 20:42:39 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <schnitzeltony@gmail.com>
Subject: [meta-xfce][PATCH 6/7] xfce4-systemload-plugin: 1.2.4 -> 1.3.0
Date: Tue, 16 Mar 2021 11:42:01 +0800
Message-ID: <20210316034202.21134-7-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316034202.21134-1-kai.kang@windriver.com>
References: <20210316034202.21134-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Release notes for 1.3.0
=======================
- Port to xfconf
- Add new icons and switch to rDNS naming
- Add Help button to properties dialog
- Fix compilation warnings
- autoconf: Some updates
- Update `.gitignore`
- configure.ac: use AC_PROG_CC_C99
- Translation Updates:
  Belarusian, Bulgarian, English (Canada), Hungarian, Russian, Turkish,
  Ukrainian

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...temload-plugin_1.2.4.bb => xfce4-systemload-plugin_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.2.4.bb => xfce4-systemload-plugin_1.3.0.bb} (79%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.4.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.0.bb
similarity index 79%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.4.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.0.bb
index b966711bd..e6a5ec0b2 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.2.4.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.0.bb
@@ -7,4 +7,4 @@ inherit xfce-panel-plugin
 
 DEPENDS += "upower"
 
-SRC_URI[sha256sum] = "0531b8df923cba3be8d064cb8b638b954df74915e5a447228999517847789835"
+SRC_URI[sha256sum] = "1148f8e90cc53cae9b3aa32e10df4bd9fdc2f06db09d8429f88fbdd874fc171d"
-- 
2.17.1

