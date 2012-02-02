Received: from pd95cbf07.dip0.t-ipconnect.de ([217.92.191.7] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1Rsxjd-0003Hu-AZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Feb 2012 15:34:01 +0100
Received: by localhost (Postfix, from userid 1000)
	id 5FCC8C2CA7; Thu,  2 Feb 2012 15:17:24 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:16:47 +0100
Message-Id: <1328192207-13032-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
Cc: Eric BENARD <eric@eukrea.com>
Subject: [PATCH] net-snmp-5.7.1: fix build error "too few arguments to function 'nl_geterror'"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Feb 2012 14:34:01 -0000

Fixes compile errors with libnl-1_2.0:
| ...
| mibII/tcpTable.c:579: error: too few arguments to function 'nl_geterror'
| mibII/tcpTable.c:579: error: too few arguments to function 'nl_geterror'
| ...

The patch was imported from the net-snmp bug tracker: current libnl 3.0 not
supported - ID: 3250304 [1]

[1] <http://sourceforge.net/tracker/index.php?func=detail&aid=3250304&group_id=12694&atid=112694>

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 .../net-snmp/net-snmp-5.7.1/net-snmp-libnl.patch   |   65 ++++++++++++++++++++
 recipes/net-snmp/net-snmp_5.7.1.bb                 |    3 +-
 2 files changed, 67 insertions(+), 1 deletions(-)
 create mode 100644 recipes/net-snmp/net-snmp-5.7.1/net-snmp-libnl.patch

diff --git a/recipes/net-snmp/net-snmp-5.7.1/net-snmp-libnl.patch b/recipes/net-snmp/net-snmp-5.7.1/net-snmp-libnl.patch
new file mode 100644
index 0000000..0879e45
--- /dev/null
+++ b/recipes/net-snmp/net-snmp-5.7.1/net-snmp-libnl.patch
@@ -0,0 +1,65 @@
+--- net-snmp-5.6.1/agent/mibgroup/mibII/tcpTable.c.org	2011-03-27 22:39:13.428728506 +0200
++++ net-snmp-5.6.1/agent/mibgroup/mibII/tcpTable.c	2011-03-27 22:39:47.606956561 +0200
+@@ -555,8 +555,9 @@
+ static int
+ tcpTable_load_netlink(void)
+ {
++	int err;
+ 	/*  TODO: perhaps use permanent nl handle? */
+-	struct nl_handle *nl = nl_handle_alloc();
++	struct nl_sock *nl = nl_socket_alloc();
+ 
+ 	if (nl == NULL) {
+ 		DEBUGMSGTL(("mibII/tcpTable", "Failed to allocate netlink handle\n"));
+@@ -564,10 +565,10 @@
+ 		return -1;
+ 	}
+ 
+-	if (nl_connect(nl, NETLINK_INET_DIAG) < 0) {
+-		DEBUGMSGTL(("mibII/tcpTable", "Failed to connect to netlink: %s\n", nl_geterror()));
+-		snmp_log(LOG_ERR, "snmpd: Couldn't connect to netlink: %s\n", nl_geterror());
+-		nl_handle_destroy(nl);
++	if ((err = nl_connect(nl, NETLINK_INET_DIAG)) < 0) {
++		DEBUGMSGTL(("mibII/tcpTable", "Failed to connect to netlink: %s\n", nl_geterror(err)));
++		snmp_log(LOG_ERR, "snmpd: Couldn't connect to netlink: %s\n", nl_geterror(err));
++		nl_socket_free(nl);
+ 		return -1;
+ 	}
+ 
+@@ -579,10 +580,10 @@
+ 	struct nl_msg *nm = nlmsg_alloc_simple(TCPDIAG_GETSOCK, NLM_F_ROOT|NLM_F_MATCH|NLM_F_REQUEST);
+ 	nlmsg_append(nm, &req, sizeof(struct inet_diag_req), 0);
+ 
+-	if (nl_send_auto_complete(nl, nm) < 0) {
+-		DEBUGMSGTL(("mibII/tcpTable", "nl_send_autocomplete(): %s\n", nl_geterror()));
+-		snmp_log(LOG_ERR, "snmpd: nl_send_autocomplete(): %s\n", nl_geterror());
+-		nl_handle_destroy(nl);
++	if ((err = nl_send_auto_complete(nl, nm)) < 0) {
++		DEBUGMSGTL(("mibII/tcpTable", "nl_send_autocomplete(): %s\n", nl_geterror(err)));
++		snmp_log(LOG_ERR, "snmpd: nl_send_autocomplete(): %s\n", nl_geterror(err));
++		nl_socket_free(nl);
+ 		return -1;
+ 	}
+ 	nlmsg_free(nm);
+@@ -593,9 +594,9 @@
+ 
+ 	while (running) {
+ 		if ((len = nl_recv(nl, &peer, &buf, NULL)) <= 0) {
+-			DEBUGMSGTL(("mibII/tcpTable", "nl_recv(): %s\n", nl_geterror()));
+-			snmp_log(LOG_ERR, "snmpd: nl_recv(): %s\n", nl_geterror());
+-			nl_handle_destroy(nl);
++			DEBUGMSGTL(("mibII/tcpTable", "nl_recv(): %s\n", nl_geterror(len)));
++			snmp_log(LOG_ERR, "snmpd: nl_recv(): %s\n", nl_geterror(len));
++			nl_socket_free(nl);
+ 			return -1;
+ 		}
+ 
+@@ -644,7 +645,7 @@
+ 		free(buf);
+ 	}
+ 
+-	nl_handle_destroy(nl);
++	nl_socket_free(nl);
+ 
+ 	if (tcp_head) {
+ 		DEBUGMSGTL(("mibII/tcpTable", "Loaded TCP Table using netlink\n"));
diff --git a/recipes/net-snmp/net-snmp_5.7.1.bb b/recipes/net-snmp/net-snmp_5.7.1.bb
index 08571e9..655d7be 100644
--- a/recipes/net-snmp/net-snmp_5.7.1.bb
+++ b/recipes/net-snmp/net-snmp_5.7.1.bb
@@ -1,10 +1,11 @@
 require net-snmp.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5a622ea24634e"
 
 DEFAULT_PREFERENCE = "1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
+        file://net-snmp-libnl.patch \
         file://init \
         file://snmpd.conf \
         file://snmptrapd.conf"
-- 
1.7.7



