Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7C4103E318
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18520.1773312784225832177
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pOi5igGi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312782; x=1804848782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QkHL+tTz2OTxMf1j7fWuZo3N95yvYIP4ZsdDV610PF4=;
  b=pOi5igGi26HkkKLORaUl09B2xbFsnEH8MpVGeKwUpM20thSHkKcJb+CE
   BQN1JREvw231aZ08Ld5JFspZ+A1oBW7265ksRAe5sOMgj9Nxq3V7uJVro
   xnWAqByycBhZVN8blZDsjGIVGvPTssgZCCSXs1bFLhzVfG6uhJ/Pa5qv0
   ABk/i4QTH1TieGDA9BnDn2P9tMmu/QVKJHGB3hVlfW/jUhVm4MvjS6W0b
   OBrg4MsKQWAR7gGIdCndpjun5RHTdcmCnjU46Fr0bvZYmOEctBuvO9zvA
   B8n0JQeqx5JjGrjCRiyeUiF01KWBSJWDvnbwNel8MEwJA4YBQ8ldhnaSZ
   Q==;
X-CSE-ConnectionGUID: PpycZA7BR+eFlz8KvgLa5w==
X-CSE-MsgGUID: um/DLNoFRv2h89K6/jDNGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="221636125"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="221636125"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:01 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BCE1A1C000B7
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:02 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 687651003BF5
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 77D7518029AF;
	Thu, 12 Mar 2026 10:52:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/64] libp11: upgrade 0.4.17 -> 0.4.18
Date: Thu, 12 Mar 2026 18:51:33 +0800
Message-ID: <20260312105220.1856-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125117

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libp11/{libp11_0.4.17.bb => libp11_0.4.18.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libp11/{libp11_0.4.17.bb => libp11_0.4.18.bb} (95%)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.17.bb b/meta-oe/recipes-support/libp11/libp11_0.4.18.bb
similarity index 95%
rename from meta-oe/recipes-support/libp11/libp11_0.4.17.bb
rename to meta-oe/recipes-support/libp11/libp11_0.4.18.bb
index 9bd44a2d23..950880c1f2 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.17.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.18.bb
@@ -11,7 +11,7 @@ DEPENDS = "libtool openssl"
 
 SRC_URI = "git://github.com/OpenSC/libp11.git;branch=master;protocol=https;tag=${BPN}-${PV}"
 
-SRCREV = "1ad1efdffc90df5dcd69822f3f593898acc1aa78"
+SRCREV = "52a437cd51fcfbaaa8b27d2c6f562e88fd015c0d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "libp11-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


