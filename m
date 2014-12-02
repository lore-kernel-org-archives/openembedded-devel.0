Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8677E60144
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Dec 2014 00:43:52 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so12189462pad.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 16:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=v8sbBgxeZil4/010JowuIF3Wwv9EM3og+9jVjpQQGsU=;
	b=VGlA/hAyjYcUFgaPdByNfmHZzXsRIKinhSMnZsWt8ugVUnkpFohN1Oj1dDRYpQdBn2
	ttgT1NJSODGXOuJPtsbdHxOKB8Z/DXUZR1QseFLOkgGWnamX42oUQudRQpvrENAq20QE
	eAmrvrEEX8cjYCRsCT/XIY7Tu/wUcWmbEwqpJtC2Rpg1fKOGxh6oK3los7nvIXHpwiSH
	hqURYOHyEtzlid6W7IQfwxrqLD33yxxyF5RHcnngORJXP80kJBXos22KeK3cIaiPjBap
	4a9bEuwkFos0joAqNARQH5KAL7AAuDBMSOBgyZMZKT+S9o6jhrmAj6Ld+tfDYUAIlmNB
	g3uA==
X-Received: by 10.66.65.165 with SMTP id y5mr105778066pas.70.1417481032965;
	Mon, 01 Dec 2014 16:43:52 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id oz7sm5121813pbb.14.2014.12.01.16.43.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 01 Dec 2014 16:43:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Dec 2014 16:43:47 -0800
Message-Id: <1417481028-26644-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH 1/2] New package: netkit-rwho
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Dec 2014 00:44:01 -0000

This adds rwho and rwhod

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-netkit/netkit-rwho/files/rwhod         | 71 ++++++++++++++++++
 .../recipes-netkit/netkit-rwho/files/rwhod.default |  2 +
 .../recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb | 85 ++++++++++++++++++++++
 3 files changed, 158 insertions(+)
 create mode 100755 meta-networking/recipes-netkit/netkit-rwho/files/rwhod
 create mode 100644 meta-networking/recipes-netkit/netkit-rwho/files/rwhod.default
 create mode 100644 meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb

