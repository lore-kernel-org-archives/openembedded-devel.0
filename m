Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B36BC3065F
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.166873.1719305853789858230
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bPt1WaE2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305855; x=1750841855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dMTWs6aKrzIWjblYwMQA+oyFbW7l1nyuEiDuiia9HuI=;
  b=bPt1WaE2QBNZqtWnPh28enbIf2s/2BKmwjxE+pBBrvc9dSCUR4jQ6LH3
   bKZBJ60V5sHhAhdCTJZ/JPz3sHH2Mx211SkVRzlm0LkWCf+Mu9tNv77DR
   heVluPSoJ68lLVlNpjXtAoHnF4Zhg10CfMgJuKTgUKMZQQwp6ACimcHd5
   kR7s2+q3U4sjz0NQ9v4GuMNCyYZnuMrriUj5ThWQiJQIRqi6r6jr94og1
   JuqAb+SgO+QnNBYvL7pL0OzZefRnK565K5bqL16ANXTW0tqXfAKWQwD6A
   uKX0agcHz9WLtA168gqFMRg95cE642BFddE5NcNrMtf0hharqPOah5Ecq
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="144297068"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="144297068"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:33 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D8966D4334
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 34CF2BF3D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B9F792007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6866C1A0002;
	Tue, 25 Jun 2024 16:57:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/57] python3-pyproject-api: upgrade 1.6.1 -> 1.7.1
Date: Tue, 25 Jun 2024 16:56:19 +0800
Message-Id: <1719305790-11484-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--3.548300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrSExHL6o3BeBqTj+cW75OIFYM
	JR3dIrh2iG5/X4lGCD8KG5wPc3Kleu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0HTT
	+SR4FPAGMxUXOKGTRDF+5L8avRTVyzS1drTSQLhGnDvuk3pxBwGHZsfnmbqCVDZUb6K1wyNhvQJ
	qMn5OMQtVGGaIKQmbDywAxZOLLvFfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111057

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- docs: correct Homepage URL
- Bump and fix CI for new setuptools
- Move changelog to GH releases

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pyproject-api_1.6.1.bb => python3-pyproject-api_1.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproject-api_1.6.1.bb => python3-pyproject-api_1.7.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproject-api_1.6.1.bb b/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyproject-api_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-pyproject-api_1.7.1.bb
index aec19949d..fd9bea480 100644
--- a/meta-python/recipes-devtools/python/python3-pyproject-api_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproject-api_1.7.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pyproject-api.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "1817dc018adc0d1ff9ca1ed8c60e1623d5aaca40814b953af14a9cf9a5cae538"
+SRC_URI[sha256sum] = "7ebc6cd10710f89f4cf2a2731710a98abce37ebff19427116ff2174c9236a827"
 
 PYPI_PACKAGE = "pyproject_api"
 
-- 
2.34.1


