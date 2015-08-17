Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46B2F767B6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 09:55:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H9t2BE011382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:55:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Mon, 17 Aug 2015 02:55:02 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Aug 2015 17:51:18 +0800
Message-ID: <1439805078-23359-3-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439805078-23359-1-git-send-email-rongqing.li@windriver.com>
References: <1439805078-23359-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3][meta-oe] rsyslog: upgrade to 7.6.1
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
X-List-Received-Date: Mon, 17 Aug 2015 09:55:03 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. remove two backport patch: 0001-bugfix-potential-abort-during-HUP.patch
and 0001-remove-memleak-introduced-by-GenerateLocalHostName-H.patch
2. update the patch json-0.12-fix.patch
3. remove a obsolete patch rsyslog-use-serial-tests-config-needed-by-ptest.patch
4. update the Dependence
5. update the checksum

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-bugfix-potential-abort-during-HUP.patch   |  91 ------------------
 ...eak-introduced-by-GenerateLocalHostName-H.patch | 103 ---------------------
 .../rsyslog/rsyslog/json-0.12-fix.patch            |  18 ++--
 ...g-use-serial-tests-config-needed-by-ptest.patch |  28 ------
 .../rsyslog/{rsyslog_7.4.4.bb => rsyslog_7.6.1.bb} |  11 +--
 5 files changed, 14 insertions(+), 237 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-bugfix-potential-abort-during-HUP.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-remove-memleak-introduced-by-GenerateLocalHostName-H.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-use-serial-tests-config-needed-by-ptest.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_7.4.4.bb => rsyslog_7.6.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-bugfix-potential-abort-during-HUP.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-bugfix-potential-abort-during-HUP.patch
