Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3F7C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:32:34 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.28405.1701160351674797406
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="129235576"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="129235576"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:32:29 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A027EE8BF9
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:32:27 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CA734113C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:32:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id B76418859E;
	Tue, 28 Nov 2023 17:32:25 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.17.2 -> 8.18.0
Date: Tue, 28 Nov 2023 16:31:52 +0800
Message-Id: <1701160312-28184-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrQ9EvSUXQNFOcNSCz4jo/2V+szQv5P4T6dQ5t2Tp0A7I0+dJe5DbqAAfdm
	5lYrdqCohrZai0LzZUROhwZaGS3XQgCI+h4rayRB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107081

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.17.2.bb => python3-ipython_8.18.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.17.2.bb => python3-ipython_8.18.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb b/meta-python/recipes-devtools/python/python3-ipython_8.18.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.18.0.bb
index 134a358bf..aaeb720e6 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.18.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "126bb57e1895594bb0d91ea3090bbd39384f6fe87c3d57fd558d0670f50339bb"
+SRC_URI[sha256sum] = "4feb61210160f75e229ce932dbf8b719bff37af123c0b985fd038b14233daa16"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


