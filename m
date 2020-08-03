Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.5713.1596436627172405144
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2020 23:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0736b5Ci005531
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Sun, 2 Aug 2020 23:37:05 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sun, 2 Aug 2020 23:36:53 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 1/2] xfce4-eyes-plugin: 4.5.0 -> 4.5.1
Date: Mon, 3 Aug 2020 14:36:49 +0800
Message-ID: <20200803063650.24149-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

4.5.1

- Update URLs. Remove ref. to translations.x.o (Bug #16162)
- Allow compilation with panel 4.15
- Replace GtkStock buttons
- Improve spacing (Bug #14664)
- Make build less verbose
- AC_CONFIG_MACRO_DIR -> AC_CONFIG_MACRO_DIRS
- Translation Updates:

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-eyes-plugin_4.5.0.bb => xfce4-eyes-plugin_4.5.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.5.0.bb => xfce4-eyes-plugin_4.5.1.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.0.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.1.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.0.bb
rename to meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.1.bb
index e5c21a1ac..3d8bc854f 100644
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.0.bb
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.5.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "6e274ceda37c7a8ae0821d9d49e965e9"
-SRC_URI[sha256sum] = "fdae00036383105a15d12e9809abd5945a8f2152b17e16ccdfbfe5bd9733f29d"
+SRC_URI[sha256sum] = "4db780178e529391d53da180e49386904e69a5a33b3bd5185835d0a7e6ff5ac5"
 
 FILES_${PN} += "${datadir}/xfce4/eyes"
-- 
2.17.1

