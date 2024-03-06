Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1645CC54E49
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:58 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7740.1709714696437658064
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p1aAPLmV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714696; x=1741250696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4s8QJiw5psbsgF8A8WI3up35nnqdwnfVwe44mqKebtQ=;
  b=p1aAPLmVgoTinlKSEfW26QhSaxmrsqWM2sBmWx+l48FOGQPnEgR+CwNv
   HDNLD7AUk2/49TdoY9zh3krPelceIGzeuDGR8km4+qcTHVlAZkbW9NcEf
   lYn/ls3Ak4wQ0YF35wQ1w0X7TSVa+B+sms4hz3Ba7VegBX6jHhhg1aG7b
   77wb4wlK2+ayw9SdFXSg1CRvzu4O4jN2h3Sk9DV+LlU38ZNcJo+Sq3K9w
   BDIgFUozFTYls1exW58ZGdBKK0yfpEiKqefpaSnrBItpd5vQOmrZHKnyq
   rQnMHVE43bn4mNZlACctCNaZe+2595LpJf7oAkWZ0ErmQqv87bTPeodtu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="151429293"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="151429293"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:54 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D894C68A2
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3652EEA0AF
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B84662008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 67A931A006A;
	Wed,  6 Mar 2024 16:44:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 26/26] stunnel: upgrade 5.69 -> 5.72
Date: Wed,  6 Mar 2024 16:43:28 +0800
Message-Id: <1709714608-19296-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--25.459600-10.000000
X-TMASE-MatchedRID: 82BO9bqjodKjz0nOeth/ySrLqyE6Ur/jwpoFhxXXuNBXGTbsQqHbkun7
	ya/+V5vjmrS/IzG3CN1vedD3CYSjHZ5l5tqvE/eVe015woyPLfYpA2ExuipmWg6kQMQctFlNi3G
	OCGgGiOZg6ojO6JtNKFY0LHxl/r2veDOKCQxQpCy5x7uAXGEprbSNNSxBSouVo2PBF3QVHR8jty
	fNKljEgy1n8r4x8KhkGgiMcDmRSGBOXp6BQITpaHnlGDzIJIlrVBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJovS8Cwpi97ZSaDCzqDR7DPZ9v5k7uQeUSDxzAG47ocHfBjgO
	R3JEdytF+l3+KzhDQVE3T7B/zVrboRbQh+0bwAdYUconbBJWJJki3iIBA3o/NS9A3X1uuODAwxT
	sn1XjrmLTycXTYfFqQrf9l1KbStSPnoiNOctH6SsIuzCLc2mNrthpnZXZolDzqYzeil6n7B1WI+
	unqp55Q06hC5tIKP9zxeOHBbGbzK1i/8UCZ5uOngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPI6T/LT
	DsmJmg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109166

From: Wang Mingyu <wangmy@fujitsu.com>

fix-openssl-no-des.patch
refreshed for 5.72

License-Update: Copyright year updated to 2024.

Changelog:
===========
* Security bugfixes
  - OpenSSL DLLs updated to version 3.2.1.
  - OpenSSL FIPS Provider updated to version 3.0.8.
* Bugfixes
  - Fixed SSL_CTX_new() errors handling.
  - Fixed OPENSSL_NO_PSK builds.
  - Android build updated for NDK r23c.
  - stunnel.nsi updated for Debian 12.
  - Fixed tests with OpenSSL older than 1.0.2.
  - Fixed the console output of tstunnel.exe.
  - Fixed TLS socket EOF handling with OpenSSL 3.x.
    This bug caused major interoperability issues between
    stunnel built with OpenSSL 3.x and Microsoft's
    Schannel Security Support Provider (SSP).
  - Fixed reading certificate chains from PKCS#12 files.
* Features sponsored by SAE IT-systems
  - OCSP stapling is requested and verified in the client mode.
  - Using "verifyChain" automatically enables OCSP
    stapling in the client mode.
  - OCSP stapling is always available in the server mode.
  - An inconclusive OCSP verification breaks TLS negotiation.
    This can be disabled with "OCSPrequire = no".
  - Added the "TIMEOUTocsp" option to control the maximum
    time allowed for connecting an OCSP responder.
