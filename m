Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DC1111226A
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:52 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7224.1775096139922212124
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jnCm7OcA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096146; x=1806632146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r7nmV5Fv+onoomxEhvqiDwwVO46FL2fLZ08V1sd7m1w=;
  b=jnCm7OcAg2KRUpBFv9NalXn9xtiYgVH19K9pzPUekg/5ZWQ7wlwEqwL+
   TNpOiz6bYfsXVTlJgpd3YEDXNeg+yqbFeW1nEaTptbqyBON8Yfoe70tds
   DV3m8PFcL+JldLZhr5+FE+XcneurjFi4IC+S81QuEmuTwhJGB51gHf/bh
   1LkHJ+iv+HoH5WF7uKEqeekHZFPQ4OVQPIGP9CHsMcMeS+3RqzctV8GCX
   gXuhNhdHNN9Ts9X5RvvTDlHj8yxHQ0Zbbve/Qmw4W2NyLsymNxjOJvuAF
   3Pc7lzSCFubPLTXVGnLtMr7JqEcERITlAoimjwHgTVAOpdHTjvBAgmErI
   A==;
X-CSE-ConnectionGUID: 8CnqXxA1Q5WBEoGVbNauZA==
X-CSE-MsgGUID: wOaMyUboSXqySbDT5X92cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="235432990"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="235432990"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:46 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4C3FA1000359
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:45 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EDB68C0342A
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 738831003743;
	Thu,  2 Apr 2026 02:15:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/39] python3-faker: upgrade 40.11.0 -> 40.12.0
Date: Thu,  2 Apr 2026 10:13:39 +0800
Message-ID: <20260402021355.1324-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125939

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Add address providers for ar_DZ and fr_DZ locale

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-faker_40.11.0.bb => python3-faker_40.12.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.11.0.bb => python3-faker_40.12.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.11.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.12.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.11.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.12.0.bb
index c163bbb16d..2f3ec72c02 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.12.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "7c419299103b13126bd02ec14bd2b47b946edb5a5eedf305e66a193b25f9a734"
+SRC_URI[sha256sum] = "58b5a9054c367bd5fb2e948634105364cc570e78a98a8e5161a74691c45f158f"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.43.0


