Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B180C3DA6A
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.33831.1721034181417654502
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MPYy5pPr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034182; x=1752570182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Fhp1LShLl+5D1F1YwIOBZ86wcN1E2cJBpCoOeHJZc4c=;
  b=MPYy5pPrRsizBTi7k26Epl9GqoHjqdGeucwx5clSTx+CfCWXdMjsq03d
   hCOGZNuXc9dQF9FcuAoUJ34sFwJIahlzjm+ubcRQmPG0HTkpPntp4SkqC
   ozYHDurM7IjJ3KTy0gm4KyROLPqXEf0g24n2v6foIvV0UmCsTqcgZCe3d
   7j2V2TjvimpVQnXlVkkpBp6Vzlvwf4DzygutxhV1tMSAxvL9POnNdHC7x
   LSqMiLV6TJLHmpRvptCdlPUzgBsKF9Zx5bD0onILImgFzt+xCHxOVhHnS
   FfOH+4v9KTaiJ+o5oL8jyTTQeXfOR8Tlg+UyGTdB/ZqX8eJ5QBU7m+unE
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="166909672"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="166909672"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:01 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CE94ACD6DE
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E95FD5042
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 91CA420071A33
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5E3EC1A000C;
	Mon, 15 Jul 2024 17:02:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/38] python3-sympy: upgrade 1.12.1 -> 1.13.0
Date: Mon, 15 Jul 2024 17:02:20 +0800
Message-Id: <1721034151-540-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10-3.677700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN031Nfxfj2zMQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXILSGoqr7ds7VTuoQlTIJ5gNT1wasroaE3OHS
	zaAkwWUF2egJ9FDqrRWq5wpU86FkmMiy7MBhV4l1YUt1HCJMQWHfeU23YMNGj+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111346

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/sympy/sympy/wiki/release-notes-for-1.13.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sympy_1.12.1.bb => python3-sympy_1.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.12.1.bb => python3-sympy_1.13.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.12.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.13.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sympy_1.12.1.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.13.0.bb
index 2bdaf8ed2..f0dd4992d 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea48085d7dff75b49271b25447e8cdca"
 
-SRC_URI[sha256sum] = "2877b03f998cd8c08f07cd0de5b767119cd3ef40d09f41c30d722f6686b0fb88"
+SRC_URI[sha256sum] = "3b6af8f4d008b9a1a6a4268b335b984b23835f26d1d60b0526ebc71d48a25f57"
 
 inherit pypi setuptools3
 
-- 
2.34.1


