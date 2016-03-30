Return-Path: <Catalin.Enache@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8FE6612C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 09:06:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U96JGI025208
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2016 02:06:19 -0700 (PDT)
Received: from no3.corp.ad.wrs.com (128.224.124.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Mar 2016 02:06:18 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Mar 2016 12:08:21 +0300
Message-ID: <1459328901-21333-1-git-send-email-catalin.enache@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] net-snmp: fix invalid paths in target net-snmp-config
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
X-List-Received-Date: Wed, 30 Mar 2016 09:06:20 -0000
Content-Type: text/plain

Only net-snmp-config used for sysroot should have sysroot
specific paths.

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 63e0fc7..1a50932 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -70,11 +70,6 @@ do_install_append() {
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/snmpd
     install -m 644 ${WORKDIR}/snmpd.conf ${D}${sysconfdir}/snmp/
     install -m 644 ${WORKDIR}/snmptrapd.conf ${D}${sysconfdir}/snmp/
-    sed    -e "s@^prefix=.*@prefix=${STAGING_DIR_HOST}@g" \
-        -e "s@^exec_prefix=.*@exec_prefix=${STAGING_DIR_HOST}@g" \
-        -e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
-        -e "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \
-        -i ${D}${bindir}/net-snmp-config
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
@@ -109,6 +104,11 @@ net_snmp_sysroot_preprocess () {
         install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
         install -m 755 ${D}${bindir}/net-snmp-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
         sed -e "s@-I/usr/include@-I${STAGING_INCDIR}@g" \
+            -e "s@^prefix=.*@prefix=${STAGING_DIR_HOST}${prefix}@g" \
+            -e "s@^exec_prefix=.*@exec_prefix=${STAGING_EXECPREFIXDIR}@g" \
+            -e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
+            -e "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \
+            -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=${S}@g" \
           -i  ${SYSROOT_DESTDIR}${bindir_crossscripts}/net-snmp-config
     fi
 }
-- 
2.7.4


