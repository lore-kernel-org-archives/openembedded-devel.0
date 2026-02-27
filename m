Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2F7FD7F7F
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:20 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92466.1772187313277002993
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qd1Fx1DY;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187313; x=1803723313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7dZEW2LmyS/BYg2SMVu0FyAnuO+eQ6sg4D6hz36tmgY=;
  b=Qd1Fx1DYrd6n6O/teIep78Jk7V7UnCj/am1SsUGgkL8aXC/naYMPyGsS
   MhLlDp2GUKkOiZBm5L0zjx/5j7bR9wP89OMxa2nl9hMYpHcb8KNJ0+osx
   HA6je7b+/QgSoYFfByLaNtppzg6P5HP6D+uO1tmCufpUVkUylz0j8/WaB
   HpI8UVRp/5VXNFPR9MMhV2zVlH9R84yRSb6A3A2i7RupDsLlAs4CiCkKi
   c6uychIoy93VuL96ke9jiar/qniK2BJ2BArtvO1Pg/b6Fe2NDL06pc1dm
   kfhuh45ZuqwQJkhOrgZUxXcT1FKzMLHIZehKCdMLMmsOsmWjiEVuMNS9+
   A==;
X-CSE-ConnectionGUID: H2OjLbwlSD2sQNNPM8dyVw==
X-CSE-MsgGUID: xryWN9mvSW+qXLF06Leq0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="219257609"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="219257609"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.fujitsu.com (Postfix) with ESMTPS id AC0D21C1C706
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:11 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 61CB9180ABCE
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8405018005A1;
	Fri, 27 Feb 2026 10:15:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/52] python3-typeguard: upgrade 4.5.0 -> 4.5.1
Date: Fri, 27 Feb 2026 18:13:09 +0800
Message-ID: <20260227101327.1432-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124734

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fixed iterable unpacking incorrectly calculating the cut-off offset of the
  item list when assigning remaining values to the star variable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_4.5.0.bb => python3-typeguard_4.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.5.0.bb => python3-typeguard_4.5.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.5.0.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.5.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.5.1.bb
index e294e3e701..1c62e076cd 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.5.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "749bea21cdb2553e12831bc29f1eae980b22c7de8331ab67ae7db9e85470b5a7"
+SRC_URI[sha256sum] = "f6f8ecbbc819c9bc749983cc67c02391e16a9b43b8b27f15dc70ed7c4a007274"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


