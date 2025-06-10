Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205A2C678DA
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.77955.1749526431400049978
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UQsd7yVE;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526440; x=1781062440;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IPAAab3dfvlo7O1c0kREi3OPw48MjTyd6YMIeGScU58=;
  b=UQsd7yVEySRRItCi2Q0ABp6tgO3Hbgw2I/BdbO68HEGSmoRhYWcnRiX0
   lXVM3feLSdituPdq/Z5ut4WbYxH+YQlLaw2R21TIHkv65uMYUwUbuhUxm
   c/suODUd6Ryaa2KwdtgiREjTAg5lRcIM/nX5/rDFx2CF5siFu6xNaXr4/
   SeUPay3sa6JRxgjrlHR94VkL/WBvWF/mpSMqihCe2dwiiX6H9zXk/x7u2
   SQZ4pmweEzmuUcf+8z7Lv9ves7l92nNzr/sRozrM1JP6ovnZViaWX1rtY
   46biNHduB9/aFJRlGVzlIo78npXgozNLru+JqvP7QpNXcqp2LYtSXPmsq
   w==;
X-CSE-ConnectionGUID: UxwdztkrRVypi9WIBfWS/g==
X-CSE-MsgGUID: F/NqPi8jRHyiYX4LRjkVyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181121919"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181121919"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:59 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E0F4BD4C24
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 87714D4C19
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:56 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB0BF1A009B;
	Tue, 10 Jun 2025 11:33:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 59/64] stunnel: upgrade 5.74 -> 5.75
Date: Tue, 10 Jun 2025 11:33:25 +0800
Message-ID: <20250610033330.924-59-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117851

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

fix-openssl-no-des.patch
refreshed for 5.75

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stunnel/stunnel/fix-openssl-no-des.patch              | 8 ++++----
 .../stunnel/{stunnel_5.74.bb => stunnel_5.75.bb}          | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.74.bb => stunnel_5.75.bb} (87%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
index 08edc254ae..3520bf429e 100644
--- a/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
+++ b/meta-networking/recipes-support/stunnel/stunnel/fix-openssl-no-des.patch
@@ -1,4 +1,4 @@
-From 71751d30ca6bdae6c62e41b8bdd20eb69cecd556 Mon Sep 17 00:00:00 2001
+From e08b9760d319d0334f2aad02d32d791c8ebd8564 Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Wed, 1 Nov 2017 09:23:41 -0400
 Subject: [PATCH] stunnel: fix compile error when openssl disable des support
@@ -17,10 +17,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/src/common.h b/src/common.h
-index f112cf9..8d4be01 100644
+index c2229d0..5eaee8c 100644
 --- a/src/common.h
 +++ b/src/common.h
-@@ -496,7 +496,9 @@ extern char *sys_errlist[];
+@@ -497,7 +497,9 @@ extern char *sys_errlist[];
  #ifndef OPENSSL_NO_MD4
  #include <openssl/md4.h>
  #endif /* !defined(OPENSSL_NO_MD4) */
@@ -31,7 +31,7 @@ index f112cf9..8d4be01 100644
  #include <openssl/dh.h>
  #if OPENSSL_VERSION_NUMBER<0x10100000L
 diff --git a/src/protocol.c b/src/protocol.c
-index 616a65f..5ccbcb0 100644
+index c390a6f..7aca745 100644
 --- a/src/protocol.c
 +++ b/src/protocol.c
 @@ -82,7 +82,7 @@ NOEXPORT void ldap_client_middle(CLI *);
diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.74.bb b/meta-networking/recipes-support/stunnel/stunnel_5.75.bb
similarity index 87%
rename from meta-networking/recipes-support/stunnel/stunnel_5.74.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.75.bb
index 558eacd709..e13872abcd 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.74.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.75.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "SSL encryption wrapper between remote client and local (inetd-sta
 HOMEPAGE = "https://www.stunnel.org/"
 SECTION = "net"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING.md;md5=906ac034adaee9d093318e51b53453ca"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=1e4388407e163ad0cde171362f9a7b94"
 
 DEPENDS = "autoconf-archive libnsl2 openssl"
 
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "9bef235ab5d24a2a8dff6485dfd782ed235f4407e9bc8716deb383fc80cd6230"
+SRC_URI[sha256sum] = "0c1ef0ed85240974dccb94fe74fb92d6383474c7c0d10e8796d1f781a3ba5683"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.43.0


