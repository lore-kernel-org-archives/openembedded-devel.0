Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CA2C25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:31:15 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.136252.1698103868381430771
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="137243573"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="137243573"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:31:04 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 497A2CA1E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:31:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DC96D9478
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:31:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 84BFD2005A580;
	Tue, 24 Oct 2023 08:31:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rich: upgrade 13.5.3 -> 13.6.0
Date: Mon, 23 Oct 2023 17:01:38 +0800
Message-Id: <1698051698-26444-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10-0.609700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRuDqZCRNemCu4Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIQpDlrhFWJAkzrcOHFYPIKmU3SYccw2evNJU
	erw7XdIQLveH/gGx15YSZLJpzziKcWUtmL++bQntetkpgIUjKonZ2FD7zStkz+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105690

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Added Python 3.12 to classifiers.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.5.3.bb => python3-rich_13.6.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.5.3.bb => python3-rich_13.6.0.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.5.3.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.6.0.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.5.3.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.6.0.bb
index 2c385fc66b..b606b4f7a9 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.5.3.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.6.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "87b43e0543149efa1253f485cd845bb7ee54df16c9617b8a893650ab84b4acb6"
+SRC_URI[sha256sum] = "5c14d22737e6d5084ef4771b62d5d4363165b403455a30a1c8ca39dc7b644bef"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


