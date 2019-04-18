Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35B3D7D231
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Apr 2019 15:51:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3IFo9R9026303
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Apr 2019 08:50:34 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 18 Apr 2019 08:50:05 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Apr 2019 11:49:58 -0400
Message-ID: <1555602598-8329-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] xfconf: fix 'Failed to get connection to xfconfd' during do_rootfs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2019 15:51:16 -0000
Content-Type: text/plain

Packages such as gdk-pixbuf can result in the following error during
the rootfs construction:
  CRITICAL **: 16:51:57.223: Failed to get connection to xfconfd: Cannot autolaunch D-Bus without X11 $DISPLAY

This is hit during the postinst-intercepts/update_pixbuf_cache.

Based on discussions upstream:

https://bugzilla.xfce.org/show_bug.cgi?id=14789

this appears to be an issue for xfconf and has an upstream update:

https://git.xfce.org/xfce/xfconf/commit?id=6f11cc65a2213f424728b5a0d25b1b63c19e773e

Drawing from this change we can go ahead and use PACKAGECONFIG to
emulate the upstream fix, defaulting to having the gsettings-backend
disabled.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
index 2667ff9..ded3c44 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
@@ -16,3 +16,5 @@ FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
 
 FILES_${PN}-dev += "${libdir}/gio/modules/libxfconfgsettingsbackend.la"
+
+PACKAGECONFIG[gsettings-backend] = "--enable-gsettings-backend,--disable-gsettings-backend,"
-- 
2.7.4


