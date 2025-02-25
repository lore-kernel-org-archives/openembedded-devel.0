Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2590BC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.2297.1740525897445317206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tkZ/+WNP;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525904; x=1772061904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Vr+GHBs2HaHnMAOvbt+niCcXd2i0RQ19/+FY1QOLb4c=;
  b=tkZ/+WNP8giHwIR2MTmpc/wNWUCT6LY9GwonjSxXZmbO3ir7cDbPosO0
   jN85Q0hYCaforVjovVjA54DGCudsDGvElUWFRLWVhB0k+UL5sSsgwvvrQ
   NlKTvmWI4YiChzdvlDZg+8mx/3Vv3YIWPtqlLfn5f8w9qzkIP4xb4bDOK
   yuIb8OW0694iI43ptOYar5oEYu+REn+wIFV7Hxe+QGsbs/K2IN+GquH5g
   WbWjyypE4djVpwB5hmPpB7IoW/y/c1n3WDHCRJRpy0bZBNBN/DRK12kY2
   s5+4AYisczn2Hj1/faLYCNWu/LofsRBDhZkmrkroG383YIkBqEbJano9J
   g==;
X-CSE-ConnectionGUID: eZi3az4sR3+Jr8Fsz54a2Q==
X-CSE-MsgGUID: Q3WqWRk3RqOexvSLljSAJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170073424"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170073424"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:03 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D117596743
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 93679141FB
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3557B1A006C;
	Wed, 26 Feb 2025 07:25:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/51] python3-robotframework: upgrade 7.2 -> 7.2.2
Date: Wed, 26 Feb 2025 07:24:30 +0800
Message-Id: <1740525881-21103-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115636

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_7.2.bb => python3-robotframework_7.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.2.bb => python3-robotframework_7.2.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.2.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.2.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.2.2.bb
index 4f43c6816d..670928548b 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.2.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9fc77d40283c26690bbc1563fb7fcadac789afe8695d332ced3fa4696df39eb9"
+SRC_URI[sha256sum] = "9c420f6d35e9c8cd4b75b77cc78e36407604534ec4ab0cbddf699d7c0b2fc435"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.43.0


