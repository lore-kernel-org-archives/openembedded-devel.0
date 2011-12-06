Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RXp9U-0006ej-Pk
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 08:09:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB672VTk008658
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 5 Dec 2011 23:02:33 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 5 Dec 2011 23:02:31 -0800
Message-ID: <a05704c4e90fd82ebdf6ad2c08f5f4811107ff1f.1323141676.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1323141676.git.xiaofeng.yan@windriver.com>
References: <cover.1323141676.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 5 Dec 2011 14:32:30 +0800
Date: Tue, 6 Dec 2011 14:58:05 +0800
To: <openembedded-devel@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [OE-core][PATCH 02/10] gconf: Disable dbus-x11 when x11 isn't in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 06 Dec 2011 07:09:21 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

If x11 isn't in DISTRO_FEATURES, then an error information "no providers ..." will \
arise. I modified this bb file to disable "dbus-x11" when no x11 in DISTRO_FEATURES.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index cdc7a35..9d327fc 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native polkit"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native"
 
-PR = "r2"
+PR = "r3"
 
 inherit gnomebase
 
@@ -37,7 +37,9 @@ do_install_append() {
 	rm ${D}${libdir}/gio/*/*.*a
 }
 
-RDEPENDS_${PN} += "dbus-x11"
+# disable dbus-x11 when x11 isn't in DISTRO_FEATURES
+RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"
+
 FILES_${PN} += "${libdir}/GConf/* \
 	        ${libdir}/gio/*/*.so \
 		${datadir}/polkit* \
-- 
1.7.0.4



