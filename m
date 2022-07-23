Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A433CC43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:33:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.2520.1658806395973662400
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uDsQGwyz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806393; i=@fujitsu.com;
	bh=Rj/LY3c4zJa5HJ5z0Dy72BmvdW0PnQui9ylxWoIEhq0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=uDsQGwyz6OrK61W+vp3tLa1eRB7r+85mVGJK1b9Nfnz21ZFO0F2dgSlfdEa0MVUFw
	 Y+yiffAWTKxeI94NGcJL4onzfNqV+4LX6NFSEN5//WDSKMU8BwT1qUW/WM5Ym9Wt8W
	 nmbkwsaxfZ8iHHvysEyiRIyn/dXSWpiqUjgIWYYG+Qn9L6OI/SfNgZzK/IKiQKOCpV
	 kQsy6JfZWGvDpv+CA5TJCJVqI6Zl2NrBNkVg9xyNXTZU3phIUo4pDDpuflLHJaTfh5
	 99Hyk4jW0uM6n7yuC8eZowvHEWAZrSJrXQzPr+5vEEBviQr5+9OtOFj0dW76VhtPZk
	 6xDi5jibWwsvg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRWlGSWpSXmKPExsViZ8ORpFuRcD/
  J4OF9S4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPLjz/MBfeUKi5uamRvYPwr28XIySEk8JBR
  YvLF4i5GLiD7CpPEzEfLWSCcPYwSJ75sZQGpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAVeLIkaeMIDaLgKrEg/sLgGo4OHgFHCWmbjQACUsIKEhMefgerJVTwEni4/HPbBBHOE
  rMf9jGBGLzCghKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJGbM2MYGYatJXD23iXkCo+AsJO2
  zkLQvYGRaxWibVJSZnlGSm5iZo2toYKBraGgKpI11jQzN9BKrdBP1Ukt18/KLSjJ0DfUSy4v1
  UouL9Yorc5NzUvTyUks2MQIDOaU4/cYOxl37fukdYpTkYFIS5d3SeS9JiC8pP6UyI7E4I76oN
  Ce1+BCjDAeHkgTv67j7SUKCRanpqRVpmTnAqIJJS3DwKInwlsYApXmLCxJzizPTIVKnGC05ps
  7+t5+ZYzmYnPm17QCzEEtefl6qlDjvCpB5AiANGaV5cONgkX+JUVZKmJeRgYFBiKcgtSg3swR
  V/hWjOAejkjBvajzQFJ7MvBK4ra+ADmICOuiT9h2Qg0oSEVJSDUxGbK/V37zbWD/7cTu/zyux
  7Wu6Ppy7tcmp/JxkzNmd/6qFr4vmzhR37dX2sWKd4Zq0PDMxSq6Eq9zO2DHwRI/ppvypVfzuR
  7W/Gv6p+sC2tO/8Qj3vOu9lnCtmLklwm7x82ZXSA7ZVxemxX55LdgeZTP3EeoTx1IxPqfJ7vg
  ksOPrdKX3noaJAxwNH0maaV0Xc6n0mJdS8IJix8TXnA8ntQR0bmPwcJy9YU+Zz7D2TQiTzwSN
  9xj4Nt24KlUx4euHc5mndfmqcuz6d3Gb8oz7bzP+p8cxXDyoNsg4suXxHp++FwS3OlsZEs18v
  Gh2qLVmX7rI6x1BtUvD4A2sdW3NhzAYz54B1ZfuPmUvZT1FiKc5INNRiLipOBABP3FLedwMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1658806392!113809!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23688 invoked from network); 26 Jul 2022 03:33:12 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:33:12 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 537231AF
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:33:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 487CE1AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:33:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:33:10 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] stunnel: upgrade 5.64 -> 5.65
Date: Sat, 23 Jul 2022 13:38:22 +0800
Message-ID: <1658554703-9317-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658554703-9317-1-git-send-email-wangmy@fujitsu.com>
References: <1658554703-9317-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97981

fix-openssl-no-des.patch
refreshed for version 5.65

