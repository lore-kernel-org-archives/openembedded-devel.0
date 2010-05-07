Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OAOTp-0003Ml-JC
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 16:24:47 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 4AC44491278
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 May 2010 16:20:54 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 7 May 2010 16:22:00 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id D9D3172078; Fri,  7 May 2010 16:20:53 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 May 2010 16:20:36 +0200
Message-Id: <1273242036-7529-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <4BE41DF5.7040805@dresearch.de>
References: <4BE41DF5.7040805@dresearch.de>
X-OriginalArrivalTime: 07 May 2010 14:22:00.0214 (UTC)
	FILETIME=[A820DB60:01CAEDF0]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] busybox/syslogs: use update-alternatives for syslog selection
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
X-List-Received-Date: Fri, 07 May 2010 14:24:47 -0000

* u-a for init scripts of busybox-syslog, sysklogd, and rsyslog
* syslog-ng needs to be integrated too!

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/busybox/busybox.inc        |   18 ++++++++++++++++--
 recipes/rsyslog/rsyslog.inc        |   22 +++++++++++++---------
 recipes/sysklogd/sysklogd.inc      |   19 +++++++++++++++----
 recipes/sysklogd/sysklogd_1.4.1.bb |    2 +-
 recipes/sysklogd/sysklogd_1.5.bb   |    2 +-
 5 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 17d8d14..31651d6 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 SECTION = "base"
 PRIORITY = "required"
 
-INC_PR = "r27"
+INC_PR = "r28"
 
 SRC_URI = "\
   file://busybox-cron \
@@ -46,7 +46,7 @@ RDEPENDS_${PN} += "${PN}-mountall"
 RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
-FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog ${sysconfdir}/syslog.conf"
+FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} ${sysconfdir}/syslog.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 
 FILES_${PN} += "${datadir}/udhcpc"
@@ -154,6 +154,20 @@ pkg_prerm_${PN}-mountall () {
 	update-alternatives --remove default_mountall mountall.${PN}
 }
 
+pkg_preinst_${PN}-syslog () {
+    # this is needed to avoid sysmlink errors,
+    # because update-rc.d runs before pkg_postinst :(
+    touch {sysconfdir}/init.d/syslog
+}
+
+pkg_postinst_${PN}-syslog () {
+    update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 50
+}
+
+pkg_prerm_${PN}-syslog () {
+    update-alternatives --remove syslog-init syslog.${PN}
+}
+
 pkg_prerm_${PN} () {
 	# This is so you can make busybox commit suicide - removing busybox with no other packages
 	# providing its files, this will make update-alternatives work, but the update-rc.d part
diff --git a/recipes/rsyslog/rsyslog.inc b/recipes/rsyslog/rsyslog.inc
index 3e39ba0..6471724 100644
--- a/recipes/rsyslog/rsyslog.inc
+++ b/recipes/rsyslog/rsyslog.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
 DEPENDS = "zlib"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "http://download.rsyslog.com/rsyslog/${PN}-${PV}.tar.gz \
           file://rsyslog.conf \
@@ -14,19 +14,23 @@ do_install_append() {
         install -d ${D}/${sysconfdir}/${PN}
         install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
         install -d ${D}/${sysconfdir}/init.d
-        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/rsyslog
+        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
 }
 
-pkg_postinst() {
-        update-rc.d -f syslog remove
+pkg_preinst_${PN} () {
+    # this is needed to avoid sysmlink errors,
+    # because update-rc.d runs before pkg_postinst :(
+    touch {sysconfdir}/init.d/syslog
 }
 
-pkg_postrm() {
-        update-rc.d syslog add 5
+pkg_postinst_${PN} () {
+    update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 300
+}
+
+pkg_prerm_${PN} () {
+    update-alternatives --remove syslog-init syslog.${PN}
 }
 
 CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
 
-INITSCRIPT_NAME = "rsyslog"
-#INITSCRIPT_PARAMS = "defaults 05"
-INITSCRIPT_PARAMS = "remove"
+INITSCRIPT_NAME = "syslog"
diff --git a/recipes/sysklogd/sysklogd.inc b/recipes/sysklogd/sysklogd.inc
index 65da86d..f6b6aab 100644
--- a/recipes/sysklogd/sysklogd.inc
+++ b/recipes/sysklogd/sysklogd.inc
@@ -1,16 +1,17 @@
 LICENSE = "GPL"
 SECTION = "base"
 DESCRIPTION = "The sysklogd package implements two system log daemons."
+INC_PR = "r3"
 
 SRC_URI = "http://www.ibiblio.org/pub/Linux/system/daemons/sysklogd-${PV}.tar.gz \
 	       file://nonrootinstall.patch;patch=1 \
            file://sysklogd"
 
 inherit update-rc.d
-INITSCRIPT_NAME = "sysklogd"
-INITSCRIPT_PARAMS = "start 39 S 1 2 3 . stop 99 0 6 ."
+
+INITSCRIPT_NAME = "syslog"
+
 CFLAGS_append = " -DSYSV"
-RCONFLICTS = "busybox-syslog"
 
 do_install () {
 	install -d ${D}${mandir}/man8 \
@@ -23,14 +24,24 @@ do_install () {
     install -d ${D}${sysconfdir}
     install -m 644 ${S}/syslog.conf ${D}${sysconfdir}/syslog.conf
     install -d ${D}${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/sysklogd
+    install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog.${PN}
+}
+
+pkg_preinst_${PN} () {
+    # this is needed to avoid sysmlink errors,
+    # because update-rc.d runs before pkg_postinst :(
+    touch {sysconfdir}/init.d/syslog
 }
+
 pkg_postinst_${PN} () {
     update-alternatives --install ${base_sbindir}/syslogd syslogd syslogd.${PN} 100
     update-alternatives --install ${base_sbindir}/klogd klogd klogd.${PN} 100
+    update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 100
 }
+
 pkg_prerm_${PN} () {
     update-alternatives --remove syslogd syslogd.${PN}
     update-alternatives --remove klogd klogd.${PN}
+    update-alternatives --remove syslog-init syslog.${PN}
 }
 
diff --git a/recipes/sysklogd/sysklogd_1.4.1.bb b/recipes/sysklogd/sysklogd_1.4.1.bb
index 3d938f5..e02dd3e 100644
--- a/recipes/sysklogd/sysklogd_1.4.1.bb
+++ b/recipes/sysklogd/sysklogd_1.4.1.bb
@@ -1,5 +1,5 @@
 require sysklogd.inc
-PR = "r1"
+PR = "${INC_PR}.1"
 
 
 SRC_URI[md5sum] = "d214aa40beabf7bdb0c9b3c64432c774"
diff --git a/recipes/sysklogd/sysklogd_1.5.bb b/recipes/sysklogd/sysklogd_1.5.bb
index 70e55c3..a015768 100644
--- a/recipes/sysklogd/sysklogd_1.5.bb
+++ b/recipes/sysklogd/sysklogd_1.5.bb
@@ -1,5 +1,5 @@
 require sysklogd.inc
-PR = "r2"
+PR = "${INC_PR}.2"
 
 SRC_URI += "file://no-strip-install.patch;patch=1"
 
-- 
1.6.4.2



