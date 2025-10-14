Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4D7CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.11095.1760433603924260229
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oQE+XWd9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433604; x=1791969604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZCTfynnH4cW2xzmT2fT6ETej+ZCopD0nTxk2fcIsZZE=;
  b=oQE+XWd9FupMEVJbI+1/JFHUch5TTBMZV1UbLp0D4JPYRQVU/NSkq1DP
   7/HFBAhIQL/TEYLj2tzbukbCa8DY09UEbddCRQd7nXAnuGxL+LfeawmzY
   ky9lOGeXlmDJnZFhQ2bPpa350H2baV65ByP+tm27Qi6asY5BOZPFUi0Wf
   z2wjV/3vfhSY4xpRFNSMblmMgeMygtKYHpcGQ4B/KGkBKDOuPpsnKQrOJ
   wrRnrcgynSBL7fo1zr5k388aMmuNx5fUAklNxy07YLl3VLNyPqcy1/Ist
   2l0ihAzA7xOnKijgdndfP0nyJINpzLxmTMXV7N2QgOlAHMTeVFGq0djqN
   Q==;
X-CSE-ConnectionGUID: gxwAwKLxQ5ap7NgtM+E9TQ==
X-CSE-MsgGUID: Ni/K75RAQO+XDG9ybRpA9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215920941"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215920941"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:20:02 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 281BD42A320
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:02 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D3BB918009F7
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 696C2101BB76;
	Tue, 14 Oct 2025 09:19:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/44] python3-alembic: upgrade 1.16.5 -> 1.17.0
Date: Tue, 14 Oct 2025 17:18:59 +0800
Message-ID: <20251014091927.493-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120573

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* The top-level test runner has been changed to use nox, adding a noxfile.py as well as some included modules.
* The minimum Python version is now 3.10, as Python 3.9 is EOL.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.16.5.bb => python3-alembic_1.17.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.16.5.bb => python3-alembic_1.17.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.16.5.bb b/meta-python/recipes-devtools/python/python3-alembic_1.17.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.16.5.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.17.0.bb
index e3abce84a9..34273e6807 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.16.5.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.17.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "a88bb7f6e513bd4301ecf4c7f2206fe93f9913f9b48dac3b78babde2d6fe765e"
+SRC_URI[sha256sum] = "4652a0b3e19616b57d652b82bfa5e38bf5dbea0813eed971612671cb9e90c0fe"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


