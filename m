Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F3DC64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 08:31:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.14692.1678437092908947881
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Mar 2023 00:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=vLUIq7HD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678437091; i=@fujitsu.com;
	bh=R7XmhMwQ9ctpumaldHFFXSScv9PuPH+yDZKa89Bx42U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=vLUIq7HDMWIJtqEHbDRa11sZd8eAZ3VWgS4RNeyDvcDRREVOSwSQWZHCsdSrLuVWz
	 TQGEluap0qNjGT8hiCfhWqOj5wEOqWtD6K6dmqCdBStA0CMx4pw6QsQwEM1dG5WCBy
	 z6VzIRlKhn6ouHc+rjg2EhborkraL0LfsMC3yM0YBc5faEAQaqSriznhwBk5Ee9feD
	 DqtAtVp9MXEYcOqfAuGfTI5+53/tMMdOwi9VsxJRPko+cyWmvI/E5q2lUCGXYA9zx7
	 0JSJQlO7fmT0UT7S+ZYO0JVit2oiae8CCdysWC7ALcevEUCT9Gi/nLksZRX3v0PopE
	 5XbvMi2UW88bQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpPvoFVe
  KwcwFShYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8baBoGCE8oVuzsWszUwnpDtYuTkEBJ4yCjx
  rrG8i5ELyL7CJHH47Xt2CGcPo8SEQy/YQKrYBKQkbtz/D2aLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYWCJfYuayNEcRmEVCV2HnnDFicV8BRYv3Ds2C2hICCxJSH75kh4oISJ2c+YYGYoynRuv03O4
  QtL9G8dTYzRL2ixOzLzSwQdoVE4/RDTBC2msTVc5uYJzAKzEIyahaSUbOQjFrAyLyK0aw4tag
  stUjX0EIvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzB0
  U4rZ3u1gXNX3V+8QoyQHk5Ior3IqV4oQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd4Dz4FygkWp6
  akVaZk5wDiCSUtw8CiJ8M67CJTmLS5IzC3OTIdInWJUlBLnPfcSKCEAksgozYNrg8XuJUZZKW
  FeRgYGBiGegtSi3MwSVPlXjOIcjErCvAwgU3gy80rgpr8CWswEtHjXFg6QxSWJCCmpBiaLplX
  L23IKJarKBWwWcXvsrjC6sf/lzbudLn//qr35etXaiNnX/5mOzbO2j4qGnD55Kx8vMn75cmLS
  F/s+39sydt826W38fjF5ydN35hFLJ/b0tb7XtEg5nmiQKev/7HjB9ZAbUZPDjgiYHRS8Ipwez
  XBTVVx+M5u3WyPPGrcF524eslW51MBcd67H7/Xk7bHz1L4kPOc/bHyDOcL4YnKfY6xajKbV9j
  2rRDzesTy/G/9jRfqKS4o9fp1ap4+17mjhjnR9YJZ15s7HvyufhkiW/3J7xm9p6FLR/3bGYU+
  VS6cWth6yavXIjmDX7hLg27/j0pGEhaVep73Kzn7ZILH7UlOcEMMn1puOH2a2RCixFGckGmox
  FxUnAgDcbumzWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1678437090!189351!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24343 invoked from network); 10 Mar 2023 08:31:30 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 08:31:30 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 242E01AE
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 08:31:30 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 180181AD
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 08:31:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 08:31:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] unixodbc: Fix install conflict when enable multilib.
Date: Fri, 10 Mar 2023 16:31:17 +0800
Message-ID: <1678437077-8643-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 08:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101485

