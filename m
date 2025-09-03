Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FACCAC588
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7939.1756890232276940491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Js4W+rCO;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890232; x=1788426232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2LZRsN9pzRlrNJvmT60n/TJDawn73IyKDFny30ZXRSI=;
  b=Js4W+rCO7/P56taqGrg/O0Sj7ZEYLxutmVI8fUcY0/EGFoDZfdAepJtz
   EPOljYnbQwtHNPv+CWzOSh7v8izkn9j+VUqI0qk+Na2L551lTzaWYL52p
   H7Wuy+OcmYf/1+c7s+nJ8TRiHpy26451rp8g3nLyDRBN0/onXzJSBrva2
   y1VWOh12VrjCtqjoMAyWcFGZgAnlzJZ9ODvMiuE9G2F+f6XN8uswFXJOE
   5JWYs/YyuP1Tf13WEJGQ8j87KCBe/a63c7nRYsw1/mJArxngYh5VvFJxj
   Y7Kgg+i9T2ixO1Hl1+bapLGVodpLheQfUgpaRFGVY2CnAlJ3bS7bJtHhw
   A==;
X-CSE-ConnectionGUID: TLseYSkST1iL7OAvViy4yg==
X-CSE-MsgGUID: ozlQvy95Qp2MX6K1AA66qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="199987462"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="199987462"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:50 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id BAAF5100034E
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 784C91C2C20C
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 733861805CB4
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7AE3B1A0074;
	Wed,  3 Sep 2025 17:03:45 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/56] python3-flask: upgrade 3.1.1 -> 3.1.2
Date: Wed,  3 Sep 2025 17:02:50 +0800
Message-ID: <20250903090317.2002-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119227

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-flask_3.1.1.bb => python3-flask_3.1.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_3.1.1.bb => python3-flask_3.1.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_3.1.1.bb b/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-flask_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
index d1f0a183b2..de4a558bff 100644
--- a/meta-python/recipes-devtools/python/python3-flask_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_3.1.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pallets/flask"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "284c7b8f2f58cb737f0cf1c30fd7eaf0ccfcde196099d24ecede3fc2005aa59e"
+SRC_URI[sha256sum] = "bf656c15c80190ed628ad08cdfd3aaa35beb087855e2f494910aa3774cc4fd87"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.43.0


