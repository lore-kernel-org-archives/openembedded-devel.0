Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8210C64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:07:29 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.9002.1678352840633739922
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:07:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AIprxgx9;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678352838; i=@fujitsu.com;
	bh=2ArzVyXtGMnLAn573J4sU0xi5fa1tGalWmBdUlZyL3w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AIprxgx9lAUutYvZyUjEW0kLgImWX1kwFZYVFr+2t0MLIlrbeGc65RxLKeiUvJcJH
	 74+s9q4L54N166/9IQVttKYaW0vct6qItjF8+aCJKvAAbKQcojjDGLhJSct4vbExsU
	 pX8oQSxY6+xJJ4H+6t2Iye3wOvJVYZ3FovReaXnjtRxWfS0dm47naKqcxWsl6555Dv
	 KLz730hZys2TDA7kc7KzQo44Wo3QKY8Im+ccQhxk4XL5fSkSxVP5yEA20RIsam++TJ
	 uyWMgjWVw4I5uK0qXvZ7Ez3brmiIjNKiPo/DJXrI8Ks1fUizDAIPunelQ2RfkE1TQb
	 m4AB+KL+513MQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8OxWffYQs4
  Ug74jwhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aeN/dYChYYVXz518/WwPhAq4uRi0NI4CGj
  xPPObSwQzhUmieMHZrBBOHsYJaYc387UxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrBAuMSqva/AaliA4iunb2cBsXkFnCTmPf0LNkdCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2ixOzLzSwQdqVE64dfULaaxNVzm5gnMPLPQtI+C0n7AkamVYxmxalFZalFuoZmeklFmek
  ZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiB4ZhSzPxyB+OJvr96
  hxglOZiURHm72ThThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwLp0PlBMsSk1PrUjLzAHGBkxag
  oNHSYS3fzZQmre4IDG3ODMdInWKUZfj6dUre5mFWPLy81KlxHlLQWYIgBRllObBjYDF6SVGWS
  lhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzOc4Cm8GTmlcBtegV0BBPQEbu2cIAcUZKIkJJqYOJ
  4ZRXvPuNhaSrHeU3j3xu01l4yf2iy6aq1zRFxVu/O6FnSy4VsTITTDp0S//ajecNLixlbKuZZ
  +u30OR7kc+ve12fhJw5crH0lw+6V5BloU8fWzHtRc+qB2YefJO7NsTB3dF19Wc96odj/G7NUC
  2fWliTqH0wQfR2kvHbW3eqIqcELziTcamlYaxu3KqDk0Pbt1615tt69bDfj35v/3UUrdHyFH9
  /6eZE9vGsjh9j509WLnNmZlq0+vvlixP5d3Rd81p45VejF+zRGQ1bh1eL73tKMjYW8SfOZC4X
  j5BNPVfh81TK7maegxMZxN5vjPoPwJ1E35enBb1nfrvTWnXu/82PCF4dKhYtSxYeWfVBiKc5I
  NNRiLipOBABzfB1YTgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-587.messagelabs.com!1678352838!527235!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13059 invoked from network); 9 Mar 2023 09:07:18 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:07:18 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E0B54155
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:07:17 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C83D573
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:07:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:07:16 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] postgresql: Fix install conflict when  enable multilib.
Date: Thu, 9 Mar 2023 17:07:03 +0800
Message-ID: <1678352824-32428-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101444

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
file /usr/include/pg_config.h conflicts between attempted installs of lib32-libpq-dev-15.2-r0.armv7ahf_neon and libpq-dev-15.2-r0.aarch64
file /usr/include/pg_config_ext.h conflicts between attempted installs of lib32-libpq-dev-15.2-r0.armv7ahf_neon and libpq-dev-15.2-r0.aarch64

The differences of pg_config_ext.h are as follows:
@@ -5,4 +5,4 @@
  */

 /* Define to the name of a signed 64-bit integer type. */
-#define PG_INT64_TYPE long int
+#define PG_INT64_TYPE long long int

The differences of pg_config.h are as follows:
@@ -11,13 +11,13 @@
 #define ALIGNOF_INT 4

 /* The normal alignment of `long', in bytes. */
-#define ALIGNOF_LONG 8
+#define ALIGNOF_LONG 4

 /* The normal alignment of `long long int', in bytes. */
-/* #undef ALIGNOF_LONG_LONG_INT */
+#define ALIGNOF_LONG_LONG_INT 8

 /* The normal alignment of `PG_INT128_TYPE', in bytes. */
-#define ALIGNOF_PG_INT128_TYPE 16
+/* #undef ALIGNOF_PG_INT128_TYPE */

 /* The normal alignment of `short', in bytes. */
 #define ALIGNOF_SHORT 2
@@ -369,10 +369,10 @@
 #define HAVE_LOCALE_T 1

 /* Define to 1 if `long int' works and is 64 bits. */
-#define HAVE_LONG_INT_64 1
+/* #undef HAVE_LONG_INT_64 */

 /* Define to 1 if `long long int' works and is 64 bits. */
-/* #undef HAVE_LONG_LONG_INT_64 */
+#define HAVE_LONG_LONG_INT_64 1

 /* Define to 1 if you have the <mbarrier.h> header file. */
 /* #undef HAVE_MBARRIER_H */
