Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E9CCD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16933.1779875330237326695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PtW8qukb;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875333; x=1811411333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ms9NTgBy2DbUBcrsUzd4Kwc+ywwKjgnxm/K2zc99bNI=;
  b=PtW8qukb5i0fKaPGNY16RV+QAP3zCQ5mJ+HTRiDSZTSopRBYguASwocA
   pRPunzyCz9qcBrt7+0kYsplwteaMn4WReByDTlMySxFb4ZivktyEbhwO4
   0jREz5HO8/BqWdxr83Cqn5WQXXCIuMNSmnoQ2hiQE0QizakuTWKY5VDcy
   BdNqAHTM9J0nNe0DHCS1LSaAOzT0C4IEA7Pdh/Rt4OwsnxKbp87WlcEiA
   47QDI9PXr1K3tUZRkgz+Qf0nArA0DMI6+2+36HZ+9Pw/vm9KXN9mGzXcJ
   8Zo3Uj1moHuFGwlF/SOKQSL6xk7kFcllQoGbv1WlvOx+1ZOWBj4z5QCbq
   Q==;
X-CSE-ConnectionGUID: N33cC33OQ5W5big+r2D5JA==
X-CSE-MsgGUID: 93khhsnzQv69rraSzxl+zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241969815"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241969815"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:52 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CE5ED42A338
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:51 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7F73F1C2FBAF
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 9414482A2CE;
	Wed, 27 May 2026 09:48:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 20/56] postfix: upgrade 3.11.2 -> 3.11.3
Date: Wed, 27 May 2026 17:47:29 +0800
Message-ID: <20260527094805.2039-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127227

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-build-with-musl.patch
refreshed for 3.11.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../postfix/files/0001-Fix-build-with-musl.patch      | 11 +++--------
 .../postfix/{postfix_3.11.2.bb => postfix_3.11.3.bb}  |  2 +-
 2 files changed, 4 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.11.2.bb => postfix_3.11.3.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
index d09418eaac..6574db9d61 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-build-with-musl.patch
@@ -1,4 +1,4 @@
-From cbe5ba0deeba6329eed63eade06bb8c062d0d445 Mon Sep 17 00:00:00 2001
+From c7ea1cce7f4f83e9ff27873a96113bdb382bb296 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Fri, 8 May 2026 22:39:54 +0800
 Subject: [PATCH] Fix build with musl
@@ -27,10 +27,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
-index 74319f2..6d3c7d2 100644
+index 09a05bd..15ea8c6 100644
 --- a/src/util/sys_defs.h
 +++ b/src/util/sys_defs.h
-@@ -794,12 +794,14 @@ extern int initgroups(const char *, int);
+@@ -794,10 +794,12 @@ extern int initgroups(const char *, int);
  #define NATIVE_NEWALIAS_PATH "/usr/bin/newaliases"
  #define NATIVE_COMMAND_DIR "/usr/sbin"
  #define NATIVE_DAEMON_DIR "/usr/libexec/postfix"
@@ -38,13 +38,8 @@ index 74319f2..6d3c7d2 100644
  #if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1)
  #define SOCKADDR_SIZE	socklen_t
  #define SOCKOPT_SIZE	socklen_t
- #else
- #define NO_SNPRINTF
  #endif
 +#endif
  #ifndef NO_IPV6
  #define HAS_IPV6
  #if HAVE_GLIBC_API_VERSION_SUPPORT(2, 4)
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.3.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.11.3.bb
index 894e58261b..0c38c743e7 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.3.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0001-Fix-build-with-musl.patch \
            "
 
-SRC_URI[sha256sum] = "daed65b08c9288cdb386a914f3e52cdddd44935407b5ce5aee8bcc3aa4207778"
+SRC_URI[sha256sum] = "bd11dcc463d7045e40f2c11cc00216489c73b58cc40b3d06c54265b088a173e1"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


