Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 557E6C433FE
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:09:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.25201.1653293342656955694
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 01:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=c6TaqHnl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653293340; i=@fujitsu.com;
	bh=aqJiI75IFXYsoRzdp3OgwZzhClldj4v9U0djXboxEPU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=c6TaqHnld3yrGH+a9V2AWik+oxsLdPDcvAL6sNm7aM2FTVlllc5f+MJ3MN5PT6Pzk
	 t+F/ag5GI+PB5DcQMqLbtPnlAw/jMw6q9QLG4Si6LiADInovi9LCMXxp1ofYhuQ4GJ
	 foOCX4/e516TnzSr/K70uMxRCjm15ciwZ6i50NSmMHzlqtez9/pP9mj2RUokuQivhw
	 LVzGyjPc1H/vsi4GvtbCFrfwVonDfcUfTUZ9wbBqQOm4v23wZad0BL7+iALm5c2fZb
	 LXfMOL0QqGsKwnKQ6A5ZsTiGBUykpBbRCPwkPsVW9t9BJ8l1GLrSoX3JTPQNTMKkSJ
	 hw+5zgZX67x1g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRWlGSWpSXmKPExsViZ8OxWVfKsTv
  JYPpDa4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePFi9fsBYdVKqZO5W9gXKjQxcjFISTwkFFi
  5vJrrBDOWSaJw6sfsEE4exgl+iYvYOli5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBG4uX+a2wgNouAqsScGxPAangFnCQWfD4F1ishoCAx5eF7qLigxMmZT1gg5mhKtG7/zQ
  5hy0s0b53NDFGvKDH7cjMLhF0hMWPGNjYIW03i6rlNzBMYBWYhGTULyahZSEYtYGRexWiVVJS
  ZnlGSm5iZo2toYKBraGiqa2ypa2qkl1ilm6iXWqpbnlpcogvklhfrpRYX6xVX5ibnpOjlpZZs
  YgQGcUqxuskOxu6VP/UOMUpyMCmJ8h61604S4kvKT6nMSCzOiC8qzUktPsQow8GhJMHLZw+UE
  yxKTU+tSMvMAUYUTFqCg0dJhJfRASjNW1yQmFucmQ6ROsXoyrG24cBeZo6dWy4DyatXrgDJG2
  By/zUgKcSSl5+XKiXO6wjSLADSnFGaBzcalgwuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBL
  mrQeZwpOZVwJ3wSug45iAjuuV6AQ5riQRISXVwKTS/6C/rXByaKb4hYfOB/TnrD65g61CZcI7
  nbZwpvhF6ebV95tbde894Zj/cpXGwo+y5/Z9NdJ/HWh/MkPM5f/XE/0OwVuatGW2SM5oLBS4k
  LfgwsRvtt9/X7zZ/cAs1KsmT2d55iWut6p8X5k8uYQKFWYJns48e+HM1ks/5Lo6i5bKb9vQLs
  35d3+x0pW8tfuVldpbi5dHBH/u/a94fNqe7cd1BSfJte5dwNRyV9VW8ePeZzlVkmUcScvb+aQ
  8BTK+qzVJnJS0v73w6tdHW6yTHZacPcmmeIWHbX3A7y9b42+fn2bAMiv/zutHs/vuFp/RS3qr
  dfGwr+eaiTr1y8Ld/6Q1HtvydrqaTtq8NFYlluKMREMt5qLiRAA0qVdIgQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1653293338!141404!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15952 invoked from network); 23 May 2022 08:08:58 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 May 2022 08:08:58 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9D967810
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:08:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 91AFE80C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:08:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 23 May 2022 09:08:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] evtest: upgrade 1.34 -> 1.35
Date: Mon, 23 May 2022 16:08:41 +0800
Message-ID: <1653293322-31459-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 08:09:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97225

0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
refreshed for new version.

add_missing_limits_h_include.patch
removed since it's included in 1.35.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 24 ++++--------
 .../evtest/add_missing_limits_h_include.patch | 37 -------------------
 .../evtest/{evtest_1.34.bb =3D> evtest_1.35.bb} |  3 +-
 3 files changed, 9 insertions(+), 55 deletions(-)
 delete mode 100644 meta-oe/recipes-test/evtest/evtest/add_missing_limits_h_include.patch
 rename meta-oe/recipes-test/evtest/{evtest_1.34.bb =3D> evtest_1.35.bb} (83%)

