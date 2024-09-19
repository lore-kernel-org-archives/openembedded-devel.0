Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5523BCE8D42
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:39 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11279.1726716758096148129
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N/bds4Iw;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716758; x=1758252758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=twAgbgzQwFsfG3Ly5i7efNaKs9iNqcUIOglW1w/eD7I=;
  b=N/bds4IwSqgUraMp/v80bBDIHVo9e1MvkRPaMuENrVueZwRl5o5Be1v7
   EoORsk+mdZt52t+sQJHs2Ug0bcx2fuhrjN18rZHMrgMD007FXxs3KeA6D
   v1f0nP6uE+axn70Kz6iEIUQqJQs1VvMovMSZ4YCZx7LUZFHDY7WJ2jZ1+
   MK62MLpUKPx1wqkq3+mnOUu/6kbmdQhb4IBNLdoZg6d7RdA0VyptHlqbc
   9KHPLbgl2YOwAw6PRa84zsPSz8P01AwXXqvAYifH2KTW9EjvGtN5yfsQb
   PzxVNHHvOfaSp8vFjfq5bhXk2GFknxlI4ToMWj45c6w6J9yrdz/pmQMH5
   Q==;
X-CSE-ConnectionGUID: fYYj9+uYS3eHE0tJ/0v8iw==
X-CSE-MsgGUID: gU783h4dT26/pDkB+6qYtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="161515751"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="161515751"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:36 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id BC761D5A47
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 11301D9683
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 888C420086EB0
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 279531A000A;
	Thu, 19 Sep 2024 11:32:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/28] python3-paramiko: upgrade 3.4.1 -> 3.5.0
Date: Thu, 19 Sep 2024 11:31:58 +0800
Message-Id: <1726716733-14548-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10--1.187300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyhY/mxEgbOB76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFAxHbAE811GvMaW7TGHsXzBJxM
	c7R6505jeoXqY4T0MARZSMHwgL+U+0sZzvL6C6ygl6o7AhuKJ36s1SOATVCSaLae3VKM5NYux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112376

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add support for AES-GCM encryption ciphers (128 and 256 bit variants).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-paramiko_3.4.1.bb => python3-paramiko_3.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_3.4.1.bb => python3-paramiko_3.5.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.4.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.5.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_3.5.0.bb
index 498bb6d01..8ccf939f7 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "8b15302870af7f6652f2e038975c1d2973f06046cb5d7d65355668b3ecbece0c"
+SRC_URI[sha256sum] = "ad11e540da4f55cedda52931f1a3f812a8238a7af7f62a60de538cd80bb28124"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.34.1


