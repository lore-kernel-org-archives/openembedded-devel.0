Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA27BC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:52 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3431.1784112035952588858
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RtGPtZv5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112045; x=1815648045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W+CAVdEdtLp+hc7InSUgAunmnk0iY+itA9csKaExEKM=;
  b=RtGPtZv5dT+9wGxvxpj5E5wLhzFzGuoodGdYND7xJBhlKJyTuuOElM6g
   1jYXi4omnswlbg1CS8aEfDugqNzDoE3tq8/cCBnSucjbnjK/qmRp6Q7WK
   lOfFtpWjRvqOvZny4e+GsXvi6esy3TsUGe8crJx26NIfzxkK+3jiEeS7e
   F7U2/SpoYlyDxkV5XXnlybm0eZbHK/M/F5i/xodXPaMfNHvOHPDG1xOck
   ARAe7ouYrWvg4OPguNQ46J33ywM61cf96htgYjcKlnaPXnqauwePiPArJ
   32tiHHdnwIsS8VsXDSYRsFVriWamMO5xSslSs/LbEWS52ww3xG5aG9uQA
   Q==;
X-CSE-ConnectionGUID: EcNQREX0R3CkTPzaWbnRbA==
X-CSE-MsgGUID: EyVZed6HT4imlTRCtZ1IHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247518968"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247518968"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:44 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D45E21000150
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:43 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 84D34C00563
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8660E1800B81;
	Wed, 15 Jul 2026 10:40:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 43/44] xwd: upgrade 1.0.9 -> 1.0.10
Date: Wed, 15 Jul 2026 18:39:13 +0800
Message-ID: <20260715103914.2120-43-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128216

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xwd_1.0.9.bb => xwd_1.0.10.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xwd_1.0.9.bb => xwd_1.0.10.bb} (79%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.9.bb b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.10.bb
similarity index 79%
rename from meta-oe/recipes-graphics/xorg-app/xwd_1.0.9.bb
rename to meta-oe/recipes-graphics/xorg-app/xwd_1.0.10.bb
index 4a05a4437a..41d3b12be3 100644
--- a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.9.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.10.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c0cdb783e9a0198237371fdaa26a18bf"
 DEPENDS = "libxmu libxkbfile"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "dc121b84947eb4a3d1131bff1e9844cfa2124d95b47b35f9932340fa931fbd3f"
+SRC_URI[sha256sum] = "4909eacc26c4cd5a9afcd1468aec26e7c646544639031bdad4f71173aa82f3c3"
-- 
2.43.0


