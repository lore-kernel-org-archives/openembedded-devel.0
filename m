Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80281C624D7
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:18 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9374.1788344949399882812
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mb7Z7qxC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344949; x=1819880949;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7S+5u1LWDmp7oxsGGdCwHs/Bma93dOhDx33s/XFXmZU=;
  b=mb7Z7qxC02LyOAafWe/H5Vx4vGrVk+ZEMgQqtFKxsmoO36Qna9ErW8zB
   BmlpeBtgIEyc+P0EukkDsOmSuk97n/Hws+iIlQ0wtB/P8J+SzX0wgzIYu
   Hz4v7Te8YqktE6Z43Msa6a64b5+bFyDGEP28yLQvM+0PGlkPh4zLHJARQ
   CXqWc+PnpGoJ+ho5owZaqt7Loj2X8qATXUzxyIXN53LFF49zBIGyW/fWN
   Zsbtybsn6h505NDgd7lP7QpFyfhW53SLWqtGyxo+AfE6gJ23Cb14PAR1a
   52F356Pi3KVZLQPIF5WCQfaYQj0lSq4tnOqPspcHMG3wAWS2o879q4zRn
   Q==;
X-CSE-ConnectionGUID: 2RsaBF28Qhi6Y02qpyKlZg==
X-CSE-MsgGUID: cV3AdypGT5Sog0CnhS2Ykg==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="257286639"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="257286639"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:07 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BA2BA10000D7
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:07 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 6CD20C013F3
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 82EC92000770;
	Wed,  2 Sep 2026 10:29:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/34] feh: upgrade 3.12.2 -> 3.12.4
Date: Wed,  2 Sep 2026 18:28:28 +0800
Message-ID: <20260902102900.1296-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129661

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.12.2.bb => feh_3.12.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.12.2.bb => feh_3.12.4.bb} (88%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.12.2.bb b/meta-oe/recipes-graphics/feh/feh_3.12.4.bb
similarity index 88%
rename from meta-oe/recipes-graphics/feh/feh_3.12.2.bb
rename to meta-oe/recipes-graphics/feh/feh_3.12.4.bb
index a330c733d5..4df5a53300 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.12.2.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.12.4.bb
@@ -9,7 +9,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "7ce358b18a7f37bcc97a09b4efd89fdadd54cd8e7032db345f61e66dd04b1c3f"
+SRC_URI[sha256sum] = "97e89bb2cf5ada41e8c8e916ea4d7d64c51faaae4847f00fcc088fa06e1b5ca1"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.43.0


