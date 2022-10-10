Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A445FC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 09:19:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.4223.1665393576500080580
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 02:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Cq83SLBv;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 134.134.136.24, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665393576; x=1696929576;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eOZD/KtiJuVSHDSFVHcsv72hhrRZVDoCyb0cRT6z48E=;
  b=Cq83SLBvC/dGzx4KRT5eLHfI18/RRzIncUIHjQJ+dPKlIRLkNugFwoz/
   52ACA3x2aiANTz/jBuRS588dJJvf/z9vg6KD9OM6d4MrY+aU2Gqevl7UL
   88LZiFicatdFKHTd0nGqd7yDZO1fcMZUzUCVb6xGMzcQndtgpIvgp0lVD
   bqj2NNCl1qHdKxYmQrPqJr2CrZZx7Gam5Q6SbK8irNy+YJWPbkO62oXv7
   D1XyvDtydPB27hdOPbdhFFzS/JnQp8FHkFecXOR44FGvVhxsJy3rBOQ/F
   j739dBrp3/aGNs6KYZpBxYaSLd5Ebqw6gFbEGVyUtA7d/Rkg0ZHmppXnL
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="305208323"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800";
   d="scan'208";a="305208323"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 02:19:35 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="625905771"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800";
   d="scan'208";a="625905771"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 02:19:34 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [meta-oe] [PATCH] openldap: Upgrade 2.5.12 -> 2.5.13
