Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FC1C71140
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.78442.1749526437278235488
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nAsdcbwC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526437; x=1781062437;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=im7PVzrkiCdeAE4CL21EXTEmMkeerTd/Egxy8rHmWyk=;
  b=nAsdcbwCDxnEIds+cUrJPvxl2fuveCWQRjRafqTBUdl9jekxzavOCaDz
   clvkXaWRfBUCcbGabZDRXrnTRy+f+P024VppQNxG0ZWwdkGiIVmc4tSqq
   mXX6s35cXgm8di6Vk0y/oJngmNJikFk2ufwCOHvnpcFfqCQacQ3PA5pJk
   UxLedMcCSJJT7tTPf2U78XJZiPTeK91vXMOtcLIhpesdVjvwFb9sMUxA6
   RLAZ86Ydxi9YRcasWMC1uO/5annuxwEPVOfgf+Nr3IWCrNL7Cs478lK3z
   3rT5WSD+Eg5o6L6ulfktDbOM+OLYsx2Hnk5SV/TkOT+5WVGLOzbTpWvPs
   A==;
X-CSE-ConnectionGUID: sfzfEwSIR5m6lIG/qlfYGA==
X-CSE-MsgGUID: jGzCpGskTma8RrBFBZbKPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="189595030"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="189595030"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EDB2ED6FBC
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 97747D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:52 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1F8601A009B;
	Tue, 10 Jun 2025 11:33:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 50/64] python3-robotframework: upgrade 7.2.2 -> 7.3
Date: Tue, 10 Jun 2025 11:33:16 +0800
Message-ID: <20250610033330.924-50-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117843

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_7.2.2.bb => python3-robotframework_7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.2.2.bb => python3-robotframework_7.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.2.2.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.2.2.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.3.bb
index cf456ac2e6..38417926cf 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9c420f6d35e9c8cd4b75b77cc78e36407604534ec4ab0cbddf699d7c0b2fc435"
+SRC_URI[sha256sum] = "676f75a58e34db04cde91922c0bc68d4d73f091b6be753809ce16e9579412323"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.43.0


