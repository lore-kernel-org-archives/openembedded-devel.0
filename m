Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE18FD533E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:14:00 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92727.1772187235245943002
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LgEkpipM;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187235; x=1803723235;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wjvMHwRnfNdVueaNrZmsOWr9+QTWPOfhsvcLVChnVh0=;
  b=LgEkpipMa2nB2rbCQRpmJo69HSn7VwVLdVfS4PKIC3s688OwGN9AISPN
   bxaFyawwOnhK6uJArbcw3NhdZL8KoirkJyGfpQzcYjpB4xxeqqnebPgpv
   Qg3orycy22qsjCLP9J70yPmYZInmtTKI39jeMC04ea7+0F3qQ0HYFQR6v
   m0q7JTKvTpKpEXBsn6qFGqh7BFFmgTGZp4ZDo9rgymNTdvzpy/ziumqkP
   OvBflGW1ohzlpW/s6w5CXdxmt3dQM2lvl8gjDMGmhKLL4PDqUmrhbuu3R
   eBMC+BDcmMiN3zoFZuDRsI+Ldtcd+xo/CFdQgqnSGSPnIbBAXngw7U4ys
   g==;
X-CSE-ConnectionGUID: iO1lSm7IQZ6zmqzu4h4waw==
X-CSE-MsgGUID: 81BNYuu7RbKHth9ii7Pgqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231987863"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231987863"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id BA3DBC00354
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:53 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7254A180A327
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 78BE818005BF;
	Fri, 27 Feb 2026 10:13:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/52] python3-filelock: upgrade 3.24.2 -> 3.24.3
Date: Fri, 27 Feb 2026 18:12:43 +0800
Message-ID: <20260227101327.1432-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124708

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix(ci): add trailing blank line after changelog entries
- fix(unix): handle ENOENT race on FUSE/NFS during acquire

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.24.2.bb => python3-filelock_3.24.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.24.2.bb => python3-filelock_3.24.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.24.2.bb b/meta-python/recipes-devtools/python/python3-filelock_3.24.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-filelock_3.24.2.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.24.3.bb
index d1e59107eb..8458ad42f6 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.24.2.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.24.3.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c6acbdf7bb74caa37512c3a5ca6857b"
 
 SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "c22803117490f156e59fafce621f0550a7a853e2bbf4f87f112b11d469b6c81b"
+SRC_URI[sha256sum] = "011a5644dc937c22699943ebbfc46e969cdde3e171470a6e40b9533e5a72affa"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


