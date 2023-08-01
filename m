Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D6CEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:58 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7651.1690875776250848310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="105387120"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="105387120"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:28 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E9D3CDE637
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B2D6D5D15
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AC15010232;
	Tue,  1 Aug 2023 16:42:24 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-typeguard: upgrade 4.0.0 -> 4.1.0
Date: Tue,  1 Aug 2023 15:41:53 +0800
Message-Id: <1690875717-21608-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10-6.107600-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrPqHtm30TsyNRiRl337i3b12d
	sxCRbuoBRb/IygSpPHdAfBvgYUYxarT5k413CvlTJ5oIExjxwSeTwmdO9VYIgi196sn93sBvnDq
	2cOBL/wVC6F0U2aKLvw3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3vnAw
	8yp081LL2jand2PRF8BhQWw3lZ+IU7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtsrb89fxd0AX+vnk9D6L+L6qtWpVXitRmkcNuELe7jQbtE+ou5isis5j1lkOAuBBheh4M
	b2NBPzvoEqgL9zDyQ6srNDG3OFkFeiBXV3S4Q+8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104198

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added support for passing a tuple as expected_type to check_type(), making it
  more of a drop-in replacement for isinstance()
- Fixed regression where Literal inside a Union had quotes stripped from its
  contents, thus typically causing NameError to be raised when run
- Fixed handling of typing_extensions.Literal on Python 3.8 and 3.9 when
  typing_extensions>=4.6.0 is installed
- Fixed NameError when generated type checking code references an imported
  name from a method
- Fixed docstrings disappearing from instrumented functions
- Fixed @typechecked failing to instrument functions when there are more than
  one function within the same scope
- Fixed frozenset not being checked

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_4.0.0.bb => python3-typeguard_4.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.0.0.bb => python3-typeguard_4.1.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.0.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.1.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.1.0.bb
index ca17e2b135..f64c70a72d 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "194fb3dbcb06ea9caf7088f3befee014de57961689f9c859ac5239b1ef61d987"
+SRC_URI[sha256sum] = "b05a54bb0276eefd28880df42e004a71e699c8081fcb9d0536b2ceb01019f60c"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


