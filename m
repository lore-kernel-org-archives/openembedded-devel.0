Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38D1C54E49
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:47 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7737.1709714686992621715
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tu798SRC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714687; x=1741250687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=e5QjAQHeGgAkC6WUzw2nc8lzJV9W5lWa6HsHjT9WGRo=;
  b=Tu798SRCvWAKoLsKH2ilBAJg5s3AK0eXicCs3Wumy56rU5nzFQDbDGqQ
   1xUDCxp9odl2en7699B6+qjgSnABgIuVBktCPZkb0lN6gUHudYDuQ4nvG
   Em1tkcLNIQyuSI+gtnlxFE2rlPYYr2wCJqV4NpuHAHeCRb/g3RJUWsnTy
   pcxMpVsDEbJ4cC5KHJt8gyOfnHNuQtsJGqOFCDeWz22u8KMttFyeuwH4M
   Rf38TYOU7bvFG2NXQPPPJMNTG9nLZaS+fdKl7t45SALJezbyeaem+vkFq
   ZKn4Vat5bPUysFPymzMaYURNi/0g6c7NNGaVn5WHyCGOzE7jlq8amrHzq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="139021551"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="139021551"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:44 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B989E8CC0
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ADA35E6159
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 33DEF2008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C39ED1A006A;
	Wed,  6 Mar 2024 16:44:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/26] python3-pymisp: upgrade 2.4.185 -> 2.4.186
Date: Wed,  6 Mar 2024 16:43:24 +0800
Message-Id: <1709714608-19296-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-3.857000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr8boZEVitthg8a+/GjoiAqr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uhhg
	7W1Bq9cX8x09lec/Dmy5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO28bR
	Ued1HGAiGidExaFcMCQYlHOiq1Nobe7qLjrSrVLwqtYjLoXXw7ByKYLlX/JujWSwD5Rf3wkL0HK
	8rrh/8ASzC7C9GnNnjj25M0fzJDZPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109162

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Correct FileObject import.
- Disable WL when calling the disable method, not toggle.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.185.bb => python3-pymisp_2.4.186.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.185.bb => python3-pymisp_2.4.186.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.185.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.186.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.185.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.186.bb
index ce4671de9..dcde77db0 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.185.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.186.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "3ccdc6ee48d26d82c77ba3f5d8fd41a79eaaef0ad5619f37a65b060e92f6da4c"
+SRC_URI[sha256sum] = "bdf2d54b297ad890418179b044dd4ea79821fccef723823919d12262e9794ca3"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


