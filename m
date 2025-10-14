Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD45CCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.11102.1760433615330039716
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HSSk5Enb;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433626; x=1791969626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cM0WfADVxJPH/ARIzC/YtRI2RN6BR08aTeRuv4NnZKQ=;
  b=HSSk5EnbNTDopXoHPpXPnIbkbCOj2cQvUylOHZMY2P7U2N9e9FtpBads
   Uw4I4q6ev3DH1Y1U9Yz8auYoJLSnACYIty6SmPiarCk2nqBoq2whZ7l+h
   a1dk/sq4zr0VFotYn1uOhGUfbaiwvJ5DGAGljQL0utEgs9IbwxGF3Ixi/
   scIYCCdZT50RfmMkPx1obhZrQY9+vu/I0Iqqe8vIR2/B6rwid9GtdpJd8
   yHnSYzaGAhdOT45BTPCF00+go5wmnF45MzStrQ50HjXSJT5l1gN4UaANP
   eZh46mCe6SJBPQ64CDucbkWeeUE0uBjhrL7blEZAasaOQTRy61MMzzQ2T
   Q==;
X-CSE-ConnectionGUID: 0P+8q8tVQuaFriAnRLDEvg==
X-CSE-MsgGUID: y4G2lQFwRh2qmMIhpTdiIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="203275714"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="203275714"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:25 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 4A62E100034A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:25 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0339A1C0029C
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:25 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 92656101BB77;
	Tue, 14 Oct 2025 09:20:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/44] python3-platformdirs: upgrade 4.4.0 -> 4.5.0
Date: Tue, 14 Oct 2025 17:19:12 +0800
Message-ID: <20251014091927.493-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120586

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Bump pypa/gh-action-pypi-publish from 1.12.4 to 1.13.0 in the all group
- Bump pypa/gh-action-pypi-publish from 1.12.4 to 1.13.0 in /.github/workflows
- Add support for Python 3.14
- Update Windows file paths in README
- Bump astral-sh/setup-uv from 6 to 7 in the all group
- Drop 3.9 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_4.4.0.bb => python3-platformdirs_4.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.4.0.bb => python3-platformdirs_4.5.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.4.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.5.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.5.0.bb
index bc52e02d28..7c1996fbae 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "ca753cf4d81dc309bc67b0ea38fd15dc97bc30ce419a7f58d13eb3bf14c4febf"
+SRC_URI[sha256sum] = "70ddccdd7c99fc5942e9fc25636a8b34d04c24b335100223152c2803e4063312"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


