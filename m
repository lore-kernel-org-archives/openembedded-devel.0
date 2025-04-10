Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA57C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 04:50:58 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web10.26891.1744260653072372184
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 21:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.53 with ESMTP; 10 Apr 2025 13:50:50 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.126 with ESMTP; 10 Apr 2025 13:50:50 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] lmbench: fix build error with gcc-15
Date: Thu, 10 Apr 2025 13:50:48 +0900
Message-Id: <20250410045048.742943-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 04:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116756

From: "mark.yang" <mark.yang@lge.com>

* see more details
  http://errors.yoctoproject.org/Errors/Details/851798/

    lat_rpc.c:172:1: error: conflicting types for 'client_rpc_xact_1'; have 'char *(char *, CLIENT *)' {aka 'char *(char *, struct __rpc_client *)'}
    172 | client_rpc_xact_1(char *argp, CLIENT *clnt)
        | ^~~~~~~~~~~~~~~~~
    bench.h:349:14: note: previous declaration of 'client_rpc_xact_1' with type 'char *(void)'
    349 | extern char *client_rpc_xact_1();
        |              ^~~~~~~~~~~~~~~~~
    lat_rpc.c: In function 'rpc_xact_1':
    lat_rpc.c:189:1: warning: old-style function definition [-Wold-style-definition]
    189 | rpc_xact_1(msg, transp)
        | ^~~~~~~~~~
    lat_rpc.c:192:1: error: number of arguments doesn't match prototype
    192 | {
        | ^
    bench.h:348:14: error: prototype declaration
    348 | extern char *rpc_xact_1();
        |              ^~~~~~~~~~

  Fix errors due to old-style function declarations

  The code was using old-style function declarations without proper prototypes,
  which causes compilation errors with newer GCC versions. This patch updates
  the function declarations to use modern C syntax with proper parameter types.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...-related-to-incorrect-function-param.patch | 252 ++++++++++++++++++
 .../lmbench/lmbench_3.0-a9.bb                 |   1 +
 2 files changed, 253 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench/0001-Fix-build-errors-related-to-incorrect-function-param.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench/0001-Fix-build-errors-related-to-incorrect-function-param.patch b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-Fix-build-errors-related-to-incorrect-function-param.patch
new file mode 100644
index 0000000000..30f52023cd
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench/0001-Fix-build-errors-related-to-incorrect-function-param.patch
@@ -0,0 +1,252 @@
+From 8a6b5f649fe7f42aff4f69a8d99c522adb22f54c Mon Sep 17 00:00:00 2001
+From: "mark.yang" <mark.yang@lge.com>
+Date: Thu, 10 Apr 2025 13:19:07 +0900
+Subject: [PATCH] Fix build errors related to incorrect function parameters in
+ gcc-15
+
+* see more details
+  http://errors.yoctoproject.org/Errors/Details/851798/
+
+    lat_rpc.c:172:1: error: conflicting types for 'client_rpc_xact_1'; have 'char *(char *, CLIENT *)' {aka 'char *(char *, struct __rpc_client *)'}
+    172 | client_rpc_xact_1(char *argp, CLIENT *clnt)
+        | ^~~~~~~~~~~~~~~~~
+    bench.h:349:14: note: previous declaration of 'client_rpc_xact_1' with type 'char *(void)'
+    349 | extern char *client_rpc_xact_1();
+        |              ^~~~~~~~~~~~~~~~~
+    lat_rpc.c: In function 'rpc_xact_1':
+    lat_rpc.c:189:1: warning: old-style function definition [-Wold-style-definition]
+    189 | rpc_xact_1(msg, transp)
+        | ^~~~~~~~~~
+    lat_rpc.c:192:1: error: number of arguments doesn't match prototype
+    192 | {
+        | ^
+    bench.h:348:14: error: prototype declaration
+    348 | extern char *rpc_xact_1();
+        |              ^~~~~~~~~~
+
+  Fix errors due to old-style function declarations
+
+  The code was using old-style function declarations without proper prototypes,
+  which causes compilation errors with newer GCC versions. This patch updates
+  the function declarations to use modern C syntax with proper parameter types.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/lmbench/patches/3]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ src/bench.h   |  4 ++--
+ src/lat_rpc.c | 24 ++++++++++--------------
+ src/lat_udp.c |  4 ++--
+ src/lmdd.c    | 18 +++++++++---------
+ src/lmhttp.c  |  4 ++--
+ 5 files changed, 25 insertions(+), 29 deletions(-)
+
+diff --git a/src/bench.h b/src/bench.h
+index 1768ef7..4fc2822 100644
+--- a/src/bench.h
++++ b/src/bench.h
+@@ -345,7 +345,7 @@ extern int sched_pin(int cpu);
+ #define XACT_VERS ((u_long)1)
+ #define RPC_XACT ((u_long)1)
+ #define RPC_EXIT ((u_long)2)
+-extern char *rpc_xact_1();
+-extern char *client_rpc_xact_1();
++extern char *rpc_xact_1(char *msg, struct svc_req *rqstp);
++extern char *client_rpc_xact_1(char *argp, CLIENT *clnt);
+ 
+ #endif /* _BENCH_H */
+diff --git a/src/lat_rpc.c b/src/lat_rpc.c
+index 9c02192..e1450af 100644
+--- a/src/lat_rpc.c
++++ b/src/lat_rpc.c
+@@ -185,17 +185,15 @@ client_rpc_xact_1(char *argp, CLIENT *clnt)
+  * The remote procedure[s] that will be called
+  */
+ /* ARGSUSED */
+-char	*
+-rpc_xact_1(msg, transp)
+-     	char	*msg;
+-	register SVCXPRT *transp;
++char *
++rpc_xact_1(char *msg, struct svc_req *rqstp /* transp is unused */)
+ {
+ 	static char r = 123;
+ 
+ 	return &r;
+ }
+ 
+-static void xact_prog_1();
++static void xact_prog_1(struct svc_req *rqstp, register SVCXPRT *transp);
+ 
+ void
+ server_main()
+@@ -233,16 +231,14 @@ server_main()
+ }
+ 
+ static void
+-xact_prog_1(rqstp, transp)
+-	struct svc_req *rqstp;
+-	register SVCXPRT *transp;
++xact_prog_1(struct svc_req *rqstp, register SVCXPRT *transp)
+ {
+ 	union {
+ 		char rpc_xact_1_arg;
+ 	} argument;
+ 	char *result;
+-	bool_t (*xdr_argument)(), (*xdr_result)();
+-	char *(*local)();
++	bool_t (*xdr_argument)(XDR *, void *), (*xdr_result)(XDR *, void *);
++	char *(*local)(char *, struct svc_req *);
+ 
+ 	switch (rqstp->rq_proc) {
+ 	case NULLPROC:
+@@ -250,9 +246,9 @@ xact_prog_1(rqstp, transp)
+ 		return;
+ 
+ 	case RPC_XACT:
+-		xdr_argument = xdr_char;
+-		xdr_result = xdr_char;
+-		local = (char *(*)()) rpc_xact_1;
++		xdr_argument = (bool_t (*)(XDR *, void *))xdr_char;
++		xdr_result = (bool_t (*)(XDR *, void *))xdr_char;
++		local = rpc_xact_1;
+ 		break;
+ 
+ 	case RPC_EXIT:
+@@ -269,7 +265,7 @@ xact_prog_1(rqstp, transp)
+ 		svcerr_decode(transp);
+ 		return;
+ 	}
+-	result = (*local)(&argument, rqstp);
++	result = local(&argument.rpc_xact_1_arg, rqstp);
+ 	if (result != NULL && !svc_sendreply(transp, (xdrproc_t)xdr_result, result)) {
+ 		svcerr_systemerr(transp);
+ 	}
+diff --git a/src/lat_udp.c b/src/lat_udp.c
+index cdd2e9b..292d5c4 100644
+--- a/src/lat_udp.c
++++ b/src/lat_udp.c
+@@ -19,7 +19,7 @@ char	*id = "$Id$\n";
+ 
+ void	client_main(int ac, char **av);
+ void	server_main();
+-void	timeout();
++void	timeout(int sig);
+ void	init(iter_t iterations, void* cookie);
+ void	cleanup(iter_t iterations, void* cookie);
+ void    doit(iter_t iterations, void* cookie);
+@@ -164,7 +164,7 @@ cleanup(iter_t iterations, void* cookie)
+ }
+ 
+ void
+-timeout()
++timeout(__attribute__((unused)) int sig)
+ {
+ 	fprintf(stderr, "Recv timed out\n");
+ 	exit(1);
+diff --git a/src/lmdd.c b/src/lmdd.c
+index dee37b4..da64b04 100644
+--- a/src/lmdd.c
++++ b/src/lmdd.c
+@@ -76,7 +76,7 @@ int	norepeats = -1;
+ 	bds_msg	*m1, *m2;
+ #endif
+ 
+-uint64	getarg();
++uint64	getarg(char *s, int ac, char **av);
+ int	been_there(uint64 off);
+ int	getfile(char *s, int ac, char **av);
+ 
+@@ -148,7 +148,7 @@ char   *cmds[] = {
+ 
+ 
+ void error(char *);
+-void    done();
++void    done(int sig);
+ #ifdef	DBG
+ extern int dbg;
+ #endif
+@@ -162,7 +162,7 @@ main(int ac, char **av)
+ 	int     Fork, misses, mismatch, outpat, inpat, in, timeopen, gotcnt;
+ 	int	slp;
+ 	uint64	skip, size, count;
+-	void	chkarg();
++	void	chkarg(char *arg);
+ 	int     i;
+ 	uint64	off = 0;
+ 	int	touch;
+@@ -332,7 +332,7 @@ main(int ac, char **av)
+ 		register int moved;
+ 
+ 		if (gotcnt && count-- <= 0) {
+-			done();
++			done(0);
+ 		}
+ 
+ 		/*
+@@ -445,7 +445,7 @@ main(int ac, char **av)
+ 			perror("read");
+ 		}
+ 		if (moved <= 0) {
+-			done();
++			done(0);
+ 		}
+ 		if (inpat != -1) {
+ 			register int foo, cnt;
+@@ -458,7 +458,7 @@ main(int ac, char **av)
+ 					    (uint)(off + foo*sizeof(int)),
+ 					    buf[foo]);
+ 					if (mismatch != -1 && --misses == 0) {
+-						done();
++						done(0);
+ 					}
+ 				}
+ 			}
+@@ -523,7 +523,7 @@ main(int ac, char **av)
+ 			if (moved2 != moved) {
+ 				fprintf(stderr, "write: wanted=%d got=%d\n",
+ 				    moved, moved2);
+-				done();
++				done(0);
+ 			}
+ 			if ((Wtmax != -1) || (Wtmin != -1)) {
+ 				int mics = stop(&start_tv, &stop_tv);
+@@ -560,7 +560,7 @@ main(int ac, char **av)
+ 				perror("write");
+ 			}
+ 			if (moved2 != moved) {
+-				done();
++				done(0);
+ 			}
+ 
+ 			if (touch) {
+@@ -626,7 +626,7 @@ chkarg(char *arg)
+ }
+ 
+ void 
+-done(void)
++done(__attribute__((unused)) int sig)
+ {
+ 	int	i;
+ 	int	step;
+diff --git a/src/lmhttp.c b/src/lmhttp.c
+index 41d9949..c2f3cb9 100644
+--- a/src/lmhttp.c
++++ b/src/lmhttp.c
+@@ -26,7 +26,7 @@ char	*buf;
+ char	*bufs[3];
+ int	Dflg, dflg, nflg, lflg, fflg, zflg;
+ int	data, logfile;
+-void	die();
++void	die(int sig);
+ void	worker();
+ char	*http_time(void);
+ char	*date(time_t *tt);
+@@ -387,7 +387,7 @@ logit(int sock, char *name, int size)
+ 	nbytes += len;
+ }
+ 
+-void die()
++void die(__attribute__((unused)) int sig)
+ {
+ 	if (nbytes) {
+ 		write(logfile, logbuf, nbytes);
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 2533f6033c..acd4d6decf 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -29,6 +29,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.tgz \
            file://0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch \
            file://0001-bench.h-Fix-typo-in-specifying-string.h.patch \
            file://0001-scripts-build-Fix-the-tests-to-build-with-clang15.patch \
+           file://0001-Fix-build-errors-related-to-incorrect-function-param.patch \
            "
 SRC_URI[sha256sum] = "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551"
 

