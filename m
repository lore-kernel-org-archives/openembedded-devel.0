Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA716E69EBB
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:16:59 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8067.1733185010411138136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:16:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=boFjOdxN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185011; x=1764721011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QxndwjjmeNRQ4du/kSCHlxlXVeJgD44ujUId0vcYnYY=;
  b=boFjOdxNvzV2DLkie0YorpmbyFTHnLRM3SFVHdmQssYCa8we8ScJemiD
   TeYrEsloqFDB8dmaGqzVsk90GItGN8ukIwkvwPD1Rmz8JLRcsbnDE9ap3
   b+YvTmzkDNJgSZKJ2Lb6taw+CGmxynH8Qb+2ndA9BH6a944BFeBWQQwGP
   Fc86LzuLF1X+IqlKNvrwlGBtHQTlPx8eZCcRm1GyY+ooxGpiJ+UZPPfKy
   CJ6FspQ9qDazJ9/x5UW0E8DDumg5gKKrjcL/tlCQ5By+g5ILLuvyi0rnP
   BtAmK5yFmivO8A3KEL/Lyc3lsR+P+YNqnDsawBlKKBJPQweGXCptvJeut
   w==;
X-CSE-ConnectionGUID: kxkvk+LxTViu2h7LOWaVtg==
X-CSE-MsgGUID: D6ldcCWARICu6cV+J0yuZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="182406399"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="182406399"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:16:49 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B774D4808
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BC72BDC8A
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EA4016CB26
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:46 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 964161A0003;
	Tue,  3 Dec 2024 08:16:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/34] debootstrap: upgrade 1.0.137 -> 1.0.138
Date: Tue,  3 Dec 2024 08:16:09 +0800
Message-Id: <1733184999-27041-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10-0.218600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKN5v0jh1hv25cFdomgH0lnFEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtF/a
	6QWbgQ20keCE1Gc1jqQfC8TUGo8pXj3A5S1Vbkdrl0No8IbNVRy/oDBUM96tnmZ0yg8ysL8wTDY
	HLLGMOc9HEFc86BmyHYxh71ASwtwLyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:16:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114145

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{debootstrap_1.0.137.bb => debootstrap_1.0.138.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.137.bb => debootstrap_1.0.138.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.137.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.138.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.137.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.138.bb
index d4783b3549..fb3ad7378f 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.137.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.138.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0003-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "666927457ee4b0b3e68e55a0efbf3fb69189610b7abbd534017d7032cb3ae833"
+SRC_URI[sha256sum] = "e8e8b72388b6e5ced65d1b5e69ce0b9e13f4813da0c328a52add57ee5f79430a"
 
 S = "${WORKDIR}/debootstrap"
 
-- 
2.34.1


