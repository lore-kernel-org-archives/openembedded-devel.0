Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4DCD73619
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.8207.1733185020432032227
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K3PpIedW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185025; x=1764721025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/K/167kw0IdJ/0XiTrDEfdkUsHNuh9R/71bsGc+BdxA=;
  b=K3PpIedWnZQVxPhsrzXyR6xxFjTNzjB9kyMLghfwJOHkUrtHm/UMLvel
   zrVcl5lzM8pyJ0vL+aWPH3//7giz6R+RkRKCX1J61xnsmCY2oyiI8Xskg
   wvUnRkBN0wkhyXzzdD+YY5yP3L8kx5Hr7TFGc4NH/YkLmxgwL5zJhM70z
   z5aJcJ6CmHH+66idjzLeYk4ZGiTfZg+/bTpypm+9n0VqKHsmla6jE0Tnf
   ZFDEnGWZ4f8jg6zRJUAi1x8dD5qlQkpmr1fdIvYrp6bIxYxAfNQhXWEMb
   12QYzKYuwFyhszow1Y22SZh6eLcDtdKcDOCrrGPPTXNeeStcn2ryTJUiH
   Q==;
X-CSE-ConnectionGUID: Tp/nTLw6SFes+QzQP0qpjw==
X-CSE-MsgGUID: eJzSweCLRlS8WlrnYe/0mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="182406429"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="182406429"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:03 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 83FEADC6A1
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 58E9FBDC92
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EC29A6CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8D39A1A0003;
	Tue,  3 Dec 2024 08:17:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/34] python3-pydantic-core: upgrade 2.27.0 -> 2.27.1
Date: Tue,  3 Dec 2024 08:16:31 +0800
Message-Id: <1733184999-27041-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--5.472800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrdTrzIN6WRwXIgofMgahPrfUt
	SCGaNXOr9aOUpKh0A+oLI4RR3ZLjWxLmJd2F/yFuuce7gFxhKa3Vy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYiOhdNh/bEUXlQRqs0RbkYIDEV/zpFyKvRmJMshC7hikmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1XnC9tO7i0zhzUhzzkew95M564a7/r+s1Igihd6ze2vwOB1ms8YfqsQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114168

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Simplify shared union serializer logic
- Tidy up some uses of Bound<'_, PyString>::to_str
- Fix serialization inference for complex types in python
- Bump to PyO3 v0.22.6
- Fix performance regression for JSON tagged union

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/python3-pydantic-core-crates.inc   | 20 +++++++++----------
 ...7.0.bb => python3-pydantic-core_2.27.1.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.27.0.bb => python3-pydantic-core_2.27.1.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
index 5480100221..2903562e1f 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
@@ -48,11 +48,11 @@ SRC_URI += " \
     crate://crates.io/percent-encoding/2.3.1 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.22.5 \
-    crate://crates.io/pyo3-build-config/0.22.5 \
-    crate://crates.io/pyo3-ffi/0.22.5 \
-    crate://crates.io/pyo3-macros/0.22.5 \
-    crate://crates.io/pyo3-macros-backend/0.22.5 \
+    crate://crates.io/pyo3/0.22.6 \
+    crate://crates.io/pyo3-build-config/0.22.6 \
+    crate://crates.io/pyo3-ffi/0.22.6 \
+    crate://crates.io/pyo3-macros/0.22.6 \
+    crate://crates.io/pyo3-macros-backend/0.22.6 \
     crate://crates.io/python3-dll-a/0.2.10 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/radium/0.7.0 \
@@ -146,11 +146,11 @@ SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa
 SRC_URI[percent-encoding-2.3.1.sha256sum] = "e3148f5046208a5d56bcfc03053e3ca6334e51da8dfb19b6cdc8b306fae3283e"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.22.5.sha256sum] = "3d922163ba1f79c04bc49073ba7b32fd5a8d3b76a87c955921234b8e77333c51"
-SRC_URI[pyo3-build-config-0.22.5.sha256sum] = "bc38c5feeb496c8321091edf3d63e9a6829eab4b863b4a6a65f26f3e9cc6b179"
-SRC_URI[pyo3-ffi-0.22.5.sha256sum] = "94845622d88ae274d2729fcefc850e63d7a3ddff5e3ce11bd88486db9f1d357d"
-SRC_URI[pyo3-macros-0.22.5.sha256sum] = "e655aad15e09b94ffdb3ce3d217acf652e26bbc37697ef012f5e5e348c716e5e"
-SRC_URI[pyo3-macros-backend-0.22.5.sha256sum] = "ae1e3f09eecd94618f60a455a23def79f79eba4dc561a97324bf9ac8c6df30ce"
+SRC_URI[pyo3-0.22.6.sha256sum] = "f402062616ab18202ae8319da13fa4279883a2b8a9d9f83f20dbade813ce1884"
+SRC_URI[pyo3-build-config-0.22.6.sha256sum] = "b14b5775b5ff446dd1056212d778012cbe8a0fbffd368029fd9e25b514479c38"
+SRC_URI[pyo3-ffi-0.22.6.sha256sum] = "9ab5bcf04a2cdcbb50c7d6105de943f543f9ed92af55818fd17b660390fc8636"
+SRC_URI[pyo3-macros-0.22.6.sha256sum] = "0fd24d897903a9e6d80b968368a34e1525aeb719d568dba8b3d4bfa5dc67d453"
+SRC_URI[pyo3-macros-backend-0.22.6.sha256sum] = "36c011a03ba1e50152b4b394b479826cad97e7a21eb52df179cd91ac411cbfbe"
 SRC_URI[python3-dll-a-0.2.10.sha256sum] = "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[radium-0.7.0.sha256sum] = "dc33ff2d4973d518d823d61aa239014831e521c75da58e3df4840d3f47749d09"
diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.0.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.1.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pydantic-core_2.27.0.bb
rename to meta-python/recipes-devtools/python/python3-pydantic-core_2.27.1.bb
index c721ff229f..2f7a2f242f 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.1.bb
@@ -12,7 +12,7 @@ require ${BPN}-crates.inc
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "f57783fbaf648205ac50ae7d646f27582fc706be3977e87c3c124e7a92407b10"
+SRC_URI[sha256sum] = "62a763352879b84aa31058fc931884055fd75089cccbd9d58bb6afd01141b235"
 
 DEPENDS = "python3-maturin-native python3-typing-extensions"
 
-- 
2.34.1


