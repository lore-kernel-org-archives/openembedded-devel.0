Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A25C36E667
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 07:38:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8S7ceCT014821
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 00:38:40 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 28 Sep 2016 00:38:39 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Sep 2016 15:38:37 +0800
Message-ID: <1475048317-13529-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1475048317-13529-1-git-send-email-Qi.Chen@windriver.com>
References: <1475048317-13529-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 2/2] webmin: add systemd service file
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
X-List-Received-Date: Wed, 28 Sep 2016 07:38:39 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add systemd service file for webmin.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-webadmin/webmin/files/webmin.service           | 14 ++++++++++++++
 meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb     | 12 +++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-webadmin/webmin/files/webmin.service

diff --git a/meta-webserver/recipes-webadmin/webmin/files/webmin.service b/meta-webserver/recipes-webadmin/webmin/files/webmin.service
new file mode 100644
index 0000000..904bf79
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/webmin/files/webmin.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Webmin Admin Tool
+Requires=local-fs.target
+After=basic.target
+Conflicts=shutdown.target
+
+[Service]
+Type=oneshot
+ExecStart=@LIBEXECDIR@/webmin/miniserv.pl @SYSCONFDIR@/webmin/miniserv.conf
+RemainAfterExit=yes
+PrivateTmp=true
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb
index 3fc083a..05b5b92 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.801.bb
@@ -18,12 +18,13 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://media-tomb.patch \
            file://remove-python2.3.patch \
            file://mysql-config-fix.patch \
+           file://webmin.service \
             "
 
 SRC_URI[md5sum] = "91d05b4e31ad1bd14bab14e0f155c088"
 SRC_URI[sha256sum] = "ad477edb41dc1a900448afc8b5528e136b3778d2d303f23bc564afb975eb5bed"
 
-inherit perlnative update-rc.d
+inherit perlnative update-rc.d systemd
 
 do_configure() {
     # Remove binaries and plugins for other platforms
@@ -77,6 +78,12 @@ do_install() {
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 webmin-init ${D}${sysconfdir}/init.d/webmin
 
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/webmin.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
+           -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+           ${D}${systemd_unitdir}/system/webmin.service
+
     install -d ${D}${localstatedir}
     install -d ${D}${localstatedir}/webmin
 
@@ -114,6 +121,9 @@ do_install() {
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


