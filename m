Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6087719E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 04:12:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAN4C3Up004071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 20:12:03 -0800
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Tue, 22 Nov 2016 20:12:03 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Nov 2016 12:10:40 +0800
Message-ID: <20161123041040.21252-2-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161123041040.21252-1-li.zhou@windriver.com>
References: <20161123041040.21252-1-li.zhou@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [meta-networking][PATCH 2/2] net-snmp: snmplib, UDPIPv6 transport: Add a missing return statement
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
X-List-Received-Date: Wed, 23 Nov 2016 04:12:03 -0000
Content-Type: text/plain

Backport a succeeding commit from net-snmp upstream to fix the issue
introduced by commit
<BUG#a2584: Fix snmptrap to use clientaddr from snmp.conf>.
The missing return will cause crash when binding to a non-exist IPv6
address.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...IPv6-transport-Add-a-missing-return-state.patch | 29 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch
new file mode 100644
index 0000000..6255f7c
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch
@@ -0,0 +1,29 @@
+From 1ee72102fbe722d232d74abc4660a8b134cec8d6 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Sat, 23 May 2015 07:32:53 +0200
+Subject: [PATCH] snmplib, UDPIPv6 transport: Add a missing return statement
+
+Detected by Coverity.
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ snmplib/transports/snmpUDPIPv6Domain.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/snmplib/transports/snmpUDPIPv6Domain.c b/snmplib/transports/snmpUDPIPv6Domain.c
+index 029b164..11c39bb 100644
+--- a/snmplib/transports/snmpUDPIPv6Domain.c
++++ b/snmplib/transports/snmpUDPIPv6Domain.c
+@@ -285,6 +285,7 @@ netsnmp_udp6_transport(struct sockaddr_in6 *addr, int local)
+                                  errno, strerror(errno)));
+                 netsnmp_socketbase_close(t);
+                 netsnmp_transport_free(t);
++                return NULL;
+             }
+         }
+         /*
+-- 
+2.9.3
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 1400287..79e7766 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -25,6 +25,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://net-snmp-agentx-crash.patch \
            file://0001-get_pid_from_inode-Include-limit.h.patch \
            file://0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch \
+           file://0001-snmplib-UDPIPv6-transport-Add-a-missing-return-state.patch \
            "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
 SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
-- 
2.9.3


