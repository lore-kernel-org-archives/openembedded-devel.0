Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABD0CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:09 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.15383.1755679203411207527
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qwVy7QLG;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679203; x=1787215203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hiTj3urugWwoAlrwdw0193NfKeT9mYdT9zUG0cDUAaA=;
  b=qwVy7QLG6kCv+I8bx185yJRjeTwOm3QAKkcvwW4erAx1NG0H9c64MLKE
   BcgLfHSAE07q1zYy8AgVVrjXZokhcJKqw/g7Twb0IGNHo7G+/npuaTIsr
   TFOphyow+QVevbG4qB9UFUtfLAe3Eqoz7LhbHbqlahr2rFg8G8AuCufuH
   Zcm7pn4vR0BNN6N4BEmfU32Ut3BM3e650+PXEGlQdqXuEiYklI6ObEqFF
   yBKgAsKz+ooMsKRRGoTdNrSfKDUxsCRm5uw/3WIJy4TEJxJa4YszGNEnx
   /ftMY1jH9FIf5ARdrL4+ywo8rA81z/wtU2mNw+/zWIKn04EvytCMWzCk+
   w==;
X-CSE-ConnectionGUID: NjNndnKdTpa/TBLakl87Nw==
X-CSE-MsgGUID: B24AGdzgRg626kfef5WSaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="198519909"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="198519909"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:02 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id D9A621C00087
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:01 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8DA59C03847
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:01 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 71EBB40CDC7
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F5961A007E;
	Wed, 20 Aug 2025 16:39:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/26] libsdl3: upgrade 3.2.18 -> 3.2.20
Date: Wed, 20 Aug 2025 16:39:28 +0800
Message-ID: <20250820083945.802-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119021

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.2.18.bb => libsdl3_3.2.20.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.18.bb => libsdl3_3.2.20.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.18.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.20.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.18.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.20.bb
index 168230e5d8..30e2d42097 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.18.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.20.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "1a775bde924397a8e0c08bfda198926c17be859d0288ad0dec1dea1b2ee04f8f"
+SRC_URI[sha256sum] = "467600ae090dd28616fa37369faf4e3143198ff1da37729b552137e47f751a67"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


