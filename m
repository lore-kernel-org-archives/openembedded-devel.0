Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2356.1622086723579636252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 20:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14R3cfUD023729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 20:38:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 26 May 2021 20:38:40 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Wed, 26 May 2021 20:38:40 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-gnome][PATCH] mutter: add polkit to REQUIRED_DISTRO_FEATRUES
Date: Wed, 26 May 2021 20:38:40 -0700
Message-ID: <20210527033840.20645-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

mutter depends on gnome-settings-daemon which requires 'polkit'
distro feature.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
index adbfcd6d7..c7f91f0db 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_3.34.6.bb
@@ -27,7 +27,7 @@ SRC_URI[archive.sha256sum] = "23bde87d33b8981358831cec8915bb5ff1eaf9c1de74c90cd1
 SRC_URI += "file://0001-EGL-Include-EGL-eglmesaext.h.patch"
 
 # x11 is still manadatory - see meson.build
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 polkit"
 
 # systemd can be replaced by libelogind (not available atow - make systemd
 # mandatory distro feature)
-- 
2.30.2

