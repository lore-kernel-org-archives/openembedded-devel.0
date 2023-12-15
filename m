Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE1CC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 05:59:25 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.53898.1702619955377714995
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 21:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="131530724"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="131530724"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 14:59:13 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D3ABD9DA5
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:59:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A079C4A00
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:59:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7622D1EB696;
	Fri, 15 Dec 2023 14:59:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] strongswan: upgrade 5.9.12 -> 5.9.13
Date: Fri, 15 Dec 2023 13:58:59 +0800
Message-Id: <1702619939-4313-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28058.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28058.005
X-TMASE-Result: 10-4.624400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrG24YVeuZGmOa9Zo7TJaDsL4z
	fTpGjdbas5uEtP+syVhMNbrUuyXyo+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1Mt+4gG6hwJMYwDOL7t3RyHdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtvGUIVV2YHc1JovKNOsW5woCXFl9ThW2sXBDJnPpTBll1xUC+cxSyADdIL
	YvFmNu4XOYGLxiBWF5wXNuaLdf+M/B6+fe0FLTbHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 05:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107492

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fixes a regression with handling OCSP error responses and adds a new
  option to specify the length of nonces in OCSP requests.  Also adds some
  other improvements for OCSP handling and fuzzers for OCSP
  requests/responses.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../strongswan/{strongswan_5.9.12.bb => strongswan_5.9.13.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.12.bb => strongswan_5.9.13.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
index 87d12bc6c..4523187af 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.12.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
@@ -11,7 +11,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
           "
 
-SRC_URI[sha256sum] = "5e6018b07cbe9f72c044c129955a13be3e2f799ceb53f53a4459da6a922b95e5"
+SRC_URI[sha256sum] = "56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


