Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C456C636D7
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:33:48 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.5659.1676536422655829689
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:33:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LXMpbhWw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676536420; i=@fujitsu.com;
	bh=bWF1J8t21EMB5Un52qZzlCZR2zdxLaki7H8FKLozz2g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LXMpbhWwkkoKvbRfa82SGMW3ACsQEcyl8UKwT6VXocX5IjwqABvTp7IrKqkZIvFjc
	 3owHHIcVrAV+ybTr/rFrBh7Lw7qLWGp/QUnMHNAd2n7f8OHGjekvbRf3oof5TQniKv
	 DI5YYk2nuVJNkXKXkbSt0ULWF9s3u/JHj1RN2V0eNWTru06puduLM0YLE9vn/r4rK3
	 1eIlYfREs16cW//ZsHaVb2ES1nlBaXmSUq2ByjlU02PmGRCYDZK1TjEdnJ3tM2NVhS
	 RkDIOe1v8o4dfPzArQJvhRcosxuy9rOFXomIJBF4EZtGaN45HtNTdMeCkV37fTNkHQ
	 FQP6SApBou0Gg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8OxWTfl1dt
  kg/Pn+SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozvH3eyFPTrVGybeJmxgXGFehcjF4eQwENG
  iZXPfrFCOFeYJH68fcYO4exllOhcfIati5GTg01ASuLG/f9gtoiAvsTS2XuYQWxmARWJF7972
  EFsYYFQicn/nrKA2CwCqhL9zyaC1fMKOEncWrUcLC4hoCAx5eF7sF5OAWeJbRtWAMU5gJY5SU
  x/Ew1RLihxcuYTFojxEhIHX7xghmhVlJh9uRlqTKVE64dfULaaxNVzm5gnMArOQtI+C0n7Aka
  mVYxmxalFZalFukYGeklFmekZJbmJmTl6iVW6iXqppbrlqcUluoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBwZtSzLh3B+Pkvr96hxglOZiURHmLdd8mC/El5adUZiQWZ8QXleakFh9ilOHgUJLg3
  fAMKCdYlJqeWpGWmQOMJJi0BAePkgiv4BWgNG9xQWJucWY6ROoUozFH+/auA8wcm/YBSSGWvP
  y8VClx3qUvgEoFQEozSvPgBsEi/BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd5okCk8mXk
  lcPteAZ3CBHTKAmawU0oSEVJSDUwejieOMZwSjPeo8VkSJOl1rfOzafC5r7t4vvrP2SRTN2ud
  uNOCF+t2ejmnCC1PvJA0fc4aud/X73288Hvf15tNAfNd2bRDJ687kfM71MxW+WNekJJORc3dy
  ym5Z27f8M+8+8lYPUJh0bSz/y+Jz7/yqtz3p+Q6pn2Roq+WpDB9mlTNubaz7fmtB6/nirk9FL
  HefMjwl8eUE27lAh+PX3c6sL19zQ4ZdY4gM7mgqZuOv/08y+Tl6eWswpaNn9Qt97gHrv12aEn
  Sx5P+DKnrbvAt9b9dL6dmHxhdVTjv1AOjt9Pui0ROTY1+nmvAonlb0/LvCa641i7TI+F1Oks9
  TG1M5R22BCZGszItEDMpODxfiaU4I9FQi7moOBEA27UNGmsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-585.messagelabs.com!1676536420!136617!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7365 invoked from network); 16 Feb 2023 08:33:40 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-12.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Feb 2023 08:33:40 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D7DCD142
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:39 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id CB6237B
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:39 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 16 Feb 2023 08:33:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] iscsi-initiator-utils: upgrade 2.1.7 -> 2.1.8
Date: Thu, 16 Feb 2023 16:33:20 +0800
Message-ID: <1676536403-14449-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676536403-14449-1-git-send-email-wangmy@fujitsu.com>
References: <1676536403-14449-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101091

From: Wang Mingyu <wangmy@fujitsu.com>

0002-iscsiuio-Use-pthread_t-for-INVALID_THREAD.patch
removed since it's included in 2.1.8.

0001-Makefile-Do-not-set-Werror.patch
refreshed for 2.1.8

