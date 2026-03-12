Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B89103E30E
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18516.1773312777717286697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RwUbsKjw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312776; x=1804848776;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lDjUXCwCFMvIqXtQLE1XmGnPsfRsxUWyS2EynlV5iMg=;
  b=RwUbsKjwF2bM3MKMAOFWSH0KQXbiZE2YdM/q62IFG3GeDckVjqac/c1G
   tWr3auaQ5NYWm1utrTIFIu+0qUp8ewHaqE5y/aEO14EhifxuG8TysMNoO
   Ts0hrhp9jXGP1rNp8RYMnqyfzpojKNRD0TPw+31qm1vKsiI5KDzT6UHpW
   N5jFy1YV8PDabmsSchNwZiPDiR/AWUBhgY0rzjoeFR7dqHM969P6zd4M/
   3DRH+IUicK7NtnjeBkGtMo54OPtelUBPytRszbedT/Db0pYQpKD93wDql
   7Wa95tYzKbrAm//QYx6QjVQgmQ6SZ8rX9SNf1Jt2x3BH1LSPKLOjMWI/f
   A==;
X-CSE-ConnectionGUID: v6PtKdjaTaurorxwnAiMWw==
X-CSE-MsgGUID: MIN9mhJMTu26RBtFwiqkvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211824329"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211824329"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:54 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3445F3FD2
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:56 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id DCFEF1003BF5
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0496D1801925;
	Thu, 12 Mar 2026 10:52:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 14/64] libcurses-perl: upgrade 1.45 -> 1.46
Date: Thu, 12 Mar 2026 18:51:30 +0800
Message-ID: <20260312105220.1856-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125114

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Add BUTTON5 constants: BUTTON5_RELEASED, BUTTON5_PRESSED, BUTTON5_CLICKED,
  BUTTON5_DOUBLE_CLICKED, and BUTTON5_TRIPLE_CLICKED.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libcurses-perl_1.45.bb => libcurses-perl_1.46.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcurses/{libcurses-perl_1.45.bb => libcurses-perl_1.46.bb} (92%)

diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.46.bb
similarity index 92%
rename from meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
rename to meta-perl/recipes-perl/libcurses/libcurses-perl_1.46.bb
index e6fc3c8300..18f62cefb2 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.46.bb
@@ -13,7 +13,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz \
            file://0001-testtyp.c-Use-proper-prototype-for-main-function.patch \
            "
 
-SRC_URI[sha256sum] = "84221e0013a2d64a0bae6a32bb44b1ae5734d2cb0465fb89af3e3abd6e05aeb2"
+SRC_URI[sha256sum] = "9631d6e3e2859c85913d8b8724f61fbebb9e932e9e50aa0493a4e0276660a3f9"
 
 S = "${UNPACKDIR}/Curses-${PV}"
 
-- 
2.43.0


