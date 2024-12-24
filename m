Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB2FE7719F
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.30508.1735032444345337866
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sGp5Xlbs;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032445; x=1766568445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=16TRWU6sH5wBB9a32RQIb/EoP/OgHvNZkQlTvF6uWT0=;
  b=sGp5XlbsMxEIMRYyqqrAry3+HpnbW4o8TQmnmtK28nrFTXbeL8uAO8bk
   jj9D70TEvk6DNhZpUb5MoOa0wCFE+v5DwzVaiQB0guGpBNp9O5dGdxO5K
   Wroq9IY6Fnt5dFhlPJ4ahp3pVgz34ImskKVDSscGcwMz+HAmv9AZCwtN1
   FKAU/btWE39KgCg9/5oH2RDFWVxHMDRyoA3KvV0D5KygiGoBgeMTvQ7FP
   aJm/m7OXI57Rmk09LVZFjVlGKour8hQbTsMEkne+f2TwlTXQkO2ZmGCo0
   NCn3AMT4XkkpShZM8ypO4kiKRLxiO0+r8dbMZHd/ZvgI8FBFZfUria0S3
   Q==;
X-CSE-ConnectionGUID: EAGYSUKPTJW3MoUvypppJg==
X-CSE-MsgGUID: PzVXpjZSSUWqxNDTxvqtZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="172125387"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="172125387"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:24 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 607EFD4809
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 300D7BDC92
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C1E796BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8832B1A0073;
	Tue, 24 Dec 2024 17:27:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/67] python3-importlib-metadata: upgrade 8.4.0 -> 8.5.0
Date: Tue, 24 Dec 2024 17:26:29 +0800
Message-Id: <1735032421-13513-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.235500-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4BC5HdxA3MwScH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJogMWCgdCzp+angIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDX+X7zGTTVMP2gZDAlrmdipMxCQqSm6UO4Z67+3aly55xDUit3uGZBcrFqkx5m/xxNRZS
	6vJkPYOT0fkhqJ3Zpro4y8VaI0OPXo4DGSOCid9FPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114505

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ib-metadata_8.4.0.bb => python3-importlib-metadata_8.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_8.4.0.bb => python3-importlib-metadata_8.5.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.4.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.5.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_8.4.0.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_8.5.0.bb
index 763aa170c6..d51edf3356 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.5.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "9a547d3bc3608b025f93d403fdd1aae741c24fbb8314df4b155675742ce303c5"
+SRC_URI[sha256sum] = "71522656f0abace1d072b9e5481a48f07c138e00f079c38c8f883823f9c26bd7"
 
 S = "${WORKDIR}/importlib_metadata-${PV}"
 
-- 
2.43.0


