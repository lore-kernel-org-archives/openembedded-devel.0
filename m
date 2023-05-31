Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53E9C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8562.1685518845162558672
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="118435703"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="118435703"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:43 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C7DA5CD6CB
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 153A3CF7E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:40 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 896F96B80B;
	Wed, 31 May 2023 16:40:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-deprecated: upgrade 1.2.13 -> 1.2.14
Date: Wed, 31 May 2023 15:40:09 +0800
Message-Id: <1685518820-20028-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10--1.384600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytGQgIVrmBL5OnQ
	k6dUeFKNyC2cGPzXolknbstoox/faLT5k413CvlTqTb2sWzCG35MkOX0Uoduuac7pchzt8uX0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q25x7uAXGEprQFA6pSxaDHmgW6bY8SOq3WjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq3aPuBCD/q/NNYWm8vo3czsvumOlxNiPz3CHPpntECAqDBVG
	JrxDKAvi6gIyTVnofDS8xUnq4173hxZRPTZNlnD9oSXNdNnT7gdJuEZuYbKVcUkrvIudlEZl07d
	DrsiYvyCLhFTP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102915

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Fix
-------
    Fix #60: return a correctly dedented docstring when long docstring are using the D212 or D213 format.

Other
--------
    Add support for Python 3.11.
    Drop support for Python older than 3.7 in build systems like pytest and tox, while ensuring the library remains production-compatible.
    Update GitHub workflow to run in recent Python versions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-deprecated_1.2.13.bb => python3-deprecated_1.2.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-deprecated_1.2.13.bb => python3-deprecated_1.2.14.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-deprecated_1.2.13.bb b/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-deprecated_1.2.13.bb
rename to meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb
index 6ea47f429..4b5c78fb0 100644
--- a/meta-python/recipes-devtools/python/python3-deprecated_1.2.13.bb
+++ b/meta-python/recipes-devtools/python/python3-deprecated_1.2.14.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=44288e26f4896bdab14072d4fa35ff01"
 
 PYPI_PACKAGE = "Deprecated"
-SRC_URI[sha256sum] = "43ac5335da90c31c24ba028af536a91d41d53f9e6901ddb021bcc572ce44e38d"
+SRC_URI[sha256sum] = "e5323eb936458dccc2582dc6f9c322c852a775a27065ff2b0c4970b9d53d01b3"
 
 inherit pypi setuptools3
 
-- 
2.34.1


