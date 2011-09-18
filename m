Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R5PfK-0000nu-1m
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 00:16:46 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so4148693fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 15:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=83PpVmDBOSCk9rrOcCfOTS0V8era4yuKD21VjzA3QmI=;
	b=wHQt71QceovyjRCVT/mzByoGZwXmXKdcKuedRcWlSdsr+d/Box5wDMnnCpZOOWXobk
	iUAVvzF3Bfsmz0kObo4nhWKWrh+a3EpZ542d4tef16Bu6D3Asy7qmgRSsWjSkfHeLsZd
	X+cTSwWtcVFiXPxtSPFfIcuGIh9LRxpO0X29M=
Received: by 10.223.98.146 with SMTP id q18mr4094478fan.57.1316383890287;
	Sun, 18 Sep 2011 15:11:30 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t19sm19649075faj.23.2011.09.18.15.11.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 18 Sep 2011 15:11:29 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Sep 2011 02:11:17 +0400
Message-Id: <1316383877-30796-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316383877-30796-1-git-send-email-dbaryshkov@gmail.com>
References: <1316383877-30796-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [meta-oe][V2 2/2] gconf: fix the "unshipped files" warnings
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
X-List-Received-Date: Sun, 18 Sep 2011 22:16:46 -0000

1) correct static libs removal in do_install_append
2) provide .la files in -dev package as it's usually done in other
packages.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb b/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb
index 1d5a857..d927327 100644
--- a/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb
+++ b/meta-gnome/recipes-gnome/gconf/gconf_2.32.4.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "GNOME configuration database system"
 SECTION = "x11/gnome"
 DEPENDS = "gobject-introspection-native gtk+ orbit2 glib-2.0 libxml2 polkit"
 
-PR = "r4"
+PR = "r5"
 
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
@@ -30,6 +30,7 @@ do_install_append() {
 
 	# this stuff is unusable
 	rm ${D}${libdir}/GConf/*/*.*a
+	rm ${D}${libdir}/gio/*/*.*a
 }
 
 RDEPENDS_${PN} += "dbus-x11"
@@ -41,4 +42,5 @@ FILES_${PN} += "${libdir}/GConf/* \
 "
 
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
-FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd"
+FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd \
+		    ${libdir}/*/gio/*/*.la"
-- 
1.7.2.5



