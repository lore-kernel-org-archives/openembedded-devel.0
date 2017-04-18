Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E114E71C42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:12 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a188so133734pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DKybWfPXQYOvzKmOiWwMGUelKIsxKTlRvANt+5PFIrU=;
	b=sH4mgLU88UUnnLB55qP0b+gg1v6WHfkd2JnRdUVzev/Sw3jDQrLkwkd8Gyryqizv2G
	xstYdOuGDmEFRtXE0xzHvVkYgdF4lBXghO6nb2e1GSyTqPYSfqI6pM8mA+gsG1hktxDJ
	coZioifQ3h9ZDPquoQiZ4EOccV3fVubPdjn07M8iZP6def96P/Cb0GvaY2gBoBf0ZA7G
	FZ951xGHzXwOe+tXKo8MNeAnVQ97YQ29b6TnuFn5KjFnYGrqme6T6/0BBs26AoLbQUpz
	XcPWyhNVkM5KgOj0Czgy0m+CHQs3vl6i6dFIg4qBIEEg5C35zSKOs1dBR6dX2BDkMxFp
	mTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DKybWfPXQYOvzKmOiWwMGUelKIsxKTlRvANt+5PFIrU=;
	b=ZToKu2VX7EX8T8rINJxTOQLyk6O3KRsRUiExueQo5SQ1FtnVFLORgq61liDzC6T2rR
	+MdiICYoOFyI4ff733G+XkvowheygTBKXSgozP2Se4KSbMb0wJpSPf027a2xrwniHqC/
	PMjp/dZVIppwOaBK5ohkV2wrV2/kXctYLAZUF3inFTy5y6b/SXkx8JDX71fyCoKp+yDB
	9fTzNs8PO8UiBGHi19Hm71MItab+JGrg6GhtIMmb0f0mCgVythmCqc0sgm6ob0RWTjn7
	sl+dZaTJjZuIoHKQL3eVPnH06l6uB6KO7AxlFONjLQgIAsVVNcJ+r9dxJK9pNhHNV/3k
	lEXA==
X-Gm-Message-State: AN3rC/4Bxmz+uik8j10aY+xdfNVyjI2f7/rB0n35oB9XFhpXTLZ6lqO9
	CmCxOAG11a4t8Q==
X-Received: by 10.98.11.205 with SMTP id 74mr7235891pfl.214.1492539733881;
	Tue, 18 Apr 2017 11:22:13 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:24 -0700
Message-Id: <20170418182142.27253-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-oe][ 14/32] tipcutils: Fix build with musl
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:13 -0000

