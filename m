Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30677E77188
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:01:56 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.77389.1734426112559769520
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FihCTw+A;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426114; x=1765962114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=XIbjw7duJpM0ccUe8Cic/JKxyqfua+gxJvi+KDCbrOg=;
  b=FihCTw+AxgC8y5W9Q+Lt76LUzci2eYhdKQmEP+BXrb9hFqL8tMQS+zrS
   XroiBpABs1CKjdG2Xhv1ZYwiive8D55woKvCCAdjRh9R2GdtOC7oCFORw
   gvU2c/MOtTjgaDWAy6uJiQl5R1+fXlBqVF3woLhWO+uR2mScwA73y7Zph
   Jy/h4PNd1Yz069erjVNAv1GAFlrm//2Ziu0dD22GPr0U/o47QxkaQG+lm
   YkDxY37Wmtxjnjrxp64bG/dXW8J8/o2gibgz+CY/RBixM5Xsr3GhphRzz
   hjIvlR1yBg+C7GfIYtx78UU43qYcFf6bO32xF+22vc7xNI9OAkPlLKhk3
   g==;
X-CSE-ConnectionGUID: 1sML272BTYiIt6DhcuvlDA==
X-CSE-MsgGUID: hKOVanhTTHSVcoLAlYBuHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="186395534"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="186395534"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:52 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EE8D943EE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 404CED6FED
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BBB3E6B5DE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:48 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 586E41A000B;
	Tue, 17 Dec 2024 17:01:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/17] graphviz: upgrade 12.2.0 -> 12.2.1
Date: Tue, 17 Dec 2024 17:01:22 +0800
Message-Id: <1734426096-18300-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--13.419000-10.000000
X-TMASE-MatchedRID: bwTBD8UNLVWjz0nOeth/yUIIxwDaU5mrCCdq6k3LmHZd3PAtLHAsopJd
	gvLsrON8F27ebUrmBfS9ap9Rcd5vGaN7J80WEmNqTOzi7zU/vul0mK5vbFx66EYx760ONDcWFoI
	cd1wDVkTcrpfeV/6Ieh5FyWYzDRgCJE8yWQDr+iRH4a2iJdV4MbLZpUHs8KMV0/tWY/sOuvrRzV
	/LsQcpi5pMaEyQ5c1jJy5kObkVr+jtAplHZmS+xoNraaMEw/VayeUl7aCTy8i67Q3uPo9KI3tCo
	wv/AitKO1qiNiyNtphLAbcoMwjx77BAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwUe
	vDt+uW6vBQc3bCgEsAuHh1fpLCeTr9r9SDmpcsdIcJTn2HkqsRzSjqs2IoGKXE5Co/aUb2CjxYy
	RBa/qJcFwgTvxipFajoczmuoPCq2QQ2e3EyCK3d1C9I3FxuCPnieGVuMRFH9s1wcULF59v+gFtd
	FyRgkO
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114352

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Support for building the SWIG-generated R language bindings has been
  integrated into the CMake build system. This is controllable by the
  '-DENABLE_R={AUTO|ON|OFF}' option.
- A sandboxing wrapper, 'dot_sandbox', is now included with Graphviz. Users
  should prefer their platform's native security solutions, but if nothing
  better is available this wrapper offers safe processing of untrusted inputs in
  some scenarios.
- JPEG images without an 'APP0' leading segment are supported for use in 'src'
  fields and friends. Previously Graphviz was overly strict with the types of
  JPEGs it would recognize.
- The GVPR library program 'depath' no longer acts on previously deleted nodes,
  causing unpredictable results.
- Void-typed function parameters ('int foo(void bar)') and variables 'void baz;'
  in GVPR are gracefully rejected.
- Input that induce a set node height but no set node width no longer crash with
  the failure "Assertion failed: '(r->boundary[i] <= r->boundary[NUMDIMS + i])',
  function RTreeInsert". It is typically not obvious to users when their input
  falls into this situation, hence why the assertion message is quoted here.
- Strings containing double quote characters preceded by escape sequences (e.g.
  '\n"') are once again correctly escaped in dot or canonical output.
- 'dot_builtins' no longer lists duplicate format options in its error messages.
- A precision error that resulted in truncated edge lines has been corrected.
  This was a regression in Graphviz 12.0.0.
- The xlib plugin ('-Tx11') resets its initialization state during finalization.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../graphviz/{graphviz_12.2.0.bb => graphviz_12.2.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_12.2.0.bb => graphviz_12.2.1.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_12.2.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_12.2.0.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
index eb1cf8c55d..cccbbe75f7 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_12.2.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "66d4acc201536a378a28d5254deeec8cf3e98cc66d7e4cb1cbfa5fc620f86474"
+SRC_URI[sha256sum] = "85e34b5c982777c30f01dfab9ea7c713b4335a2f584e62c0abb9868413eb915b"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


