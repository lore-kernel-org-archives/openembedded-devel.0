Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8469CECE58B
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:31 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.18592.1725959007143197041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TQLeN0LT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959010; x=1757495010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IF6DIo87bFaXxCKsVcSrKUXap+Y7GtloSRBP8/Mgt00=;
  b=TQLeN0LTYvJmzF9xCg99SazZvAmxjBwSTqwl8gtTx+0QhjPjko/g81Rz
   i8T1PBTNmLl9x4l3/56KRAjeAHm5ggmOm2mnWABJqJnPfexV/iEmyPV9j
   XQrUc0TSMMOPha7H+P11w2ZbbEs5nG1emua2jAuSvo18bbFoBRk462yKv
   VOHpA9XH0Op/b9m+EDtqj0z3efM84JQoddskYIYLpoOga0w8jdjpwX6gY
   lLFkh39gYm2oMfi7z/GjYcLU4REjtJPLJQ9hnLPWzW+Ws+9jJb6XPWjSJ
   3aaSX46T6WdwSW+Zyd9IxtkWI6kGgzspEWCURB6KrbVY46AFaL22pLcHs
   A==;
X-CSE-ConnectionGUID: I17Y/vXySOqkpBjy6X+rOw==
X-CSE-MsgGUID: pHU00cl6TcGT1qswTQRppw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="152689874"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="152689874"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7210DD4258
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A9E07BF49D
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 432E46BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EBC491A01E9;
	Tue, 10 Sep 2024 17:03:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/42] python3-httpx: upgrade 0.27.0 -> 0.27.2
Date: Tue, 10 Sep 2024 17:02:48 +0800
Message-Id: <1725958990-5719-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--0.442700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mriEijTR9ZREmU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3zndiJkHFMhCnXcc+9Khfko8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXK2dUhdL7eA71U1KLoI32ARYVjlEF0DPOtxzp
	Ur+fKe19bh5Buo7P34cAZ1oEWZZmXHNCZ+NYc20SwXU0F0T0COuPXh2yJqxpP+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112205

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Reintroduced supposedly-private URLTypes shortcut.
- Support for zstd content decoding using the python zstandard package is added.
  Installable using httpx[zstd].

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-httpx_0.27.0.bb => python3-httpx_0.27.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpx_0.27.0.bb => python3-httpx_0.27.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-httpx_0.27.0.bb b/meta-python/recipes-devtools/python/python3-httpx_0.27.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-httpx_0.27.0.bb
rename to meta-python/recipes-devtools/python/python3-httpx_0.27.2.bb
index e4d3cbeee..e4e1eeea7 100644
--- a/meta-python/recipes-devtools/python/python3-httpx_0.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx_0.27.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c624803bdf6fc1c4ce39f5ae11d7bd05"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "a0cb88a46f32dc874e04ee956e4c2764aba2aa228f650b06788ba6bda2962ab5"
+SRC_URI[sha256sum] = "f7c2be1d2f3c3c3160d441802406b206c2b76f5947b11115e6df10c6c65e66c2"
 
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
-- 
2.34.1


