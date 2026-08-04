Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4831DC55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:17:45 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10151.1785820661178670030
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IdepDz2p;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820664; x=1817356664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qgNEP820uqZrZwIplq1W9W9RI+M0EYfaNuNSDECuhtg=;
  b=IdepDz2pFn+nRRhWfE4eYU15KUJdmP8bq1nJpQeXsxG7hvRUcW/mu79V
   zSzV/C2mrzkU369v5ZCQE27yLMdhzmhggYd7JWyw0csFjoy19RewQgHb0
   5epA/ceDWzSFdNpsLmzVf5K8svjihhq8JqfCDtjrnclLMJE0A5whmiv/A
   nFhCq2aQsxeIhKjZUxm3KKxa5erpQEu+3WO/fmsXXpYC/iC2ZgoY7tbgu
   N2/b7niLKetpqc75XfKVFW+4sdlzx6VmHlEI/SImcQpiY3Gur6hhb6taB
   m0yUvVRsahlMMbN+GYOc16m+eD05yjnMubYthmAB5TngzC//Iwgndeyyz
   A==;
X-CSE-ConnectionGUID: OegO3+wPQLuhg3kjEhNFCA==
X-CSE-MsgGUID: CAxrx8a6Rbax3kObrQ1KwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="227335299"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="227335299"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:17:42 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6684FADBE
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:39 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 1C9BC1803224
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:17:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3881C1800131;
	Tue,  4 Aug 2026 05:17:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/28] nano: upgrade 9.1 -> 9.2
Date: Tue,  4 Aug 2026 13:17:02 +0800
Message-ID: <20260804051726.1489-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:17:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128709

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Nano refuses to start when standard output is not a terminal.
- Options --newbuffer and 'set newbuffer' were added as better
  synonyms of --multibuffer and 'set multibuffer'.
- Legacy keystroke pairs ^W^T and ^/^T are recognized again.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_9.1.bb => nano_9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_9.1.bb => nano_9.2.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_9.1.bb b/meta-oe/recipes-support/nano/nano_9.2.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_9.1.bb
rename to meta-oe/recipes-support/nano/nano_9.2.bb
index 774bd0021a..81faa7da95 100644
--- a/meta-oe/recipes-support/nano/nano_9.1.bb
+++ b/meta-oe/recipes-support/nano/nano_9.2.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5f47764274cb7532349ce0aa20ec10f1e8e851a6e9fa3eb66812c43d196db042"
+SRC_URI[sha256sum] = "05ecb99247b782e8a5b3a25ed4101dd034b0236902f7449bc9795b717642f7e9"
 
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/nano"
 
-- 
2.43.0


