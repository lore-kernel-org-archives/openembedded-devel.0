Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5FBC001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:49:19 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.116138.1698050954978551008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="137297322"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="137297322"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:49:12 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 42EC8DDC78
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:49:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 825DE742C43
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:49:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C89D434786;
	Mon, 23 Oct 2023 17:49:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.31.3 -> 2.31.5
Date: Mon, 23 Oct 2023 16:48:33 +0800
Message-Id: <1698050913-25818-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10--0.034900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrYjDXdM/x2VNGQgIVrmBL5JhD
	mI9zl/n34CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO1FwN
	IqCPogbUfVb3LdvcP9APjOeLHxmiS+rQCrOjEn1zr0UmAJ0S9tMmifQrQOslifSjNS6b0YfpEuj
	bLrGkHita9T0UVyIAPu78oVJ18wfPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105671

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Raise warning instead of error when using fps in pillow
Consistently load GIF frames using the same pixel format

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.31.3.bb => python3-imageio_2.31.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.31.3.bb => python3-imageio_2.31.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.31.3.bb b/meta-python/recipes-devtools/python/python3-imageio_2.31.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.31.3.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.31.5.bb
index 709822da70..4efea1dad9 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.31.3.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.31.5.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "74c6a832d81b7ad5a8a80976dea58ee033d3e2b99a54990cbd789b4cb0b31461"
+SRC_URI[sha256sum] = "d8e53f9cd4054880276a3dac0a28c85ba7874084856a55a0294a8ae6ed7f3a8e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


