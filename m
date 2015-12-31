Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E265C60851
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 09:14:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBV9EcCf021679
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 01:14:38 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 31 Dec 2015 01:14:37 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Dec 2015 17:01:09 +0800
Message-ID: <1451552469-6237-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking][V2] net-snmp: fix the replacement in net-snmp-config
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
X-List-Received-Date: Thu, 31 Dec 2015 09:14:39 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

when net-snmp-config is used to configure by other package, and fail since
/libnl3 is not found, in fact, it should be -I/usr/include/libnl3, and is
modified as /libnl3 incorrectly.

instead of modify the net-snmp-config for target, the one under
${bindir_crossscripts} should be replaced with ${TAGING_INCDIR}

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index b32d842..68eea3f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -63,8 +63,7 @@ do_install_append() {
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/snmpd
     install -m 644 ${WORKDIR}/snmpd.conf ${D}${sysconfdir}/snmp/
     install -m 644 ${WORKDIR}/snmptrapd.conf ${D}${sysconfdir}/snmp/
-    sed -e "s@-I/usr/include@@g" \
-        -e "s@^prefix=.*@prefix=${STAGING_DIR_HOST}@g" \
+    sed    -e "s@^prefix=.*@prefix=${STAGING_DIR_HOST}@g" \
         -e "s@^exec_prefix=.*@exec_prefix=${STAGING_DIR_HOST}@g" \
         -e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
         -e "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \
@@ -98,6 +97,8 @@ net_snmp_sysroot_preprocess () {
     if [ -e ${D}${bindir}/net-snmp-config ]; then
         install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
         install -m 755 ${D}${bindir}/net-snmp-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+        sed -e "s@-I/usr/include@-I${STAGING_INCDIR}@g" \
+          -i  ${SYSROOT_DESTDIR}${bindir_crossscripts}/net-snmp-config
     fi
 }
 
-- 
1.9.1


