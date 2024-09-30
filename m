Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 788F0CF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.48953.1727682216720469735
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bF7p0esS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682217; x=1759218217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RVIEE9+5JFsdHFEn696kBVGZLZVklQOXqfHXWprrYNg=;
  b=bF7p0esSyyp03rPtYUjWFHSF7LjCgGlgtDdto4Bsgs/HQ1dI7BFbkkMa
   8CYQ4YZ5vEbYf7GLn0mreMXMUr6MXRlWejwkiNRI4NJX0CHO6WgbJXp9s
   LFV03F+QCbXiUo/1mIjDjvS6VJmOKVzTt5vKdfeZ+WQfKFKCLYkn2CFsw
   ge1sewJa0WEfE6fJlkZFCxKL8rzZhgz8FO/xEmLqm0K7eIXKxa9xRxBrA
   piOCCNC4zBraarkHXHOp/3qvYg+ogD1heTAqLzZ6WJ+ib2ekOJZ4iZM5q
   an41P1KzTCPcfQL6zHR4EtZ1UzZ/5u1qCAz3FVyXuSSr0YGhgBxhztUeC
   A==;
X-CSE-ConnectionGUID: wRFr0ePlStW6O5q1NFqbSw==
X-CSE-MsgGUID: nlpgYEnASZWKhDHtXE+nng==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175192702"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175192702"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 43F7ACA1E3
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 79ED8D4C0A
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07FA020076D01
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC75C1A000A;
	Mon, 30 Sep 2024 15:43:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/40] python3-alembic: upgrade 1.13.2 -> 1.13.3
Date: Mon, 30 Sep 2024 15:42:37 +0800
Message-Id: <1727682185-12664-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--2.887000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrXLILvyEBT859MesWtSDfskRo
	hRfaBtxQ2je6cr4EnJIMyw6hMrtYUO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4uuLFZZYlisfHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAUQAbk+6qZvksGjZ
	7vz9qyNFmHi3mhst0aDIsr91kfL3jHKmuf/aUG+F53pwyUnEij/nMUGo0EXnkUGPqHRHz7CGzKl
	OUwGVWm7H2fVekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112569

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Render if_exists and if_not_exists parameters in CreateTableOp, CreateIndexOp,
  DropTableOp and DropIndexOp in an autogenerate context.
- Enhance version_locations parsing to handle paths containing newlines.
- Added support for Operations.create_table.if_not_exists and
  Operations.drop_table.if_exists, adding similar functionality to render
  IF [NOT] EXISTS for table operations in a similar way as with indexes.
- The pin for setuptools<69.3 in pyproject.toml has been removed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.13.2.bb => python3-alembic_1.13.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.13.2.bb => python3-alembic_1.13.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
index 6f8fb8c33..0e6dc6265 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.13.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=00f8f5c8aab58c3e1cd61525a6675174"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1ff0ae32975f4fd96028c39ed9bb3c867fe3af956bd7bb37343b54c9fe7445ef"
+SRC_URI[sha256sum] = "203503117415561e203aa14541740643a611f641517f0209fcae63e9fa09f1a2"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.34.1


