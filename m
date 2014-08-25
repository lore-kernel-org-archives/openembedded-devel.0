Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD116AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 06:46:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7P6kmml014429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 23:46:48 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 24 Aug 2014 23:46:48 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Aug 2014 14:47:20 +0800
Message-ID: <1408949241-13129-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408949241-13129-1-git-send-email-Qi.Chen@windriver.com>
References: <1408949241-13129-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] apache2: add systemd unit file
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
X-List-Received-Date: Mon, 25 Aug 2014 06:46:49 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add systemd unit file for apache2.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-httpd/apache2/apache2_2.4.10.bb        |   13 +++++++++++--
 .../recipes-httpd/apache2/files/apache2.service    |   14 ++++++++++++++
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/apache2.service

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
index 614dd4e..0356029 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.10.bb
@@ -18,7 +18,8 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://npn-patch-2.4.7.patch \
            file://0001-configure-use-pkg-config-for-PCRE-detection.patch \
            file://init \
-           file://apache2-volatile.conf"
+           file://apache2-volatile.conf \
+           file://apache2.service"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dbff5a2b542fa58854455bf1a0b94b83"
 SRC_URI[md5sum] = "44543dff14a4ebc1e9e2d86780507156"
@@ -26,7 +27,10 @@ SRC_URI[sha256sum] = "176c4dac1a745f07b7b91e7f4fd48f9c48049fa6f088efe758d61d9738
 
 S = "${WORKDIR}/httpd-${PV}"
 
-inherit autotools update-rc.d pkgconfig
+inherit autotools update-rc.d pkgconfig systemd
+
+SYSTEMD_SERVICE_${PN} = "apache2.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
@@ -81,6 +85,11 @@ do_install_append() {
         install -d ${D}${sysconfdir}/tmpfiles.d/
         install -m 0644 ${WORKDIR}/apache2-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
     fi
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/apache2.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/apache2.service
+    sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' ${D}${systemd_unitdir}/system/apache2.service
 }
 
 SYSROOT_PREPROCESS_FUNCS += "apache_sysroot_preprocess"
diff --git a/meta-webserver/recipes-httpd/apache2/files/apache2.service b/meta-webserver/recipes-httpd/apache2/files/apache2.service
new file mode 100644
index 0000000..f4bcf9e
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/apache2.service
@@ -0,0 +1,14 @@
+[Unit]
+Decription=The Apache HTTP Server
+After=network.target remote-fs.target nss-lookup.target
+
+[Service]
+Type=simple
+Environment=LANG=C
+ExecStart=@SBINDIR@/httpd -DFOREGROUND -D SSL -D PHP5 -k start
+ExecStop=@BASE_BINDIR@/kill -WINCH ${MAINPID}
+KillSignal=SIGCONT
+PrivateTmp=true
+
+[Install]
+WantedBy=multi-user.target
-- 
1.7.9.5


