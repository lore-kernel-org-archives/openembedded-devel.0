Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C1AC2BA12
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2432.1718161119922720466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U/UgGLBU;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161122; x=1749697122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7EnUNezhqBmG2Ksx+5hu0HUjy9WfT2uri6NBh3+3AEc=;
  b=U/UgGLBUC2oI/PWvl3W2MTvv2aZjPXFklzsGq9fGRxjdovRmtGl4EWdO
   8bTtdeY8/NNyMeH6F33QY0FIH2hV8s1p8tNC5blsLpM83nAQxLcal/71g
   G06+W3OJLyASsbB3erZAaWVG4sIpvdYKWLNU6QDGRrYr9DXzI6iDOoZcw
   GMFqohaTRkTgkDwkXOhnb4w6B0ah6xSckUs7hDa0Q8DgN54zqJYE14Uzh
   RKUVu4hQFur0OoTRr6rC6VsVG4A4Mipt8SPMKZ9HD1GApNHSf6WtdM/RH
   Hp2OMW+zTO0luCSchtRyrv/3tuxh+soa4D2mzWsMDF/u0IMSr/LoVJkuw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="150756309"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="150756309"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AC401C9443
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F3CF1D50E2
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E0E120071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3C5E41A000C;
	Wed, 12 Jun 2024 10:58:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/43] python3-ipython: upgrade 8.24.0 -> 8.25.0
Date: Wed, 12 Jun 2024 10:57:47 +0800
Message-Id: <1718161096-29710-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--4.211600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr+e1AKB619fh4YeSlHZYFomqg
	Y7BmE+NafobKmjcxu0hNjnbhxsJIBRLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO36CZ
	XLlV1mScCR0UsPlmGGM+tm+J/dxEj/j85LHeuUHAbEr9RQWNGSRO0eIsIp+erG8NgNtp8/2GLKS
	3FVZRVz/0LTJdfxrCqg33WVKhDanvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110849

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- replaces the unicode micro symbol with greek letter mu,
  visually identical but should fix nfkc normalisations issues.
- introduces "intersphinx_registry"  as a new dependency
  which is recommended only to build documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.24.0.bb => python3-ipython_8.25.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.24.0.bb => python3-ipython_8.25.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.24.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.25.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.24.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.25.0.bb
index 23060f3d6..2e2d0e1c5 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.25.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "010db3f8a728a578bb641fdd06c063b9fb8e96a9464c63aec6310fbcb5e80501"
+SRC_URI[sha256sum] = "c6ed726a140b6e725b911528f80439c534fac915246af3efc39440a6b0f9d716"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.34.1


