Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39441C0219E
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46629.1739178123453315404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Eiwf2hSf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178124; x=1770714124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NQRBcRWBEWlH9nejwBoGvWisTUYVFIVUCqyARG9y7Co=;
  b=Eiwf2hSf/o2OE9qrFgBjZ4+Jjxx4Y9pftXJmG9kqvp72RPFqB99DnU/5
   ofTmQtBTGWda238PC5xreTpMQiDcD6MXd+MwUypKX8WII30bis9Ro1lCv
   K5qzDRoofjMCmAKTLl2hsPis9LsXM2ckij75NW+ObdgEFVUaculIK3Ph+
   OGkQ8W51ehml28bXs/1dDggVrm6c4HlVMz7KbMT0X/+gkBHBgssI5wr4l
   3UVn+tW0Q6+sNOcaMCcrmuoHsWiDKGKZnm11SdFnqKd1uHIfxV0AbUFXS
   6AOohOnlxiEwNOa7AINaW/fCfX/leGx+JsmNwYL6LKjuNcm13wqCV4mzH
   w==;
X-CSE-ConnectionGUID: 9YaTOt6LTQG2PAjlsKoy2A==
X-CSE-MsgGUID: wArdXcN6SUuwHmkChBKvnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168935939"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168935939"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:01 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7529AC2267
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C01AD88B9
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D484A1A000B;
	Mon, 10 Feb 2025 17:01:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/66] python3-grpcio-channelz: upgrade 1.69.0 -> 1.70.0
Date: Mon, 10 Feb 2025 17:01:07 +0800
Message-Id: <1739178095-26432-38-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115366

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cio-channelz_1.69.0.bb => python3-grpcio-channelz_1.70.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.69.0.bb => python3-grpcio-channelz_1.70.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.70.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.69.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.70.0.bb
index 4c0172e2d6..225048250e 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.70.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "c7b5900a6d3c3e8229e65ae4b6313d64c1693dfaa767f5b0e1c6d1915324820f"
+SRC_URI[sha256sum] = "79334e27f6d9bfbfc536adfa2a4108a1ac048a4d052158f1cc1df6cc359e748a"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


