Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 69E9B78685
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 15:23:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8FFNWpW002453
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 08:23:32 -0700
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 15 Sep 2017 08:23:31 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Sep 2017 11:23:25 -0400
Message-ID: <1505489005-4115-2-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505489005-4115-1-git-send-email-Randy.MacLeod@windriver.com>
References: <1505489005-4115-1-git-send-email-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] rsyslog: update from 8.22 to 8.29
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
X-List-Received-Date: Fri, 15 Sep 2017 15:23:32 -0000
Content-Type: text/plain

Drop two patches:
    CVE-2017-12588.patch
    0001-core-bugfix-segfault-after-configuration-errors.patch
since they are included in 8.29.

Update the testbench configuration flags.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...ugfix-segfault-after-configuration-errors.patch | 90 ----------------------
 .../rsyslog/rsyslog/CVE-2017-12588.patch           | 40 ----------
 .../{rsyslog_8.22.0.bb => rsyslog_8.29.0.bb}       |  8 +-
 3 files changed, 3 insertions(+), 135 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-core-bugfix-segfault-after-configuration-errors.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.22.0.bb => rsyslog_8.29.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-core-bugfix-segfault-after-configuration-errors.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-core-bugfix-segfault-after-configuration-errors.patch
deleted file mode 100644
index 189ca65..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-core-bugfix-segfault-after-configuration-errors.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 6d258339802cb9f13d8a4a157a4b74eccb902d8f Mon Sep 17 00:00:00 2001
-From: Rainer Gerhards <rgerhards@adiscon.com>
-Date: Mon, 17 Jul 2017 15:36:32 +0200
-Subject: [PATCH] core bugfix: segfault after configuration errors
-
-rsyslog will segfault on startup if
-a) the local machine's hostname is set to a non-FQDN name
-b) the getaddrinfo() system call fails
-This scenario is higly unlikely, but may exist especially with
-provisioned VMs which may not properly be able to do name queries
-on startup (seen for example on AWS).
-
-This patch fixes the situation and also provides more robustness
-for very early startup error messages when some of the error-reporting
-subsystem is not yet properly initialized. Note that under these
-circumstances, errors may only show up on stderr.
-
-Upstream status: Backport
-
-closes https://github.com/rsyslog/rsyslog/issues/1573
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- runtime/prop.c   |  6 ++++++
- tools/rsyslogd.c | 17 +++++++++--------
- 2 files changed, 15 insertions(+), 8 deletions(-)
-
-diff --git a/runtime/prop.c b/runtime/prop.c
-index e5b4693..cb93285 100644
---- a/runtime/prop.c
-+++ b/runtime/prop.c
-@@ -133,7 +133,13 @@ propConstructFinalize(prop_t __attribute__((unused)) *pThis)
-  */
- static rsRetVal AddRef(prop_t *pThis)
- {
-+	if(pThis == NULL)  {
-+		DBGPRINTF("prop/AddRef is passed a NULL ptr - ignoring it "
-+			"- further problems may occur\n");
-+		FINALIZE;
-+	}
- 	ATOMIC_INC(&pThis->iRefCount, &pThis->mutRefCount);
-+finalize_it:
- 	return RS_RET_OK;
- }
- 
-diff --git a/tools/rsyslogd.c b/tools/rsyslogd.c
-index 759d293..6aa1487 100644
---- a/tools/rsyslogd.c
-+++ b/tools/rsyslogd.c
-@@ -808,9 +808,11 @@ logmsgInternal(int iErr, const syslog_pri_t pri, const uchar *const msg, int fla
- 	 * permits us to process unmodified config files which otherwise contain a
- 	 * supressor statement.
- 	 */
--	if(((Debug == DEBUG_FULL || !doFork) && ourConf->globals.bErrMsgToStderr) || iConfigVerify) {
-+	int emit_to_stderr = (ourConf == NULL) ? 1 : ourConf->globals.bErrMsgToStderr;
-+	if(((Debug == DEBUG_FULL || !doFork) && emit_to_stderr) || iConfigVerify) {
- 		if(pri2sev(pri) == LOG_ERR)
--			fprintf(stderr, "rsyslogd: %s\n", (bufModMsg == NULL) ? (char*)msg : bufModMsg);
-+			fprintf(stderr, "rsyslogd: %s\n",
-+				(bufModMsg == NULL) ? (char*)msg : bufModMsg);
- 	}
- 
- finalize_it:
-@@ -1115,18 +1117,17 @@ initAll(int argc, char **argv)
- 
- 	/* doing some core initializations */
- 
--	/* get our host and domain names - we need to do this early as we may emit
--	 * error log messages, which need the correct hostname. -- rgerhards, 2008-04-04
--	 */
--	queryLocalHostname();
--
--	/* initialize the objects */
- 	if((iRet = modInitIminternal()) != RS_RET_OK) {
- 		fprintf(stderr, "fatal error: could not initialize errbuf object (error code %d).\n",
- 			iRet);
- 		exit(1); /* "good" exit, leaving at init for fatal error */
- 	}
- 
-+	/* get our host and domain names - we need to do this early as we may emit
-+	 * error log messages, which need the correct hostname. -- rgerhards, 2008-04-04
-+	 * But we need to have imInternal up first!
-+	 */
-+	queryLocalHostname();
- 
- 	/* END core initializations - we now come back to carrying out command line options*/
- 
--- 
-2.10.2
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch
deleted file mode 100644
index 73c3310..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/CVE-2017-12588.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 6bc4aa975a83abed43d734299ce76cd9e1a14aec Mon Sep 17 00:00:00 2001
-From: Thomas Deutschmann <whissi@whissi.de>
-Date: Wed, 17 May 2017 23:05:24 +0200
-Subject: [PATCH] imzmq3: Fix building with -Werror=format-security
-
-Reference: https://nvd.nist.gov/vuln/detail/CVE-2017-12588
-
-CVE: 2017-12588
-
-Upstream-Status: Backport
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- contrib/imzmq3/imzmq3.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/contrib/imzmq3/imzmq3.c b/contrib/imzmq3/imzmq3.c
-index 9ca17871..d32dcbc2 100644
---- a/contrib/imzmq3/imzmq3.c
-+++ b/contrib/imzmq3/imzmq3.c
-@@ -403,7 +403,7 @@ static rsRetVal createSocket(instanceConf_t* info, void** sock) {
- 
-     /* Do the bind/connect... */
-     if (info->action==ACTION_CONNECT) {
--        rv = zsocket_connect(*sock, info->description);
-+        rv = zsocket_connect(*sock, "%s", info->description);
-         if (rv == -1) {
-             errmsg.LogError(0,
-                             RS_RET_INVALID_PARAMS,
-@@ -413,7 +413,7 @@ static rsRetVal createSocket(instanceConf_t* info, void** sock) {
-         }
-         DBGPRINTF("imzmq3: connect for %s successful\n",info->description);
-     } else {
--        rv = zsocket_bind(*sock, info->description);
-+        rv = zsocket_bind(*sock, "%s", info->description);
-         if (rv == -1) {
-             errmsg.LogError(0,
-                             RS_RET_INVALID_PARAMS,
--- 
-2.13.0
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb
index 597a0c8..7056e1c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.29.0.bb
@@ -24,8 +24,6 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
            file://rsyslog-fix-ptest-not-finish.patch \
-           file://CVE-2017-12588.patch \
-           file://0001-core-bugfix-segfault-after-configuration-errors.patch \
 "
 
 SRC_URI_append_libc-musl = " \
@@ -33,8 +31,8 @@ SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "ad0f25f429aa2daa326732950a5eeb6c"
-SRC_URI[sha256sum] = "06e2884181333dccecceaca82827ae24ca7a258b4fbf7b1e07a80d4caae640ca"
+SRC_URI[md5sum] = "3805617f65a4b4bea34606487a5255a0"
+SRC_URI[sha256sum] = "220ba30b5afb0f3ddb328613fea7aa3966b01e4d0c52d6de9ab27b0858f19738"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 
@@ -57,7 +55,7 @@ PACKAGECONFIG[klog] = "--enable-klog,--disable-klog,,"
 PACKAGECONFIG[regexp] = "--enable-regexp,--disable-regexp,,"
 PACKAGECONFIG[uuid] = "--enable-uuid,--disable-uuid,util-linux,"
 PACKAGECONFIG[libgcrypt] = "--enable-libgcrypt,--disable-libgcrypt,libgcrypt,"
-PACKAGECONFIG[testbench] = "--enable-testbench,--disable-testbench,,"
+PACKAGECONFIG[testbench] = "--enable-testbench --enable-omstdout,--disable-testbench --disable-omstdout,,"
 
 # default no in configure
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
-- 
2.7.4


