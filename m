Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.3864.1615866177318709185
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 20:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12G3gh2L004926
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Mar 2021 20:42:48 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 20:42:34 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 20:42:33 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <schnitzeltony@gmail.com>
Subject: [meta-xfce][PATCH 5/7] xfce4-weather-plugin: 0.10.2 -> 0.11.0
Date: Tue, 16 Mar 2021 11:42:00 +0800
Message-ID: <20210316034202.21134-6-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316034202.21134-1-kai.kang@windriver.com>
References: <20210316034202.21134-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Release notes for 0.11.0
========================
- Port to Xfconf
  Please note that settings from the rc file are not automatically
  migrated.
- Fix null g_array_sort() argument
- settings: Use infobar and symbolic icons
- Improve forecast window
- autoconf: Remove AC_HEADER_STDC
- Update `.gitignore`
- Set pointers to NULL
- Fix double-free
- Fix missing-prototypes
- Enable debug=yes when compiling from git and fix warnings
- Remove GSourceFunc casts
- Update copyright
- Translation Updates:
  Basque, Belarusian, Bulgarian, Czech, Danish, Finnish, Greek,
  Portuguese (Brazil), Russian, Serbian, Slovak, Turkish, Ukrainian

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...-weather-plugin_0.10.2.bb => xfce4-weather-plugin_0.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/weather/{xfce4-weather-plugin_0.10.2.bb => xfce4-weather-plugin_0.11.0.bb} (80%)

diff --git a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.2.bb b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb
similarity index 80%
rename from meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.2.bb
rename to meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb
index 404523019..45b43863a 100644
--- a/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.10.2.bb
+++ b/meta-xfce/recipes-panel-plugins/weather/xfce4-weather-plugin_0.11.0.bb
@@ -7,6 +7,6 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libsoup-2.4 dbus-glib upower"
 
-SRC_URI[sha256sum] = "9017790b92953090c849b17b357b42fa8c562bf0e25af2fd2e5f53cfebc662c6"
+SRC_URI[sha256sum] = "e3242ea951d51bc0fded1d02a4f1f662bec16a1fb10c855f71bda6541a1153fc"
 
 FILES_${PN} += "${datadir}/xfce4/weather"
-- 
2.17.1

