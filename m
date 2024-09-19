Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C827ACE8D58
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11282.1726716761429403162
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UZ96PApv;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716763; x=1758252763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4/b0yRicYUNVyU54djMvAbvw6GPAONjYlldCYvj5344=;
  b=UZ96PApvjgUQjjuqdwtfhJW8tY3MJM8KHSsENV+joJ2OW3VTlJfdCkLq
   yHOBNqa5IaRZvodZpXCDXazfrN/21dNCzTxiU1z/Kf4HceW97cvjemvhV
   qQJnQXuPdx1KTJbtpFdqQmoTdBCZZSlBuPdL9mWWjEZNBKnBTrOzRMXpX
   ZD9OC4ePxt45GrE1mDxRmtqpJHQtAez+wotlbtwrF3W4wOqu7oQ063lkY
   iQkDbTzTG0vd0DVNhrWtXSV58dY5ayHl8qQft3R8KS7FK6XNa0aUJNel1
   ZG+42CyAYxaXVOLxMxF+KjCisS9bHs9YY4Ew+faGKk1TMgRcG7ntGL+iA
   Q==;
X-CSE-ConnectionGUID: lLghqubpQ/uha2jM80LDLA==
X-CSE-MsgGUID: KV8PQAJwSjueLYvuFu5Nug==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="161515782"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="161515782"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:42 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BB74BD8014
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F36ABD8BBE
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C93620086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 172111A01E9;
	Thu, 19 Sep 2024 11:32:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 26/28] stunnel: upgrade 5.72 -> 5.73
Date: Thu, 19 Sep 2024 11:32:11 +0800
Message-Id: <1726716733-14548-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10--13.001000-10.000000
X-TMASE-MatchedRID: AFiVwG0qm0+jz0nOeth/ySrLqyE6Ur/jwpoFhxXXuNAyKRnX9xPs4K4r
	mQIDoB6SkVBowix8lTzjFke91ZPGTI0BNOD/HJdhYO2LBxTMwiBr2qJoNIuCjYEBeX0uQ+npIxJ
	s0QKtQlteEP/t8LqgZp9w5P/YQGme5Ibfb+rfK2MD2WXLXdz+ARCE2NlBjIjcB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaL0vAsKYve2UpVRzPxemJL02FA7wK9mP9dIyDY579vwTDavM
	pat2LKS7zwVyz3W3hxRN0+wf81a26EW0IftG8AHWFHKJ2wSViTQtWdx8wWyB+P7J9bD7hSUuAD7
	OQCz91MSp+gMx1h+l52oLZ8u2T3EHxPMjOKY7A8LbigRnpKlKSBuGJWwgxAr0t0ccteCeDekLOa
	Oeh0n6wFmS+9ht/8aucaKplTzwygklEg1b/nYLuulxyHOcPoH
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112386

From: Wang Mingyu <wangmy@fujitsu.com>

fix-openssl-no-des.patch
refreshed for 5.73

Changelog:
===========
* Security bugfixes
  - OpenSSL DLLs updated to version 3.3.2.
  - OpenSSL FIPS Provider updated to version 3.0.9.
* Bugfixes
  - Fixed a memory leak while reloading stunnel.conf
    sections with "client=yes" and "delay=no".
  - Fixed TIMEOUTocsp with values greater than 4.
  - Fix the IPv6 test on a non-IPv6 machine.
* Features
  - HELO replaced with EHLO in the post-STARTTLS SMTP
    protocol negotiation (thx to Peter Pentchev).
  - OCSP stapling fetches moved away from server threads.
  - Improved client-side session resumption.
  - Added support for the mimalloc allocator.
  - Check for protocolHost moved to configuration file
    processing for the client-side CONNECT protocol.
  - Clarified some confusing OpenSSL's certificate
    verification error messages.
  - stunnel.nsi updated for Debian 13 and Fedora.
  - Improved NetBSD compatibility.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch  | 19 ++++++++-----------
 .../{stunnel_5.72.bb => stunnel_5.73.bb}      |  2 +-
 2 files changed, 9 insertions(+), 12 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.72.bb => stunnel_5.73.bb} (93%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
index 82d355101..8c4ca55fb 100644
--- a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -1,4 +1,4 @@
-From 7ff4eba20b5c4fc7365e5ee0dfb775ed29bdd5ce Mon Sep 17 00:00:00 2001
+From c815368a3e41dd3f639eb8fd82d21bc0bab55d1e Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 1 Nov 2017 09:23:41 -0400
 Subject: [PATCH] stunnel: fix compile error when openssl disable des support
@@ -17,10 +17,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/src/common.h b/src/common.h
-index 2b4869f..180d31a 100644
+index f112cf9..8d4be01 100644
 --- a/src/common.h
 +++ b/src/common.h
-@@ -492,7 +492,9 @@ extern char *sys_errlist[];
+@@ -496,7 +496,9 @@ extern char *sys_errlist[];
  #ifndef OPENSSL_NO_MD4
  #include <openssl/md4.h>
  #endif /* !defined(OPENSSL_NO_MD4) */
@@ -31,19 +31,19 @@ index 2b4869f..180d31a 100644
  #include <openssl/dh.h>
  #if OPENSSL_VERSION_NUMBER<0x10100000L
 diff --git a/src/protocol.c b/src/protocol.c
-index cfe6d3b..3936aea 100644
+index c8c65ea..b071b06 100644
 --- a/src/protocol.c
 +++ b/src/protocol.c
-@@ -81,7 +81,7 @@ NOEXPORT void ldap_client_middle(CLI *);
- 
+@@ -82,7 +82,7 @@ NOEXPORT void ldap_client_middle(CLI *);
  NOEXPORT void connect_server_early(CLI *);
+ NOEXPORT const char *connect_client_init(SERVICE_OPTIONS *);
  NOEXPORT void connect_client_middle(CLI *);
 -#ifndef OPENSSL_NO_MD4
 +#if !defined(OPENSSL_NO_MD4) && !defined(OPENSSL_NO_DES)
  NOEXPORT void ntlm(CLI *);
  NOEXPORT char *ntlm1(void);
  NOEXPORT char *ntlm3(char *, char *, char *, char *);
-@@ -1331,7 +1331,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+@@ -1334,7 +1334,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
      fd_printf(c, c->remote_fd.fd, "Host: %s", c->opt->protocol_host);
      if(c->opt->protocol_username && c->opt->protocol_password) {
          if(!strcasecmp(c->opt->protocol_authentication, "ntlm")) {
@@ -52,7 +52,7 @@ index cfe6d3b..3936aea 100644
              ntlm(c);
  #else
              s_log(LOG_ERR, "NTLM authentication is not available");
-@@ -1374,7 +1374,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+@@ -1377,7 +1377,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
      str_free(line);
  }
  
@@ -61,6 +61,3 @@ index cfe6d3b..3936aea 100644
  
  /*
   * NTLM code is based on the following documentation:
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.72.bb b/meta-networking/recipes-support/stunnel/stunnel_5.73.bb
similarity index 93%
rename from meta-networking/recipes-support/stunnel/stunnel_5.72.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.73.bb
index 6d21027a1..e13b7871c 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.72.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.73.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "3d532941281ae353319735144e4adb9ae489a10b7e309c58a48157f08f42e949"
+SRC_URI[sha256sum] = "bc917c3bcd943a4d632360c067977a31e85e385f5f4845f69749bce88183cb38"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.34.1


