Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CCCC16B13
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.13980.1713777369071639966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O0uLgpfw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777372; x=1745313372;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QhCqsHk35ig4wP3AM5NJSTrffGH5TEqVhLPNxBSHLO0=;
  b=O0uLgpfwDWYpWrRy62v6RocTOvRWi7fYyWcxvqxiDImdeWOIdDsks1dK
   92WsL4umlDWsw1c6qbpt7p26DFUZVkJvDUzSjgLuJRAeatilmSeis0Yif
   dOnVNETxdQ1+561VX+NEiobgAV02tCboiGz9TU3M0KgTMAJQTOVzZS22t
   1mKwmy8rM1ZSAAFgoNj9vohQpyQU8R5PROM9b8pF3NWF1n7Yn5F85zHgC
   cIti6Ft1OfZop4aY0sATaLax9zZvycRXoHqBWPa6oHYOr1QGOWlwvGxGz
   d7Pjx1IVg1QIxSfrBoXU+kinEKhtgFDjkcZS7QrapSkgqNmqRGreuOO7B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="144288398"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="144288398"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:11 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 30BC5E8FC0
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 66A25D8B2F
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E8B876BD75
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9435A1A000B;
	Mon, 22 Apr 2024 17:16:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/15] python3-pywbem: upgrade 1.6.3 -> 1.7.2
Date: Mon, 22 Apr 2024 17:15:41 +0800
Message-Id: <1713777345-29264-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10-1.967900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJogwIsQZbtzZwuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOgs5eu5snk2z4O7
	c0yYoHY117kAS/382bD6YyDxyxzoPusVfwstaxMIzHbkB0ecIKHRvqZ29TPMPhrZQbrW+K+8D7O
	T05Ncs5gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110091

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Correct way to convert bytes to string if orjson exists.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pywbem/{python3-pywbem_1.6.3.bb => python3-pywbem_1.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.6.3.bb => python3-pywbem_1.7.2.bb} (94%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.3.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.2.bb
similarity index 94%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.6.3.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.7.2.bb
index 7d1ff2858..1fdcc98ca 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.3.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.2.bb
@@ -16,7 +16,7 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[sha256sum] = "78df30dee98c508620b599b8951f322a81c6c0a9d7b78ffe5e017b9417cd97b9"
+SRC_URI[sha256sum] = "dc3b785840017f5fcb6381c56682598cebbfc8451851768f85e2318a84e06b68"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.34.1


