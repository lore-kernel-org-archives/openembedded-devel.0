Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37950.1795594115809924805
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=V9YyYlHp;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-385d8a00598so8057921eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594115; x=1796198915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xKWh26WiYNaCXp6CmiH1pwtq4Dt6sZ7q6s/OSrRzBGs=;
        b=V9YyYlHp+bSQ6FgjI2eEdVcZAnSbJzG/bNst6njKNvJjYFsWAih+6qc5D5u3FhEWkK
         lV3GyktOm7qlOhpN5FWH22vgWTtRbwiuBEY/oIZekBSjLMPctpbRP1i8Q7J3zY6dcxDG
         38ur3Bsvez92xAITOkdnCg7QOS7LFkdHYv4cX2FJaPazoDMuNtJSQ70NGoz2SLMQcjgx
         T6CpGjZsNlPKfjL40eiPHVK0uXocZWiVq5rq8SbQq+tYb2sGntJN47P7ThGb8BOzQMn5
         A8QRtVj7OfylVgtJDP7z7N/+XvxHeTQES4KvePJxb73g5/Xcut6M45Gah1zB3nyxwzDg
         Sw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594115; x=1796198915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xKWh26WiYNaCXp6CmiH1pwtq4Dt6sZ7q6s/OSrRzBGs=;
        b=QZOOjLFB+0kRsCWK0p05HhgQhJXeUMPWUcuERWWzU+RrBMCI1waQd1z1fJINC1M92F
         lKc1PUXzBL2BrJBLOymex4oAS7fmRzWpiqMqg+yTuTyDhi4ZUQzcZO8IQXQb+vleQW+4
         r3DcujaQICxHE68s19Zv8fI1rSpv9L/G22HfC4+Vt1l5wnEIvNc5pCOW6N+v0JGS1NYq
         d7GkPL/YsSwd9UOQ2YE9c6DfoTzu/CMS+SYnfucFp4g4BrAfCIR07bmoVbC1IcLHpqoi
         bG1hN1TmrI3WFO1+NAWDMRPVt0EOKX795houerayTz/zEVIx8mi3Rpp8lCt4yRfycp5Z
         uRBw==
X-Gm-Message-State: APuU4Z9XrkPpgLHM2XSMVbisiDijReqpYGGxzKPLYvYs6R7f4EGDqcKY
	RHDMT5iUxby/o9hbW6Sr4zyUVhLV0gCMcafL7ogkUZUWUirTkmjLnpi2ErR3l0wF
X-Gm-Gg: AZFdTZdJlfEiYnN0Jcd9wIygFQxwVyLauEFMd1YSVqSlnsG0vmOUb8r/PgzGY6fpyby
	WXplFXAilR8lwgzxsUSrrwJ4LO+x22VvlgnKKOv/FE2C88mtfuzw3Qr7BpINjUOj00OVCF+GrPv
	7P562yOd5Gu5ij86NEWC2EIwTqGRswcYsHsao6sbnbL8dyQh+bbk4Ik7sDBfrnEL0WscfywOAp5
	5y0GyLU2iPoT2sHkvtlvlYD+6Qv+nFUJbhvBRnSf1qj5wiSpAuFHg8mS3xK2honyWuREUBF8+kb
	3BWUa6y0r0c/dBaUqJoE4A+H9VRWz+IoeQPYABez4nD+8SOYbu0uNse6RnC+kdXcRLS8uDdvSAm
	uBRhGEt5jD9YorAlVAC94GXSXQBr92iFA/o3KxXtPHfyjSGIMaShNEeoOgPwqWilVOxBoDzBzna
	FvPEIecv5GIkYHdc2z4Jxw+vkk23TljS2k7vvNSBlxWCinjgAmrxnrkH0RtJT6rlp8Wy3BpASud
	RZAzfsnlA+9VVtLSLjnMQxDXZHfNgmwn7eYawvg1uA6A4djw4j9TxXEQl0nKxDzdPjEEvukbX3k
	Uhcf0pLwIyauwSdwUDHjk5k0/Eh1AgeMdnkP6CzIgwJIKAhvG02VXIxQCloyicHR2HWHkZOtyCb
	Qs/bY+I3utXmsJAyxHAPeLhjXwtLrFdGCLgWKLACcBQxzdbyrwb1kyznHgnHiAaRa6fhe7gQbQF
	aO+nPZFcQvRTM/1KSc7j8wFFkLhvjD7utT/CAgHo4qPqHuTv4qbBK0t4VX1+so083CrQKBSYEPW
	Dtg2zuSHqzASNXWRFi0O826HgcKOwpUB66atoxprhz6CM9FCM/QUbhmc/Uls3J9jE5BNSUvjrrq
	7Jhd
