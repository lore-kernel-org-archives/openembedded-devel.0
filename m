Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94F316BA7D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 08:47:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAK8kkZ8004484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Nov 2018 00:47:07 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 20 Nov 2018 00:46:41 -0800
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Nov 2018 00:46:41 -0800
Message-ID: <20181120084641.3445-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] librelp: Upgrade to 1.2.18
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
X-List-Received-Date: Tue, 20 Nov 2018 08:47:33 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Correct the homepage
* Remove two backported patches
* Backport 0001-testbench-improvements.patch
  to fix the below error:
  | ../../git/src/tcp.c:3072:57: error: '%s' directive output may be truncated writing up to 1023 bytes into a region of size 1005 [-Werror=format-truncation=]
  |     snprintf(errmsg, sizeof(errmsg), "error connecting: '%s'", errStr);

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...src-tcp.c-fix-jump-misses-init-error.patch |  71 --------
 ...c-tcp.c-increase-the-size-of-szHname.patch |  53 ------
 .../librelp/0001-testbench-improvements.patch | 164 ++++++++++++++++++
 .../{librelp_1.2.16.bb => librelp_1.2.18.bb}  |   7 +-
 4 files changed, 167 insertions(+), 128 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-increase-the-size-of-szHname.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-testbench-improvements.patch
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.2.16.bb => librelp_1.2.18.bb} (54%)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch
deleted file mode 100644
index 68b686346..000000000
--- a/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 3e5a0cb440c788e2383e40ab23ac1cf01d96961b Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Tue, 24 Jul 2018 01:30:25 -0700
-Subject: [PATCH] src/tcp.c: fix jump-misses-init error
-
-Fix below jump-misses-init error
-
-| In file included from ../../git/src/tcp.c:51:
-| ../../git/src/tcp.c: In function 'relpTcpConnect':
-| ../../git/src/relp.h:220:3: error: jump skips variable initialization [-Werror=jump-misses-init]
-|    goto finalize_it;  \
-|    ^~~~
-| ../../git/src/tcp.c:1951:3: note: in expansion of macro 'ABORT_FINALIZE'
-|    ABORT_FINALIZE(RELP_RET_IO_ERR);
-|    ^~~~~~~~~~~~~~
-| ../../git/src/tcp.c:2005:1: note: label 'finalize_it' defined here
-|  finalize_it:
-|  ^~~~~~~~~~~
-| ../../git/src/tcp.c:1991:6: note: 'r' declared here
-|   int r = getsockopt(pThis->sock, SOL_SOCKET, SO_ERROR, &so_error, &len);
-|       ^
-| In file included from ../../git/src/tcp.c:51:
-| ../../git/src/relp.h:220:3: error: jump skips variable initialization [-Werror=jump-misses-init]
-|    goto finalize_it;  \
-|    ^~~~
-| ../../git/src/tcp.c:1951:3: note: in expansion of macro 'ABORT_FINALIZE'
-|    ABORT_FINALIZE(RELP_RET_IO_ERR);
-|    ^~~~~~~~~~~~~~
-| ../../git/src/tcp.c:2005:1: note: label 'finalize_it' defined here
-|  finalize_it:
-|  ^~~~~~~~~~~
-| ../../git/src/tcp.c:1989:12: note: 'len' declared here
-|   socklen_t len = sizeof so_error;
-|             ^~~
-
-Upstream-Status: Submitted[https://github.com/rsyslog/librelp/pull/117]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/tcp.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/tcp.c b/src/tcp.c
-index f35eb84..fb34dc7 100644
---- a/src/tcp.c
-+++ b/src/tcp.c
-@@ -1936,6 +1936,9 @@ relpTcpConnect(relpTcp_t *const pThis,
- 	struct addrinfo hints;
- 	struct addrinfo *reslocal = NULL;
- 	struct pollfd pfd;
-+	int so_error;
-+	socklen_t len = sizeof so_error;
-+	int r;
- 
- 	ENTER_RELPFUNC;
- 	RELPOBJ_assert(pThis, Tcp);
-@@ -1985,10 +1988,8 @@ relpTcpConnect(relpTcp_t *const pThis,
- 		ABORT_FINALIZE(RELP_RET_TIMED_OUT);
- 	}
- 
--	int so_error;
--	socklen_t len = sizeof so_error;
- 
--	int r = getsockopt(pThis->sock, SOL_SOCKET, SO_ERROR, &so_error, &len);
-+	r = getsockopt(pThis->sock, SOL_SOCKET, SO_ERROR, &so_error, &len);
- 	if (r == -1 || so_error != 0) {
- 		pThis->pEngine->dbgprint("socket has an error %d\n", so_error);
- 		ABORT_FINALIZE(RELP_RET_IO_ERR);
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-increase-the-size-of-szHname.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-increase-the-size-of-szHname.patch
deleted file mode 100644
index 5a62e1584..000000000
--- a/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-increase-the-size-of-szHname.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d8950ad273d79ec516468289adbd427e681dbc66 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 30 Jul 2018 01:22:56 -0700
-Subject: [PATCH] src/tcp.c: increase the size of szHname
-
-Increase the size of szHname to fix below
-error:
-| ../../git/src/tcp.c: In function 'relpTcpSetRemHost':
-| ../../git/src/tcp.c:352:57: error: '%s' directive output may be truncated writing up to 1024 bytes into a region of size 1011 [-Werror=format-truncation=]
-|      snprintf((char*)szHname, NI_MAXHOST, "[MALICIOUS:IP=%s]", szIP);
-|                                                          ^~    ~~~~
-| In file included from /poky-build/tmp/work/i586-poky-linux/librelp/1.2.16-r0/recipe-sysroot/usr/include/stdio.h:862,
-|                  from ../../git/src/tcp.c:38:
-| /poky-build/tmp/work/i586-poky-linux/librelp/1.2.16-r0/recipe-sysroot/usr/include/bits/stdio2.h:64:10: note: '__builtin___snprintf_chk' output between 16 and 1040 bytes into a destination of size 1025
-|    return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
-|           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-|         __bos (__s), __fmt, __va_arg_pack ());
-|         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-| cc1: all warnings being treated as errors
-| Makefile:536: recipe for target 'librelp_la-tcp.lo' failed
-
-Upstream-Status: Submitted[https://github.com/rsyslog/librelp/pull/118]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/tcp.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/tcp.c b/src/tcp.c
-index fb34dc7..2c38b0b 100644
---- a/src/tcp.c
-+++ b/src/tcp.c
-@@ -319,7 +319,7 @@ relpTcpSetRemHost(relpTcp_t *const pThis, struct sockaddr *pAddr)
- 	relpEngine_t *pEngine;
- 	int error;
- 	unsigned char szIP[NI_MAXHOST] = "";
--	unsigned char szHname[NI_MAXHOST] = "";
-+	unsigned char szHname[1045] = "";
- 	struct addrinfo hints, *res;
- 	size_t len;
- 	
-@@ -349,7 +349,7 @@ relpTcpSetRemHost(relpTcp_t *const pThis, struct sockaddr *pAddr)
- 			if(getaddrinfo((char*)szHname, NULL, &hints, &res) == 0) {
- 				freeaddrinfo (res);
- 				/* OK, we know we have evil, so let's indicate this to our caller */
--				snprintf((char*)szHname, NI_MAXHOST, "[MALICIOUS:IP=%s]", szIP);
-+				snprintf((char*)szHname, sizeof(szHname), "[MALICIOUS:IP=%s]", szIP);
- 				pEngine->dbgprint("Malicious PTR record, IP = \"%s\" HOST = \"%s\"", szIP, szHname);
- 				iRet = RELP_RET_MALICIOUS_HNAME;
- 			}
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-testbench-improvements.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-testbench-improvements.patch
new file mode 100644
index 000000000..6b60bd748
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-testbench-improvements.patch
@@ -0,0 +1,164 @@
+From 1e6be18ed243dc562ff2976b46850bfd2e576664 Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Thu, 15 Nov 2018 12:23:41 +0100
+Subject: [PATCH] testbench improvements
+
+Most importantly, the test receiver process is now terminated
+gracefully. Without that, gcov can never pick up correct
+coverage data.
+
+Upstream-Status: Backport[https://github.com/rsyslog/librelp/commit/1e6be18ed243dc562ff2976b46850bfd2e576664]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/tcp.c                       |  4 ++--
+ tests/Makefile.am               |  3 ++-
+ tests/receive.c                 | 29 +++++++++++++++++++++++++++--
+ tests/selftest_receive_usage.sh |  5 +++++
+ tests/test-framework.sh         |  4 ++--
+ 5 files changed, 38 insertions(+), 7 deletions(-)
+ create mode 100755 tests/selftest_receive_usage.sh
+
+diff --git a/src/tcp.c b/src/tcp.c
+index f10a720..0ea92ea 100644
+--- a/src/tcp.c
++++ b/src/tcp.c
+@@ -3027,7 +3027,7 @@ relpTcpConnect(relpTcp_t *const pThis,
+ 	struct addrinfo hints;
+ 	struct addrinfo *reslocal = NULL;
+ 	struct pollfd pfd;
+-	char errmsg[1024];
++	char errmsg[1424];
+ 	int so_error;
+ 	socklen_t len = sizeof so_error;
+ 	int r;
+@@ -3067,7 +3067,7 @@ relpTcpConnect(relpTcp_t *const pThis,
+ 	}
+ 	if(connect(pThis->sock, res->ai_addr, res->ai_addrlen) == -1) {
+ 		if(errno != EINPROGRESS) {
+-			char errStr[1024];
++			char errStr[1200];
+ 			_relpEngine_strerror_r(errno, errStr, sizeof(errStr));
+ 			snprintf(errmsg, sizeof(errmsg), "error connecting: '%s'", errStr);
+ 			callOnErr(pThis, errmsg, RELP_RET_IO_ERR);
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 64deb19..51fd78f 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -25,7 +25,8 @@ TESTS=  basic.sh \
+ 	long-msg.sh \
+ 	oversize-msg-abort-errmsg.sh \
+ 	oversize-msg-accept-errmsg.sh \
+-	truncate-oversize-msg.sh
++	truncate-oversize-msg.sh \
++	selftest_receive_usage.sh
+ # OpenSSL tests only!
+ if ENABLE_TLS_OPENSSL
+ TESTS += tls-wrong-permittedPeer.sh \
+diff --git a/tests/receive.c b/tests/receive.c
+index e56e59c..4b69c99 100644
+--- a/tests/receive.c
++++ b/tests/receive.c
+@@ -1,6 +1,7 @@
+ /* A minimal RELP receiver using librelp
+  *
+  * Copyright 2014 Mathias Nyman
++ * Copyright 2018 Adiscon GmbH
+  *
+  * Licensed under the Apache License, Version 2.0 (the "License");
+  * you may not use this file except in compliance with the License.
+@@ -24,6 +25,7 @@
+ #include <string.h>
+ #include <limits.h>
+ #include <errno.h>
++#include <signal.h>
+ #include "librelp.h"
+ 
+ #define TRY(f) if(f != RELP_RET_OK) { fprintf(stderr, "receive.c: FAILURE in '%s'\n", #f); ret = 1; goto done; }
+@@ -31,6 +33,24 @@
+ static FILE *errFile = NULL;
+ static relpEngine_t *pRelpEngine;
+ 
++static void
++hdlr_enable(int sig, void (*hdlr)())
++{
++	struct sigaction sigAct;
++	memset(&sigAct, 0, sizeof (sigAct));
++	sigemptyset(&sigAct.sa_mask);
++	sigAct.sa_handler = hdlr;
++	sigaction(sig, &sigAct, NULL);
++}
++
++void
++terminate(int sig)
++{
++	fprintf(stderr, "terminating on signal %d\n", sig);
++	relpEngineSetStop(pRelpEngine);
++}
++
++
+ static void __attribute__((format(printf, 1, 2)))
+ dbgprintf(char *fmt, ...)
+ {
+@@ -237,6 +257,8 @@ int main(int argc, char *argv[]) {
+ 		}
+ 	}
+ 
++	hdlr_enable(SIGTERM, terminate);
++
+ 	TRY(relpEngineConstruct(&pRelpEngine));
+ 	TRY(relpEngineSetDbgprint(pRelpEngine, verbose ? dbgprintf : NULL));
+ 	TRY(relpEngineSetEnableCmd(pRelpEngine, (unsigned char*) "syslog", eRelpCmdState_Required));
+@@ -294,11 +316,14 @@ int main(int argc, char *argv[]) {
+ 		fclose(fp);
+ 	}
+ 
+-	TRY(relpEngineRun(pRelpEngine)); /* Abort with ctrl-c */
++	TRY(relpEngineRun(pRelpEngine)); /* Abort via SIGHUP */
+ 
+-	TRY(relpEngineSetStop(pRelpEngine));
+ 	TRY(relpEngineDestruct(&pRelpEngine));
+ 
++	if(pidFileName != NULL) {
++		unlink(pidFileName);
++	}
++
+ done:
+ 	return ret;
+ }
+diff --git a/tests/selftest_receive_usage.sh b/tests/selftest_receive_usage.sh
+new file mode 100755
+index 0000000..c4ac8bb
+--- /dev/null
++++ b/tests/selftest_receive_usage.sh
+@@ -0,0 +1,5 @@
++#!/bin/bash
++. ${srcdir:=$(pwd)}/test-framework.sh
++./receive &>librelp.out.log
++check_output "Port is missing"
++terminate
+diff --git a/tests/test-framework.sh b/tests/test-framework.sh
+index 6abdcf2..d4ab3ec 100644
+--- a/tests/test-framework.sh
++++ b/tests/test-framework.sh
+@@ -32,7 +32,7 @@ function wait_process_startup_via_pidfile() {
+ # start receiver WITH valgrind, add receiver command line parameters after function name
+ function startup_receiver_valgrind() {
+ 	printf 'Starting Receiver...\n'
+-	$valgrind ./receive -p $TESTPORT -F receive.pid $OPT_VERBOSE $* 1>>librelp.out.log &
++	$valgrind ./receive -p $TESTPORT -F receive.pid $OPT_VERBOSE $* 1>librelp.out.log &
+ 	export RECEIVE_PID=$!
+ 	printf "got receive pid $RECEIVE_PID\n"
+ 	wait_process_startup_via_pidfile receive.pid
+@@ -43,7 +43,7 @@ function startup_receiver_valgrind() {
+ # start receiver, add receiver command line parameters after function name
+ function startup_receiver() {
+ 	printf 'Starting Receiver...\n'
+-	./receive -p $TESTPORT -F receive.pid $OPT_VERBOSE $* 1>>librelp.out.log &
++	./receive -p $TESTPORT -F receive.pid $OPT_VERBOSE $* 1>librelp.out.log &
+ 	export RECEIVE_PID=$!
+ 	printf "got receive pid $RECEIVE_PID\n"
+ 	wait_process_startup_via_pidfile receive.pid
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb
similarity index 54%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb
index 17478efe4..e4838fa5b 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A reliable logging library"
-HOMEPAGE = "https://github.com/rsyslog/libfastjson"
+HOMEPAGE = "https://github.com/rsyslog/librelp"
 
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
@@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
 DEPENDS = "gmp nettle libidn zlib gnutls"
 
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https \
-           file://0001-src-tcp.c-fix-jump-misses-init-error.patch \
-           file://0001-src-tcp.c-increase-the-size-of-szHname.patch \
+           file://0001-testbench-improvements.patch \
 "
 
-SRCREV = "5e849ff060be0c7dce972e194c54fdacfee0adc2"
+SRCREV = "4b6a81061bccf68cba6fddd27f99fb5dc0d0c3a3"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


