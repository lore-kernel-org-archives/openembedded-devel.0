Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F5AE6781F
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:27 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.36715.1731922217917448970
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UOnd4upQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922218; x=1763458218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=U1Wf/B3Qd96ZLuSitdoKaoA4MP5gDtAg9pNucVxuvTA=;
  b=UOnd4upQZy+ys/ph23mrPaY7bl9iNl5H2JBHFIsij/zrgpqOSvrMUP4z
   BhCYZHTvOJdOY6jaqf4dLIn15JILHyishTj+LTm05rOjTmfCae6cvtl93
   EOC00FJ4Q952YhZVbVDDFtMlJ08ssiqyfeOskcnQh3IXZb/EZjd1xY+k6
   YCtCeQ7iFMVYafujVowi/40PPpvdzN8Zu1QTbN2V+r6RkbMcBr3L0KvSO
   IR2C0dF4/9OCri9912lbxLVinoCFR33+ttf2zRkvVNGNTWlLxDkyGhL+z
   y9b7p68sv692tPMvKUzZFDyDqmYavevZRqxlhD67Q0cOzEau7DPHIvm68
   w==;
X-CSE-ConnectionGUID: D0yGnGPRRReiFG9VlOQbSQ==
X-CSE-MsgGUID: lJ5D6rYYTvS8DV/I2oGT6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="160250867"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="160250867"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:16 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A581E4458
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 17218F87F
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id A67FC20071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:12 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 572E31A000B;
	Mon, 18 Nov 2024 17:30:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/32] python3-gpiod: upgrade 2.2.1 -> 2.2.2
Date: Mon, 18 Nov 2024 17:29:42 +0800
Message-Id: <1731922195-5266-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--0.882000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyudvIILGGRj1b6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DzWEMQjooUzWAN6i+va16u0Ct
	cUnKf9PicLsX6pVpO2qBVvEjzNBpCHxPMjOKY7A8LbigRnpKlKZx+7GyJjhAU+tjxO+Lh9n/pm+
	WWtO0zCp8raeh6GhGOqrRihSXX21gCKrQTO/xJzUeLLD/CgPEPIJM0H3e4H7q+Tu4vKCXbRKUwY
	N5fTQJn7H2fVekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113888

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 The position of "license="LGPLv2.1"," changed

Changelog:
==========
- fix Chip.request_lines() typing
- improve the output of LineSettings.__repr__()
- import gpiod attributes in external module
- specify a tar extract filter for python >= 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gpiod_2.2.1.bb => python3-gpiod_2.2.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.2.1.bb => python3-gpiod_2.2.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
index 8e1cbf849..2ea650531 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.2.2.bb
@@ -3,11 +3,11 @@ SUMMARY = "Python bindings for libgpiod."
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
 # The actual license files live in the upstream libgpiod from which the pypi
 # package is spun out.
-LIC_FILES_CHKSUM = "file://setup.py;beginline=237;endline=237;md5=f5ddb56912b7f20bf94aa4d1bdcd3533"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=237;endline=237;md5=db3625aebe23c01ea8f70e4fd876bfc6"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "802dad3a89016339a231c462c6da2d56c820f5fb11519728ff86cdff0a16da96"
+SRC_URI[sha256sum] = "aa4571f64e1070d38e4c14c491f69637ee73e23c801d3a418dde4d5410e5d53f"
 
 inherit setuptools3-base python_pep517 ptest pypi
 
-- 
2.34.1


