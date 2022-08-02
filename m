Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78520C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:41:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.6250.1659447698201293277
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:41:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qSQf35MZ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659447696; i=@fujitsu.com;
	bh=Gg594t9TAmlhmuqqCAOd+/LHzMh+uWCPtY9yR/i5c54=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=qSQf35MZ9PgG58aqWuCpmqGF94pnmtYR93Ncrkd4RBpl4/va8MWjNt0XjvhntX8Ee
	 WBfhrclkhIH7KnMT8/WQOtW4ZMuWrHHCbnvM+fJe6vVP82sj+svUOxyLty2iEpTIBr
	 8wWYT7uK/ame4rywfsgb3rPuWTygmz8RngarIYGUB6b1aykILZIlE5P1KtqIRvRQVT
	 4HZ/SUrO8kItk1ou7LDYw4XpEeUkzeSxLiIX1l1iFT2H/Iaw6/bOR1ju4qwgGy99Ku
	 aYTsNun1U1L0WOyZ9EdOTGx/nqOgqlMWjFlE5ULrWjimEmij23aCnCk1ClafOZYYy+
	 ICe+i6S4MneUg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8MxSXeC5ss
  kgz3vxCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oy9vS9YC07LVFxae5W9gfGOZBcjF4eQwBNG
  iburZ7B1MXICOdeZJFpuJkMkdjNKbJ54jR0kwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgLeEjM/7gQaxMHBAhR/dVMOJMwr4CSx4tdNFhBbQkBBYsrD92CtnALOEpcmnQErFwKq2b
  6+EKJcUOLkzCcsENMlJA6+eMEM0aooMftyM9SYCokZM7axQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6hpb6loY6SVW6SbqpZbqlqcWl+gCueXFeqnFxXrFlbnJ
  OSl6eaklmxiBAZxSrB60g/Hbip96hxglOZiURHnlFF8mCfEl5adUZiQWZ8QXleakFh9ilOHgU
  JLgvaUKlBMsSk1PrUjLzAFGE0xagoNHSYT3rAZQmre4IDG3ODMdInWKUZdj5te2A8xCLHn5ea
  lS4rzLQYoEQIoySvPgRsAi+xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4+kCk8mXklcJt
  eAR3BBHSEDtcLkCNKEhFSUg1MzqevmX3rfvBlL0Noa6/+qvbjjvY+kev0nyjaPP//w81UJ9JO
  ceLW7xWbk2TuvfHUi3/+Jo9lj9JdZcei9c2V/f/+Z6dtzuCKd2pMlqhV4r+3arZE1SO7DoUzr
  Q1lm9lOi552V4vXP3fvGdfhty9aEs7b/5xfHR43waI9mt1lc7L+sftt+9u1hFVaf3Gwyk7T1s
  l70F4Q6WX0dtmO7bIympJfb63mvrLZKfzGL8XlfGycP19vqvlw8eMnNu8Hzx9t83xRl/7RcOf
  v5x9Sjp6TvxR8SPP37hsnTt4/8jz19m8z7dK3TsK7Q23NtPfwh93ZYqkYlXGe/33t9m1fv8xq
  cc4pW6Q9b0H2rXOnTikrKrEUZyQaajEXFScCAOHrg35nAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1659447696!312728!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16947 invoked from network); 2 Aug 2022 13:41:36 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Aug 2022 13:41:36 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 198B31000C2
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:41:36 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0D15C100077
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  2 Aug 2022 14:41:36 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 2 Aug 2022 14:41:34 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] pure-ftpd: upgrade 1.0.50 -> 1.0.51
Date: Tue, 2 Aug 2022 21:41:09 +0800
Message-ID: <1659447669-24388-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1659447669-24388-1-git-send-email-wangmy@fujitsu.com>
References: <1659447669-24388-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:41:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98092

0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
updated for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...oded-usr-local-includes-from-configure.a.patch | 15 +++++++++------
 .../{pure-ftpd_1.0.50.bb => pure-ftpd_1.0.51.bb}  |  4 ++--
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-daemons/pure-ftpd/{pure-ftpd_1.0.50.bb => pure-ftpd_1.0.51.bb} (81%)

diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
index 2606a36675..c213943d53 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd/0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch
@@ -11,15 +11,17 @@ Signed-off-by: Tudor Florea <tudor.florea@enea.com>
 Update for 1.0.49.
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 
+Update for 1.0.51.
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
- configure.ac | 15 ---------------
- 1 file changed, 15 deletions(-)
+ configure.ac | 16 ----------------
+ 1 file changed, 16 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 079e6f0..9a1ec06 100644
+index 62768c8..efaeee5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -96,21 +96,6 @@ AX_CHECK_LINK_FLAG([-Wl,-z,relro], [LDFLAGS="$LDFLAGS -Wl,-z,relro"])
+@@ -97,22 +97,6 @@ AX_CHECK_LINK_FLAG([-Wl,-z,relro], [LDFLAGS="$LDFLAGS -Wl,-z,relro"])
  AX_CHECK_LINK_FLAG([-Wl,-z,now], [LDFLAGS="$LDFLAGS -Wl,-z,now"])
  AX_CHECK_LINK_FLAG([-Wl,-z,noexecstack], [LDFLAGS="$LDFLAGS -Wl,-z,noexecstack"])
  
@@ -27,7 +29,8 @@ index 079e6f0..9a1ec06 100644
 -  for path in \
 -    /usr/kerberos \
 -    /usr/local /opt /usr/local/opt \
--    /usr/openssl@1.1 /opt/openssl@1.1 /usr/local/opt/openssl@1.1 \
+-    /opt/homebrew/opt/openssl@3 /usr/local/opt/openssl@3 \
+-    /opt/homebrew/opt/openssl@1.1 /usr/local/opt/openssl@1.1 \
 -    /usr/openssl /opt/openssl /usr/local/opt/openssl; do
 -    if test -d $path/include; then
 -      CPPFLAGS="$CPPFLAGS -I${path}/include"
@@ -42,5 +45,5 @@ index 079e6f0..9a1ec06 100644
  
  dnl Checks for header files
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
similarity index 81%
rename from meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb
rename to meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
index edc2af3a34..6f03f73db5 100644
--- a/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.50.bb
+++ b/meta-networking/recipes-daemons/pure-ftpd/pure-ftpd_1.0.51.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Pure-FTPd is a free (BSD license), secure, production-quality and
 HOMEPAGE = "http://www.pureftpd.org/project/pure-ftpd"
 SECTION = "net"
 LICENSE = "0BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a4496a14dea009df36c612707d455d02"
+LIC_FILES_CHKSUM = "file://COPYING;md5=194bc994ad6bbd4ff5a021082fe52156"
 
 DEPENDS = "libcap virtual/crypt"
 
@@ -11,7 +11,7 @@ SRC_URI = "http://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-${PV}.t
            file://0001-Remove-hardcoded-usr-local-includes-from-configure.a.patch \
            file://nostrip.patch \
 "
-SRC_URI[sha256sum] = "abe2f94eb40b330d4dc22b159991f44e5e515212f8e887049dccdef266d0ea23"
+SRC_URI[sha256sum] = "4160f66b76615eea2397eac4ea3f0a146b7928207b79bc4cc2f99ad7b7bd9513"
 
 inherit autotools
 
-- 
2.25.1


