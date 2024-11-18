Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD3CD4400A
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.36712.1731922207947770117
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CKMCl789;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922211; x=1763458211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pqeXrQlnG+P6Fe78KQvRv5iiJnqJ9nKpiPJUA/EWkpU=;
  b=CKMCl789vS8bmeLu7K5ykBkZLZimzuzjIiL/ZXxfIx0yT5ud99QQiyRY
   MRYYWZwhmuF4d1blu6J9FKtOVxtE0p0fvorEVI6Bbee1NtyHzLxRw2az+
   dQDXTZOAHbljdZg/TQxL1GtSB+dlk0yIBO624xHbD4tfdShwbe460ljTj
   DzXipwc1AjjHysAqF8t4NcWn2sbmozYl0A28/mIXdjH/YzRcl8yYDM+qW
   qwVSBGzxWV6s8urqG9vpTM5PDpbxekHO/ZpagmOgB6dh81VXeFz7sHXSh
   LpFdLLUILfYfuRtTx7P8hYX2v5JnbyrDlOrUedcAuUKZEvgQ753jjwGHG
   g==;
X-CSE-ConnectionGUID: MXjPzKpFQ12D9aM4vI676A==
X-CSE-MsgGUID: oTSlrRgxTgKGpZAtYEtlVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="169137099"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="169137099"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:10 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2EEFCC2274
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BA244D52B8
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AF6DE368F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:07 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0B41D1A000B;
	Mon, 18 Nov 2024 17:30:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/32] python3-aiohttp: upgrade 3.10.10 -> 3.11.2
Date: Mon, 18 Nov 2024 17:29:33 +0800
Message-Id: <1731922195-5266-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--3.334300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhOuRi6fMc6u8B/
	/GdWoIDq4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedlNc
	WZ7137CiBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7eUd
	MdlK49AaK/e8lYR574BAr5BOIIvMpH/5G64q4aTQ+B84/6Hn6I1Va4YknbS9yOg0u2o2hqWO9LB
	LpnYwy0LY501VoxQA+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113874

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed improperly closed WebSocket connections generating an unhandled exception

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.10.10.bb => python3-aiohttp_3.11.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.10.10.bb => python3-aiohttp_3.11.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.10.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.10.10.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.11.2.bb
index 02c53ff91..728b339ad 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.10.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "0631dd7c9f0822cc61c88586ca76d5b5ada26538097d0f1df510b082bad3411a"
+SRC_URI[sha256sum] = "68d1f46f9387db3785508f5225d3acbc5825ca13d9c29f2b5cce203d5863eb79"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.34.1


