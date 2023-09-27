Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069E9E80AAB
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 14:00:33 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.18261.1695823227999367475
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 07:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NfTHxZAR;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-d86a0c97ae6so7955635276.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695823227; x=1696428027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fk5Ch/GSZHJ0snJs48VulbXZ1AdiDuT7jQWTFGBgPN4=;
        b=NfTHxZARJ3UHOuU86EMo5xF2fg8lvTsMhYnkMzBXioDiyGsn1jlsztR6Goaqjwauwe
         l2tn1Cm3XRfpd9KfwFRLIyTGxznVOLKO+bl2iwASZGpvRSn5fj7/7mBuFdsW0YpExR+5
         gGRYSEw5hnNvkP8sXbfSndtzv/rrFhZPmIJcN7JCIzEiZyBM6BU5N3LVR3wUV7SwCAGZ
         j1TNUWJu86wjrwcpPUgM7v0z49Fya3f4XulyInTJsoKCyY3xdF0bUNp8v2z9V+Nunx1M
         UfQlr3vbf3VrO5AURl8yftyiue5DA+s/o29/w+wwJ+iNl/Plj6hNVMJQNUXu7M6//9R8
         CyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695823227; x=1696428027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fk5Ch/GSZHJ0snJs48VulbXZ1AdiDuT7jQWTFGBgPN4=;
        b=GyZjXfzF8XTmK6rpyd6VCJHJxarSy68huHZTy9pFqxORJ1B4nQq6wf8cB/eGhZAjVh
         aGqzlafvtNwQKHx6LH+QySrsiovr9g1rlZvnMe+19N/iwpy5iHj0lMYqrwE8uwBYxBsT
         DtUZyB03wGEQkAh3k8hwmWFboZOTECfL9Z7Er4FfX2wzADdlqJngdAkuVbjvqX/zI5dx
         saXUnpGop5kL8J9sSKCCz6gopv9WjdLxABGK7/wtzSIS2LAtRrEFsNfEWF8utz7BqHHE
         49ByRCdG381OWn47RJu5T963MBMk/L8waKuSNCmVAwR1SHHJP8lQ5PNc+rPr6cyzjCMy
         UXgA==
X-Gm-Message-State: AOJu0Yx+rOHu2PrSPARshktMNRf+A6DwuODDU5V9cN0abu+Y/PWGiCwK
	+U2mLQGdHMd18C96Lk0nXxz1xQ7C5+E=
X-Google-Smtp-Source: AGHT+IEn73BkJAG1qbu+uCf9tMtzDBj6dtCgzIv1jH4xx8otPYheS9oXpeBgjXhl8Ik9VEFzPS5Gzw==
X-Received: by 2002:a25:7751:0:b0:d84:e754:d541 with SMTP id s78-20020a257751000000b00d84e754d541mr2429076ybc.4.1695823226716;
        Wed, 27 Sep 2023 07:00:26 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:961:fe0e:be52:568a])
        by smtp.gmail.com with ESMTPSA id w8-20020a25ac08000000b00d7b957d8ed9sm3388704ybi.17.2023.09.27.07.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 07:00:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] openldap: update to 2.5.16
Date: Wed, 27 Sep 2023 10:00:25 -0400
Message-Id: <20230927140025.1276277-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 14:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105192

