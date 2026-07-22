Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11139C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:20 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44617.1784715852600916875
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b2D3brDJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715852; x=1816251852;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MOh0x4wxwyiMUilHY/ytZzmEOhAL1TfJsaL/S1ofIdk=;
  b=b2D3brDJfAAFMJkW8zzQcFmfo1aGpEK7vHjRzb5TU9OjthSOvboX6ZtH
   p8WtLPyNiDh8JLayUfbtXVLlwDxGoPJKI0bmUX7gQRPqj2z0fzjh8i5Gx
   7nbmHCnwC6gA4BD+XzDvCQwnLbCIrt/PTdoqvj4f7ffrs/cwG/rcmxJMc
   I1WnYYwDePEJsooGQdviff6SPcti34a8jbKRXGKBRlnYyKo74Iot3sS9j
   rLm5cmbJcUlLr0NmayUl+4jrZcBMbuj2Ua8X02bDmcs0jCVfoB9yXijN7
   7QlIjH584Zt9V9kepe+nnyBYTbxjIuNrlFediidCkdmQ+KlvqYIhORm0z
   g==;
X-CSE-ConnectionGUID: OGJKqNhwRHOMjz8Qf2B4ng==
X-CSE-MsgGUID: nM6NDmFnQ4e3wLF1H4g2eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="246377070"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="246377070"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DFB5A1002B85
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:10 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9697E8D65F7
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id B65F44041C4;
	Wed, 22 Jul 2026 10:24:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/37] python3-coverage: upgrade 7.15.1 -> 7.15.2
Date: Wed, 22 Jul 2026 18:23:00 +0800
Message-ID: <20260722102320.1019-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128387

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fix: one of the performance improvements in 7.15.1 (pull 2215) dramatically
  increased memory use during reporting for large projects.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.15.1.bb => python3-coverage_7.15.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.15.1.bb => python3-coverage_7.15.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.15.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.15.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.15.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.15.2.bb
index 47c70b8050..346d970313 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.15.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "165e9949eaf222ef1f018635d0d7f368a23bfe0212af558534c40d8c04686d67"
+SRC_URI[sha256sum] = "3df60dc267f0a2ca23cb7a9ab1109c62b9335ffbf519fcfe167157c28c09b81d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


