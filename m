Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F132CEFD21E
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:37:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41948.1772012269769812347
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rSOHYya8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012270; x=1803548270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pY9i61NWa9mVcN4/9qm9+on9zrwbNIzkzcXzZYgh05w=;
  b=rSOHYya8DNE8vB9mf9EvGu9617FLSJcHwvxEiV+QExeA2nuQdruM1dLL
   X0j32vaDx/SiPt+KMgmDD5NM9MRITyj80mc+ECJd3VwMarhg3we9CtsE3
   8WFa5kM0Orzy84qudmus4jtM4UJxdDOe0WcVK4qpOP+yj8lnlZVBT9Gj3
   D6k2q4hXF2R17CRWUUyIsvWRkTeI8n4hWNgm1ZuW5hx2yZkNbyebCFJ9h
   jrRqRWLLtjlBdZ/QMxIsrEZXchakSxfHYxTZty4sthJk3Z3jbBbX15qUr
   sy8UtReFTKGQR4BsKUM2z68IxeYtUC5jSwKQIbGHFYnMuBuSC2Yef5HJ+
   w==;
X-CSE-ConnectionGUID: FwRok821ThWVGsbq+X4DCg==
X-CSE-MsgGUID: 3KCELdKZQxOkSuc/8lNBkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="230998288"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="230998288"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id CF31D100036A
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:47 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6E0C51801FF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 7F50A101BB7D;
	Wed, 25 Feb 2026 09:37:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/33] ctags: upgrade 6.2.20260125.0 -> 6.2.20260222.0
Date: Wed, 25 Feb 2026 17:37:01 +0800
Message-ID: <20260225093727.1284-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124619

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260125.0.bb => ctags_6.2.20260222.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260125.0.bb => ctags_6.2.20260222.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260125.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260222.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260125.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260222.0.bb
index eb36e886cc..5dafe54062 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260125.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260222.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "2046889979ed8e741de2bbe97f73da4e9cef2196"
+SRCREV = "b4fdb901fc4930eebcf06ef72bfd67cec606eb4c"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


