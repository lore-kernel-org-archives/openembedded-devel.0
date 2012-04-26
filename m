Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNOJC-0005hJ-5w
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Apr 2012 15:00:30 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so972116wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2012 05:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=K2fKmt01IMFpZfskxZQs20E23Uo9qZ0A98muq4zgW3A=;
	b=aIT87BuUyitiHhMW6UG41k93gD+D7PFbilO36blDyroBDIRWFFSciCzRgMU/Or9W1Z
	7IF6/v6pL9iOg6VumGRpQ0Ag8Bno06rf2dJQKhfcKmNT8MobcmMbc3MvMAFkmX8+eOgP
	CwEov//GlkgdD3QJhU0+Kdm9Z5XrGGnAO+SqZFJFZJ/5g/Q0ZitsAXS1DSfgswuV0atp
	uVlTw4QfM61QplDrf5XNy1L6FC94oZYEohmZIIlSUy+Avq52EEYV+95Oy+Vgn1ZL6+c4
	BIXFl2SC4MAVIr25CEB7DNTN8Tyz8h2xVvYZ/f68ZPib+rNLx8scI0rOG4iFv8x+jRPm
	LiIg==
Received: by 10.216.225.216 with SMTP id z66mr4131792wep.71.1335444655449;
	Thu, 26 Apr 2012 05:50:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm10801833wib.2.2012.04.26.05.50.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 05:50:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2012 14:50:09 +0200
Message-Id: <154d0bb399ce6a0bdc2bf756d1a8a9c77dd0a755.1335444528.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Subject: [[meta-oe][meta-efl] 04/15] systemd.bbclass: allow recipe to inherit systemd with empty SYSTEMD_SERVICE
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
X-List-Received-Date: Thu, 26 Apr 2012 13:00:30 -0000

* I have use case where common recipe does inherit systemd and only some BSP's are bbappending some SERVICEs to it
* install was moved intentionaly, so that /lib/systemd/system is not
  created if there is no .service file (causing QA Warning about
  unpackaged dir)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/systemd.bbclass |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-oe/classes/systemd.bbclass b/meta-oe/classes/systemd.bbclass
index d8e30f4..db35717 100644
--- a/meta-oe/classes/systemd.bbclass
+++ b/meta-oe/classes/systemd.bbclass
@@ -58,8 +58,6 @@ def systemd_after_parse(d):
 		for pkg_systemd in systemd_pkgs.split():
 			service_pkg = 'SYSTEMD_SERVICE' + "_" + pkg_systemd
 			systemd_services = d.getVar(service_pkg, 1) or d.getVar('SYSTEMD_SERVICE', 1) or ""
-			if systemd_services == "":
-				raise bb.build.FuncFailed, "\n\n%s inherits systemd but doesn't set SYSTEMD_SERVICE / %s" % (bb_filename, service_pkg)
 
 	# prepend systemd-packages not already included
 	def systemd_create_package(pkg_systemd):
@@ -84,11 +82,11 @@ python __anonymous() {
 
 # automatically install all *.service and *.socket supplied in recipe's SRC_URI
 do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
     for service in `find ${WORKDIR} -maxdepth 1 -name '*.service' -o -name '*.socket'` ; do
 	# ensure installing systemd-files only (e.g not avahi *.service)
 	if grep -q '\[Unit\]' $service ; then
-	        install -m 644 $service ${D}${systemd_unitdir}/system
+		install -d ${D}${systemd_unitdir}/system
+		install -m 644 $service ${D}${systemd_unitdir}/system
 	fi
     done
 }
@@ -203,7 +201,8 @@ python populate_packages_prepend () {
 	# run all modifications once when creating package
 	if os.path.exists('${D}'):
 		for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-			systemd_generate_package_scripts(pkg_systemd)
-			systemd_add_rdepends(pkg_systemd)
+			if d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1) and d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1).strip():
+				systemd_generate_package_scripts(pkg_systemd)
+				systemd_add_rdepends(pkg_systemd)
 		systemd_check_services()
 }
-- 
1.7.8.5



