Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B57C54E72
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.8166.1710827215663078744
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C8cJdIGH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827215; x=1742363215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0Hkfkr3L4Q4HXrGGCUFuU7g4jb5g8jxrDVQR8Y2hD9A=;
  b=C8cJdIGHAMXRcPwt1gqSiNBc23M5CvQMgUMTpSHnq/dh8ay+fTQ4Bbdy
   o8+NNIb3QlitCQJEiVNyAD/GuHnYzbvGozVYXkay7sHcYn9gieHgmi/io
   H307sX5xaNdzNfOlsvsHn+5TPvfE2Sczpj1toa2hvHXuIU6pLFfEv6Rvc
   OZOWNx0v4b/Be2n127jvm9SgfazN9HElmty8VX+u00vXtpKDgCJLmVXKN
   3bHsU1KAN8CZyfysUzJEAugb4x7n3IV26mf7uQqstqon6aAjtZBKlYV1Z
   ABje749hjzhoA1eZbh3sfwRfRGEye+rkeqqALGjVZrcd3E/ELsbsYW99i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="154544266"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="154544266"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:52 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 663A12A0DFF
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A34042014B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A36E20098E1C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D8DDC1A006D;
	Tue, 19 Mar 2024 13:46:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/50] python3-traitlets: upgrade 5.14.1 -> 5.14.2
Date: Tue, 19 Mar 2024 13:45:33 +0800
Message-Id: <1710827139-30056-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--2.521500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mryiKgKtIyB4p4s/vUphzuipo/
	zBcIqZwH4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2qsz
	jolCcvyGv5XZomjWtpDdg4rKAxWL1JdI447qGT4FuacqrJHxZyXYvKni4AYaPqhVDxpYiD6O5hn
	bJD4rLrO1R1Nls3sRC4f2mmRoP8XPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109461

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Update Release Scripts
-chore: update pre-commit hooks
-Bump the actions group with 1 update

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-traitlets_5.14.1.bb => python3-traitlets_5.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.14.1.bb => python3-traitlets_5.14.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.14.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.14.2.bb
index 3a6542785..af5a2f3fb 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.14.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ipython/traitlets"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13bed0ee6f46a6f6dbf1f9f9572f250a"
 
-SRC_URI[sha256sum] = "8585105b371a04b8316a43d5ce29c098575c2e477850b62b848b964f1444527e"
+SRC_URI[sha256sum] = "8cdd83c040dab7d1dee822678e5f5d100b514f7b72b01615b26fc5718916fdf9"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


