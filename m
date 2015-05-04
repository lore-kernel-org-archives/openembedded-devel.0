Return-Path: <zhengjunling@huawei.com>
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [119.145.14.66])
	by mail.openembedded.org (Postfix) with ESMTP id D38A0601DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 May 2015 03:27:11 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BFL92335; Mon, 04 May 2015 11:27:09 +0800 (CST)
Received: from Patch-Test.huawei (10.107.197.245) by
	szxeml432-hub.china.huawei.com (10.82.67.209) with Microsoft SMTP
	Server id 14.3.158.1; Mon, 4 May 2015 11:25:56 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 May 2015 03:22:26 +0000
Message-ID: <1430709746-18082-1-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.8.3.4
MIME-Version: 1.0
X-Originating-IP: [10.107.197.245]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.5546E70D.008F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 173fa05414505da3cad8144a6ae2ed12
Subject: [meta-networking][PATCH v2] net-snmp: fix CVE-2014-2285
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 May 2015 03:27:14 -0000
Content-Type: text/plain

The perl_trapd_handler function in perl/TrapReceiver/TrapReceiver.xs in
Net-SNMP 5.7.3.pre3 and earlier, when using certain Perl versions, allows
remote attackers to cause a denial of service (snmptrapd crash) via an
empty community string in an SNMP trap, which triggers a NULL pointer
dereference within the newSVpv function in Perl.

Refer to: https://bugzilla.redhat.com/show_bug.cgi?id=1072044

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 .../net-snmp/net-snmp/0001-Fix-CVE-2014-2285.patch | 49 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-CVE-2014-2285.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-CVE-2014-2285.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-CVE-2014-2285.patch
new file mode 100644
index 0000000..b1514b9
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-Fix-CVE-2014-2285.patch
@@ -0,0 +1,49 @@
+From 87a0d27102ceffb92e5c1d6fbbd24972a9dd33ac Mon Sep 17 00:00:00 2001
+From: Junling Zheng <zhengjunling@huawei.com>
+Date: Mon, 20 Apr 2015 10:23:08 +0000
+Subject: [PATCH] Fix CVE-2014-2285
+
+Sending SNMP trap with empty community string crashes snmptrapd if Perl
+handler is enabled.
+
+Refer to:
+https://bugzilla.redhat.com/show_bug.cgi?id=1072044
+
+Upstream Status: Backported
+
+Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
+---
+ perl/TrapReceiver/TrapReceiver.xs | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/perl/TrapReceiver/TrapReceiver.xs b/perl/TrapReceiver/TrapReceiver.xs
+index 531bfa4..ac94370 100644
+--- a/perl/TrapReceiver/TrapReceiver.xs
++++ b/perl/TrapReceiver/TrapReceiver.xs
+@@ -81,18 +81,18 @@ int   perl_trapd_handler( netsnmp_pdu           *pdu,
+         STOREPDUi("securitymodel", pdu->securityModel);
+         STOREPDUi("securitylevel", pdu->securityLevel);
+         STOREPDU("contextName",
+-                 newSVpv(pdu->contextName, pdu->contextNameLen));
++                 newSVpv(pdu->contextName ? pdu->contextName : "", pdu->contextNameLen));
+         STOREPDU("contextEngineID",
+-                 newSVpv((char *) pdu->contextEngineID,
++                 newSVpv((char *)(pdu->contextEngineID ? pdu->contextEngineID : ""),
+                                     pdu->contextEngineIDLen));
+         STOREPDU("securityEngineID",
+-                 newSVpv((char *) pdu->securityEngineID,
++                 newSVpv((char *)(pdu->securityEngineID ? pdu->securityEngineID : ""),
+                                     pdu->securityEngineIDLen));
+         STOREPDU("securityName",
+-                 newSVpv((char *) pdu->securityName, pdu->securityNameLen));
++                 newSVpv((char *)(pdu->securityName ? pdu->securityName : ""), pdu->securityNameLen));
+     } else {
+         STOREPDU("community",
+-                 newSVpv((char *) pdu->community, pdu->community_len));
++                 newSVpv((char *)(pdu->community ? pdu->community : ""), pdu->community_len));
+     }
+ 
+     if (transport && transport->f_fmtaddr) {
+-- 
+1.8.3.4
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index 1baf101..c9a692d 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://fix-libtool-finish.patch \
         file://net-snmp-testing-add-the-output-format-for-ptest.patch \
         file://run-ptest \
+        file://0001-Fix-CVE-2014-2285.patch \
 "
 
 SRC_URI[md5sum] = "a2c83518648b0f2a5d378625e45c0e18"
-- 
1.8.3.4


