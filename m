Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED4FC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:58:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.17837.1702544279665288593
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="122093548"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="122093548"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:57:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 65A2BD9DA0
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:57:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AF4DD616C
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:57:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DA5EA202DE8F7;
	Thu, 14 Dec 2023 17:57:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.18.0 -> 8.18.1
Date: Thu, 14 Dec 2023 16:57:37 +0800
Message-Id: <1702544257-28082-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrQ9EvSUXQNFOcNSCz4jo/2V+szQv5P4T6dQ5t2Tp0A7I0+dJe5DbqAAnhJ
	1yuh8t67/EXdEzJHl66D7Pvhy4iu9KuFbKjQp+nx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107439

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.18.0.bb => python3-ipython_8.18.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.18.0.bb => python3-ipython_8.18.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.18.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ipython_8.18.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb
index aaeb720e6..5a7e1fbc5 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "4feb61210160f75e229ce932dbf8b719bff37af123c0b985fd038b14233daa16"
+SRC_URI[sha256sum] = "ca6f079bb33457c66e233e4580ebfc4128855b4cf6370dddd73842a9563e8a27"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


