Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6BCC25B6C
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:46:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.136578.1698104793349858203
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="125246028"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="125246028"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:46:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BD5FBD6186
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:46:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0EB95D9683
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:46:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 26BD52005A580;
	Tue, 24 Oct 2023 08:46:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zopeinterface: upgrade 6.0 -> 6.1
Date: Tue, 24 Oct 2023 07:46:10 +0800
Message-Id: <1698104770-32165-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-1.118400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqx4YeSlHZYFohRc
	qLOELivDq+XsKscAOn0Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2li+
	BaqMwTNrVuPnsbKmJlpaW6G0nndVErWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNekKc+CTG+uA7MlqkYwnRvztw4rhWFsN/jqcZyBGNyc2QJu8A6xCudU4b+xj2ckxAbOtL
	1OeSgplXIORdZW0gQsqUCVG3Fcq3YJXtKB2OUbbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105706

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Build Linux binary wheels for Python 3.12.
-Add support for Python 3.12.
-Fix building of the docs for non-final versions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-zopeinterface_6.0.bb => python3-zopeinterface_6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_6.0.bb => python3-zopeinterface_6.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_6.0.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_6.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_6.0.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_6.1.bb
index 264898adb6..07e329a4a8 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "aab584725afd10c710b8f1e6e208dbee2d0ad009f57d674cb9d1b3964037275d"
+SRC_URI[sha256sum] = "2fdc7ccbd6eb6b7df5353012fbed6c3c5d04ceaca0038f75e601060e95345309"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.34.1