diff --git a/meta-networking/recipes-netkit/netkit-rwho/files/rwhod b/meta-networking/recipes-netkit/netkit-rwho/files/rwhod
new file mode 100755
index 0000000..92104db
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rwho/files/rwhod
@@ -0,0 +1,71 @@
+#!/bin/sh
+
+### BEGIN INIT INFO
+# Provides:        rwhod 
+# Required-Start:  $network $remote_fs $syslog
+# Required-Stop:   $network $remote_fs $syslog
+# Default-Start:   2 3 4 5
+# Default-Stop:    0 1 6
+# Short-Description: Server for rwho and ruptime services
+### END INIT INFO
+
+PATH=/sbin:/bin:/usr/bin:/usr/sbin
+
+DAEMON=/usr/sbin/rwhod
+PIDFILE=/var/run/rwhod.pid
+CONF_FILE="/etc/default/rwhod"
+DESC="Who daemon "
+# default options. Change them in /etc/default/rwhod
+RWHOD_OPTIONS="-b"
+
+# rwhod	init.d script for ntpdc from ntp.isc.org
+test -f $DAEMON || exit 0
+
+# Source function library.
+. /etc/init.d/functions
+
+[ -r $CONF_FILE ] && . $CONF_FILE
+
+startdaemon(){
+	echo -n "Starting $DESC" " rwhod "
+	start-stop-daemon --start --quiet --oknodo --pidfile $PIDFILE --exec $DAEMON -- $RWHOD_OPTIONS
+	echo "done"
+}
+stopdaemon(){
+	echo -n "Stopping $DESC" " rwhod "
+	start-stop-daemon --stop --quiet --oknodo --exec $DAEMON
+	echo "done"
+}
+
+case "$1" in
+  start)
+	startdaemon
+	;;
+  stop)
+  	stopdaemon
+	;;
+  force-reload)
+  	stopdaemon
+	startdaemon
+	;;
+  restart)
+	stopdaemon
+    sleep 1
+	startdaemon 
+	;;
+  reload)
+	stopdaemon
+    sleep 1
+	startdaemon
+	;;
+  status)
+	status /usr/sbin/rwhod;
+	exit $?
+	;;
+  *)
+	echo "Usage: rwhod { start | stop | status | restart | reload }" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/meta-networking/recipes-netkit/netkit-rwho/files/rwhod.default b/meta-networking/recipes-netkit/netkit-rwho/files/rwhod.default
new file mode 100644
index 0000000..62d3a94
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rwho/files/rwhod.default
@@ -0,0 +1,2 @@
+#Options for the rwhod daemon.
+RWHOD_OPTIONS="-b"
diff --git a/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
new file mode 100644
index 0000000..e2b355f
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rwho/netkit-rwho_0.17.bb
@@ -0,0 +1,85 @@
+DESCRIPTION = "netkit-rwho includes, ruptime rwho and rwhod (Daemon to maintain data for rwho/ruptime)"
+SECTION = "networking"
+HOMEPAGE="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
+LICENSE = "BSD"
+
+LIC_FILES_CHKSUM = "file://rwho/rwho.c;beginline=2;endline=3;md5=5a85f13c0142d72fc378e00f15da5b9e"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-rwho/netkit-rwho_${PV}.orig.tar.gz;name=archive \
+            ${DEBIAN_MIRROR}/main/n/netkit-rwho/netkit-rwho_${PV}-13.debian.tar.gz;name=patch13 \
+            file://rwhod \
+            file://rwhod.default \
+"
+
+SRC_URI[archive.md5sum] = "0f71620d45d472f89134ba0d74242e75"
+SRC_URI[archive.sha256sum] = "0409e2ce4bfdb2dacb2c193d0fedfc49bb975cb057c5c6b0ffcca603a1188da7"
+SRC_URI[patch13.md5sum] = "82ed5a3c6b0bbf00b36508b9787963b9"
+SRC_URI[patch13.sha256sum] = "53aefa27d98b565bf756db57120c03bd224a238e45699d92076420272a6eba8e"
+
+inherit autotools-brokensep useradd update-rc.d update-alternatives
+
+CFLAGS += " -D_GNU_SOURCE"
+
+debian_do_patch() {
+    cd ${S}
+    while read line; do patch -p1 < ${WORKDIR}/debian/patches/$line; done < ${WORKDIR}/debian/patches/series
+}
+
+python do_patch() {
+    bb.build.exec_func('debian_do_patch', d)
+    bb.build.exec_func('patch_do_patch', d)
+}
+
+do_configure () {
+    ./configure --prefix=${prefix}
+    echo "LDFLAGS=${LDFLAGS}" >> MCONFIG
+}
+
+do_install () {
+    # rwho & ruptime
+    install -d ${D}${bindir}
+    install -d ${D}${mandir}/man1
+    #rwhod
+    install -d ${D}${sbindir}
+    install -d ${D}${mandir}/man8
+    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/default
+    sed -i 's/install -s/install/' rwho/Makefile
+    sed -i 's/install -s/install/' ruptime/Makefile
+    sed -i 's/install -s/install/' rwhod/Makefile
+    oe_runmake 'INSTALLROOT=${D}' 'BINMODE=0755' \
+    'DAEMONMODE=0755' 'MANMODE=0644' \
+    'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
+    'MANDIR=${mandir}' install
+
+    install -m 0644 ${WORKDIR}/rwhod.default ${D}${sysconfdir}/default/rwhod
+    install -m 755 ${WORKDIR}/rwhod ${D}${sysconfdir}/init.d
+
+    mkdir -p -m 755 ${D}${localstatedir}/spool/rwho
+    chown -R rwhod ${D}${localstatedir}/spool/rwho
+}
+
+pkg_postinst_${PN}-server() {
+    ${sysconfdir}/init.d/rwhod start
+}
+
+pkg_postrm_${PN}-server() {
+    ${sysconfdir}/init.d/rwhod stop 
+}
+
+INITSCRIPT_NAME = "rwhod"
+INITSCRIPT_PARAM = "defaults 85 15"
+
+USERADD_PACKAGES = "${PN}-server"
+GROUPADD_PARAM_${PN}-server = "--system rwhod"
+USERADD_PARAM_${PN}-server = "--system -g rwhod --home-dir  ${localstatedir}/spool/rwho \
+        --no-create-home  --shell /bin/false rwhod"
+
+INSANE_SKIP_${PN} = "already-stripped"
+
+PACKAGES = "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
+FILES_${PN}-client = "${bindir}/*"
+FILES_${PN}-server = "${sbindir}/* ${localstatedir} ${sysconfdir}/default/* ${sysconfdir}/init.d/*"
+FILES_${PN}-doc = "${mandir}"
+FILES_${PN}-dbg = "${prefix}/src/debug \
+            ${bindir}/.debug ${sbindir}/.debug"
-- 
1.9.1


