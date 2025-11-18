Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBAFCEBF93
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:08 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8423.1763456940773673596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TmVjVFJP;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456941; x=1794992941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4zUTsQ8DFoJWbnfNVwpxELPUPb3vT45fEsHQ1EewpnI=;
  b=TmVjVFJPd4ItYG4DxjY97VPGsXvfruVot9G3iDW0Wwm+hLv0NOU3rCV1
   aM53gJMVJeZjnbVjJc4mn78Vq8EpugkOcddaXFmS7A8/YZHm4ogz73mBY
   A+MxqzKbYXrcenXNXdcAWxdcnjHgtTzza+VQ/J2T5d9U1nDGJXu498e05
   7qjMUcAkJgh5veLB2QHeZmuE3TPdmoih+2jKjcQc+0gXu64Fxei2RUZj/
   /fE45lfWdynhYi+gT2lWR/yg5s519dOTBEn31uF8JRBvXWbHjHJXwApS5
   7gnBJFQt/jveHbRrtpPyaiDGwelOVUOkeS+/IfTbpF7zg6CzRWwGEzajh
   g==;
X-CSE-ConnectionGUID: YBGgDI78SSyjF6r1XobNZA==
X-CSE-MsgGUID: QvdvYjb+SoeG4hkULAIf4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="208179050"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="208179050"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:08:59 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 18A741C0008F
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:08:59 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B0C991C0014D
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:08:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 372D91400096;
	Tue, 18 Nov 2025 09:08:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/29] freerdp3: upgrade 3.17.2 -> 3.18.0
Date: Tue, 18 Nov 2025 17:08:21 +0800
Message-ID: <20251118090846.1484-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121815

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp3_3.17.2.bb => freerdp3_3.18.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.17.2.bb => freerdp3_3.18.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.18.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.18.0.bb
index 7a95f5399e..02590973f6 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.17.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.18.0.bb
@@ -7,7 +7,7 @@ DEPENDS = "openssl libusb1 uriparser cairo icu pkcs11-helper zlib jpeg json-c"
 
 inherit pkgconfig cmake
 
-SRCREV = "955ad49545919c35ed731bc7716b26ddf888833a"
+SRCREV = "11ed2c65fe1f50f8714e51be5bcb2655cd8ba31f"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https;tag=${PV}"
 
 
-- 
2.43.0


