Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 50EAD7822C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 09:52:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M9qn7K009922
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 02:52:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 22 Aug 2017 02:52:49 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Aug 2017 17:57:38 +0800
Message-ID: <1503395858-10071-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-webserver][PATCH] webmin: add systemd service file
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
X-List-Received-Date: Tue, 22 Aug 2017 09:52:49 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add systemd service file for webmin.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-webadmin/webmin/files/webmin.service          | 15 +++++++++++++++
 meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb    | 11 ++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/webmin.service

diff --git a/meta-webserver/recipes-webadmin/webmin/files/webmin.service b/meta-webserver/recipes-webadmin/webmin/files/webmin.service
new file mode 100644
index 0000000..87cf4f9
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/webmin.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=Webmin Admin Tool
+Requires=local-fs.target
+After=basic.target
+Conflicts=shutdown.target
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+ExecStart=@SYSCONFDIR@/webmin/start
+ExecStop=@SYSCONFDIR@/webmin/stop
+ExecReload=@SYSCONFDIR@/webmin/reload
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
index 6acff03..ae88eb6 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -18,12 +18,13 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://media-tomb.patch \
            file://remove-python2.3.patch \
            file://mysql-config-fix.patch \
+           file://webmin.service \
             "
 
 SRC_URI[md5sum] = "cd6ee98f73f9418562197675b952d81b"
 SRC_URI[sha256sum] = "c66caa9e4cb50d5447bc8aceb7989d2284dde060278f404b13e171c7ce1690e1"
 
-inherit perlnative update-rc.d
+inherit perlnative update-rc.d systemd
 
 do_configure() {
     # Remove binaries and plugins for other platforms
@@ -77,6 +78,11 @@ do_install() {
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 webmin-init ${D}${sysconfdir}/init.d/webmin
 
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/webmin.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+           ${D}${systemd_unitdir}/system/webmin.service
+
     install -d ${D}${localstatedir}
     install -d ${D}${localstatedir}/webmin
 
@@ -117,6 +123,9 @@ do_install() {
 INITSCRIPT_NAME = "webmin"
 INITSCRIPT_PARAMS = "start 99 5 3 2 . stop 10 0 1 6 ."
 
+SYSTEMD_SERVICE_${PN} = "webmin.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+
 # FIXME: some of this should be figured out automatically
 RDEPENDS_${PN} += "perl perl-module-socket perl-module-exporter perl-module-exporter-heavy perl-module-carp perl-module-strict"
 RDEPENDS_${PN} += "perl-module-warnings perl-module-xsloader perl-module-posix perl-module-autoloader"
-- 
1.9.1


