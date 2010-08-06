Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OhQ0R-0001tq-K2 for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 18:43:05 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet2.eads.net with ESMTP; 06 Aug 2010 18:40:15 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.7381); 
	Fri, 6 Aug 2010 18:42:01 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 6 Aug 2010 18:42:00 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 6 Aug 2010 18:42:00 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5DD5@deimsg40.de.net.world>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [PATCH] busybox: fix defconfig handling problems triggered by
	"configure according to {MACHINE, DISTRO}_FEATURES";
	added inetd handling 
Thread-Index: Acs1hkqPhMx5PWhVQhaBi6J99W/JYQ==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 06 Aug 2010 16:42:00.0943 (UTC)
	FILETIME=[4AF19FF0:01CB3586]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling
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
X-List-Received-Date: Fri, 06 Aug 2010 16:43:05 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Bugfix:
Use ${S}/.config instead of ${WORKINGDIR}/defconfig for installing
configuration dependent parts.
Now the changes done by DISTRO_FEATURES processing are treated in
do_install().

Enhancements:
Added configuration dependent packages for inetd, telnetd, httpd which
enable inetd based daemon starting or standalone starting by installing
separate packages.

Enable starting of ftpd using inetd.
---
 recipes/busybox/busybox.inc           |  220
++++++++++++++++++++++++++++++---
 recipes/busybox/busybox_1.16.2.bb     |    7 +-
 recipes/busybox/files/busybox-inetd   |   43 +++++++
 recipes/busybox/files/busybox-telnetd |   39 ++++++
 recipes/busybox/files/inetd.conf      |    9 ++
 5 files changed, 296 insertions(+), 22 deletions(-)
 create mode 100644 recipes/busybox/files/busybox-inetd
 create mode 100644 recipes/busybox/files/busybox-telnetd
 create mode 100644 recipes/busybox/files/inetd.conf

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index a64c031..b4663f0 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -26,13 +26,23 @@ SRC_URI =3D "\
   file://syslog.conf \
   file://udhcpscript.patch \
   file://umount.busybox \
+  file://inetd.conf \
+  file://busybox-inetd \
+  file://busybox-telnetd \
 "
=20
 SRC_URI_append_nylon =3D " file://xargs-double-size.patch"
=20
 export EXTRA_CFLAGS =3D "${CFLAGS}"
 EXTRA_OEMAKE_append =3D " CROSS=3D${HOST_PREFIX}"
-PACKAGES =3D+ "${PN}-mountall ${PN}-httpd ${PN}-syslog ${PN}-udhcpd"
+PACKAGES =3D+ " ${PN}-mountall ${PN}-httpd ${PN}-syslog ${PN}-udhcpd
${PN}-telnetd ${PN}-inetd "
+
+DESCRIPTION_${PN}-inetd =3D "Add starting busybox inetd as daemon while
booting"
+DESCRIPTION_${PN}-httpd =3D "Add starting busybox httpd as daemon while
booting"
+DESCRIPTION_${PN}-syslog =3D "Add busybox syslog"
+DESCRIPTION_${PN}-udhcpd =3D "Add starting busybox udhcpd as daemon =
while
booting"
+DESCRIPTION_${PN}-telnetd =3D "Add starting busybox telnetd as daemon
while booting"
+DESCRIPTION_${PN}-mountall =3D "Add busybox mountall"
=20
 # We need this RRECOMMENDS_${PN} because libc dlopens libgcc
 # and shlib mechanism can not detect it because its not
@@ -48,16 +58,25 @@ RRECOMMENDS_${PN} +=3D "libgcc ${PN}-syslog"
 FILES_${PN}-httpd =3D "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog =3D "${sysconfdir}/init.d/syslog.${PN}
${sysconfdir}/syslog.conf"
 FILES_${PN}-udhcpd =3D "${sysconfdir}/init.d/busybox-udhcpd"
+FILES_${PN}-telnetd =3D "${sysconfdir}/init.d/busybox-telnetd"
=20
 FILES_${PN} +=3D "${datadir}/udhcpc"
=20
+FILES_${PN}-inetd =3D " \
+  ${sysconfdir}/init.d/busybox-inetd \
+  ${sysconfdir}/inetd.conf \
+"
+
 # syslog initscript is handled explicitly because order of
 # update-rc.d and update-alternatives is important (see below)
