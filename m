Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44706FD533A
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:13:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92722.1772187216399386652
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lYv+q9h4;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187218; x=1803723218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=a1lJVmrJ6vKtnwNJmXY1s8Kcn2/pZiEFkaqZP+5w44U=;
  b=lYv+q9h4h/yvJxNOjOAi+wqTK4eiYfxUCnpN0hAWk0U2XpMr9vMEiFxT
   DnqAZ07ZtGNKKi+1ztE3Y1V0Y/KGhZNFDjfI/v4ucaikvtQ4hv3imGHQ9
   3Z7B0TV1MRq82hziEnyPVt7OrCW/D65PcsRdKgOfPgt0Yfuknew00y0gl
   kVMzaMpumyBiwVm0MlNnbLHYhYDQNuStw/gEWEfhRhuLkAz1BDA64jS9w
   gUNjkJ8qmoHDKjRTSinuTmxSRgV19i54izFuJ2H8K9E2d8mXq3sl24fhx
   GeHVW9UTCOzOUrSdqMtheabJmV8J409L22HiWHAU+ZrgHGVrcvYohoXeR
   Q==;
X-CSE-ConnectionGUID: QeehwnTgTluWGetIJS6euA==
X-CSE-MsgGUID: qmHX0OaLR5289vQ8HVO2sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="218740472"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="218740472"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.fujitsu.com (Postfix) with ESMTPS id 77258C00561
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:37 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 2E6E3C0022B
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 452B518005A1;
	Fri, 27 Feb 2026 10:13:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 02/52] python3-cmd2: upgrade 3.1.0 -> 3.2.2
Date: Fri, 27 Feb 2026 18:12:37 +0800
Message-ID: <20260227101327.1432-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124702

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Updated copyright to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmd2_3.1.0.bb => python3-cmd2_3.2.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_3.1.0.bb => python3-cmd2_3.2.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_3.1.0.bb b/meta-python/recipes-devtools/python/python3-cmd2_3.2.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_3.2.2.bb
index 911d0989ff..8da18f904c 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_3.2.2.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Extra features for standard library's cmd module"
 HOMEPAGE = "https://github.com/python-cmd2/cmd2"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=26efe44f9946f43292f90070d9d5590c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f2a861642858e0858af9dd4e4716bae0"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "cce3aece018b0b1055988adaa2b687ac9c1df38bfd2abfc29dbeb51a9707de33"
+SRC_URI[sha256sum] = "602a10c7ef79eae2b7c8b3874b8ac3a32d9278ceb90c997a2eeb9fc0041ab733"
 
 inherit pypi python_setuptools_build_meta python3native
 
-- 
2.43.0


