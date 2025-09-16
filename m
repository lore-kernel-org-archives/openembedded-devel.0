Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062A8CAC5B5
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:14 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.15419.1758015722736300041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F4RpoBdO;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015726; x=1789551726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pFZapCeTDh1xt0f7PpngKEqFLmow2BljXT1AZUs7kpo=;
  b=F4RpoBdO1ux319/yEdd8udd3+k9ARcGe/Q53HwiumuEbe2YwJfK6h8Tc
   5E2E4RJIjF/tmvEPxwtNexNazBXrpDZax5cyQs90/9TEw4m64jVR4rNzD
   uw6N/NAcoAfHAhsp02AdoUl5qVCuzd9oGFC+PU5UbrJL/vjTPLQ8gCo41
   MhpNZuBC5jEnFj1D8EpAj2ZrWFw1MQmlQ5BxFhoxSXTDa/JfErbF2q6VN
   8VmVJKwtoYqTE+4PNGjLpdnwpTGOwlzsKrovlFZvmDJKinO1BPsQIAFl1
   vwk/NULhcRA8u08wKLwoyBUGGlaM7zKAd+0ELzr/50NKLxMSUAd9MZrcO
   g==;
X-CSE-ConnectionGUID: 0ESBE2frS1yCWlGv7B5qQQ==
X-CSE-MsgGUID: 0W/r+rL7RMy+iLqcAHg0gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="201479432"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="201479432"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:06 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3A0E8C000B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:06 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id EC1EA14003B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 3D0171806763;
	Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B18191A0069;
	Tue, 16 Sep 2025 17:42:00 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/42] python3-apispec: upgrade 6.8.2 -> 6.8.3
Date: Tue, 16 Sep 2025 17:41:27 +0800
Message-ID: <20250916094152.1479-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119437

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apispec_6.8.2.bb => python3-apispec_6.8.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.8.2.bb => python3-apispec_6.8.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.8.2.bb b/meta-python/recipes-devtools/python/python3-apispec_6.8.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-apispec_6.8.2.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.8.3.bb
index 3997f824f6..c34aacf124 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.8.3.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a75956865b40c80a37c1e864716592b4"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "ce5b69b9fcf0250cb56ba0c1a52a75ff22c2f7c586654e57884399018c519f26"
+SRC_URI[sha256sum] = "0823235aa171187fc0fb1dfd28211ebcf5fe7768b2a7e1929d06671e162439ae"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.43.0


