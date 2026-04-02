Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF15111226B
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:42 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7103.1775096140965546978
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VH6KmEaf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096141; x=1806632141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VNMYAJCTQlfUX9gqZ63hPzkTvMgKJ2vxHXyn3h0z77I=;
  b=VH6KmEafY6ZmSyRw0MJXXJqXA9uFTYgZcRq1BNSEwM8rGUeFFk8OrAsg
   ltpfWWf5stcWaLhwoDnozJdtWESUfy2PKgI6rvH0uQbcdl4GAgTPEW/sX
   iS+FGNNxF4u3VD4oYMtj8VdYGEVILAb/fG1kIbd31RNX4T2ERrwsGZUmZ
   7cNwOuGqVpa61ZhKhA4gwOBgFhYTbwpi8o9/PTAf6FfFNGeoFIi0CdTPW
   cOJB9KcQHsQN/8L+Au7Yw+SWelpKLq9OdBip/vnud8hRYGjA6+HQAlcFO
   eWtg/85jTrsW4AsDMfHs54qVbSqC0m6uHEJKInk1rpdCuCPe+d9zfQGaV
   Q==;
X-CSE-ConnectionGUID: i4JEHNrxTD+sY+4oboLoIA==
X-CSE-MsgGUID: AODgqE8ZQ2GsR72eAjVJTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="239868179"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="239868179"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:39 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 810B9820C0A
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:39 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3A0F41821F7A
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id CD5D11003742;
	Thu,  2 Apr 2026 02:15:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/39] python3-eth-hash: upgrade 0.7.1 -> 0.8.0
Date: Thu,  2 Apr 2026 10:13:36 +0800
Message-ID: <20260402021355.1324-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125936

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-hash_0.7.1.bb => python3-eth-hash_0.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-hash_0.7.1.bb => python3-eth-hash_0.8.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.7.1.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.8.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-eth-hash_0.7.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-hash_0.8.0.bb
index ce67505659..04a94d20be 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ethereum/eth-hash"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3ef06eb4d4373222e59a338e2eb9a795"
 
-SRC_URI[sha256sum] = "d2411a403a0b0a62e8247b4117932d900ffb4c8c64b15f92620547ca5ce46be5"
+SRC_URI[sha256sum] = "b009752b620da2e9c7668014849d1f5fadbe4f138603f1871cc5d4ca706896b1"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


