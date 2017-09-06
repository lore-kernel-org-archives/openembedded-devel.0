Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE4DB77B95
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v86JThBD032250
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:43 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:42 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:11 -0500
Message-ID: <1504725809-12825-14-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/31] corosync: Requires net-snmp from meta-networking
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:41 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../recipes-extended/corosync/corosync_2.4.2.bb    | 78 ++++++++++++++++++++++
 .../recipes-extended/corosync/corosync_2.4.2.bb    | 78 ----------------------
 2 files changed, 78 insertions(+), 78 deletions(-)
 create mode 100644 meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
 delete mode 100644 meta-oe/recipes-extended/corosync/corosync_2.4.2.bb

diff --git a/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb b/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
new file mode 100644
index 0000000..7d5a87e
--- /dev/null
+++ b/meta-networking/recipes-extended/corosync/corosync_2.4.2.bb
@@ -0,0 +1,78 @@
+SUMMARY = "The Corosync Cluster Engine and Application Programming Interfaces"
+DESCRIPTION = "This package contains the Corosync Cluster Engine Executive, several default \
+APIs and libraries, default configuration files, and an init script."
+HOMEPAGE = "http://corosync.github.io/corosync/"
+
+SECTION = "base"
+
+inherit autotools pkgconfig systemd useradd
+
+SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
+SRC_URI[md5sum] = "547fa78704da53aa35912be58d31035f"
+SRC_URI[sha256sum] = "f26e3011309fe4bcce94b1dc20ea8c462f19483a73f3ca62f13b925d011a4ba9"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
+
+DEPENDS = "groff-native nss libqb"
+
+SYSTEMD_SERVICE_${PN} = "corosync.service corosync-notifyd.service \
+                         ${@bb.utils.contains('PACKAGECONFIG', 'qdevice', 'corosync-qdevice.service', '', d)} \
+                         ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'corosync-qnetd.service', '', d)} \
+"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+INITSCRIPT_NAME = "corosync-daemon"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+                   dbus qdevice qnetd snmp \
+"
+
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
+PACKAGECONFIG[qdevice] = "--enable-qdevices,--disable-qdevices"
+PACKAGECONFIG[qnetd] = "--enable-qnetd,--disable-qnetd"
+PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
+PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_system_unitdir},--disable-systemd --without-systemddir,systemd"
+
+EXTRA_OECONF = "ac_cv_path_BASHPATH=${base_bindir}/bash"
+EXTRA_OEMAKE = "tmpfilesdir_DATA="
+
+do_configure_prepend() {
+    ( cd ${S}
+    ${S}/autogen.sh )
+}
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/sysconfig/
+    install -m 0644 ${S}/init/corosync.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync
+    install -m 0644 ${S}/tools/corosync-notifyd.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync-notifyd
+
+    rm -rf "${D}${localstatedir}/run"
+
+    install -d ${D}${sysconfdir}/default/volatiles
+    echo "d root root 0755 ${localstatedir}/log/cluster none" > ${D}${sysconfdir}/default/volatiles/05_corosync
+
+    if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true', 'false', d)}; then
+        chown -R coroqnetd:coroqnetd ${D}${sysconfdir}/${BPN}/qnetd
+        echo "d coroqnetd coroqnetd 0770 /var/run/corosync-qnetd none" >> ${D}${sysconfdir}/default/volatiles/05_corosync
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d ${localstatedir}/log/cluster - - - -" > ${D}${sysconfdir}/tmpfiles.d/corosync.conf
+
+        if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true', 'false', d)}; then
+            install -m 0644 ${S}/conf/tmpfiles.d/corosync-qnetd.conf ${D}${sysconfdir}/tmpfiles.d
+        fi
+    fi
+}
+
+RDEPENDS_${PN} += "bash"
+
+FILES_${PN}-dbg += "${libexecdir}/lcrso/.debug"
+FILES_${PN}-doc += "${datadir}/snmp/mibs/COROSYNC-MIB.txt"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system coroqnetd"
+USERADD_PARAM_${PN} = "--system -d / -M -s /bin/nologin -c 'User for corosync-qnetd' -g coroqnetd coroqnetd"
diff --git a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb b/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
deleted file mode 100644
index 7d5a87e..0000000
--- a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
+++ /dev/null
@@ -1,78 +0,0 @@
-SUMMARY = "The Corosync Cluster Engine and Application Programming Interfaces"
-DESCRIPTION = "This package contains the Corosync Cluster Engine Executive, several default \
-APIs and libraries, default configuration files, and an init script."
-HOMEPAGE = "http://corosync.github.io/corosync/"
-
-SECTION = "base"
-
-inherit autotools pkgconfig systemd useradd
-
-SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "547fa78704da53aa35912be58d31035f"
-SRC_URI[sha256sum] = "f26e3011309fe4bcce94b1dc20ea8c462f19483a73f3ca62f13b925d011a4ba9"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
-
-DEPENDS = "groff-native nss libqb"
-
-SYSTEMD_SERVICE_${PN} = "corosync.service corosync-notifyd.service \
-                         ${@bb.utils.contains('PACKAGECONFIG', 'qdevice', 'corosync-qdevice.service', '', d)} \
-                         ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'corosync-qnetd.service', '', d)} \
-"
-SYSTEMD_AUTO_ENABLE = "enable"
-
-INITSCRIPT_NAME = "corosync-daemon"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
-                   dbus qdevice qnetd snmp \
-"
-
-PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
-PACKAGECONFIG[qdevice] = "--enable-qdevices,--disable-qdevices"
-PACKAGECONFIG[qnetd] = "--enable-qnetd,--disable-qnetd"
-PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
-PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_system_unitdir},--disable-systemd --without-systemddir,systemd"
-
-EXTRA_OECONF = "ac_cv_path_BASHPATH=${base_bindir}/bash"
-EXTRA_OEMAKE = "tmpfilesdir_DATA="
-
-do_configure_prepend() {
-    ( cd ${S}
-    ${S}/autogen.sh )
-}
-
-do_install_append() {
-    install -d ${D}${sysconfdir}/sysconfig/
-    install -m 0644 ${S}/init/corosync.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync
-    install -m 0644 ${S}/tools/corosync-notifyd.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync-notifyd
-
-    rm -rf "${D}${localstatedir}/run"
-
-    install -d ${D}${sysconfdir}/default/volatiles
-    echo "d root root 0755 ${localstatedir}/log/cluster none" > ${D}${sysconfdir}/default/volatiles/05_corosync
-
-    if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true', 'false', d)}; then
-        chown -R coroqnetd:coroqnetd ${D}${sysconfdir}/${BPN}/qnetd
-        echo "d coroqnetd coroqnetd 0770 /var/run/corosync-qnetd none" >> ${D}${sysconfdir}/default/volatiles/05_corosync
-    fi
-
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${sysconfdir}/tmpfiles.d
-        echo "d ${localstatedir}/log/cluster - - - -" > ${D}${sysconfdir}/tmpfiles.d/corosync.conf
-
-        if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true', 'false', d)}; then
-            install -m 0644 ${S}/conf/tmpfiles.d/corosync-qnetd.conf ${D}${sysconfdir}/tmpfiles.d
-        fi
-    fi
-}
-
-RDEPENDS_${PN} += "bash"
-
-FILES_${PN}-dbg += "${libexecdir}/lcrso/.debug"
-FILES_${PN}-doc += "${datadir}/snmp/mibs/COROSYNC-MIB.txt"
-
-USERADD_PACKAGES = "${PN}"
-GROUPADD_PARAM_${PN} = "--system coroqnetd"
-USERADD_PARAM_${PN} = "--system -d / -M -s /bin/nologin -c 'User for corosync-qnetd' -g coroqnetd coroqnetd"
-- 
1.8.3.1


