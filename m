Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CBEC433FE
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:51:03 +0000 (UTC)
Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web08.43210.1635767461316993947
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@fujitsu.com)
IronPort-Data: =?us-ascii?q?A9a23=3AfKVbUqsczbqfC9neSZxYLJmt+OfnVH9cMUV32f8?=
 =?us-ascii?q?akzHdYEJGY0x3xjQWDzyBPKyOMTH8KYt1OonjoRkGscfRm9Y3GgFvrilgHilAw?=
 =?us-ascii?q?SbnLY7Hdx+vZUt+DSFioHpPtpxYMp+ZRCwNZie0SiyFb/6x8hGQ6YnSHuClUbe?=
 =?us-ascii?q?cY3goLeNZYHxJZSxLyrdRbrFA0YDR7zOl4bsekuWHULOX82cc3lE8t8pvnChSU?=
 =?us-ascii?q?MHa41v0iLCRicdj5zcyn1FNZH4WyDrYw3HQGuG4FcbiLwrPIS3Qw4/Xw/stIov?=
 =?us-ascii?q?NfrfTeUtMTKPQPBSVlzxdXK3Kbhpq/3R0i/hkcqFHLxo/ZzahxridzP1ftZG2R?=
 =?us-ascii?q?h0weKPKg/g1XQRaEj1lIOtN/7qvzX2X6JXNkBedKyOxqxlpJARsVWECwc5wGWx?=
 =?us-ascii?q?I+PkSJTwBYxzGi++ozbaTTuh3mt9lK9HmOo4asHxswTzVS/E8Tvj+rw/ijTND9?=
 =?us-ascii?q?G5owJkQQrCFPIxEAQeDpS/oO3VnUmr7wrpn9AtwukTCTg=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3As+DGH6gFMHArYFj7J/m/0+BzIHBQXuYji2hC?=
 =?us-ascii?q?6mlwRA09TyX4rbHLoB1/73LJYVkqNk3I5urrBEDtexLhHP1OkOws1NWZLWrbUQ?=
 =?us-ascii?q?KTRekM0WKI+UyDJ8SRzI5g/JYlW61/Jfm1NlJikPv9iTPSL/8QhPWB74Ck7N2z?=
 =?us-ascii?q?80tQ?=
X-IronPort-AV: E=Sophos;i="5.87,199,1631548800";
   d="scan'208";a="116723005"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Nov 2021 19:50:56 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id D69F74D0DC99
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  1 Nov 2021 19:50:51 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 1 Nov 2021 19:50:52 +0800
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-cantools: upgrade 36.4.0 -> 36.5.0
Date: Tue, 2 Nov 2021 04:50:23 +0800
Message-ID: <1635799823-101709-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: D69F74D0DC99.A19EC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@fujitsu.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 11:51:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93732

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-cantools_36.4.0.bb => python3-cantools_36.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_36.4.0.bb => python3-cantools_36.5.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_36.4.0.bb b/meta-python/recipes-devtools/python/python3-cantools_36.5.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cantools_36.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_36.5.0.bb
index ec7d4b87e7..6fbad3fdf4 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_36.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_36.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "8de959fe61bd1d5c30e91aded237f4273c13fafe5fee4d1d78a15a84c8fd9691"
+SRC_URI[sha256sum] = "651b6ea67999c1106a582fd54c92b5b27a1a5f2896e0058beeb96a4f318cb33f"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.25.1




