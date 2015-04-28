Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6006A73D53
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 08:03:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3S83J7m026500
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 01:03:20 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 28 Apr 2015 01:03:19 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Apr 2015 16:03:09 +0800
Message-ID: <1430208189-4312-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [meta-oe][PATCH] rsyslogd: Backport upstream commits to fix rsyslog segmentation fault when heavy load
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Apr 2015 08:03:24 -0000
Content-Type: text/plain

Backport <commit 9a775051f7373176c6e54bee1110965342dd41ad> and
<commit 17e1ee2539cea6bac16832b488afd52b20a348ac> from rsyslog
upstream <https://github.com/rsyslog/rsyslog> to solve issue:
rsyslog segmentation fault when heavy load.
Solve the race condition in GenerateLocalHostNameProperty between the
prop.Destruct(&propLocalHostName) and prop.Construct(&propLocalHostName).

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../0001-bugfix-potential-abort-during-HUP.patch   |   91 +++++++++++++++++
 ...eak-introduced-by-GenerateLocalHostName-H.patch |  103 ++++++++++++++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb  |    2 +
 3 files changed, 196 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-bugfix-potential-abort-during-HUP.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-remove-memleak-introduced-by-GenerateLocalHostName-H.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-bugfix-potential-abort-during-HUP.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-bugfix-potential-abort-during-HUP.patch