X-Received: by 2002:a05:693c:83cf:10b0:386:b526:24d1 with SMTP id 5a478bee46e88-386b52638e1mr8189745eec.9.1795594114983;
        Wed, 25 Nov 2026 00:08:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 42/55] tipcutils: upgrade 2.2.0+git -> 3.0.7
Date: Wed, 25 Nov 2026 00:06:58 -0800
Message-ID: <20261125080732.2419614-48-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133045
Content-Type: text/plain; charset="utf-8"

Upstream changes (git log, README):
- New libtipc library with C, Go, Java and Python APIs, a character
  API (3.0.7) and demos for it (tipcc_hello_world, c_api_demo,
  groupcast_demo, tipc-pipe).
- Tree reorganised into demos/, test/ and utils/; demo binaries were
  renamed (e.g. hello_client/hello_server instead of
  client_tipc/server_tipc).
- New tools: tipc-link-watcher, net topology tracker and the tipc-trace
  front-end; utils now need libmnl.
- Reproducible build date from SOURCE_DATE_EPOCH; a top-level
  BSD-3-Clause LICENSE file was added.

3.0.7 is not tagged upstream (the last tag is v3.0.4); the README of
master names this commit 3.0.7 (configure.ac still says 2.1.1), so name
the recipe 3.0.7 and pin SRCREV to master HEAD. Check upstream
for new commits (UPSTREAM_CHECK_COMMITS), as releases are not tagged.

Add libmnl to DEPENDS. Rewrite the demo and ptts install for the new
layout and binary names. tipc-trace is a Python script installed to
bindir; package it in ${PN}-trace with its python3 runtime deps and
point its shebang at python3. Drop
0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch
(libtipc uses struct tipc_group_req) and
0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-as.patch
(upstream commit 4e4c8c7). Refresh
0002-replace-non-standard-uint-with-unsigned-int.patch for the renamed
benchmark sources and the new net topology tracker.

configure.ac adds -I paths relative to the source subdirectories, so
build in the source tree (autotools-brokensep). Add a patch that builds
tipc_test_suite only when linux/tipc.h provides struct tipcc_addr, which
mainline kernel headers lack.

License-Update: the old LIC_FILES_CHKSUM file, tipclog/tipc.h, is gone.
Use the new top-level LICENSE, which is BSD-3-Clause; the GPL-2.0
alternative of the old header is not offered anywhere in the tree, so
LICENSE changes from GPL-2.0-only to BSD-3-Clause.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...tipcc-Fix-struct-type-for-TIPC_GROUP.patch |  33 ------
 ...cv-buffer-size-too-max-to-receive-as.patch |  66 -----------
 ...-non-standard-uint-with-unsigned-int.patch | 107 +++++++++++-------
 ...test_suite-only-when-struct-tipcc_ad.patch |  50 ++++++++
 .../tipcutils/tipcutils_3.0.7.bb              |  67 +++++++++++
 .../tipcutils/tipcutils_git.bb                |  57 ----------
 6 files changed, 180 insertions(+), 200 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils/0001-multi=
cast_blast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch
 delete mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils/0001-test-=
ptts-Set-recv-buffer-size-too-max-to-receive-as.patch
 create mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils/0003-test-=
