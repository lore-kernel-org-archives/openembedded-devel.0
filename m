Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E99CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21495.1780394921399704451
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UvjqM9+7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394921; x=1811930921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+bZ+Jcgpznxns8BUKv9h8uoeeaU503U/FqVqJyJQPpQ=;
  b=UvjqM9+7iht8c4/YGgiXkXhki/G05jKBHRw6gHVuL57CbzrOp8JQQJHC
   G9iKAqSSyu0S57sxFRNtMQR4QR2d7rR87pheD2UOj54dYeRK0+DsBAyvm
   3XiXPqUvsemVScuEz7kpYwBfBEsxCsaHc/lsUKChtT40Ezvew2VmHgtN7
   WtkGz4a6Uti2RoWY24qw/cDdlV6IRB7fBNm85WXWdpZ4aS3biqp1DoBLg
   gi4brVBWxl6zjzJGjJ1ZCTmqorhHdS3kO+zgM/pXS1OJC2B27iUZlm8ia
   DjNyv+6b1nR4fcWkGKL2skL4CMmjZT21tSY9+wz7W1TfXFFXmStOVeYPO
   Q==;
X-CSE-ConnectionGUID: R5nIRKV4Q523Q/qOiuuViA==
X-CSE-MsgGUID: vIcCkE3FTBCxNHzMCkmn0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="240840719"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="240840719"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:39 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9130D1002B84
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:39 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 46B1983D953
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3C5491800107;
	Tue,  2 Jun 2026 10:08:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/38] python3-parse: upgrade 1.22.0 -> 1.22.1
Date: Tue,  2 Jun 2026 18:07:37 +0800
Message-ID: <20260602100755.2117-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127343

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Parse zero-precision floats formatted without a decimal point

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-parse_1.22.0.bb => python3-parse_1.22.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.22.0.bb => python3-parse_1.22.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.22.0.bb b/meta-python/recipes-devtools/python/python3-parse_1.22.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-parse_1.22.0.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.22.1.bb
index 95bb2017b5..39719173be 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.22.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "d4987d68ccf08b6ba3bf80b5004ff7de61c4337cba2d8350ae5c9925794979d9"
+SRC_URI[sha256sum] = "d3a4740ec3da338e2b258b2d69741b731eadfddca59e24a14bc4ee5fce38c911"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.43.0


