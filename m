Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB2676017E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 08:38:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8T8cZDn013494
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 01:38:35 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Sep 2014 01:38:35 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 29 Sep 2014 16:37:32 +0800
Message-ID: <1411979852-32425-2-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1411979852-32425-1-git-send-email-Chong.Lu@windriver.com>
References: <1411979852-32425-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2 2/2] quagga: add systemd service file
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
X-List-Received-Date: Mon, 29 Sep 2014 08:38:37 -0000
Content-Type: text/plain

Add systemd service for quagga.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../recipes-protocols/quagga/files/babeld.service  | 14 +++++++
 .../recipes-protocols/quagga/files/bgpd.service    | 14 +++++++
 .../recipes-protocols/quagga/files/isisd.service   | 14 +++++++
 .../recipes-protocols/quagga/files/ospf6d.service  | 14 +++++++
 .../recipes-protocols/quagga/files/ospfd.service   | 14 +++++++
 .../recipes-protocols/quagga/files/ripd.service    | 14 +++++++
 .../recipes-protocols/quagga/files/ripngd.service  | 14 +++++++
 .../recipes-protocols/quagga/files/zebra.service   | 15 +++++++
 .../recipes-protocols/quagga/quagga.inc            | 49 +++++++++++++++++++++-
 9 files changed, 161 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/babeld.service
 create mode 100644 meta-networking/recipes-protocols/quagga/files/bgpd.service
 create mode 100644 meta-networking/recipes-protocols/quagga/files/isisd.service
 create mode 100644 meta-networking/recipes-protocols/quagga/files/ospf6d.service
 create mode 100644 meta-networking/recipes-protocols/quagga/files/ospfd.service
 create mode 100644 meta-networking/recipes-protocols/quagga/files/ripd.service
 create mode 100644 meta-networking/recipes-protocols/quagga/files/ripngd.service
 create mode 100644 meta-networking/recipes-protocols/quagga/files/zebra.service

diff --git a/meta-networking/recipes-protocols/quagga/files/babeld.service b/meta-networking/recipes-protocols/quagga/files/babeld.service
new file mode 100644
index 0000000..dd344b0
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/babeld.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Babel routing daemon
+BindTo=zebra.service
+After=zebra.service
+ConditionPathExists=@SYSCONFDIR@/quagga/babeld.conf
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/quagga
+ExecStart=@SBINDIR@/babeld -d $babeld_options -f /etc/quagga/babeld.conf
+Restart=on-abort
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/bgpd.service b/meta-networking/recipes-protocols/quagga/files/bgpd.service
new file mode 100644
index 0000000..164c817
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/bgpd.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=BGP routing daemon
+BindTo=zebra.service
+After=zebra.service
+ConditionPathExists=@SYSCONFDIR@/quagga/bgpd.conf
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/quagga
+ExecStart=@SBINDIR@/bgpd -d $bgpd_options -f /etc/quagga/bgpd.conf
+Restart=on-abort
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/isisd.service b/meta-networking/recipes-protocols/quagga/files/isisd.service
new file mode 100644
index 0000000..9bfe7b6
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/isisd.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=IS-IS routing daemon
+BindTo=zebra.service
+After=zebra.service
+ConditionPathExists=@SYSCONFDIR@/quagga/isisd.conf
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/quagga
+ExecStart=@SBINDIR@/isisd -d $isisd_options -f /etc/quagga/isisd.conf
+Restart=on-abort
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/ospf6d.service b/meta-networking/recipes-protocols/quagga/files/ospf6d.service
new file mode 100644
index 0000000..4b8ebf8
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/ospf6d.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=OSPF routing daemon for IPv6
+BindTo=zebra.service
+After=zebra.service
+ConditionPathExists=@SYSCONFDIR@/quagga/ospf6d.conf
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/quagga
+ExecStart=@SBINDIR@/ospf6d -d $ospf6d_options -f /etc/quagga/ospf6d.conf
+Restart=on-abort
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/ospfd.service b/meta-networking/recipes-protocols/quagga/files/ospfd.service
new file mode 100644
index 0000000..f9f5031
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/ospfd.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=OSPF routing daemon
+BindTo=zebra.service
+After=zebra.service
+ConditionPathExists=@SYSCONFDIR@/quagga/ospfd.conf
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/quagga
+ExecStart=@SBINDIR@/ospfd -d $ospfd_options -f /etc/quagga/ospfd.conf
+Restart=on-abort
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/ripd.service b/meta-networking/recipes-protocols/quagga/files/ripd.service
new file mode 100644
index 0000000..5dfd28b
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/ripd.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=RIP routing daemon
+BindTo=zebra.service
+After=zebra.service
+ConditionPathExists=@SYSCONFDIR@/quagga/ripd.conf
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/quagga
+ExecStart=@SBINDIR@/ripd -d $ripd_options -f /etc/quagga/ripd.conf
+Restart=on-abort
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/ripngd.service b/meta-networking/recipes-protocols/quagga/files/ripngd.service
new file mode 100644
index 0000000..936b81f
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/ripngd.service
@@ -0,0 +1,14 @@
+i[Unit]
+Description=RIP routing daemon for IPv6
+BindTo=zebra.service
+After=zebra.service
+ConditionPathExists=@SYSCONFDIR@/quagga/ripngd.conf
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/quagga
+ExecStart=@SBINDIR@/ripngd -d $ripngd_options -f /etc/quagga/ripngd.conf
+Restart=on-abort
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/files/zebra.service b/meta-networking/recipes-protocols/quagga/files/zebra.service
new file mode 100644
index 0000000..afdd9e5
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/zebra.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=GNU Zebra routing manager
+Wants=network.target
+Before=network.target
+ConditionPathExists=@SYSCONFDIR@/quagga/zebra.conf
+
+[Service]
+Type=forking
+EnvironmentFile=-@SYSCONFDIR@/default/quagga
+ExecStartPre=@BASE_SBINDIR@/ip route flush proto zebra
+ExecStart=@SBINDIR@/zebra -d $zebra_options -f /etc/quagga/zebra.conf
+Restart=on-abort
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index b1c8b5b..055f085 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -31,13 +31,31 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz; \
            file://quagga.pam \
            file://ripd-fix-two-bugs-after-received-SIGHUP.patch \
            file://quagga-Avoid-duplicate-connected-address.patch \
