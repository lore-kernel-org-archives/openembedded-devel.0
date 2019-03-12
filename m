Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 655447C70C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2019 09:47:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2C9j1rP024490
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Mar 2019 02:46:28 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 12 Mar 2019 02:46:26 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>,
	<anuj.mittal@intel.com>
Date: Tue, 12 Mar 2019 02:46:26 -0700
Message-ID: <20190312094626.33914-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <C0207330DF60C5409302EC78C3FE68F30230FEA0@PGSMSX105.gar.corp.intel.com>
References: <C0207330DF60C5409302EC78C3FE68F30230FEA0@PGSMSX105.gar.corp.intel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3 v3] librelp: Upgrade to 1.4.0
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
X-List-Received-Date: Tue, 12 Mar 2019 09:47:09 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove one backported patch.

Add openssl to Depends.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../librelp/0001-testbench-improvements.patch | 164 ------------------
 .../{librelp_1.2.18.bb => librelp_1.4.0.bb}   |   5 +-
 2 files changed, 2 insertions(+), 167 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-testbench-improvements.patch
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.2.18.bb => librelp_1.4.0.bb} (66%)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-testbench-improvements.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-testbench-improvements.patch
deleted file mode 100644
index 6b60bd748..000000000
--- a/meta-oe/recipes-extended/rsyslog/librelp/0001-testbench-improvements.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 1e6be18ed243dc562ff2976b46850bfd2e576664 Mon Sep 17 00:00:00 2001
-From: Rainer Gerhards <rgerhards@adiscon.com>
-Date: Thu, 15 Nov 2018 12:23:41 +0100
-Subject: [PATCH] testbench improvements
-
-Most importantly, the test receiver process is now terminated
-gracefully. Without that, gcov can never pick up correct
-coverage data.
-
-Upstream-Status: Backport[https://github.com/rsyslog/librelp/commit/1e6be18ed243dc562ff2976b46850bfd2e576664]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/tcp.c                       |  4 ++--
- tests/Makefile.am               |  3 ++-
- tests/receive.c                 | 29 +++++++++++++++++++++++++++--
- tests/selftest_receive_usage.sh |  5 +++++
- tests/test-framework.sh         |  4 ++--
- 5 files changed, 38 insertions(+), 7 deletions(-)
- create mode 100755 tests/selftest_receive_usage.sh
-
-diff --git a/src/tcp.c b/src/tcp.c
-index f10a720..0ea92ea 100644
---- a/src/tcp.c
-+++ b/src/tcp.c
-@@ -3027,7 +3027,7 @@ relpTcpConnect(relpTcp_t *const pThis,
- 	struct addrinfo hints;
- 	struct addrinfo *reslocal = NULL;
- 	struct pollfd pfd;
--	char errmsg[1024];
-+	char errmsg[1424];
- 	int so_error;
- 	socklen_t len = sizeof so_error;
- 	int r;
-@@ -3067,7 +3067,7 @@ relpTcpConnect(relpTcp_t *const pThis,
- 	}
- 	if(connect(pThis->sock, res->ai_addr, res->ai_addrlen) == -1) {
- 		if(errno != EINPROGRESS) {
--			char errStr[1024];
-+			char errStr[1200];
- 			_relpEngine_strerror_r(errno, errStr, sizeof(errStr));
- 			snprintf(errmsg, sizeof(errmsg), "error connecting: '%s'", errStr);
- 			callOnErr(pThis, errmsg, RELP_RET_IO_ERR);
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 64deb19..51fd78f 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -25,7 +25,8 @@ TESTS=  basic.sh \
- 	long-msg.sh \
- 	oversize-msg-abort-errmsg.sh \
- 	oversize-msg-accept-errmsg.sh \
--	truncate-oversize-msg.sh
-+	truncate-oversize-msg.sh \
-+	selftest_receive_usage.sh
- # OpenSSL tests only!
- if ENABLE_TLS_OPENSSL
- TESTS += tls-wrong-permittedPeer.sh \
-diff --git a/tests/receive.c b/tests/receive.c
-index e56e59c..4b69c99 100644
---- a/tests/receive.c
-+++ b/tests/receive.c
-@@ -1,6 +1,7 @@
- /* A minimal RELP receiver using librelp
-  *
-  * Copyright 2014 Mathias Nyman
-+ * Copyright 2018 Adiscon GmbH
-  *
-  * Licensed under the Apache License, Version 2.0 (the "License");
-  * you may not use this file except in compliance with the License.
-@@ -24,6 +25,7 @@
- #include <string.h>
- #include <limits.h>
- #include <errno.h>
-+#include <signal.h>
- #include "librelp.h"
- 
- #define TRY(f) if(f != RELP_RET_OK) { fprintf(stderr, "receive.c: FAILURE in '%s'\n", #f); ret = 1; goto done; }
-@@ -31,6 +33,24 @@
- static FILE *errFile = NULL;
- static relpEngine_t *pRelpEngine;
- 
-+static void
-+hdlr_enable(int sig, void (*hdlr)())
-+{
-+	struct sigaction sigAct;
-+	memset(&sigAct, 0, sizeof (sigAct));
-+	sigemptyset(&sigAct.sa_mask);
-+	sigAct.sa_handler = hdlr;
-+	sigaction(sig, &sigAct, NULL);
-+}
-+
-+void
-+terminate(int sig)
-+{
-+	fprintf(stderr, "terminating on signal %d\n", sig);
-+	relpEngineSetStop(pRelpEngine);
-+}
-+
-+
- static void __attribute__((format(printf, 1, 2)))
- dbgprintf(char *fmt, ...)
- {
-@@ -237,6 +257,8 @@ int main(int argc, char *argv[]) {
- 		}
- 	}
- 
-+	hdlr_enable(SIGTERM, terminate);
-+
- 	TRY(relpEngineConstruct(&pRelpEngine));
- 	TRY(relpEngineSetDbgprint(pRelpEngine, verbose ? dbgprintf : NULL));
- 	TRY(relpEngineSetEnableCmd(pRelpEngine, (unsigned char*) "syslog", eRelpCmdState_Required));
-@@ -294,11 +316,14 @@ int main(int argc, char *argv[]) {
- 		fclose(fp);
- 	}
- 
--	TRY(relpEngineRun(pRelpEngine)); /* Abort with ctrl-c */
-+	TRY(relpEngineRun(pRelpEngine)); /* Abort via SIGHUP */
- 
--	TRY(relpEngineSetStop(pRelpEngine));
- 	TRY(relpEngineDestruct(&pRelpEngine));
- 
-+	if(pidFileName != NULL) {
-+		unlink(pidFileName);
-+	}
-+
- done:
- 	return ret;
- }
-diff --git a/tests/selftest_receive_usage.sh b/tests/selftest_receive_usage.sh
-new file mode 100755
-index 0000000..c4ac8bb
---- /dev/null
-+++ b/tests/selftest_receive_usage.sh
-@@ -0,0 +1,5 @@
-+#!/bin/bash
-+. ${srcdir:=$(pwd)}/test-framework.sh
-+./receive &>librelp.out.log
-+check_output "Port is missing"
-+terminate
-diff --git a/tests/test-framework.sh b/tests/test-framework.sh
-index 6abdcf2..d4ab3ec 100644
---- a/tests/test-framework.sh
-+++ b/tests/test-framework.sh
-@@ -32,7 +32,7 @@ function wait_process_startup_via_pidfile() {
- # start receiver WITH valgrind, add receiver command line parameters after function name
- function startup_receiver_valgrind() {
- 	printf 'Starting Receiver...\n'
--	$valgrind ./receive -p $TESTPORT -F receive.pid $OPT_VERBOSE $* 1>>librelp.out.log &
-+	$valgrind ./receive -p $TESTPORT -F receive.pid $OPT_VERBOSE $* 1>librelp.out.log &
- 	export RECEIVE_PID=$!
- 	printf "got receive pid $RECEIVE_PID\n"
- 	wait_process_startup_via_pidfile receive.pid
-@@ -43,7 +43,7 @@ function startup_receiver_valgrind() {
- # start receiver, add receiver command line parameters after function name
- function startup_receiver() {
- 	printf 'Starting Receiver...\n'
--	./receive -p $TESTPORT -F receive.pid $OPT_VERBOSE $* 1>>librelp.out.log &
-+	./receive -p $TESTPORT -F receive.pid $OPT_VERBOSE $* 1>librelp.out.log &
- 	export RECEIVE_PID=$!
- 	printf "got receive pid $RECEIVE_PID\n"
- 	wait_process_startup_via_pidfile receive.pid
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
similarity index 66%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
index e4838fa5b..9e57dd520 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.2.18.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.4.0.bb
@@ -4,13 +4,12 @@ HOMEPAGE = "https://github.com/rsyslog/librelp"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
 
-DEPENDS = "gmp nettle libidn zlib gnutls"
+DEPENDS = "gmp nettle libidn zlib gnutls openssl"
 
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https \
-           file://0001-testbench-improvements.patch \
 "
 
-SRCREV = "4b6a81061bccf68cba6fddd27f99fb5dc0d0c3a3"
+SRCREV = "e96443dda3c080fa991decec26bc4ac98d24b9a2"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


