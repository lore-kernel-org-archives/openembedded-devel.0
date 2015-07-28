Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0E7762DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 07:57:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S7vNQL024273
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jul 2015 00:57:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 28 Jul 2015 00:57:11 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Jul 2015 15:55:11 +0800
Message-ID: <1438070111-12185-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] net-snmp: fix mib representation of timeout values
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
X-List-Received-Date: Tue, 28 Jul 2015 07:57:35 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Fix mib representation of timeout values,correct conversion
factor from microseconds to centiseconds.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../net-snmp-5.7.2-fix-mib-timeout-values.patch    | 56 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-mib-timeout-values.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-mib-timeout-values.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-mib-timeout-values.patch
new file mode 100644
index 0000000..324d1c0
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-5.7.2-fix-mib-timeout-values.patch
@@ -0,0 +1,56 @@
+net-snmp: fix mib representation of timeout values
+
+The patch comes from the follow three commits on upstream:
+78dac6e37943d1ad99841898806ea60b0eede636
+390303059fbd98b1ee7621ddd4ad4c11d100fff9
+96302af7fc3108c208227432f0f0b75f3e7b906d
+
+The first commit:
+Fix bug number #a2478: fix mib representation of timeout values.
+The second commit:
+Reverts 78dac6e37943d1ad99841898806ea60b0eede636 and resolve a2478
+in a way that avoids truncating
+The third commit:
+Corrects conversion factor from microseconds to centiseconds.
+
+Upstream-Status: Backport
+
+Signed-off-by: Per Hallsmark <per.hallsmark@windriver.com>
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+
+diff -uarN net-snmp-5.7.2-org/agent/mibgroup/notification/snmpNotifyTable.c net-snmp-5.7.2/agent/mibgroup/notification/snmpNotifyTable.c
+--- net-snmp-5.7.2-org/agent/mibgroup/notification/snmpNotifyTable.c	2015-04-09 15:24:18.393570318 +0800
++++ net-snmp-5.7.2/agent/mibgroup/notification/snmpNotifyTable.c	2015-04-09 15:25:23.547569858 +0800
+@@ -331,7 +331,7 @@
+     ptr->tAddressLen = t->remote_length;
+     ptr->tAddress = t->remote;
+ 
+-    ptr->timeout = ss->timeout / 1000;
++    ptr->timeout = ss->timeout / 10000;
+     ptr->retryCount = ss->retries;
+     SNMP_FREE(ptr->tagList);
+     ptr->tagList = strdup(ptr->name);
+diff -uarN net-snmp-5.7.2-org/agent/mibgroup/target/snmpTargetAddrEntry.h net-snmp-5.7.2/agent/mibgroup/target/snmpTargetAddrEntry.h
+--- net-snmp-5.7.2-org/agent/mibgroup/target/snmpTargetAddrEntry.h	2015-04-09 15:24:18.593570085 +0800
++++ net-snmp-5.7.2/agent/mibgroup/target/snmpTargetAddrEntry.h	2015-04-09 15:26:41.250570178 +0800
+@@ -51,7 +51,7 @@
+          int             tDomainLen;
+          unsigned char  *tAddress;
+          size_t          tAddressLen;
+-         int             timeout;
++         int             timeout;	/* Timeout in centiseconds */
+          int             retryCount;
+          char           *tagList;
+          char           *params;
+diff -uarN net-snmp-5.7.2-org/agent/mibgroup/target/target.c net-snmp-5.7.2/agent/mibgroup/target/target.c
+--- net-snmp-5.7.2-org/agent/mibgroup/target/target.c	2015-04-09 15:24:18.592569768 +0800
++++ net-snmp-5.7.2/agent/mibgroup/target/target.c	2015-04-09 15:25:52.586569961 +0800
+@@ -240,7 +240,7 @@
+                             }
+ #endif
+                             memset(&thissess, 0, sizeof(thissess));
+-                            thissess.timeout = (targaddrs->timeout) * 1000;
++                            thissess.timeout = (targaddrs->timeout) * 10000;
+                             thissess.retries = targaddrs->retryCount;
+                             DEBUGMSGTL(("target_sessions",
+                                         "timeout: %d -> %ld\n",
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index 2d9d974..464473e 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://run-ptest \
         file://0001-Fix-CVE-2014-2285.patch \
         file://dont-return-incompletely-parsed-varbinds.patch \
+        file://net-snmp-5.7.2-fix-mib-timeout-values.patch \
 "
 
 SRC_URI[md5sum] = "a2c83518648b0f2a5d378625e45c0e18"
-- 
1.9.1


