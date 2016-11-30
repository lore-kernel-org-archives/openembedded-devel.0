Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 82E6871AB2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:21 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 5B4C6B81FA7; Wed, 30 Nov 2016 13:04:07 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:04:04 +0100
Message-Id: <1480507445-20746-16-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 16/17] samba: simplify LSB handling
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
X-List-Received-Date: Wed, 30 Nov 2016 12:04:21 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index b781f7c..8c5f6d8 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -30,8 +30,8 @@ RDEPENDS_${PN}_remove = "perl"
 
 DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb krb5 libbsd libaio libpam"
 
-SYSVINITTYPE_linuxstdbase = "lsb"
-SYSVINITTYPE = "sysv"
+LSB = ""
+LSB_linuxstdbase = "lsb"
 
 INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
@@ -40,19 +40,16 @@ SYSTEMD_PACKAGES = "${PN}-base winbind"
 SYSTEMD_SERVICE_${PN}-base = "nmb.service smb.service"
 SYSTEMD_SERVICE_winbind = "winbind.service"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVINITTYPE}', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'zeroconf', '', d)} \
                    acl cups ldap \
 "
 
-RDEPENDS_${PN}-base += "${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'lsb', '', d)}"
+RDEPENDS_${PN}-base += "${LSB}"
 RDEPENDS_${PN}-ctdb-tests += "bash"
 
 PACKAGECONFIG[acl] = "--with-acl-support,--without-acl-support,acl"
 PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
-PACKAGECONFIG[lsb] = ",,lsb"
-PACKAGECONFIG[sysv] = ",,sysvinit"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[sasl] = ",,cyrus-sasl"
@@ -112,7 +109,7 @@ do_install_append() {
     install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
     echo "d ${localstatedir}/log/samba 0755 root root -" \
         >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
-    if ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
+    if [ "${LSB}" = "lsb" ]; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d/samba
     else
-- 
2.7.4


