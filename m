Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2F9C88CB5
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.3828.1686620455361391674
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="121527756"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="121527756"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:54 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4682DDC62
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:51 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0595CD88A1
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F58920074724;
	Tue, 13 Jun 2023 10:40:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cassandra-driver: upgrade 3.27.0 -> 3.28.0
Date: Tue, 13 Jun 2023 09:40:10 +0800
Message-Id: <1686620422-29962-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--4.163000-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy8YDH/UBNnm6Sr
	9vLA6F20kHMaYUOh453DM6dtV8SC16PPacy+wTvuYb85H1Mvf+6C7C2rJeUToekw7W744CmzMEG
	UYlC3/bfdGrWq1bnu41PC3zjPdw6ajEZqG6AU9+MD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiEtxXtQrQ1G3c+HB+YVvemDsKXyzHgcEbrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrZQAiWbzky62JblLT8xuL6Onz1R8G4aGDkKexKrQKk8M9YCW
	vNDvMA4giTyeaSXEowv8Yb29y8FDczrmAb5ZI7aTyhv1eeIiIR0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103239

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Features
---------
    Add support for vector type (PYTHON-1352)
    Cryptography module is now an optional dependency (PYTHON-1351)

Bug Fixes
----------
    Store IV along with encrypted text when using column-level encryption (PYTHON-1350)
    Create session-specific protocol handlers to contain session-specific CLE policies (PYTHON-1356)

Others
---------
    Use Cython for smoke builds (PYTHON-1343)
    Don't fail when inserting UDTs with prepared queries with some missing fields (PR 1151)
    Convert print statement to function in docs (PR 1157)
    Update comment for retry policy (DOC-3278)
    Added error handling blog reference (DOC-2813)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ndra-driver_3.27.0.bb => python3-cassandra-driver_3.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.27.0.bb => python3-cassandra-driver_3.28.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.27.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.28.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.27.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.28.0.bb
index 679b51f75..468aa247e 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.28.0.bb
@@ -8,7 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[sha256sum] = "3f43b6023d3d2b34ceaea0a33abf9d9602c41cf316f283f651d835d0c4924124"
+SRC_URI[sha256sum] = "64ff130d19f994b80997c14343a8306be52a0e7ab92520a534eed944c88d70df"
 
 inherit pypi setuptools3
 
-- 
2.34.1


