Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53376ED7BBA
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:50 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15868.1776163242240617593
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h/YnzAmq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163249; x=1807699249;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vuhsjOF78SSa/fTuwhz40O69cj8woSc2VWwUtpiwaU0=;
  b=h/YnzAmqUQr1Gh+vvBHv8O2mXVRV/yPTNGVKWvedcq2cXIThwQRGuuVl
   89Odn//i/m1l2noDFNfy7lYBsUSbjxoZSsxbE2w6yjFkM5+DGhB95mgw4
   mwS6Nt5TIgdlHdHl3hJ+BKt/g4cZ9irL7bT+B9cMkLSsGgQ7Z389Sj/fH
   Fujkrdfc1u7oo7lR5ZrunX894fyWhyZ4mWp6DzRloErwiQ+QyyUh1Dgdt
   dzNhmd6m1p3oHx4YsAaHdGwPmtFMJowPRCSfemjDaknXtzatv27R1ipbC
   RkhDJSX/nb2ZYKa2HB8ETqR2t5Kv7KRRta4jgo9fHprAP2l1051mnGQ0+
   g==;
X-CSE-ConnectionGUID: dVefWDWKQ4qIcaSt0gVyeA==
X-CSE-MsgGUID: CkMSDxFIQhaNsZXZ1UT6NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236867116"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236867116"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:48 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5A07A1002B99
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:47 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0EA3514003D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 97B4C1400109;
	Tue, 14 Apr 2026 10:40:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 31/32] stunnel: upgrade 5.77 -> 5.78
Date: Tue, 14 Apr 2026 18:38:44 +0800
Message-ID: <20260414103845.1728-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126335

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

fix-openssl-no-des.patch
refreshed for 5.78

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch       | 14 +++++++-------
 .../stunnel/{stunnel_5.77.bb => stunnel_5.78.bb}   |  4 ++--
 2 files changed, 9 insertions(+), 9 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.77.bb => stunnel_5.78.bb} (86%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
index 3520bf429e..0e94a969c0 100644
--- a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -1,4 +1,4 @@
-From e08b9760d319d0334f2aad02d32d791c8ebd8564 Mon Sep 17 00:00:00 2001
+From 08b1bf417be039b097fae25708861fe8184c739c Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 1 Nov 2017 09:23:41 -0400
 Subject: [PATCH] stunnel: fix compile error when openssl disable des support
@@ -17,10 +17,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/src/common.h b/src/common.h
-index c2229d0..5eaee8c 100644
+index ada7ff7..8484144 100644
 --- a/src/common.h
 +++ b/src/common.h
-@@ -497,7 +497,9 @@ extern char *sys_errlist[];
+@@ -489,7 +489,9 @@ extern char *sys_errlist[];
  #ifndef OPENSSL_NO_MD4
  #include <openssl/md4.h>
  #endif /* !defined(OPENSSL_NO_MD4) */
@@ -29,9 +29,9 @@ index c2229d0..5eaee8c 100644
 +#endif
  #ifndef OPENSSL_NO_DH
  #include <openssl/dh.h>
- #if OPENSSL_VERSION_NUMBER<0x10100000L
+ #endif /* !defined(OPENSSL_NO_DH) */
 diff --git a/src/protocol.c b/src/protocol.c
-index c390a6f..7aca745 100644
+index cddc381..ae0f374 100644
 --- a/src/protocol.c
 +++ b/src/protocol.c
 @@ -82,7 +82,7 @@ NOEXPORT void ldap_client_middle(CLI *);
@@ -43,7 +43,7 @@ index c390a6f..7aca745 100644
  NOEXPORT void ntlm(CLI *);
  NOEXPORT char *ntlm1(void);
  NOEXPORT char *ntlm3(char *, char *, char *, char *);
-@@ -1391,7 +1391,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+@@ -1392,7 +1392,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
      fd_printf(c, c->remote_fd.fd, "Host: %s", c->opt->protocol_host);
      if(c->opt->protocol_username && c->opt->protocol_password) {
          if(!strcasecmp(c->opt->protocol_authentication, "ntlm")) {
@@ -52,7 +52,7 @@ index c390a6f..7aca745 100644
              ntlm(c);
  #else
              s_log(LOG_ERR, "NTLM authentication is not available");
-@@ -1434,7 +1434,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+@@ -1435,7 +1435,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
      str_free(line);
  }
  
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.77.bb b/meta-networking/recipes-support/stunnel/stunnel_5.78.bb
similarity index 86%
rename from meta-networking/recipes-support/stunnel/stunnel_5.77.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.78.bb
index 954fa896ba..1740ad41f2 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.77.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.78.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-sta
 HOMEPAGE = "https://www.stunnel.org/"
 SECTION = "net"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=1e4388407e163ad0cde171362f9a7b94"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=df2a0f88c5d5e3ebce922682a7b598ec"
 
 DEPENDS = "autoconf-archive libnsl2 openssl"
 
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "ec026f4fae4e0d25b940cc7a9451d925e359e7fd59e9edad20baea66ce45f263"
+SRC_URI[sha256sum] = "8727e53bb8b7528f850327a2a149158422c02183bc120d1d733cc65b1e2c349d"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.43.0


