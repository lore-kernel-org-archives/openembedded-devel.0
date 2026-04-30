Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D3DCD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17426.1777546175236477107
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RgEeSjNe;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546175; x=1809082175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oPhEChYC0h79SMGRNeVhpy1rI0h9cRk0lPY7C4h3bew=;
  b=RgEeSjNeKenGb3Inuq+lr4buK2j1VRp7t5FpfTHSfOVpIJ4qyaoUnLn4
   GB0ypoh2A+HI1GvWFGRuuqlsfNoSseF0o6u+UU2pX5p44DTGUAk8WuiIH
   IBRZy5GMiDAiPu5TRfM6SrLG/ohhD4QJ0idCP1ZNsy51jp69Egb4VCk7R
   0PDo+r9GTM31M+eVfjcXjPCbFPTaO4Httua8kUxvu3vINFvTvjNk/oaBX
   fzcQ8n2TLh4/Lzs6ydg2aYaHbatxVkgD4If3eAuIeh2Hsfnd3kPupJGIp
   tqnl539IDvlr4DLA5TV9hu/ST1qK1RBez39y6OwVIF6yWThu+6BTqpPOk
   A==;
X-CSE-ConnectionGUID: GBaIwptzRoKs1QZvRe+maA==
X-CSE-MsgGUID: GpZ8H0OTTE2KdCyklABE/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238566065"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238566065"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:33 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6C4B01C00093
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:33 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 219D61000092
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 94217180113F;
	Thu, 30 Apr 2026 10:49:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/64] bubblewrap: upgrade 0.11.1 -> 0.11.2
Date: Thu, 30 Apr 2026 18:48:22 +0800
Message-ID: <20260430104924.1106-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126673

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- bug fix: CVE-2026-41163
- enhancement : New build option -Dsupport_setuid, which if set to false (which
  is the default) disables the support for setuid.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bubblewrap/{bubblewrap_0.11.1.bb => bubblewrap_0.11.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/bubblewrap/{bubblewrap_0.11.1.bb => bubblewrap_0.11.2.bb} (90%)

diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.1.bb b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb
similarity index 90%
rename from meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.1.bb
rename to meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb
index 0db94b40fa..7e63435e90 100644
--- a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.1.bb
+++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.11.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "libcap"
 SRC_URI = " \
     https://github.com/containers/${BPN}/releases/download/v${PV}/${BP}.tar.xz \
 "
-SRC_URI[sha256sum] = "c1b7455a1283b1295879a46d5f001dfd088c0bb0f238abb5e128b3583a246f71"
+SRC_URI[sha256sum] = "69abc30005d2186baf7737feacd8da35633b93cf5af38838ecff17c5f8e924f6"
 
 inherit meson bash-completion github-releases manpages pkgconfig
 
-- 
2.43.0


