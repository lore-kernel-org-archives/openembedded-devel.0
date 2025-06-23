Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FEDC8300E
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:07 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.13711.1750662715422368177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iKxUrn5t;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662719; x=1782198719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aglw/n7tCGXO5wJdqRG9oyVmBEU3t5bfQXu4lrE4hvI=;
  b=iKxUrn5tBCOkYilh8IVaWm4afo/zN+DBx1xGro8viiX1AUE7Vu/zGa5A
   yJVq9MPtdBK8Rrd/2xvEtaq675H23v6bC8iDC3pDHo8DUTZiZ1edE7aOO
   8g9DwOISylBnS+QugdQ7Y6At2SuOopWj30hOpJTYzVY1wM4VJIDWeh/zy
   YHoe1uv1hgGqbLj87grdfw5RTWOauJ+v+sTBpnMmb3smJEH8EYuA4xSrh
   sZ6htCMysyWS6Pi0xDJ1J9rE/ZCGUVV4pK+MhletDavBVRGq0wVticcDP
   z8P+D/pmavCauw20u/hoav1NjWw5RUjLcXiuGr1VV6TAMgCZN2v7e/2AJ
   A==;
X-CSE-ConnectionGUID: yFURadPVQv2U81oOtgAifw==
X-CSE-MsgGUID: Nt4LxY9zRiKSYNHJNzTuYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="203633456"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="203633456"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3415AE8FE2
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7747D5E22
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:54 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 64D0A1A0071;
	Mon, 23 Jun 2025 15:11:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/30] python3-pyzmq: upgrade 26.4.0 -> 27.0.0
Date: Mon, 23 Jun 2025 15:11:31 +0800
Message-ID: <20250623071138.402-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118051

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyzmq_26.4.0.bb => python3-pyzmq_27.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_26.4.0.bb => python3-pyzmq_27.0.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_26.4.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.0.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-pyzmq_26.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_27.0.0.bb
index 286750950a..f5432b7228 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_26.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.0.0.bb
@@ -29,7 +29,7 @@ SRC_URI:append = " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "4bd13f85f80962f91a651a7356fe0472791a5f7a92f227822b5acf44795c626d"
+SRC_URI[sha256sum] = "b1f08eeb9ce1510e6939b6e5dcd46a17765e2333daae78ecf4606808442e52cf"
 
 inherit pypi pkgconfig python_setuptools_build_meta ptest cython
 
-- 
2.43.0


