Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8494C6FD1F
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:07:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.8956.1678352843675466434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=HsD7e4fl;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678352841; i=@fujitsu.com;
	bh=RVh4YfhqJ34CbjankF0X8HWF3FBchxSV/M6lhqOiI6c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=HsD7e4flC7FodBSCA13W/NNLvNFnr22WXMFlyeoiq6dd2cGq9lQEqTXepx3+8ZcnQ
	 Etj33YbMaifppelzAk9mixDz7ABDKclqxc4uzxBoS0WE8fPD0TOhkEFK4kpmFBjruX
	 KwMA2JtQkiic5q/cVgY31Qk8QjR/89LxM2PBpFkuDpTV9Chu+4kVZKqr6FFicI9jYY
	 7LfuxFwfrSotdRr52IXP50kjQ9Mn3vqXYc6yVuHd4/CFaTHKOHfIZsfeflYFiSzw3H
	 2QHKBuT9MzPziSdlTlnYuN/WDel+DcFxCu/gPdc0q4k2Xqzgv2ebyRL0ZDqT8IH8QR
	 3Wx8XnbZUiVUA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORpHtyIWe
  KwdJedouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPK5F/MBR+VKl6e+sjUwHhetouRi0NI4CGj
  RNPRmywQzlUmib4nF6CcPYwSXf/uMnUxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLBAq0XCqiRXEZgGK98zbzghi8wo4SRze2Q3WKyGgIDHl4XuwXk4BZ4l3X7+CzRcCqvm39R
  1UvaDEyZlPWCDma0q0bv/NDmHLSzRvnc0MMUdRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGIVmIRk
  1C8moWUhGLWBkXsVoVpxaVJZapGuol1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSAZRKLC/WSy0u
  1iuuzE3OSdHLSy3ZxAgM95TixNs7GJf3/tU7xCjJwaQkytvNxpkixJeUn1KZkVicEV9UmpNaf
  IhRhoNDSYJ36XygnGBRanpqRVpmDjD2YNISHDxKIrz9s4HSvMUFibnFmekQqVOMilLivKUgfQ
  IgiYzSPLg2WLxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM6zwHaApPZl4J3PRXQIuZgBb
  v2sIBsrgkESEl1cCUf7fhRf3R9bEFR1473Je5ckbq5YcrvT29iW7WFx67xFX+9Pilp6JeIan/
  4snUDm377/kPxaa0Tjhlfroxgt1XRJm9M4+ROYe1Vugej+hxs4PfTt5cdTrBODf87KIZ7Fp95
  sJrZgfOzlEX7NJhkqjMvRl8r2GyYPcGAUZNE3GpExbFvw4r7F/7a6daZuY9y10VEVYxKo98T7
  UffNjX6Hpki5/lCl2FdXZbzuWuZJdbk+GetX7HmY99BREx2tuX7+x4c8rVitvtE6/Ca+2c6lj
  DBa92sAlaPjBiNjnmZLhmh6bMzOXuUz9GXAoVmFqonSekMuvb/xLuuUlHBTfs5M16nLm6y5gh
  1k0n5MR/TyWW4oxEQy3mouJEANKtrOtyAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1678352840!515062!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19637 invoked from network); 9 Mar 2023 09:07:21 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:07:21 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 73EA91B4
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:07:20 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 67E891AE
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:07:20 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:07:18 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] unixodbc: Fix install conflict when  enable multilib.
Date: Thu, 9 Mar 2023 17:07:04 +0800
Message-ID: <1678352824-32428-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678352824-32428-1-git-send-email-wangmy@fujitsu.com>
References: <1678352824-32428-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101445

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
index c7d23d1202..9c461d6be0 100644
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
+do_install(){
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_multilib_header unixodbc.h unixODBC/config.h unixODBC/unixodbc_conf.h
+}
-- 
2.34.1


