Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RtkXl-0008Hb-PB
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Feb 2012 19:41:02 +0100
Received: by eekd41 with SMTP id d41so1371120eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Feb 2012 10:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=BEW8iSa5rvb5oxAg0XIoIw0g3OL8l5lqArzzi8Dy7Os=;
	b=NpCEUUOiXR1rDra/1b/B77xvEFeDD/CtmaOCtfjk7SI0reAy5FsI0lkzfAAByeMgIN
	jXhmULU0TrpmgH7SSKhk5DpAmEm+W7ZSe3wUUvqI4C6CAifPSQnzvdl9w1vaJvs7xK+K
	x5tWQv0+kdCTbgD8QyYh8hIlQLO8eG21wohj8=
Received: by 10.14.126.10 with SMTP id a10mr3255852eei.42.1328380382747;
	Sat, 04 Feb 2012 10:33:02 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id z47sm30330292eeh.9.2012.02.04.10.33.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 04 Feb 2012 10:33:02 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Feb 2012 19:30:49 +0100
Message-Id: <1328380249-11697-4-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
References: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
Subject: [meta-xfce][PATCH 3/3] xfce4-panel: Disable building of static libraries.
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
X-List-Received-Date: Sat, 04 Feb 2012 18:41:02 -0000

Current recipe triggers several QA warnings about non -staticdev packages
containing .a files. The offending files are static versions of panel
plugins. They have no actual use. They're just a byproduct. Xfce4-panel
contains only one more library libxfce4-panel. Similary to panel plugins
it's static version is rather useless.

Disabling building of static libs makes -dev package smaller and fixes
all QA warnings.

Run tested on netbook pro.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb  |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
index 0cd8eba..937b078 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
@@ -4,15 +4,17 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
 DEPENDS = "libxfce4util garcon libxfce4ui xfconf exo gtk+ dbus cairo virtual/libx11 libxml2 libwnck"
 
-PR = "r1"
+PR = "r2"
 
 inherit xfce
 
+EXTRA_OECONF = "--disable-static"
+
 python populate_packages_prepend() {
 	plugin_dir = bb.data.expand('${libdir}/xfce4/panel/plugins/', d)
 	plugin_name = bb.data.expand('${PN}-plugin-%s', d)
 	do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
-	                  '${PN} plugin for %s', extra_depends='', prepend=True,
+	                  '${PN} %s plugin', extra_depends='', prepend=True,
 	                  aux_files_pattern=['${datadir}/xfce4/panel/plugins/%s.desktop',
 	                                     '${sysconfdir}/xdg/xfce/panel/%s-*',
 	                                     '${datadir}/icons/hicolor/48x48/apps/*-%s.png',
@@ -23,12 +25,7 @@ PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
 FILES_${PN} += "${libdir}/xfce4/panel/migrate \
                 ${libdir}/xfce4/panel/wrapper"
-
-FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug \
-		   "
-
-FILES_${PN}-dev += "${libdir}/xfce4/panel/plugins/*.*a \
-                   "
+FILES_${PN}-dbg += "${libdir}/xfce4/panel/plugins/.debug"
 
 SRC_URI[md5sum] = "9d7bf0503d5867c4044cef04bb5845b1"
 SRC_URI[sha256sum] = "66f1266a1242ee5ecada995a4a584dd9802aa24456759b40b0c29227c39bed03"
-- 
1.7.3.4



