Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1964DE69EBE
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.8206.1733185019611837934
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Rs5WxvHe;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185021; x=1764721021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EsF2PZbr1sM70eDsrbVp7G1Tm3COLGYDXN5syvmDUww=;
  b=Rs5WxvHeKevV7J0CTMTUu4vbao88g02u8+UJHLhWpRr7cZqvQpwp/R7Y
   9HDY23KFzfVR6jL9sGdIlMgujxya12qd9K/sUaMpraVuidyn04B6smEpw
   7wUigwceEuYlX6YiOAoBW3KdLBSnTsRT/yVOS/c+gaIQzujDTWdSAN4+G
   6cWSfbxvQj4Wh67JfMC44gCnKRRWKytk+JdRBSuvxdUym2nBLOv/b6smj
   6KEc/jrLy9o5HUcBNbn33+rshNJbx7iUUEb2BDT8J7skmmZ03NAwpVXYF
   4Elc6Eh8Azu6snWUO8VXGn7hXqNX+C8CdUwxt0SPPVJlTRNJ3IjlHfjS2
   w==;
X-CSE-ConnectionGUID: EQFVM3x2T9C4B9YqYT553w==
X-CSE-MsgGUID: PVCjYhINSnC7iz6yVRJGHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="161250549"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="161250549"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:00 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 52E73DC697
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 28292D4BC2
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BF85F6CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FF1E1A0071;
	Tue,  3 Dec 2024 08:16:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/34] python3-imageio: upgrade 2.36.0 -> 2.36.1
Date: Tue,  3 Dec 2024 08:16:25 +0800
Message-Id: <1733184999-27041-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--1.269600-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysC10TsipyQq76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFLWDKxcJsIE7yoOyLjzmpDzB/n
	d7Adv030u4TVX+wlauVb1JY/iOaOLSl0qIXse1gjHVKVzHSt7vig2tumvocL1RMcVerUHF9+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114161

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix failing pillow test

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{python3-imageio_2.36.0.bb => python3-imageio_2.36.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.36.0.bb => python3-imageio_2.36.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.36.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.36.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.36.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.36.1.bb
index 2faa16b4cf..2fff0cdff3 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.36.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.36.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "1c8f294db862c256e9562354d65aa54725b8dafed7f10f02bb3ec20ec1678850"
+SRC_URI[sha256sum] = "e4e1d231f47f9a9e16100b0f7ce1a86e8856fb4d1c0fa2c4365a316f1746be62"
 
 inherit pypi setuptools3
 
-- 
2.34.1


