Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5596D60DF7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 11:06:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7CB6WsG004210
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 04:06:33 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 12 Aug 2014 04:06:32 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Aug 2014 19:06:33 +0800
Message-ID: <1407841593-25148-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-networking] net-snmp: uprev it to 5.7.2.1
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
X-List-Received-Date: Tue, 12 Aug 2014 11:06:35 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../files/net-snmp-5.7.2-fix-CVE-2014-2284.patch   |  126 --------------------
 .../files/net-snmp-5.7.2-fix-CVE-2014-2285.patch   |   26 ----
 .../{net-snmp_5.7.2.bb => net-snmp_5.7.2.1.bb}     |   10 +-
 3 files changed, 3 insertions(+), 159 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2284.patch
 delete mode 100644 meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2285.patch
 rename meta-networking/recipes-protocols/net-snmp/{net-snmp_5.7.2.bb => net-snmp_5.7.2.1.bb} (93%)

diff --git a/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2284.patch b/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2284.patch
deleted file mode 100644
index 4ad9064..0000000
--- a/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2284.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-diff -urpN a/agent/mibgroup/mibII/icmp.c b/agent/mibgroup/mibII/icmp.c
---- a/agent/mibgroup/mibII/icmp.c
-+++ b/agent/mibgroup/mibII/icmp.c
-@@ -106,10 +106,20 @@ struct icmp_msg_stats_table_entry {
-         int flags;
- };
- 
-+#ifdef linux
-+/* Linux keeps track of all possible message types */
-+#define ICMP_MSG_STATS_IPV4_COUNT 256
-+#else
- #define ICMP_MSG_STATS_IPV4_COUNT 11
-+#endif
- 
- #ifdef NETSNMP_ENABLE_IPV6
-+#ifdef linux
-+/* Linux keeps track of all possible message types */
-+#define ICMP_MSG_STATS_IPV6_COUNT 256
-+#else
- #define ICMP_MSG_STATS_IPV6_COUNT 14
-+#endif
- #else
- #define ICMP_MSG_STATS_IPV6_COUNT 0
- #endif /* NETSNMP_ENABLE_IPV6 */
-@@ -177,7 +187,7 @@ icmp_msg_stats_load(netsnmp_cache *cache
-     inc = 0;
-     linux_read_icmp_msg_stat(&v4icmp, &v4icmpmsg, &flag);
-     if (flag) {
--        while (254 != k) {
-+        while (255 >= k) {
-             if (v4icmpmsg.vals[k].InType) {
-                 icmp_msg_stats_table[i].ipVer = 1;
-                 icmp_msg_stats_table[i].icmpMsgStatsType = k;
-@@ -1050,6 +1060,12 @@ icmp_stats_table_handler(netsnmp_mib_han
- 					continue;
- 				table_info = netsnmp_extract_table_info(request);
- 				subid      = table_info->colnum;
-+				DEBUGMSGTL(( "mibII/icmpStatsTable", "oid: " ));
-+				DEBUGMSGOID(( "mibII/icmpStatsTable", request->requestvb->name,
-+						 request->requestvb->name_length ));
-+				DEBUGMSG(( "mibII/icmpStatsTable", " In %d InErr %d Out %d OutErr %d\n",
-+					      entry->icmpStatsInMsgs, entry->icmpStatsInErrors,
-+					      entry->icmpStatsOutMsgs, entry->icmpStatsOutErrors ));
- 
- 				switch (subid) {
- 					case ICMP_STAT_INMSG:
-@@ -1117,6 +1133,11 @@ icmp_msg_stats_table_handler(netsnmp_mib
-                     continue;
-                 table_info = netsnmp_extract_table_info(request);
-                 subid = table_info->colnum;
-+		DEBUGMSGTL(( "mibII/icmpMsgStatsTable", "oid: " ));
-+		DEBUGMSGOID(( "mibII/icmpMsgStatsTable", request->requestvb->name,
-+				request->requestvb->name_length ));
-+		DEBUGMSG(( "mibII/icmpMsgStatsTable", " In %d Out %d Flags 0x%x\n",
-+				entry->icmpMsgStatsInPkts, entry->icmpMsgStatsOutPkts, entry->flags ));
- 
-                 switch (subid) {
-                     case ICMP_MSG_STAT_IN_PKTS:
-diff -urpN a/agent/mibgroup/mibII/kernel_linux.c b/agent/mibgroup/mibII/kernel_linux.c
---- a/agent/mibgroup/mibII/kernel_linux.c
-+++ b/agent/mibgroup/mibII/kernel_linux.c
-@@ -81,9 +81,9 @@ decode_icmp_msg(char *line, char *data, 
-             index = strtol(token, &delim, 0);
-             if (ERANGE == errno) {
-                 continue;
--            } else if (index > LONG_MAX) {
-+            } else if (index > 255) {
-                 continue;
--            } else if (index < LONG_MIN) {
-+            } else if (index < 0) {
-                 continue;
-             }
-             if (NULL == (token = strtok_r(dataptr, " ", &saveptr1)))
-@@ -94,9 +94,9 @@ decode_icmp_msg(char *line, char *data, 
-             index = strtol(token, &delim, 0);
-             if (ERANGE == errno) {
-                 continue;
--            } else if (index > LONG_MAX) {
-+            } else if (index > 255) {
-                 continue;
--            } else if (index < LONG_MIN) {
-+            } else if (index < 0) {
-                 continue;
-             }
-             if(NULL == (token = strtok_r(dataptr, " ", &saveptr1)))
-@@ -426,14 +426,21 @@ linux_read_icmp6_parse(struct icmp6_mib 
- 
-         vals = name;
-         if (NULL != icmp6msgstat) {
-+            int type;
-             if (0 == strncmp(name, "Icmp6OutType", 12)) {
-                 strsep(&vals, "e");
--                icmp6msgstat->vals[atoi(vals)].OutType = stats;
-+                type = atoi(vals);
-+                if ( type < 0 || type > 255 )
-+                    continue;
-+                icmp6msgstat->vals[type].OutType = stats;
-                 *support = 1;
-                 continue;
-             } else if (0 == strncmp(name, "Icmp6InType", 11)) {
-                 strsep(&vals, "e");
--                icmp6msgstat->vals[atoi(vals)].InType = stats;
-+                type = atoi(vals);
-+                if ( type < 0 || type > 255 )
-+                    continue;
-+                icmp6msgstat->vals[type].OutType = stats;
-                 *support = 1;
-                 continue;
-             }
-diff -urpN a/agent/mibgroup/mibII/kernel_linux.h b/agent/mibgroup/mibII/kernel_linux.h
---- a/agent/mibgroup/mibII/kernel_linux.h
-+++ b/agent/mibgroup/mibII/kernel_linux.h
-@@ -121,11 +121,11 @@ struct icmp_msg_mib {
- 
- /* Lets use wrapper structures for future expansion */
- struct icmp4_msg_mib {
--    struct icmp_msg_mib vals[255];
-+    struct icmp_msg_mib vals[256];
- };
- 
- struct icmp6_msg_mib {
--    struct icmp_msg_mib vals[255];
-+    struct icmp_msg_mib vals[256];
- };
- 
- struct udp_mib {
diff --git a/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2285.patch b/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2285.patch
deleted file mode 100644
index 8267eeb..0000000
--- a/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2285.patch
+++ /dev/null
@@ -1,26 +0,0 @@
---- a/perl/TrapReceiver/TrapReceiver.xs
-+++ b/perl/TrapReceiver/TrapReceiver.xs
-@@ -81,18 +81,18 @@ int   perl_trapd_handler( netsnmp_pdu   
-         STOREPDUi("securitymodel", pdu->securityModel);
-         STOREPDUi("securitylevel", pdu->securityLevel);
-         STOREPDU("contextName",
--                 newSVpv(pdu->contextName, pdu->contextNameLen));
-+                 newSVpv(pdu->contextName ? pdu->contextName : "", pdu->contextNameLen));
-         STOREPDU("contextEngineID",
--                 newSVpv((char *) pdu->contextEngineID,
-+                 newSVpv(pdu->contextEngineID ? (char *) pdu->contextEngineID : "",
-                                     pdu->contextEngineIDLen));
-         STOREPDU("securityEngineID",
--                 newSVpv((char *) pdu->securityEngineID,
-+                 newSVpv(pdu->securityEngineID ? (char *) pdu->securityEngineID : "",
-                                     pdu->securityEngineIDLen));
-         STOREPDU("securityName",
--                 newSVpv((char *) pdu->securityName, pdu->securityNameLen));
-+                 newSVpv(pdu->securityName ? (char *) pdu->securityName : "", pdu->securityNameLen));
-     } else {
-         STOREPDU("community",
--                 newSVpv((char *) pdu->community, pdu->community_len));
-+                 newSVpv(pdu->community ? (char *) pdu->community : "", pdu->community_len));
-     }
- 
-     if (transport && transport->f_fmtaddr) {
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
similarity index 93%
rename from meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
rename to meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index f1e3a5d..eb97748 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -6,9 +6,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5
 
 DEPENDS = "openssl libnl pciutils"
 
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://init \
         file://snmpd.conf \
         file://snmptrapd.conf \
@@ -16,12 +14,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://snmpd.service \
         file://snmptrapd.service \
         file://ifmib.patch \
-        file://net-snmp-5.7.2-fix-CVE-2014-2284.patch \
-        file://net-snmp-5.7.2-fix-CVE-2014-2285.patch \
 "
 
-SRC_URI[md5sum] = "5bddd02e2f82b62daa79f82717737a14"
-SRC_URI[sha256sum] = "09ed31b4cc1f3c0411ef9a16eff79ef3b30d89c32ca46d5a01a41826c4ceb816"
+SRC_URI[md5sum] = "a2c83518648b0f2a5d378625e45c0e18"
+SRC_URI[sha256sum] = "ac9105539971f7cfb1456a86d479e18e8a8b3712212595ad40504347ba5843da"
 
 inherit autotools update-rc.d siteinfo systemd
 
-- 
1.7.10.4


