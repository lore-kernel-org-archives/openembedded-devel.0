Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2652ECCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:44:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2919.1762386273494386861
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DN2+eqSc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386273; x=1793922273;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EeK/O29kpsTg2t0201ExVNeoHLeeYjGnom2v0w45NEk=;
  b=DN2+eqScGgeFcn9nvPtoqrenvWKjyjbqHCj6eQgu/NYYpBfuUiI01oCA
   NiETmkvivEXbt25GakQDptJ53+8/PgkFO/VjrqGXuNT2/5411GijKVeI9
   ikq9hUsi301/9CPS50GbWPVj92IeSMfW6sVtlzHO1XaWK2lU2wO/HvmCg
   5WoN1oKQSalJug3Tkq17I7EXDmdjX3iUg+NznNZpg+8Pe5u+V5km3tl2p
   awkq/ugQ576QlVV8C0wpw341D7pqHKyoz7Qix129bJssmQjVx61R1JxPF
   otWGKbXhCc8vInuR7rLzRLKlOwOxpbr8JDawwHt4TzhxfJy83iJKOHgiS
   A==;
X-CSE-ConnectionGUID: NIqwv0ZRREKsIeSI2qD7bg==
X-CSE-MsgGUID: twgSG+VYQVmyZmOAhNHdkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="217612659"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="217612659"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:44:32 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id D7E831002BB7
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:31 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8A52FC011BA
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 18A141000357;
	Wed,  5 Nov 2025 23:44:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/12] tuna: upgrade 0.19 -> 0.20
Date: Thu,  6 Nov 2025 07:44:02 +0800
Message-ID: <20251105234402.423-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234402.423-1-wangmy@fujitsu.com>
References: <20251105234402.423-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 23:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121351

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/tuna/{tuna_0.19.bb => tuna_0.20.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/tuna/{tuna_0.19.bb => tuna_0.20.bb} (91%)

diff --git a/meta-python/recipes-extended/tuna/tuna_0.19.bb b/meta-python/recipes-extended/tuna/tuna_0.20.bb
similarity index 91%
rename from meta-python/recipes-extended/tuna/tuna_0.19.bb
rename to meta-python/recipes-extended/tuna/tuna_0.20.bb
index 643e3a09ff..c647adbd35 100644
--- a/meta-python/recipes-extended/tuna/tuna_0.19.bb
+++ b/meta-python/recipes-extended/tuna/tuna_0.20.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171d
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/tuna/tuna.git;branch=main"
 
-SRCREV = "b972b8ce386c29bcbcd45029a617db3db9e5b6ca"
+SRCREV = "596d92cac33e64ec9b0176401395e6a4abc2266a"
 
 
 RDEPENDS:${PN} += " \
-- 
2.43.0


