Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.4270.1589851838526839617
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 18:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04J1Ub5q010920
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 18:30:37 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 18 May 2020 18:30:36 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 1/4] garcon: 0.6.4 -> 0.7.0
Date: Tue, 19 May 2020 09:30:31 +0800
Message-ID: <20200519013034.37855-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

garcon 0.7.0:

- Add garcon_menu_item_[g|s]et_keywords to docs
- Add garcon_gtk_menu_get_desktop_actions_menu
- Improve docstrings
- Translation Updates:
  Albanian, Asturian, Belarusian, Chinese (Taiwan), Galician, Georgian,
  Hindi, Spanish

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/garcon/{garcon_0.6.4.bb => garcon_0.7.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.6.4.bb => garcon_0.7.0.bb} (76%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.6.4.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.7.0.bb
similarity index 76%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.6.4.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_0.7.0.bb
index 75997de7b..c4b858fd7 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.6.4.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.7.0.bb
@@ -9,8 +9,8 @@ inherit xfce gtk-doc features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[md5sum] = "9715aa8214be9c553d9b8c44fde90b9f"
-SRC_URI[sha256sum] = "d75e4753037a74733c07b71b8db7a656d869869f0f107f6411a306bbc87a762d"
+SRC_URI[md5sum] = "2964c7a7e5d4aac58b4afef9b8602914"
+SRC_URI[sha256sum] = "82c3b61b508011642b09e6fb01b1d3f22c4e4de0fc54a9244327d0ddb66b2423"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.17.1

