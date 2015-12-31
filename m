Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4289E6FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 01:39:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBV1dmx2026499
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 17:39:48 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 30 Dec 2015 17:39:47 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Dec 2015 09:26:20 +0800
Message-ID: <1451525180-15429-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] net-snmp: fix the replacement in net-snmp-config
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
X-List-Received-Date: Thu, 31 Dec 2015 01:39:48 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

when net-snmp-config is used to configure by other package, and fail since
/libnl3 is not found, in fact, it should be -I/usr/include/libnl3, and is
modified as /libnl3 incorrectly.

fix this replacement by adding = after -I to consider the sysroot

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index b32d842..ebd0c68 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -63,7 +63,7 @@ do_install_append() {
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/snmpd
     install -m 644 ${WORKDIR}/snmpd.conf ${D}${sysconfdir}/snmp/
     install -m 644 ${WORKDIR}/snmptrapd.conf ${D}${sysconfdir}/snmp/
-    sed -e "s@-I/usr/include@@g" \
+    sed -e "s@-I/usr/include@-I=/usr/include@g" \
         -e "s@^prefix=.*@prefix=${STAGING_DIR_HOST}@g" \
         -e "s@^exec_prefix=.*@exec_prefix=${STAGING_DIR_HOST}@g" \
         -e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
-- 
1.9.1