+           file://babeld.service \
+           file://bgpd.service \
+           file://isisd.service \
+           file://ospf6d.service \
+           file://ospfd.service \
+           file://ripd.service \
+           file://ripngd.service \
+           file://zebra.service \
 "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
 PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
 
-inherit autotools update-rc.d useradd
+inherit autotools update-rc.d useradd systemd
+
+SYSTEMD_PACKAGES = "${PN} ${PN}-babeld ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
+SYSTEMD_SERVICE_${PN}-babeld = "babeld.service"
+SYSTEMD_SERVICE_${PN}-bgpd = "bgpd.service"
+SYSTEMD_SERVICE_${PN}-isisd = "isisd.service"
+SYSTEMD_SERVICE_${PN}-ospf6d = "ospf6d.service"
+SYSTEMD_SERVICE_${PN}-ospfd = "ospfd.service"
+SYSTEMD_SERVICE_${PN}-ripd = "ripd.service"
+SYSTEMD_SERVICE_${PN}-ripngd = "ripngd.service"
+SYSTEMD_SERVICE_${PN} = "zebra.service"
 
 EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
                 --localstatedir=${localstatedir}/run/quagga \
@@ -108,6 +126,35 @@ do_install () {
         fi
     done
 
+    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d /var/run/quagga 0755 quagga quagga -" \
+        > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+    fi
+
+    # Remove sysinit script if sysvinit is not in DISTRO_FEATURES
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
+        rm -rf ${D}${sysconfdir}/init.d/
+    fi
+
+    install -d ${D}${systemd_unitdir}/system
+    for i in babeld bgpd isisd ospf6d ospfd ripd ripngd zebra; do
+        install -m 0644 ${WORKDIR}/$i.service ${D}${systemd_unitdir}/system
+    done
+    sed -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
+        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+        -e 's,@SBINDIR@,${sbindir},g' \
+        -i ${D}${systemd_unitdir}/system/*.service
+}
+
+DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
+pkg_postinst_${PN} () {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd sysvinit', 'true', 'false', d)}; then
+        if [ -n "$D" ]; then
+            OPTS="--root=$D"
+        fi
+        systemctl $OPTS mask quagga.service
+    fi
 }
 
 # Split into a main package and separate per-protocol packages
-- 
1.9.1


