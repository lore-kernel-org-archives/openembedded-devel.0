Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7926ACCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:15:22 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.27233.1761696920008398612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Fe1QQzfh;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696920; x=1793232920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yBU42DSvqoNhU6AawIAexJoSjNDRphPBMnVbPHoYgwc=;
  b=Fe1QQzfheP0bS0Yygk0XP5Jtz8v1JEJyfXN86z5kCQysnJhqGWkweJM/
   H/eZKECPQm2GSJ8Z8TD0q3qN1vSs7mF5iYVg5IYeDtWhzMbdrlpF20kIg
   Bg3v14ukP30ekc+6xAgPglpIDsKsqJ8JfW5hHuChJLMctfhKsL5x1NhUp
   10ff7ixSCfmFhResF0NKKCZRDDBGegZLPokGqoNEREnVbAIXF9gYt9DFL
   G4S9XgX4tunMCqiUZMqt/GJYBv4XePtRmcvW2yMZDTQRgrwsdBPyWquVS
   XphJ4jxgButxsur5HmJNyuZHnII0Dd1T30/4EIxOymjDx0RAnc4SRHN67
   w==;
X-CSE-ConnectionGUID: SfvCczecQyGLKggEk1sdJQ==
X-CSE-MsgGUID: 8GR25jFiTt61ppoILYvt5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="221094176"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="221094176"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:18 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 24E451C1C72F
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:18 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id CCA43C02F1C
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 104D182C0F2;
	Wed, 29 Oct 2025 00:15:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/32] ctags: upgrade 6.2.20251019.0 -> 6.2.20251026.0
Date: Wed, 29 Oct 2025 08:14:35 +0800
Message-ID: <20251029001505.528-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121108

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20251019.0.bb => ctags_6.2.20251026.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20251019.0.bb => ctags_6.2.20251026.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20251019.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251026.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20251019.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20251026.0.bb
index bf94f00d23..f63498bb17 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20251019.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251026.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "940751c4c0540d40af90a33e81467746f552b212"
+SRCREV = "3ce289e1fb58d51098acaade2327807ede3eaace"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