diff --git a/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
index aa49a0629..595b0296e 100644
--- a/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
+++ b/meta-oe/recipes-test/evtest/evtest/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -1,4 +1,4 @@
-From fa57c78c33d26084f85f1a6b4c29378631dc9395 Mon Sep 17 00:00:00 2001
+From 490f5b6cd788692d989f07180a5714c76872911e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Nov 2019 11:58:58 -0800
 Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
@@ -10,17 +10,18 @@ input.h [1]
 
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/libevdev/evtest/merge_requests/6]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- evtest.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
+ evtest.c | 5 +++++
+ 1 file changed, 5 insertions(+)
 
 diff --git a/evtest.c b/evtest.c
-index 548c203..93063cd 100644
+index ba7a161..8fc2e5a 100644
 --- a/evtest.c
 +++ b/evtest.c
-@@ -61,6 +61,11 @@
- #include <sys/types.h>
- #include <unistd.h>
+@@ -63,6 +63,11 @@
+ #define input_event_usec time.tv_usec
+ #endif
  
 +#ifndef input_event_sec
 +#define input_event_sec time.tv_sec
@@ -30,12 +31,3 @@ index 548c203..93063cd 100644
  #define BITS_PER_LONG (sizeof(long) * 8)
  #define NBITS(x) ((((x)-1)/BITS_PER_LONG)+1)
  #define OFF(x)  ((x)%BITS_PER_LONG)
-@@ -1140,7 +1145,7 @@ static int print_events(int fd)
- 			type =3D ev[i].type;
- 			code =3D ev[i].code;
- 
--			printf("Event: time %ld.%06ld, ", ev[i].time.tv_sec, ev[i].time.tv_usec);
-+			printf("Event: time %ld.%06ld, ", ev[i].input_event_sec, ev[i].input_event_usec);
- 
- 			if (type =3D=3D EV_SYN) {
- 				if (code =3D=3D SYN_MT_REPORT)
diff --git a/meta-oe/recipes-test/evtest/evtest/add_missing_limits_h_include.patch b/meta-oe/recipes-test/evtest/evtest/add_missing_limits_h_include.patch
deleted file mode 100644
index b2bf94fd5..000000000
--- a/meta-oe/recipes-test/evtest/evtest/add_missing_limits_h_include.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5eb4ab1c139ea38ebe6bb4acba08b09ee7d77d3c Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Sun, 18 Aug 2019 10:01:06 +0300
-Subject: Add missing limits.h include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes build with musl libc that does not include limits.h indirectly via
-other headers.
-
-evtest.c: In function =E2=80=98scan_devices=E2=80=99:
-evtest.c:886:14: error: =E2=80=98PATH_MAX=E2=80=99 undeclared (first use in this function); did you mean  INT8_MAX=E2=80=99=3F
-   char fname[PATH_MAX];
-              ^~~~~~~~
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
----
- evtest.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/evtest.c b/evtest.c
-index 37d4f85..548c203 100644
---- a/evtest.c
-+++ b/evtest.c
-@@ -56,6 +56,7 @@
- #include <getopt.h>
- #include <ctype.h>
- #include <signal.h>
-+#include <limits.h>
- #include <sys/time.h>
- #include <sys/types.h>
- #include <unistd.h>
--- 
-cgit v1.1
-
diff --git a/meta-oe/recipes-test/evtest/evtest_1.34.bb b/meta-oe/recipes-test/evtest/evtest_1.35.bb
similarity index 83%
rename from meta-oe/recipes-test/evtest/evtest_1.34.bb
rename to meta-oe/recipes-test/evtest/evtest_1.35.bb
index daf9dc383..51af9997f 100644
--- a/meta-oe/recipes-test/evtest/evtest_1.34.bb
+++ b/meta-oe/recipes-test/evtest/evtest_1.35.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe"
 
 DEPENDS =3D "libxml2"
 
-SRCREV =3D "16e5104127a620686bdddc4a9ad62881134d6c69"
+SRCREV =3D "da347a8f88d2e5729dd12d61ee9743f902065b55"
 SRC_URI =3D "git://gitlab.freedesktop.org/libevdev/evtest.git;protocol=3Dhttps;branch=3Dmaster \
-           file://add_missing_limits_h_include.patch \
            file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
            "
 
-- 
2.25.1


