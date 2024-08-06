Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC135C54743
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2884.1722934017995171001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=so4EB0fC;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934026; x=1754470026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uj/a0wQ5ZmNSzeZO78uxs7YF8O/m3XmfXPhNcFtU4w8=;
  b=so4EB0fCtDDvqwvsq1V/H1uGALiST8qIt9SWnNf+vTaqy8GO7WfL2z3e
   4CH/TsmSEroxEaN8fZrMGMdFTW4Xk4YxDyMR4HZLhmjEuRBFse+iml3Ds
   ocZYcnS0AXcZc/fGY1Go+ErV8xmVuG25CbyrEEokIoHxzHEDEGQKkUkCg
   K5gqJwwB41N/FY2aPEqx48DkPp8MKLKJyf2Qf9GdEYJpZgKNwrTXBfiZB
   B98IEQxaJqFylu8uRJjEdzTC7DulO1o5J9ZsK/VAJhTYbsagFHN4ecgZb
   Z2v0f7dO3L2CYdY2EEBYsBaHdYvjPgXd3YeUWRudyd9aO30STMhCB0qiN
   A==;
X-CSE-ConnectionGUID: wZ4ZFCEhQCOJrLtoRtSb4g==
X-CSE-MsgGUID: 6pv4TMjUT/q/4vGk3h6uAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="148811735"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="148811735"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:05 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BBDDCC142
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DC2E5BF493
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 488DB20076D12
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E8E4A1A000D;
	Tue,  6 Aug 2024 16:47:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 57/60] rsyslog: upgrade 8.2404.0 -> 8.2406.0
Date: Tue,  6 Aug 2024 16:46:31 +0800
Message-Id: <1722933994-32549-57-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--0.874400-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yQPZZctd3P4BMVVFhl7NwvNIyDY579vwTB6s
	bAY1dG02bn+bq+W8j6WK8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl76S7Hfu9IUxzv0
	+UmYCZcMHdeggYR7phTHJb0jHm8KQIDHu/w7zAY9rzsINdopFUj7BhvpELLyodb3jzU/+DLdaTW
	107FjPHDqFQ5xOiev0gDLqnrRlXrZ8nn9tnqel2OJGF26G8SWybcMfqeX8eucKial7GP7P0q7P2
	gtWh5HRgIpjKXF2wQegv+puO2kY7/UbpjQwNpUGUjCQihRPoianP7kv4flaVYhkutZE5vIopfM/
	ieHOCV/sfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111573

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-tests-disable-the-check-for-inotify.patch    | 11 ++++-------
 .../rsyslog/use-pkgconfig-to-check-libgcrypt.patch    |  7 +++----
 .../{rsyslog_8.2404.0.bb => rsyslog_8.2406.0.bb}      |  2 +-
 3 files changed, 8 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2404.0.bb => rsyslog_8.2406.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
index c1480406f..4c41da518 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
@@ -1,4 +1,4 @@
-From 194e199ce08acc2192f6a63420ff24d9064666e5 Mon Sep 17 00:00:00 2001
+From 9e36463b8a03e7de7468035e2dc63b36b5fd1965 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Sat, 27 Mar 2021 19:18:25 -0400
 Subject: [PATCH] tests: disable the check for inotify
@@ -20,10 +20,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/diag.sh b/tests/diag.sh
-index 6cd60ea88..7424f48c5 100755
+index f30290c..2c4f6f0 100755
 --- a/tests/diag.sh
 +++ b/tests/diag.sh
-@@ -2672,7 +2672,7 @@ case $1 in
+@@ -2933,7 +2933,7 @@ case $1 in
  		fi
  		;;
  	'check-inotify') # Check for inotify/fen support 
@@ -32,7 +32,7 @@ index 6cd60ea88..7424f48c5 100755
  			echo [inotify mode]
  		elif [ -n "$(find /usr/include/sys/ -name 'port.h' -print -quit)" ]; then
  			grep -qF "PORT_SOURCE_FILE" < /usr/include/sys/port.h
-@@ -2687,7 +2687,7 @@ case $1 in
+@@ -2948,7 +2948,7 @@ case $1 in
  		fi
  		;;
  	'check-inotify-only') # Check for ONLY inotify support 
@@ -41,6 +41,3 @@ index 6cd60ea88..7424f48c5 100755
  			echo [inotify mode]
  		else
  			echo [inotify not supported, skipping...]
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
index 035258726..cda2d99c0 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
@@ -1,4 +1,4 @@
-From d0852006bf3d305e8984b85b41997d43d4476937 Mon Sep 17 00:00:00 2001
+From 5d200bd8ccb6acb8636dadc47eefc6763c0001d0 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Wed, 18 Jun 2014 13:46:52 +0800
 Subject: [PATCH] use pkgconfig to check libgcrypt
@@ -10,16 +10,15 @@ libgcrypt does no longer provide libgcrypt-config, and provide
 
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
-
 ---
  configure.ac | 15 +--------------
  1 file changed, 1 insertion(+), 14 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 62178c3..b56c9c7 100644
+index a4506ec..46013cc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -889,20 +889,7 @@ AC_ARG_ENABLE(libgcrypt,
+@@ -1181,20 +1181,7 @@ AC_ARG_ENABLE(libgcrypt,
          [enable_libgcrypt=yes]
  )
  if test "x$enable_libgcrypt" = "xyes"; then
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2404.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2406.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2404.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2406.0.bb
index 8f46e0cd0..b0c2fb298 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2404.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2406.0.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
     file://disable-omfile-outchannel.patch \
 "
-SRC_URI[sha256sum] = "30528d140ec1b1f079224081fa37df6e06587ff42b02e3e61f2daa0526c54d33"
+SRC_URI[sha256sum] = "1343e0269dd32166ffde04d7ceebfa0e7146cf1dbc6962c56bf428c61f01a7df"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