* Features
  - Added support for Red Hat OpenSSL 3.x patches.
  - Added configurable delay for the "retry" option.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch  | 34 ++++++++++---------
 .../{stunnel_5.69.bb => stunnel_5.72.bb}      |  4 +--
 2 files changed, 20 insertions(+), 18 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.69.bb => stunnel_5.72.bb} (87%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
index 0840cbbd8..82d355101 100644
--- a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -11,17 +11,16 @@ failed. Fix it by checking macro OPENSSL_NO_DES to use openssl des related
 library conditionaly.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
 ---
  src/common.h   | 2 ++
  src/protocol.c | 6 +++---
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/src/common.h b/src/common.h
-index bc37eb5..03ee3e5 100644
+index 2b4869f..180d31a 100644
 --- a/src/common.h
 +++ b/src/common.h
-@@ -486,7 +486,9 @@ extern char *sys_errlist[];
+@@ -492,7 +492,9 @@ extern char *sys_errlist[];
  #ifndef OPENSSL_NO_MD4
  #include <openssl/md4.h>
  #endif /* !defined(OPENSSL_NO_MD4) */
@@ -32,29 +31,29 @@ index bc37eb5..03ee3e5 100644
  #include <openssl/dh.h>
  #if OPENSSL_VERSION_NUMBER<0x10100000L
 diff --git a/src/protocol.c b/src/protocol.c
-index 804f115..d9b2b50 100644
+index cfe6d3b..3936aea 100644
 --- a/src/protocol.c
 +++ b/src/protocol.c
-@@ -66,7 +66,7 @@ NOEXPORT char *nntp_client(CLI *, SERVICE_OPTIONS *, const PHASE);
- NOEXPORT char *ldap_client(CLI *, SERVICE_OPTIONS *, const PHASE);
- NOEXPORT char *connect_server(CLI *, SERVICE_OPTIONS *, const PHASE);
- NOEXPORT char *connect_client(CLI *, SERVICE_OPTIONS *, const PHASE);
+@@ -81,7 +81,7 @@ NOEXPORT void ldap_client_middle(CLI *);
+ 
+ NOEXPORT void connect_server_early(CLI *);
+ NOEXPORT void connect_client_middle(CLI *);
 -#ifndef OPENSSL_NO_MD4
 +#if !defined(OPENSSL_NO_MD4) && !defined(OPENSSL_NO_DES)
- NOEXPORT void ntlm(CLI *, SERVICE_OPTIONS *);
+ NOEXPORT void ntlm(CLI *);
  NOEXPORT char *ntlm1(void);
  NOEXPORT char *ntlm3(char *, char *, char *, char *);
-@@ -1351,7 +1351,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
-     fd_printf(c, c->remote_fd.fd, "Host: %s", opt->protocol_host);
-     if(opt->protocol_username && opt->protocol_password) {
-         if(!strcasecmp(opt->protocol_authentication, "ntlm")) {
+@@ -1331,7 +1331,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+     fd_printf(c, c->remote_fd.fd, "Host: %s", c->opt->protocol_host);
+     if(c->opt->protocol_username && c->opt->protocol_password) {
+         if(!strcasecmp(c->opt->protocol_authentication, "ntlm")) {
 -#ifndef OPENSSL_NO_MD4
 +#if !defined(OPENSSL_NO_MD4) && !defined(OPENSSL_NO_DES)
-             ntlm(c, opt);
+             ntlm(c);
  #else
              s_log(LOG_ERR, "NTLM authentication is not available");
-@@ -1395,7 +1395,7 @@ NOEXPORT char *connect_client(CLI *c, SERVICE_OPTIONS *opt, const PHASE phase) {
-     return NULL;
+@@ -1374,7 +1374,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+     str_free(line);
  }
  
 -#ifndef OPENSSL_NO_MD4
@@ -62,3 +61,6 @@ index 804f115..d9b2b50 100644
  
  /*
   * NTLM code is based on the following documentation:
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.69.bb b/meta-networking/recipes-support/stunnel/stunnel_5.72.bb
similarity index 87%
rename from meta-networking/recipes-support/stunnel/stunnel_5.69.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.72.bb
index 816152973..6d21027a1 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.69.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.72.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-sta
 HOMEPAGE = "https://www.stunnel.org/"
 SECTION = "net"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=b4988f33f70b383b3011c4ede0a679ce"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=906ac034adaee9d093318e51b53453ca"
 
 DEPENDS = "autoconf-archive libnsl2 openssl"
 
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "1ff7d9f30884c75b98c8a0a4e1534fa79adcada2322635e6787337b4e38fdb81"
+SRC_URI[sha256sum] = "3d532941281ae353319735144e4adb9ae489a10b7e309c58a48157f08f42e949"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.34.1


