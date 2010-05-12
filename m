Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OCApd-0002Ut-6X
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 14:14:34 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id A0C08491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 14:10:40 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 12 May 2010 14:12:01 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id 350AF80E009; Wed, 12 May 2010 14:10:39 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 May 2010 14:10:36 +0200
Message-Id: <1273666236-692-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <20100507145217.GI3204@jama>
References: <20100507145217.GI3204@jama>
X-OriginalArrivalTime: 12 May 2010 12:12:01.0417 (UTC)
	FILETIME=[53BF9F90:01CAF1CC]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] busybox/syslogs: use update-alternatives for syslog selection
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
X-List-Received-Date: Wed, 12 May 2010 12:14:34 -0000

* u-a for init scripts of busybox-syslog, sysklogd, and rsyslog
* syslog-ng needs to be integrated too!

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/busybox/busybox.inc        |   44 +++++++++++++++++++++++++++---
 recipes/rsyslog/rsyslog.inc        |   48 ++++++++++++++++++++++++++-------
 recipes/sysklogd/sysklogd.inc      |   52 ++++++++++++++++++++++++++++++++---
 recipes/sysklogd/sysklogd_1.4.1.bb |    2 +-
 recipes/sysklogd/sysklogd_1.5.bb   |    2 +-
 5 files changed, 127 insertions(+), 21 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 17d8d14..7c170fb 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 SECTION = "base"
 PRIORITY = "required"
 
-INC_PR = "r27"
+INC_PR = "r28"
 
 SRC_URI = "\
   file://busybox-cron \
@@ -46,12 +46,14 @@ RDEPENDS_${PN} += "${PN}-mountall"
 RRECOMMENDS_${PN} += "libgcc ${PN}-syslog"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
-FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog ${sysconfdir}/syslog.conf"
+FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog.${PN} ${sysconfdir}/syslog.conf"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 
 FILES_${PN} += "${datadir}/udhcpc"
 
-INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd"
+# syslog initscript is handled explicitly because order of
+# update-rc.d and update-alternatives is important (see below)
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-udhcpd"
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
@@ -104,7 +106,7 @@ do_install () {
 	ln -sf busybox ${D}${base_bindir}/sh
 
 	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
-		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/
+		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${PN}
 		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/
 	fi
 	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
@@ -154,6 +156,40 @@ pkg_prerm_${PN}-mountall () {
 	update-alternatives --remove default_mountall mountall.${PN}
 }
 
+pkg_postinst_${PN}-syslog () {
+	update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 50
+
+	if test "x$D" != "x"; then
+		OPT="-r $D"
+	else
+		OPT="-s"
+	fi
+	update-rc.d $OPT syslog defaults
+}
+
+pkg_prerm_${PN}-syslog () {
+	if test "x$D" = "x"; then
+		if test "$1" = "upgrade" -o "$1" = "remove"; then
+			/etc/init.d/syslog stop
+		fi
+	fi
+
+	update-alternatives --remove syslog-init syslog.${PN}
+}
+
+pkg_postrm_${PN}-syslog () {
+	if test "x$D" != "x"; then
+		OPT="-r $D"
+	else
+		OPT=""
+	fi
+	if test "$1" = "remove" -o "$1" = "purge"; then
+		if ! test -e "/etc/init.d/syslog"; then
+			update-rc.d $OPT syslog remove
+		fi
+	fi
+}
+
 pkg_prerm_${PN} () {
 	# This is so you can make busybox commit suicide - removing busybox with no other packages
 	# providing its files, this will make update-alternatives work, but the update-rc.d part
diff --git a/recipes/rsyslog/rsyslog.inc b/recipes/rsyslog/rsyslog.inc
index 3e39ba0..783852b 100644
--- a/recipes/rsyslog/rsyslog.inc
+++ b/recipes/rsyslog/rsyslog.inc
@@ -2,31 +2,59 @@ DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
 DEPENDS = "zlib"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
-INC_PR = "r0"
+INC_PR = "r1"
 
 SRC_URI = "http://download.rsyslog.com/rsyslog/${PN}-${PV}.tar.gz \
           file://rsyslog.conf \
           file://initscript"
 
-inherit autotools update-rc.d
+
+inherit autotools
 
 do_install_append() {
         install -d ${D}/${sysconfdir}/${PN}
         install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
         install -d ${D}/${sysconfdir}/init.d
-        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/rsyslog
+        install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
+}
+
+# syslog initscript is handled explicitly because order of
+# update-rc.d and update-alternatives is important
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 300
+
+	if test "x$D" != "x"; then
+		OPT="-r $D"
+	else
+		OPT="-s"
+	fi
+	update-rc.d $OPT syslog defaults
 }
 
-pkg_postinst() {
-        update-rc.d -f syslog remove
+pkg_prerm_${PN} () {
+	if test "x$D" = "x"; then
+		if test "$1" = "upgrade" -o "$1" = "remove"; then
+			/etc/init.d/syslog stop
+		fi
+	fi
+
+	update-alternatives --remove syslog-init syslog.${PN}
 }
 
-pkg_postrm() {
-        update-rc.d syslog add 5
+pkg_postrm_${PN} () {
+	if test "x$D" != "x"; then
+		OPT="-r $D"
+	else
+		OPT=""
+	fi
+	if test "$1" = "remove" -o "$1" = "purge"; then
+		if ! test -e "/etc/init.d/syslog"; then
+			update-rc.d $OPT syslog remove
+		fi
+	fi
 }
 
 CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
 
-INITSCRIPT_NAME = "rsyslog"
-#INITSCRIPT_PARAMS = "defaults 05"
-INITSCRIPT_PARAMS = "remove"
+INITSCRIPT_NAME = "syslog"
diff --git a/recipes/sysklogd/sysklogd.inc b/recipes/sysklogd/sysklogd.inc
index 65da86d..2118c45 100644
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
 
-inherit update-rc.d
-INITSCRIPT_NAME = "sysklogd"
-INITSCRIPT_PARAMS = "start 39 S 1 2 3 . stop 99 0 6 ."
+# syslog initscript is handled explicitly because order of
+# update-rc.d and update-alternatives is important (see below)
+INITSCRIPT_NAME = "syslog"
+
 CFLAGS_append = " -DSYSV"
-RCONFLICTS = "busybox-syslog"
 
 do_install () {
 	install -d ${D}${mandir}/man8 \
@@ -23,14 +24,55 @@ do_install () {
     install -d ${D}${sysconfdir}
     install -m 644 ${S}/syslog.conf ${D}${sysconfdir}/syslog.conf
     install -d ${D}${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/sysklogd
+    install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog.${PN}
+}
+
+pkg_preinst_${PN} () {
+    # all this is needed to avoid sysmlink errors,
+    # because update-rc.d runs before pkg_postinst :(
+    if [ -e ${sysconfdir}/init.d/syslog -a ! -L ${sysconfdir}/init.d/syslog ]; then
+        echo "WARNING:" "non symlink ${sysconfdir}/init.d/syslog exist -> backup to ${sysconfdir}/init.d/syslog.old"
+        mv ${sysconfdir}/init.d/syslog ${sysconfdir}/init.d/syslog.old
+    fi
+    if [ ! -e ${sysconfdir}/init.d/syslog ]; then
+        ln -s dummy ${sysconfdir}/init.d/syslog
+    fi
 }
+
 pkg_postinst_${PN} () {
     update-alternatives --install ${base_sbindir}/syslogd syslogd syslogd.${PN} 100
     update-alternatives --install ${base_sbindir}/klogd klogd klogd.${PN} 100
+    update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 100
+
+    if test "x$D" != "x"; then
+	OPT="-r $D"
+    else
+	OPT="-s"
+    fi
+    update-rc.d $OPT syslog defaults
 }
+
 pkg_prerm_${PN} () {
     update-alternatives --remove syslogd syslogd.${PN}
     update-alternatives --remove klogd klogd.${PN}
+
+    if test "x$D" = "x"; then
+	if test "$1" = "upgrade" -o "$1" = "remove"; then
+	    /etc/init.d/syslog stop
+	fi
+    fi
+    update-alternatives --remove syslog-init syslog.${PN}
 }
 
+pkg_postrm_${PN} () {
+    if test "x$D" != "x"; then
+	OPT="-r $D"
+    else
+	OPT=""
+    fi
+    if test "$1" = "remove" -o "$1" = "purge"; then
+	if ! test -e "/etc/init.d/syslog"; then
+	    update-rc.d $OPT syslog remove
+	fi
+    fi
+}
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



