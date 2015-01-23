Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 88C4265C7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 02:37:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0N2bw4X007686
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jan 2015 18:37:58 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 22 Jan 2015 18:37:57 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jan 2015 10:37:56 +0800
Message-ID: <1421980676-22989-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-oe] openldap: add systemd support
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
X-List-Received-Date: Fri, 23 Jan 2015 02:37:59 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-support/openldap/openldap-2.4.39/slapd.service | 10 ++++++++++
 meta-oe/recipes-support/openldap/openldap_2.4.39.bb            | 12 ++++++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/openldap/openldap-2.4.39/slapd.service

diff --git a/meta-oe/recipes-support/openldap/openldap-2.4.39/slapd.service b/meta-oe/recipes-support/openldap/openldap-2.4.39/slapd.service
new file mode 100644
index 0000000..f5f83fd
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap-2.4.39/slapd.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Standalone LDAP Daemon
+After=syslog.target network.target
+
+[Service]
+Type=forking
+ExecStart=@SBINDIR@/slapd
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.39.bb b/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
index 8752395..795340e 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.39.bb
@@ -24,6 +24,7 @@ SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${BP}.tgz \
     file://ITS-7723-fix-reference-counting.patch \
     file://use-urandom.patch \
     file://initscript \
+    file://slapd.service \
 "
 SRC_URI[md5sum] = "b0d5ee4b252c841dec6b332d679cf943"
 SRC_URI[sha256sum] = "8267c87347103fef56b783b24877c0feda1063d3cb85d070e503d076584bf8a7"
@@ -35,7 +36,7 @@ DEPENDS = "util-linux groff-native"
 # environments
 SRC_URI += "file://install-strip.patch"
 
-inherit autotools-brokensep update-rc.d
+inherit autotools-brokensep update-rc.d systemd
 
 # CV SETTINGS
 # Required to work round AC_FUNC_MEMCMP which gets the wrong answer
@@ -167,7 +168,7 @@ PACKAGES += "${PN}-slapd ${PN}-slurpd ${PN}-bin"
 FILES_${PN} = "${libdir}/lib*.so.* ${sysconfdir}/openldap/ldap.* ${localstatedir}/openldap-data"
 FILES_${PN}-slapd = "${sysconfdir}/init.d ${libexecdir}/slapd ${sbindir} ${localstatedir}/run ${localstatedir}/volatile/run \
     ${sysconfdir}/openldap/slapd.* ${sysconfdir}/openldap/schema \
-    ${sysconfdir}/openldap/DB_CONFIG.example"
+    ${sysconfdir}/openldap/DB_CONFIG.example ${systemd_unitdir}/system/*"
 FILES_${PN}-slurpd = "${libexecdir}/slurpd ${localstatedir}/openldap-slurp ${localstatedir}/run ${localstatedir}/volatile/run"
 FILES_${PN}-bin = "${bindir}"
 FILES_${PN}-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libexecdir}/openldap/*.a ${libexecdir}/openldap/*.la ${libexecdir}/openldap/*.so"
@@ -189,11 +190,18 @@ do_install_append() {
 
     rmdir "${D}${localstatedir}/run"
     rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
+
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/slapd.service ${D}${systemd_unitdir}/system/
+    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/*.service
 }
 
 INITSCRIPT_PACKAGES = "${PN}-slapd"
 INITSCRIPT_NAME_${PN}-slapd = "openldap"
 INITSCRIPT_PARAMS_${PN}-slapd = "defaults"
+SYSTEMD_SERVICE_${PN}-slapd = "hostapd.service"
+SYSTEMD_AUTO_ENABLE_${PN}-slapd ?= "disable"
+
 
 PACKAGES_DYNAMIC += "^${PN}-backends.* ^${PN}-backend-.*"
 
-- 
2.1.0


