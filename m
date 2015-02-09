Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 920F460556
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Feb 2015 02:39:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t192dMUF020550
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 8 Feb 2015 18:39:23 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.136) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 8 Feb 2015 18:39:22 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 9 Feb 2015 10:39:20 +0800
Message-ID: <1423449560-11909-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] proftpd: add systemd support
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
X-List-Received-Date: Mon, 09 Feb 2015 02:39:28 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-daemons/proftpd/files/proftpd.service         |  7 +++++++
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb  | 15 +++++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/proftpd.service

diff --git a/meta-networking/recipes-daemons/proftpd/files/proftpd.service b/meta-networking/recipes-daemons/proftpd/files/proftpd.service
new file mode 100644
index 0000000..ba97f8e
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/proftpd.service
@@ -0,0 +1,7 @@
+[Unit]
+Description=proftpd Daemon
+
+[Service]
+Type=forking
+ExecStart=-@SBINDIR@/proftpd -c @SYSCONFDIR@/proftpd.conf
+StandardError=syslog
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
index cba39e8..ca629be 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.5.bb
@@ -11,12 +11,13 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://close-RequireValidShell-check.patch \
            file://contrib.patch  \
            file://build_fixup.patch \
-           "
+           file://proftpd.service \
+		   "
 
 SRC_URI[md5sum] = "aff1bff40e675244d72c4667f203e5bb"
 SRC_URI[sha256sum] = "c10316fb003bd25eccbc08c77dd9057e053693e6527ffa2ea2cc4e08ccb87715"
 
-inherit autotools-brokensep useradd update-rc.d
+inherit autotools-brokensep useradd update-rc.d systemd
 
 PACKAGECONFIG ??= "sia shadow"
 PACKAGECONFIG += " ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)}"
@@ -87,11 +88,21 @@ do_install () {
     # create the pub directory
     mkdir -p ${D}/home/${FTPUSER}/pub/
     chown -R ${FTPUSER}:${FTPGROUP} ${D}/home/${FTPUSER}/pub
+
+    install -d ${D}/${systemd_unitdir}/system
+    install -m 644 ${WORKDIR}/proftpd.service ${D}/${systemd_unitdir}/system
+    sed -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
+        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+        -e 's,@SBINDIR@,${sbindir},g' \
+        -i ${D}${systemd_unitdir}/system/*.service
 }
 
 INITSCRIPT_NAME = "proftpd"
 INITSCRIPT_PARAM = "defaults 85 15"
 
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "proftpd.service"
+
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system ${FTPGROUP}"
 USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} --home-dir /var/lib/${FTPUSER} --no-create-home \
-- 
2.1.0


