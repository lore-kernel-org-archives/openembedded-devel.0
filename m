Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A66D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:30 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4119.1765274185780992236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MC8w2SAD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274187; x=1796810187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uKyzGebfBwySaWxN9M5U6VF/6832j3uI+4SaLyClzHw=;
  b=MC8w2SADQzn9AsusPqk8Oz938JYsPQo8HME6LfqROArwtuGTfmSV8hCc
   9BO1CUs89HzrdUD5AtmmnoAKLAshU6r7B5gaB3No6CJ+cmywvkrU0dS9k
   z7Mv4YwZmKBaCqDEiiW2EdT2xOlUawUX5eeAOCo/vv3XIyc5YA4mzWSJW
   YZpqLEL8XobsV/DayAQVE6WlX78ocQHHIfOBBr/yUVAZmthrE48T8LqPu
   fgpELuHFAYdGd2VORGcm1+5ZtZVpeb+O5kTazdZKBzDBYOaN8nKdGAr1G
   vH9gJFlcSKVB78y1YzgAm1c8TQ2dB993vOI11DIIdxtVkwy27j+/c8q4T
   A==;
X-CSE-ConnectionGUID: xqG1E6jnRmiia50Imjbuwg==
X-CSE-MsgGUID: 2G0KrnnkRM2xM9Otn7OITw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221991893"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221991893"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:26 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1D9E542A31F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:27 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C486F10001E7
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 5F9ED20002AF;
	Tue,  9 Dec 2025 09:56:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/38] libsdl3: upgrade 3.2.26 -> 3.2.28
Date: Tue,  9 Dec 2025 17:55:23 +0800
Message-ID: <20251209095552.690-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122413

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.2.26.bb => libsdl3_3.2.28.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.26.bb => libsdl3_3.2.28.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.26.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.26.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb
index 47751ed57b..98eebd30e8 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.26.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "dad488474a51a0b01d547cd2834893d6299328d2e30f479a3564088b5476bae2"
+SRC_URI[sha256sum] = "1330671214d146f8aeb1ed399fc3e081873cdb38b5189d1f8bb6ab15bbc04211"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


