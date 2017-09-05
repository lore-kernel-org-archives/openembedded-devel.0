Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD2A78067
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Sep 2017 07:25:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v857PsDt006405
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 Sep 2017 00:25:54 -0700 (PDT)
Received: from otp-opanait-l1.corp.ad.wrs.com (128.224.124.169) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 5 Sep 2017 00:25:53 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Sep 2017 10:25:21 +0300
Message-ID: <20170905072521.24230-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH] rsyslog: fix segfault after configuration errors
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
X-List-Received-Date: Tue, 05 Sep 2017 07:25:53 -0000
Content-Type: text/plain

rsyslog will segfault on startup if
a) the local machine's hostname is set to a non-FQDN name
b) the getaddrinfo() system call fails
This scenario is higly unlikely, but may exist especially with
provisioned VMs which may not properly be able to do name queries
on startup (seen for example on AWS).

This patch fixes the situation and also provides more robustness
for very early startup error messages when some of the error-reporting
subsystem is not yet properly initialized. Note that under these
circumstances, errors may only show up on stderr.

closes https://github.com/rsyslog/rsyslog/issues/1573

Reference:
https://github.com/rsyslog/rsyslog/issues/1573

Upstream patch:
https://github.com/rsyslog/rsyslog/commit/6d258339802cb9f13d8a4a157a4b74eccb902d8f

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 ...ugfix-segfault-after-configuration-errors.patch | 90 ++++++++++++++++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-core-bugfix-segfault-after-configuration-errors.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-core-bugfix-segfault-after-configuration-errors.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-core-bugfix-segfault-after-configuration-errors.patch
new file mode 100644
index 0000000..189ca65
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-core-bugfix-segfault-after-configuration-errors.patch
@@ -0,0 +1,90 @@
+From 6d258339802cb9f13d8a4a157a4b74eccb902d8f Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Mon, 17 Jul 2017 15:36:32 +0200
+Subject: [PATCH] core bugfix: segfault after configuration errors
+
+rsyslog will segfault on startup if
+a) the local machine's hostname is set to a non-FQDN name
+b) the getaddrinfo() system call fails
+This scenario is higly unlikely, but may exist especially with
+provisioned VMs which may not properly be able to do name queries
+on startup (seen for example on AWS).
+
+This patch fixes the situation and also provides more robustness
+for very early startup error messages when some of the error-reporting
+subsystem is not yet properly initialized. Note that under these
+circumstances, errors may only show up on stderr.
+
+Upstream status: Backport
+
+closes https://github.com/rsyslog/rsyslog/issues/1573
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ runtime/prop.c   |  6 ++++++
+ tools/rsyslogd.c | 17 +++++++++--------
+ 2 files changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/runtime/prop.c b/runtime/prop.c
+index e5b4693..cb93285 100644
+--- a/runtime/prop.c
++++ b/runtime/prop.c
+@@ -133,7 +133,13 @@ propConstructFinalize(prop_t __attribute__((unused)) *pThis)
+  */
+ static rsRetVal AddRef(prop_t *pThis)
+ {
++	if(pThis == NULL)  {
++		DBGPRINTF("prop/AddRef is passed a NULL ptr - ignoring it "
++			"- further problems may occur\n");
++		FINALIZE;
++	}
+ 	ATOMIC_INC(&pThis->iRefCount, &pThis->mutRefCount);
++finalize_it:
+ 	return RS_RET_OK;
+ }
+ 
+diff --git a/tools/rsyslogd.c b/tools/rsyslogd.c
+index 759d293..6aa1487 100644
+--- a/tools/rsyslogd.c
++++ b/tools/rsyslogd.c
+@@ -808,9 +808,11 @@ logmsgInternal(int iErr, const syslog_pri_t pri, const uchar *const msg, int fla
+ 	 * permits us to process unmodified config files which otherwise contain a
+ 	 * supressor statement.
+ 	 */
+-	if(((Debug == DEBUG_FULL || !doFork) && ourConf->globals.bErrMsgToStderr) || iConfigVerify) {
++	int emit_to_stderr = (ourConf == NULL) ? 1 : ourConf->globals.bErrMsgToStderr;
++	if(((Debug == DEBUG_FULL || !doFork) && emit_to_stderr) || iConfigVerify) {
+ 		if(pri2sev(pri) == LOG_ERR)
+-			fprintf(stderr, "rsyslogd: %s\n", (bufModMsg == NULL) ? (char*)msg : bufModMsg);
++			fprintf(stderr, "rsyslogd: %s\n",
++				(bufModMsg == NULL) ? (char*)msg : bufModMsg);
+ 	}
+ 
+ finalize_it:
+@@ -1115,18 +1117,17 @@ initAll(int argc, char **argv)
+ 
+ 	/* doing some core initializations */
+ 
+-	/* get our host and domain names - we need to do this early as we may emit
+-	 * error log messages, which need the correct hostname. -- rgerhards, 2008-04-04
+-	 */
+-	queryLocalHostname();
+-
+-	/* initialize the objects */
+ 	if((iRet = modInitIminternal()) != RS_RET_OK) {
+ 		fprintf(stderr, "fatal error: could not initialize errbuf object (error code %d).\n",
+ 			iRet);
+ 		exit(1); /* "good" exit, leaving at init for fatal error */
+ 	}
+ 
++	/* get our host and domain names - we need to do this early as we may emit
++	 * error log messages, which need the correct hostname. -- rgerhards, 2008-04-04
++	 * But we need to have imInternal up first!
++	 */
++	queryLocalHostname();
+ 
+ 	/* END core initializations - we now come back to carrying out command line options*/
+ 
+-- 
+2.10.2
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
index bd317be..597a0c8 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://run-ptest \
            file://rsyslog-fix-ptest-not-finish.patch \
            file://CVE-2017-12588.patch \
+           file://0001-core-bugfix-segfault-after-configuration-errors.patch \
 "
 
 SRC_URI_append_libc-musl = " \
-- 
2.10.2


