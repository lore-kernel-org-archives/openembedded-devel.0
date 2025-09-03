Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFC68CAC58B
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.7938.1756890231044712977
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d9IdTZ9T;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890232; x=1788426232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fgwWcQQoBb+TQbB6HyL0Rr54qaK+/805jMlStqdTCYA=;
  b=d9IdTZ9TVQigKlU39N57D4Bhj6+J/qkTmtQodD/3egqk/GmoFBeP2FNF
   Wbo93tkOH5GbeyYsTqL+2UWjrd0jS1KEtRCV/XWEzp3L+N/RhhxX/j/ya
   T160iQiebasjO/qn6jpNcAWlRpGZx+wzH5/cd1nfBLJcTfID5AnCOorvY
   mFdKOeTBC/Wz2GX0dmHZP3ZaTLHDUHbfn6A5I0o/SI2z2lYVOJSNgvEFc
   ABgQPOMbmWFUQyO1HjVW24L8JeciZR0gi4cc+a2KJkiuVLB7yKH7nEIDW
   YMBI5AVPWo41iGYpGArTVLu2y0eoEVvdU6UMuviN3kWYw8yO/1kdolXSZ
   w==;
X-CSE-ConnectionGUID: Y5TRUYqJTcmv5eIkW7nnvg==
X-CSE-MsgGUID: b46p8ELkRZaLUP+mFyhAoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="190352778"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="190352778"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:51 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 294F61C00094
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:51 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D99A8115071F
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id D0B712005D33
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D1D871A0078;
	Wed,  3 Sep 2025 17:03:45 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/56] python3-gevent: upgrade 25.5.1 -> 25.8.2
Date: Wed,  3 Sep 2025 17:02:51 +0800
Message-ID: <20250903090317.2002-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119228

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-gevent_25.5.1.bb => python3-gevent_25.8.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_25.5.1.bb => python3-gevent_25.8.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_25.5.1.bb b/meta-python/recipes-devtools/python/python3-gevent_25.8.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-gevent_25.5.1.bb
rename to meta-python/recipes-devtools/python/python3-gevent_25.8.2.bb
index 05c4ea2205..014271cb91 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_25.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_25.8.2.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} = "python3-greenlet \
 
 SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
 
-SRC_URI[sha256sum] = "582c948fa9a23188b890d0bc130734a506d039a2e5ad87dae276a456cc683e61"
+SRC_URI[sha256sum] = "0cfab118ad5dcc55d7847dd9dccd560d9015fe671f42714b6f1ac97e3b2b9a3a"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


