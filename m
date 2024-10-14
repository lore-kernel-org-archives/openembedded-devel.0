Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CB4BCFC527
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.50496.1728896174505859974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q4J8HF3i;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896175; x=1760432175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vh6kdnFaOvK7mM9jTh/IbOAYKAWGPsXf4SGGNYhfSPg=;
  b=q4J8HF3iwxiGOznLy9H7a3K8i227xHPxFlDx1An23VQp3mznzr9wCrea
   WTRJ1thhZIqJJioNFSUBDpliGvVQPIIzPpjC2YT/8I52Kz91MECGmX5u2
   hohj6IjVzCC3iXblYss9n3frUHmuc2B81/fmN1xi3hCh2Hn3M0X3Hn2V7
   L/SHR+EBSx46FuNhh818nCiREWYaYBC31LYRrosQBnf54XMuSyotXBRjE
   +bnXF89iudZ+hQDATxl0snPugYB1U4YAOuMjiI6NLzvDyCBu3ivc69oi6
   8a8oIyDaWBH52ae9lKMUMO0jNH26Kod9SoKQBpe8/caGEhgDXzECXXKx5
   g==;
X-CSE-ConnectionGUID: v9utgOzqSruYa1HS5eJijA==
X-CSE-MsgGUID: O8exdGRxS5ONjQnKQaJMNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176693002"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176693002"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:13 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 43D5AD4F55
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 899C1D39CF
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1ECE4200649DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C24611A01E9;
	Mon, 14 Oct 2024 16:56:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/54] python3-pymisp: upgrade 2.4.198 -> 2.5.0
Date: Mon, 14 Oct 2024 16:54:55 +0800
Message-Id: <1728896115-2944-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--3.654000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yXzmmMD/HXF+pxAd6mi1Ga3VbZFdXapsKRJX
	e4zWFxYA4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDKbepuhA18xJLao0Zou4ee+HxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5URY
	yyypi/43+pRIa9f4XK1cRatS8+Y/JsvMe7fp79lLhk9xFr0shtwqNVqtNfprGKbgB9TIJLhYRn6
	v7D45t6TiRN4H45lweCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112885

From: Wang Mingyu <wangmy@fujitsu.com>

Changes
~~~~~~~
- misp_instance_version_master now uses the 2.5 branch.
- Make mypy happy.
- Only include the changelog in the sdist package.
- [data] describeTypes.json updated.
- Openioc.py is not a script, but had exec bit.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.198.bb => python3-pymisp_2.5.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.198.bb => python3-pymisp_2.5.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.198.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.198.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.0.bb
index b902061c0..83b3c82ab 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.198.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "f5583263c2fcd380570c084b21c4e4812a01c32daa7baafcdc3f87153edc9303"
+SRC_URI[sha256sum] = "d3bfc7a337e4382026343f05aa442bfdecc3e11a4f3a5479ad0e6087dcde7e78"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


