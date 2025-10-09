Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C069FCCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:44 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.5577.1759990117897999315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tWIj/jk6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990122; x=1791526122;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MqZpP9zPIIAwzyQkLqtHDXUMUP46slzLzpdaGN/ZZ3E=;
  b=tWIj/jk6tQ+Fwzg/9Jynxc1VHOlytO94U5hIkoXiQCnYO1vXiDHy4cvq
   c4jH9jmeG8VvWCfDpx8nwNtmdsU8ETSJ0nJNwgnCNSQlJ/VE67BF6JVES
   ps3MGGYlLlQjeSunBBIc0N0PSy6kDYFJKhb+HI4Q0rlLP5/ydI5G6vDbQ
   XGMpXWeHuyyHn1j1Hkin8R2P3iGd/+1mmny6H9UqpxaDKJ9kaKm8W6BX+
   +o5Bf+kDkDqsiZH0rQhyD/vWtPOGXzd+v9c9CL/XtlRM4uPYxFu/j4ACa
   zv/d5Awn0BOvFZTPaUM5EzG7B51OzQUjG+00MY7FvdssoUCvWBRLUJ8w/
   w==;
X-CSE-ConnectionGUID: XYz9Vq4hTquEcMuUqe0j2w==
X-CSE-MsgGUID: OsYFf7YfR3Os03VAGDUt/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="215416767"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="215416767"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:41 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 75A36100034E
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:40 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 31A0BC02193
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B77631001CFD;
	Thu,  9 Oct 2025 06:08:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/22] python3-grpcio-reflection: upgrade 1.75.0 -> 1.75.1
Date: Thu,  9 Oct 2025 14:08:00 +0800
Message-ID: <20251009060809.445-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120410

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reflection_1.75.0.bb => python3-grpcio-reflection_1.75.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.75.0.bb => python3-grpcio-reflection_1.75.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.1.bb
index 107f350fd0..5e64a3d617 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.75.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "60bb9865f5411ad589420eadcdd7e0c338c0aabedf5d4cd07363d5bf7da9c972"
+SRC_URI[sha256sum] = "2be3f20b7b93e6e691a0bc761fd7e9996a940b4c96c68f6ca4f7fbc47c3f4b64"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