-INITSCRIPT_PACKAGES =3D "${PN}-httpd ${PN}-udhcpd"
+INITSCRIPT_PACKAGES =3D "${PN}-httpd ${PN}-udhcpd ${PN}-inetd
${PN}-telnetd"
 INITSCRIPT_NAME_${PN}-httpd =3D "busybox-httpd"
 INITSCRIPT_NAME_${PN}-syslog =3D "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd =3D "busybox-udhcpd"
+INITSCRIPT_NAME_${PN}-inetd =3D "busybox-inetd"
+INITSCRIPT_NAME_${PN}-telnetd =3D "busybox-telnetd"
 CONFFILES_${PN}-syslog =3D "${sysconfdir}/syslog.conf"
+CONFFILES_${PN}-inetd =3D "${sysconfdir}/inetd.conf"
=20
 # This disables the syslog startup links in slugos (see slugos-init)
 INITSCRIPT_PARAMS_${PN}-syslog_slugos =3D "start 20 ."
@@ -65,12 +84,14 @@ INITSCRIPT_PARAMS_${PN}-syslog_slugos =3D "start 20 =
."
 RDEPENDS_${PN}-httpd +=3D "${PN}"
 RDEPENDS_${PN}-syslog +=3D "${PN}"
 RDEPENDS_${PN}-udhcpd +=3D "${PN}"
+RDEPENDS_${PN}-inetd +=3D "${PN}"
+RDEPENDS_${PN}-telnetd +=3D "${PN}"
=20
 # Use gcc for linking so LDFLAGS actually makes sense
 LD =3D "${CC} -nostdlib"
=20
 inherit cml1 update-rc.d
-require busybox-config.inc
+require recipes/busybox/busybox-config.inc
=20
 configmangle =3D '/CROSS_COMPILER_PREFIX/d; \
 		/CONFIG_EXTRA_CFLAGS/d; \
@@ -135,11 +156,14 @@ do_install () {
=20
 	install -d ${D}${sysconfdir}/init.d
=20
-	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=3Dy" ${WORKDIR}/defconfig;
then
+        #use the fixed config file to get real build settings
+        BUSYBOX_CONFIG_FILE=3D${S}/.config
+
+	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=3Dy" $BUSYBOX_CONFIG_FILE;
then
 		# Install /bin/busybox, and the /bin/sh link so the
postinst script
 		# can run. Let update-alternatives handle the rest.
 		install -d ${D}${base_bindir}
-		if grep -q "CONFIG_FEATURE_SUID=3Dy" ${WORKDIR}/defconfig;
then
+		if grep -q "CONFIG_FEATURE_SUID=3Dy" $BUSYBOX_CONFIG_FILE;
then
 			install -m 4755 ${S}/busybox ${D}${base_bindir}
 		else
 			install -m 0755 ${S}/busybox ${D}${base_bindir}
