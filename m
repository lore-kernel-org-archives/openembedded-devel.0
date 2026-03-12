Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A96105A57C
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:59:59 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18858.1773313196844244300
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VPi4cPA3;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313195; x=1804849195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P094FXhMJifRBkD8XN2NRb5PMg3rfMOe1FnC2nHAZHI=;
  b=VPi4cPA3OhHqBTye1mUslT4izMjgXf7fCwq+Qgf8o58U2yHLx5xmbR3Z
   +8B5D1M8VRV6OoF3t9tUBCO9qzZ8Z2Fgz0S++F34GXglXJ9aUV2Rjkny1
   7ztrx7sFRdrPfeBVqDc5kAuVoB+x0HLhfZGesz9kXui/c1q2Qbpm1rCI2
   2L/mqVeUDD591vZN45aw0RHyGEslnTU+AbggLOOqVgsZ2/IaI75e9eGkE
   8KDr3nMP1smki1fX7J3PLTu06WjLmgpr1mhtDP72iiRy4Sq4cfz40xCER
   rokx1494VjFxNWkAulOibHtxvpnN82CXrDHH1cl0qj+//nNxwJBQYPCfU
   w==;
X-CSE-ConnectionGUID: 9atxposeR5mXZ7dsghZ3xg==
X-CSE-MsgGUID: FBdMrW41SnCbLeNCDg6SKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="221636580"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="221636580"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:59:53 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6EC171C166D2
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:55 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 23A008D65C8
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 392EE8288D9;
	Thu, 12 Mar 2026 10:59:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 55/64] python3-tabulate: upgrade 0.9.0 -> 0.10.0
Date: Thu, 12 Mar 2026 18:59:31 +0800
Message-ID: <20260312105940.1900-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125155

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add support for Python 3.11, 3.12, 3.13, 3.14.
- Drop support for Python 3.7, 3.8, 3.9.
- PRESERVE_STERILITY global is replaced with preserve_sterility function argument.
- New formatting options: headersglobalalign, headersalign, colglobalalign.
- New output format: "colon_grid" (Pandoc grid_tables with alignment)
- Various bug fixes.
- Improved error messages.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tabulate_0.9.0.bb => python3-tabulate_0.10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tabulate_0.9.0.bb => python3-tabulate_0.10.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.10.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-tabulate_0.10.0.bb
index 75e97355f5..909f47268f 100644
--- a/meta-python/recipes-devtools/python/python3-tabulate_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tabulate_0.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/astanin/python-tabulate"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ad1430c0c4824ec6a5dbb9754b011d7"
 
-SRC_URI[sha256sum] = "0095b12bf5966de529c0feb1fa08671671b3368eec77d7ef7ab114be2c068b3c"
+SRC_URI[sha256sum] = "e2cfde8f79420f6deeffdeda9aaec3b6bc5abce947655d17ac662b126e48a60d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


