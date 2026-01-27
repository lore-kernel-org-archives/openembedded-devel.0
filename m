Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1692AD2D8C8
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:43:58 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6874.1769507031140417230
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jP6WRyQA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769507029; x=1801043029;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J+lv07Oe98T2McBg9/Pi2xiCc+5hALZBr/GboIHcQ+0=;
  b=jP6WRyQAHUlAfOKt1Y0JJ+fxNcJTD+kp4PIihkpa5+4WuvA7R1f/qYwK
   2ouSYdVg9Ci2sXhpnE9B5uonmvYbGcOupFNhVChu9Ym9mA3rbBIwtINCO
   xKYa4IMbpwsQRe0FErklzfDKy1fxpdE6sWa2ZQcao0+9t+YrPyCmAbdBx
   ub+wrPU0LdoS1Gai2rn8KSprucAF2jOpEEdceIZvO+X1/gQcFy8YMPzls
   s407Gn1vnYpvGZX82KGqKiiFrchUPA7AW3fCNPNhISf3uktAjGvWktC/X
   Z7sOBsRVaRA96m50OQBMDDxhxsweQDtvUBCG0wr9V2V7NQx0debdffN9z
   A==;
X-CSE-ConnectionGUID: uOo5976ER02f0meCNpGtwA==
X-CSE-MsgGUID: gcFmZpXNR+CyrcENkLK/lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="226667765"
X-IronPort-AV: E=Sophos;i="6.21,256,1763391600"; 
   d="scan'208";a="226667765"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 18:43:47 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 666851C1C71C
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:49 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 209378D205B
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 7499020000D2;
	Tue, 27 Jan 2026 09:43:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/25] ctags: upgrade 6.2.20260118.0 -> 6.2.20260125.0
Date: Tue, 27 Jan 2026 17:43:16 +0800
Message-ID: <20260127094339.1081-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260127094339.1081-1-wangmy@fujitsu.com>
References: <20260127094339.1081-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 09:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123914

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260118.0.bb => ctags_6.2.20260125.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260118.0.bb => ctags_6.2.20260125.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260118.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260125.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260118.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260125.0.bb
index fa8d06120c..eb36e886cc 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260118.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260125.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "a5b50997ee99b74f3806a2aeeae0d32463a5ba39"
+SRCREV = "2046889979ed8e741de2bbe97f73da4e9cef2196"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


