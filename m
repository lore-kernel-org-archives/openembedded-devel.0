Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C808105A582
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:00:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18638.1773313207346057228
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y15WiyMe;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773313207; x=1804849207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uh9SVczPidBpZIT47+Ji/9dsQ1ajr8PvGzIiyRQoTZY=;
  b=Y15WiyMe5FzEyuruWI4bMe1g+Ul7Ppb0XCdRzIoge/eNguujMTnZuShe
   hKg4stNTzKU5N1Ek2i3TpcOvztTJeJnD+w0zlZXSPonmsiNbYn5TTp64R
   4sRF3iLTvxDmilwMVa1GXeIrX+eCMSCk+oD4Uq4sS7sP2He7RKLLc/4ps
   80Z9OiuFdA8r9ygOhaR+1vbQ9Ffz0f+XaHW9wgfgj2aY3iUBmus5NI8y6
   RqR350PjypmHfuNkaCKnkt3wRgI0wh9233ouP13vphaM9Up8m+CZlPcRb
   p1Q9ggP2SFvNP0UCxlVDUnkqAiknmziifSgccUzLLGQ9K7yKIBQzW31GD
   A==;
X-CSE-ConnectionGUID: P6KTp6O2QpO2CVQMaJ6wGg==
X-CSE-MsgGUID: Dt2d846TTGGP0hdkwopK9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="232426031"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="232426031"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 20:00:06 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id F2A507327
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:05 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9F0841C10080
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id CC9E48288D9;
	Thu, 12 Mar 2026 11:00:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 60/64] python3-wrapt: upgrade 2.1.1 -> 2.1.2
Date: Thu, 12 Mar 2026 18:59:36 +0800
Message-ID: <20260312105940.1900-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105940.1900-1-wangmy@fujitsu.com>
References: <20260312105940.1900-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 11:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125160

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Building of Python wheels for riscv64 Linux platform had been accidentally
  removed from the build configuration. This has now been added back in.
- When a weak function proxy was created for a bound method and the instance it
  was bound to was garbage collected, calling the proxy would silently call the
  function as unbound instead of raising a ReferenceError.
- When deleting an attribute named __annotations__ on an object proxy, the
  attribute was only being deleted from the proxy and not also from the wrapped
  object.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wrapt_2.1.1.bb => python3-wrapt_2.1.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_2.1.1.bb => python3-wrapt_2.1.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_2.1.1.bb b/meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-wrapt_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb
index 6bd9139a76..70652048f3 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_2.1.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=63a78af2900bfcc5ce482f3b8d445898"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "5fdcb09bf6db023d88f312bd0767594b414655d58090fc1c46b3414415f67fac"
+SRC_URI[sha256sum] = "3996a67eecc2c68fd47b4e3c564405a5777367adfd9b8abb58387b63ee83b21e"
 
 # python3-misc for 'this' module
 RDEPENDS:${PN}-ptest += " \
-- 
2.43.0


