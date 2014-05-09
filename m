Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 938E46098B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 May 2014 08:40:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s498ec82007617
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 May 2014 01:40:40 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 9 May 2014 01:40:37 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 May 2014 16:40:36 +0800
Message-ID: <1399624837-21018-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399624837-21018-1-git-send-email-rongqing.li@windriver.com>
References: <1399624837-21018-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/3] net-snmp-5.7.2: fix CVE-2014-2284
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
X-List-Received-Date: Fri, 09 May 2014 08:40:41 -0000
Content-Type: text/plain

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

The Linux implementation of the ICMP-MIB in Net-SNMP 5.5 before
5.5.2.1, 5.6.x before 5.6.2.1, and 5.7.x before 5.7.2.1 does
not properly validate input, which allows remote attackers
to cause a denial of service via unspecified vectors.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-2284
Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../files/net-snmp-5.7.2-fix-CVE-2014-2284.patch   |  126 ++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.bb   |    1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2284.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2284.patch b/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2284.patch
new file mode 100644
index 0000000..10dec17
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/files/net-snmp-5.7.2-fix-CVE-2014-2284.patch
@@ -0,0 +1,126 @@
+diff -urpN a/agent/mibgroup/mibII/icmp.c b/agent/mibgroup/mibII/icmp.c
+--- a/agent/mibgroup/mibII/icmp.c
++++ b/agent/mibgroup/mibII/icmp.c
+@@ -106,10 +106,20 @@ struct icmp_msg_stats_table_entry {
+         int flags;
+ };
+ 
++#ifdef linux
++/* Linux keeps track of all possible message types */
++#define ICMP_MSG_STATS_IPV4_COUNT 256
++#else
+ #define ICMP_MSG_STATS_IPV4_COUNT 11
++#endif
+ 
+ #ifdef NETSNMP_ENABLE_IPV6
++#ifdef linux
++/* Linux keeps track of all possible message types */
++#define ICMP_MSG_STATS_IPV6_COUNT 256
++#else
+ #define ICMP_MSG_STATS_IPV6_COUNT 14
++#endif
+ #else
+ #define ICMP_MSG_STATS_IPV6_COUNT 0
+ #endif /* NETSNMP_ENABLE_IPV6 */
+@@ -177,7 +187,7 @@ icmp_msg_stats_load(netsnmp_cache *cache
+     inc = 0;
+     linux_read_icmp_msg_stat(&v4icmp, &v4icmpmsg, &flag);
+     if (flag) {
+-        while (254 != k) {
++        while (255 >= k) {
+             if (v4icmpmsg.vals[k].InType) {
+                 icmp_msg_stats_table[i].ipVer = 1;
+                 icmp_msg_stats_table[i].icmpMsgStatsType = k;
+@@ -1050,6 +1060,12 @@ icmp_stats_table_handler(netsnmp_mib_han
+ 					continue;
+ 				table_info = netsnmp_extract_table_info(request);
+ 				subid      = table_info->colnum;
++				DEBUGMSGTL(( "mibII/icmpStatsTable", "oid: " ));
++				DEBUGMSGOID(( "mibII/icmpStatsTable", request->requestvb->name,
++						 request->requestvb->name_length ));
++				DEBUGMSG(( "mibII/icmpStatsTable", " In %d InErr %d Out %d OutErr %d\n",
++					      entry->icmpStatsInMsgs, entry->icmpStatsInErrors,
++					      entry->icmpStatsOutMsgs, entry->icmpStatsOutErrors ));
+ 
+ 				switch (subid) {
+ 					case ICMP_STAT_INMSG:
+@@ -1117,6 +1133,11 @@ icmp_msg_stats_table_handler(netsnmp_mib
+                     continue;
+                 table_info = netsnmp_extract_table_info(request);
+                 subid = table_info->colnum;
++		DEBUGMSGTL(( "mibII/icmpMsgStatsTable", "oid: " ));
++		DEBUGMSGOID(( "mibII/icmpMsgStatsTable", request->requestvb->name,
++				request->requestvb->name_length ));
++		DEBUGMSG(( "mibII/icmpMsgStatsTable", " In %d Out %d Flags 0x%x\n",
++				entry->icmpMsgStatsInPkts, entry->icmpMsgStatsOutPkts, entry->flags ));
+ 
+                 switch (subid) {
+                     case ICMP_MSG_STAT_IN_PKTS:
+diff -urpN a/agent/mibgroup/mibII/kernel_linux.c b/agent/mibgroup/mibII/kernel_linux.c
+--- a/agent/mibgroup/mibII/kernel_linux.c
++++ b/agent/mibgroup/mibII/kernel_linux.c
+@@ -81,9 +81,9 @@ decode_icmp_msg(char *line, char *data, 
+             index = strtol(token, &delim, 0);
+             if (ERANGE == errno) {
+                 continue;
+-            } else if (index > LONG_MAX) {
++            } else if (index > 255) {
+                 continue;
+-            } else if (index < LONG_MIN) {
++            } else if (index < 0) {
+                 continue;
+             }
+             if (NULL == (token = strtok_r(dataptr, " ", &saveptr1)))
+@@ -94,9 +94,9 @@ decode_icmp_msg(char *line, char *data, 
+             index = strtol(token, &delim, 0);
+             if (ERANGE == errno) {
+                 continue;
+-            } else if (index > LONG_MAX) {
++            } else if (index > 255) {
+                 continue;
+-            } else if (index < LONG_MIN) {
++            } else if (index < 0) {
+                 continue;
+             }
+             if(NULL == (token = strtok_r(dataptr, " ", &saveptr1)))
+@@ -426,14 +426,21 @@ linux_read_icmp6_parse(struct icmp6_mib 
+ 
+         vals = name;
+         if (NULL != icmp6msgstat) {
++            int type;
+             if (0 == strncmp(name, "Icmp6OutType", 12)) {
+                 strsep(&vals, "e");
+-                icmp6msgstat->vals[atoi(vals)].OutType = stats;
++                type = atoi(vals);
++                if ( type < 0 || type > 255 )
++                    continue;
++                icmp6msgstat->vals[type].OutType = stats;
+                 *support = 1;
+                 continue;
+             } else if (0 == strncmp(name, "Icmp6InType", 11)) {
+                 strsep(&vals, "e");
+-                icmp6msgstat->vals[atoi(vals)].InType = stats;
++                type = atoi(vals);
++                if ( type < 0 || type > 255 )
++                    continue;
++                icmp6msgstat->vals[type].OutType = stats;
+                 *support = 1;
+                 continue;
+             }
+diff -urpN a/agent/mibgroup/mibII/kernel_linux.h b/agent/mibgroup/mibII/kernel_linux.h
+--- a/agent/mibgroup/mibII/kernel_linux.h
++++ b/agent/mibgroup/mibII/kernel_linux.h
+@@ -121,11 +121,11 @@ struct icmp_msg_mib {
+ 
+ /* Lets use wrapper structures for future expansion */
+ struct icmp4_msg_mib {
+-    struct icmp_msg_mib vals[255];
++    struct icmp_msg_mib vals[256];
+ };
+ 
+ struct icmp6_msg_mib {
+-    struct icmp_msg_mib vals[255];
++    struct icmp_msg_mib vals[256];
+ };
+ 
+ struct udp_mib {
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
index f6656ad..8f20ce9 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://snmpd.service \
         file://snmptrapd.service \
         file://ifmib.patch \
+        file://net-snmp-5.7.2-fix-CVE-2014-2284.patch \
 "
 
 SRC_URI[md5sum] = "5bddd02e2f82b62daa79f82717737a14"
-- 
1.7.10.4