new file mode 100644
index 0000000..14e8b3f
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-bugfix-potential-abort-during-HUP.patch
@@ -0,0 +1,91 @@
+From 9a775051f7373176c6e54bee1110965342dd41ad Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Mon, 28 Oct 2013 12:56:02 +0100
+Subject: [PATCH] bugfix: potential abort during HUP
+
+This could happen when one of imklog, imzmq3, imkmsg, impstats,
+imjournal, or imuxsock were under heavy load during a HUP.
+closes: http://bugzilla.adiscon.com/show_bug.cgi?id=489
+Thanks to Guy Rozendorn for reporting the problem and Peval Levhshin for
+his analysis.
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ ChangeLog      |    6 ++++++
+ runtime/glbl.c |   25 ++++++++++++++++++-------
+ 2 files changed, 24 insertions(+), 7 deletions(-)
+
+Index: rsyslog-7.4.4/ChangeLog
+===================================================================
+--- rsyslog-7.4.4.orig/ChangeLog
++++ rsyslog-7.4.4/ChangeLog
+@@ -1,5 +1,11 @@
+ ---------------------------------------------------------------------------
+ Version 7.4.4  [v7.4-stable] 2013-09-03
++- bugfix: potential abort during HUP
++  This could happen when one of imklog, imzmq3, imkmsg, impstats,
++  imjournal, or imuxsock were under heavy load during a HUP.
++  closes: http://bugzilla.adiscon.com/show_bug.cgi?id=489
++  Thanks to Guy Rozendorn for reporting the problem and Peval Levhshin for
++  his analysis.
+ - better error messages in GuardTime signature provider
+   Thanks to Ahto Truu for providing the patch.
+ - make rsyslog use the new json-c pkgconfig file if available
+Index: rsyslog-7.4.4/runtime/glbl.c
+===================================================================
+--- rsyslog-7.4.4.orig/runtime/glbl.c
++++ rsyslog-7.4.4/runtime/glbl.c
+@@ -32,6 +32,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
++#include <pthread.h>
+ #include <assert.h>
+ 
+ #include "rsyslog.h"
+@@ -379,17 +380,24 @@ GetLocalDomain(void)
+ /* generate the local hostname property. This must be done after the hostname info
+  * has been set as well as PreserveFQDN.
+  * rgerhards, 2009-06-30
++ * NOTE: This function DELIBERATELY introduces a small memory leak in order to gain
++ * speed. Each time it is called when a property name already exists, a new one is
++ * allocated but the previous one is NOT freed. This is so that current readers can
++ * continue to use the previous name. Otherwise, we would need to use read/write locks
++ * to protect the update process. As this function is called extremely infrequently and
++ * the memory leak is very small, this is totally accessible. Think that otherwise we
++ * would need to place a read look each time the property is read, which is much more
++ * frequent (once per message for the modules that use this local hostname!).
++ * rgerhards, 2013-10-28
+  */
+ static rsRetVal
+ GenerateLocalHostNameProperty(void)
+ {
+-	DEFiRet;
++	prop_t *hostnameNew;
+ 	uchar *pszName;
++	DEFiRet;
+ 
+-	if(propLocalHostName != NULL)
+-		prop.Destruct(&propLocalHostName);
+-
+-	CHKiRet(prop.Construct(&propLocalHostName));
++	CHKiRet(prop.Construct(&hostnameNew));
+ 	if(LocalHostNameOverride == NULL) {
+ 		if(LocalHostName == NULL)
+ 			pszName = (uchar*) "[localhost]";
+@@ -403,8 +411,11 @@ GenerateLocalHostNameProperty(void)
+ 		pszName = LocalHostNameOverride;
+ 	}
+ 	DBGPRINTF("GenerateLocalHostName uses '%s'\n", pszName);
+-	CHKiRet(prop.SetString(propLocalHostName, pszName, ustrlen(pszName)));
+-	CHKiRet(prop.ConstructFinalize(propLocalHostName));
++	CHKiRet(prop.SetString(hostnameNew, pszName, ustrlen(pszName)));
++	CHKiRet(prop.ConstructFinalize(hostnameNew));
++
++	propLocalHostName = hostnameNew;
++	/* inititional MEM LEAK for old value -- see function hdr comment! */
+ 
+ finalize_it:
+ 	RETiRet;
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-remove-memleak-introduced-by-GenerateLocalHostName-H.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-remove-memleak-introduced-by-GenerateLocalHostName-H.patch
new file mode 100644
index 0000000..fcc5d8e
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-remove-memleak-introduced-by-GenerateLocalHostName-H.patch
@@ -0,0 +1,103 @@
+From 17e1ee2539cea6bac16832b488afd52b20a348ac Mon Sep 17 00:00:00 2001
+From: Rainer Gerhards <rgerhards@adiscon.com>
+Date: Mon, 28 Oct 2013 14:17:56 +0100
+Subject: [PATCH] remove memleak introduced by GenerateLocalHostName HUP
+ bugfix
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ runtime/glbl.c |   45 ++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 32 insertions(+), 13 deletions(-)
+
+diff --git a/runtime/glbl.c b/runtime/glbl.c
+index bcb3795..41d56c2 100644
+--- a/runtime/glbl.c
++++ b/runtime/glbl.c
+@@ -72,6 +72,7 @@ static int option_DisallowWarning = 1;	/* complain if message from disallowed se
+ static int bDisableDNS = 0; /* don't look up IP addresses of remote messages */
+ static prop_t *propLocalIPIF = NULL;/* IP address to report for the local host (default is 127.0.0.1) */
+ static prop_t *propLocalHostName = NULL;/* our hostname as FQDN - read-only after startup */
++static prop_t *propLocalHostNameToDelete = NULL;/* see GenerateLocalHostName function hdr comment! */
+ static uchar *LocalHostName = NULL;/* our hostname  - read-only after startup, except HUP */
+ static uchar *LocalHostNameOverride = NULL;/* user-overridden hostname - read-only after startup */
+ static uchar *LocalFQDNName = NULL;/* our hostname as FQDN - read-only after startup, except HUP */
+@@ -380,24 +381,31 @@ GetLocalDomain(void)
+ /* generate the local hostname property. This must be done after the hostname info
+  * has been set as well as PreserveFQDN.
+  * rgerhards, 2009-06-30
+- * NOTE: This function DELIBERATELY introduces a small memory leak in order to gain
+- * speed. Each time it is called when a property name already exists, a new one is
+- * allocated but the previous one is NOT freed. This is so that current readers can
+- * continue to use the previous name. Otherwise, we would need to use read/write locks
+- * to protect the update process. As this function is called extremely infrequently and
+- * the memory leak is very small, this is totally accessible. Think that otherwise we
+- * would need to place a read look each time the property is read, which is much more
+- * frequent (once per message for the modules that use this local hostname!).
++ * NOTE: This function tries to avoid locking by not destructing the previous value
++ * immediately. This is so that current readers can  continue to use the previous name.
++ * Otherwise, we would need to use read/write locks to protect the update process.
++ * In order to do so, we save the previous value and delete it when we are called again
++ * the next time. Note that this in theory is racy and can lead to a double-free.
++ * In practice, however, the window of exposure to trigger this is extremely short
++ * and as this functions is very infrequently being called (on HUP), the trigger
++ * condition for this bug is so highly unlikely that it never occurs in practice.
++ * Probably if you HUP rsyslog every few milliseconds, but who does that...
++ * To further reduce risk potential, we do only update the property when there
++ * actually is a hostname change, which makes it even less likely.
+  * rgerhards, 2013-10-28
+  */
+ static rsRetVal
+ GenerateLocalHostNameProperty(void)
+ {
++	uchar *pszPrev;
++	int lenPrev;
+ 	prop_t *hostnameNew;
+ 	uchar *pszName;
+ 	DEFiRet;
+ 
+-	CHKiRet(prop.Construct(&hostnameNew));
++	if(propLocalHostNameToDelete != NULL)
++		prop.Destruct(&propLocalHostNameToDelete);
++
+ 	if(LocalHostNameOverride == NULL) {
+ 		if(LocalHostName == NULL)
+ 			pszName = (uchar*) "[localhost]";
+@@ -411,11 +419,20 @@ GenerateLocalHostNameProperty(void)
+ 		pszName = LocalHostNameOverride;
+ 	}
+ 	DBGPRINTF("GenerateLocalHostName uses '%s'\n", pszName);
+-	CHKiRet(prop.SetString(hostnameNew, pszName, ustrlen(pszName)));
+-	CHKiRet(prop.ConstructFinalize(hostnameNew));
+ 
+-	propLocalHostName = hostnameNew;
+-	/* inititional MEM LEAK for old value -- see function hdr comment! */
++	if(propLocalHostName == NULL)
++		pszPrev = (uchar*)""; /* make sure strcmp() below does not match */
++	else
++		prop.GetString(propLocalHostName, &pszPrev, &lenPrev);
++
++	if(ustrcmp(pszPrev, pszName)) {
++		/* we need to update */
++		CHKiRet(prop.Construct(&hostnameNew));
++		CHKiRet(prop.SetString(hostnameNew, pszName, ustrlen(pszName)));
++		CHKiRet(prop.ConstructFinalize(hostnameNew));
++		propLocalHostNameToDelete = propLocalHostName;
++		propLocalHostName = hostnameNew;
++	}
+ 
+ finalize_it:
+ 	RETiRet;
+@@ -678,6 +695,8 @@ BEGINObjClassExit(glbl, OBJ_IS_CORE_MODULE) /* class, version */
+ 	free(LocalHostNameOverride);
+ 	free(LocalFQDNName);
+ 	objRelease(prop, CORE_COMPONENT);
++	if(propLocalHostNameToDelete != NULL)
++		prop.Destruct(&propLocalHostNameToDelete);
+ 	DESTROY_ATOMIC_HELPER_MUT(mutTerminateInputs);
+ ENDObjClassExit(glbl)
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index 5ab6a30..e1dee59 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -26,6 +26,8 @@ SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://rsyslog-fix-ptest-not-finish.patch \
            file://rsyslog-use-serial-tests-config-needed-by-ptest.patch \
            file://json-0.12-fix.patch \
+           file://0001-bugfix-potential-abort-during-HUP.patch \
+           file://0001-remove-memleak-introduced-by-GenerateLocalHostName-H.patch \
 "
 
 SRC_URI[md5sum] = "ebcc010a6205c28eb505c0fe862f32c6"
-- 
1.7.9.5


