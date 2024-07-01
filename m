Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728A5C3271E
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:33 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13623.1719816261747094529
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QqOBqjob;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816265; x=1751352265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BRxITYI6UCfu9RRAE/UBEzbgmTreM5X48oa4VIlDUek=;
  b=QqOBqjobOWkRE19ZBfqGDDvYLW3NBRxpT8xHmbQz13P6Mx/4zWBH1d8B
   aFDTwj8qRxHPLGOvEYYBwB8ncFom9tN3AAuJDU8GL3UPrLD3sCM0q9y5Q
   V2Zsan54jPHin6yjWQ2/iapUuX1omrK3vtJi6S9Se1m+wr4ckwvEczy2j
   qSxTw31N4MxJdC7RSFumoqvqWu1NpJJ/zx2Dws70TOWUaj+JPbs//5Zib
   GySw5iX7M+X1Ah2jew/9FY5nhXxY5WnMCOqjRXcyGN0P/E6kWLDFoy49K
   96Ps+BZbCH7mG2mUGvD2j7QkbrZnZRi75Nv2+sdTJou9uyTAWSbVmJ/e9
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="144534146"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="144534146"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:23 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9ED61E8521
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9C93D3F0C
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 77EB2E206A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 290FB1A000A;
	Mon,  1 Jul 2024 14:44:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/25] python3-types-setuptools: upgrade 70.0.0.20240524 -> 70.1.0.20240627
Date: Mon,  1 Jul 2024 14:44:01 +0800
Message-Id: <1719816242-11839-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10-2.316400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSb/oIJuUAIuGYkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SrWD8q4fMARs9TCSuB8t9TuD0MWls9vsawnZIfjT7lhITmV
	h7G7u2md7G49DzMyJSe1biv0lG4fP+5hf6AMpoV3wUEY7JAC6NS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111191

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Update setuptools to v70.1.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ....20240524.bb => python3-types-setuptools_70.1.0.20240627.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_70.0.0.20240524.bb => python3-types-setuptools_70.1.0.20240627.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_70.0.0.20240524.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_70.1.0.20240627.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_70.0.0.20240524.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_70.1.0.20240627.bb
index 781d3b5bb..6e2c6a70f 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_70.0.0.20240524.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_70.1.0.20240627.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e31fee7b9d15ef53980526579ac6089b3ae51a005a281acf97178e90ac71aff6"
+SRC_URI[sha256sum] = "385907a47b5cf302b928ce07953cd91147d5de6f3da604c31905fdf0ec309e83"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


