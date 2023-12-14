Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA12FC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:52:26 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.17774.1702543944173498876
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="131709717"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="131709717"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:52:21 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id ED090D7AD8
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:52:19 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 26F1D4F874
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:52:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 01B2D86A76;
	Thu, 14 Dec 2023 17:52:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-restx: upgrade 1.2.0 -> 1.3.0
Date: Thu, 14 Dec 2023 16:51:40 +0800
Message-Id: <1702543900-27748-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10--0.282500-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrzoS4pqkGrkP7fZJfDdCIXPtN
	2vjEPERN+a1qg0C+ZkyjrLRBxwnZS5pOjqlsrZgYGXGu0jdPFGTYUDvAr2Y/158euMsD0OFm/ji
	lg8PXoIvgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZpjlkbDvDJ4cJMR
	sqHoauwYGQRIwjTl3iKI5/U0OcIj6tYv/FAmebjp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOhTkxK363aEMPsVCGqdMIEGfQWnaqxavoHLf8tbuyApzqKODYN+Gtn1JdGIU68hJWZLoi
	x54HAFFw8hcmwKxMzeUizrHnCqCogr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107431

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Fixing werkzeug 3 deprecated version import. Import is replaced by new style version check with importlib
* Fixing flask 3.0+ compatibility of 'ModuleNotFoundError: No module named 'flask.scaffold'' Import error.
* Fix wrong status code and message on responses when handling 'HTTPExceptions'
* Add flask 2 and flask 3 to testing matrix.
* Update internally pinned pytest-flask to 1.3.0 for Flask >=3.0.0 support.
* Python 3.12 support.
* Fix wrong status code and message on responses when handling HTTPExceptions.
* Update changelog Flask version table.
* Remove temporary package version restrictions for flask < 3.0.0, werkzeug and jsonschema

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-flask-restx_1.2.0.bb => python3-flask-restx_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-restx_1.2.0.bb => python3-flask-restx_1.3.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb b/meta-python/recipes-devtools/python/python3-flask-restx_1.3.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-restx_1.3.0.bb
index 573c2dbff..9c2a1e9a8 100644
--- a/meta-python/recipes-devtools/python/python3-flask-restx_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-restx_1.3.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Fully featured framework for fast, easy and documented API develo
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c96dd911c6d9e32868b6bc667a38a3e2"
 
-SRC_URI[sha256sum] = "9a5338b108c57fbed1d24d5d53fe98442b2be7ffa2ff3291305af7a613ce6fc0"
+SRC_URI[sha256sum] = "4f3d3fa7b6191fcc715b18c201a12cd875176f92ba4acc61626ccfd571ee1728"
 
 inherit pypi setuptools3
 
-- 
2.34.1


