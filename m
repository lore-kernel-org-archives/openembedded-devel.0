Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.1223.1589352893903357498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 23:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04D6sRuY030407
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 23:54:42 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 12 May 2020 23:54:16 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gnome-themes-extra: correct the recipe name
Date: Wed, 13 May 2020 14:54:14 +0800
Message-ID: <20200513065414.43257-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Per https://gitlab.gnome.org/GNOME/gnome-themes-extra/-/blob/master/README.md,
gnome-themes-extra ever named as gnome-themes-standard.

So rename the recipe name to reflect the
current status to avoid confusion.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...nome-themes-standard_3.28.bb => gnome-themes-extra_3.28.bb} | 3 ---
 1 file changed, 3 deletions(-)
 rename meta-oe/recipes-gnome/gnome-themes/{gnome-themes-standard_3.28.bb => gnome-themes-extra_3.28.bb} (94%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
similarity index 94%
rename from meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb
rename to meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
index 2fa754e79..ac594711c 100644
--- a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-extra_3.28.bb
@@ -6,9 +6,6 @@ SECTION = "x11/gnome"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-# Upstream renamed this package to gnome-themes-extra at some point
-BPN = "gnome-themes-extra"
-
 inherit gnomebase gettext gtk-icon-cache upstream-version-is-even features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-- 
2.17.1

