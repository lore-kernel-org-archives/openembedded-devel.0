Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2586EC54F51
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:06:59 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5623.1785218811571374681
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VlJQFadA;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218811; x=1816754811;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mjeiBY09ZXF/X+zcB72J1St5ga4HAPbQfzpffZJCcDg=;
  b=VlJQFadARaZ7tm4NaeER0f06gzch/Qv5fekwnj9W3jKrGMye/1TotNeZ
   IgBoqO+iXGfYKVE9bo7kjCjP23IBHvhWk409Er5hWsLjwxvZKomEcL/dP
   l6rp4h/ZPSK3pDqHPAP529KXbt452bkILzTgQbRj5lD7ZVCuJNzEv33A/
   /hOHz04qB0mjpz4B06ME/J506K1ryGNGLgciSHfHiEcSOF1AjN3aVTMja
   1TS+HvdP0QC97MR7/2NykUhJyYX1AaQfaDvOAwKofI/J+kidZl5QX/I47
   /5y+4dhSseX/h19jgYL3aS5fuw6TqlJNfpErp8/db5L8V27MYEw4FCpmh
   g==;
X-CSE-ConnectionGUID: n0LpFdzGSpmXoD8HgJZKDw==
X-CSE-MsgGUID: 5jn5cJ3wQYCTfc9gGkj8Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="226549393"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="226549393"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:06:50 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EDB871000361
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:49 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A0352C013F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:49 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id EA43910005F1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:47 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] ctags: upgrade 6.2.20260705.0 -> 6.2.20260726.0
Date: Tue, 28 Jul 2026 14:06:14 +0800
Message-ID: <20260728060645.819-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128471

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260705.0.bb => ctags_6.2.20260726.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260705.0.bb => ctags_6.2.20260726.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260705.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260726.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260705.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260726.0.bb
index fde3748a33..312d62ce1d 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260705.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260726.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "5437fa6249e95ec55a5f4944dac28f4f6e46c195"
+SRCREV = "d0e726cf667580bc5b3f6352d21029899686ae57"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