From: Wang Mingyu <wangmy@fujitsu.com>

 Error: Transaction test error:
   file /usr/include/unixODBC/config.h conflicts between attempted installs of unixodbc-dev-2.3.11-r0.aarch64 and lib32-unixodbc-dev-2.3.11-r0.armv7ahf_neon
 =C2=A0 file /usr/include/unixODBC/unixodbc_conf.h conflicts between attempted installs of unixodbc-dev-2.3.11-r0.aarch64 and lib32-unixodbc-dev-2.3.11-r0.armv7ahf_neon
 =C2=A0 file /usr/include/unixodbc.h conflicts between attempted installs of unixodbc-dev-2.3.11-r0.aarch64 and lib32-unixodbc-dev-2.3.11-r0.armv7ahf_neon

 The differences of config.h are as follows:
 @@ -14,7 +14,7 @@
  /* #undef C_ALLOCA */

  /* Lib directory */
 -#define DEFLIB_PATH "/usr/lib64"
 +#define DEFLIB_PATH "/usr/lib"

  /* Using perdriver iconv */
  /* #undef ENABLE_DRIVER_ICONV */
 @@ -275,7 +275,7 @@
  #define INCLUDE_PREFIX "/usr/include"

  /* Lib directory */
 -#define LIB_PREFIX "/usr/lib64"
 +#define LIB_PREFIX "/usr/lib"

  /* Define to the sub-directory where libtool stores uninstalled libraries. */
  #define LT_OBJDIR ".libs/"
 @@ -311,7 +311,7 @@
  #define PACKAGE_VERSION "2.3.11"

  /* Platform is 64 bit */
 -#define PLATFORM64 /**/
 +/* #undef PLATFORM64 */

  /* Install prefix */
  #define PREFIX "/usr"
 @@ -323,10 +323,10 @@
  #define SHLIBEXT ".so"

  /* The size of `long', as computed by sizeof. */
 -#define SIZEOF_LONG 8
 +#define SIZEOF_LONG 4

  /* The size of `long int', as computed by sizeof. */
 -#define SIZEOF_LONG_INT 8
 +#define SIZEOF_LONG_INT 4

  /* If using the C implementation of alloca, define if you know the
     direction of stack growth for your system; otherwise it will be
 @@ -351,7 +351,7 @@
  #define SYSTEM_FILE_PATH "/etc"

  /* Lib path */
 -#define SYSTEM_LIB_PATH "/usr/lib64"
 +#define SYSTEM_LIB_PATH "/usr/lib"

  /* Define to 1 if you can safely include both <sys/time.h> and <time.h>. This
     macro is obsolete. */
 @@ -383,7 +383,7 @@
  /* #undef _ALL_SOURCE */

  /* Number of bits in a file offset, on hosts where this is settable. */
 -/* #undef _FILE_OFFSET_BITS */
 +#define _FILE_OFFSET_BITS 64

  /* Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2). */
  /* #undef _LARGEFILE_SOURCE */

 The differences of unixodbc_conf.h are as follows:
 @@ -19,7 +19,7 @@
  /* #undef C_ALLOCA */

  /* Lib directory */
 -#define DEFLIB_PATH "/usr/lib64"
 +#define DEFLIB_PATH "/usr/lib"

  /* Using perdriver iconv */
  /* #undef ENABLE_DRIVER_ICONV */
 @@ -342,7 +342,7 @@
  #define INCLUDE_PREFIX "/usr/include"

  /* Lib directory */
 -#define LIB_PREFIX "/usr/lib64"
 +#define LIB_PREFIX "/usr/lib"

  /* Define if the OS needs help to load dependent libraries for dlopen(). */
  /* #undef LTDL_DLOPEN_DEPLIBS */
 @@ -396,7 +396,7 @@
  /* Define to the version of this package. */

  /* Platform is 64 bit */
 -#define PLATFORM64 /**/
 +/* #undef PLATFORM64 */

  /* Install prefix */
  #define PREFIX "/usr"
 @@ -408,7 +408,7 @@
  #define SHLIBEXT ".so"

  /* The size of `long', as computed by sizeof. */
 -#define SIZEOF_LONG 8
 +#define SIZEOF_LONG 4

  /* If using the C implementation of alloca, define if you know the
     direction of stack growth for your system; otherwise it will be
 @@ -431,7 +431,7 @@
  #define SYSTEM_FILE_PATH "/etc"

  /* Lib path */
 -#define SYSTEM_LIB_PATH "/usr/lib64"
 +#define SYSTEM_LIB_PATH "/usr/lib"

  /* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
  #define TIME_WITH_SYS_TIME 1

 The differences of unixodbc.h are as follows:
 @@ -14,4 +14,4 @@
  #define HAVE_UNISTD_H 1

  /* Define to the value of sizeof(long) */
 -#define SIZEOF_LONG_INT 8
 +#define SIZEOF_LONG_INT 4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
index c7d23d1202..39112587ed 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.11.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D "d9e55c8e7118347e3c66c87338856dad1516b490fb7c756c1562a2c267
 
 UPSTREAM_CHECK_REGEX =3D "unixODBC-(=3FP<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools-brokensep
+inherit autotools-brokensep multilib_header
 
 S =3D "${WORKDIR}/unixODBC-${PV}"
 
@@ -26,3 +26,7 @@ do_configure:prepend() {
     rm -rf m4/*
     rm -fr libltdl
 }
+
+do_install:append() {
+    oe_multilib_header unixodbc.h unixODBC/config.h unixODBC/unixodbc_conf.h
+}
-- 
2.34.1


