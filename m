Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1D93615E7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 08:36:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8A8aiq4009623
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2013 01:36:44 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 10 Sep 2013 01:36:44 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Sep 2013 16:36:44 +0800
Message-ID: <1378802204-14737-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-webserver] apache2: create configuration file for systemd-tmpfiles
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
X-List-Received-Date: Tue, 10 Sep 2013 08:36:44 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

when use systemd as a system and service manager, systemd-tmpfiles will replace
/etc/init.d/populate-volatile.sh to handle temporary files, so we need to create
the configuration file for apache2

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb          |    8 +++++++-
 .../recipes-httpd/apache2/files/apache2-volatile.conf          |    2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
index fa14b07..fc7452f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.6.bb
@@ -16,7 +16,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://replace-lynx-to-curl-in-apachectl-script.patch \
            file://apache-ssl-ltmain-rpath.patch \
            file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
-           file://init"
+           file://init \
+           file://apache2-volatile.conf"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eff226ae95d0516d6210ed77dfdf2dcc"
 SRC_URI[md5sum] = "ea5e361ca37b8d7853404419dd502efe"
@@ -72,6 +73,11 @@ do_install_append() {
     printf "\nIncludeOptional ${sysconfdir}/${BPN}/modules.d/*.conf\n\n" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
     # match with that is in init script
     printf "\nPidFile /run/httpd.pid" >> ${D}/${sysconfdir}/${BPN}/httpd.conf
+
+    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then 
+        install -d ${D}${sysconfdir}/tmpfiles.d/
+        install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+    fi
 }
 
 SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
new file mode 100644
index 0000000..ff2c587
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/apache2-volatile.conf
@@ -0,0 +1,2 @@
+d  /var/run/apache2 0755 root root -
+d  /var/log/apache2 0755 root root -
-- 
1.7.10.4