Changelog:
===========
 make: avoid hard-coding path to sed (#357)
 etc: install system unit with without executable bit (#354)
 Add ability for MGMT IPC to check UID only
 Use config for iscsistart and iscsiadm fw login
 iscsiuio: Use pthread_t for INVALID_THREAD (#363)
 Add a 'distclean' Makefile top-level target
 Cleanup fwparam makefile (#360)
 Small bug fixes (#364)
 Use meson as the main build system (#365)
 libopeniscsiusr: cleanup recent reallocarray->realloc change (#369)
 Added examples in man file for iscsiadm session commands.
 iscsid: fix logout pdu send failure handling
 Update README's error handler/timeout section
 iscsiuio: fix LDADD
 libopeniscsiusr: use realloc instead of reallocarray (#368)
 iscsiadm: enable specify iface name-value parameters when creating iface
 Fix a possible passing null pointer in usr/iface.c (#356)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Makefile-Do-not-set-Werror.patch     | 10 ++++---
 ...uio-Use-pthread_t-for-INVALID_THREAD.patch | 27 -------------------
 ....1.7.bb => iscsi-initiator-utils_2.1.8.bb} |  3 +--
 3 files changed, 7 insertions(+), 33 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-Use-pthread_t-for-INVALID_THREAD.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.7.bb => iscsi-initiator-utils_2.1.8.bb} (97%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
index ab6ff6e13..d720a1adb 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
@@ -9,13 +9,12 @@ warning as errors
 Upstream-Status: Inappropriate [OE-Specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  usr/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/usr/Makefile b/usr/Makefile
-index 3fc2248..2b5a234 100644
+index 84f33bc..9e7b839 100644
 --- a/usr/Makefile
 +++ b/usr/Makefile
 @@ -44,7 +44,7 @@ HOMEDIR ?= $(etcdir)/iscsi
@@ -25,5 +24,8 @@ index 3fc2248..2b5a234 100644
 -WARNFLAGS ?= -Wall -Wextra -Werror -Wstrict-prototypes -fno-common
 +WARNFLAGS ?= -Wall -Wextra -Wstrict-prototypes -fno-common
  CFLAGS += $(WARNFLAGS) -I../include -I. -D_GNU_SOURCE \
- 	  -I$(TOPDIR)/libopeniscsiusr
- CFLAGS += $(shell $(PKG_CONFIG) --cflags libkmod)
+ 	  -I$(TOPDIR)/libopeniscsiusr \
+ 	  -DISCSI_VERSION_STR=\"$(ISCSI_VERSION_STR)\"
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-Use-pthread_t-for-INVALID_THREAD.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-Use-pthread_t-for-INVALID_THREAD.patch
deleted file mode 100644
index 02669e9c8..000000000
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-Use-pthread_t-for-INVALID_THREAD.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From ef54a6f4a81da8ab653d352bfbd3b2521ce9eb7c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 29 Aug 2022 15:55:32 -0700
-Subject: [PATCH] iscsiuio: Use pthread_t for INVALID_THREAD
-
-pthread_t is opaque, therefore avoid compiler errors on musl when
-compiling since pthread_t is not a plain old data type, like glibc
-
-Upstream-Status: Submitted [https://github.com/open-iscsi/open-iscsi/pull/363]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- iscsiuio/src/unix/options.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iscsiuio/src/unix/options.h b/iscsiuio/src/unix/options.h
-index 63b8635..873a98a 100644
---- a/iscsiuio/src/unix/options.h
-+++ b/iscsiuio/src/unix/options.h
-@@ -86,7 +86,7 @@
- #define DEBUG_ON	0x2
- 
- #define INVALID_FD	-1
--#define INVALID_THREAD	-1
-+#define INVALID_THREAD	(pthread_t)-1
- #define INVALID_HOST_NO	-1
- 
- struct options {
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.7.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
similarity index 97%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.7.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
index 3ed55d65a..2caddbb54 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.7.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
@@ -12,7 +12,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "7b53fcc502da8617110fd64d675b476772c28a6f"
+SRCREV = "543ba0f15d340b97f30782308cec424a6738fec3"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https \
            file://0001-Makefile-Do-not-set-Werror.patch \
@@ -22,7 +22,6 @@ SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https \
            file://iscsi-initiator.service \
            file://iscsi-initiator-targets.service \
            file://set_initiatorname \
-           file://0002-iscsiuio-Use-pthread_t-for-INVALID_THREAD.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.34.1


