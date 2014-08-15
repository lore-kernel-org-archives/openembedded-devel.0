Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 032BE60438
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 05:35:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7F5ZrAe021815
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 22:35:53 -0700 (PDT)
Received: from pek-hostel-vm07.wrs.com (128.224.153.177) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 22:35:52 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Aug 2014 01:35:51 -0400
Message-ID: <1408080951-30317-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] hostapd: add systemd support
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
X-List-Received-Date: Fri, 15 Aug 2014 05:35:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add hostapd.service file.
The file mostly comes from Fedora20.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../hostapd/hostapd-2.2/hostapd.service            |   11 +++++++++++
 .../recipes-connectivity/hostapd/hostapd_2.2.bb    |   11 ++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service
new file mode 100644
index 0000000..151c050
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/hostapd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Hostapd IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator
+After=network.target
+
+[Service]
+Type=forking
+PIDFile=/run/hostapd.pid
+ExecStart=@SBINDIR@/hostapd @SYSCONFDIR@/hostapd.conf -P /run/hostapd.pid -B
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
index d0d9df9..f1c6b3a 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.2.bb
@@ -5,9 +5,11 @@ LIC_FILES_CHKSUM = "file://README;md5=0854a4da34ac3990770794d771fac7fd"
 DEPENDS = "libnl openssl"
 SUMMARY = "User space daemon for extended IEEE 802.11 management"
 
-inherit update-rc.d
+inherit update-rc.d systemd
 INITSCRIPT_NAME = "hostapd"
-
+SYSTEMD_PACKAGES = "hostapd"
+SYSTEMD_SERVICE_hostapd = "hostapd.service"
+SYSTEMD_AUTO_ENABLE_hostapd = "disable"
 
 DEFAULT_PREFERENCE = "-1"
 
@@ -15,6 +17,7 @@ SRC_URI = " \
     http://hostap.epitest.fi/releases/hostapd-${PV}.tar.gz \
     file://defconfig \
     file://init \
+    file://hostapd.service \
 "
 
 S = "${WORKDIR}/hostapd-${PV}/hostapd"
@@ -30,11 +33,13 @@ do_compile() {
 }
 
 do_install() {
-    install -d ${D}${sbindir} ${D}${sysconfdir}/init.d
+    install -d ${D}${sbindir} ${D}${sysconfdir}/init.d ${D}${systemd_unitdir}/system/
     install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
     install -m 0755 ${S}/hostapd ${D}${sbindir}
     install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
+    install -m 0644 ${WORKDIR}/hostapd.service ${D}${systemd_unitdir}/system/
+    sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/hostapd.service
 }
 
 CONFFILES_${PN} += "${sysconfdir}/hostapd.conf"
-- 
1.7.9.5


