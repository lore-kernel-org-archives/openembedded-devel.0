Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.6881.1591089954922830207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2020 02:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0529PCpD005066
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Jun 2020 02:25:43 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 2 Jun 2020 02:25:19 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] packagegroup-xfce-base: add RDEPEND packagegroup-core-x11
Date: Tue, 2 Jun 2020 17:24:17 +0800
Message-ID: <20200602092417.20182-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

without packagegroup-core-x11, after boot target, and run
startx, it will report error like:

/usr/bin/startx: line 203: xauth: command not found

xinit: unable to run server "/usr/bin/X": No such file or directory
Use the -- option, or make sure that /usr/bin is in your path and
that "/usr/bin/X" is a program or a link to the right type of server
for your display.  Possible server names include:

    Xorg        Common X server for most displays
    Xvfb        Virtual frame buffer
    Xfake       kdrive-based virtual frame buffer
    Xnest       X server nested in a window on anot

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index 70ef909ef..6ddf8ee91 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -7,6 +7,7 @@ inherit packagegroup features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 RDEPENDS_${PN} = " \
+    packagegroup-core-x11 \
     xfwm4 \
     xfce4-session \
     xfconf \
-- 
2.17.1

