Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF16DCCF9F3
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:02 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.27245.1761696954308589112
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EPie8Ly9;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696959; x=1793232959;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sO8rlxe3ReM2Yf2ahH5OGGv67J04/674ojvQibbhT4g=;
  b=EPie8Ly96nmqhchizlguIGrfZHTpvu9LJbnn+1BA64CtqeXeSvzuDarj
   JDRoSwd44mYwMy9oNnS4xn6AxVN8OkeQiaxQBnrwc4yMOAQW761ekvCIT
   6nE6IYH4yoUZdPVxc85llVbygj3e6D1No4ssNyzuZYn6SjSLg80mgB7Pl
   dzyTVWJw/qVRlSluvUT9RH/103oIcmKOx9N4l3ZdCvwVQvlmdhRWIvRQJ
   UzZB7xeGPBDF3Yr70dgDXJhHfdQsLM8U3h41wg3cPhkWwtpdLVjErxwz3
   iJj6Efn/535nrJ0bAmTkM2WtQAxUMHmTiYzAMWdnqScABrVi/qAmd2/MM
   A==;
X-CSE-ConnectionGUID: 9TrybKzOTyO6IiSxiDx3WQ==
X-CSE-MsgGUID: J7OR4vSsSrqywQjrX5YIgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="205948892"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="205948892"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:59 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 1109F8203C9
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:59 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BD1E88D205A
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0B8E482C0FC;
	Wed, 29 Oct 2025 00:15:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/32] python3-moteus: upgrade 0.3.93 -> 0.3.95
Date: Wed, 29 Oct 2025 08:14:55 +0800
Message-ID: <20251029001505.528-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121128

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.93.bb => python3-moteus_0.3.95.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.93.bb => python3-moteus_0.3.95.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.93.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.95.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.93.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.95.bb
index a9235fef4f..27dd6ef82b 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.93.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.95.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6d61382935e752536d547c7398a2d6f949a2a8d890580a68994a02309f599fc6"
+SRC_URI[sha256sum] = "8607d7c841345ba88fafacc98b820129176e877f5b13176fe5acb4805cc22281"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.43.0


