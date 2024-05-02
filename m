Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EFFC25B7B
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:43 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6686.1714628974573610003
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GCsZZE8L;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628974; x=1746164974;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BmD2fGMnbVedl2g/h6DKYqB1CKrXMcmpYWejIcMp728=;
  b=GCsZZE8LGfo7tyIs+/PknzKIvsC1vxw6sJZ1oQI8CHt5ZnMS/5yCGXGg
   R6OM9FfXt4vfOjoRLuKSWxZXG2ZT/qJNLYqu1VK11WqOCvU3Uj55qfjQd
   tRG0N04u6ihFogpDp+m0Q9XgEZy+gtTFqPYxRwK7sNVQ2OXk0sBL8y3ty
   qdXnfmSAAoGIXmZr1FDh3DczlKZ75U1stPYQv3sK2Zvm9n6xuZ+M3PgDA
   b3m3btKmJad5/PdFOGzEV0NJxlXXsfbZkPQKymHjdYBz9AHs+kWTBTYez
   MTg9ELNKx4EuKV+LiK+0vm61IYGTHf5lhP2rmhHzvQUaVpmj+dML3A/uw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157281965"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157281965"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 82EAFD4C2C
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B0A6AD623E
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 527492008BCDD
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:29 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 00AA91A0002;
	Thu,  2 May 2024 13:49:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/30] python3-types-psutil: upgrade 5.9.5.20240316 -> 5.9.5.20240423
Date: Thu,  2 May 2024 10:48:19 -0400
Message-Id: <20240502144829.241208-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-1.712400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3BF2OdN6oAASl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFEAHLgfmRoVjgW4dZd3RqNwrM3
	WXBOWASFjByUWweoPxEI4CgOnQMFG5+8KRSaDxXg2rnvZIKD9GruTzZirUDZg5GiDEBXBgZ5sNE
	GpLafrrLM/nEDLP056e+TDiyH/49wxfkLAfkNNSaAZk0sEcY14=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110226

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add precise values for enum members where possible

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...5.9.5.20240316.bb => python3-types-psutil_5.9.5.20240423.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_5.9.5.20240316.bb => python3-types-psutil_5.9.5.20240423.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240316.bb b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240423.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240316.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240423.bb
index c6f15696e..876f93a0f 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240316.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240423.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "5636f5714bb930c64bb34c4d47a59dc92f9d610b778b5364a31daa5584944848"
+SRC_URI[sha256sum] = "1b976cf86308316c5ac22cec688015b04273c84f8e691c3dfb0c12318f32a6f3"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


