Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE2BC02190
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.32646.1737360863780751273
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SSGZXfcz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360864; x=1768896864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UOkuDJnH5rg8xDL5v4aNnrG31qb2wQkJrGRYv7RdBG0=;
  b=SSGZXfcz/3osJY20OUQ3nR6P/2onA+ffOlXBqXdoBdgnuJVfpI98DKWA
   w1uZIvW+etcZaKuaN48eUqaZq6WrbkQ1maUYDqYALOeUbx8lh7NWrHbqW
   KP7yPBiBHNX1r8WCXfFxad4UIXE2I7j2QiVnYDOx9cK4+klpX+MPYo2G8
   b0TfYTCqC/xWSQIISzPdaCDwD/zYcPmomholm1RdvPRz7cWmmH98K5MLf
   UdKVOz1B1UPtGoXtp/1LnFQ4sXzz1vSH3y0QA1puM8ZrbKsyBmS5Lwgxb
   xcAkFQ9D51K0I3c42ysv1ZLyGCU6h2b7NZA8ha4XUIzFMQgJVbXSabsXL
   g==;
X-CSE-ConnectionGUID: x013Nj4bQDOQU18Zyj9wcA==
X-CSE-MsgGUID: diuyp5E0Q2CUW1lopeGWHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="175491035"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="175491035"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id ABDBAC2264
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CB1DD7485
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 192D020071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BD3641A0071;
	Mon, 20 Jan 2025 16:14:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/32] python3-semver: upgrade 3.0.2 -> 3.0.3
Date: Mon, 20 Jan 2025 16:14:00 +0800
Message-Id: <1737360846-4824-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-0.692000-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yU5GBIYERk6jpxAd6mi1Ga2ysPB8dBBorWzg
	X6V0HRbeg5ortHq/YwwY6kWVobaeWYadzrWEfJJM2OuDW8uPojQXivwflisSrHjNo/tVVOEkvmK
	TdxbGqLLo12F41I32ksRFZ1K3HbXQsEBAuoaUqK8/QdUh6LEl0Ec1DwKoQo7YwLkNMQzGl5CyqF
	LMy/lZpsxZ7lVPfMZdC6Kd+BnbGsdFjW2X28b8BjsKXyzHgcEbfS0Ip2eEHnwj/1Rbkzl1EwuTL
	po5HEc1joczmuoPCq0IDUbtRj5ZqPTvCAbeSuXEQ+hC5X2HZ+1T577JErNUpM1u530hrvVZHbCw
	2jTnMh0hBoWtveVlvdgvxOvvTK6BTD2zJmXRxm0dJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhF
	TP3QRDAbYwClu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114988

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Replace organization placeholder

Changelog:
===========
- Use meta directive for SEO
- Move search box more at the top
- Update workflow file
- Improve type hints to fix TODOs
- Gha add python313
- Improve private _nat_cmp() method
- Modernize project configs with pyproject.toml
- Turn our Markdown issue templates into YAML
- Fix comparison with subclasses

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-semver_3.0.2.bb => python3-semver_3.0.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-semver_3.0.2.bb => python3-semver_3.0.3.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb b/meta-python/recipes-devtools/python/python3-semver_3.0.3.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-semver_3.0.3.bb
index b329d65e1f..6767c70da2 100644
--- a/meta-python/recipes-devtools/python/python3-semver_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-semver_3.0.3.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Python module for Semantic Versioning"
 HOMEPAGE = "https://github.com/python-semver/python-semver"
 BUGTRACKER = "https://github.com/python-semver/python-semver"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d9da679db3bdce30a1b4328d5c474f98"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3ce011bad2c5218ddd4973952a6db93a"
 
-SRC_URI[sha256sum] = "6253adb39c70f6e51afed2fa7152bcd414c411286088fb4b9effb133885ab4cc"
+SRC_URI[sha256sum] = "8769a03a93507fecdf19b6eefb08d5e95b462504871a61e29e09798822888c94"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


