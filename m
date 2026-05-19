Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC4BCD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:41:23 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19346.1779190878241024749
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dfLQb6bg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190880; x=1810726880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9vHv0o3Mi73VjS20Vk8LNzDjrNcAsnPfOTslNhcTDms=;
  b=dfLQb6bgOeilAGoO28bbQe01Ux4Q7g3JuTWPUiwEttHN/mL4BUVyHen+
   D2+VL0y8VCb4E50UmROh7AKHKU9MKruPSSehJptPFEQa+Lj8cGtukAHTe
   r/Z8TKqKgIgc8ULY+H/kZnV/nVemJsrAVte2VfmjI0ugtX6wT9rr1g872
   dJdTou2uL5mIMcjLa/5/93mO7KyjIpHGMS7DbJKfro5XZr4SOCzFS665O
   KskS6jCE3OGESCD9VmnrCA6bGARNYRr1+WzBfMglXEHvbKRMdmkM2eQNR
   5O7FR3OQCA6SQGUirM7ew7ZO/eqlFpzyfyOpS3xjjX+BCQ+4W9L2iLJPI
   w==;
X-CSE-ConnectionGUID: ln+wM8A7TWu9i0ov3q+ARw==
X-CSE-MsgGUID: 6BGyUF86R+Sb4T48TsV3Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="241113941"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="241113941"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:41:19 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BF57042A302
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:19 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 721111C00962
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id E91DE402984;
	Tue, 19 May 2026 11:41:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/38] python3-virtualenv: upgrade 21.3.1 -> 21.3.3
Date: Tue, 19 May 2026 19:39:18 +0800
Message-ID: <20260519113921.655-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127097

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- add 3.16 to embedded wheel versions
- fix(upgrade): regen embedded init with correct MAX and 3.16
- Accept GraalPy implementation name.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-virtualenv_21.3.1.bb => python3-virtualenv_21.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.3.1.bb => python3-virtualenv_21.3.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.3.1.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.3.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.3.1.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.3.3.bb
index 100f249d00..073f6f25a1 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.3.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "c2305bc1fddeec40699b8370d13f8d431b0701f00ce895061ce493aeded4426b"
+SRC_URI[sha256sum] = "f5bda277e553b1c2b3c1a8debfc30496e1288cc93ce6b7b71b3280047e317328"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


