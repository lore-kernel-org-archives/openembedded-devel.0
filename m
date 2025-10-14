Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50F5CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:08 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.10947.1760433662234954498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZFkD0X4v;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433662; x=1791969662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GY94hDpWspJY11sBGdlPbMu+PT0MuJv1uFpQR84zWoY=;
  b=ZFkD0X4v2aiJJOgVKLPmxYsQI8ku/V+x2UZUoWVFW3PnUg5fmuvdS8h5
   Q6lL9w7cB57Ym6c39o2g3gFqbZAl4wp7uGUM1+59Jmyas28iuvR/7CzRV
   xnfdxdBIPnalGEwp+xz4jwGEGkO0Uf9/qe3T0kHU1jqnBXmRJdA9yEW0s
   MeSf/D1dWLC3I7oUd0DYrOmmDnI/Z5XeHJ1X7MN4HG47V2I0p3ciAcv5M
   n64BBCtmxtk1sbKEeQrQzntmEuVE1kFnA1N3rg4HE1MkGs3xyG4TCDwmu
   BVVF6yllvHth9P5m/yVtxSvTwqkM2C3zbXoTZik/mmzzIGvYw0FL1CQ2G
   w==;
X-CSE-ConnectionGUID: WuCrjwojQFqQ9Xk9VDAH3w==
X-CSE-MsgGUID: v5s2lqCAS+G53guTix/U2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="204394550"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="204394550"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:21:01 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id C5A521C1C710
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8037118000C2
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id EA470101BB76;
	Tue, 14 Oct 2025 09:20:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/44] python3-pyudev: upgrade 0.24.3 -> 0.24.4
Date: Tue, 14 Oct 2025 17:19:16 +0800
Message-ID: <20251014091927.493-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120590

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyudev_0.24.3.bb => python3-pyudev_0.24.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyudev_0.24.3.bb => python3-pyudev_0.24.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.3.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyudev_0.24.3.bb
rename to meta-python/recipes-devtools/python/python3-pyudev_0.24.4.bb
index a44fdad3fd..559b828fcb 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.4.bb
@@ -3,7 +3,7 @@ SUMMARY = "A libudev binding"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[sha256sum] = "2e945427a21674893bb97632401db62139d91cea1ee96137cc7b07ad22198fc7"
+SRC_URI[sha256sum] = "e788bb983700b1a84efc2e88862b0a51af2a995d5b86bc9997546505cf7b36bc"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


