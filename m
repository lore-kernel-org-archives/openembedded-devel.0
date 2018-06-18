Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 321D962133
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 14:45:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5IEjnUG029518
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 07:45:49 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 18 Jun 2018 07:45:49 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 18 Jun 2018 10:45:46 -0400
Message-ID: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Mon, 18 Jun 2018 14:45:49 -0000
Content-Type: text/plain

Since commit 5f31db601408 [xfce4-panel: upgrade 4.12.2 -> 4.13.3] we
are getting a QA Warnings/Erros for 'installed-vs-shipped':

    ERROR: xfce4-panel-4.13.3-r0 do_package: QA Issue: xfce4-panel:
    Files/directories were installed but not shipped in any package:
      /usr/lib64/xfce4/panel/plugins/liblauncher.la
      /usr/lib64/xfce4/panel/plugins/libdirectorymenu.la
      ...

From various OE documents the .la files should not be packaged in
either the main recipe package or the -dev package unless required. So
inherit 'remove-libtool' to have all the .la files cleaned up as they
don't appear to be necessary.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

This error is currently only seen on master-next since the xfce4-panel
upgrade commit is yet to make it into master. As such this fix is only
applicable to master-next.


 meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
index 6625f05..f1b4504 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.3.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
 DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ gtk+3 dbus cairo virtual/libx11 libxml2 libwnck3 vala-native"
 
-inherit xfce gtk-doc gobject-introspection distro_features_check gtk-icon-cache
+inherit xfce gtk-doc gobject-introspection distro_features_check gtk-icon-cache remove-libtool
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.7.4


