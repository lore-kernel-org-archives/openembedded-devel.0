Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5E8C44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:02 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4909.1783503951176083112
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JAIoQKEr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503954; x=1815039954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dEFmN9cqTWxSw4O1Rc9szCUbSK0M3zVMes/2VHy5woM=;
  b=JAIoQKErByTgV0dtf6ujsfzgGuzwA1utNhEE1tBZ9r58comLLrMmEvb0
   UvXEYCcaCpiRaphcP7UWe9y8nyIeRDO4esGizmBc4HTKfmtIXrmCApUCf
   YH2YR6JwQX6oAAwsb7T7zh49I7+hOlb8JIuc/7RHWLZqsTSRglPCRl3TH
   A0EjfB0VNviH8NHS1rsyySbwXmNTEy709vTzyp5OuyX9KxC7llp2UgsG+
   qJ4Rd4FOyR3IqmKnCgtZDH9WOtb8FlU/YFhaDnIjA3vgheu7ntOCrt+Pv
   4BkISaPcU0V/BMzS4T/XSoxES6zk/y99FIp6BrQ2LG5D9yEfTJWx+v0ze
   g==;
X-CSE-ConnectionGUID: ANP/u9LETmy+b7EC0Jr3iQ==
X-CSE-MsgGUID: otZSxQEoRr+0e5ARH3plDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246699912"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246699912"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:54 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 24E1A1002816
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:54 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D4123C008AB
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 05824180112F;
	Wed,  8 Jul 2026 09:45:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/37] python3-pillow: upgrade 12.2.0 -> 12.3.0
Date: Wed,  8 Jul 2026 17:44:35 +0800
Message-ID: <20260708094508.2060-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128096

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pillow_12.2.0.bb => python3-pillow_12.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_12.2.0.bb => python3-pillow_12.3.0.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
index f3fcb2d3c1..1c6668e53d 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f0ac3777cfc96ded1b825e32ae7c99"
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
            "
-SRCREV = "3c41c095064200a02672d89cc5ff629eaf4b0d4f"
+SRCREV = "bb1d8e8ab8d29048624d96e3ee53cecf7c13d13d"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


