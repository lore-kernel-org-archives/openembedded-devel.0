Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DE2CD6E43
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:12 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16947.1779875344806277344
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I0XgjhQs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875345; x=1811411345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7UqwKuoXrdr/XpgM1I1fZPJEoWll4uB+mKqv4vD6Egg=;
  b=I0XgjhQs0Ua7wooQvto1471ej85B4h/oilpR6vHH1hssnFITKqQbZAAu
   Gynb6z+HQmHzsEhVMklJjofcuMY7e/r9KgvU1kgxpyxMhc9NV/PtSvxEq
   PrrU3nqucLpHiwd3lXeFZgwzfuqnrOXGytw7O6G4Aa37/EM2bvaPtMlU8
   xTd45Cu+F5Av3xwXt0nLMK97PcigqCjNyBGBHDt8+pR8ecfQuXyHyXY07
   CKydky9HvM1m3vwbKcbarB69hpzT7lK8F1djpSLjwhxpgGyRXlktjneiY
   +h7xvh2a7hIsl9jKtiSop3lvafecAfONpRdsrw+PVS9wb/yjVL9dzUMBW
   w==;
X-CSE-ConnectionGUID: 0M9NE4AySjS8JS4faXgEVw==
X-CSE-MsgGUID: m4bCIgN4QGyX4WlHKWJODw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="242050313"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="242050313"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:03 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3FC68C00377
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:03 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EB3478319DD
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D25F382A2D5;
	Wed, 27 May 2026 09:49:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/56] python3-gevent: upgrade 26.4.0 -> 26.5.0
Date: Wed, 27 May 2026 17:47:36 +0800
Message-ID: <20260527094805.2039-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127234

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Build and publish Windows 11 ARM wheels.
- Add preliminary support for Python 3.15b1 and distribute binary wheels for it.
- Support for Python 3.10 will be ending soon. Support for PyPy will be ending soon.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gevent_26.4.0.bb => python3-gevent_26.5.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_26.4.0.bb => python3-gevent_26.5.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_26.4.0.bb b/meta-python/recipes-devtools/python/python3-gevent_26.5.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-gevent_26.4.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_26.5.0.bb
index c29b55d25d..a1dbececdf 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_26.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_26.5.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} = "python3-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "288d03addfccf0d1c67268358b6759b04392bf3bc35d26f3d9a45c82899c292d"
+SRC_URI[sha256sum] = "1655eb04c1e20d71b2aa4a3c7528162dd58ff6cc46a037af1f01f534c80fefba"
 
 CVE_PRODUCT = "gevent"
 
-- 
2.43.0


