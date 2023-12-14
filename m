Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D2AC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:46:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.17687.1702543556485998394
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:45:56 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="131331027"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="131331027"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:45:53 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 01D86D502B
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:45:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 38235D2B23
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:45:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B9DA202CE10C;
	Thu, 14 Dec 2023 17:45:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-argcomplete: upgrade 3.1.6 -> 3.2.1
Date: Thu, 14 Dec 2023 16:45:43 +0800
Message-Id: <1702543543-27472-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10--3.510600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrAWQaZTMSP86KS8s/FMqmOFYM
	JR3dIrh2tYdwot7bS63y7Kkqj/XZ07BAQLqGlKivP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsLJjQpIWhSuM3PhwfmFb3pg7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipciVGPn7siAS9mYhhY7mgakzxI92RLei7U67GF
	xJ3BKjEtCfVtf6OH/rSV5X52IkPVLbVyj2MLU4Jl6x2z753vcpYoKGRBZRM+/6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107424

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Allow explicit zsh global completion activation
-Fix and test global completion in zsh
-Add -yes option to activate-global-python-argcomplete
-Test suite improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.1.6.bb => python3-argcomplete_3.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.1.6.bb => python3-argcomplete_3.2.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.6.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.2.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.1.6.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.2.1.bb
index 28dd9f90c..e6b9af084 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "3b1f07d133332547a53c79437527c00be48cca3807b1d4ca5cab1b26313386a6"
+SRC_URI[sha256sum] = "437f67fb9b058da5a090df505ef9be0297c4883993f3f56cb186ff087778cfb4"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.34.1