Upgrade to latest git and change SRC_URI to point to git

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-include-sys-select.h-for-FD_-definitions.patch |  25 +++
 ...place-non-standard-uint-with-unsigned-int.patch | 211 +++++++++++++++++++++
 .../{tipcutils_2.2.0.bb => tipcutils_git.bb}       |   8 +-
 3 files changed, 242 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils/0001-include-sys-select.h-for-FD_-definitions.patch
 create mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils/0002-replace-non-standard-uint-with-unsigned-int.patch
 rename meta-oe/recipes-extended/tipcutils/{tipcutils_2.2.0.bb => tipcutils_git.bb} (82%)

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/0001-include-sys-select.h-for-FD_-definitions.patch b/meta-oe/recipes-extended/tipcutils/tipcutils/0001-include-sys-select.h-for-FD_-definitions.patch
new file mode 100644
index 000000000..6c8ba9074
--- /dev/null
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/0001-include-sys-select.h-for-FD_-definitions.patch
@@ -0,0 +1,25 @@
+From e291d720a7d9576063717969dde82c33bac7eecf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Apr 2017 14:19:21 -0700
+Subject: [PATCH 1/2] include sys/select.h for FD_* definitions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ demos/inventory_sim/inventory_sim.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/demos/inventory_sim/inventory_sim.c b/demos/inventory_sim/inventory_sim.c
+index fadf27b..22c33d1 100644
+--- a/demos/inventory_sim/inventory_sim.c
++++ b/demos/inventory_sim/inventory_sim.c
+@@ -132,6 +132,7 @@ Examples
+ #include <string.h>
+ #include <unistd.h>
+ #include <sys/socket.h>
++#include <sys/select.h>
+ #include <netinet/in.h>
+ #include <linux/tipc.h>
+ 
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/0002-replace-non-standard-uint-with-unsigned-int.patch b/meta-oe/recipes-extended/tipcutils/tipcutils/0002-replace-non-standard-uint-with-unsigned-int.patch
new file mode 100644
index 000000000..03e711e9a
--- /dev/null
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/0002-replace-non-standard-uint-with-unsigned-int.patch
@@ -0,0 +1,211 @@
+From 3d091efa09478d0330be686184ae4793764504e7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Apr 2017 14:22:23 -0700
+Subject: [PATCH 2/2] replace non-standard uint with unsigned int
+
+make it portable on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ demos/benchmark/client_tipc.c       | 34 +++++++++++++++++-----------------
+ demos/benchmark/common_tipc.h       |  2 +-
+ demos/benchmark/server_tipc.c       | 10 +++++-----
+ demos/inventory_sim/inventory_sim.c | 12 ++++++------
+ 4 files changed, 29 insertions(+), 29 deletions(-)
+
+diff --git a/demos/benchmark/client_tipc.c b/demos/benchmark/client_tipc.c
+index 5d889ee..d913e42 100644
+--- a/demos/benchmark/client_tipc.c
++++ b/demos/benchmark/client_tipc.c
+@@ -65,7 +65,7 @@ static const struct sockaddr_tipc master_clnt_addr = {
+ 
+ static int master_clnt_sd;
+ static int master_srv_sd;
+-static uint client_id;
++static unsigned int client_id;
+ static unsigned char *buf = NULL;
+ static int non_blk = 0;
+ static int select_ip(struct srv_info *sinfo, char *name);
+@@ -79,7 +79,7 @@ struct master_client_cmd {
+ 	__u32 bounce;
+ };
+ 
+-static void master_to_client(uint cmd, uint msglen, uint msgcnt, uint bounce)
++static void master_to_client(unsigned int cmd, unsigned int msglen, unsigned int msgcnt, unsigned int bounce)
+ {
+ 	struct master_client_cmd c;
+ 
+@@ -93,7 +93,7 @@ static void master_to_client(uint cmd, uint msglen, uint msgcnt, uint bounce)
+ 		die("Unable to send cmd %u to clients\n", cmd);
+ }
+ 
+-static void client_from_master(uint *cmd, uint *msglen, uint *msgcnt, uint *bounce)
++static void client_from_master(unsigned int *cmd, unsigned int *msglen, unsigned int *msgcnt, unsigned int *bounce)
+ {
+ 	struct master_client_cmd c;
+ 
+@@ -114,7 +114,7 @@ struct client_master_cmd {
+ 	__u32 cmd;
+ };
+ 
+-static void client_to_master(uint cmd)
++static void client_to_master(unsigned int cmd)
+ {
+ 	struct client_master_cmd c;
+ 
+@@ -125,7 +125,7 @@ static void client_to_master(uint cmd)
+ 		die("Client: Unable to send msg to master\n");
+ }
+ 
+-static void master_from_client(uint *cmd)
++static void master_from_client(unsigned int *cmd)
+ {
+ 	struct client_master_cmd c;
+ 
+@@ -137,7 +137,7 @@ static void master_from_client(uint *cmd)
+ 	*cmd = ntohl(c.cmd);
+ }
+ 
+-static void master_to_srv(uint cmd, uint msglen, uint msgcnt, uint echo)
++static void master_to_srv(unsigned int cmd, unsigned int msglen, unsigned int msgcnt, unsigned int echo)
+ {
+ 	struct master_srv_cmd c;
+ 
+@@ -151,7 +151,7 @@ static void master_to_srv(uint cmd, uint msglen, uint msgcnt, uint echo)
+ 		die("Unable to send cmd %u to servers\n", cmd);
+ }
+ 
+-static void master_from_srv(uint *cmd, struct srv_info *sinfo, __u32 *tipc_addr)
++static void master_from_srv(unsigned int *cmd, struct srv_info *sinfo, __u32 *tipc_addr)
+ {
+ 	struct srv_to_master_cmd c;
+ 
+@@ -290,7 +290,7 @@ static void client_main(unsigned int clnt_id, ushort tcp_port, int tcp_addr)
+ {
+ 	int peer_sd, efd = 0;
+ 	int imp = clnt_id % 4;
+-	uint cmd, msglen, msgcnt, echo;
++	unsigned int cmd, msglen, msgcnt, echo;
+ 	struct epoll_event event, revents;
+ 	struct sockaddr_in tcp_dest;
+ 	int rc;
+@@ -400,22 +400,22 @@ static void client_main(unsigned int clnt_id, ushort tcp_port, int tcp_addr)
+ int main(int argc, char *argv[], char *dummy[])
+ {
+ 	int c;
+-	uint cmd;
+-	uint latency_transf = DEFAULT_LAT_MSGS;
+-	uint thruput_transf = DEFAULT_THRU_MSGS;
+-	uint req_clients = DEFAULT_CLIENTS;
+-	uint first_msglen = DEFAULT_MSGLEN;
+-	uint last_msglen = TIPC_MAX_USER_MSG_SIZE;
++	unsigned int cmd;
++	unsigned int latency_transf = DEFAULT_LAT_MSGS;
++	unsigned int thruput_transf = DEFAULT_THRU_MSGS;
++	unsigned int req_clients = DEFAULT_CLIENTS;
++	unsigned int first_msglen = DEFAULT_MSGLEN;
++	unsigned int last_msglen = TIPC_MAX_USER_MSG_SIZE;
+ 	unsigned long long msglen;
+ 	unsigned long long num_clients;
+ 	struct timeval start_time;
+ 	unsigned long long elapsed;
+ 	unsigned long long msgcnt;
+ 	unsigned long long iter;
+-	uint clnt_id;
+-	uint conn_typ = TIPC_CONN;
++	unsigned int clnt_id;
++	unsigned int conn_typ = TIPC_CONN;
+ 	ushort tcp_port = 0;
+-	uint tcp_addr = 0;
++	unsigned int tcp_addr = 0;
+ 	struct srv_info sinfo;
+ 	__u32 peer_tipc_addr;
+ 	char ifname[16] = {0,};
+diff --git a/demos/benchmark/common_tipc.h b/demos/benchmark/common_tipc.h
+index 1765ba1..47947e0 100644
+--- a/demos/benchmark/common_tipc.h
++++ b/demos/benchmark/common_tipc.h
+@@ -256,7 +256,7 @@ static void get_ip_list(struct srv_info *sinfo, char *ifname)
+ 	}
+ }
+ 
+-static uint own_node(void)
++static unsigned int own_node(void)
+ {
+ 	struct sockaddr_tipc addr;
+ 	socklen_t sz = sizeof(addr);
+diff --git a/demos/benchmark/server_tipc.c b/demos/benchmark/server_tipc.c
+index 9d0e2be..3cd82b7 100644
+--- a/demos/benchmark/server_tipc.c
++++ b/demos/benchmark/server_tipc.c
+@@ -45,7 +45,7 @@ static int wait_for_connection(int listener_sd);
+ static void echo_messages(int peer_sd, int master_sd, int srv_id);
+ static __u32 own_node_addr;
+ 
+-static void srv_to_master(uint cmd, struct srv_info *sinfo)
++static void srv_to_master(unsigned int cmd, struct srv_info *sinfo)
+ {
+ 	struct srv_to_master_cmd c;
+ 
+@@ -62,7 +62,7 @@ static void srv_to_master(uint cmd, struct srv_info *sinfo)
+ 		die("Server: unable to send info to master\n");
+ }
+ 
+-static void srv_from_master(uint *cmd, uint* msglen, uint *msgcnt, uint *echo)
++static void srv_from_master(unsigned int *cmd, unsigned int* msglen, unsigned int *msgcnt, unsigned int *echo)
+ {
+ 	struct master_srv_cmd c;
+ 
+@@ -84,8 +84,8 @@ int main(int argc, char *argv[], char *dummy[])
+ {
+ 	ushort tcp_port = 4711;
+ 	struct srv_info sinfo;
+-	uint cmd;
+-	uint max_msglen;
++	unsigned int cmd;
++	unsigned int max_msglen;
+ 	struct sockaddr_in srv_addr;
+ 	int lstn_sd, peer_sd;
+ 	int srv_id = 0, srv_cnt = 0;;
+@@ -221,7 +221,7 @@ static int wait_for_connection(int lstn_sd)
+ 
+ static void echo_messages(int peer_sd, int master_sd, int srv_id)
+ {
+-	uint cmd, msglen, msgcnt, echo, rcvd = 0;
++	unsigned int cmd, msglen, msgcnt, echo, rcvd = 0;
+ 
+ 	do {
+ 		/* Get msg length and number to expect, and ack: */
+diff --git a/demos/inventory_sim/inventory_sim.c b/demos/inventory_sim/inventory_sim.c
+index 22c33d1..9bf5443 100644
+--- a/demos/inventory_sim/inventory_sim.c
++++ b/demos/inventory_sim/inventory_sim.c
+@@ -940,9 +940,9 @@ int simItem(int itemID, int lagTime, int speed)
+ 	char outMsg[MSG_SIZE_MAX];
+ 	char *marker;
+ 	int msgSize;
+-	uint zone;
+-	uint cluster;
+-	uint node;
++	unsigned int zone;
++	unsigned int cluster;
++	unsigned int node;
+ 	char itemName[NAME_SIZE];
+ 	int haveItem;
+ 	int res;
+@@ -1134,9 +1134,9 @@ int simCust(int itemID, int lagTime, int waitTime, int speed, int taskID)
+ 	char msg[MSG_SIZE_MAX];
+ 	char *marker;
+ 	int msgSize;
+-	uint zone;
+-	uint cluster;
+-	uint node;
++	unsigned int zone;
++	unsigned int cluster;
++	unsigned int node;
+ 	char custName[NAME_SIZE];
+ 	int transactionID;
+ 	int needItem;
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_2.2.0.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
similarity index 82%
rename from meta-oe/recipes-extended/tipcutils/tipcutils_2.2.0.bb
rename to meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
index 5c5b289d6..b7157b432 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_2.2.0.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
@@ -2,8 +2,12 @@ SUMMARY = "Transparent Inter-Process Communication protocol"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://tipclog/tipc.h;endline=35;md5=985b6ea8735818511d276c1b466cce98"
 
-SRC_URI = "git://tipc.git.sourceforge.net/gitroot/tipc/tipcutils"
-SRCREV = "dc8c2d324cda2e80a6e07ee1998fca0839d4a721"
+SRC_URI = "git://git.code.sf.net/p/tipc/tipcutils \
+           file://0001-include-sys-select.h-for-FD_-definitions.patch \
+           file://0002-replace-non-standard-uint-with-unsigned-int.patch \
+           "
+SRCREV = "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
+PV = "2.2.0+git${SRCPV}"
 
 DEPENDS="virtual/kernel"
 
-- 
2.12.2


