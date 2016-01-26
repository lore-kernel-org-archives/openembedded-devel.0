Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D69306010B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jan 2016 06:17:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0Q6HiTi026758
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2016 22:17:45 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 25 Jan 2016 22:17:44 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jan 2016 14:16:36 +0800
Message-ID: <1453788996-24002-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] atop: add recipe
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
X-List-Received-Date: Tue, 26 Jan 2016 06:17:45 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add recipe for atop.

* remove bashisms for scripts
* fix permissions for executable files
* create volatile directory /var/volatile/log/atop
* implement status command in sysvinit script
* drop atopacctd which is excluded from most distribution such as Ubuntu
  and Fedora

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../atop/atop/fix-permissions.patch                | 52 ++++++++++++++++++
 .../atop/atop/remove-bashisms.patch                | 33 ++++++++++++
 .../atop/atop/sysvinit-implement-status.patch      | 27 ++++++++++
 .../recipes-support/atop/atop/volatiles.99_atop    |  1 +
 .../recipes-support/atop/atop/volatiles.atop.conf  |  1 +
 meta-oe/recipes-support/atop/atop_2.2.3.bb         | 62 ++++++++++++++++++++++
 6 files changed, 176 insertions(+)
 create mode 100644 meta-oe/recipes-support/atop/atop/fix-permissions.patch
 create mode 100644 meta-oe/recipes-support/atop/atop/remove-bashisms.patch
 create mode 100644 meta-oe/recipes-support/atop/atop/sysvinit-implement-status.patch
 create mode 100644 meta-oe/recipes-support/atop/atop/volatiles.99_atop
 create mode 100644 meta-oe/recipes-support/atop/atop/volatiles.atop.conf
 create mode 100644 meta-oe/recipes-support/atop/atop_2.2.3.bb

