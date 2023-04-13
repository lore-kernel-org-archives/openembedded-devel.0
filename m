Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991CAC77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 07:29:21 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.6893.1681370953084503079
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Apr 2023 00:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kFMqpE71;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681370951; i=@fujitsu.com;
	bh=5/Llz8DI90Gb4NzABTXVg65jCx42908lNhclyydp07E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kFMqpE7115n21vjyZFaBOtjiXSqajjwMeB49OcJV6LR4/cvbiZJ+CivWd2o4FMUyr
	 PTLJxkk8gPL+LD8Rtztgh86eg5kclf3+Y5stxEuIlr/BypIf9cZAfSUoBKbV9rCfBe
	 s/YdLkC2Da0HYu7wORwHLFs0Ka+3S0nWqeZuYdaEoqNQyXUWWrmzUqf0aq1DmqsG1a
	 +lseZhr5fAIu1hBBA63VY9EFnYd9MlxqwKHcpPH6yx5Ms7gP9kbBJTMGCTbamOhIjS
	 78+spnUVnqU5eCZj63ceXBsBMczh2//fOyojas/7hR/Y61DsIdo6vF3Z/CX5R2OkDF
	 F1QBOT8GmXl5w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORpOu23jz
  F4NthFYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPj5J/sBWslKhq3vWVtYLwq0sXIxSEk8JBR
  Yv27s0wQzlUmiSM9D9kgnL2MEmsfdLB2MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  3sXIweHsECAxL9/qSBhFgFViSMzLjOC2LwCThL3P91mArElBBQkpjx8zwwRF5Q4OfMJC8QYCY
  mDL14wQ9QoSsy+3MwCYVdKtH74BWWrSVw9t4l5AiP/LCTts5C0L2BkWsVoWpxaVJZapGuul1S
  UmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYiinFTO92MC7v
  +6t3iFGSg0lJlNe10DxFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvu7VAOcGi1PTUirTMHGBcw
  KQlOHiURHj5lwOleYsLEnOLM9MhUqcYFaXEeYVA+gRAEhmleXBtsFi8xCgrJczLyMDAIMRTkF
  qUm1mCKv+KUZyDUUmYd8cqoCk8mXklcNNfAS1mAlp80sIEZHFJIkJKqoFpYYn9x7Y92aW74/U
  cAt04jK8VzjU9wev2INr9w+dHRf7HJ/37Ollk/s61yy4FWP6VdugttDSbbvZbtunmqp5tCxzi
  eJTzQ7omSC9cUWH/xcIiezfTq+c7Pj1LnRC7oXnjjl37wj/YeHtvE0leW7HCawOvuOWLps3Pj
  ydGFc83tIn8lPiP9dfe8DOxUuUBCmGfZjI4BG9Z0HNf1+7H6Q0s7VuYHVw6ZnldZamZ/P1bcJ
  TUObtns0/NEdsgcj7oR0VcrMM1T8kqzqhI2bnPPwpvZBByuLkrrP+hTsvBwidODYFbg9e5veP
  g9glOc75VIaBXXhz7XVBJ5fb9Y3flLnReb5Hzz37uvdDOXdyM0UyJpTgj0VCLuag4EQAlP1sX
  QAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1681370950!77579!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24584 invoked from network); 13 Apr 2023 07:29:10 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Apr 2023 07:29:10 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 30C311FB
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 08:29:10 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 2504D1B1
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 08:29:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 13 Apr 2023 08:29:08 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hdf5: Fix install conflict when enable multilib.
Date: Thu, 13 Apr 2023 15:28:54 +0800
Message-ID: <1681370934-17546-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Apr 2023 07:29:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102075

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/include/H5pubconf.h conflicts between attempted installs of hdf5-dev-1.14.0-r0.core2_64 and lib32-hdf5-dev-1.14.0-r0.i686

The differences between lib32-hdf5-dev and hdf5-dev are as follows:
@@ -479,10 +479,10 @@
 #define H5_SIZEOF_INT8_T 1

 /* The size of `int_fast16_t', as computed by sizeof. */
-#define H5_SIZEOF_INT_FAST16_T 4
+#define H5_SIZEOF_INT_FAST16_T 8

 /* The size of `int_fast32_t', as computed by sizeof. */
-#define H5_SIZEOF_INT_FAST32_T 4
+#define H5_SIZEOF_INT_FAST32_T 8

 /* The size of `int_fast64_t', as computed by sizeof. */
 #define H5_SIZEOF_INT_FAST64_T 8
@@ -505,16 +505,16 @@
 #if !defined(__APPLE__)

 /* The size of `size_t', as computed by sizeof. */
-#define H5_SIZEOF_SIZE_T 4
+#define H5_SIZEOF_SIZE_T 8

 /* The size of `ssize_t', as computed by sizeof. */
-#define H5_SIZEOF_SSIZE_T 4
+#define H5_SIZEOF_SSIZE_T 8

 /* The size of `long', as computed by sizeof. */
-#define H5_SIZEOF_LONG 4
+#define H5_SIZEOF_LONG 8

 /* The size of `long double', as computed by sizeof. */
-#define H5_SIZEOF_LONG_DOUBLE 12
+#define H5_SIZEOF_LONG_DOUBLE 16

 #else

@@ -538,7 +538,7 @@
   # elif defined(__aarch64__)
   #define H5_SIZEOF_LONG_DOUBLE 8
   # else
-  #define H5_SIZEOF_LONG_DOUBLE 12
+  #define H5_SIZEOF_LONG_DOUBLE 16
   # endif

 #endif
@@ -557,13 +557,13 @@
 #define H5_SIZEOF_OFF_T 8

 /* The size of `ptrdiff_t', as computed by sizeof. */
-#define H5_SIZEOF_PTRDIFF_T 4
+#define H5_SIZEOF_PTRDIFF_T 8

 /* The size of `short', as computed by sizeof. */
 #define H5_SIZEOF_SHORT 2

 /* The size of `time_t', as computed by sizeof. */
-#define H5_SIZEOF_TIME_T 4
+#define H5_SIZEOF_TIME_T 8

 /* The size of `uint16_t', as computed by sizeof. */
 #define H5_SIZEOF_UINT16_T 2
@@ -578,10 +578,10 @@
 #define H5_SIZEOF_UINT8_T 1

 /* The size of `uint_fast16_t', as computed by sizeof. */
-#define H5_SIZEOF_UINT_FAST16_T 4
+#define H5_SIZEOF_UINT_FAST16_T 8

 /* The size of `uint_fast32_t', as computed by sizeof. */
-#define H5_SIZEOF_UINT_FAST32_T 4
+#define H5_SIZEOF_UINT_FAST32_T 8

 /* The size of `uint_fast64_t', as computed by sizeof. */
 #define H5_SIZEOF_UINT_FAST64_T 8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb
index 4feec61af..d0ff2ef48 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "HDF5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ac1039f6bf7c9ab2b3693836f46d0735"
 
-inherit cmake siteinfo qemu
+inherit cmake siteinfo qemu multilib_header
 
 DEPENDS += "qemu-native"
 
@@ -44,6 +44,7 @@ do_install:append() {
     # Used for generating config files on target
     install -m 755 ${B}/bin/H5detect ${D}${bindir}
     install -m 755 ${B}/bin/H5make_libsettings ${D}${bindir}
+    oe_multilib_header H5pubconf.h
 }
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


