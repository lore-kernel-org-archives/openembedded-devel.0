Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD62C54E92
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:31 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.16493.1747731321534807123
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=a9PjdWf+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731322; x=1779267322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rLgqox8JPA/QXe7Zb3LjSTB4mNYvEc3fHOSovrSGCYs=;
  b=a9PjdWf+LHaDVmMyQqUHKKnAy420WQxFlSuqZoo0Mj6koXF+6D9lfHhn
   fz/0ghwhF6Gp6uoMzaSP7rK8jxz04HfAes3cWAbiKLeikAnRScQ7YlxR0
   2M/vCeZIVRXxtqAkdxB9u3WqGBV981zKp9ja6aMLF8jvXXEHWWFcujQTo
   TqtXG3F/xZz8xU3kRnf7vObhtK2x+Xtc/9BgJwxeZpcirC/p9Rvg1deLc
   pTwsjC4nKYHj0xWiQ4Js/9VBFeOdVVrksEg1i29XUpw/mmNgRwuladzrD
   XVhaPjbwq90P37J8EWFdDlPTWnwTAu2HPyzO08JLHGEKR+35aOO1iEsZO
   w==;
X-CSE-ConnectionGUID: IcvlFxUiSaGHn3nF+lzbwA==
X-CSE-MsgGUID: 1Fs1znr6SSWrOXm8M5EQZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="187384632"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="187384632"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:20 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BBCBDD4C24
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 70E89D8B31
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:17 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 03AC01A009A;
	Tue, 20 May 2025 16:55:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 20/27] rsyslog: upgrade 8.2502.0 -> 8.2504.0
Date: Tue, 20 May 2025 16:54:52 +0800
Message-Id: <1747731299-20448-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117505

From: Wang Mingyu <wangmy@fujitsu.com>

0001-tests-disable-the-check-for-inotify.patch
0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
use-pkgconfig-to-check-libgcrypt.patch
refreshed for 8.2504.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-tests-disable-the-check-for-inotify.patch       | 8 ++++----
 ...-tcpflood.c-Pass-correct-parameter-type-to-send.patch | 9 +++------
 .../rsyslog/use-pkgconfig-to-check-libgcrypt.patch       | 6 +++---
 .../rsyslog/{rsyslog_8.2502.0.bb => rsyslog_8.2504.0.bb} | 2 +-
 4 files changed, 11 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2502.0.bb => rsyslog_8.2504.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
index 13d1a78143..a506b7a6dc 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
@@ -1,4 +1,4 @@
-From 640b191b9566a6c18af73bf9cc4b9366a76acf62 Mon Sep 17 00:00:00 2001
+From 1b02236e84aaed5d80d4a67afb418eadb687d65f Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Sat, 27 Mar 2021 19:18:25 -0400
 Subject: [PATCH] tests: disable the check for inotify
@@ -20,10 +20,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/diag.sh b/tests/diag.sh
-index f4f3d86..497bb17 100755
+index a9c2a75..0b017c5 100755
 --- a/tests/diag.sh
 +++ b/tests/diag.sh
-@@ -2950,7 +2950,7 @@ case $1 in
+@@ -2979,7 +2979,7 @@ case $1 in
  		fi
  		;;
  	'check-inotify') # Check for inotify/fen support 
@@ -32,7 +32,7 @@ index f4f3d86..497bb17 100755
  			echo [inotify mode]
  		elif [ -n "$(find /usr/include/sys/ -name 'port.h' -print -quit)" ]; then
  			grep -qF "PORT_SOURCE_FILE" < /usr/include/sys/port.h
-@@ -2965,7 +2965,7 @@ case $1 in
+@@ -2994,7 +2994,7 @@ case $1 in
  		fi
  		;;
  	'check-inotify-only') # Check for ONLY inotify support 
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
index 5df29e7d90..884086bfc3 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
@@ -1,4 +1,4 @@
-From 1e0a77d8a5ae7cd0223afadf46cdbb540119774d Mon Sep 17 00:00:00 2001
+From 59753fe14e9eef4909a535b6e00967e546cc29ea Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 11 May 2024 23:31:46 -0700
 Subject: [PATCH] tests/tcpflood.c: Pass correct parameter type to sendto()
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/tcpflood.c b/tests/tcpflood.c
-index bd8edaf..0feda23 100644
+index 5e6f13a..09cedbb 100644
 --- a/tests/tcpflood.c
 +++ b/tests/tcpflood.c
-@@ -808,7 +808,7 @@ int sendMessages(struct instdata *inst)
+@@ -836,7 +836,7 @@ int sendMessages(struct instdata *inst)
  			}
  			lenSend = sendPlainTCP(socknum, buf, lenBuf, &error_number);
  		} else if(transport == TP_UDP) {
@@ -30,6 +30,3 @@ index bd8edaf..0feda23 100644
  			error_number = errno;
  		} else if(transport == TP_TLS) {
  			if(sockArray[socknum] == -1) {
--- 
-2.45.0
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
index 45359a1663..f5ae65fb58 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
@@ -1,4 +1,4 @@
-From ceeaadb282531a416c1f605fa2100faa5de701e0 Mon Sep 17 00:00:00 2001
+From d2dd13d930c91e45417c7361908f0af75e0e6c00 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Wed, 18 Jun 2014 13:46:52 +0800
 Subject: [PATCH] use pkgconfig to check libgcrypt
@@ -15,10 +15,10 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
  1 file changed, 1 insertion(+), 14 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4af95c4..97e6282 100644
+index f8c0ac8..794bfb3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1200,20 +1200,7 @@ AC_ARG_ENABLE(libgcrypt,
+@@ -1217,20 +1217,7 @@ AC_ARG_ENABLE(libgcrypt,
          [enable_libgcrypt=yes]
  )
  if test "x$enable_libgcrypt" = "xyes"; then
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2502.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2502.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb
index 10128a9eb2..c4ddb72bcc 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2502.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2504.0.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
     file://disable-omfile-outchannel.patch \
 "
-SRC_URI[sha256sum] = "02fa197d21d519f5a25a928deb9397cd387ba7382b9b449782ba31d8f3118206"
+SRC_URI[sha256sum] = "5092a20ed40987c74cc604ebfcd6c749e47eb9fc34adc1c2637e6553e7f047ab"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


