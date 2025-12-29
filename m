Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D90CD3B7E5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:30:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40574.1767000590282734388
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=U2b6uOFP;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767000591; x=1798536591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LklGvoDBLfm1SGbDThh1c7/QMTUfFCTuxuRBgRbZA4A=;
  b=U2b6uOFPoaPgyOGaiD+NLqcEwmqE7qhXCqCd6c8hwwFyCFGRqlyW+67H
   /IqNsV4z8VN5U176Y4EQW2+9jRSo+ivh+wdL+MgYEaVDp5ws8BH7MwSvZ
   MJpEbeuOYylz0V0z16YYTWp2J+k2hjH8j/O76zknRllNDq2v3aaOlSYhn
   zh9LULX6p+ZkpG1CathABkNyoaBXnevt4Oz6178FYhwgVTDk1McFXaAaa
   mTmyH6ne8sPzWX21nzAtXDkCtdf0OqW5bC+INfPK3if/Uzak7gqwdd4ra
   1TXloa885rJgdNRNO3RS9k/4E+lao/no4+8s4B8JvYwYCeC5oTT8f0hZk
   g==;
X-CSE-ConnectionGUID: Sup6qW7WTeWTS6dLneMYfQ==
X-CSE-MsgGUID: r2Yab4jiR72V2iJMs1acnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="203210077"
X-IronPort-AV: E=Sophos;i="6.21,185,1763391600"; 
   d="scan'208";a="203210077"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 18:29:50 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 72EE21002B9B
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:50 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 280C3C00755
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B613A10003AE;
	Mon, 29 Dec 2025 09:29:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 04/10] python3-bleak: upgrade 2.0.0 -> 2.1.0
Date: Mon, 29 Dec 2025 17:29:30 +0800
Message-ID: <20251229092936.1483-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251229092936.1483-1-wangmy@fujitsu.com>
References: <20251229092936.1483-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122968

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Added bluez parameter to BleakClient.start_notify() to allow forcing using
  "StartNotify" instead of "AcquireNotify" on BlueZ backend.
- Added bleak.args.SizedBuffer type for better type hinting of buffer protocol
  parameters.
- Fixed calling logging.debug() in WinRT backend.
- Fixed calling logging.warning() in BlueZ backend.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bleak_2.0.0.bb => python3-bleak_2.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bleak_2.0.0.bb => python3-bleak_2.1.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb b/meta-python/recipes-devtools/python/python3-bleak_2.1.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-bleak_2.1.0.bb
index 161b21b88c..1825a45843 100644
--- a/meta-python/recipes-devtools/python/python3-bleak_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bleak_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hbldh/bleak"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bcbc2069a86cba1b5e47253679f66ed7"
 
-SRCREV = "718e5d76cd051910a9d5266266af632c2529c03c"
+SRCREV = "3ddfc34c66c42631d1d194b8f65854f5f1141849"
 PYPI_SRC_URI = "git://github.com/hbldh/bleak.git;protocol=https;branch=develop;destsuffix=${S}"
 
 inherit pypi python_poetry_core ptest-python-pytest
-- 
2.43.0


