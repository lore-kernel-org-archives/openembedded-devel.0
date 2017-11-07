Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE3F378446
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Nov 2017 05:46:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA75k2xF029506
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Nov 2017 21:46:02 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 6 Nov 2017 21:46:01 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Nov 2017 13:44:24 +0800
Message-ID: <93f7c6854e3e0ba82680273263ffe48c80daccc6.1510033036.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1510033036.git.jackie.huang@windriver.com>
References: <cover.1510033036.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2 v2] samba: fix for AD DC service
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
X-List-Received-Date: Tue, 07 Nov 2017 05:46:00 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The Active Directory (AD) domain controller (DC) service
is installed by default since the commit:
"""
commit 28b8edc760d5e0664ad4861464f5de06f5fc305a
samba: install all systemd unit files
This includes samba.service, which other major distributions install, too.
"""

But lack of required executable since ad-dc feature is disabled by default.

There are two known issues when enable ad-dc feature:
- it doesn't work well with mitkrb5
  http://samba.2283325.n4.nabble.com/samba-4-6-6-Unknown-dependency-kdc-in-service-kdc-objlist-td4722096.html
- if mitkrb5 is disabled, embedded_heimdal will be built but will fail for
  x86 if there is no 32bit libbsd on the host.

To fix the issues:
- Add PACKAGECONFIG for ad-dc and disable by default.
- Add PACKAGECONFIG for gnutls which is required by ad-dc and
  disable by default.
- Add PACKAGECONFIG for mitkrb5 and enable by default.
- Don't install samba.service if ad-dc is disabled.
- Re-package ad-dc service and executable into a new package samba-ad-dc

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-connectivity/samba/samba_4.6.7.bb      | 40 +++++++++++++++++-----
 1 file changed, 32 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
index 2b227c95d..8395acb5e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
@@ -34,7 +34,7 @@ inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
-DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 libbsd libaio libpam"
+DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libbsd libaio libpam"
 DEPENDS_append_libc-musl = " libtirpc"
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
 LDFLAGS_append_libc-musl = " -ltirpc"
@@ -45,12 +45,18 @@ LSB_linuxstdbase = "lsb"
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
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd zeroconf', d)} \
-                   acl cups ldap \
+                   acl cups ldap mitkrb5 \
 "
 
 RDEPENDS_${PN}-base += "${LSB}"
@@ -68,6 +74,20 @@ PACKAGECONFIG[valgrind] = ",--without-valgrind,valgrind,"
 PACKAGECONFIG[lttng] = "--with-lttng, --without-lttng,lttng-ust"
 PACKAGECONFIG[archive] = "--with-libarchive, --without-libarchive, libarchive"
 
+# Building the AD (Active Directory) DC (Domain Controller) requires GnuTLS,
+# And ad-dc doesn't work with mitkrb5 for versions prior to 4.7.0 according to:
+# http://samba.2283325.n4.nabble.com/samba-4-6-6-Unknown-dependency-kdc-in-service-kdc-objlist-td4722096.html
+# So the working combination is:
+# 1) ad-dc: enable, gnutls: enable, mitkrb5: disable
+# 2) ad-dc: disable, gnutls: enable/disable, mitkrb5: enable
+#
+# There is another known issue when mitkrb5 is disabled:
+# embedded_heimdal will be built but will fail for x86 if there is no 32bit libbsd on the host.
+# so ad-dc is disabled and mitkrb5 is enabled by default, someone wants to use ad-dc may need
+# to enable themself and workaround the issue.
+PACKAGECONFIG[ad-dc] = ",--without-ad-dc,,"
+PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls,"
+PACKAGECONFIG[mitkrb5] = "--with-system-mitkrb5,,krb5,"
 
 SAMBA4_IDMAP_MODULES="idmap_ad,idmap_rid,idmap_adex,idmap_hash,idmap_tdb2"
 SAMBA4_PDB_MODULES="pdb_tdbsam,${@bb.utils.contains('PACKAGECONFIG', 'ldap', 'pdb_ldap,', '', d)}pdb_ads,pdb_smbpasswd,pdb_wbc_sam,pdb_samba4"
@@ -82,12 +102,9 @@ EXTRA_OECONF += "--enable-fhs \
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
@@ -113,6 +130,10 @@ do_install_append() {
         -e 's,/etc/sysconfig/samba,${sysconfdir}/default/samba,' \
         -i ${D}${systemd_system_unitdir}/*.service
 
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'ad-dc', 'yes', 'no', d)}" = "no" ]; then
+        rm -f ${D}${systemd_system_unitdir}/samba.service
+    fi
+
     install -d ${D}${sysconfdir}/tmpfiles.d
     install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
     echo "d ${localstatedir}/log/samba 0755 root root -" \
@@ -161,7 +182,7 @@ do_install_append() {
 PACKAGES =+ "${PN}-python ${PN}-pidl \
              ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
              winbind \
-             ${PN}-common ${PN}-base ${PN}-ctdb-tests \
+             ${PN}-common ${PN}-base ${PN}-ad-dc ${PN}-ctdb-tests \
              smbclient"
 
 python samba_populate_packages() {
@@ -196,9 +217,12 @@ FILES_${PN}-base = "${sbindir}/nmbd \
                     ${localstatedir}/nmbd \
                     ${localstatedir}/spool/samba \
                     ${systemd_system_unitdir}/nmb.service \
-                    ${systemd_system_unitdir}/samba.service \
                     ${systemd_system_unitdir}/smb.service"
 
+FILES_${PN}-ad-dc = "${sbindir}/samba \
+                     ${systemd_system_unitdir}/samba.service \
+                    "
+
 FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
                           ${bindir}/ctdb_run_cluster_tests \
                           ${sysconfdir}/ctdb/nodes \
-- 
2.11.0