Build-tipc_test_suite-only-when-struct-tipcc_ad.patch
 create mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils_3.0.7.bb
 delete mode 100644 meta-oe/recipes-extended/tipcutils/tipcutils_git.bb

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/0001-multicast_bl=
ast-tipcc-Fix-struct-type-for-TIPC_GROUP.patch b/meta-oe/recipes-extended/t=
ipcutils/tipcutils/0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROU=
P.patch
deleted file mode 100644
index e495285051..0000000000
--- a/meta-oe/recipes-extended/tipcutils/tipcutils/0001-multicast_blast-tip=
cc-Fix-struct-type-for-TIPC_GROUP.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 1ce892749e4f53bd0aeaa4c3ce45f80178799411 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 3 Mar 2018 17:52:51 -0800
-Subject: [PATCH] multicast_blast/tipcc: Fix struct type for TIPC_GROUP_JOIN
-
-Kernel defines it as tipc_group_req and not tipc_mreq
-this code was not excercised with older kernels so we
-never ran into the compiler failures since TIPC_GROUP_JOIN
-is only defined in kernel starting 4.15
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- multicast_blast/tipcc.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/multicast_blast/tipcc.c b/multicast_blast/tipcc.c
-index 90644d3..911c759 100755
---- a/multicast_blast/tipcc.c
-+++ b/multicast_blast/tipcc.c
-@@ -213,7 +213,7 @@ int tipc_accept(int sd, struct tipc_addr *src)
- int tipc_join(int sd, struct tipc_addr *member)
- {
- #ifdef TIPC_GROUP_JOIN
--	struct tipc_mreq mreq =3D {
-+	struct tipc_group_req mreq =3D {
- 		.type =3D member->type,
- 		.instance =3D member->instance,
- 		.scope =3D domain2scope(member->domain)
---=20
-2.16.2
-
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/0001-test-ptts-Se=
t-recv-buffer-size-too-max-to-receive-as.patch b/meta-oe/recipes-extended/t=
ipcutils/tipcutils/0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-a=
s.patch
deleted file mode 100644
index cc0ef42967..0000000000
--- a/meta-oe/recipes-extended/tipcutils/tipcutils/0001-test-ptts-Set-recv-=
buffer-size-too-max-to-receive-as.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 4e4c8c7a1cca2125e2bf2a67cbab0bdbd78fdb86 Mon Sep 17 00:00:00 2001
-From: He Zhe <zhe.he@windriver.com>
-Date: Tue, 30 Jul 2019 13:24:22 +0800
-Subject: [PATCH] ptts: Set recv buffer size too max to receive as many
- packets as possible
-
-Flooding multicast may make the rcv buffer overrun and is considered
-premature messages later and thus cause the following error.
-
-"Ignoring premature msg 16, currently handling 12"
-
-This patch sets SO_RCVBUF the of socket to max int value to receive as many
-packets as possible, and give a hint to user when possible overrun occurs.=
 Note
-that the value of SO_RCVBUF will be limited up to min(INT_MAX/2,
-sysctl_rmem_max) in kernel.
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
-
-Upstream-Status: Backport [https://sourceforge.net/p/tipc/tipcutils/ci/4e4=
c8c7a1cca2125e2bf2a67cbab0bdbd78fdb86/]
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- ptts/tipc_ts_server.c | 18 ++++++++++++++++--
- 1 file changed, 16 insertions(+), 2 deletions(-)
-
-diff --git a/ptts/tipc_ts_server.c b/ptts/tipc_ts_server.c
-index a286daa..3a2f96f 100644
---- a/ptts/tipc_ts_server.c
-+++ b/ptts/tipc_ts_server.c
-@@ -641,8 +641,9 @@ void server_mcast
- 				if (rc < 0)
- 					err("multicast message not received");
- 				if (msgno !=3D *(int*) buf) {
--					dbg1("Ignoring premature msg %u, currently handling %u\n",
--					       *(int*)buf, msgno);
-+					dbg1("Ignoring premature msg %u, currently handling %u\n"
-+                                             "You can enlarge /proc/sys/n=
et/core/rmem_max and try again\n",
-+                                             *(int*)buf, msgno);
- 					continue;
- 				}
- 				rc =3D recvfrom(sd[i], buf, expected_szs[numSubTest],=20
-@@ -687,8 +688,21 @@ void server_test_multicast(void)
- 	FD_ZERO(&readfds);
-=20
- 	for (i =3D 0; i < TIPC_MCAST_SOCKETS; i++) {
-+		int optval =3D (int)(~0U >> 1);
-+		socklen_t optlen =3D sizeof(optval);
-+		int rc =3D 0;
-+
- 		sd[i] =3D createSocketTIPC (SOCK_RDM);
- 		FD_SET(sd[i], &readfds);
-+
-+		/*
-+                 * Flooding multicast may make the rcv buffer overrun and=
 considered premature msg later.
-+                 * Set SO_RCVBUF to max int value to receive as many pack=
ets as possible.
-+                 * Note that it will be limited up to min(INT_MAX/2, sysc=
tl_rmem_max) in kernel.
-+                 */
-+		rc =3D setsockopt(sd[i], SOL_SOCKET, SO_RCVBUF, (const char*)&optval, o=
ptlen);
-+		if(rc !=3D 0)
-+			printf("Failed to set SO_RCVBUF of %d: %s\n", sd[i], strerror(errno));
- 	}
-=20
- 	server_bindMulticast(  0,  99, sd[0]);
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/0002-replace-non-=
standard-uint-with-unsigned-int.patch b/meta-oe/recipes-extended/tipcutils/=
tipcutils/0002-replace-non-standard-uint-with-unsigned-int.patch
index 89eae015c6..515292d5d9 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils/0002-replace-non-standar=
d-uint-with-unsigned-int.patch
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/0002-replace-non-standar=
d-uint-with-unsigned-int.patch
@@ -9,17 +9,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
 Upstream-Status: Pending
=20
- demos/benchmark/client_tipc.c       | 34 +++++++++++++++++---------------=
--
- demos/benchmark/common_tipc.h       |  2 +-
- demos/benchmark/server_tipc.c       | 10 +++++-----
- demos/inventory_sim/inventory_sim.c | 12 ++++++------
- 4 files changed, 29 insertions(+), 29 deletions(-)
+ demos/benchmark/benchmark_client.c             | 36 +++++++++++++--------=
-----
+ demos/benchmark/benchmark_server.c             | 12 ++++-----
+ demos/benchmark/common_tipc.h                  |  4 +--
+ demos/inventory_sim/inventory_sim.c            | 12 ++++-----
+ utils/net_topology_tracker/tipc_net_topology.c |  2 +-
+ 5 files changed, 33 insertions(+), 33 deletions(-)
=20
-diff --git a/demos/benchmark/client_tipc.c b/demos/benchmark/client_tipc.c
-index 5d889ee..d913e42 100644
---- a/demos/benchmark/client_tipc.c
-+++ b/demos/benchmark/client_tipc.c
-@@ -65,7 +65,7 @@ static const struct sockaddr_tipc master_clnt_addr =3D {
+diff --git a/demos/benchmark/benchmark_client.c b/demos/benchmark/benchmar=
k_client.c
+--- a/demos/benchmark/benchmark_client.c
++++ b/demos/benchmark/benchmark_client.c
+@@ -48,7 +48,7 @@
=20=20
  static int master_clnt_sd;
  static int master_srv_sd;
@@ -28,7 +28,7 @@ index 5d889ee..d913e42 100644
  static unsigned char *buf =3D NULL;
  static int non_blk =3D 0;
  static int select_ip(struct srv_info *sinfo, char *name);
-@@ -79,7 +79,7 @@ struct master_client_cmd {
+@@ -62,7 +62,7 @@ struct master_client_cmd {
  	__u32 bounce;
  };
=20=20
@@ -37,7 +37,7 @@ index 5d889ee..d913e42 100644
  {
  	struct master_client_cmd c;
=20=20
-@@ -93,7 +93,7 @@ static void master_to_client(uint cmd, uint msglen, uint=
 msgcnt, uint bounce)
+@@ -76,7 +76,7 @@ static void master_to_client(uint cmd, uint msglen, uint=
 msgcnt, uint bounce)
  		die("Unable to send cmd %u to clients\n", cmd);
  }
=20=20
@@ -46,7 +46,7 @@ index 5d889ee..d913e42 100644
  {
  	struct master_client_cmd c;
=20=20
-@@ -114,7 +114,7 @@ struct client_master_cmd {
+@@ -97,7 +97,7 @@ struct client_master_cmd {
  	__u32 cmd;
  };
=20=20
@@ -55,7 +55,7 @@ index 5d889ee..d913e42 100644
  {
  	struct client_master_cmd c;
=20=20
-@@ -125,7 +125,7 @@ static void client_to_master(uint cmd)
+@@ -108,7 +108,7 @@ static void client_to_master(uint cmd)
  		die("Client: Unable to send msg to master\n");
  }
=20=20
@@ -64,7 +64,7 @@ index 5d889ee..d913e42 100644
  {
  	struct client_master_cmd c;
=20=20
-@@ -137,7 +137,7 @@ static void master_from_client(uint *cmd)
+@@ -120,7 +120,7 @@ static void master_from_client(uint *cmd)
  	*cmd =3D ntohl(c.cmd);
  }
=20=20
@@ -73,7 +73,7 @@ index 5d889ee..d913e42 100644
  {
  	struct master_srv_cmd c;
=20=20
-@@ -151,7 +151,7 @@ static void master_to_srv(uint cmd, uint msglen, uint =
msgcnt, uint echo)
+@@ -134,7 +134,7 @@ static void master_to_srv(uint cmd, uint msglen, uint =
msgcnt, uint echo)
  		die("Unable to send cmd %u to servers\n", cmd);
  }
=20=20
@@ -82,7 +82,7 @@ index 5d889ee..d913e42 100644
  {
  	struct srv_to_master_cmd c;
=20=20
-@@ -290,7 +290,7 @@ static void client_main(unsigned int clnt_id, ushort t=
cp_port, int tcp_addr)
+@@ -276,7 +276,7 @@ static void client_main(unsigned int clnt_id, ushort t=
cp_port, int tcp_addr)
  {
  	int peer_sd, efd =3D 0;
  	int imp =3D clnt_id % 4;
@@ -91,8 +91,8 @@ index 5d889ee..d913e42 100644
  	struct epoll_event event, revents;
  	struct sockaddr_in tcp_dest;
  	int rc;
-@@ -400,22 +400,22 @@ static void client_main(unsigned int clnt_id, ushort=
 tcp_port, int tcp_addr)
- int main(int argc, char *argv[], char *dummy[])
+@@ -386,23 +386,23 @@ static void client_main(unsigned int clnt_id, ushort=
 tcp_port, int tcp_addr)
+ int main(int argc, char *argv[])
  {
  	int c;
 -	uint cmd;
@@ -101,12 +101,14 @@ index 5d889ee..d913e42 100644
 -	uint req_clients =3D DEFAULT_CLIENTS;
 -	uint first_msglen =3D DEFAULT_MSGLEN;
 -	uint last_msglen =3D TIPC_MAX_USER_MSG_SIZE;
+-	uint instance =3D 0;
 +	unsigned int cmd;
 +	unsigned int latency_transf =3D DEFAULT_LAT_MSGS;
 +	unsigned int thruput_transf =3D DEFAULT_THRU_MSGS;
 +	unsigned int req_clients =3D DEFAULT_CLIENTS;
 +	unsigned int first_msglen =3D DEFAULT_MSGLEN;
 +	unsigned int last_msglen =3D TIPC_MAX_USER_MSG_SIZE;
++	unsigned int instance =3D 0;
  	unsigned long long msglen;
  	unsigned long long num_clients;
  	struct timeval start_time;
@@ -123,23 +125,9 @@ index 5d889ee..d913e42 100644
  	struct srv_info sinfo;
  	__u32 peer_tipc_addr;
  	char ifname[16] =3D {0,};
-diff --git a/demos/benchmark/common_tipc.h b/demos/benchmark/common_tipc.h
-index 1765ba1..47947e0 100644
---- a/demos/benchmark/common_tipc.h
-+++ b/demos/benchmark/common_tipc.h
-@@ -256,7 +256,7 @@ static void get_ip_list(struct srv_info *sinfo, char *=
ifname)
- 	}
- }
-=20
--static uint own_node(void)
-+static unsigned int own_node(void)
- {
- 	struct sockaddr_tipc addr;
- 	socklen_t sz =3D sizeof(addr);
-diff --git a/demos/benchmark/server_tipc.c b/demos/benchmark/server_tipc.c
-index 9d0e2be..3cd82b7 100644
---- a/demos/benchmark/server_tipc.c
-+++ b/demos/benchmark/server_tipc.c
+diff --git a/demos/benchmark/benchmark_server.c b/demos/benchmark/benchmar=
k_server.c
+--- a/demos/benchmark/benchmark_server.c
++++ b/demos/benchmark/benchmark_server.c
 @@ -45,7 +45,7 @@ static int wait_for_connection(int listener_sd);
  static void echo_messages(int peer_sd, int master_sd, int srv_id);
  static __u32 own_node_addr;
@@ -158,18 +146,20 @@ index 9d0e2be..3cd82b7 100644
  {
  	struct master_srv_cmd c;
=20=20
-@@ -84,8 +84,8 @@ int main(int argc, char *argv[], char *dummy[])
+@@ -84,9 +84,9 @@ int main(int argc, char *argv[])
  {
  	ushort tcp_port =3D 4711;
  	struct srv_info sinfo;
 -	uint cmd;
 -	uint max_msglen;
+-	uint instance =3D 0;
 +	unsigned int cmd;
 +	unsigned int max_msglen;
++	unsigned int instance =3D 0;
  	struct sockaddr_in srv_addr;
  	int lstn_sd, peer_sd;
  	int srv_id =3D 0, srv_cnt =3D 0;;
-@@ -221,7 +221,7 @@ static int wait_for_connection(int lstn_sd)
+@@ -228,7 +228,7 @@ static int wait_for_connection(int lstn_sd)
=20=20
  static void echo_messages(int peer_sd, int master_sd, int srv_id)
  {
@@ -178,11 +168,31 @@ index 9d0e2be..3cd82b7 100644
=20=20
  	do {
  		/* Get msg length and number to expect, and ack: */
+diff --git a/demos/benchmark/common_tipc.h b/demos/benchmark/common_tipc.h
+--- a/demos/benchmark/common_tipc.h
++++ b/demos/benchmark/common_tipc.h
+@@ -136,7 +136,7 @@ static struct sockaddr_tipc master_clnt_addr =3D {
+ 	.addr.name.domain        =3D 0
+ };
+=20
+-static void init_addresses(uint instance)
++static void init_addresses(unsigned int instance)
+ {
+ 	clnt_ctrl_addr.addr.name.name.type =3D CLNT_CTRL_NAME(instance);
+ 	master_clnt_addr.addr.name.name.type =3D MASTER_NAME(instance);
+@@ -289,7 +289,7 @@ static void get_ip_list(struct srv_info *sinfo, char *=
ifname)
+ 	}
+ }
+=20
+-static uint own_node(void)
++static unsigned int own_node(void)
+ {
+ 	struct sockaddr_tipc addr;
+ 	socklen_t sz =3D sizeof(addr);
 diff --git a/demos/inventory_sim/inventory_sim.c b/demos/inventory_sim/inv=
entory_sim.c
-index 22c33d1..9bf5443 100644
 --- a/demos/inventory_sim/inventory_sim.c
 +++ b/demos/inventory_sim/inventory_sim.c
-@@ -940,9 +940,9 @@ int simItem(int itemID, int lagTime, int speed)
+@@ -946,9 +946,9 @@ int simItem(int itemID, int lagTime, int speed)
  	char outMsg[MSG_SIZE_MAX];
  	char *marker;
  	int msgSize;
@@ -195,7 +205,7 @@ index 22c33d1..9bf5443 100644
  	char itemName[NAME_SIZE];
  	int haveItem;
  	int res;
-@@ -1134,9 +1134,9 @@ int simCust(int itemID, int lagTime, int waitTime, i=
nt speed, int taskID)
+@@ -1140,9 +1140,9 @@ int simCust(int itemID, int lagTime, int waitTime, i=
nt speed, int taskID)
  	char msg[MSG_SIZE_MAX];
  	char *marker;
  	int msgSize;
@@ -208,6 +218,15 @@ index 22c33d1..9bf5443 100644
  	char custName[NAME_SIZE];
  	int transactionID;
  	int needItem;
---=20
-2.12.2
-
+diff --git a/utils/net_topology_tracker/tipc_net_topology.c b/utils/net_to=
pology_tracker/tipc_net_topology.c
+--- a/utils/net_topology_tracker/tipc_net_topology.c
++++ b/utils/net_topology_tracker/tipc_net_topology.c
+@@ -35,7 +35,7 @@ static struct node nodes[MAX_NODES];
+ static struct pollfd pfd[MAX_NODES];=0D
+ static int node_cnt =3D 1;=0D
+ =0D
+-static uint own_node_addr(void)=0D
++static unsigned int own_node_addr(void)=0D
+ {=0D
+ 	struct sockaddr_tipc addr;=0D
+ 	socklen_t sz =3D sizeof(addr);=0D
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils/0003-test-Build-t=
ipc_test_suite-only-when-struct-tipcc_ad.patch b/meta-oe/recipes-extended/t=
ipcutils/tipcutils/0003-test-Build-tipc_test_suite-only-when-struct-tipcc_a=
d.patch
new file mode 100644
index 0000000000..176af06d4b
--- /dev/null
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils/0003-test-Build-tipc_tes=
t_suite-only-when-struct-tipcc_ad.patch
@@ -0,0 +1,50 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 23 Nov 2026 03:07:50 -0800
+Subject: [PATCH] test: Build tipc_test_suite only when struct tipcc_addr is
+ available
+
+tipc_test_suite uses struct tipcc_addr and TIPCC_ADDR, which only exist
+in a linux/tipc.h carrying the out-of-tree TIPC "tipcc" address API.
+Mainline kernel headers do not have them, so the build fails with:
+
+  tipc_test.h:69:21: error: field has incomplete type 'struct tipcc_addr'
+
+libtipc and the tipcc_hello_world demo already guard their use with
+'#ifdef TIPCC_ADDR'. Check for it in configure and skip the test suite
+when it is missing.
+
+Upstream-Status: Submitted [tipc-discussion@lists.sourceforge.net, <202611=
25080050.2410104-1-raj.khem@gmail.com>]
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ configure.ac     | 4 ++++
+ test/Makefile.am | 6 +++++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 83e0ea5..d7a1558 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -32,6 +32,10 @@ LDFLAGS=3D"$LDFLAGS ../../libtipc/libtipc.a -lpthread"
+ AC_CHECK_TYPE(struct tipc_sioc_ln_req, [tipc_lss=3Dyes],[], [[#include <l=
inux/tipc.h>]])
+ AM_CONDITIONAL(TIPC_LINK_STATE_SUBSCRITION, test "x$tipc_lss" =3D "xyes")
+=20
++# tipc_test_suite needs struct tipcc_addr, which mainline linux/tipc.h la=
cks
++AC_CHECK_DECL(TIPCC_ADDR, [tipcc_addr=3Dyes], [], [[#include <linux/tipc.=
h>]])
++AM_CONDITIONAL(TIPCC_ADDR, test "x$tipcc_addr" =3D "xyes")
++
+ # Checks for TIPC GO API
+ AC_ARG_WITH(goapi,AS_HELP_STRING([--with-goapi],[Compile TIPC GO APIs exa=
mples]),[goapi=3Dtrue],[])
+ if test "x$goapi" =3D=3D "xtrue"; then
+diff --git a/test/Makefile.am b/test/Makefile.am
+index b45dfd2..edda891 100644
+--- a/test/Makefile.am
++++ b/test/Makefile.am
+@@ -1 +1,5 @@
+-SUBDIRS =3D group_test ptts multicast_blast overlapping_ranges iovec tops=
rv_stress rdm tipc_test_suite
++SUBDIRS =3D group_test ptts multicast_blast overlapping_ranges iovec tops=
rv_stress rdm
++
++if TIPCC_ADDR
++SUBDIRS +=3D tipc_test_suite
++endif
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_3.0.7.bb b/meta-o=
e/recipes-extended/tipcutils/tipcutils_3.0.7.bb
new file mode 100644
index 0000000000..ffb8e60105
--- /dev/null
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_3.0.7.bb
@@ -0,0 +1,67 @@
+SUMMARY =3D "Transparent Inter-Process Communication protocol"
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D796417cb33987d462bc15155605a186=
1"
+
+SRC_URI =3D "git://git.code.sf.net/p/tipc/tipcutils;branch=3Dmaster \
+           file://tipcutils.conf \
+           file://0001-include-sys-select.h-for-FD_-definitions.patch \
+           file://0002-replace-non-standard-uint-with-unsigned-int.patch \
+           file://0003-test-Build-tipc_test_suite-only-when-struct-tipcc_a=
d.patch \
+           "
+# 3.0.7 is untagged, README names this commit's version
+SRCREV =3D "103c971228a6ec05e40ea757c7283f961df66f71"
+UPSTREAM_CHECK_COMMITS =3D "1"
+
+inherit autotools-brokensep pkgconfig systemd
+
+DEPENDS +=3D "libdaemon libmnl"
+
+RDEPENDS:${PN} =3D "iproute2-tipc"
+
+
+do_configure:prepend() {
+    ( cd ${S}; ${S}/bootstrap )
+}
+
+do_install:append() {
+    for d in hello_world:hello connection_demo:conn topology_subscr_demo:t=
op \
+             multicast_demo:mcast stream_demo:stream benchmark:benchmark \
+             tipcc_hello_world:tipcc_hello; do
+        dir=3D$(echo $d | cut -d: -f1)
+        pfx=3D$(echo $d | cut -d: -f2)
+        install -d ${D}/opt/tipcutils/demos/$dir
+        install ${B}/demos/$dir/"$pfx"_client ${D}/opt/tipcutils/demos/$di=
r/
+        install ${B}/demos/$dir/"$pfx"_server ${D}/opt/tipcutils/demos/$di=
r/
+    done
+    for d in inventory_sim:inventory_sim iov_control:iov_control groupcast=
_demo:group_cast; do
+        dir=3D$(echo $d | cut -d: -f1)
+        prog=3D$(echo $d | cut -d: -f2)
+        install -d ${D}/opt/tipcutils/demos/$dir
+        install ${B}/demos/$dir/$prog ${D}/opt/tipcutils/demos/$dir/
+    done
+
+    install -d ${D}/opt/tipcutils/ptts
+    install ${B}/test/ptts/tipcTS ${D}/opt/tipcutils/ptts/
+    install ${B}/test/ptts/tipcTC ${D}/opt/tipcutils/ptts/
+
+    sed -i -e '1s|^#!.*python$|#!/usr/bin/env python3|' ${D}${bindir}/tipc=
-trace
+
+    install -d ${D}${sysconfdir}
+    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/scripts/etc/* $=
{D}${sysconfdir}/
+    chown -R root:root ${D}${sysconfdir}
+
+    # Install systemd related configuration file
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',=
 d)}; then
+        install -d ${D}${sysconfdir}/modules-load.d
+        install -m 0644 ${UNPACKDIR}/tipcutils.conf ${D}${sysconfdir}/modu=
les-load.d
+    fi
+}
+
+SYSTEMD_SERVICE:${PN} =3D ""
+
+PACKAGES =3D+ "${PN}-trace"
+PACKAGES +=3D "${PN}-demos"
+FILES:${PN}-trace =3D "${bindir}/tipc-trace"
+RDEPENDS:${PN}-trace =3D "python3-core python3-datetime python3-syslog"
+FILES:${PN}-dbg +=3D "/opt/tipcutils/demos/*/.debug /opt/tipcutils/ptts/.d=
ebug"
+FILES:${PN}-demos =3D "/opt/tipcutils/*"
diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-oe/=
recipes-extended/tipcutils/tipcutils_git.bb
deleted file mode 100644
index a4bf3eaaca..0000000000
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-SUMMARY =3D "Transparent Inter-Process Communication protocol"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://tipclog/tipc.h;endline=3D35;md5=3D985b6ea8735=
818511d276c1b466cce98"
-
-SRC_URI =3D "git://git.code.sf.net/p/tipc/tipcutils;branch=3Dmaster \
-           file://tipcutils.conf \
-           file://0001-include-sys-select.h-for-FD_-definitions.patch \
-           file://0002-replace-non-standard-uint-with-unsigned-int.patch \
-           file://0001-multicast_blast-tipcc-Fix-struct-type-for-TIPC_GROU=
P.patch \
-           file://0001-test-ptts-Set-recv-buffer-size-too-max-to-receive-a=
s.patch \
-           "
-SRCREV =3D "7ab2211b87414ba240b0b2e4af219c1057c9cf9a"
-PV =3D "2.2.0+git"
-
-inherit autotools pkgconfig systemd
-
-DEPENDS +=3D "libdaemon"
-
-RDEPENDS:${PN} =3D "iproute2-tipc"
-
-
-do_configure:prepend() {
-    ( cd ${S}; ${S}/bootstrap )
-}
-
-do_install:append() {
-    demos=3D"benchmark hello_world topology_subscr_demo connection_demo \
-           multicast_demo stream_demo"
-    for i in $demos;do
-        install -d ${D}/opt/tipcutils/demos/$i
-        install ${B}/demos/$i/client_tipc ${D}/opt/tipcutils/demos/$i/
-        install ${B}/demos/$i/server_tipc ${D}/opt/tipcutils/demos/$i/
-    done
-    install -d ${D}/opt/tipcutils/demos/inventory_sim
-    install ${B}/demos/inventory_sim/inventory_sim ${D}/opt/tipcutils/demo=
s/inventory_sim/
-
-    install -d ${D}/opt/tipcutils/ptts
-    install ${B}/ptts/tipcTS ${D}/opt/tipcutils/ptts/
-    install ${B}/ptts/tipcTC ${D}/opt/tipcutils/ptts/
-
-    install -d ${D}${sysconfdir}
-    cp -R --no-dereference --preserve=3Dmode,links -v ${S}/scripts/etc/* $=
{D}${sysconfdir}/
-    chown -R root:root ${D}${sysconfdir}
-
-    # Install systemd related configuration file
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',=
 d)}; then
-        install -d ${D}${sysconfdir}/modules-load.d
-        install -m 0644 ${UNPACKDIR}/tipcutils.conf ${D}${sysconfdir}/modu=
les-load.d
-    fi
-}
-
-SYSTEMD_SERVICE:${PN} =3D ""
-
-PACKAGES +=3D "${PN}-demos"
-FILES:${PN}-dbg +=3D "/opt/tipcutils/demos/*/.debug /opt/tipcutils/ptts/.d=
ebug"
-FILES:${PN}-demos =3D "/opt/tipcutils/*"
-
