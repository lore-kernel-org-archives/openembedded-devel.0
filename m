Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DA100782A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 09:10:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7N9A4I1012949
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 23 Aug 2017 02:10:04 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 23 Aug 2017 02:10:03 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Wed, 23 Aug 2017 17:14:53 +0800
Message-ID: <1503479693-12533-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] tftp-hpa: add systemd unit files
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
X-List-Received-Date: Wed, 23 Aug 2017 09:10:04 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Add systemd unit files for tftp-hpa.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-daemons/tftp-hpa/files/tftpd-hpa.service         | 10 ++++++++++
 .../recipes-daemons/tftp-hpa/files/tftpd-hpa.socket          |  8 ++++++++
 meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb     | 12 +++++++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftpd-hpa.service
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftpd-hpa.socket

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftpd-hpa.service b/meta-networking/recipes-daemons/tftp-hpa/files/tftpd-hpa.service
new file mode 100644
index 0000000..97d5658
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftpd-hpa.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Tftp Server
+Requires=tftpd-hpa.socket
+
+[Service]
+ExecStart=@SBINDIR@/in.tftpd-hpa -s /var/lib/tftpboot
+StandardInput=socket
+
+[Install]
+Also=tftpd-hpa.socket
diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftpd-hpa.socket b/meta-networking/recipes-daemons/tftp-hpa/files/tftpd-hpa.socket
new file mode 100644
index 0000000..8764c1d
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftpd-hpa.socket
@@ -0,0 +1,8 @@
+[Unit]
+Description=Tftp Server Activation Socket
+
+[Socket]
+ListenDatagram=69
+
+[Install]
+WantedBy=sockets.target
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 7f56713..0a418b9 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -26,12 +26,14 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
            file://add-error-check-for-disk-filled-up.patch \
            file://tftp-hpa-bug-fix-on-separated-CR-and-LF.patch \
            file://fix-writing-emtpy-file.patch \
+           file://tftpd-hpa.socket \
+           file://tftpd-hpa.service \
 "
 
 SRC_URI[md5sum] = "46c9bd20bbffa62f79c958c7b99aac21"
 SRC_URI[sha256sum] = "0a9f88d4c1c02687b4853b02ab5dd8779d4de4ffdb9b2e5c9332841304d1a269"
 
-inherit autotools-brokensep update-rc.d update-alternatives
+inherit autotools-brokensep update-rc.d update-alternatives systemd
 
 export AR = "${HOST_PREFIX}ar cq"
 
@@ -60,6 +62,11 @@ do_install() {
 
     install -d ${D}${sysconfdir}/default
     install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/tftpd-hpa
+
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/tftpd-hpa.socket ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/tftpd-hpa.service ${D}${systemd_unitdir}/system
+    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/tftpd-hpa.service
 }
 
 FILES_${PN} = "${bindir}"
@@ -77,3 +84,6 @@ ALTERNATIVE_${PN} = "tftp"
 ALTERNATIVE_TARGET[tftp] = "${bindir}/tftp-hpa"
 ALTERNATIVE_PRIORITY = "60"
 
+SYSTEMD_PACKAGES = "tftp-hpa-server"
+SYSTEMD_SERVICE_tftp-hpa-server = "tftpd-hpa.socket tftpd-hpa.service"
+SYSTEMD_AUTO_ENABLE_tftp-hpa-server = "enable"
-- 
1.9.1


