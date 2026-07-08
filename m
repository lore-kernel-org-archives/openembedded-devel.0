Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B8FC44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:41 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4906.1783503934081651491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sPtkxyhy;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503934; x=1815039934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E3m4w2VkwV256mU+hEhGD3keO+yGFGJidiQB5h8WHkY=;
  b=sPtkxyhyeLZCCMova+CKEzizSrVzfe76M8ED333cs5borBGVpqc4bR80
   w5Xc1u8o6uKkiSd4xBi0IicYzgRCM2kXuI7Zn2HXtbn+45yfRh9WgusCS
   2PoGE8AdvxSGCF/nOP7PUF3okOBDW7Vn9H2aXFMbTG2hIuAYuKBNSi2B0
   eEUMnwREmA4d+uK7Nr1gfJBcKxC3oQBb9uSH+ZuvfaMTgyUf9SWyvd6C2
   1u2fxOojfZ02XX3uvUj9FQxg9+XDUnu9rpg3+8jR1kAwaPgU43nVr7ycr
   riZQ5S6STmQDeFqbOtjcrcMzoiHXkgw9oxriV4NLK0xgdS0eeIDbaX4e4
   g==;
X-CSE-ConnectionGUID: lSMnMYosR4+bAEfcI5pEyQ==
X-CSE-MsgGUID: v46dDV/DRhuYVTJw4hLDWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246699866"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246699866"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 402A433CE
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:32 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EBBAD1807168
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 085A71801131;
	Wed,  8 Jul 2026 09:45:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/37] ndctl: upgrade v84 -> v85
Date: Wed,  8 Jul 2026 17:44:21 +0800
Message-ID: <20260708094508.2060-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128082

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-core/ndctl/{ndctl_v84.bb => ndctl_v85.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/ndctl/{ndctl_v84.bb => ndctl_v85.bb} (96%)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v84.bb b/meta-oe/recipes-core/ndctl/ndctl_v85.bb
similarity index 96%
rename from meta-oe/recipes-core/ndctl/ndctl_v84.bb
rename to meta-oe/recipes-core/ndctl/ndctl_v85.bb
index 582e90b96d..eb4fca0ef5 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v84.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v85.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74a614eac8b2657a4b8e6607421a0883"
 
 inherit meson pkgconfig bash-completion systemd
 
-SRCREV = "8ad90e54f0ff4f7291e7f21d44d769d10f24e2b6"
+SRCREV = "15e932c4e1318a9608ad9b799ad83a32a8b5970d"
 SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https;tag=${PV} \
            file://0001-include-libgen.h-for-basename.patch"
 
-- 
2.43.0


