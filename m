Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7DC1785F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 03:18:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8F3INRI017910
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 14 Sep 2017 20:18:23 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 14 Sep 2017 20:18:22 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <peter.kjellerstedt@axis.com>
Date: Thu, 14 Sep 2017 23:18:20 -0400
Message-ID: <1505445501-202185-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH V2 1/2] apache2: use volatiles for sysvinit
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
X-List-Received-Date: Fri, 15 Sep 2017 03:18:27 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb          | 4 ++++
 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2 | 3 +++
 2 files changed, 7 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
index f053e37..c7e7b54 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.27.bb
@@ -20,6 +20,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://init \
            file://apache2-volatile.conf \
            file://apache2.service \
+           file://volatiles.04_apache2 \
           "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
@@ -90,6 +91,9 @@ do_install_append() {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d/
         install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/default/volatiles
+        install -m 0644 ${WORKDIR}/volatiles.04_apache2 ${D}${sysconfdir}/default/volatiles/04_apache2
     fi
 
     install -d ${D}${systemd_unitdir}/system
diff --git a/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2 b/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
new file mode 100644
index 0000000..922075b
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/volatiles.04_apache2
@@ -0,0 +1,3 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d root root 0755 /var/run/apache2 none
+d root root 0755 /var/log/apache2 none
-- 
2.8.1