deleted file mode 100644
index 14e8b3f..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-bugfix-potential-abort-during-HUP.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 9a775051f7373176c6e54bee1110965342dd41ad Mon Sep 17 00:00:00 2001
-From: Rainer Gerhards <rgerhards@adiscon.com>
-Date: Mon, 28 Oct 2013 12:56:02 +0100
-Subject: [PATCH] bugfix: potential abort during HUP
-
-This could happen when one of imklog, imzmq3, imkmsg, impstats,
-imjournal, or imuxsock were under heavy load during a HUP.
-closes: http://bugzilla.adiscon.com/show_bug.cgi?id=489
-Thanks to Guy Rozendorn for reporting the problem and Peval Levhshin for
-his analysis.
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- ChangeLog      |    6 ++++++
- runtime/glbl.c |   25 ++++++++++++++++++-------
- 2 files changed, 24 insertions(+), 7 deletions(-)
-
-Index: rsyslog-7.4.4/ChangeLog
-===================================================================
---- rsyslog-7.4.4.orig/ChangeLog
-+++ rsyslog-7.4.4/ChangeLog
-@@ -1,5 +1,11 @@
- ---------------------------------------------------------------------------
- Version 7.4.4  [v7.4-stable] 2013-09-03
-+- bugfix: potential abort during HUP
-+  This could happen when one of imklog, imzmq3, imkmsg, impstats,
-+  imjournal, or imuxsock were under heavy load during a HUP.
-+  closes: http://bugzilla.adiscon.com/show_bug.cgi?id=489
-+  Thanks to Guy Rozendorn for reporting the problem and Peval Levhshin for
-+  his analysis.
- - better error messages in GuardTime signature provider
-   Thanks to Ahto Truu for providing the patch.
- - make rsyslog use the new json-c pkgconfig file if available
-Index: rsyslog-7.4.4/runtime/glbl.c
-===================================================================
---- rsyslog-7.4.4.orig/runtime/glbl.c
-+++ rsyslog-7.4.4/runtime/glbl.c
-@@ -32,6 +32,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <unistd.h>
-+#include <pthread.h>
- #include <assert.h>
- 
- #include "rsyslog.h"
-@@ -379,17 +380,24 @@ GetLocalDomain(void)
- /* generate the local hostname property. This must be done after the hostname info
-  * has been set as well as PreserveFQDN.
-  * rgerhards, 2009-06-30
-+ * NOTE: This function DELIBERATELY introduces a small memory leak in order to gain
-+ * speed. Each time it is called when a property name already exists, a new one is
-+ * allocated but the previous one is NOT freed. This is so that current readers can
-+ * continue to use the previous name. Otherwise, we would need to use read/write locks
-+ * to protect the update process. As this function is called extremely infrequently and
-+ * the memory leak is very small, this is totally accessible. Think that otherwise we
-+ * would need to place a read look each time the property is read, which is much more
-+ * frequent (once per message for the modules that use this local hostname!).
-+ * rgerhards, 2013-10-28
-  */
- static rsRetVal
- GenerateLocalHostNameProperty(void)
- {
--	DEFiRet;
-+	prop_t *hostnameNew;
- 	uchar *pszName;
-+	DEFiRet;
- 
--	if(propLocalHostName != NULL)
--		prop.Destruct(&propLocalHostName);
--
--	CHKiRet(prop.Construct(&propLocalHostName));
-+	CHKiRet(prop.Construct(&hostnameNew));
- 	if(LocalHostNameOverride == NULL) {
- 		if(LocalHostName == NULL)
- 			pszName = (uchar*) "[localhost]";
-@@ -403,8 +411,11 @@ GenerateLocalHostNameProperty(void)
- 		pszName = LocalHostNameOverride;
- 	}
- 	DBGPRINTF("GenerateLocalHostName uses '%s'\n", pszName);
--	CHKiRet(prop.SetString(propLocalHostName, pszName, ustrlen(pszName)));
--	CHKiRet(prop.ConstructFinalize(propLocalHostName));
-+	CHKiRet(prop.SetString(hostnameNew, pszName, ustrlen(pszName)));
-+	CHKiRet(prop.ConstructFinalize(hostnameNew));
-+
-+	propLocalHostName = hostnameNew;
-+	/* inititional MEM LEAK for old value -- see function hdr comment! */
- 
- finalize_it:
- 	RETiRet;
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-remove-memleak-introduced-by-GenerateLocalHostName-H.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-remove-memleak-introduced-by-GenerateLocalHostName-H.patch
deleted file mode 100644
index fcc5d8e..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-remove-memleak-introduced-by-GenerateLocalHostName-H.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 17e1ee2539cea6bac16832b488afd52b20a348ac Mon Sep 17 00:00:00 2001
-From: Rainer Gerhards <rgerhards@adiscon.com>
-Date: Mon, 28 Oct 2013 14:17:56 +0100
-Subject: [PATCH] remove memleak introduced by GenerateLocalHostName HUP
- bugfix
-
-Upstream-Status: backport
-
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- runtime/glbl.c |   45 ++++++++++++++++++++++++++++++++-------------
- 1 file changed, 32 insertions(+), 13 deletions(-)
-
-diff --git a/runtime/glbl.c b/runtime/glbl.c
-index bcb3795..41d56c2 100644
---- a/runtime/glbl.c
-+++ b/runtime/glbl.c
-@@ -72,6 +72,7 @@ static int option_DisallowWarning = 1;	/* complain if message from disallowed se
- static int bDisableDNS = 0; /* don't look up IP addresses of remote messages */
- static prop_t *propLocalIPIF = NULL;/* IP address to report for the local host (default is 127.0.0.1) */
- static prop_t *propLocalHostName = NULL;/* our hostname as FQDN - read-only after startup */
-+static prop_t *propLocalHostNameToDelete = NULL;/* see GenerateLocalHostName function hdr comment! */
- static uchar *LocalHostName = NULL;/* our hostname  - read-only after startup, except HUP */
- static uchar *LocalHostNameOverride = NULL;/* user-overridden hostname - read-only after startup */
- static uchar *LocalFQDNName = NULL;/* our hostname as FQDN - read-only after startup, except HUP */
-@@ -380,24 +381,31 @@ GetLocalDomain(void)
- /* generate the local hostname property. This must be done after the hostname info
-  * has been set as well as PreserveFQDN.
-  * rgerhards, 2009-06-30
-- * NOTE: This function DELIBERATELY introduces a small memory leak in order to gain
-- * speed. Each time it is called when a property name already exists, a new one is
-- * allocated but the previous one is NOT freed. This is so that current readers can
-- * continue to use the previous name. Otherwise, we would need to use read/write locks
-- * to protect the update process. As this function is called extremely infrequently and
-- * the memory leak is very small, this is totally accessible. Think that otherwise we
-- * would need to place a read look each time the property is read, which is much more
-- * frequent (once per message for the modules that use this local hostname!).
-+ * NOTE: This function tries to avoid locking by not destructing the previous value
-+ * immediately. This is so that current readers can  continue to use the previous name.
-+ * Otherwise, we would need to use read/write locks to protect the update process.
-+ * In order to do so, we save the previous value and delete it when we are called again
-+ * the next time. Note that this in theory is racy and can lead to a double-free.
-+ * In practice, however, the window of exposure to trigger this is extremely short
-+ * and as this functions is very infrequently being called (on HUP), the trigger
-+ * condition for this bug is so highly unlikely that it never occurs in practice.
-+ * Probably if you HUP rsyslog every few milliseconds, but who does that...
-+ * To further reduce risk potential, we do only update the property when there
-+ * actually is a hostname change, which makes it even less likely.
-  * rgerhards, 2013-10-28
-  */
- static rsRetVal
- GenerateLocalHostNameProperty(void)
- {
-+	uchar *pszPrev;
-+	int lenPrev;
- 	prop_t *hostnameNew;
- 	uchar *pszName;
- 	DEFiRet;
- 
--	CHKiRet(prop.Construct(&hostnameNew));
-+	if(propLocalHostNameToDelete != NULL)
-+		prop.Destruct(&propLocalHostNameToDelete);
-+
- 	if(LocalHostNameOverride == NULL) {
- 		if(LocalHostName == NULL)
- 			pszName = (uchar*) "[localhost]";
-@@ -411,11 +419,20 @@ GenerateLocalHostNameProperty(void)
- 		pszName = LocalHostNameOverride;
- 	}
- 	DBGPRINTF("GenerateLocalHostName uses '%s'\n", pszName);
--	CHKiRet(prop.SetString(hostnameNew, pszName, ustrlen(pszName)));
--	CHKiRet(prop.ConstructFinalize(hostnameNew));
- 
--	propLocalHostName = hostnameNew;
--	/* inititional MEM LEAK for old value -- see function hdr comment! */
-+	if(propLocalHostName == NULL)
-+		pszPrev = (uchar*)""; /* make sure strcmp() below does not match */
-+	else
-+		prop.GetString(propLocalHostName, &pszPrev, &lenPrev);
-+
-+	if(ustrcmp(pszPrev, pszName)) {
-+		/* we need to update */
-+		CHKiRet(prop.Construct(&hostnameNew));
-+		CHKiRet(prop.SetString(hostnameNew, pszName, ustrlen(pszName)));
-+		CHKiRet(prop.ConstructFinalize(hostnameNew));
-+		propLocalHostNameToDelete = propLocalHostName;
-+		propLocalHostName = hostnameNew;
-+	}
- 
- finalize_it:
- 	RETiRet;
-@@ -678,6 +695,8 @@ BEGINObjClassExit(glbl, OBJ_IS_CORE_MODULE) /* class, version */
- 	free(LocalHostNameOverride);
- 	free(LocalFQDNName);
- 	objRelease(prop, CORE_COMPONENT);
-+	if(propLocalHostNameToDelete != NULL)
-+		prop.Destruct(&propLocalHostNameToDelete);
- 	DESTROY_ATOMIC_HELPER_MUT(mutTerminateInputs);
- ENDObjClassExit(glbl)
- 
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch
index 7390a7f..3dd85a7 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch
@@ -13,9 +13,10 @@ json-c-0.12 unlike 0.11 doesn't install json -> json-c symlink in include
 Upstream-Status: Backport
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
-diff -uNr rsyslog-7.4.4.orig/plugins/ommongodb/ommongodb.c rsyslog-7.4.4/plugins/ommongodb/ommongodb.c
---- rsyslog-7.4.4.orig/plugins/ommongodb/ommongodb.c	2013-09-03 11:54:20.000000000 +0200
-+++ rsyslog-7.4.4/plugins/ommongodb/ommongodb.c	2015-01-12 16:11:51.542591825 +0100
+diff --git a/plugins/ommongodb/ommongodb.c b/plugins/ommongodb/ommongodb.c
+index 41c0d76..682c40e 100644
+--- a/plugins/ommongodb/ommongodb.c
++++ b/plugins/ommongodb/ommongodb.c
 @@ -33,9 +33,9 @@
  #include <stdint.h>
  #include <time.h>
@@ -23,14 +24,15 @@ diff -uNr rsyslog-7.4.4.orig/plugins/ommongodb/ommongodb.c rsyslog-7.4.4/plugins
 -#include <json.h>
 +#include <json-c/json.h>
  /* For struct json_object_iter, should not be necessary in future versions */
--#include <json/json_object_private.h>
+-#include <json_object_private.h>
 +#include <json-c/json_object_private.h>
  
  #include "rsyslog.h"
  #include "conf.h"
-diff -uNr rsyslog-7.4.4.orig/runtime/msg.c rsyslog-7.4.4/runtime/msg.c
---- rsyslog-7.4.4.orig/runtime/msg.c	2013-09-03 12:31:42.000000000 +0200
-+++ rsyslog-7.4.4/runtime/msg.c	2015-01-12 16:12:00.403592142 +0100
+diff --git a/runtime/msg.c b/runtime/msg.c
+index d04ce7b..b367e1f 100644
+--- a/runtime/msg.c
++++ b/runtime/msg.c
 @@ -41,9 +41,9 @@
  #endif
  #include <netdb.h>
@@ -38,7 +40,7 @@ diff -uNr rsyslog-7.4.4.orig/runtime/msg.c rsyslog-7.4.4/runtime/msg.c
 -#include <json.h>
 +#include <json-c/json.h>
  /* For struct json_object_iter, should not be necessary in future versions */
--#include <json/json_object_private.h>
+-#include <json_object_private.h>
 +#include <json-c/json_object_private.h>
  #if HAVE_MALLOC_H
  #  include <malloc.h>
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-use-serial-tests-config-needed-by-ptest.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-use-serial-tests-config-needed-by-ptest.patch
deleted file mode 100644
index 3a16f26..0000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog-use-serial-tests-config-needed-by-ptest.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Subject: [PATCH] rsyslog: use serial-tests config needed by ptest
-
-ptest needs buildtest-TESTS and runtest-TESTS targets.
-serial-tests is required to generate those targets.
-
-Upstream-Status: Inappropriate [default automake behavior incompatible with ptest]
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1b880f8..0e29742 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3,7 +3,7 @@
- 
- AC_PREREQ(2.61)
- AC_INIT([rsyslog],[7.4.4],[rsyslog@lists.adiscon.com])
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([serial-tests])
- 
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
--- 
-2.0.0
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
index 9c85a41..15b0f29 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.6.1.bb
@@ -9,7 +9,7 @@ Rsyslog is an enhanced syslogd supporting, among others, MySQL,\
  encryption protected syslog relay chains while at the same time being\
  very easy to setup for the novice user."
 
-DEPENDS = "zlib libestr json-c bison-native flex-native"
+DEPENDS = "zlib libestr json-c bison-native flex-native liblogging"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3 & LGPLv3 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
@@ -17,21 +17,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=51d9635e646fb75e1b74c074f788e973 \
                     file://COPYING.ASL20;md5=052f8a09206615ab07326ff8ce2d9d32\
 "
 
-SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://initscript \
            file://rsyslog.conf \
            file://rsyslog.logrotate \
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
            file://rsyslog-fix-ptest-not-finish.patch \
-           file://rsyslog-use-serial-tests-config-needed-by-ptest.patch \
            file://json-0.12-fix.patch \
-           file://0001-bugfix-potential-abort-during-HUP.patch \
-           file://0001-remove-memleak-introduced-by-GenerateLocalHostName-H.patch \
 "
 
-SRC_URI[md5sum] = "ebcc010a6205c28eb505c0fe862f32c6"
-SRC_URI[sha256sum] = "276d094d1e4c62c770ec8a72723667f119eee038912b79cf3337d439bc2f9087"
+SRC_URI[md5sum] = "093c462a5245012bd9e7b82dd8aedffb"
+SRC_URI[sha256sum] = "357f089d866c351d5fe5b7139fa85b010223d77b3c21f29b2a1baa8688926111"
 
 inherit autotools pkgconfig systemd update-rc.d update-alternatives ptest
 
-- 
1.9.1


