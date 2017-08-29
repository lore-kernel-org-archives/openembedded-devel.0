Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1DD78240
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 09:28:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7T9SFps020332
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 02:28:15 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 29 Aug 2017 02:28:14 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Aug 2017 17:27:26 +0800
Message-ID: <8e8ae99f268883f5180be729a498f259a8571d73.1503998700.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1503998700.git.jackie.huang@windriver.com>
References: <cover.1503998700.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] corosync: fixes for sysvinit and systemd
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
X-List-Received-Date: Tue, 29 Aug 2017 09:28:14 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Replace ${systemd_unitdir}/system with ${systemd_system_unitdir}

* Remove the upstar settings and don't install upstar config files

* Add volatile for sysvinit and tmpfiles for systemd

* Set the correct bash path for init scripts to avoid QA issue:
| corosync-2.4.2: /usr/share/corosync/corosync contained in package corosync
  requires /tmp/hosttools/bash, but no providers found in RDEPENDS_corosync?
  [file-rdeps]

* The systemd services are intalled properly by "make install",
  no need to install manually.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-extended/corosync/corosync_2.4.2.bb    | 24 ++++++++++------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb b/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
index ec1deaca5..2f3aef299 100644
--- a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
+++ b/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
@@ -23,9 +23,10 @@ INITSCRIPT_NAME = "corosync-daemon"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 
-PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_unitdir}/system/,--with-systemddir="
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_system_unitdir},--disable-systemd --without-systemddir,systemd"
 
-EXTRA_OECONF = "--with-upstartdir=%{_sysconfdir}/init"
+EXTRA_OECONF = "ac_cv_path_BASHPATH=${base_bindir}/bash"
+EXTRA_OEMAKE = "tmpfilesdir_DATA="
 
 do_configure_prepend() {
     ( cd ${S}
@@ -34,20 +35,17 @@ do_configure_prepend() {
 
 do_install_append() {
     install -d ${D}${sysconfdir}/sysconfig/
-    install -d ${D}/${sysconfdir}/init.d
     install -m 0644 ${S}/init/corosync.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync
-    install -m 0644 ${S}/init/corosync-notifyd.conf.in ${D}${sysconfdir}/sysconfig/corosync-notifyd.conf
-    install -m 0644 ${S}/init/corosync.conf.in ${D}${sysconfdir}/sysconfig/corosync.conf
-    install -m 0644 ${S}/init/corosync.in ${D}${sysconfdir}/init.d/corosync
-    install -m 0644 ${S}/init/corosync-notifyd.in ${D}${sysconfdir}/init.d/corosync-notifyd
+    install -m 0644 ${S}/tools/corosync-notifyd.sysconfig.example ${D}${sysconfdir}/sysconfig/corosync-notifyd
+
+    rm -rf "${D}${localstatedir}/run"
+
+    install -d ${D}${sysconfdir}/default/volatiles
+    echo "d root root 0755 ${localstatedir}/log/cluster none" > ${D}${sysconfdir}/default/volatiles/05_corosync
 
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 0644 ${S}/init/corosync.service.in ${D}${systemd_unitdir}/system/corosync.service
-        install -m 0644 ${S}/init/corosync-notifyd.service.in ${D}${systemd_unitdir}/system/corosync-notifyd.service
-        sed -i -e 's,@INITWRAPPERSDIR@,${sysconfdir}/init.d,g' ${D}${systemd_unitdir}/system/corosync.service
-        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/corosync-notifyd.service
-        sed -i -e 's,@SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/corosync-notifyd.service
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d ${localstatedir}/log/cluster - - - -" > ${D}${sysconfdir}/tmpfiles.d/corosync.conf
     fi
 }
 
-- 
2.11.0


