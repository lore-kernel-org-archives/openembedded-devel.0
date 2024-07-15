Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEE1C3DA60
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.33826.1721034177807152453
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rz9CeWyG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034184; x=1752570184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pYKBzROpskPwPLjkaglyQ8tyecPslg/XLOc9lymHJWM=;
  b=rz9CeWyG3AChgXaKphDdFK/ybc9Do8KQdy7M6k2LFU8I+hRE8VDTWI/I
   GhmSXjcqnHdZ8owFXuUU12bxh7COlwRq7JInNxhkc7krjwQewJ1Wpdm2Z
   s3eub8rb5se9AitRdStWMTMEJ2z+ed9olE6pgxDxvEXvRt+iAAA7HI960
   1oiX2s+UY50wF5pLKJJXg9rnQKKYcwXKKaYLanbf1RWxUci4GmJ74OmQz
   e9T7JjhaFpK5O+nJekf1Xpy0uJVtwFrNatu5BiBH8Zm8DeRJmGif0Jdrn
   CeRTJmh3XMjccEmgwlnAzyZs1NhaVgsUzWDSXBKT6qL/E0RFBfcsUkwYB
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="168833509"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="168833509"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:02 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CD066DE2F4
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DAB5D5083
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FF7F20071A38
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3F4E91A000D;
	Mon, 15 Jul 2024 17:02:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 31/38] qcbor: upgrade 1.3 -> 1.4
Date: Mon, 15 Jul 2024 17:02:24 +0800
Message-Id: <1721034151-540-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10-0.133400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xJ1x0KuswXklO79
	DJRUi35poiRiRqJbjhYBXdtZPWfJ2i/7QU2czuUNA9lly13c/gEQhNjZQYyI3LRPJs/q8vyUrBh
	yv2DtHP/i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFMHcOgxfpRpYERkrHLnOJ06fvj
	WVZA+89rHLf/otFIaX5fZy8EMbOv4HDbELF7G+5VgqDWlJSI8p9THqdILE9a0ytqDkkXq3Jex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111351

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
https://github.com/laurencelundblade/QCBOR/releases/tag/v1.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/qcbor/{qcbor_1.3.bb => qcbor_1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/qcbor/{qcbor_1.3.bb => qcbor_1.4.bb} (93%)

diff --git a/meta-oe/recipes-extended/qcbor/qcbor_1.3.bb b/meta-oe/recipes-extended/qcbor/qcbor_1.4.bb
similarity index 93%
rename from meta-oe/recipes-extended/qcbor/qcbor_1.3.bb
rename to meta-oe/recipes-extended/qcbor/qcbor_1.4.bb
index f90e814f7..91f8da465 100644
--- a/meta-oe/recipes-extended/qcbor/qcbor_1.3.bb
+++ b/meta-oe/recipes-extended/qcbor/qcbor_1.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=498c298542365dfcfe29948c72a5849b"
 
 SRC_URI = "git://github.com/laurencelundblade/QCBOR;protocol=https;branch=master"
 
-SRCREV = "1eba85dbbe78fc1938f8aba2112ba1b228caed30"
+SRCREV = "6837bbf14b70b169724ef895565abb03cf254a65"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


