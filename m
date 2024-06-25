Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4259FC3065E
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:26 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.166859.1719305835097827565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DPk3nwsS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305839; x=1750841839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jEnCb05wAMCA7ndOUrrR6dQifGCn2eMvYcqEwDi4lr4=;
  b=DPk3nwsSv3kOQ9HrYkd6c0TjgiUO5K12SM3kdwPCpFfG9xCovv0JnuPb
   AwrwT59MLOlOxI8StxOTbxvqKLpUpsXRINuQ2fHAUql6ae3/5anSL+3zv
   nkG1JFxFAw0jNBQL6sBAXIuxzxE5ipJKAjERRkiale4+8uFy/YdXnwzrd
   MdGXZPLJhkLHaEIkXS7ZluYo5+3rUbwy31U+1W5P/gkRuL4s3TMgWh1kB
   hQMQv4VpVFX2FiPVnAyN0dY3UyalaqDsKq5eq5QSBLwyLHkGoNwdQxUUr
   GTyvnlDiyhur2NJRBFuWrGIpl7/tLt/msV6XhZAvUw7dBcZ1fevPz4gUf
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164869286"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164869286"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:17 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0CD1CC9449
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E888CFAB0
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9C972007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 88E971A0002;
	Tue, 25 Jun 2024 16:57:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/57] python3-flexparser: upgrade 0.3 -> 0.3.1
Date: Tue, 25 Jun 2024 16:56:02 +0800
Message-Id: <1719305790-11484-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--1.645600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysiCDtFcCnji76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIZJGKoZLwPeQ74m1QO2jaB/+M0x/h81YMIXJ
	w067GWiH1c5/alQAlxXni/efFUyHLexEs3RAqt8P+PgXRaqTzaopn+TcTk5s7+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111042

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix flexparser FIPS mode.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-flexparser_0.3.bb => python3-flexparser_0.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flexparser_0.3.bb => python3-flexparser_0.3.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb b/meta-python/recipes-devtools/python/python3-flexparser_0.3.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
rename to meta-python/recipes-devtools/python/python3-flexparser_0.3.1.bb
index e45175f5a..7867dc501 100644
--- a/meta-python/recipes-devtools/python/python3-flexparser_0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flexparser_0.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=32f547dac365c355d2cdbcd7ebea9144"
 
 DEPENDS += "python3-setuptools-scm-native"
-SRC_URI[sha256sum] = "692e7524d9e14b2b1231b772b091d7d6296951deb383f5a67bfbd0ecb0b9fa9a"
+SRC_URI[sha256sum] = "36f795d82e50f5c9ae2fde1c33f21f88922fdd67b7629550a3cc4d0b40a66856"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


