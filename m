Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DE3C41513
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:59 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.2730.1713318110626488650
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dbz9bwR6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318114; x=1744854114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=upBaj9EGFYI1uZ6S2y7/5deCaWEBNs7YvW28Q4Jlb28=;
  b=Dbz9bwR6IxdGHTSnzK9SFkDI4e8pzaNTcgY9dUaVaWRL5bB2TckZ24qa
   sUAxC6qiJKGLmnVKJc9K/SgsuCQcO5VcZOSY1hQ5VWiPrD0pmzx16GisC
   2HyMfxtG02jI1fytNuh73NuXDMFkp6OzK6ADVRBbAy969AOCjP8ctXj/G
   Xvk8EJTWBVX4fehrHN+jOJoMvpQqLqc19Uu3KYuwUGwAY3dmw/jVrRsse
   zVR64dmjmfumBjnWVuXSaUeGwpNFt+ROIU/B4hguUA7SC/QDWwnUuQYQm
   3A8RenZMYMNIws/wd/Ak+sFZjQ2cKJoXiLeoxzehjs7GgGObUepo6aMmv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155837397"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155837397"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:53 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4940C2F804
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8003BD5B33
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CED0022D91A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C3151A0002;
	Wed, 17 Apr 2024 09:41:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 49/49] xmlsec1: upgrade 1.3.3 -> 1.3.4
Date: Wed, 17 Apr 2024 09:41:01 +0800
Message-Id: <1713318061-17128-49-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-0.750700-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrwpoFhxXXuNBICmt7k5mXsOaG
	g/Bit59tlVXxp76IY/CQ5gu/qOufurBAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsGNNfJA/RgDhzA16DrgJTi6nOYknDZ/QoWmQExgOfwV47rencS+jsJiem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMWeMpVNhsMwMRB0bsfrpPIcSqbxBgG0w6EgwmE6dnLLjr6m
	fXDQeDPy6YgO0FubD3UrHusqesjAufpC+orzR3NEZSOSABikXr6AcjffXo3HcxutEBzEUtubb/N
	tQH7YXKCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110035

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-(xmlsec-openssl) Support cert dates before unix epoch start.
-(xmlsec-openssl) Fix build for LibreSSL or BoringSSL.
-(xmlsec-nss) Ensure NSS algorithms are initialized.
-Several other small fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xmlsec1/{xmlsec1_1.3.3.bb => xmlsec1_1.3.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.3.3.bb => xmlsec1_1.3.4.bb} (96%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.3.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
similarity index 96%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.3.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
index 7a5f01e4f..7639209e1 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.3.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
            file://ensure-search-path-non-host.patch \
            "
 
-SRC_URI[sha256sum] = "ab5b9a9ffd6960f46f7466d9d91f174ec37e8c31989237ba6b9eacdd816464f2"
+SRC_URI[sha256sum] = "45ad9078d41ae76844ad2f8651600ffeec0fdd128ead988a8d69e907c57aee75"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.34.1


