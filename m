Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9201A6098B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 08:40:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s498efE5024659
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 May 2014 01:40:41 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 9 May 2014 01:40:40 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 May 2014 16:40:37 +0800
Message-ID: <1399624837-21018-3-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399624837-21018-1-git-send-email-rongqing.li@windriver.com>
References: <1399624837-21018-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/3] net-snmp-5.7.2: fix CVE-2014-2285
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
X-List-Received-Date: Fri, 09 May 2014 08:40:42 -0000
Content-Type: text/plain

From: yzhu1 <yanjun.zhu@windriver.com>

The perl_trapd_handler function in perl/TrapReceiver/TrapReceiver.xs
in Net-SNMP 5.7.3.pre3 and earlier, when using certain Perl versions,
allows remote attackers to cause a denial of service (snmptrapd
crash) via an empty community string in an SNMP trap, which triggers
a NULL pointer dereference within the newSVpv function in Perl.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2285
Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../files/net-snmp-5.7.2-fix-CVE-2014-2285.patch   |   26 ++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.bb   |    3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2285.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2285.patch b/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2285.patch
new file mode 100644
index 0000000..a031d3a
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2285.patch
@@ -0,0 +1,26 @@
+--- a/perl/TrapReceiver/TrapReceiver.xs
++++ b/perl/TrapReceiver/TrapReceiver.xs
+@@ -81,18 +81,18 @@ int   perl_trapd_handler( netsnmp_pdu   
+         STOREPDUi("securitymodel", pdu->securityModel);
+         STOREPDUi("securitylevel", pdu->securityLevel);
+         STOREPDU("contextName",
+-                 newSVpv(pdu->contextName, pdu->contextNameLen));
++                 newSVpv(pdu->contextName ? pdu->contextName : "", pdu->contextNameLen));
+         STOREPDU("contextEngineID",
+-                 newSVpv((char *) pdu->contextEngineID,
++                 newSVpv(pdu->contextEngineID ? (char *) pdu->contextEngineID : "",
+                                     pdu->contextEngineIDLen));
+         STOREPDU("securityEngineID",
+-                 newSVpv((char *) pdu->securityEngineID,
++                 newSVpv(pdu->securityEngineID ? (char *) pdu->securityEngineID : "",
+                                     pdu->securityEngineIDLen));
+         STOREPDU("securityName",
+-                 newSVpv((char *) pdu->securityName, pdu->securityNameLen));
++                 newSVpv(pdu->securityName ? (char *) pdu->securityName : "", pdu->securityNameLen));
+     } else {
+         STOREPDU("community",
+-                 newSVpv((char *) pdu->community, pdu->community_len));
++                 newSVpv(pdu->community ? (char *) pdu->community : "", pdu->community_len));
+     }
+ 
+     if (transport && transport->f_fmtaddr) {
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
index 8f20ce9..7ab564a 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://snmptrapd.service \
         file://ifmib.patch \
         file://net-snmp-5.7.2-fix-CVE-2014-2284.patch \
+        file://net-snmp-5.7.2-fix-CVE-2014-2285.patch \
 "
 
 SRC_URI[md5sum] = "5bddd02e2f82b62daa79f82717737a14"
-- 
1.7.10.4


