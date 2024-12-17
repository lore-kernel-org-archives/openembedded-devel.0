Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E461E77188
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:02:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.77615.1734426117101256102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hCpR88k0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426118; x=1765962118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iTqie8sm6/8xXkAS3zNb3xNCWBFOv6x8bRq73U3VeFo=;
  b=hCpR88k0YdQFxGP+Ey49gW+nxYTMBOWVYigzLGPEyBTIjIn3fW0JHQqH
   pd/ge2sKY4kNuFzJ9Phvs6qrm/dwuse+pQu3VaAIwidt/Zk7cVbeLlp6H
   /WH2q1DZdnfo4K6xDTSQB8B44sbWvc3Kk//ETA0jmYE3BARBjgT/P+7Aj
   u1VQf6ORlideDgCElomJQfN9ewsA0Rn8q0Ol1TW1UVAEUcaepdBdhHQXj
   b7dK380jSgGVi2ZIpgvE81mWKolaGqZOVow1LXW0mePXAtMjEpW1vCflG
   Wb4Wv6s8fXKQGkLtobPrK020CsQaN2cUg38tQ6GvrtzDerOWxsbOFmghF
   g==;
X-CSE-ConnectionGUID: NEgAXdmDRLy6i0W/gJjrsQ==
X-CSE-MsgGUID: qHkeHizjSLK6KKXSFS7DvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="184048217"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="184048217"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 75F75D6EAA
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C93DD5098
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D58DF2007C3F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:51 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 73A801A0071;
	Tue, 17 Dec 2024 17:01:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 15/17] stunnel: upgrade 5.73 -> 5.74
Date: Tue, 17 Dec 2024 17:01:34 +0800
Message-Id: <1734426096-18300-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--6.084500-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/ySrLqyE6Ur/jwpoFhxXXuNAPdZmyx8xAa4Lz
	sc4xQIsBHEl4AEjnodA8kMeEPbtdemJZXQNDzktSuce7gFxhKa3Vy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYph3ANfpkSSuzCsOCBxDp3UdZEkR8Y/mefG6GRFYrbYY+32SXw3QiFy+oA
	mvH3qvXUX6Xf4rOENBUTdPsH/NWtuhFtCH7RvAB1hRyidsElYk0LVncfMFsgfj+yfWw+4UlLgA+
	zkAs/dTEqfoDMdYfpedqC2fLtk9xB8TzIzimOwPC24oEZ6SpSkgbhiVsIMQK9LdHHLXgng3xQPj
	Naiz1ZMk+jVY24H6vsQQquxKzzdW/UpRd3IhSwgfwV6sBPR0lg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114364

From: Wang Mingyu <wangmy@fujitsu.com>

fix-openssl-no-des.patch
refreshed for 5.74

* Bugfixes
  - Fixed a stapling cache deallocation crash.
  - Fixed "redirect" with protocol negotiation.
* Features
  - "protocolHost" support for "socks" protocol clients.
  - More detailed logs in OpenSSL 3.0 or later.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch              | 8 ++++----
 .../stunnel/{stunnel_5.73.bb => stunnel_5.74.bb}          | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.73.bb => stunnel_5.74.bb} (93%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
index 8c4ca55fbb..08edc254ae 100644
--- a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -1,4 +1,4 @@
-From c815368a3e41dd3f639eb8fd82d21bc0bab55d1e Mon Sep 17 00:00:00 2001
+From 71751d30ca6bdae6c62e41b8bdd20eb69cecd556 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 1 Nov 2017 09:23:41 -0400
 Subject: [PATCH] stunnel: fix compile error when openssl disable des support
@@ -31,7 +31,7 @@ index f112cf9..8d4be01 100644
  #include <openssl/dh.h>
  #if OPENSSL_VERSION_NUMBER<0x10100000L
 diff --git a/src/protocol.c b/src/protocol.c
-index c8c65ea..b071b06 100644
+index 616a65f..5ccbcb0 100644
 --- a/src/protocol.c
 +++ b/src/protocol.c
 @@ -82,7 +82,7 @@ NOEXPORT void ldap_client_middle(CLI *);
@@ -43,7 +43,7 @@ index c8c65ea..b071b06 100644
  NOEXPORT void ntlm(CLI *);
  NOEXPORT char *ntlm1(void);
  NOEXPORT char *ntlm3(char *, char *, char *, char *);
-@@ -1334,7 +1334,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+@@ -1391,7 +1391,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
      fd_printf(c, c->remote_fd.fd, "Host: %s", c->opt->protocol_host);
      if(c->opt->protocol_username && c->opt->protocol_password) {
          if(!strcasecmp(c->opt->protocol_authentication, "ntlm")) {
@@ -52,7 +52,7 @@ index c8c65ea..b071b06 100644
              ntlm(c);
  #else
              s_log(LOG_ERR, "NTLM authentication is not available");
-@@ -1377,7 +1377,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
+@@ -1434,7 +1434,7 @@ NOEXPORT void connect_client_middle(CLI *c) {
      str_free(line);
  }
  
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.73.bb b/meta-networking/recipes-support/stunnel/stunnel_5.74.bb
similarity index 93%
rename from meta-networking/recipes-support/stunnel/stunnel_5.73.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.74.bb
index e13b7871ca..558eacd709 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.73.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.74.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "bc917c3bcd943a4d632360c067977a31e85e385f5f4845f69749bce88183cb38"
+SRC_URI[sha256sum] = "9bef235ab5d24a2a8dff6485dfd782ed235f4407e9bc8716deb383fc80cd6230"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.43.0


