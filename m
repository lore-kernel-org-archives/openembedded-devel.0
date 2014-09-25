Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1980660144
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2014 08:47:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8P8ltcm001961
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Sep 2014 01:47:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 25 Sep 2014 01:47:54 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 25 Sep 2014 16:48:38 +0800
Message-ID: <1411634918-22497-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1411634918-22497-1-git-send-email-Qi.Chen@windriver.com>
References: <1411634918-22497-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2] smartmontools: add systemd service file
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
X-List-Received-Date: Thu, 25 Sep 2014 08:47:57 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add systemd service file for smartmontools.
The service is disabled by default.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../smartmontools/files/smartd.service             |   12 ++++++++++++
 .../smartmontools/smartmontools_6.2.bb             |   14 +++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/smartmontools/files/smartd.service

diff --git a/meta-oe/recipes-extended/smartmontools/files/smartd.service b/meta-oe/recipes-extended/smartmontools/files/smartd.service
new file mode 100644
index 0000000..f3db946
--- /dev/null
+++ b/meta-oe/recipes-extended/smartmontools/files/smartd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Self Monitoring and Reporting Technology (SMART) Daemon
+After=syslog.target
+
+[Service]
+EnvironmentFile=-@SYSCONFDIR@/smartmontools
+ExecStart=@SBINDIR@/smartd -n $smart_opts
+ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+StandardOutput=syslog
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
index b64b961..fd7b1b8 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_6.2.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "${SOURCEFORGE_MIRROR}/smartmontools/smartmontools-${PV}.tar.gz \
            file://initd.smartd \
            file://smartmontools.default \
+           file://smartd.service \
           "
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'libcap-ng', 'libcap-ng', '', d)} \
@@ -26,7 +27,10 @@ PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 SRC_URI[md5sum] = "d44f84081a12cef79cd17f78044351fc"
 SRC_URI[sha256sum] = "486f660579bb0fb4f6b927ded7531cb1f99685c666397377761c5b04dd96065b"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d systemd
+
+SYSTEMD_SERVICE_${PN} = "smartd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 
 do_install_append () {
 	#install the init.d/smartd
@@ -34,6 +38,14 @@ do_install_append () {
 	install -p -m 0755 ${WORKDIR}/initd.smartd ${D}${sysconfdir}/init.d/smartd
 	install -d ${D}${sysconfdir}/default
 	install -p -m 0644 ${WORKDIR}/smartmontools.default ${D}${sysconfdir}/default/smartmontools
+
+	#install systemd service file
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/smartd.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
+		-e 's,@SBINDIR@,${sbindir},g' \
+		${D}${systemd_unitdir}/system/smartd.service
 }
 
 INITSCRIPT_NAME = "smartd"
-- 
1.7.9.5


