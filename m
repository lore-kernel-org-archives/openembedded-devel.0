Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nt-0007XN-Np
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:44 +0200
Received: by mail-ee0-f45.google.com with SMTP id c50so1587798eek.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=hOKqY1JXrxHYjFeUF/M0LsRw4NSB5I1c/MYhCzRS0yU=;
	b=vbT/kgP1NES/7zd9xaTADnrCMoXRhVqg0IqDdVwYcgsyqHjd4K/4nQYz63zAhfZx0N
	fi4vtDn+JWCv5/nCDmWoiVH3TPNeE+KBqGWT5JcSGLwBjjm1MkcNHQMcjXIuJ/jXxbHQ
	SbMf1/8LjkGzBRN5nUvsmb3JcshMWnfVrgGSQpvWYOjZAbMzz0DtapvKfEHb8Mqclpg2
	4ZVALbZ9kJLmi2spB5LEnJkM/9xk9zRo+NR2zs48d77ZSs83gmq78Md8takp97kWDFCW
	UEq+AhO0jNsa3X17/IEQ9Pm2gN+JuKpOofNl3wb94fjyV+eZDLoTHgGAe1nf2sKKzFYk
	V2yg==
X-Received: by 10.15.34.199 with SMTP id e47mr39143577eev.35.1365859815049;
	Sat, 13 Apr 2013 06:30:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id j44sm6913018eeu.10.2013.04.13.06.30.14
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:36 +0200
Message-Id: <1365859790-20947-19-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 19/33] net-snmp: move systemd support from meta-systemd back to meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Apr 2013 13:48:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/net-snmp/net-snmp.inc     | 34 +++++++++++++++++++---
 .../net-snmp/net-snmp/snmpd.service                |  0
 .../net-snmp/net-snmp/snmptrapd.service            |  0
 .../net-snmp/net-snmp/systemd-support.patch        |  0
 .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |  6 +++-
 .../net-snmp/net-snmp_5.7.1.bbappend               | 32 --------------------
 6 files changed, 35 insertions(+), 37 deletions(-)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-extended/net-snmp/net-snmp/snmpd.service (100%)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-extended/net-snmp/net-snmp/snmptrapd.service (100%)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-extended/net-snmp/net-snmp/systemd-support.patch (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend

diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp.inc b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
index 11b81ad..e369ccf 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp.inc
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
@@ -9,9 +9,9 @@ RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
 RDEPENDS_${PN}-client += "net-snmp-mibs"
 RDEPENDS_${PN}-dev = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
 RRECOMMENDS_${PN}-dbg = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
-INC_PR = "r3"
+INC_PR = "r6"
 
-inherit autotools update-rc.d siteinfo
+inherit autotools update-rc.d siteinfo systemd
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
@@ -36,6 +36,9 @@ do_install_append() {
 		-e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
 		-e "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \
 		-i ${STAGING_BINDIR}/net-snmp-config
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
 }
 
 PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static ${PN}-libs \
@@ -44,8 +47,15 @@ PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static ${PN}-lib
 ALLOW_EMPTY_${PN}-server = "1"
 FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
 FILES_${PN}-mibs = "${datadir}/snmp/mibs"
-FILES_${PN}-server-snmpd = "${sbindir}/snmpd ${sysconfdir}/snmp/snmpd.conf ${sysconfdir}/init.d"
-FILES_${PN}-server-snmptrapd = "${sbindir}/snmptrapd ${sysconfdir}/snmp/snmptrapd.conf"
+FILES_${PN}-server-snmpd = "${sbindir}/snmpd \
+  ${sysconfdir}/snmp/snmpd.conf \
+  ${sysconfdir}/init.d \
+  ${systemd_unitdir}/system/snmpd.service \
+"
+FILES_${PN}-server-snmptrapd = "${sbindir}/snmptrapd \
+  ${sysconfdir}/snmp/snmptrapd.conf \
+  ${systemd_unitdir}/system/snmptrapd.service \
+"
 FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
 FILES_${PN}-dbg += "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debug/"
 FILES_${PN}-dev += "${bindir}/net-snmp-config ${bindir}/mib2c ${bindir}/mib2c-update"
@@ -57,6 +67,22 @@ INITSCRIPT_PACKAGES = "${PN}-server"
 INITSCRIPT_NAME_${PN}-server = "snmpd"
 INITSCRIPT_PARAMS_${PN}-server = "defaults"
 
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)}"
+
+SYSTEMD_PACKAGES = "${PN}-server-snmpd-systemd \
+                    ${PN}-server-snmptrapd-systemd"
+
+SYSTEMD_SERVICE_${PN}-server-snmpd = "snmpd.service"
+SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
+
+RPROVIDES_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
+RREPLACES_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
+RCONFLICTS_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
+
+RPROVIDES_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
+RREPLACES_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
+RCONFLICTS_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
+
 LEAD_SONAME = "libnetsnmp.so"
 
 pkg_postrm_${PN}-server() {
diff --git a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/snmpd.service b/meta-oe/recipes-extended/net-snmp/net-snmp/snmpd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/snmpd.service
rename to meta-oe/recipes-extended/net-snmp/net-snmp/snmpd.service
diff --git a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/snmptrapd.service b/meta-oe/recipes-extended/net-snmp/net-snmp/snmptrapd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/snmptrapd.service
rename to meta-oe/recipes-extended/net-snmp/net-snmp/snmptrapd.service
diff --git a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch b/meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch
similarity index 100%
rename from meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch
rename to meta-oe/recipes-extended/net-snmp/net-snmp/systemd-support.patch
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
index f1e42b5..74d006c 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
@@ -8,7 +8,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://libnl-3-support.patch \
         file://init \
         file://snmpd.conf \
-        file://snmptrapd.conf"
+        file://snmptrapd.conf \
+        file://systemd-support.patch \
+        file://snmpd.service \
+        file://snmptrapd.service \
+"
 
 EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no"
 EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
diff --git a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
deleted file mode 100644
index c3538b3..0000000
--- a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbappend
+++ /dev/null
@@ -1,32 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-SRC_URI += " \
-        file://systemd-support.patch \
-        file://snmpd.service \
-        file://snmptrapd.service \
-"
-do_install_append() {
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
-}
-
-EXTRA_OECONF += "--with-systemd"
-
-SYSTEMD_PACKAGES = "${PN}-server-snmpd-systemd \
-                    ${PN}-server-snmptrapd-systemd"
-
-SYSTEMD_SERVICE_${PN}-server-snmpd = "snmpd.service"
-SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
-RPROVIDES_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
-RREPLACES_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
-RCONFLICTS_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
-RPROVIDES_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
-RREPLACES_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
-RCONFLICTS_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
-FILES_${PN}-server-snmpd += "${systemd_unitdir}/system/snmpd.service"
-FILES_${PN}-server-snmptrapd += "${systemd_unitdir}/system/snmptrapd.service"
-- 
1.8.1.5



