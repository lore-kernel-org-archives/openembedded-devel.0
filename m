Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF3E8C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:45:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.152083.1692150343231708717
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="127722423"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="127722423"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:45:42 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EA12FDB3C8
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:45:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 421E8D5006
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:45:38 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AF8F520050193;
	Wed, 16 Aug 2023 10:45:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycodestyle: upgrade 2.10.0 -> 2.11.0
Date: Wed, 16 Aug 2023 09:45:14 +0800
Message-Id: <1692150314-5674-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10-1.236600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwtPxpF5zja6dlQ
	tUFiiij6JRQhkpSayI+gGOZ3m2LY5+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiF8plQwfMmRJSeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDtOtw0wsfMT6SF38+0ZX0bl7I/c/6ZMkgRBCu6a+wKsAS3L79qaeYi9EIl0g7vmxrxl/Q
	qZulyjtQfzKSC493ueomxx4LqI/cIK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104393

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Drop EOL python 3.6 / 3.7. PR #1129, #1160.
    Add support for python 3.12. PR #1147, #1148, #1152, #1153, #1154, #1163, #1164, #1165, #1166, #1176, #1177, #1182.
    E721: adjust handling of type comparison. Allowed forms are now isinstance(x, t) or type(x) is t. PR #1086, #1167.
    Remove handling of python 2 <> operator. PR #1161.
    W606: removed. async / await are always keywords. PR #1162.
    Internal: move tests to pytest. PR #1168, #1169, #1171, #1173, #1174, #1175.
    Remove handling of python 2 ur'' strings. PR #1181.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pycodestyle_2.10.0.bb => python3-pycodestyle_2.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.10.0.bb => python3-pycodestyle_2.11.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb
index b29fd48610..9a8d1076fc 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "347187bdb476329d98f695c213d7295a846d1152ff4fe9bacb8a9590b8ee7053"
+SRC_URI[sha256sum] = "259bcc17857d8a8b3b4a2327324b79e5f020a13c16074670f9c8c8f872ea76d0"
 
 inherit pypi setuptools3
 
-- 
2.34.1


