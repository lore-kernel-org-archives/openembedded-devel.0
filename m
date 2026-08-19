Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58003C5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:40 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3278.1787132135538950690
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dpK+bYWv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132139; x=1818668139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jABzV5Kk/mv7TTjFanoiv88ER6dUNSby7xlsKQHhg5g=;
  b=dpK+bYWv1IXNKLqXSUOBV0x3OMni/PSjQZhGt6UfLDSn3KgFhCbzurLe
   HZstKiVjTMd9f9KTVuXqIDZlO5wikcS0FmUNZ0UdHT17+u8SS/VsYCxuF
   SXbiRUhniCx+L5lFQHy7tbdl/NBZYhb2Xp6PtFTQFijciO11VtN8SBElj
   iIScOUbJ2pwo6Lgi7CUjRnT2mp1eywN5qxZnXQlz6VBbuvEqzKAEWnSNC
   +D4gNVp+ifHMHwoaxWvtRwCmyraDGqJANwrvCVFoxzxSGRX7KrY3FUKdf
   O7+3jtC4Ao0vaT2RH5MTCKOx9GHfuqu7KX1mCTUrZditAHY2oZDpyTuQZ
   A==;
X-CSE-ConnectionGUID: nHoxBpFpSZaKfHRVdqicWQ==
X-CSE-MsgGUID: IM7WuBe2R2WQaDy9GSywbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="255507771"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="255507771"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:37 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DD89D307E
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:33 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 90091C0219A
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 78A571801C20;
	Wed, 19 Aug 2026 09:35:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/70] htop: upgrade 3.5.2 -> 3.5.3
Date: Wed, 19 Aug 2026 17:34:12 +0800
Message-ID: <20260819093514.1101-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129278

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/htop/{htop_3.5.2.bb => htop_3.5.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/htop/{htop_3.5.2.bb => htop_3.5.3.bb} (95%)

diff --git a/meta-oe/recipes-support/htop/htop_3.5.2.bb b/meta-oe/recipes-support/htop/htop_3.5.3.bb
similarity index 95%
rename from meta-oe/recipes-support/htop/htop_3.5.2.bb
rename to meta-oe/recipes-support/htop/htop_3.5.3.bb
index 775e8e1d78..cf3d5db541 100644
--- a/meta-oe/recipes-support/htop/htop_3.5.2.bb
+++ b/meta-oe/recipes-support/htop/htop_3.5.3.bb
@@ -9,7 +9,7 @@ DEPENDS = "ncurses libnl"
 SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https;tag=${PV} \
            file://0001-configure.ac-Remove-usr-include-libnl3.patch \
 "
-SRCREV = "393b224603620e62a693628ac50b9f4e4424a851"
+SRCREV = "20882b8ef8271fb49ea0eb74bbfd484e9b0a11d8"
 
 
 inherit autotools pkgconfig
-- 
2.43.0


