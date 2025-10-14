Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648E2CCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10923.1760433597451302600
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HA2BcWHV;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433598; x=1791969598;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SMKmUtg+QIznl1E8M+FizV7w6aLYE6h2TJ95T2/QVTY=;
  b=HA2BcWHVPjAXfD/GCJ0oBSt4kZiyV4BBbtQH7m3ZjVIiS7EVvQ1CsWtA
   fFraiQiT/yhU6YFkf4hSPYEIucpzje/6KNEnBalZ4ZS7ztjAGRta61Ka/
   G/bmkGmDyLtQl0VOGSK6p9fGmBLEben9LpPbIPrI3SIc4uyncjSZZjFxC
   H/AdX+nEd1WeIeSabpJebIL7rBszrC+/d4Ts5DUYu85YqzHcp55SVUOg4
   7iTwtb+UwugFHS3Hn8sqk5p80vtT3m9DwK+a8YXX+6S2EIO9xf6NLpsXk
   yH1SgJrLo8AL4ZGdRCXVaEH5vC0iP5ZCH+mg5NM0PaSiTHTWnQLEgzHyX
   Q==;
X-CSE-ConnectionGUID: ReWPYAwjTkewO0rOYcnvPw==
X-CSE-MsgGUID: vtFSfyiwQzqAG0U3h0pZjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="194812626"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="194812626"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:40 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 87A3342A31A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:40 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 3D80418009E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id AE979101BB76;
	Tue, 14 Oct 2025 09:19:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/44] ctags: upgrade 6.2.20250921.0 -> 6.2.20251012.0
Date: Tue, 14 Oct 2025 17:18:47 +0800
Message-ID: <20251014091927.493-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120569

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20250921.0.bb => ctags_6.2.20251012.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20250921.0.bb => ctags_6.2.20251012.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250921.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251012.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20250921.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20251012.0.bb
index 7f87f15f9a..5fec7c2b06 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250921.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251012.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "d45ba7971bea23a404a275a3a77c53a85f808fed"
+SRCREV = "e6a4947d6e04001771d4740636f83d34a1d6f281"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


