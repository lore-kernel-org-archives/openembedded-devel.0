Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB3B87101F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 07:53:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8S7rJUo022029
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2014 00:53:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 28 Sep 2014 00:53:19 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 28 Sep 2014 15:54:05 +0800
Message-ID: <1411890845-30154-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1411890845-30154-1-git-send-email-Qi.Chen@windriver.com>
References: <1411890845-30154-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] vsftpd: add systemd service file
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
X-List-Received-Date: Sun, 28 Sep 2014 07:53:25 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add systemd service for vsftpd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-daemons/vsftpd/files/vsftpd.service    |    9 +++++++++
 .../recipes-daemons/vsftpd/vsftpd_3.0.2.bb         |   10 +++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/vsftpd/files/vsftpd.service

diff --git a/meta-networking/recipes-daemons/vsftpd/files/vsftpd.service b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.service
new file mode 100644
index 0000000..e271020
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/files/vsftpd.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Vsftpd ftp daemon
+After=network.target
+
+[Service]
+ExecStart=@SBINDIR@/vsftpd
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
index 07c73c5..e4d65ee 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://vsftpd.ftpusers \
            file://change-secure_chroot_dir.patch \
            file://volatiles.99_vsftpd \
+           file://vsftpd.service \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
@@ -35,7 +36,7 @@ PAMLIB = "${@base_contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -l
 NOPAM_SRC ="${@base_contains('PACKAGECONFIG', 'tcp-wrappers', 'file://nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)}"
 
-inherit update-rc.d useradd
+inherit update-rc.d useradd systemd
 
 CONFFILES_${PN} = "${sysconfdir}/vsftpd.conf"
 LDFLAGS_append =" -lcrypt -lcap"
@@ -76,6 +77,11 @@ do_install() {
         echo "d /var/run/vsftpd/empty 0755 root root -" \
         > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
     fi
+
+    # Install systemd unit files
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/vsftpd.service ${D}${systemd_unitdir}/system
+    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/vsftpd.service
 }
 
 INITSCRIPT_PACKAGES = "${PN}"
@@ -87,6 +93,8 @@ USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ftp --no-create-home -g ftp
                        --shell /bin/false ftp "
 GROUPADD_PARAM_${PN} = "-r ftp"
 
+SYSTEMD_SERVICE_${PN} = "vsftpd.service"
+
 pkg_postinst_${PN}() {
     if [ -z "$D" ]; then
 	if type systemd-tmpfiles >/dev/null; then
-- 
1.7.9.5


