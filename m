Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.3861.1615866161308573879
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 20:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12G3gMBR004916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Mar 2021 20:42:30 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 20:42:20 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 20:42:19 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <schnitzeltony@gmail.com>
Subject: [meta-xfce][PATCH 3/7] xfce4-netload-plugin: 1.3.2 -> 1.4.0
Date: Tue, 16 Mar 2021 11:41:58 +0800
Message-ID: <20210316034202.21134-4-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316034202.21134-1-kai.kang@windriver.com>
References: <20210316034202.21134-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Release notes for 1.4.0
=======================
- Add new icons and switch to rDNS naming
- Add "About" dialog
- Add help button to properties dialog
- Improve progressbar look
- Update URLs from goodies.x.o to docs.x.o (Bug #16170)
- Fix compilation warnings
- autoconf: AM_CONFIG_HEADER -> AC_CONFIG_HEADERS
- Update `.gitignore`
- Fix missing-prototypes
- Remove GSourceFunc casts
- Populate a combo box with known network interfaces
- remove unused wormulon files
- Move to common m4 versioning macros
- Fix type for media_list on OpenBSD
- Add basic GitLab pipeline
- Translation Updates:
  Albanian, Basque, Belarusian, Chinese (Taiwan), Danish, Eastern
  Armenian, English (Canada), Finnish, Galician, Hebrew, Hungarian,
  Interlingue, Russian, Slovak, Slovenian, Spanish, Swedish, Turkish,
  Uyghur

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...4-netload-plugin_1.3.2.bb => xfce4-netload-plugin_1.4.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.3.2.bb => xfce4-netload-plugin_1.4.0.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.2.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.2.bb
rename to meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
index 13e7b1db7..b30543b10 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.2.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.4.0.bb
@@ -6,5 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
 inherit xfce-panel-plugin
 
 SRC_URI = "http://archive.xfce.org/src/panel-plugins/${BPN}/${@'${PV}'[0:3]}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "ae4652711812a77a58c3dc96650a74dc"
-SRC_URI[sha256sum] = "22e40425cfe1e07b01fe275b1afddc7c788af34d9c2c7e2842166963cb41215d"
+SRC_URI[sha256sum] = "6c76260e101790754dd93255ec979accd97d21a21da85d8edcd6c7b01ddcd70c"
-- 
2.17.1

