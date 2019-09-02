Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0D56D470
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 05:43:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x825hEKF007001
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 1 Sep 2019 22:43:24 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 1 Sep 2019 22:43:03 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Sep 2019 13:42:46 +0800
Message-ID: <20190902054246.15306-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-oe][PATCH] tipcutils: ptts: Set recv buffer size to max to receive as many packets as possible
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
X-List-Received-Date: Mon, 02 Sep 2019 05:43:33 -0000
Content-Type: text/plain

Flooding multicast may make the rcv buffer overrun and is considered
premature messages later and thus cause the following error.

"Ignoring premature msg 16, currently handling 12"

This patch sets SO_RCVBUF the of socket to max int value to receive as many
packets as possible, and give a hint to user when possible overrun occurs. Note
that the value of SO_RCVBUF will be limited up to min(INT_MAX/2,
sysctl_rmem_max) in kernel.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...et-recv-buffer-size-too-max-to-receive-as.patch | 66 ++++++++++++++++++++++
 .../recipes-extended/tipcutils/tipcutils_git.bb    |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils/0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch b/meta-oe/recipes-extended/tipcutils/tipcutils/0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch
new file mode 100644
index 000000000..39f899cf1
--- /dev/null
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch
@@ -0,0 +1,66 @@
+From 4e4c8c7a1cca2125e2bf2a67cbab0bdbd78fdb86 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Tue, 30 Jul 2019 13:24:22 +0800
+Subject: [PATCH] ptts: Set recv buffer size too max to receive as many
+ packets as possible
+
+Flooding multicast may make the rcv buffer overrun and is considered
+premature messages later and thus cause the following error.
+
+"Ignoring premature msg 16, currently handling 12"
+
+This patch sets SO_RCVBUF the of socket to max int value to receive as many
+packets as possible, and give a hint to user when possible overrun occurs. Note
+that the value of SO_RCVBUF will be limited up to min(INT_MAX/2,
+sysctl_rmem_max) in kernel.
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ ptts/tipc_ts_server.c | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/ptts/tipc_ts_server.c b/ptts/tipc_ts_server.c
+index a286daa..3a2f96f 100644
+--- a/ptts/tipc_ts_server.c
++++ b/ptts/tipc_ts_server.c
+@@ -641,8 +641,9 @@ void server_mcast
+ 				if (rc < 0)
+ 					err("multicast message not received");
+ 				if (msgno != *(int*) buf) {
+-					dbg1("Ignoring premature msg %u, currently handling %u\n",
+-					       *(int*)buf, msgno);
++					dbg1("Ignoring premature msg %u, currently handling %u\n"
++                                             "You can enlarge /proc/sys/net/core/rmem_max and try again\n",
++                                             *(int*)buf, msgno);
+ 					continue;
+ 				}
+ 				rc = recvfrom(sd[i], buf, expected_szs[numSubTest], 
+@@ -687,8 +688,21 @@ void server_test_multicast(void)
+ 	FD_ZERO(&readfds);
+ 
+ 	for (i = 0; i < TIPC_MCAST_SOCKETS; i++) {
++		int optval = (int)(~0U >> 1);
++		socklen_t optlen = sizeof(optval);
++		int rc = 0;
++
+ 		sd[i] = createSocketTIPC (SOCK_RDM);
+ 		FD_SET(sd[i], &readfds);
++
++		/*
++                 * Flooding multicast may make the rcv buffer overrun and considered premature msg later.
++                 * Set SO_RCVBUF to max int value to receive as many packets as possible.
++                 * Note that it will be limited up to min(INT_MAX/2, sysctl_rmem_max) in kernel.
++                 */
++		rc = setsockopt(sd[i], SOL_SOCKET, SO_RCVBUF, (const char*)&optval, optlen);
++		if(rc != 0)
++			printf("Failed to set SO_RCVBUF of %d: %s\n", sd[i], strerror(errno));
+ 	}
+ 
+ 	server_bindMulticast(  0,  99, sd[0]);
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
index 054e0acc8..637770af2 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://git.code.sf.net/p/tipc/tipcutils \
            file://0001-include-sys-select.h-for-FD_-definitions.patch \
            file://0002-replace-non-standard-uint-with-unsigned-int.patch \
            file://0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch \
+           file://0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch \
            "
 SRCREV = "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
 PV = "2.2.0+git${SRCPV}"
-- 
2.11.0


