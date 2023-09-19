Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CEFCD549C
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:53:49 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2665.1695110022074588813
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132746757"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132746757"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:53:39 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AD36CA1E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:53:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A081D5E31
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:53:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C2D6A2007912E;
	Tue, 19 Sep 2023 16:53:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rich: upgrade 13.5.2 -> 13.5.3
Date: Tue, 19 Sep 2023 15:52:53 +0800
Message-Id: <1695109973-8093-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10--2.208300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr/Eo10sZXT1Mli8Y5a0svL99q
	V1RzMGoXIX+UmmSwEkcNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDKbepuhA18xJM5462iIVZCx5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2W79
	Uq8KMo9QB0FNCk95MCnk4GTrci/YtPnA4/o3OnQywF3YHSAsYk0i/1xpgQXPDiWs9/V0aR7Resk
	9cT46aXnh/tuy50zIoeSs8TZYVRUvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104991

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Markdown table rendering issue with inline styles and links
Fix Markdown code blocks on a light background

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.5.2.bb => python3-rich_13.5.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.5.2.bb => python3-rich_13.5.3.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.5.3.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.5.3.bb
index 2c31a33751..2c385fc66b 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.5.3.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "fb9d6c0a0f643c99eed3875b5377a184132ba9be4d61516a55273d3554d75a39"
+SRC_URI[sha256sum] = "87b43e0543149efa1253f485cd845bb7ee54df16c9617b8a893650ab84b4acb6"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


