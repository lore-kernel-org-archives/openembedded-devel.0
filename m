Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7842DC6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 06:17:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.13494.1678429059539201338
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 22:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hlw0xg7E;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678429057; i=@fujitsu.com;
	bh=BqQ9g6Bec0lkaMdMGGIGj5gIDVqrQW4rrh0jK2hASUk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hlw0xg7EDBUyptuY9zohxPF2tOaYJ28Rejii+5Sv5QsnsUADJySysGEoyRxFMBmDM
	 2hw2VrNs9hGVMhOlBR4Z31FFjBLr81biTc4BvDEpXB3vN7OAOcgru7OA/ww/IjmZAt
	 2LmDdNbvECVcObw2z5NKdhxaNfGYlTVcvVyBbcWU2jSOkRqW8KEta1tff5L857HhKh
	 LCAs1Abx7CdKWaWO/AgZY8TI/E0sjP2z/o5hxpFn9hnb69zmJgaZtlueqCmD223k3l
	 sOYEOO5OqhyHFcOrQbWjNsMne8Gd32XEyKryw7kDZ9JFhb2OmdLhUWMchPwUUpDaYd
	 dHD+KUsZoyTaw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORpNt4miv
  F4OAbFouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNp0lX2gvXSFe8vb2FsYNwj0cXIxSEk8JBR
  4srhFawQzhUmic3dLxghnD2MEj13XzB3MXJysAlISdy4/58NxBYR0JdYOnsPWJxZQEXixe8ed
  hBbWCBA4uPWZjCbRUBVYsHpfawgNq+Ao8S/dV/AbAkBBYkpD98zQ8QFJU7OfMICMUdC4uALiF
  0SAooSsy83s0DYFRKN0w8xQdhqElfPbWKewMg/C0n7LCTtCxiZVjGaFacWlaUW6Roa6CUVZaZ
  nlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEhmNKsSLrDsZLfX/1
  DjFKcjApifIqp3KlCPEl5adUZiQWZ8QXleakFh9ilOHgUJLglQQGuJBgUWp6akVaZg4wNmDSE
  hw8SiK8rDuA0rzFBYm5xZnpEKlTjIpS4rysx4ESAiCJjNI8uDZYPF5ilJUS5mVkYGAQ4ilILc
  rNLEGVf8UozsGoJMwrcQJoCk9mXgnc9FdAi5mAFu/awgGyuCQRISXVwLR506m11YV7fVLVrxy
  sWZKWJfTl27bq/Uw7Hea31WyWXrstjVus5mOUj4PVNt2+BTFRfe7flzcaFEiqPYltuyN895mg
  weVlMtuNXOyjy+15A9lOWPF17jsiWvT4R+nHPS8FQ6Uyz+runPYr8la4wGkPkbMc608zzIrL/
  +3et6XCc3/jJgt/46ZX1hsjRJk+iHNLy9aUijU+ywzdfWKmf2bNd+6XLR82OPDXJdUXJfNX+j
  19e+78cUb9NuVOg7+Vmzx8CnN55/geuSwYMP/v7L76DlszNn6WeXoOT5dvOqe57V5+jXTVC91
  uU49jyte+PgmRCwyf8XVCp9jRcsl23kdaZufiD/HrHOHycOlRYinOSDTUYi4qTgQAEe+j5EID
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1678429056!51404!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28661 invoked from network); 10 Mar 2023 06:17:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 06:17:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C0BD51B1
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:17:36 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B5DBA1AE
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:17:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 06:17:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 11/11] spawn-fcgi: upgrade 1.6.4  -> 1.6.5
Date: Fri, 10 Mar 2023 14:17:25 +0800
Message-ID: <1678429045-7797-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101483

From: Wang Mingyu <wangmy@fujitsu.com>

fix_configure_ipv6_test.patch
removed since it's included in 1.6.5

Changelog:
==========
  * Configure script cleanups (fixing detection of IPv6)
  * Update links and email addresses

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fix_configure_ipv6_test.patch             | 35 -------------------
 ...pawn-fcgi_1.6.4.bb => spawn-fcgi_1.6.5.bb} |  6 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi-1.6.4/fix_configure_ipv6_test.patch
 rename meta-webserver/recipes-support/spawn-fcgi/{spawn-fcgi_1.6.4.bb => spawn-fcgi_1.6.5.bb} (66%)

diff --git a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi-1.6.4/fix_configure_ipv6_test.patch b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi-1.6.4/fix_configure_ipv6_test.patch
deleted file mode 100644
index 9409dd2b1..000000000
--- a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi-1.6.4/fix_configure_ipv6_test.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Testing for IPv6 support got broken by configure.ac changes in 1.6.4
-As a temp workaround, revert back to the 1.6.3 version.
-
-Upstream-Status: Pending
-
---- spawn-fcgi-1.6.4/configure.ac
-+++ spawn-fcgi-1.6.3/configure.ac
-@@ -66,8 +47,8 @@
- # Check for IPv6 support
- 
- AC_ARG_ENABLE(ipv6,
--  AC_HELP_STRING([--disable-ipv6],[disable IPv6 support]),
--  [case "${enableval}" in
-+ AC_HELP_STRING([--disable-ipv6],[disable IPv6 support]),
-+ [case "${enableval}" in
-    yes) ipv6=true ;;
-     no) ipv6=false ;;
-      *) AC_MSG_ERROR(bad value ${enableval} for --enable-ipv6) ;;
-@@ -75,13 +56,10 @@
- 
- if test x$ipv6 = xtrue; then
-   AC_CACHE_CHECK([for IPv6 support], ac_cv_ipv6_support,
--    [AC_TRY_LINK([[
--#include <sys/types.h>
-+  [AC_TRY_LINK([ #include <sys/types.h>
- #include <sys/socket.h>
--#include <netinet/in.h>
--    ]], [[
--struct sockaddr_in6 s; struct in6_addr t=in6addr_any; int i=AF_INET6; s; t.s6_addr[0] = 0;
--    ]], [ac_cv_ipv6_support=yes], [ac_cv_ipv6_support=no])])
-+#include <netinet/in.h>], [struct sockaddr_in6 s; struct in6_addr t=in6addr_any; int i=AF_INET6; s; t.s6_addr[0] = 0; ],
-+  [ac_cv_ipv6_support=yes], [ac_cv_ipv6_support=no])])
- 
-   if test "$ac_cv_ipv6_support" = yes; then
-     AC_DEFINE(HAVE_IPV6,1,[Whether to enable IPv6 support])
diff --git a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.5.bb
similarity index 66%
rename from meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
rename to meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.5.bb
index 808d4528c..307919f77 100644
--- a/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.4.bb
+++ b/meta-webserver/recipes-support/spawn-fcgi/spawn-fcgi_1.6.5.bb
@@ -4,11 +4,9 @@ HOMEPAGE = "http://redmine.lighttpd.net/projects/spawn-fcgi"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
 
-SRC_URI = "http://download.lighttpd.net/spawn-fcgi/releases-1.6.x/spawn-fcgi-${PV}.tar.gz \
-           file://fix_configure_ipv6_test.patch"
+SRC_URI = "http://download.lighttpd.net/spawn-fcgi/releases-1.6.x/spawn-fcgi-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "e970de4efe8045c01dd76280f39901aa"
-SRC_URI[sha256sum] = "ab327462cb99894a3699f874425a421d934f957cb24221f00bb888108d9dd09e"
+SRC_URI[sha256sum] = "a72d7bf7fb6d1a0acda89c93d4f060bf77a2dba97ddcfecd00f11e708f592c40"
 
 inherit autotools
 
-- 
2.34.1


