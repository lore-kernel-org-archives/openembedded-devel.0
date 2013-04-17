Received: from eumx.net ([91.82.101.43] helo=owm.eumx.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1USRKG-0003dc-Fg
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Apr 2013 14:19:24 +0200
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Apr 2013 13:01:21 +0100
Message-Id: <1366200081-12326-3-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.2
In-Reply-To: <1366200081-12326-1-git-send-email-ml@communistcode.co.uk>
References: <1366200081-12326-1-git-send-email-ml@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [meta-oe][PATCHv3 3/3] net-snmp: merge .inc into .bb and clean up obsolete parts of recipe
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
X-List-Received-Date: Wed, 17 Apr 2013 12:19:28 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta-oe/recipes-extended/net-snmp/net-snmp.inc     |  95 -----------------
 .../recipes-extended/net-snmp/net-snmp_5.7.2.bb    | 112 ++++++++++++++++++---
 2 files changed, 98 insertions(+), 109 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/net-snmp/net-snmp.inc

diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp.inc b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
deleted file mode 100644
index 5a6ec9f..0000000
--- a/meta-oe/recipes-extended/net-snmp/net-snmp.inc
+++ /dev/null
@@ -1,95 +0,0 @@
-DESCRIPTION = "Various tools relating to the Simple Network Management Protocol"
-HOMEPAGE = "http://www.net-snmp.org/"
-LICENSE = "BSD"
-
-DEPENDS = "openssl libnl pciutils"
-RDEPENDS_${PN}-server-snmpd += "net-snmp-mibs"
-RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd"
-RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
-RDEPENDS_${PN}-client += "net-snmp-mibs"
-RDEPENDS_${PN}-dev = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
-RRECOMMENDS_${PN}-dbg = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
-INC_PR = "r6"
-
-inherit autotools update-rc.d siteinfo systemd
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-EXTRA_OECONF = "--enable-shared --disable-manuals --with-defaults \
-${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)}"
-
-do_install () {
-    oe_runmake install
-}
-
-do_install_append() {
-    install -d ${D}${sysconfdir}/snmp
-    install -d ${D}${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/snmpd
-    install -m 644 ${WORKDIR}/snmpd.conf ${D}${sysconfdir}/snmp/
-    install -m 644 ${WORKDIR}/snmptrapd.conf ${D}${sysconfdir}/snmp/
-    install -d ${STAGING_BINDIR}
-    install -m 0755 ${D}${bindir}/net-snmp-config ${STAGING_BINDIR}/
-    sed -e "s@-I/usr/include@@g" \
-        -e "s@^prefix=.*@prefix=${STAGING_DIR_HOST}@g" \
-        -e "s@^exec_prefix=.*@exec_prefix=${STAGING_DIR_HOST}@g" \
-        -e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
-        -e "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \
-        -i ${STAGING_BINDIR}/net-snmp-config
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
-}
-
-PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static ${PN}-libs \
-            ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
-
-ALLOW_EMPTY_${PN}-server = "1"
-FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-mibs = "${datadir}/snmp/mibs"
-FILES_${PN}-server-snmpd = "${sbindir}/snmpd \
-    ${sysconfdir}/snmp/snmpd.conf \
-    ${sysconfdir}/init.d \
-    ${systemd_unitdir}/system/snmpd.service \
-"
-FILES_${PN}-server-snmptrapd = "${sbindir}/snmptrapd \
-    ${sysconfdir}/snmp/snmptrapd.conf \
-    ${systemd_unitdir}/system/snmptrapd.service \
-"
-FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
-FILES_${PN}-dbg += "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debug/"
-FILES_${PN}-dev += "${bindir}/net-snmp-config ${bindir}/mib2c ${bindir}/mib2c-update"
-
-CONFFILES_${PN}-server-snmpd = "${sysconfdir}/snmp/snmpd.conf"
-CONFFILES_${PN}-server-snmptrapd = "${sysconfdir}/snmp/snmptrapd.conf"
-
-INITSCRIPT_PACKAGES = "${PN}-server"
-INITSCRIPT_NAME_${PN}-server = "snmpd"
-INITSCRIPT_PARAMS_${PN}-server = "defaults"
-
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemd', '--without-systemd', d)}"
-
-SYSTEMD_PACKAGES = "${PN}-server-snmpd-systemd \
-                    ${PN}-server-snmptrapd-systemd"
-
-SYSTEMD_SERVICE_${PN}-server-snmpd = "snmpd.service"
-SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
-
-RPROVIDES_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
-RREPLACES_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
-RCONFLICTS_${PN}-server-snmpd += "${PN}-server-snmpd-systemd"
-
-RPROVIDES_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
-RREPLACES_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
-RCONFLICTS_${PN}-server-snmptrapd += "${PN}-server-snmptrapd-systemd"
-
-LEAD_SONAME = "libnetsnmp.so"
-
-pkg_postrm_${PN}-server() {
-    if test "x$D" != "x"; then
-        OPT="-r $D "
-    else
-        OPT=""
-        /etc/init.d/snmpd stop
-    fi
-}
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
index 3cbb34b..81ad6ff 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.2.bb
@@ -1,4 +1,9 @@
-require net-snmp.inc
+DESCRIPTION = "Various tools relating to the Simple Network Management Protocol"
+HOMEPAGE = "http://www.net-snmp.org/"
+LICENSE = "BSD"
+
+SRC_URI[md5sum] = "5bddd02e2f82b62daa79f82717737a14"
+SRC_URI[sha256sum] = "09ed31b4cc1f3c0411ef9a16eff79ef3b30d89c32ca46d5a01a41826c4ceb816"
 
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5a622ea24634e"
 
@@ -12,22 +17,101 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://ifmib.patch \
 "
 
-PR = "${INC_PR}.0"
+DEPENDS = "openssl libnl pciutils"
+RDEPENDS_${PN}-server-snmpd += "net-snmp-mibs"
+RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd"
+RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
+RDEPENDS_${PN}-client += "net-snmp-mibs"
+RDEPENDS_${PN}-dev = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
+RRECOMMENDS_${PN}-dbg = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
 
-EXTRA_OECONF += "--disable-embedded-perl --with-perl-modules=no"
-EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
+inherit autotools update-rc.d siteinfo systemd
 
-do_configure_prepend() {
-    gnu-configize -f
-    # We better change sources and re-autoconf here, but
-    # required autoconf is too new for us.
-    sed -e '/echo.*\".*\\\\.*\"/s/echo/echo -e/g' \
-        -e 's/tail -1/tail -n 1/g' \
-        -i configure
-}
+EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
 
 PARALLEL_MAKE = ""
 CCACHE = ""
 
-SRC_URI[md5sum] = "5bddd02e2f82b62daa79f82717737a14"
-SRC_URI[sha256sum] = "09ed31b4cc1f3c0411ef9a16eff79ef3b30d89c32ca46d5a01a41826c4ceb816"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+EXTRA_OECONF = "--disable-embedded-perl \
+                --with-perl-modules=no \
+                --enable-shared \
+                --disable-manuals \
+                --with-defaults \
+                ${@base_conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)}"
+
+do_install_append() {
+    install -d ${D}${sysconfdir}/snmp
+    install -d ${D}${sysconfdir}/init.d
+    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/snmpd
+    install -m 644 ${WORKDIR}/snmpd.conf ${D}${sysconfdir}/snmp/
+    install -m 644 ${WORKDIR}/snmptrapd.conf ${D}${sysconfdir}/snmp/
+    install -d ${STAGING_BINDIR}
+    install -m 0755 ${D}${bindir}/net-snmp-config ${STAGING_BINDIR}/
+    sed -e "s@-I/usr/include@@g" \
+        -e "s@^prefix=.*@prefix=${STAGING_DIR_HOST}@g" \
+        -e "s@^exec_prefix=.*@exec_prefix=${STAGING_DIR_HOST}@g" \
+        -e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
+        -e "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \
+        -i ${STAGING_BINDIR}/net-snmp-config
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
+}
+
+PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static ${PN}-libs \
+            ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
+
+ALLOW_EMPTY_${PN}-server = "1"
+
+FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-mibs = "${datadir}/snmp/mibs"
+FILES_${PN}-server-snmpd = "${sbindir}/snmpd \
+                            ${sysconfdir}/snmp/snmpd.conf \
+                            ${sysconfdir}/init.d \
+                            ${systemd_unitdir}/system/snmpd.service \
+"
+
+FILES_${PN}-server-snmptrapd = "${sbindir}/snmptrapd \
+                                ${sysconfdir}/snmp/snmptrapd.conf \
+                                ${systemd_unitdir}/system/snmptrapd.service \
+"
+
+FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
+FILES_${PN}-dbg += "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debug/"
+FILES_${PN}-dev += "${bindir}/net-snmp-config ${bindir}/mib2c ${bindir}/mib2c-update"
+
+CONFFILES_${PN}-server-snmpd = "${sysconfdir}/snmp/snmpd.conf"
+CONFFILES_${PN}-server-snmptrapd = "${sysconfdir}/snmp/snmptrapd.conf"
+
+INITSCRIPT_PACKAGES = "${PN}-server"
+INITSCRIPT_NAME_${PN}-server = "snmpd"
+INITSCRIPT_PARAMS_${PN}-server = "defaults"
+
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
+LEAD_SONAME = "libnetsnmp.so"
+
+pkg_postrm_${PN}-server() {
+    if test "x$D" != "x"; then
+        OPT="-r $D "
+    else
+        OPT=""
+        /etc/init.d/snmpd stop
+    fi
+}
-- 
1.8.2



