Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A992C77B7A
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 06:55:09 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.2932.1686034500007189513
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 23:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="98955709"
X-IronPort-AV: E=Sophos;i="6.00,219,1681138800"; 
   d="scan'208";a="98955709"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 15:54:57 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37FAECA1E9
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Jun 2023 15:54:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B690D88B0
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Jun 2023 15:54:54 +0900 (JST)
Received: from ubuntu20.g08.fujitsu.local (unknown [10.167.225.227])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 17B9F2007472C;
	Tue,  6 Jun 2023 15:54:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>,
	Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] dovecot: Fix install conflict when  enable multilib.
Date: Tue,  6 Jun 2023 14:54:50 +0800
Message-Id: <20230606065450.766061-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27674.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27674.005
X-TMASE-Result: 10--7.847100-10.000000
X-TMASE-MatchedRID: TvBNXvLpXm+ZxQ0LLmG+f79A3Bl1/DcV4y6x6rwIkstHpEd1UrzmFS2i
	kZ6i+33cFK7ef+hAE5nOkqBOmxsNEwV6K461K3zK/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQfiq
	1gj2xET/gK2NiZClvaaRQhplL2ywrlwV2iaAfSWcURSScn+QSXt0H8LFZNFG7bkV4e2xSge6wpy
	KR/6c3FD2gA9HrAVRokGcYl+i4Obwszuq8rhdLMkuFvzEYSdV+
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jun 2023 06:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103133

From: Lei Maohui <leimaohui@fujitsu.com>

There's conflict of config.h between dovecot and lib32-dovecot.

The differences of config-64.h and config-32.h are as follows:
@@ -774,7 +774,7 @@
#define MODULE_SUFFIX ".so"

 

/* Maximum value of off_t */
-#define OFF_T_MAX LONG_MAX
+#define OFF_T_MAX LLONG_MAX

 

/* Name of package */
#define PACKAGE "dovecot"
@@ -834,7 +834,7 @@
#define PRIdTIME_T "ld"

 

/* printf() format for uoff_t */
-#define PRIuUOFF_T "lu"
+#define PRIuUOFF_T "llu"

 

/* printf() fmt for hex time_t */
#define PRIxTIME_T "lx"
@@ -846,19 +846,19 @@
#define SIZEOF_INT 4

 

/* The size of `long', as computed by sizeof. */
-#define SIZEOF_LONG 8
+#define SIZEOF_LONG 4

 

/* The size of `long long', as computed by sizeof. */
#define SIZEOF_LONG_LONG 8

 

/* The size of `void *', as computed by sizeof. */
-#define SIZEOF_VOID_P 8
+#define SIZEOF_VOID_P 4

 

/* Build SQL drivers as plugins */
/* #undef SQL_DRIVER_PLUGINS */

 

/* Maximum value of ssize_t */
-#define SSIZE_T_MAX LONG_MAX
+#define SSIZE_T_MAX INT_MAX

 

/* C99 static array */
#define STATIC_ARRAY static
@@ -887,13 +887,13 @@
/* #undef UOFF_T_INT */

 

/* Define if off_t is long */
-#define UOFF_T_LONG /**/
+/* #undef UOFF_T_LONG */

 

/* Define if off_t is long long */
-/* #undef UOFF_T_LONG_LONG */
+#define UOFF_T_LONG_LONG /**/

 

/* Maximum value of uoff_t */
-#define UOFF_T_MAX ULONG_MAX
+#define UOFF_T_MAX ULLONG_MAX

 

/* Build with checkpassword userdb support */
#define USERDB_CHECKPASSWORD /**/
@@ -935,7 +935,7 @@
#endif

 

/* Number of bits in a file offset, on hosts where this is settable. */
-/* #undef _FILE_OFFSET_BITS */
+#define _FILE_OFFSET_BITS 64

 

/* Define for large files, on AIX-style hosts. */
/* #undef _LARGE_FILES */

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
index effde16a9..01e060e2f 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.20.bb
@@ -18,7 +18,7 @@ DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LDFLAGS += "-ltirpc"
 
-inherit autotools pkgconfig systemd useradd gettext
+inherit autotools pkgconfig systemd useradd gettext multilib_header
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ldap pam systemd', d)}"
 
@@ -56,6 +56,7 @@ do_install:append () {
         sed -i -e 's#@SYSCONFDIR@#${sysconfdir}#g' ${D}${systemd_unitdir}/system/dovecot.service
         sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/dovecot.service
     fi
+    oe_multilib_header dovecot/config.h
 }
 
 USERADD_PACKAGES = "${PN}"
-- 
2.34.1


