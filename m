Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900C7C30653
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 08:09:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.20677.1719389345349609694
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 01:09:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sWqh5ZgQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719389346; x=1750925346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CLaizuKrXc96qst/sbxelElPYhI34QfHSU7o4CQOEVk=;
  b=sWqh5ZgQYemuXFvFlXpLNDOSSkDtmgwwELpBih9ApB4F6V1Hh1cBw9r9
   nKiABHw65BBfMkvpVbNSr46FoDgeO5rkybjQxbl0MPgPUnBd3Wc2a/N82
   F7h2aljQ7IzI/josWsYgVXKqUaM74ZC04eYrbElfoU7yC/caw8laHx6eH
   oHZJ4Wu85pEqoJ0CjrGl9+U/iHIVV70yzgj02AFgwN/bIOQKiAhQh05wO
   RxTnB9dF5oQyummqEZtXZ2+PFBEv7VrMJhwusgzmtwftxiDRP0CQ85JPM
   ca5zS6/b5uqC9VZWZGni769D2rvoK24xfcuqSXuc1SstP2Gh88+PVvZop
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="144040703"
X-IronPort-AV: E=Sophos;i="6.08,266,1712588400"; 
   d="scan'208";a="144040703"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 17:09:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 28DF3C9321
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 17:09:01 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 61D33CF7E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 17:09:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DAD872007CA99
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 17:08:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 815431A0002;
	Wed, 26 Jun 2024 16:08:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 2/2] openldap: fix lib32-openldap build failure with gcc-14
Date: Wed, 26 Jun 2024 16:08:55 +0800
Message-Id: <1719389335-2644-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719389335-2644-1-git-send-email-wangmy@fujitsu.com>
References: <1719389335-2644-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28482.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28482.006
X-TMASE-Result: 10--7.399600-10.000000
X-TMASE-MatchedRID: asSAQPhJDBuvgkLMDorezzo39wOA02LhCZa9cSpBObm+f7ap9DJaDe79
	DJRUi35pTQ0JkPG2878bYA1xraQblC/7QU2czuUNGYJhRh6ssesfimmlcABuN7V5fSMRD1zqJEz
	2lL+z80jTdt4rUYJZj8LrkAU++Mn83DPMODfcSYzGSzOfy00X/2CDsc7zPa02K4HaV6hIZIKyxs
	SRJfpzSVqtf84XcQkCXM73NePeQL423LDAh/mSxSoiRKlBVkYIC//1TMV5chPx/es4TBfOpylXO
	Xpbw7a94vM1YF6AJbZT3DhdVcNYJgtuKBGekqUpI/NGWt0UYPBhVRd7TCaHeZ2Fy777eEVM/bPL
	CRGNXvV8Pf4Q9OVw8dy89tVOrDil
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 08:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111084

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-fix-incompatible-pointer-type-error.patch | 40 +++++++++++++++++++
 .../openldap/openldap_2.6.8.bb                |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/0001-fix-incompatible-pointer-type-error.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-fix-incompatible-pointer-type-error.patch b/meta-oe/recipes-support/openldap/openldap/0001-fix-incompatible-pointer-type-error.patch
new file mode 100644
index 000000000..e6ab4e5a4
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/0001-fix-incompatible-pointer-type-error.patch
@@ -0,0 +1,40 @@
+From 634017950c1c920d0de63fffa5c52e621de1d603 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Wed, 26 Jun 2024 07:41:01 +0000
+Subject: Fix incompatible pointer type error with gcc option
+ -Wincompatible-pointer-types
+
+lib32-openldap do_compile failure with gcc-14:
+| tls_g.c:971:57: error: passing argument 4 of 'gnutls_fingerprint' from incompatible pointer type [-Wincompatible-pointer-types]
+|   971 |                                         keyhash.bv_val, &keyhash.bv_len ) < 0 ) {
+|       |                                                         ^~~~~~~~~~~~~~~
+|       |                                                         |
+|       |                                                         ber_len_t * {aka long unsigned int *}
+| In file included from tls_g.c:44:
+| /usr/include/gnutls/gnutls.h:2406:32: note: expected 'size_t *' {aka 'unsigned int *'} but argument is of type 'ber_len_t *' {aka 'long unsigned int *'}
+|  2406 |                        size_t *result_size);
+|       |                        ^~~
+
+Upstream-Status: Submitted
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ libraries/libldap/tls_g.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libraries/libldap/tls_g.c b/libraries/libldap/tls_g.c
+index 7c23875..b4b487d 100644
+--- a/libraries/libldap/tls_g.c
++++ b/libraries/libldap/tls_g.c
+@@ -968,7 +968,7 @@ tlsg_session_pinning( LDAP *ld, tls_session *sess, char *hashalg, struct berval
+ 		keyhash.bv_len = gnutls_hash_get_len( alg );
+ 		keyhash.bv_val = LDAP_MALLOC( keyhash.bv_len );
+ 		if ( !keyhash.bv_val || gnutls_fingerprint( alg, &key,
+-					keyhash.bv_val, &keyhash.bv_len ) < 0 ) {
++					keyhash.bv_val, (size_t *)&keyhash.bv_len ) < 0 ) {
+ 			goto done;
+ 		}
+ 	} else {
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.8.bb b/meta-oe/recipes-support/openldap/openldap_2.6.8.bb
index 38ee76ba2..330636b83 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.8.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.8.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://slapd.service \
     file://remove-user-host-pwd-from-version.patch \
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
+    file://0001-fix-incompatible-pointer-type-error.patch \
 "
 
 SRC_URI[sha256sum] = "48969323e94e3be3b03c6a132942dcba7ef8d545f2ad35401709019f696c3c4e"
-- 
2.34.1


