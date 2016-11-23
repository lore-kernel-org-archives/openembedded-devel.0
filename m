Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D8A0606B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 04:11:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAN4C0Bp021833
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 20:12:00 -0800 (PST)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.3.294.0; Tue, 22 Nov 2016 20:11:59 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Nov 2016 12:10:39 +0800
Message-ID: <20161123041040.21252-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [meta-networking][PATCH 1/2] net-snmp: fix snmptrap to use clientaddr from snmp.conf.
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
X-List-Received-Date: Wed, 23 Nov 2016 04:12:00 -0000
Content-Type: text/plain

Under IPv6 IP-multihomed environment, the socket does not bind to the
clientaddr indicated in snmp.conf when sending snmptrap and it might
choose a random one.
Backport the patch from net-snmp upstream to fix it.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...ix-snmptrap-to-use-clientaddr-from-snmp.c.patch | 48 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch
new file mode 100644
index 0000000..b05eea5
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch
@@ -0,0 +1,48 @@
+From a92628a163ebf1ea62220684736300461c003875 Mon Sep 17 00:00:00 2001
+From: Niels Baggesen <nba@users.sourceforge.net>
+Date: Mon, 26 Jan 2015 20:26:06 +0100
+Subject: [PATCH] BUG#a2584: Fix snmptrap to use clientaddr from snmp.conf.
+ Thanks to rizwan
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ snmplib/transports/snmpUDPIPv6Domain.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/snmplib/transports/snmpUDPIPv6Domain.c b/snmplib/transports/snmpUDPIPv6Domain.c
+index 55e3610..aca69ae 100644
+--- a/snmplib/transports/snmpUDPIPv6Domain.c
++++ b/snmplib/transports/snmpUDPIPv6Domain.c
+@@ -256,6 +256,27 @@ netsnmp_udp6_transport(struct sockaddr_in6 *addr, int local)
+         t->data = NULL;
+         t->data_length = 0;
+     } else {
++        char           *client_socket = NULL;
++        /*
++         * This is a client session.  If we've been given a
++         * client address to send from, then bind to that.
++         * Otherwise the send will use "something sensible".
++         */
++
++        client_socket = netsnmp_ds_get_string(NETSNMP_DS_LIBRARY_ID,
++                                    NETSNMP_DS_LIB_CLIENT_ADDR);
++        if (client_socket) {
++            struct sockaddr_in6 client_addr;
++            netsnmp_sockaddr_in6_2(&client_addr, client_socket, NULL);
++            rc = bind(t->sock, (struct sockaddr *)&client_addr,
++                              sizeof(struct sockaddr_in6));
++            if ( rc != 0 ) {
++                DEBUGMSGTL(("netsnmp_udp6", "failed to bind for clientaddr: %d %s\n",
++                                 errno, strerror(errno)));
++                netsnmp_socketbase_close(t);
++                netsnmp_transport_free(t);
++            }
++        }
+         /*
+          * This is a client session.  Save the address in the
+          * transport-specific data pointer for later use by netsnmp_udp6_send.
+-- 
+2.9.3
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 1997d5c..1400287 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -24,6 +24,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
            file://0001-snmplib-keytools.c-Don-t-check-for-return-from-EVP_M.patch \
            file://net-snmp-agentx-crash.patch \
            file://0001-get_pid_from_inode-Include-limit.h.patch \
+           file://0001-BUG-a2584-Fix-snmptrap-to-use-clientaddr-from-snmp.c.patch \
            "
 SRC_URI[md5sum] = "9f682bd70c717efdd9f15b686d07baee"
 SRC_URI[sha256sum] = "e8dfc79b6539b71a6ff335746ce63d2da2239062ad41872fff4354cafed07a3e"
-- 
2.9.3


