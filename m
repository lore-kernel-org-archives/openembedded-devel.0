Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3E3C54E4C
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:04 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.9335.1708419301795006605
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tz0L2oz2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419303; x=1739955303;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FUSJ+O4gtoAdkHGPjFo/huCaYX9wNoF3XomqzuxYEzs=;
  b=tz0L2oz2i67DF4oZubz7svO41d6fSkN7/Agky0fkCw8SZ0u22GzucgpS
   RswyB2M1pZPG+aGTVtW+w6uZqUH0UYRhohw4Gp75iYARyFi+2Nbqw7lSO
   CvJlmwdyWb/t9A2xr0XO8LjKus7DvsoTKOfJ5jw3CV6JHZ8HFK8YYSEwx
   Gm4cOKcWqdxQ9ySU1ph/4VMWwcPDvQu6M5pYE3kieryoNiT6ySUso2sMM
   2mEy/pXynZglG9XhAWwJTMMENNxD8rEvYkHAMc5Lpyi3XCNkKVwG0oIQz
   Lltbtk2GIm1LSV1gHEFxboj8jLKirv/fBT8iwGGCjLJwJYPyj0TAS3UI+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149905946"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149905946"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:55:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 391E0D3EAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FA47CF7D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EDEBD2009954D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9139A1A00A0;
	Tue, 20 Feb 2024 16:54:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/26] python3-tox: upgrade 4.12.1 -> 4.13.0
Date: Tue, 20 Feb 2024 16:54:35 +0800
Message-Id: <1708419281-26047-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--9.598900-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mr6eaSffuToTWhzIcu46u4QgjJ
	lierVE/nSzNuxMHqudg+nbfIIuvB0h1Or560xn7Gqoeab9Xgz89uj2qdTD3bR+ZYcdJgScjxP/b
	UDB8FrMSpX+r0oWBUyA3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3vsWi
	BRDS9X2IGQRIwjTl3iKI5/U0OcIj6tYv/FAmebjp4CIKY/Hg3AaZGo0EeYG96O8R6rqACRht9pj
	zubZ2rHIAcCikR3vq8W6LhpUQSMfUKXaDgTD99CbJ6284RXa3Jn2w++a8XJB5jkWNzfj7eJ
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108940

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Document usage of Pytest with Tox as a FAQ entry
-docs/config.rst: State in config directive sections their ini file sections
-.gitignore: Add /tests/demo_pkg_inline/.tox/
-docs/development: Summarise important points experienced devs need to know
-Add tests for CliEnv
-Document how CliEnv works
-docs/development "Key points": Two updates and general improvement
-session.env_select.CliEnv: Document and test spaces behaviour
-config.cli.test_cli_ini: Re-order for clarity (textual moves only)
-Revert previous "precommit autoupdate (#3214)" commit; it's broken
-Extract packaging virtualenv code to its own class

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.12.1.bb => python3-tox_4.13.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.12.1.bb => python3-tox_4.13.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.12.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.13.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.12.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.13.0.bb
index 6d092c6ff..f46b43454 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.13.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "61aafbeff1bd8a5af84e54ef6e8402f53c6a6066d0782336171ddfbf5362122e"
+SRC_URI[sha256sum] = "dd789a554c16c4b532924ba393c92fc8991323c4b3d466712bfecc8c9b9f24f7"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


