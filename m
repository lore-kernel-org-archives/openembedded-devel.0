Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FF1CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 03:55:27 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.31474.1697169321754191026
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 20:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: leimaohui@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="114829460"
X-IronPort-AV: E=Sophos;i="6.03,219,1694703600"; 
   d="scan'208";a="114829460"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 12:55:12 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 51469C3F94
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 12:55:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 88CA0CF7DE
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 12:55:09 +0900 (JST)
Received: from ubuntu20.g08.fujitsu.local (unknown [10.193.129.153])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B81CF6BC67;
	Fri, 13 Oct 2023 12:55:08 +0900 (JST)
From: leimaohui@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-gnome][PATCH] gexiv2: Fix do_package QA issue when usrmerge enabled.
Date: Fri, 13 Oct 2023 11:55:06 +0800
Message-Id: <20231013035506.3046-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.004
X-TMASE-Result: 10--2.245900-10.000000
X-TMASE-MatchedRID: fEO0z8fyv33c+HB+YVvemCeaCBMY8cEnAycZ15wAFvi4hslioo9fGO79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoh2P280ZiGmRngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDXzY+SMm0ortKgB7+4UjYG56edpsnmNuUOCRCSZJztC2f89KOZNami4G6ANC/qtXsq54d
	MdmBy2KMxXkQ2s4DKC8WX6nrVoOUNYOUxqOZP8HxXFEH92Kf64nTtPxlIuIBW9Hzj86YHXBCnif
	x5AGfCL
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 03:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105459

From: Lei Maohui <leimaohui@fujitsu.com>

ERROR: gexiv2-0.14.2-r0 do_package: QA Issue: gexiv2: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/python3.11
  /usr/lib/python3.11/site-packages
  /usr/lib/python3.11/site-packages/gi
  /usr/lib/python3.11/site-packages/gi/overrides
  /usr/lib/python3.11/site-packages/gi/overrides/GExiv2.py
  /usr/lib/python3.11/site-packages/gi/overrides/__pycache__
  /usr/lib/python3.11/site-packages/gi/overrides/__pycache__/GExiv2.cpython-311.pyc

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
index 15091d4cd4..19d31f4286 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
@@ -25,3 +25,11 @@ src_package_preprocess () {
         sed -i -e "s,${B}/../${BPN}-${PV}/${BPN}/,,g" \
             ${B}/gexiv2/gexiv2-enums.cpp
 }
+
+do_install:append() {
+        # gexiv2 harcodes usr/lib as install path, so this corrects it to actual libdir
+        if [ "${prefix}/lib" != "${libdir}" ]; then
+            mv ${D}/${prefix}/lib/* ${D}/${libdir}/
+            rm -rf ${D}/${prefix}/lib
+        fi
+}
-- 
2.25.1


