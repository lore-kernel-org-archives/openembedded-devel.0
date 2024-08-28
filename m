Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E37EC54748
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8730.1724833561124415260
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Up0/4VVL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833562; x=1756369562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2IeMRq3bnsKcyd9ni/Nu+njqDN4CvpSYU/FPrE9OxGY=;
  b=Up0/4VVLbYSS6x7HZl7XElzRpyxj4rIsDTaK0UhOkxJ/Do4pxYniL0l1
   IbE9Fx88uHK/SrjASSHdEOREACcNHQOubY/hhgNBSE2ZCFHFWabtlQgn3
   /YYogJXeyZpYrWEPaO6ep2xX5duaUvr4QB6EhyCYT+gCLpvFel2irffHR
   sbKGaP+mK1Gef7uhrUq+TFIspiX+57kesJqRb4La0+wABtXInFA0wc8Ce
   WGcs6EvmRvGMNEr/DrZbj/vPd7w0Qizg1eroXTbZYBly8y2ZWgnzDT4hj
   9jmMhOCgWwfU5TWWe3lQ0EW39nnvfJIiyuaVDrJS+TKYUmkQj40kGqS73
   A==;
X-CSE-ConnectionGUID: YcfaA2D1RlC10DT6qsM0gQ==
X-CSE-MsgGUID: Plc7LxjPQFil8LaNdAO/qQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171866174"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171866174"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:59 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B4E97C9321
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06C4BD3F12
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AE5520079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3510E1A0002;
	Wed, 28 Aug 2024 16:25:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/46] rsyslog: upgrade 8.2406.0 -> 8.2408.0
Date: Wed, 28 Aug 2024 16:25:21 +0800
Message-Id: <1724833525-2162-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--5.950700-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/yUIIxwDaU5mrn5nfR7I2dFMyiHqxwIX2MW9c
	VO2+AmYaYlYwEUEmxDyD2SOxzTAM3paDrhnFqG90Oe06wPmWVkskXy0US052q3Pv73+bSjVa4HC
	XNYQRe3akxJuVk5oxMhrxLu0Fi00MiCsqewnUZGA/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365busIM/D0ygBYMkrVEqgmlT5ZwDhjpy6UVr0dPFETpBAHGfZImb3fqAQzDOuw0CFZEkJLN
	Sh4QSBd265bWmbTHvNtkLdMmnpDYq+/EguYor8cFEUknJ/kEl7dB/CxWTRRu25FeHtsUoHuc/tj
	1oaw0aSmG5272X10sziI+eShC34f6DRq/4S6SMJLhb8xGEnVfg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112020

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- omkafka enhance: write Kafka log with level ERROR or higher into errorfile
- net subsusytem bugfix: some config statemens were not accepted
- new "ossl" crypto provider
- imtcp: improve connection error messages

0001-tests-disable-the-check-for-inotify.patch
use-pkgconfig-to-check-libgcrypt.patch
refreshed for 8.2408.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-tests-disable-the-check-for-inotify.patch        | 8 ++++----
 .../rsyslog/use-pkgconfig-to-check-libgcrypt.patch        | 8 ++++----
 .../rsyslog/{rsyslog_8.2406.0.bb => rsyslog_8.2408.0.bb}  | 2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2406.0.bb => rsyslog_8.2408.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
index 4c41da518..13d1a7814 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
@@ -1,4 +1,4 @@
-From 9e36463b8a03e7de7468035e2dc63b36b5fd1965 Mon Sep 17 00:00:00 2001
+From 640b191b9566a6c18af73bf9cc4b9366a76acf62 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Sat, 27 Mar 2021 19:18:25 -0400
 Subject: [PATCH] tests: disable the check for inotify
@@ -20,10 +20,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/diag.sh b/tests/diag.sh
-index f30290c..2c4f6f0 100755
+index f4f3d86..497bb17 100755
 --- a/tests/diag.sh
 +++ b/tests/diag.sh
-@@ -2933,7 +2933,7 @@ case $1 in
+@@ -2950,7 +2950,7 @@ case $1 in
  		fi
  		;;
  	'check-inotify') # Check for inotify/fen support 
@@ -32,7 +32,7 @@ index f30290c..2c4f6f0 100755
  			echo [inotify mode]
  		elif [ -n "$(find /usr/include/sys/ -name 'port.h' -print -quit)" ]; then
  			grep -qF "PORT_SOURCE_FILE" < /usr/include/sys/port.h
-@@ -2948,7 +2948,7 @@ case $1 in
+@@ -2965,7 +2965,7 @@ case $1 in
  		fi
  		;;
  	'check-inotify-only') # Check for ONLY inotify support 
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
index cda2d99c0..45359a166 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
@@ -1,4 +1,4 @@
-From 5d200bd8ccb6acb8636dadc47eefc6763c0001d0 Mon Sep 17 00:00:00 2001
+From ceeaadb282531a416c1f605fa2100faa5de701e0 Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Wed, 18 Jun 2014 13:46:52 +0800
 Subject: [PATCH] use pkgconfig to check libgcrypt
@@ -15,10 +15,10 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
  1 file changed, 1 insertion(+), 14 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index a4506ec..46013cc 100644
+index 4af95c4..97e6282 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1181,20 +1181,7 @@ AC_ARG_ENABLE(libgcrypt,
+@@ -1200,20 +1200,7 @@ AC_ARG_ENABLE(libgcrypt,
          [enable_libgcrypt=yes]
  )
  if test "x$enable_libgcrypt" = "xyes"; then
@@ -39,4 +39,4 @@ index a4506ec..46013cc 100644
 +	PKG_CHECK_MODULES(LIBGCRYPT, libgcrypt)
  fi
  AM_CONDITIONAL(ENABLE_LIBGCRYPT, test x$enable_libgcrypt = xyes)
- AC_SUBST(LIBGCRYPT_CFLAGS)
+ AM_CONDITIONAL(ENABLE_RSCRYUTIL, test x$enable_libgcrypt = xyes || test x$enable_openssl_crypto_provider = xyes)
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2406.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2406.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
index b0c2fb298..41e396358 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2406.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
     file://disable-omfile-outchannel.patch \
 "
-SRC_URI[sha256sum] = "1343e0269dd32166ffde04d7ceebfa0e7146cf1dbc6962c56bf428c61f01a7df"
+SRC_URI[sha256sum] = "8bb2f15f9bf9bb7e635182e3d3e370bfc39d08bf35a367dce9714e186f787206"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