diff --git a/meta-oe/recipes-support/atop/atop/fix-permissions.patch b/meta-oe/recipes-support/atop/atop/fix-permissions.patch
new file mode 100644
index 0000000..ee74199
--- /dev/null
+++ b/meta-oe/recipes-support/atop/atop/fix-permissions.patch
@@ -0,0 +1,52 @@
+Update permissions of executable files that remove setuid bit and make everyone
+could read.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/Makefile b/Makefile
+index a65b9b6..21d9828 100644
+--- a/Makefile
++++ b/Makefile
+@@ -66,7 +66,7 @@ systemdinstall:	genericinstall
+ 		chmod 0644            $(DESTDIR)$(SYSDPATH)/atopacct.service
+ 		cp atop.cronsystemd   $(DESTDIR)$(CRNPATH)/atop
+ 		cp atop-pm.sh         $(DESTDIR)$(PMPATHD)
+-		chmod 0711            $(DESTDIR)$(PMPATHD)/atop-pm.sh
++		chmod 0755            $(DESTDIR)$(PMPATHD)/atop-pm.sh
+ 		#
+ 		# only when making on target system:
+ 		#
+@@ -91,11 +91,11 @@ sysvinstall:	genericinstall
+ 		#
+ 		if [   -d $(DESTDIR)$(PMPATH1) ]; 			\
+ 		then	cp 45atoppm $(DESTDIR)$(PMPATH1); 		\
+-			chmod 0711  $(DESTDIR)$(PMPATH1)/45atoppm;	\
++			chmod 0755  $(DESTDIR)$(PMPATH1)/45atoppm;	\
+ 		fi
+ 		if [ -d $(DESTDIR)$(PMPATH2) ]; 			\
+ 		then	cp 45atoppm $(DESTDIR)$(PMPATH2);		\
+-			chmod 0711  $(DESTDIR)$(PMPATH2)/45atoppm;	\
++			chmod 0755  $(DESTDIR)$(PMPATH2)/45atoppm;	\
+ 		fi
+ 		#
+ 		#
+@@ -139,7 +139,7 @@ genericinstall:	atop atopacctd
+ 		#
+ 		cp atop   		$(DESTDIR)$(BINPATH)/atop
+ 		chown root		$(DESTDIR)$(BINPATH)/atop
+-		chmod 04711 		$(DESTDIR)$(BINPATH)/atop
++		chmod 0755 		$(DESTDIR)$(BINPATH)/atop
+ 		ln -sf atop             $(DESTDIR)$(BINPATH)/atopsar
+ 		cp atopacctd  		$(DESTDIR)$(SBINPATH)/atopacctd
+ 		chown root		$(DESTDIR)$(SBINPATH)/atopacctd
+@@ -147,7 +147,7 @@ genericinstall:	atop atopacctd
+ 		cp atop   		$(DESTDIR)$(BINPATH)/atop-$(VERS)
+ 		ln -sf atop-$(VERS)     $(DESTDIR)$(BINPATH)/atopsar-$(VERS)
+ 		cp atop.daily    	$(DESTDIR)$(SCRPATH)
+-		chmod 0711 	 	$(DESTDIR)$(SCRPATH)/atop.daily
++		chmod 0755 	 	$(DESTDIR)$(SCRPATH)/atop.daily
+ 		cp man/atop.1    	$(DESTDIR)$(MAN1PATH)
+ 		cp man/atopsar.1 	$(DESTDIR)$(MAN1PATH)
+ 		cp man/atoprc.5  	$(DESTDIR)$(MAN5PATH)
diff --git a/meta-oe/recipes-support/atop/atop/remove-bashisms.patch b/meta-oe/recipes-support/atop/atop/remove-bashisms.patch
new file mode 100644
index 0000000..f1fcbfe
--- /dev/null
+++ b/meta-oe/recipes-support/atop/atop/remove-bashisms.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/atop-pm.sh b/atop-pm.sh
+index 7f41a86..3ff4ab5 100755
+--- a/atop-pm.sh
++++ b/atop-pm.sh
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ case "$1" in
+ 	pre)	/usr/bin/systemctl stop atop
+diff --git a/atop.daily b/atop.daily
+index 24d33bd..f29bd94 100755
+--- a/atop.daily
++++ b/atop.daily
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ 
+ CURDAY=`date +%Y%m%d`
+ LOGPATH=/var/log/atop
+@@ -16,7 +16,7 @@ then
+ 
+ 	while ps -p `cat $PIDFILE` > /dev/null
+ 	do
+-		let CNT+=1
++		CNT=$((CNT+1))
+ 
+ 		if [ $CNT -gt 5 ]
+ 		then
diff --git a/meta-oe/recipes-support/atop/atop/sysvinit-implement-status.patch b/meta-oe/recipes-support/atop/atop/sysvinit-implement-status.patch
new file mode 100644
index 0000000..5994d3e
--- /dev/null
+++ b/meta-oe/recipes-support/atop/atop/sysvinit-implement-status.patch
@@ -0,0 +1,27 @@
+Implement the sub-command status.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/atop.init b/atop.init
+index 108bdc5..9f89fad 100755
+--- a/atop.init
++++ b/atop.init
+@@ -18,6 +18,8 @@
+ # Check existance of binaries 
+ [ -f /usr/bin/atop ] || exit 0
+ 
++[ -f /etc/init.d/functions ] && . /etc/init.d/functions
++
+ PIDFILE=/var/run/atop.pid
+ RETVAL=0
+ 
+@@ -63,6 +65,7 @@ case "$1" in
+ 	;;
+ 
+   status)
++	status atop
+ 	;;
+ 
+   reload)
diff --git a/meta-oe/recipes-support/atop/atop/volatiles.99_atop b/meta-oe/recipes-support/atop/atop/volatiles.99_atop
new file mode 100644
index 0000000..24ea3f2
--- /dev/null
+++ b/meta-oe/recipes-support/atop/atop/volatiles.99_atop
@@ -0,0 +1 @@
+d root root 0755 /var/volatile/log/atop none
diff --git a/meta-oe/recipes-support/atop/atop/volatiles.atop.conf b/meta-oe/recipes-support/atop/atop/volatiles.atop.conf
new file mode 100644
index 0000000..2f23000
--- /dev/null
+++ b/meta-oe/recipes-support/atop/atop/volatiles.atop.conf
@@ -0,0 +1 @@
+d               /var/volatile/log/atop               -       -       -       -
diff --git a/meta-oe/recipes-support/atop/atop_2.2.3.bb b/meta-oe/recipes-support/atop/atop_2.2.3.bb
new file mode 100644
index 0000000..21311e3
--- /dev/null
+++ b/meta-oe/recipes-support/atop/atop_2.2.3.bb
@@ -0,0 +1,62 @@
+SUMMARY = "Monitor for system resources and process activity"
+DESCRIPTION = "Atop is an ASCII full-screen performance monitor for Linux that \
+is capable of reporting the activity of all processes (even if processes have \
+finished during the interval), daily logging of system and process activity for \
+long-term analysis, highlighting overloaded system resources by using colors, \
+etc. At regular intervals, it shows system-level activity related to the CPU, \
+memory, swap, disks (including LVM) and network layers, and for every process \
+(and thread) it shows e.g. the CPU utilization, memory growth, disk \
+utilization, priority, username, state, and exit code."
+HOMEPAGE = "http://www.atoptool.nl"
+SECTION = "console/utils"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
+
+DEPENDS = "ncurses zlib"
+
+ATOP_VER = "${@'-'.join(d.getVar('PV', True).rsplit('.', 1))}"
+
+SRC_URI = " \
+    http://www.atoptool.nl/download/${BPN}-${ATOP_VER}.tar.gz \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://volatiles.atop.conf', 'file://volatiles.99_atop', d)} \
+    file://remove-bashisms.patch \
+    file://fix-permissions.patch \
+    file://sysvinit-implement-status.patch \
+"
+
+SRC_URI[md5sum] = "034dc1544f2ec4e4d2c739d320dc326d"
+SRC_URI[sha256sum] = "c785b8a2355be28b3de6b58a8ea4c4fcab8fadeaa57a99afeb03c66fac8e055d"
+
+S = "${WORKDIR}/${BPN}-${ATOP_VER}"
+
+do_compile() {
+    oe_runmake all
+}
+
+do_install() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        make DESTDIR=${D} VERS=${ATOP_VER} SYSDPATH=${systemd_system_unitdir} \
+            PMPATHD=${systemd_unitdir}/system-sleep systemdinstall
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        install -m 644 ${WORKDIR}/volatiles.atop.conf ${D}${sysconfdir}/tmpfiles.d/atop.conf
+        rm -f ${D}${systemd_system_unitdir}/atopacct.service
+    else
+        make DESTDIR=${D} VERS=${ATOP_VER} sysvinstall
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 644 ${WORKDIR}/volatiles.99_atop ${D}${sysconfdir}/default/volatiles/99_atop
+        rm -f ${D}${sysconfdir}/init.d/atopacct
+    fi
+
+    # remove atopacct related files
+    rm -rf ${D}${sbindir} ${D}${mandir}/man8
+}
+
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "atop.service"
+SYSTEMD_AUTO_ENABLE = "disable"
+
+FILES_${PN} += "${systemd_unitdir}/system-sleep"
+
+RDEPENDS_${PN} = "procps"
-- 
2.6.1


