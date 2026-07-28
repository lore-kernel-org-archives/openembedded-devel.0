Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCB8C54F53
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5629.1785218823499709376
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Udd39D57;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218824; x=1816754824;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=FyUEsnEJHupXo3FpSyth7Rq2HYpni6Zl8pcK2G1AfEU=;
  b=Udd39D57TtYmF8t0HzzfvOberO4jkxhkmsflPE3b076F7qDuHD8l+/5A
   KKVEfktwk1xIUJW7LQl/qE2HdMPuKAKUjc/Rtayvs/SuHfjtv+E1Sea0f
   WPPh3F6Yl0zx/378Ql61SmvIsHOQORZvj8JoQ4AwcWvlWkfnfNKnDAAw5
   HF4roPE7GTqrKw0p+L1277VekD2zZ5fJS0QpAi1WwWSVI5hge+1zr/IR5
   dDc2C+yCdoSftIRUIDXjoDvBWPpVcsMQlxIyXTHVegB2w8Rh08Z0DOEep
   lKB+ShEq2Xj+BiIKT0O9Ua5Xq8xI3ungEM2IOTcFiA7b97FM4E4JStIqA
   Q==;
X-CSE-ConnectionGUID: LXKNznCWTjKYoMwyftfydQ==
X-CSE-MsgGUID: kvHzuLTAQC+e339mcQq7Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="248766170"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="248766170"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:02 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C518BC00091
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:01 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7DD21896E20
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:01 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id DCE2410005EC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:59 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-bitarray: upgrade 3.9.1 -> 3.9.2
Date: Tue, 28 Jul 2026 14:06:23 +0800
Message-ID: <20260728060645.819-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128480

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_3.9.1.bb => python3-bitarray_3.9.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.9.1.bb => python3-bitarray_3.9.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_3.9.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_3.9.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-bitarray_3.9.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_3.9.2.bb
index a5528dda20..9372c56e6e 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_3.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_3.9.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=6abe80c028e4ee53045a33ae807c64fd"
 
-SRC_URI[sha256sum] = "796f2b4f0e4d84df50bd23ddfacb37d74eec2b2366813cb8f18bdae6b25e3d36"
+SRC_URI[sha256sum] = "37342f81c8f8e10ee5d1e23d5eda2e8dbd9d8d3a9d90e8285181fad57f21cdc1"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


