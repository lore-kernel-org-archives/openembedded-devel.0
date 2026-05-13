Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EEACD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:21:48 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.271.1778646100180634240
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n9QfY7wZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646100; x=1810182100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P70oH5aDJVmTDe6OTTVHO+I1yLi5WEWIX8pUiV1ONQ0=;
  b=n9QfY7wZUd4/S5KUTcY0bp3nQEJlIb7r37O2YlBohnyuG/zFLUoDYB9u
   r78hBoYWTyiYOumNQ1BaeElKzxa1KmkASBpKe01J0FlmHqdxbylhtPvnO
   YkO0rnLbO+CgE/6eJmaLXZ3TnuYAsZ4AyDncs+nA3zQZZtyPgcPp8h6az
   Uyuz0RGHSeRpZ9Ilhf5JKqdWFaTE8PdYtK44RmErZno+YqAU9RMwHWfl+
   TJFWBKe7Qx3cOXfI5LYWzJbQauTGQopWmsRHiPrnqMlGbaBlE+HhR2HPz
   3ASXIxHmeIALZHNJUFlV3HaKX173akCmnYgxbQfY45y5KW6V3vdzIptW3
   w==;
X-CSE-ConnectionGUID: MyvcfJi1Qe+//0sSfDKyOg==
X-CSE-MsgGUID: 1OtTja/1Qr2PEH2z6x2y7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228216736"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228216736"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:21:38 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9E46B5C09
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:38 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 532111803201
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id CFC8714001ED;
	Wed, 13 May 2026 04:20:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 52/56] valkey: upgrade 9.0.3 -> 9.0.4
Date: Wed, 13 May 2026 12:19:48 +0800
Message-ID: <20260513041952.450-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126941

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
(CVE-2026-23479) Use-After-Free in unblock client flow
(CVE-2026-25243) Invalid Memory Access in RESTORE command
(CVE-2026-23631) Use-after-free when full sync occurs during a yielding Lua/function execution

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../valkey/{valkey_9.0.3.bb => valkey_9.0.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.3.bb => valkey_9.0.4.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_9.0.3.bb b/meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_9.0.3.bb
rename to meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
index 1842befdee..93e37a922a 100644
--- a/meta-oe/recipes-extended/valkey/valkey_9.0.3.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_9.0.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/valkey-io/valkey.git;branch=9.0;protocol=https;tag=$
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE-7.patch \
            "
-SRCREV = "6e63ad9ccdceea562a6ea9ea9df9160c0d1109d6"
+SRCREV = "1cbee84ba69b54c3510597965fc4320ce716a6f4"
 
 RPROVIDES:${PN} = "virtual-redis"
 
-- 
2.43.0