Date: Mon, 10 Oct 2022 17:19:15 +0800
Message-Id: <20221010091915.3835426-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 09:19:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99127

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 ...if-filter-fix-parallel-build-failure.patch | 32 -----------
 ...-Makefile.in-ignore-the-mkdir-errors.patch | 33 ------------
 ...de-ldap_pvt_thread.h-before-redefini.patch | 54 -------------------
 ...{openldap_2.5.12.bb => openldap_2.5.13.bb} |  5 +-
 4 files changed, 1 insertion(+), 123 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.5.12.bb => openldap_2.5.13.bb} (97%)

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch b/meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch
deleted file mode 100644
index b42bd9764..000000000
--- a/meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 9e4ccd1e78ceac8de1ab66ee62ee216f1fbd4956 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 2 Dec 2021 11:38:15 +0800
-Subject: [PATCH] ldif-filter: fix parallel build failure
-
-Add slapd-common.o as dependency for ldif-filter to fix the parallel
-build failure:
-  ld: cannot find slapd-common.o: No such file or directory
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- tests/progs/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/progs/Makefile.in b/tests/progs/Makefile.in
-index 13f1e8be2..e4f4ccf98 100644
---- a/tests/progs/Makefile.in
-+++ b/tests/progs/Makefile.in
-@@ -56,7 +56,7 @@ slapd-modify: slapd-modify.o $(OBJS) $(XLIBS)
- slapd-bind: slapd-bind.o $(OBJS) $(XLIBS)
- 	$(LTLINK) -o $@ slapd-bind.o $(OBJS) $(LIBS)
- 
--ldif-filter: ldif-filter.o $(XLIBS)
-+ldif-filter: ldif-filter.o $(OBJS) $(XLIBS)
- 	$(LTLINK) -o $@ ldif-filter.o $(OBJS) $(LIBS)
- 
- slapd-mtread: slapd-mtread.o $(OBJS) $(XLIBS)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/openldap/openldap/0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch b/meta-oe/recipes-support/openldap/openldap/0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch
deleted file mode 100644
index 552726bb0..000000000
--- a/meta-oe/recipes-support/openldap/openldap/0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 690f69791eb6cd0d7e94b4d73219ee864de27f62 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Mon, 10 Jan 2022 10:13:51 +0800
-Subject: [PATCH] libraries/Makefile.in: ignore the mkdir errors
-
-Ignore the mkdir errors to fix the parallel build failure:
-
-../../build/shtool mkdir -p TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-wrs-linux-gnueabi/openldap/2.5.9-r0/image/usr/lib
-mkdir: cannot create directory 'TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-wrs-linux-gnueabi/openldap/2.5.9-r0/image/usr/lib': File exists
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- libraries/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libraries/Makefile.in b/libraries/Makefile.in
-index d9cb2ff..c6b251f 100644
---- a/libraries/Makefile.in
-+++ b/libraries/Makefile.in
-@@ -24,7 +24,7 @@ PKGCONFIG_DIR=$(DESTDIR)$(libdir)/pkgconfig
- PKGCONFIG_SRCDIRS=liblber libldap
- 
- install-local:
--	@$(MKDIR) $(PKGCONFIG_DIR)
-+	@-$(MKDIR) $(PKGCONFIG_DIR)
- 	@for i in $(PKGCONFIG_SRCDIRS); do \
- 	    $(INSTALL_DATA) $$i/*.pc $(PKGCONFIG_DIR); \
- 	done
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/openldap/openldap/0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch b/meta-oe/recipes-support/openldap/openldap/0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch
deleted file mode 100644
index bcd1525b6..000000000
--- a/meta-oe/recipes-support/openldap/openldap/0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 79381ab335898c9184e22dd25b544adefa9bf6c5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Feb 2022 16:26:57 -0800
-Subject: [PATCH] librewrite: include ldap_pvt_thread.h before redefining
- calloc
-
-This helps compiling with musl, where sched.h is included by
-ldap_pvt_thread.h which provides prototype for calloc() and conflicts
-
-/usr/include/sched.h:84:7: error: conflicting types for 'ber_memcalloc'
-| void *calloc(size_t, size_t);
-|       ^1
-|  warning and 1 error generated.
-| ./rewrite-int.h:44:21: note: expanded from macro 'calloc'
-| #define calloc(x,y)     ber_memcalloc(x,y)
-|                         ^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libraries/librewrite/rewrite-int.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/libraries/librewrite/rewrite-int.h b/libraries/librewrite/rewrite-int.h
-index 4481dd3..5ec226d 100644
---- a/libraries/librewrite/rewrite-int.h
-+++ b/libraries/librewrite/rewrite-int.h
-@@ -40,6 +40,11 @@
- 
- #include <rewrite.h>
- 
-+#ifndef NO_THREADS
-+#define USE_REWRITE_LDAP_PVT_THREADS
-+#include <ldap_pvt_thread.h>
-+#endif
-+
- #define malloc(x)	ber_memalloc(x)
- #define calloc(x,y)	ber_memcalloc(x,y)
- #define realloc(x,y)	ber_memrealloc(x,y)
-@@ -47,11 +52,6 @@
- #undef strdup
- #define	strdup(x)	ber_strdup(x)
- 
--#ifndef NO_THREADS
--#define USE_REWRITE_LDAP_PVT_THREADS
--#include <ldap_pvt_thread.h>
--#endif
--
- /*
-  * For details, see RATIONALE.
-  */
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb b/meta-oe/recipes-support/openldap/openldap_2.5.13.bb
similarity index 97%
rename from meta-oe/recipes-support/openldap/openldap_2.5.12.bb
rename to meta-oe/recipes-support/openldap/openldap_2.5.13.bb
index a8ea84d70..b117677f9 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.13.bb
@@ -18,14 +18,11 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://initscript \
     file://slapd.service \
     file://remove-user-host-pwd-from-version.patch \
-    file://0001-ldif-filter-fix-parallel-build-failure.patch \
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
-    file://0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch \
-    file://0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch \
     file://0001-configure-Pass-pthread_t-to-pthread_detach.patch \
 "
 
-SRC_URI[sha256sum] = "d5086cbfc49597fa7d0670a429a9054552d441b16ee8b2435412797ab0e37b96"
+SRC_URI[sha256sum] = "ee3c430c4ef7b87c57b622108c7339376d6c27fbbf2767770be3de1df63d008c"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.34.1


