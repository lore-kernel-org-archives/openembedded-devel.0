Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RyRxl-000221-10
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Feb 2012 18:51:17 +0100
Received: by mail-yw0-f47.google.com with SMTP id q46so1946136yhf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2012 09:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=EcRB8xFlM4bXffwdrtCkDhtpRP6KVwbSF/Ce54K16F4=;
	b=sDgMc+tOM0JQ1jgmOI6dsviu1OYzwvHBWb7PtbYMx51lNMNTVenJc08XBLr9dnX9LH
	kjKmYfY6jBm9ptObBU8gqGSGVv9BESmOupBvnY00qxfdoihE3j3D12/crpkyIBJDZDpT
	PS6FM84myx98QAAp05SQ5Ox4KvvjdscmxxUmE=
Received: by 10.236.133.210 with SMTP id q58mr11156123yhi.6.1329500584679;
	Fri, 17 Feb 2012 09:43:04 -0800 (PST)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id d5sm15769900anm.22.2012.02.17.09.43.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Feb 2012 09:43:04 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Feb 2012 17:42:33 +0000
Message-Id: <3d63f788c0d02be51bdd178e78f95197da5fab34.1329500480.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1329500479.git.otavio@ossystems.com.br>
References: <cover.1329500479.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1329500479.git.otavio@ossystems.com.br>
References: <cover.1329500479.git.otavio@ossystems.com.br>
Subject: [PATCH][meta-oe 5/7] net-snmp: use netlink support
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
X-List-Received-Date: Fri, 17 Feb 2012 17:51:17 -0000

To properly compile with netlink we added a patch that ports the
netlink use to libnl-3 API.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../net-snmp/files/libnl-3-support.patch           |   69 ++++++++++++++++++++
 meta-oe/recipes-extended/net-snmp/net-snmp.inc     |    4 +-
 .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |    3 +-
 3 files changed, 73 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/net-snmp/files/libnl-3-support.patch

diff --git a/meta-oe/recipes-extended/net-snmp/files/libnl-3-support.patch b/meta-oe/recipes-extended/net-snmp/files/libnl-3-support.patch
new file mode 100644
index 0000000..72699b8
--- /dev/null
+++ b/meta-oe/recipes-extended/net-snmp/files/libnl-3-support.patch
@@ -0,0 +1,69 @@
+Add support to libnl-3
+
+Upstream-Status: Pending
+
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
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp.inc b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
index 159c374..c202751 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp.inc
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp.inc
@@ -2,12 +2,12 @@ DESCRIPTION = "Various tools relating to the Simple Network Management Protocol"
 HOMEPAGE = "http://www.net-snmp.org/"
 LICENSE = "BSD"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl libnl"
 RDEPENDS_${PN}-server += "net-snmp-mibs"
 RDEPENDS_${PN}-client += "net-snmp-mibs"
 RDEPENDS_${PN}-dev = "net-snmp-client (= ${EXTENDPV}) net-snmp-server (= ${EXTENDPV})"
 RRECOMMENDS_${PN}-dbg = "net-snmp-client (= ${EXTENDPV}) net-snmp-server (= ${EXTENDPV})"
-INC_PR = "r0"
+INC_PR = "r1"
 
 inherit autotools update-rc.d siteinfo
 
diff --git a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
index 55dd9a6..9cbc5a8 100644
--- a/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
+++ b/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bb
@@ -1,9 +1,10 @@
 require net-snmp.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5a622ea24634e"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://sync-with-5.7-branch.patch \
+        file://libnl-3-support.patch \
         file://init \
         file://snmpd.conf \
         file://snmptrapd.conf"
-- 
1.7.2.5