@@ -780,7 +780,7 @@
 /* #undef HAVE___STRTOULL */

 /* Define to the appropriate printf length modifier for 64-bit ints. */
-#define INT64_MODIFIER "l"
+#define INT64_MODIFIER "ll"

 /* Define to 1 if `locale_t' requires <xlocale.h>. */
 /* #undef LOCALE_T_IN_XLOCALE */
@@ -814,10 +814,10 @@
 #define PACKAGE_VERSION "15.2"

 /* Define to the name of a signed 128-bit integer type. */
-#define PG_INT128_TYPE __int128
+/* #undef PG_INT128_TYPE */

 /* Define to the name of a signed 64-bit integer type. */
-#define PG_INT64_TYPE long int
+#define PG_INT64_TYPE long long int

 /* Define to the name of the default PostgreSQL service principal in Kerberos
    (GSSAPI). (--with-krb-srvnam=NAME) */
@@ -845,7 +845,7 @@
 #define PG_VERSION_NUM 150002

 /* A string containing the version number, platform, and C compiler */
-#define PG_VERSION_STR "PostgreSQL 15.2 on aarch64-poky-linux-gnu, compiled by aarch64-poky-linux-gcc (GCC) 12.2.0, 64-bit"
+#define PG_VERSION_STR "PostgreSQL 15.2 on arm-pokymllib32-linux-gnueabi, compiled by arm-pokymllib32-linux-gnueabi-gcc (GCC) 12.2.0, 32-bit"

 /* Define to 1 to allow profiling output to be saved separately for each
    process. */
@@ -872,16 +872,16 @@
 #define SIZEOF_BOOL 1

 /* The size of `long', as computed by sizeof. */
-#define SIZEOF_LONG 8
+#define SIZEOF_LONG 4

 /* The size of `off_t', as computed by sizeof. */
 #define SIZEOF_OFF_T 8

 /* The size of `size_t', as computed by sizeof. */
-#define SIZEOF_SIZE_T 8
+#define SIZEOF_SIZE_T 4

 /* The size of `void *', as computed by sizeof. */
-#define SIZEOF_VOID_P 8
+#define SIZEOF_VOID_P 4

 /* Define to 1 if all of the C90 standard headers exist (not just the ones
    required in a freestanding environment). This macro is provided for
@@ -892,10 +892,10 @@
 /* #undef STRERROR_R_INT */

 /* Define to 1 to use ARMv8 CRC Extension. */
-#define USE_ARMV8_CRC32C 1
+/* #undef USE_ARMV8_CRC32C */

 /* Define to 1 to use ARMv8 CRC Extension with a runtime check. */
-/* #undef USE_ARMV8_CRC32C_WITH_RUNTIME_CHECK */
+#define USE_ARMV8_CRC32C_WITH_RUNTIME_CHECK 1

 /* Define to 1 to build with assertion checks. (--enable-cassert) */
 /* #undef USE_ASSERT_CHECKING */
@@ -989,7 +989,7 @@

 /* Number of bits in a file offset, on hosts where this is settable. */
-/* #undef _FILE_OFFSET_BITS */
+#define _FILE_OFFSET_BITS 64

 /* Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2). */
 /* #undef _LARGEFILE_SOURCE */

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 60d44ce979..f7f35fe348 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -36,7 +36,7 @@ LEAD_SONAME = "libpq.so"
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"

-inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext cpan-base
+inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext cpan-base multilib_header

 CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"

@@ -183,6 +183,7 @@ INITSCRIPT_PARAMS = "start 64 . stop 36 0 1 2 3 4 5 6 ."
 do_install:append() {
     # install contrib
     oe_runmake DESTDIR=${D} -C contrib install
+    oe_multilib_header pg_config.h pg_config_ext.h
     # install tutorial
     install -d -m 0755 ${D}${libdir}/${BPN}/tutorial
     install ${B}/src/tutorial/* ${D}${libdir}/${BPN}/tutorial
--
2.34.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 60d44ce979..15ecdeeb2e 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -36,7 +36,7 @@ LEAD_SONAME = "libpq.so"
 # LDFLAGS for shared libraries
 export LDFLAGS_SL = "${LDFLAGS}"
 
-inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext cpan-base
+inherit autotools pkgconfig perlnative python3native python3targetconfig useradd update-rc.d systemd gettext cpan-base multilib_header
 
 CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR} -I${STAGING_INCDIR}/tcl8.6"
 
@@ -183,6 +183,7 @@ INITSCRIPT_PARAMS = "start 64 . stop 36 0 1 2 3 4 5 6 ."
 do_install:append() {
     # install contrib
     oe_runmake DESTDIR=${D} -C contrib install
+    oe_multilib_header pg_config.h pg_config_ext.h ecpg_config.h postgresql/server/pg_config.h postgresql/server/pg_config_ext.h
     # install tutorial
     install -d -m 0755 ${D}${libdir}/${BPN}/tutorial
     install ${B}/src/tutorial/* ${D}${libdir}/${BPN}/tutorial
-- 
2.34.1


