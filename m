Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4763C77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:07 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.13878.1750662720349057416
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FtPrp2WK;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662721; x=1782198721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yEqGU5faBEXVqMYoYYuC7l//5wpZsjn+PGS+k5+bsO0=;
  b=FtPrp2WKyIm1vap0e+1sN8+BCBQRth+7WbjqMXkLafxYZfWEM3+P1Lds
   Yiw+DHqu9vsEZiab3f9JQCm0c9J+w1VSbE7spX8rq3Kng3I7jIzfElWAK
   7mnjjhi8H8st36JgoEBMP4ZdOTwjqnAP7HODwznPCrh+uOEoKKacwXDy3
   yJ4NZxDzYS47cctBAies4mhTbqVsgLlFcn0a4kmJjw1CJceyabk3CgJJA
   irEfAZ8Yx8eaYijyEMhS+Gb5nTI1e55WyfagZeDU3h3pMpqFlKlPwIvGS
   /yP3JrTdtgkjbRalcszj8jR24eLEExe+1joPAt1T8g5MGcBjlLlO48RnP
   A==;
X-CSE-ConnectionGUID: jnCTFKNDTrSorND3udS3EQ==
X-CSE-MsgGUID: yTHLHd72RJKUVYf3GSNxbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="182540725"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="182540725"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:59 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E571E8FE2
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D3120BF3C7
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:56 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5263F1A0073;
	Mon, 23 Jun 2025 15:11:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/30] python3-xlrd: upgrade 2.0.1 -> 2.0.2
Date: Mon, 23 Jun 2025 15:11:36 +0800
Message-ID: <20250623071138.402-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118057

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix bug reading sheets containing invalid formulae.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-xlrd_2.0.1.bb => python3-xlrd_2.0.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlrd_2.0.1.bb => python3-xlrd_2.0.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-xlrd_2.0.2.bb
index 4707e31854..928e52ed04 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.2.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "f72f148f54442c6b056bf931dbc34f986fd0c3b0b6b5a58d013c9aef27
 
 SRC_URI = "git://github.com/python-excel/xlrd.git;branch=master;protocol=https \
 "
-SRCREV = "b8d573e11ec149da695d695c81a156232b89a949"
+SRCREV = "3a19d22014d7b3f3041b7188d21a653c18c709bf"
 
 
 inherit ptest-python-pytest setuptools3
-- 
2.43.0


