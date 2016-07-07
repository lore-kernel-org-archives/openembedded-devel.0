Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C1B6C6013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jul 2016 02:18:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u672I7kW011320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Jul 2016 19:18:07 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jul 2016 19:18:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jul 2016 22:18:03 -0400
Message-ID: <300e066d93895e453c91f0174aad900646b1244c.1467857744.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1467857744.git.jackie.huang@windriver.com>
References: <cover.1467857744.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] net-snmp: fix snmpd crash via AgentX connection
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
X-List-Received-Date: Thu, 07 Jul 2016 02:18:09 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

backport a patch to fixed snmpd crashing when an AgentX
subagent disconnect in the middle of processing of a request.

Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../net-snmp/net-snmp/net-snmp-agentx-crash.patch  | 75 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-agentx-crash.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-agentx-crash.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-agentx-crash.patch
new file mode 100644
index 0000000..5eed893
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-agentx-crash.patch
@@ -0,0 +1,75 @@
+Description: fix snmpd crash via AgentX connection
+
+ taken from Fedora, net-snmp-5.7-agentx-crash.patch
+
+bz729738 - net-snmp dumps core in netsnmp_oid_find_prefix
+bz1038011 - net-snmp: snmpd crashes/hangs when AgentX subagent times-out
+
+commit f9304c83f76202db0e684269ca1af32e43cd9db4
+Author: Jan Safranek <jsafranek@users.sourceforge.net>
+Date:   Tue Feb 7 14:53:44 2012 +0100
+
+    CHANGES: PATCH 1633670: fixed snmpd crashing when an AgentX subagent
+    disconnect in the middle of processing of a request.
+
+    I fixed also the memory leak reported in the tracker comments.
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+---
+ agent/mibgroup/agentx/master.c       | 5 +++++
+ agent/mibgroup/agentx/master_admin.c | 9 +++++++--
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/agent/mibgroup/agentx/master.c b/agent/mibgroup/agentx/master.c
+index c42a42a..baeebaf 100644
+--- a/agent/mibgroup/agentx/master.c
++++ b/agent/mibgroup/agentx/master.c
+@@ -219,6 +219,9 @@ agentx_got_response(int operation,
+     if (!cache) {
+         DEBUGMSGTL(("agentx/master", "response too late on session %8p\n",
+                     session));
++        /* response is too late, free the cache */
++        if (magic)
++            netsnmp_free_delegated_cache((netsnmp_delegated_cache*) magic);
+         return 0;
+     }
+     requests = cache->requests;
+@@ -606,6 +609,8 @@ agentx_master_handler(netsnmp_mib_handler *handler,
+     result = snmp_async_send(ax_session, pdu, agentx_got_response, cb_data);
+     if (result == 0) {
+         snmp_free_pdu(pdu);
++        if (cb_data)
++            netsnmp_free_delegated_cache((netsnmp_delegated_cache*) cb_data);
+     }
+ 
+     return SNMP_ERR_NOERROR;
+diff --git a/agent/mibgroup/agentx/master_admin.c b/agent/mibgroup/agentx/master_admin.c
+index f16f392..b84b85e 100644
+--- a/agent/mibgroup/agentx/master_admin.c
++++ b/agent/mibgroup/agentx/master_admin.c
+@@ -133,11 +133,16 @@ close_agentx_session(netsnmp_session * session, int sessid)
+          * requests, so that the delegated request will be completed and
+          * further requests can be processed
+          */
+-        netsnmp_remove_delegated_requests_for_session(session);
++	while (netsnmp_remove_delegated_requests_for_session(session)) {
++		DEBUGMSGTL(("agentx/master", "Continue removing delegated reqests\n"));
++	}
++
+         if (session->subsession != NULL) {
+             netsnmp_session *subsession = session->subsession;
+             for(; subsession; subsession = subsession->next) {
+-                netsnmp_remove_delegated_requests_for_session(subsession);
++                while (netsnmp_remove_delegated_requests_for_session(subsession)) {
++			DEBUGMSGTL(("agentx/master", "Continue removing delegated subsession reqests\n"));
++		}
+             }
+         }
+                 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 79892a1..ca98fc0 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -22,6 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://0001-config_os_headers-Error-Fix.patch \
         file://0001-config_os_libs2-Error-Fix.patch \
         file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
+        file://net-snmp-agentx-crash.patch \
 "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
 SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
-- 
2.8.1


