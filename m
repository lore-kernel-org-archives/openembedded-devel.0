Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9981112255
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:14:21 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7068.1775096051389554652
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HpKolygE;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096051; x=1806632051;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AYWcT2gggQ/ThktP4br/r8NfYeXvIokmlF4fZwiscE4=;
  b=HpKolygEASyXk0hMMubJ3uEPEmQMd2lyYfByS19gCGfZgE2ivuRP70bF
   s9fsQKWQW4us731Lni3Lse4+Wh2tPBHtYkkVpEYbhFdNiB+GGM6BVpHeg
   mriTzsAaSbm3OrJTKeszuryIUwy2iVeFksEaIkz2HIlPJhYs+RoIirC/3
   flgxKVar9zx9LnzRjDoVdVy7U5TCfrzZ1vgnGcyHmB9fb7KEpBRGpg50P
   qdUfyLiewS20IvUmBE+z6+dx001vPWLTzSq4OtyZb2p/rmIanMKfHU199
   ysz1Dts4XqqBTfk64y4EidLfOiJsSLaQwg9AoCH047jGYLEPViShkgKT8
   w==;
X-CSE-ConnectionGUID: PS8z8xQlSG61YWe51wDBdg==
X-CSE-MsgGUID: ehhg4J7fQhiynsofwTXIKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="214299088"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="214299088"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:14:09 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D4EAD446
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:09 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 849D11C4C181
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0FA591003741;
	Thu,  2 Apr 2026 02:14:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/39] ctags: upgrade 6.2.20260322.0 -> 6.2.20260329.0
Date: Thu,  2 Apr 2026 10:13:18 +0800
Message-ID: <20260402021355.1324-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125918

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260322.0.bb => ctags_6.2.20260329.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260322.0.bb => ctags_6.2.20260329.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260322.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260329.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260322.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260329.0.bb
index b44b00eca0..76bb5b77be 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260322.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260329.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "0c1b0f3dfa7ed5fddb4369c8abd0c463ea3665a8"
+SRCREV = "34659e2cb02e055c74e929c5bad291470a729570"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


