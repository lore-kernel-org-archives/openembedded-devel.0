Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6AC6612D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 03:40:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u753eHX2032521
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Aug 2016 20:40:17 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 4 Aug 2016 20:40:16 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Aug 2016 23:40:15 -0400
Message-ID: <1470368415-32916-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] samba: inherit update-rc.d to manage init script
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
X-List-Received-Date: Fri, 05 Aug 2016 03:40:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

inherit update-rc.d to manage init script, so we
can avoid duplicating the update-rc.d commands,
and the default behavior can be easily overridden
by distro.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.2.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
index b7ee730..1a5d54f 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
@@ -24,7 +24,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
 SRC_URI[md5sum] = "03a65a3adf08ceb1636ad59d234d7f9d"
 SRC_URI[sha256sum] = "eaecd41a85ebb9507b8db9856ada2a949376e9d53cf75664b5493658f6e5926a"
 
-inherit systemd waf-samba cpan-base perlnative
+inherit systemd waf-samba cpan-base perlnative update-rc.d
 # remove default added RDEPENDS on perl
 RDEPENDS_${PN}_remove = "perl"
 
@@ -33,6 +33,9 @@ DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libld
 SYSVINITTYPE_linuxstdbase = "lsb"
 SYSVINITTYPE = "sysv"
 
+INITSCRIPT_NAME = "samba.sh"
+INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVINITTYPE}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
@@ -102,8 +105,6 @@ do_install_append() {
     elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
-        update-rc.d -r ${D} samba.sh start 20 3 5 .
-        update-rc.d -r ${D} samba.sh start 20 0 1 6 .
     elif ${@bb.utils.contains('PACKAGECONFIG', 'sysv', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba.sh
@@ -112,8 +113,6 @@ do_install_append() {
             -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
             -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba.sh,g' \
             -i ${D}${sysconfdir}/init.d/samba.sh
-        update-rc.d -r ${D} samba.sh start 20 3 5 .
-        update-rc.d -r ${D} samba.sh start 20 0 1 6 .
     fi
 
     install -d ${D}${sysconfdir}/samba
-- 
2.7.4


