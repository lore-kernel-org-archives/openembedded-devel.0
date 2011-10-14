Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REeNv-00026w-8e
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 11:49:00 +0200
Received: by ggnq1 with SMTP id q1so907981ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Oct 2011 02:43:14 -0700 (PDT)
Received: by 10.223.5.139 with SMTP id 11mr2881454fav.21.1318585390080;
	Fri, 14 Oct 2011 02:43:10 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id u6sm2714524faf.3.2011.10.14.02.43.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 02:43:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Oct 2011 11:43:05 +0200
Message-Id: <1318585385-18541-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] xfwm4: update to 4.8.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Oct 2011 09:49:00 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../xfwm4/xfwm4/relative-symlinks-docs.patch       |    5 +++++
 .../xfwm4/{xfwm4_4.8.1.bb => xfwm4_4.8.2.bb}       |    8 +++-----
 2 files changed, 8 insertions(+), 5 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.8.1.bb => xfwm4_4.8.2.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
index 4e855e4..67433ee 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
@@ -7,6 +7,11 @@ Subject: [PATCH] docs: On installation create relative paths in symlinks to
 
 Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
 ---
+
+Upstream-Status: accepted
+
+http://git.xfce.org/xfce/xfwm4/commit/?h=xfce-4.8&id=08b6d60056d7ca9884a46d6b92e77c9fc68ce8c5
+
  doc/manual/Makefile.am |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)
 
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb
index e31471d..c1ad221 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.2.bb
@@ -3,9 +3,6 @@ SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
 DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbus-glib startup-notification"
-RDEPENDS_${PN} = "xfwm4-theme-default"
-
-PR = "r0"
 
 inherit xfce update-alternatives
 
@@ -13,6 +10,8 @@ inherit xfce update-alternatives
 SRC_URI += " \
     file://relative-symlinks-docs.patch \
 "
+SRC_URI[md5sum] = "41b730d5abf39a69fc3b221728ddaa75"
+SRC_URI[sha256sum] = "6db2a6148d63d45699dbf6403fb227f8cbd529dcec7ee0827342940c442b0747"
 
 EXTRA_OECONF += " --enable-startup-notification"
 
@@ -28,10 +27,9 @@ ALTERNATIVE_LINK = "${bindir}/x-window-manager"
 ALTERNATIVE_PATH = "${bindir}/xfce4-session"
 ALTERNATIVE_PRIORITY = "30"
 
+RDEPENDS_${PN} = "xfwm4-theme-default"
 FILES_${PN} += "${libdir}/xfce4/xfwm4/helper-dialog \
                 ${datadir}/xfwm4/defaults \
                "
 FILES_${PN}-dbg += "${libexecdir}/xfce4/xfwm4/.debug/*"
 
-SRC_URI[md5sum] = "447433dca613180ebd6cfed4beb1c1c9"
-SRC_URI[sha256sum] = "6a3cbf6c92a0cc3bcaf7cf2565c35beae6354768ec26b4d616a3c2544a8f8499"
-- 
1.6.6.1



