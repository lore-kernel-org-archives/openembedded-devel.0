Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 617576B073
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jun 2019 04:50:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5O4oELh007464
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jun 2019 21:50:24 -0700
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 23 Jun 2019 21:50:01 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Jun 2019 12:49:59 +0800
Message-ID: <1561351799-7702-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-networking][PATCH] strongswan: upgrade 5.7.1 -> 5.8.0
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
X-List-Received-Date: Mon, 24 Jun 2019 04:50:34 -0000
Content-Type: text/plain

Rename systemd service units since it uses strongswan-starter.service
for the legacy unit and strongswan.service for the modern one.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../strongswan/{strongswan_5.7.1.bb => strongswan_5.8.0.bb}      | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.7.1.bb => strongswan_5.8.0.bb} (94%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb
similarity index 94%
rename from meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb
index 5a4e2d3..fa1bd97 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.7.1.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.0.bb
@@ -12,8 +12,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[md5sum] = "86b7e9321cde075cf382268fd282e0b0"
-SRC_URI[sha256sum] = "006f9c9126e2a2f4e7a874b5e1bd2abec1bbbb193c8b3b3a4c6ccd8c2d454bec"
+SRC_URI[md5sum] = "e05f2d16a7479a2a9591609c256d523a"
+SRC_URI[sha256sum] = "15b1e10c7dd6253ab5d791fe9b9cb84624e24c118aecd9b90251b4e60daa0933"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -23,7 +23,6 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-
 PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
         ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
 "
@@ -48,7 +47,7 @@ inherit autotools systemd pkgconfig
 RRECOMMENDS_${PN} = "kernel-module-ipsec"
 
 FILES_${PN} += "${libdir}/ipsec/lib*${SOLIBS}"
-FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
+FILES_${PN}-dbg += "${bindir}/.debug ${sbindir}/.debug ${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
 FILES_${PN}-dev += "${libdir}/ipsec/lib*${SOLIBSDEV} ${libdir}/ipsec/*.la"
 FILES_${PN}-staticdev += "${libdir}/ipsec/*.a"
 
@@ -131,4 +130,4 @@ RDEPENDS_${PN} += "\
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'swanctl', '${BPN}-swanctl.service', '${BPN}.service', d)}"
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'swanctl', '${BPN}.service', '', d)} ${BPN}-starter.service"
-- 
2.7.4


