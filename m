Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFED78240
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 09:28:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7T9SGbx019322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 02:28:17 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 29 Aug 2017 02:28:16 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Aug 2017 17:27:27 +0800
Message-ID: <6286ca12b20fb1972ee77d1fc217eb7ebbf60080.1503998700.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1503998700.git.jackie.huang@windriver.com>
References: <cover.1503998700.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] corosync: add support for extra features
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
X-List-Received-Date: Tue, 29 Aug 2017 09:28:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Add support for features: dbus qdevice qnetd snmp
* Add related PACKAGECONFIG
* inherit useradd to add proper user for qnetd service

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-extended/corosync/corosync_2.4.2.bb    | 30 +++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb b/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
index 2f3aef299..7d5a87e4c 100644
--- a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
+++ b/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://corosync.github.io/corosync/"
 
 SECTION = "base"
 
-inherit autotools pkgconfig systemd
+inherit autotools pkgconfig systemd useradd
 
 SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "547fa78704da53aa35912be58d31035f"
@@ -16,13 +16,23 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a85eb4ce24033adb6088dd1d6ffc5e5d"
 
 DEPENDS = "groff-native nss libqb"
 
-SYSTEMD_SERVICE_${PN} = "corosync.service corosync-notifyd.service"
+SYSTEMD_SERVICE_${PN} = "corosync.service corosync-notifyd.service \
+                         ${@bb.utils.contains('PACKAGECONFIG', 'qdevice', 'corosync-qdevice.service', '', d)} \
+                         ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'corosync-qnetd.service', '', d)} \
+"
 SYSTEMD_AUTO_ENABLE = "enable"
 
 INITSCRIPT_NAME = "corosync-daemon"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+                   dbus qdevice qnetd snmp \
+"
 
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
+PACKAGECONFIG[qdevice] = "--enable-qdevices,--disable-qdevices"
+PACKAGECONFIG[qnetd] = "--enable-qnetd,--disable-qnetd"
+PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
+PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
 PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_system_unitdir},--disable-systemd --without-systemddir,systemd"
 
 EXTRA_OECONF = "ac_cv_path_BASHPATH=${base_bindir}/bash"
@@ -43,12 +53,26 @@ do_install_append() {
     install -d ${D}${sysconfdir}/default/volatiles
     echo "d root root 0755 ${localstatedir}/log/cluster none" > ${D}${sysconfdir}/default/volatiles/05_corosync
 
+    if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true', 'false', d)}; then
+        chown -R coroqnetd:coroqnetd ${D}${sysconfdir}/${BPN}/qnetd
+        echo "d coroqnetd coroqnetd 0770 /var/run/corosync-qnetd none" >> ${D}${sysconfdir}/default/volatiles/05_corosync
+    fi
+
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d ${localstatedir}/log/cluster - - - -" > ${D}${sysconfdir}/tmpfiles.d/corosync.conf
+
+        if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true', 'false', d)}; then
+            install -m 0644 ${S}/conf/tmpfiles.d/corosync-qnetd.conf ${D}${sysconfdir}/tmpfiles.d
+        fi
     fi
 }
 
 RDEPENDS_${PN} += "bash"
 
 FILES_${PN}-dbg += "${libexecdir}/lcrso/.debug"
+FILES_${PN}-doc += "${datadir}/snmp/mibs/COROSYNC-MIB.txt"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system coroqnetd"
+USERADD_PARAM_${PN} = "--system -d / -M -s /bin/nologin -c 'User for corosync-qnetd' -g coroqnetd coroqnetd"
-- 
2.11.0


