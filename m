Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7574BC5474F
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8723.1724833547871109374
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q48ba7fq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833549; x=1756369549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dYX9CW13wqwwSfDDz9q+bKPoeggq5W20mJi5hB5VdjQ=;
  b=Q48ba7fqEGfbpkBIU+BiHASedDPj21kM1P7WmqYpvp4qV/U2lhxb6oFt
   TLqHXH07x6lGNCDQP+Veamu3Hz8QnYxsnq0x+BhTvxPfMlO1vU4lflltm
   A0ZY685J+80YT+g0uRZ9xJdhyija/a4hQUghxA4V7FAiqkpZyF0B3tHyL
   S57Mp46cJgYsQGhr5/KvHl5Hczk5ekgs1XiruXmoIjtQe/XzmRu1ZChmw
   nLOg6/cFW1HcrKcY3+PJH7Aw+ntr+qZbrBQAsO2TggWuiI5gO52gvf9/C
   4xT5zf440JrEx6pnoEjp6mf3RDa8o2GbceK+upZyKy81fRUDXKBW7/gfU
   A==;
X-CSE-ConnectionGUID: 8FlN/yCgR827jXSeaItKfg==
X-CSE-MsgGUID: /O7OKNRxR8ibEtYGogCiiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913188"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913188"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:46 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7828CD7AC5
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B90ADE49E3
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5362220079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F17281A000C;
	Wed, 28 Aug 2024 16:25:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/46] python3-aiohttp: upgrade 3.10.3 -> 3.10.5
Date: Wed, 28 Aug 2024 16:24:57 +0800
Message-Id: <1724833525-2162-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-0.150700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrrOCEGIPhtwj+Aw16GgqpOzcP
	6gIbPFfZ4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedlNc
	WZ7137CiBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4rWs
	EcUQe9D1lC/67iKh49ZnZlylFVm1mvnbdEQdBrje9qi7FtKUPbSPzurL412ekTckaXKsmDvMPhx
	xaAWhVZFOuRvsPwEs+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111998

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed :meth:aiohttp.ClientResponse.json() not setting status
  when :exc:aiohttp.ContentTypeError is raised
- Improved performance of the WebSocket reader

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.10.3.bb => python3-aiohttp_3.10.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.10.3.bb => python3-aiohttp_3.10.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.3.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.10.3.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.10.5.bb
index a2cfe7173..f167b9d6e 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "21650e7032cc2d31fc23d353d7123e771354f2a3d5b05a5647fc30fea214e696"
+SRC_URI[sha256sum] = "f071854b47d39591ce9a17981c46790acb30518e2f83dfca8db2dfa091178691"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.34.1


