Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C40C7EE3A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8605.1685518841175940890
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="118834810"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="118834810"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:47 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B00BADA68D
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E266CBF4BA
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BFF968957;
	Wed, 31 May 2023 16:40:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lru-dict: upgrade 1.1.8 -> 1.2.0
Date: Wed, 31 May 2023 15:40:14 +0800
Message-Id: <1685518820-20028-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10--4.946700-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yTo39wOA02LhGEfoClqBl87fUZT83lbkEJYv
	gWqjMEzaNYCBzzxsUnvZ5eN1eJMdpVpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrPxq3ixYTmGC+6X06BRGedm9RYy+aTqMwWSRFDtqiM5SwT2OEnoCt48nUevv3IhmQF/3f
	RNYnyFe93BOg2Ew0GzHz1YCTUXl633FZ31mJ166AXGi/7cli9jqLpXV8E1T7y2duf1KYOL/JB7N
	QM46QPsGc7eJWfx5c0Z6nuQ5u+kQ+lmfBv88VIT3QqJN4m15UFOdKnCeVjjIZsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNYR7UCeb5VgbHiOL2g/fMoyc/7beg/ypbP/v6B4BQEsBf+EjTPpln0bWjPT
	nh+rRpfT5rfr+qks0+gALDrrlpHKszLhBaiut+ejgMZI4KJ30U8mdcvbI1h2S6jzjuXTm0MTMzI
	CazP4UehYtaVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102919

From: Wang Mingyu <wangmy@fujitsu.com>

0001-lru-Use-PyCFunction-instead-of-PyCFunctionWithKeywor.patch
removed since it's included in 1.2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ion-instead-of-PyCFunctionWithKeywor.patch | 37 -------------------
 ...ict_1.1.8.bb => python3-lru-dict_1.2.0.bb} |  4 +-
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-lru-dict/0001-lru-Use-PyCFunction-instead-of-PyCFunctionWithKeywor.patch
 rename meta-python/recipes-devtools/python/{python3-lru-dict_1.1.8.bb => python3-lru-dict_1.2.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-lru-dict/0001-lru-Use-PyCFunction-instead-of-PyCFunctionWithKeywor.patch b/meta-python/recipes-devtools/python/python3-lru-dict/0001-lru-Use-PyCFunction-instead-of-PyCFunctionWithKeywor.patch
deleted file mode 100644
index b93d1594d..000000000
--- a/meta-python/recipes-devtools/python/python3-lru-dict/0001-lru-Use-PyCFunction-instead-of-PyCFunctionWithKeywor.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5013406c409a0a143a315146df388281bfb2172d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 1 Mar 2023 19:53:36 -0800
-Subject: [PATCH] lru: Use PyCFunction instead of PyCFunctionWithKeywords
-
-PyMethodDef uses PyMethodDef and not PyCFunctionWithKeywords and when
-callback is specified as PyCFunctionWithKeywords, clang 16+ is able to
-detect function signature mismatch in function pointers now.
-
-Fixes
-lru.c:629:17: error: incompatible function pointer types initializing 'PyCFunction' (aka 'struct _object *(*)(struct _object *, struct _object *)') with an expression of type 'PyCFunctionWithKeywords' (aka 'struct _object *(*)(struct _object *, struct _object *, struct _object *)') [-Wincompatible-function-pointer-types]
-    {"popitem", (PyCFunctionWithKeywords)LRU_popitem, METH_VARARGS | METH_KEYWORDS,
-                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-1 error generated.
-
-Upstream-Status: Submitted [https://github.com/amitdev/lru-dict/pull/45]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lru.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lru.c b/lru.c
-index 8adcb4b..33c18ab 100644
---- a/lru.c
-+++ b/lru.c
-@@ -626,7 +626,7 @@ static PyMethodDef LRU_methods[] = {
-                     PyDoc_STR("L.setdefault(key, default=None) -> If L has key return its value, otherwise insert key with a value of default and return default")},
-     {"pop", (PyCFunction)LRU_pop, METH_VARARGS,
-                     PyDoc_STR("L.pop(key[, default]) -> If L has key return its value and remove it from L, otherwise return default. If default is not given and key is not in L, a KeyError is raised.")},
--    {"popitem", (PyCFunctionWithKeywords)LRU_popitem, METH_VARARGS | METH_KEYWORDS,
-+    {"popitem", (PyCFunction)LRU_popitem, METH_VARARGS | METH_KEYWORDS,
-                     PyDoc_STR("L.popitem([least_recent=True]) -> Returns and removes a (key, value) pair. The pair returned is the least-recently used if least_recent is true, or the most-recently used if false.")},
-     {"set_size", (PyCFunction)LRU_set_size, METH_VARARGS,
-                     PyDoc_STR("L.set_size() -> set size of LRU")},
--- 
-2.39.2
-
diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.1.8.bb b/meta-python/recipes-devtools/python/python3-lru-dict_1.2.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-lru-dict_1.1.8.bb
rename to meta-python/recipes-devtools/python/python3-lru-dict_1.2.0.bb
index e825e43df..7a3a17274 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.2.0.bb
@@ -4,8 +4,8 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9d10a486ee04034fdef5162fd791f153"
 
-SRC_URI[sha256sum] = "878bc8ef4073e5cfb953dfc1cf4585db41e8b814c0106abde34d00ee0d0b3115"
+SRC_URI[sha256sum] = "13c56782f19d68ddf4d8db0170041192859616514c706b126d0df2ec72a11bd7"
 
 inherit pypi setuptools3
 
-SRC_URI += "file://0001-lru-Use-PyCFunction-instead-of-PyCFunctionWithKeywor.patch"
+SRC_URI += "${PYPI_SRC_URI}"
-- 
2.34.1