Changelog:
==========
    Security bugfixes
        OpenSSL DLLs updated to version 3.0.5.
    Bugfixes
        Fixed handling globally enabled FIPS.
        Fixed the default openssl.cnf path in stunnel.exe.
        Fixed a number of MSVC warnings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch  | 24 +++++++++++++------
 .../{stunnel_5.64.bb => stunnel_5.65.bb}      |  2 +-
 2 files changed, 18 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.64.bb => stunnel_5.65.bb} (93%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
index aeb0bece97..0840cbbd8b 100644
--- a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -1,3 +1,8 @@
+From 7ff4eba20b5c4fc7365e5ee0dfb775ed29bdd5ce Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 1 Nov 2017 09:23:41 -0400
+Subject: [PATCH] stunnel: fix compile error when openssl disable des support
+
 Upstream-Status: Pending
 
 When openssl disable des support with configure option 'no-des', it doesn't
@@ -6,12 +11,17 @@ failed. Fix it by checking macro OPENSSL_NO_DES to use openssl des related
 library conditionaly.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
+ src/common.h   | 2 ++
+ src/protocol.c | 6 +++---
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
 diff --git a/src/common.h b/src/common.h
-index f7d38b0..bf485af 100644
+index bc37eb5..03ee3e5 100644
 --- a/src/common.h
 +++ b/src/common.h
-@@ -478,7 +478,9 @@ extern char *sys_errlist[];
+@@ -486,7 +486,9 @@ extern char *sys_errlist[];
  #ifndef OPENSSL_NO_MD4
  #include <openssl/md4.h>
  #endif /* !defined(OPENSSL_NO_MD4) */
@@ -22,19 +32,19 @@ index f7d38b0..bf485af 100644
  #include <openssl/dh.h>
  #if OPENSSL_VERSION_NUMBER<0x10100000L
 diff --git a/src/protocol.c b/src/protocol.c
-index 587df09..8198eb6 100644
+index 804f115..d9b2b50 100644
 --- a/src/protocol.c
 +++ b/src/protocol.c
-@@ -67,7 +67,7 @@ NOEXPORT char *imap_server(CLI *, SERVICE_OPTIONS *, const PHASE);
+@@ -66,7 +66,7 @@ NOEXPORT char *nntp_client(CLI *, SERVICE_OPTIONS *, const PHASE);
  NOEXPORT char *ldap_client(CLI *, SERVICE_OPTIONS *, const PHASE);
  NOEXPORT char *connect_server(CLI *, SERVICE_OPTIONS *, const PHASE);
  NOEXPORT char *connect_client(CLI *, SERVICE_OPTIONS *, const PHASE);
 -#ifndef OPENSSL_NO_MD4
 +#if !defined(OPENSSL_NO_MD4) && !defined(OPENSSL_NO_DES)
  NOEXPORT void ntlm(CLI *, SERVICE_OPTIONS *);
- NOEXPORT char *ntlm1();
+ NOEXPORT char *ntlm1(void);
  NOEXPORT char *ntlm3(char *, char *, char *, char *);
-@@ -1332,7 +1332,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
+@@ -1351,7 +1351,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
      fd_printf(c, c->remote_fd.fd, "Host: %s", opt->protocol_host);
      if(opt->protocol_username && opt->protocol_password) {
          if(!strcasecmp(opt->protocol_authentication, "ntlm")) {
@@ -43,7 +53,7 @@ index 587df09..8198eb6 100644
              ntlm(c, opt);
  #else
              s_log(LOG_ERR, "NTLM authentication is not available");
-@@ -1376,7 +1376,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
+@@ -1395,7 +1395,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
      return NULL;
  }
  
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.64.bb b/meta-networking/recipes-support/stunnel/stunnel_5.65.bb
similarity index 93%
rename from meta-networking/recipes-support/stunnel/stunnel_5.64.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.65.bb
index 13ecd5c5bf..ab7ff43223 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.64.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.65.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "eebe53ed116ba43b2e786762b0c2b91511e7b74857ad4765824e7199e6faf883"
+SRC_URI[sha256sum] = "60c500063bd1feff2877f5726e38278c086f96c178f03f09d264a2012d6bf7fc"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.25.1