2.5.x is an LTS version per the project.
Drop patch now included.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...if-filter-fix-parallel-build-failure.patch | 32 --------
 ...-Makefile.in-ignore-the-mkdir-errors.patch | 33 --------
 ...de-ldap_pvt_thread.h-before-redefini.patch | 54 -------------
 .../openldap/openldap/CVE-2023-2953-1.patch   | 30 --------
 .../openldap/openldap/CVE-2023-2953-2.patch   | 76 -------------------
 ...{openldap_2.5.12.bb => openldap_2.5.16.bb} |  7 +-
 6 files changed, 1 insertion(+), 231 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
 rename meta-oe/recipes-support/openldap/{openldap_2.5.12.bb => openldap_2.5.16.bb} (96%)

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch b/meta-oe/recipes-support/openldap/openldap/0001-ldif-filter-fix-parallel-build-failure.patch
deleted file mode 100644
index b42bd9764f..0000000000
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
index 552726bb0a..0000000000
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
index bcd1525b67..0000000000
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
diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
deleted file mode 100644
index 2517dac334..0000000000
--- a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-1.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ea8dd2d279c5aeaf9d4672a4e95bebd99babcce1 Mon Sep 17 00:00:00 2001
-From: Howard Chu <hyc@openldap.org>
-Date: Wed, 24 Aug 2022 14:40:51 +0100
-Subject: [PATCH] ITS#9904 ldif_open_url: check for ber_strdup failure
-
-Code present since 1999, df8f7cbb9b79be3be9205d116d1dd0b263d6861a
-
-Upstream-Status: Backport [https://git.openldap.org/openldap/openldap/-/commit/752d320cf96e46f24c0900f1a8f6af0a3fc3c4ce]
-CVE: CVE-2023-2953
-Signed-off-by: Ashish Sharma <asharma@mvista.com>
----
- libraries/libldap/fetch.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libraries/libldap/fetch.c b/libraries/libldap/fetch.c
-index 9e426dc647..536871bcfe 100644
---- a/libraries/libldap/fetch.c
-+++ b/libraries/libldap/fetch.c
-@@ -69,6 +69,8 @@ ldif_open_url(
- 		}
- 
- 		p = ber_strdup( urlstr );
-+		if ( p == NULL )
-+			return NULL;
- 
- 		/* But we should convert to LDAP_DIRSEP before use */
- 		if ( LDAP_DIRSEP[0] != '/' ) {
--- 
-GitLab
-
diff --git a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch b/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
deleted file mode 100644
index 2f24df9266..0000000000
--- a/meta-oe/recipes-support/openldap/openldap/CVE-2023-2953-2.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 3f2abd0b2eeec8522e50d5c4ea4992e70e8f9915 Mon Sep 17 00:00:00 2001
-From: Howard Chu <hyc@openldap.org>
-Date: Thu, 25 Aug 2022 16:13:21 +0100
-Subject: [PATCH] ITS#9904 ldap_url_parsehosts: check for strdup failure
-
-Avoid unnecessary strdup in IPv6 addr parsing, check for strdup
-failure when dup'ing scheme.
-
-Code present since 2000, 8da110a9e726dbc612b302feafe0109271e6bc59
-
-Upstream-Status: Backport [https://git.openldap.org/openldap/openldap/-/commit/6563fab9e2feccb0a684d0398e78571d09fb808b]
-CVE: CVE-2023-2953
-Signed-off-by: Ashish Sharma <asharma@mvista.com>
----
- libraries/libldap/url.c | 21 ++++++++++++---------
- 1 file changed, 12 insertions(+), 9 deletions(-)
-
-diff --git a/libraries/libldap/url.c b/libraries/libldap/url.c
-index 7e56564265..8df0abd044 100644
---- a/libraries/libldap/url.c
-+++ b/libraries/libldap/url.c
-@@ -1386,24 +1386,22 @@ ldap_url_parsehosts(
- 		}
- 		ludp->lud_port = port;
- 		ludp->lud_host = specs[i];
--		specs[i] = NULL;
- 		p = strchr(ludp->lud_host, ':');
- 		if (p != NULL) {
- 			/* more than one :, IPv6 address */
- 			if ( strchr(p+1, ':') != NULL ) {
- 				/* allow [address] and [address]:port */
- 				if ( *ludp->lud_host == '[' ) {
--					p = LDAP_STRDUP(ludp->lud_host+1);
--					/* copied, make sure we free source later */
--					specs[i] = ludp->lud_host;
--					ludp->lud_host = p;
--					p = strchr( ludp->lud_host, ']' );
-+					p = strchr( ludp->lud_host+1, ']' );
- 					if ( p == NULL ) {
- 						LDAP_FREE(ludp);
- 						ldap_charray_free(specs);
- 						return LDAP_PARAM_ERROR;
- 					}
--					*p++ = '\0';
-+					/* Truncate trailing ']' and shift hostname down 1 char */
-+					*p = '\0';
-+					AC_MEMCPY( ludp->lud_host, ludp->lud_host+1, p - ludp->lud_host );
-+					p++;
- 					if ( *p != ':' ) {
- 						if ( *p != '\0' ) {
- 							LDAP_FREE(ludp);
-@@ -1429,14 +1427,19 @@ ldap_url_parsehosts(
- 				}
- 			}
- 		}
--		ldap_pvt_hex_unescape(ludp->lud_host);
- 		ludp->lud_scheme = LDAP_STRDUP("ldap");
-+		if ( ludp->lud_scheme == NULL ) {
-+			LDAP_FREE(ludp);
-+			ldap_charray_free(specs);
-+			return LDAP_NO_MEMORY;
-+		}
-+		specs[i] = NULL;
-+		ldap_pvt_hex_unescape(ludp->lud_host);
- 		ludp->lud_next = *ludlist;
- 		*ludlist = ludp;
- 	}
- 
- 	/* this should be an array of NULLs now */
--	/* except entries starting with [ */
- 	ldap_charray_free(specs);
- 	return LDAP_SUCCESS;
- }
--- 
-GitLab
-
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb b/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
similarity index 96%
rename from meta-oe/recipes-support/openldap/openldap_2.5.12.bb
rename to meta-oe/recipes-support/openldap/openldap_2.5.16.bb
index cd29760b8c..9e9d05917d 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.12.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.16.bb
@@ -19,15 +19,10 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://initscript \
     file://slapd.service \
     file://remove-user-host-pwd-from-version.patch \
-    file://0001-ldif-filter-fix-parallel-build-failure.patch \
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
-    file://0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch \
-    file://0001-librewrite-include-ldap_pvt_thread.h-before-redefini.patch \
-    file://CVE-2023-2953-1.patch \
-    file://CVE-2023-2953-2.patch \
 "
 
-SRC_URI[sha256sum] = "d5086cbfc49597fa7d0670a429a9054552d441b16ee8b2435412797ab0e37b96"
+SRC_URI[sha256sum] = "546ba591822e8bb0e467d40c4d4a30f89d937c3a507fe83a578f582f6a211327"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.34.1


