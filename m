Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F2EC54787
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:03:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.37323.1708333367998122470
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C50mak7/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333370; x=1739869370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Peoypqv1ctqdbVZbKqN3pQlRJkOo84Gr2ndUKMzk2yc=;
  b=C50mak7/toLHKFqi/jg1jZ6Md1wQgMFXrI34qstWval8uewMiT/a/RQn
   jbJIL21obKLXTFm57b+ZWCZ/RwlTVF+v3dbYOTb7XpiVwaCKh/69xzKSU
   wVsMVR6Pai4uM20rfjQJT5xAdYgrZbdFvdne9e2ZJd/bLDsD+9Pevne22
   G8PsQD1WTV/kRCHUZfQcZz/lVtClrfldHnHw6muvDyk55sBi/rhmlm/4d
   12kG3k/3RK1E4xF6TEHTzj7M7pDQ65GDDxn6G4cANC5ngUQOlyahIRHbz
   jX9lwyQd0tlGAXkxPeMKgfw2U1QMk0/9Jbp5LfrQWGLi0AwDM8XvdrH4X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="128546003"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="128546003"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:49 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 44FFF4DA74A
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:47 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7582AD621A
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 02B8220099594
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A7D9C1A006B;
	Mon, 19 Feb 2024 17:02:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/23] python3-engineio: upgrade 4.8.2 -> 4.9.0
Date: Mon, 19 Feb 2024 17:02:25 +0800
Message-Id: <1708333346-17704-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10--0.086800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoi9b7bd19qdFngIgpj8eDcBpkajQR5gb3mn0m688Eo38Kra
	uXd3MZDVTQj4Gc4IUkNEnD5KS9i9bDfmmUUNxYw96FS9KSj/BBUlR6bOHPT1UVug/9bSzn/ZGg1
	l70gLblqPXlKlRcPdoNmGNe7R4lXEEOVjMf4VojFPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108864

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-More robust handling of polling disconnects
-Clearer client logs after disconnect

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-engineio_4.8.2.bb => python3-engineio_4.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_4.8.2.bb => python3-engineio_4.9.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_4.8.2.bb b/meta-python/recipes-devtools/python/python3-engineio_4.9.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-engineio_4.8.2.bb
rename to meta-python/recipes-devtools/python/python3-engineio_4.9.0.bb
index 9dad138ea..790d1b44c 100644
--- a/meta-python/recipes-devtools/python/python3-engineio_4.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-engineio_4.9.0.bb
@@ -17,4 +17,4 @@ RDEPENDS:${PN} += " \
 	python3-asyncio \
 "
 
-SRC_URI[sha256sum] = "f8609e3afdda318fdc336b4ba2de8dd397bb8f9b8a1b43e56c27330e32c2e34c"
+SRC_URI[sha256sum] = "e87459c15638e567711fd156e6f9c4a402668871bed79523f0ecfec744729ec7"
-- 
2.34.1


