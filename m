Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1854AC83F21
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.56129.1751879228940391649
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hr9IszB0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879239; x=1783415239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7te0yzfA8vDEyyPWluIJt1PzrcruBNxZpvmWjLFiVKs=;
  b=hr9IszB08axuG1gM/KkKcxvHZl4nqTKFs1rkBRn6El/vu+xHZgG04z28
   j+NbtxJEk5B9nKrkFdNvQ4QqWHA+EZV+sbJMpIjvi+M3MuAy0KkeRDO2y
   Qr2c0xCXPF368V9Y7tF/IHBoWcmrYFVxhoQeoqPGU6AGBzdDQoq3XlS/e
   62BDre8WrzMx9IVWVdGC43iEHKzAkWslCiWnCj8Uw6kWXtpkEzRvEa0MK
   VaIBTQIUIY6+jTDCbfXM6Y3K6t7YMJKm/P/6zBeLpX0eejKy60lw6VNBG
   cT4u8xWFzmupiVTZOff71IJiYjaeW4nqc7y0p1rFcZP0dn/R9C+Xig7xh
   Q==;
X-CSE-ConnectionGUID: 04LQvCq9RDO+UUMw6saSRA==
X-CSE-MsgGUID: PwilllTCSluFtkSwKW29mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="205437842"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="205437842"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:19 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B0E8E42A301
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:18 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 3233A1C0029E
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7B342BF3C5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:17 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 114D41A000B;
	Mon,  7 Jul 2025 17:07:17 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/35] python3-multidict: upgrade 6.5.1 -> 6.6.3
Date: Mon,  7 Jul 2025 17:06:46 +0800
Message-ID: <20250707090656.1216-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118269

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-multidict_6.5.1.bb => python3-multidict_6.6.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_6.5.1.bb => python3-multidict_6.6.3.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.5.1.bb b/meta-python/recipes-devtools/python/python3-multidict_6.6.3.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-multidict_6.5.1.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.6.3.bb
index 2a21b39471..5b262ed933 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.6.3.bb
@@ -8,7 +8,7 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 PV .= "+git"
 
-SRCREV = "df0379fe7f27682359e3298a9ad1507f650cc690"
+SRCREV = "dbd686f37c1bc14355dce9c16dbbfae82f11dc00"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${UNPACKDIR}/python3-multidict-${PV}"
 
-- 
2.43.0


