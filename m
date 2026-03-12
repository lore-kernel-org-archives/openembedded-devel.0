Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71762103E30D
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:56 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18747.1773312771427331062
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bH3lt1My;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312769; x=1804848769;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bs2PnhfK46GqfvilH4SnmcYQpq+0IeyIYXt8Ti+dGE0=;
  b=bH3lt1My8u2z8l6XUZ9q8ZKgLifCWXkwN0fgzjA4UmS24aaNvSHpx9q+
   UD6NPkObwp4NRZcnx2eKUmF+EN4ra7ag8ksptLd6Dar41dgedRj+Fecew
   SJ2s8A9+XKHKMOn6dVBoIsHYdaqEi6nmTky/g/lyRscIMNVY09nt6d+1C
   Ceem0cF9BwVirvAqG3wABpOo/6rW4nnxueZDB4DMZgHr5/6DXGtoYoWcm
   qk9SjOSoO1l+lKX1+0F1PWK+6ghfdV/nA54hgrYItZaGWVPpbAdy8pzVG
   yaqA9luFhI1NU//ShRlg/m4tPZisgzePBm7Cb1eOZipsOvYm3uDNEfM+5
   Q==;
X-CSE-ConnectionGUID: 8byD7Iy9S8+rkdHZ4tAwyw==
X-CSE-MsgGUID: EZ7KavixSJ2hj1p0f3uUjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220950446"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220950446"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:48 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D825AC036B1
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:49 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 88C2CC00802
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8E36A18005B4;
	Thu, 12 Mar 2026 10:52:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 11/64] libcompress-raw-bzip2-perl: upgrade 2.217 -> 2.218
Date: Thu, 12 Mar 2026 18:51:27 +0800
Message-ID: <20260312105220.1856-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125111

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-bzip2-perl_2.217.bb => libcompress-raw-bzip2-perl_2.218.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-bzip2-perl_2.217.bb => libcompress-raw-bzip2-perl_2.218.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.217.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.218.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.217.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.218.bb
index ae2cdb7f59..9b2a5a689b 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.217.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.218.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=7b6eb3b7380815648e5
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "aa80f52473b8ca3368e8f83496fac1b2a25d27723506b94c4ea6c861fce961f8"
+SRC_URI[sha256sum] = "89153e6a2ebda52349493b074fa4b7549ff1f9053de7613c18a5e05c5b415fa8"
 
 DEPENDS += "bzip2"
 
-- 
2.43.0


