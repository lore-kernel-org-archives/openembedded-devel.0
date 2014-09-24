Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D604071503
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 06:52:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8O6qtfa010260
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 23:52:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 23:52:55 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Sep 2014 14:53:39 +0800
Message-ID: <1411541619-16755-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] radvd: add systemd service file
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
X-List-Received-Date: Wed, 24 Sep 2014 06:52:57 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add systemd service for for radvd.
The unit is disabled by default, just as Fedora20 does.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-daemons/radvd/files/radvd.service      |   14 ++++++++++++++
 meta-networking/recipes-daemons/radvd/radvd.inc    |   14 +++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/radvd/files/radvd.service

diff --git a/meta-networking/recipes-daemons/radvd/files/radvd.service b/meta-networking/recipes-daemons/radvd/files/radvd.service
new file mode 100644
index 0000000..3aac7b2
--- /dev/null
+++ b/meta-networking/recipes-daemons/radvd/files/radvd.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Router advertisement daemon for IPv6
+After=network.target
+ConditionPathExists=@SYSCONFDIR@/radvd.conf
+
+[Service]
+Type=forking
+PIDFile=/var/run/radvd/radvd.pid
+EnvironmentFile=-@SYSCONFDIR@/default/radvd
+ExecStartPre=@BASE_BINDIR@/mkdir -p /var/run/radvd
+ExecStart=@SBINDIR@/radvd $OPTIONS
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index ededf9a..85d1a85 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -16,9 +16,13 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=73ebbf7182ae996e65e8fadc9a8c45db"
 
 SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
            file://radvd.init \
+           file://radvd.service \
            file://volatiles.03_radvd"
 
-inherit autotools update-rc.d useradd pkgconfig
+inherit autotools update-rc.d useradd pkgconfig systemd
+
+SYSTEMD_SERVICE_${PN} = "radvd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 
 do_install_append () {
     install -m 0755 -d ${D}${sysconfdir}/init.d \
@@ -32,6 +36,14 @@ do_install_append () {
     sed -i 's!^PATH=.*!PATH=${base_sbindir}:${base_bindir}:${sbindir}:${bindir}!' ${D}${sysconfdir}/init.d/radvd
 
     install -m 0644 ${WORKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/volatiles.03_radvd
+
+    # Install systemd service files
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/radvd.service ${D}${systemd_unitdir}/system
+    sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' \
+           -e 's#@SBINDIR@#${sbindir}#g' \
+           -e 's#@BASE_BINDIR@#${base_bindir}#g' ${D}${systemd_unitdir}/system/radvd.service
+
     # Documentation
     for i in radvd.conf.example README; do \
         install -m 0644 ${S}/$i ${D}${docdir}/radvd; \
-- 
1.7.9.5


