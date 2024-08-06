Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0B9C52D73
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:06 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2888.1722934023735823302
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qdnCiQMd;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934025; x=1754470025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rKt79KZy/PMU4Ke37JhX1+jfLkoLXAv/aTXUdBBsNGc=;
  b=qdnCiQMdhAwB9IXofoKxOfO85SkN3lmS7lojfMSyq5IGRsp96r3SHvzD
   MqzbuVrIAvvQ4EtimKO63x5c5JLI8IXkAxtqPELKRPPuk8ecn+lb0gopa
   lK0svk9vHraeeUh0q/fkdnsq7rGWNz28O5VuLQbllR4rpnG7YLsS0vEcJ
   3zeWauuXUfsrwL1b83ZRKfF63NLs9MRiPGP+LMW0VGsF6pTFk6CnpYwur
   Owauf37YNLxdB7bext9S99HDZ5EK50RM7KN3ovaeuGZaqnNjV/XLxII6i
   YD3B9S9e9NFo+pLvbzWEjS+iL+Hw24NoDYa6fvqTgQEVl08Qw1pcTiG+I
   w==;
X-CSE-ConnectionGUID: pQOSFioRRQ6O39vtZu1Xrg==
X-CSE-MsgGUID: kitDGbBRRFOOeCIo8CGDKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="157332588"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="157332588"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:02 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C374DAD30
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:47:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E12E4F765
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 80C2920076D12
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4BBAA1A000C;
	Tue,  6 Aug 2024 16:46:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/60] python3-qface: upgrade 2.0.8 -> 2.0.10
Date: Tue,  6 Aug 2024 16:46:19 +0800
Message-Id: <1722933994-32549-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDUm9IxBCtrEiIV7AP+KhdoJ37sEBWqxxyIcDQzZUYfmeVCZiuKIlhSU/G19HNwtuW0OJQ
	pC/fsF+tBFnXa3x0JhMHJ1BwVRR5+AcjH79gRLW1PJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111567

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-qface_2.0.8.bb => python3-qface_2.0.10.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qface_2.0.8.bb => python3-qface_2.0.10.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-qface_2.0.8.bb b/meta-python/recipes-devtools/python/python3-qface_2.0.10.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-qface_2.0.8.bb
rename to meta-python/recipes-devtools/python/python3-qface_2.0.10.bb
index 8ad61ab12..9190c9a63 100644
--- a/meta-python/recipes-devtools/python/python3-qface_2.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-qface_2.0.10.bb
@@ -2,7 +2,7 @@ SUMMARY = "A generator framework based on a common modern IDL"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eee61e10a40b0e3045ee5965bcd9a8b5"
 
-SRC_URI[sha256sum] = "eccee7dbc4290c5a4e394df8d527f39148e0de0ff22c6b260f48c48f12b3beb4"
+SRC_URI[sha256sum] = "8606fbade67c3c0afe8ed5bbe860e7ffcd523ce0568c3f9dbe9f04503542f3cf"
 
 inherit pypi setuptools3
 
-- 
2.34.1


