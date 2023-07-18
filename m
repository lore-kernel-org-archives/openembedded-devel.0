Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26CDDC18E72
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:27 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.733.1689654375963584940
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="104239770"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="104239770"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 732CAD29EB
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A1E31D946F
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:17 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1321820077821;
	Tue, 18 Jul 2023 13:26:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tox: upgrade 4.6.3 -> 4.6.4
Date: Tue, 18 Jul 2023 12:25:39 +0800
Message-Id: <1689654348-30702-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--1.868100-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mryiKgKtIyB4pqTj+cW75OIM8L
	GTNFqWKa4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054zP3WYNhkszl1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrWYTIl/ZM+kE1E7xdp6hkNPbIkr16vUTylrRmq6tB3TOZsTGreAujH+BDSJDoAx+HY4FZ
	xkpCimhp8n3yQiFRzqXlcNsbW0khB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103926

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Ensure tox r -e docs generates the documentation
-[pre-commit.ci] pre-commit autoupdate
-Bump pypa/gh-action-pypi-publish from 1.8.6 to 1.8.7
-s/setup.cfg/pyproject.toml/ in the development docs
-Fix hang and zombie process on interrupt (CTRL-C). 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.6.3.bb => python3-tox_4.6.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.6.3.bb => python3-tox_4.6.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.6.3.bb b/meta-python/recipes-devtools/python/python3-tox_4.6.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.6.3.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.6.4.bb
index ed8fc38b2a..a8215a91bf 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.6.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "9e2c5091a117d03b583c57c4c40aecd068099c17d40520e7b165e85c19334534"
+SRC_URI[sha256sum] = "5e2ad8845764706170d3dcaac171704513cc8a725655219acb62fe4380bdadda"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


