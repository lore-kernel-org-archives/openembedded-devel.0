Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BF2C25B7C
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:40 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.10786.1715677832659927880
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I/OnH0DL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677837; x=1747213837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ilh26ETALMVmK+wNBZJpUSbdOZ7FTddvdPJXAftwKPM=;
  b=I/OnH0DLPhA+DKdO6R0mDs4CO/bCMtNXN66JF2Uahn9VxV2YtRzv22Xb
   UbB7jx6UA7U1tAy46Cc8yzSUTrckw/lBEe7QPHndTzZq8v4znEPFjk0wz
   riaMkgdy6dixuT4paifhpkNy5BFz1pkOXKR8BJKiy8ZebpbMem1/O5MP+
   /pgc5XiyPwnK16cSR2yDrFlNfkwK9wYipEsKbMPlZBd/4eDMaOv1HLhH8
   nqsRFF5cRJQ9fr0ZNYrFZyBHBQDI0qdkJJOLzgU+NxvSaF2Y4IvpvZIet
   CB61uJz66FrrkSOdUItCyXfRkD2PM3nTPFeW0iHH05BhvJxtbwWLCV6GJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="157675037"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="157675037"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:35 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04B5FC68E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5300AF765
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D57016BB7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 82A901A000C;
	Tue, 14 May 2024 17:10:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/44] python3-freezegun: upgrade 1.5.0 -> 1.5.1
Date: Tue, 14 May 2024 17:09:54 +0800
Message-Id: <1715677817-2223-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--1.026300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w79JT
	s6Y8xeFobjb3wt9sEi0Yd2lxgvjhayuHFEePyJ1dfmszIfhA6NYOewtFnAVb0F4hDO9vjYtG7b1
	3iYp6+3WQsjJ0ApyiKCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110367

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix the typing of the 'tick()' method, and improve it's behaviour.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-freezegun_1.5.0.bb => python3-freezegun_1.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-freezegun_1.5.0.bb => python3-freezegun_1.5.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-freezegun_1.5.0.bb b/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-freezegun_1.5.0.bb
rename to meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb
index b9cbedbf7..8b5750df4 100644
--- a/meta-python/recipes-devtools/python/python3-freezegun_1.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-freezegun_1.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/spulec/freezegun"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=acf1d209bb6eddae4cbe6ffd6a0144fe"
 
-SRC_URI[sha256sum] = "200a64359b363aa3653d8aac289584078386c7c3da77339d257e46a01fb5c77c"
+SRC_URI[sha256sum] = "b29dedfcda6d5e8e083ce71b2b542753ad48cfec44037b3fc79702e2980a89e9"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


