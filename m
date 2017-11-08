Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CD96178412
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 19:58:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA8JwDkF026680
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Nov 2017 11:58:13 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 8 Nov 2017 11:58:12 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Nov 2017 11:58:05 -0800
Message-ID: <20171108195805.136677-6-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20171108195805.136677-1-jslater@windriver.com>
References: <20171108195805.136677-1-jslater@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 5/5] samba: move to version 4.7.0
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
X-List-Received-Date: Wed, 08 Nov 2017 19:58:11 -0000
Content-Type: text/plain

ad-dc code is built and krb5 is used.  If booting using systemd,
'nmb' and 'smb' are started.  'samba' is not.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../samba/samba/dnsserver-4.7.0.patch              | 19 ++++++
 .../samba/samba/iconv-4.7.0.patch                  | 25 ++++++++
 .../samba/samba/smb_conf-4.7.0.patch               | 19 ++++++
 .../samba/{samba_4.6.7.bb => samba_4.7.0.bb}       | 67 +++++++++++++++++-----
 4 files changed, 117 insertions(+), 13 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/dnsserver-4.7.0.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/iconv-4.7.0.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.6.7.bb => samba_4.7.0.bb} (79%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/dnsserver-4.7.0.patch b/meta-networking/recipes-connectivity/samba/samba/dnsserver-4.7.0.patch
new file mode 100644
index 0000000..0c7592f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/dnsserver-4.7.0.patch
@@ -0,0 +1,19 @@
+samba: build dnsserver_common code
+
+Just 'install' does not seem to do it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+--- a/source4/dns_server/wscript_build
++++ b/source4/dns_server/wscript_build
+@@ -4,7 +4,7 @@ bld.SAMBA_LIBRARY('dnsserver_common',
+         source='dnsserver_common.c',
+         deps='samba-util samba-errors ldbsamba clidns',
+         private_library=True,
+-        install=bld.AD_DC_BUILD_IS_ENABLED()
++        enabled=bld.AD_DC_BUILD_IS_ENABLED()
+         )
+ 
+ bld.SAMBA_MODULE('service_dns',
diff --git a/meta-networking/recipes-connectivity/samba/samba/iconv-4.7.0.patch b/meta-networking/recipes-connectivity/samba/samba/iconv-4.7.0.patch
new file mode 100644
index 0000000..5ae8c59
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/iconv-4.7.0.patch
@@ -0,0 +1,25 @@
+samba: defeat iconv test
+
+A test was added when configuring samba which requires target code
+to be executed.  In general, this will not work, so we eliminate it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+--- a/lib/util/charset/wscript_configure
++++ b/lib/util/charset/wscript_configure
+@@ -17,6 +17,8 @@ if (conf.CHECK_FUNCS_IN('iconv_open', 'i
+     
+     conf.DEFINE('HAVE_NATIVE_ICONV', 1)
+ 
++"""
++[added for 4.7.0, but breaks cross-compilation]
+ conf.CHECK_CODE('''
+                 uint8_t inbuf[2] = { 0x30, 0xdf };
+                 uint8_t outbuf[4] = { 0 };
+@@ -36,3 +38,4 @@ conf.CHECK_CODE('''
+                 msg='Checking errno of iconv for illegal multibyte sequence',
+                 lib='iconv',
+                 headers='errno.h iconv.h')
++"""
diff --git a/meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch b/meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch
new file mode 100644
index 0000000..77c8b36
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/smb_conf-4.7.0.patch
@@ -0,0 +1,19 @@
+samba: correct log files location
+
+We use /var/log/samba.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+--- a/packaging/RHEL/setup/smb.conf
++++ b/packaging/RHEL/setup/smb.conf
+@@ -63,7 +63,7 @@
+ 
+ # this tells Samba to use a separate log file for each machine
+ # that connects
+-   log file = /usr/local/samba/var/log.%m
++   log file = /var/log/samba/log.%m
+ 
+ # Put a capping on the size of the log files (in Kb).
+    max log size = 50
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
similarity index 79%
rename from meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
index 59d7425..f33c138 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.7.0.bb
@@ -20,6 +20,9 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0006-avoid-using-colon-in-the-checking-msg.patch \
            file://netdb_defines.patch \
            file://glibc_only.patch \
+           file://iconv-4.7.0.patch \
+           file://dnsserver-4.7.0.patch \
+           file://smb_conf-4.7.0.patch \
            file://volatiles.03_samba \
           "
 SRC_URI_append_libc-musl = " \
@@ -27,14 +30,20 @@ SRC_URI_append_libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
           "
 
-SRC_URI[md5sum] = "c6ee5c766016d59908c8fb672fbbd445"
-SRC_URI[sha256sum] = "9ef24393de08390f236cabccd6a420b5cea304e959cbf1a99ff317325db3ddfa"
+SRC_URI[md5sum] = "cf5eaf34f510e3d5643c0dcfd49fcc40"
+SRC_URI[sha256sum] = "bd16d169988eb513e685a87e9964a5210482498fa9b3a22aaa8287a061e3c936"
+
+#SRC_URI[md5sum] = "c6ee5c766016d59908c8fb672fbbd445"
+#SRC_URI[sha256sum] = "9ef24393de08390f236cabccd6a420b5cea304e959cbf1a99ff317325db3ddfa"
 
 inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 libbsd libaio libpam"
+#DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libbsd libaio libpam"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libbsd libaio libpam"
+DEPENDS += "libldb"
+
 DEPENDS_append_libc-musl = " libtirpc"
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
 LDFLAGS_append_libc-musl = " -ltirpc"
@@ -45,12 +54,20 @@ LSB_linuxstdbase = "lsb"
 INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
 
-SYSTEMD_PACKAGES = "${PN}-base winbind"
+SYSTEMD_PACKAGES = "${PN}-base ${PN}-ad-dc winbind"
 SYSTEMD_SERVICE_${PN}-base = "nmb.service smb.service"
+SYSTEMD_SERVICE_${PN}-ad-dc = "${@bb.utils.contains('PACKAGECONFIG', 'ad-dc', 'samba.service', '', d)}"
 SYSTEMD_SERVICE_winbind = "winbind.service"
 
+# There are prerequisite settings to enable ad-dc, so disable the service by default.
+# Reference:
+# https://wiki.samba.org/index.php/Setting_up_Samba_as_an_Active_Directory_Domain_Controller
+SYSTEMD_AUTO_ENABLE_${PN}-ad-dc = "disable"
+
+# Use krb5.  Build active domain controller.
+#
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd zeroconf', d)} \
-                   acl cups ldap \
+                   acl ad-dc cups gnutls ldap mitkrb5 \
 "
 
 RDEPENDS_${PN}-base += "${LSB}"
@@ -68,13 +85,30 @@ PACKAGECONFIG[valgrind] = ",--without-valgrind,valgrind,"
 PACKAGECONFIG[lttng] = "--with-lttng, --without-lttng,lttng-ust"
 PACKAGECONFIG[archive] = "--with-libarchive, --without-libarchive, libarchive"
 
+# Building the AD (Active Directory) DC (Domain Controller) requires GnuTLS,
+# And ad-dc doesn't work with mitkrb5 for versions prior to 4.7.0 according to:
+# http://samba.2283325.n4.nabble.com/samba-4-6-6-Unknown-dependency-kdc-in-service-kdc-objlist-td4722096.html
+# So the working combination is:
+# 1) ad-dc: enable, gnutls: enable, mitkrb5: disable
+# 2) ad-dc: disable, gnutls: enable/disable, mitkrb5: enable
+#
+# We are now at 4.7.0, so take the above with a grain of salt. We do not need to know where
+# krb5kdc is unless ad-dc is enabled, but we tell configure anyhow.
+#
+PACKAGECONFIG[ad-dc] = ",--without-ad-dc,,"
+PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
+PACKAGECONFIG[mitkrb5] = "--with-system-mitkrb5 --with-system-mitkdc=/usr/sbin/krb5kdc,,krb5,"
 
 SAMBA4_IDMAP_MODULES="idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"
 SAMBA4_PDB_MODULES="pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
 SAMBA4_AUTH_MODULES="auth_unix,auth_wbc,auth_server,auth_netlogond,auth_script,auth_samba4"
 SAMBA4_MODULES="${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMBA4_AUTH_MODULES}"
 
-SAMBA4_LIBS="heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!tevent,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
+# These libraries are supposed to replace others supplied by packages, but decorate the names of
+# .so files so there will not be a conflict.  This is not done consistantly, so be very careful
+# when adding to this list.
+#
+SAMBA4_LIBS="heimdal,cmocka,NONE"
 
 EXTRA_OECONF += "--enable-fhs \
                  --with-piddir=/run \
@@ -82,12 +116,9 @@ EXTRA_OECONF += "--enable-fhs \
                  --with-modulesdir=${libdir}/samba \
                  --with-lockdir=${localstatedir}/lib/samba \
                  --with-cachedir=${localstatedir}/lib/samba \
-                 --disable-gnutls \
                  --disable-rpath-install \
                  --with-shared-modules=${SAMBA4_MODULES} \
                  --bundled-libraries=${SAMBA4_LIBS} \
-                 --with-system-mitkrb5 \
-                 --without-ad-dc \
                  ${@base_conditional('TARGET_ARCH', 'x86_64', '', '--disable-glusterfs', d)} \
                  --with-cluster-support \
                  --with-profiling-data \
@@ -113,6 +144,10 @@ do_install_append() {
         -e 's,/etc/sysconfig/samba,${sysconfdir}/default/samba,' \
         -i ${D}${systemd_system_unitdir}/*.service
 
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'ad-dc', 'yes', 'no', d)}" = "no" ]; then
+        rm -f ${D}${systemd_system_unitdir}/samba.service
+    fi
+
     install -d ${D}${sysconfdir}/tmpfiles.d
     install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
     echo "d ${localstatedir}/log/samba 0755 root root -" \
@@ -133,7 +168,7 @@ do_install_append() {
 
     install -d ${D}${sysconfdir}/samba
     echo "127.0.0.1 localhost" > ${D}${sysconfdir}/samba/lmhosts
-    install -m644 packaging/LSB/smb.conf ${D}${sysconfdir}/samba/smb.conf
+    install -m644 packaging/RHEL/setup/smb.conf ${D}${sysconfdir}/samba/smb.conf
     install -D -m 644 ${WORKDIR}/volatiles.03_samba ${D}${sysconfdir}/default/volatiles/03_samba
 
     install -d ${D}${sysconfdir}/default
@@ -161,7 +196,7 @@ do_install_append() {
 PACKAGES =+ "${PN}-python ${PN}-pidl \
              ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
              winbind \
-             ${PN}-common ${PN}-base ${PN}-ctdb-tests \
+             ${PN}-common ${PN}-base ${PN}-ad-dc ${PN}-ctdb-tests \
              smbclient"
 
 python samba_populate_packages() {
@@ -186,7 +221,8 @@ python samba_populate_packages() {
 
 PACKAGESPLITFUNCS_prepend = "samba_populate_packages "
 
-RDEPENDS_${PN} += "${PN}-base"
+RDEPENDS_${PN} += "${PN}-base ${PN}-python ${PN}-dsdb-modules"
+RDEPENDS_${PN}-python += "pytalloc python-tdb"
 
 FILES_${PN}-base = "${sbindir}/nmbd \
                     ${sbindir}/smbd \
@@ -195,9 +231,14 @@ FILES_${PN}-base = "${sbindir}/nmbd \
                     ${localstatedir}/nmbd \
                     ${localstatedir}/spool/samba \
                     ${systemd_system_unitdir}/nmb.service \
-                    ${systemd_system_unitdir}/samba.service \
                     ${systemd_system_unitdir}/smb.service"
 
+FILES_${PN}-ad-dc = "${sbindir}/samba \
+                     ${systemd_system_unitdir}/samba.service \
+                     ${libdir}/krb5/plugins/kdb/samba.so \
+                    "
+RDEPENDS_${PN}-ad-dc = "krb5-kdc"
+
 FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
                           ${bindir}/ctdb_run_cluster_tests \
                           ${sysconfdir}/ctdb/nodes \
-- 
2.7.4


