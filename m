Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FB6C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:49:59 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.116147.1698050991556256006
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="125519732"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="125519732"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:49:49 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 21281D424D
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:49:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5863BD4F66
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:49:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EF502005932A;
	Mon, 23 Oct 2023 17:49:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.15.0 -> 8.16.1
Date: Mon, 23 Oct 2023 16:49:32 +0800
Message-Id: <1698050972-25873-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrcMevonLZFXHEXghyuabqIDMhemprblfYUKQSjBNZaub6FCghHQvPFHyWy
	/gA1EPhca0MK4JFnT21G2vLWzztYSM9NaNsKu+9x0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105672

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.15.0.bb => python3-ipython_8.16.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.15.0.bb => python3-ipython_8.16.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.15.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.16.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ipython_8.15.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.16.1.bb
index f06e501d76..fba797ae46 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.16.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "2baeb5be6949eeebf532150f81746f8333e2ccce02de1c7eedde3f23ed5e9f1e"
+SRC_URI[sha256sum] = "ad52f58fca8f9f848e256c629eff888efc0528c12fe0f8ec14f33205f23ef938"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


