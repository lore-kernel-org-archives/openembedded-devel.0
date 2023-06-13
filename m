Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60366C88CB7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.3831.1686620459046713221
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108391038"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108391038"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:57 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 074F4E8521
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4625AF807
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:54 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C160120074732;
	Tue, 13 Jun 2023 10:40:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.30.0 -> 2.31.0
Date: Tue, 13 Jun 2023 09:40:14 +0800
Message-Id: <1686620422-29962-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-1.466400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyskqO0L6qpr3L6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5W3G
	AUx857UX6Ow8Xf59WTzLMOIe5KFXyvXaqwRHARdw92hAjmvQRvD/D5epfoRbx8nKAk+oCIEpDxa
	9kyICoStj8BaXT+c6uCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103244

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    Fix pilmode kwarg for get_reader/get_writer (#994) (21039b2)
    Decode gray 16-bit PNG as uint16 (not int32) if pillow allows (#987)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.30.0.bb => python3-imageio_2.31.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.30.0.bb => python3-imageio_2.31.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.30.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.31.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.30.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.31.0.bb
index 6bcba2ca7..d3e575518 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.30.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.31.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "7fc6ad5b5677cb1e58077875a72512aa8c392b6d40885eca0a6ab250efb4b8f4"
+SRC_URI[sha256sum] = "9e2d1dec1c74ba10d58856f2f02883b84f5cd5be937a1156cc238b539a6cf068"
 
 inherit pypi setuptools3
 
-- 
2.34.1