@@ -165,34 +189,97 @@ do_install () {
 		fi
 	fi
=20
-	if grep -q "CONFIG_SYSLOGD=3Dy" ${WORKDIR}/defconfig; then
+	if grep -q "CONFIG_SYSLOGD=3Dy" $BUSYBOX_CONFIG_FILE; then
 		install -m 0755 ${WORKDIR}/syslog
${D}${sysconfdir}/init.d/syslog.${PN}
 		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/
 	fi
-	if grep "CONFIG_CROND=3Dy" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_CROND=3Dy" $BUSYBOX_CONFIG_FILE; then
 		install -m 0755 ${WORKDIR}/busybox-cron
${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HTTPD=3Dy" ${WORKDIR}/defconfig; then
-		install -m 0755 ${WORKDIR}/busybox-httpd
${D}${sysconfdir}/init.d/
-		install -d ${D}/srv/www
-	fi
-	if grep "CONFIG_APP_UDHCPD=3Dy" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_APP_UDHCPD=3Dy" $BUSYBOX_CONFIG_FILE; then
 		install -m 0755 ${WORKDIR}/busybox-udhcpd
${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HWCLOCK=3Dy" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_HWCLOCK=3Dy" $BUSYBOX_CONFIG_FILE; then
 		install -m 0755 ${WORKDIR}/hwclock.sh
${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_APP_UDHCPC=3Dy" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_APP_UDHCPC=3Dy" $BUSYBOX_CONFIG_FILE; then
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
                 install -m 0755 ${WORKDIR}/simple.script
${D}${sysconfdir}/udhcpc.d/50default
 		install -m 0755 ${WORKDIR}/default.script
${D}${datadir}/udhcpc/default.script
 	fi
-	if grep "CONFIG_FEATURE_MOUNT_FSTAB=3Dy" ${WORKDIR}/defconfig;
then
+
+	if grep "CONFIG_FEATURE_MOUNT_FSTAB=3Dy" $BUSYBOX_CONFIG_FILE;
then
 		install -d ${D}${sysconfdir}/default
 		install -m 644 ${WORKDIR}/mountall
${D}${sysconfdir}/default/mountall.${PN}
 	fi
=20
+        #Startup and configuration for inetd deamon
+        Use_Inetd=3D"no"
+	if grep "CONFIG_INETD=3Dy" $BUSYBOX_CONFIG_FILE; then
+                Use_Inetd=3D"yes"
+                install -m 0755 ${WORKDIR}/busybox-inetd
${D}${sysconfdir}/init.d/
+                if [ ! -f ${D}${sysconfdir}/inetd.conf ]; then
+                   install -m 0755 ${WORKDIR}/inetd.conf
${D}${sysconfdir}/
+                fi
+	fi
+
+        #Startup of telnetd deamon
+        if grep "CONFIG_TELNETD=3Dy" $BUSYBOX_CONFIG_FILE; then
+
+          #insert line into inetd.conf=20
+	  if [ ${Use_Inetd} =3D=3D "yes" ]; then
+                if [ ! -f ${D}${sysconfdir}/inetd.conf ]; then
+                   install -m 0755 ${WORKDIR}/inetd.conf
${D}${sysconfdir}/
+                fi
+                #remove old entry if available
+                grep -v telnet ${D}${sysconfdir}/inetd.conf >
${D}${sysconfdir}/inetd.conf_new
+                #add new entry for telnetd
+                echo "telnet stream tcp nowait root /usr/sbin/telnetd
telnetd -i -K" >>  ${D}${sysconfdir}/inetd.conf_new
+                mv ${D}${sysconfdir}/inetd.conf_new
${D}${sysconfdir}/inetd.conf
+          fi
+
+          #install start script=20
+          install -m 0755 ${WORKDIR}/busybox-telnetd
${D}${sysconfdir}/init.d/
+
+        fi
+
+        #Startup of ftpd deamon =20
+        if grep "CONFIG_FTPD=3Dy" $BUSYBOX_CONFIG_FILE; then
+
+          #insert line into inetd.conf=20
+	  if [ ${Use_Inetd} =3D=3D "yes" ]; then
+                if [ ! -f ${D}${sysconfdir}/inetd.conf ]; then
+                   install -m 0755 ${WORKDIR}/inetd.conf
${D}${sysconfdir}/
+                fi
+                #remove old entry if available
+                grep -v ftp ${D}${sysconfdir}/inetd.conf >
${D}${sysconfdir}/inetd.conf_new
+                #add new entry for telnetd
+                echo "ftp stream tcp nowait root /usr/sbin/ftpd ftpd
-w" >>  ${D}${sysconfdir}/inetd.conf_new
+                mv ${D}${sysconfdir}/inetd.conf_new
${D}${sysconfdir}/inetd.conf
+          fi
+        fi
+
+        #Startup of httpd deamon
+	if grep "CONFIG_HTTPD=3Dy" $BUSYBOX_CONFIG_FILE; then
+
+          #insert line into inetd.conf=20
+	  if [ ${Use_Inetd} =3D=3D "yes" ]; then
+                if [ ! -f ${D}${sysconfdir}/inetd.conf ]; then
+                   install -m 0755 ${WORKDIR}/inetd.conf
${D}${sysconfdir}/
+                fi
+                #remove old entry if available
+                grep -v http ${D}${sysconfdir}/inetd.conf >
${D}${sysconfdir}/inetd.conf_new
+                #add new entry for httpd
+                echo "http stream tcp nowait root /usr/sbin/httpd httpd
-i -h /srv/www" >>  ${D}${sysconfdir}/inetd.conf_new
+                mv ${D}${sysconfdir}/inetd.conf_new
${D}${sysconfdir}/inetd.conf
+          fi
+
+          install -m 0755 ${WORKDIR}/busybox-httpd
${D}${sysconfdir}/init.d/
+	  install -d ${D}/srv/www
+
+	fi
+
 	install -m 0644 ${S}/busybox.links ${D}${sysconfdir}
 }
=20
@@ -321,11 +408,104 @@ FILES_${PN}-linuxrc =3D "linuxrc"
 RDEPENDS_${PN}-linuxrc +=3D "${PN}"
=20
 pkg_postinst_${PN}-mdev() {
-if test "x$D" !=3D "x"; then
-	OPT=3D"-r $D"
-else
-	OPT=3D"-s"
-fi
+        if test "x$D" !=3D "x"; then
+	        OPT=3D"-r $D"
+        else
+        	OPT=3D"-s"
+        fi
 	update-rc.d $OPT mdev start 06 S .
 }
=20
+pkg_postinst_${PN}-inetd() {
+
+        if test "x$D" !=3D "x"; then
+	        OPT=3D"-r $D"
+        else
+	        OPT=3D"-s"
+        fi
+
+        update-rc.d $OPT busybox-inetd defaults 25 75
+}
+
+pkg_postrm_${PN}-inetd () {
+	if test "x$D" !=3D "x"; then
+		OPT=3D"-r $D"
+	else
+		OPT=3D""
+	fi
+	if test "$1" =3D "remove" -o "$1" =3D "purge"; then
+		if ! test -e "/etc/init.d/busybox-inetd"; then
+			update-rc.d $OPT busybox-inetd remove
+		fi
+	fi
+
+        echo "Install ${PN}-<service> to enable nedded services e.g.
httpd, telnetd ..."
+}
+
+pkg_postinst_${PN}-httpd() {
+        if test "x$D" !=3D "x"; then
+        	OPT=3D"-r $D"
+
+        else
+        	OPT=3D"-s"
+        fi
+
+        #remove from starting through inetd
+        if [ -f $D/etc/inetd.conf ]; then
+                #remove old entry if available
+                grep -v http $D/etc/inetd.conf > $D/etc/inetd.conf_new
+                mv $D/etc/inetd.conf_new $D/etc/inetd.conf
+        fi
+
+        update-rc.d $OPT busybox-httpd defaults  30 70
+}
+
+pkg_postrm_${PN}-httpd () {
+	if test "x$D" !=3D "x"; then
+		OPT=3D"-r $D"
+	else
+		OPT=3D""
+	fi
+	if test "$1" =3D "remove" -o "$1" =3D "purge"; then
+		if ! test -e "/etc/init.d/busybox-httpd"; then
+			update-rc.d $OPT busybox-httpd remove
+		fi
+	fi
+
+        echo "Install ${PN}-inetd again for enabling startup httpd by
inetd"
+}
+
+
+pkg_postinst_${PN}-telnetd() {
+        if test "x$D" !=3D "x"; then
+	        OPT=3D"-r $D"
+        else
+        	OPT=3D"-s"
+        fi
+
+        update-rc.d $OPT busybox-telnetd defaults 35 65
+
+        #remove from starting through inetd
+        if [ -f $D/etc/inetd.conf ]; then
+                #remove old entry if available
+                grep -v telnet $D/etc/inetd.conf >
$D/etc/inetd.conf_new
+                mv $D/etc/inetd.conf_new $D/etc/inetd.conf
+        fi
+
+}
+
+pkg_postrm_${PN}-telnetd () {
+	if test "x$D" !=3D "x"; then
+		OPT=3D"-r $D"
+	else
+		OPT=3D""
+	fi
+	if test "$1" =3D "remove" -o "$1" =3D "purge"; then
+		if ! test -e "/etc/init.d/busybox-telnetd"; then
+			update-rc.d $OPT busybox-telnetd remove
+		fi
+	fi
+
+        echo "Install ${PN}-inetd again for enabling startup telnetd by
inetd"
+}
+
diff --git a/recipes/busybox/busybox_1.16.2.bb
b/recipes/busybox/busybox_1.16.2.bb
index c5d27b7..6401bfa 100644
--- a/recipes/busybox/busybox_1.16.2.bb
+++ b/recipes/busybox/busybox_1.16.2.bb
@@ -29,6 +29,9 @@ SRC_URI =3D "\
   file://defconfig \
   file://mdev \
   file://mdev.conf \
+  file://inetd.conf \
+  file://busybox-inetd \
+  file://busybox-telnetd \
 "
=20
 SRC_URI[tarball.md5sum] =3D "2ba980f720a5bdce4ec05423519acc35"
@@ -49,11 +52,11 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/find-touchscreen.sh
${D}${sysconfdir}/mdev/
     install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/
=20
-    if grep "CONFIG_UDHCPD=3Dy" ${WORKDIR}/defconfig; then
+    if grep "CONFIG_UDHCPD=3Dy" ${S}/.config; then
           install -m 0755 ${WORKDIR}/busybox-udhcpd
${D}${sysconfdir}/init.d/
     fi
=20
-    if grep "CONFIG_UDHCPC=3Dy" ${WORKDIR}/defconfig; then
+    if grep "CONFIG_UDHCPC=3Dy" ${S}/.config; then
           install -d ${D}${sysconfdir}/udhcpc.d
           install -d ${D}${datadir}/udhcpc
           install -m 0755 ${WORKDIR}/simple.script
${D}${sysconfdir}/udhcpc.d/50default
diff --git a/recipes/busybox/files/busybox-inetd
b/recipes/busybox/files/busybox-inetd
new file mode 100644
index 0000000..f910a69
--- /dev/null
+++ b/recipes/busybox/files/busybox-inetd
@@ -0,0 +1,43 @@
+#!/bin/sh
+DAEMON=3D/usr/sbin/inetd
+NAME=3Dinetd
+DESC=3D"Busybox INETD"
+ARGS=3D"/etc/inetd.conf"
+
+test -f $DAEMON || exit 1
+
+set -e
+
+case "$1" in
+    start)
+        echo -n "starting $DESC: $NAME... "
+	if [ ! -f /etc/inetd.conf ]; then
+		echo "error: /etc/inetd.conf is missing."
+		exit 1
+	fi
+	/sbin/start-stop-daemon -S -b -n $NAME -a $DAEMON -- $ARGS
+	echo "done."
+	;;
+    stop)
+        echo -n "stopping $DESC: $NAME... "
+	/sbin/start-stop-daemon -K -n $NAME
+	echo "done."
+	;;
+    restart)
+        echo "restarting $DESC: $NAME... "
+ 	$0 stop
+	$0 start
+	echo "done."
+	;;
+    reload)
+    	echo -n "reloading $DESC: $NAME... "
+    	killall -HUP $(basename ${DAEMON})
+	echo "done."
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/recipes/busybox/files/busybox-telnetd
b/recipes/busybox/files/busybox-telnetd
new file mode 100644
index 0000000..9830e07
--- /dev/null
+++ b/recipes/busybox/files/busybox-telnetd
@@ -0,0 +1,39 @@
+#!/bin/sh
+DAEMON=3D/usr/sbin/telnetd
+NAME=3Dtelnetd
+DESC=3D"Busybox TELNET Daemon"
+ARGS=3D"-K"
+
+test -f $DAEMON || exit 1
+
+set -e
+
+case "$1" in
+    start)
+        echo -n "starting $DESC: $NAME... "
+	/sbin/start-stop-daemon -S -b -n $NAME -a $DAEMON -- $ARGS
+	echo "done."
+	;;
+    stop)
+        echo -n "stopping $DESC: $NAME... "
+	/sbin/start-stop-daemon -K -n $NAME
+	echo "done."
+	;;
+    restart)
+        echo "restarting $DESC: $NAME... "
+ 	$0 stop
+	$0 start
+	echo "done."
+	;;
+    reload)
+    	echo -n "reloading $DESC: $NAME... "
+    	killall -HUP $(basename ${DAEMON})
+	echo "done."
+	;;
+    *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/recipes/busybox/files/inetd.conf
b/recipes/busybox/files/inetd.conf
new file mode 100644
index 0000000..535e088
--- /dev/null
+++ b/recipes/busybox/files/inetd.conf
@@ -0,0 +1,9 @@
+# /etc/inetd.conf:  see inetd(8) for further informations.
+#
+# Internet superserver configuration database
+#
+#
+# Packages should modify this file by using update-inetd(8)
+#
+# <service_name> <sock_type> <proto> <flags> <user> <server_path>
<args>
+#
--=20
1.5.6.5


