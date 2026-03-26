Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE3810A1E9F
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45646.1774526239546421577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cO/x8TQy;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526239; x=1806062239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QqEkklI5jrWr3BHT6esqyAUFyQZG5nuWbi/cUjNz+pw=;
  b=cO/x8TQyXkr4qEE48upy6IbK0Y199w+lw19XgRd2VKHBI9yNvYf6SDCx
   T/oglJzBAe1PRXZjJvkeyEF1HRTAzQkjz0Um6+HB2nvdLYFYeg91CiqYJ
   QMZn2vgPd0qjxzRH2Qz9DoiWcQ/k4ebicjVM138IjLhtKoLDRtooX+OkF
   vmoCZKrT2qox+WpusyqQ75hcJgWZxvoSSd2oYsTlSEU0iFxz5IHigJixR
   J94i2On8pSiXpUoSzbUCSki7gaCyNXAF++rQ63NrpWH90+5QBYrOnDIXr
   wQDgkPv/XGBxOWxDq6CmZhL41wQwKmgfMnppZP6s0iRtRPLJg1pBcmXyl
   A==;
X-CSE-ConnectionGUID: Z0Sd7/9aTy6lHc38/c5TKQ==
X-CSE-MsgGUID: wzqH4yrMS3CPVUJKI82IQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222647276"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="222647276"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:17 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 00C341002B82
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:18 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id AF3D514003CF
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 49C0B1807148;
	Thu, 26 Mar 2026 11:57:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/63] ndctl: upgrade v83 -> v84
Date: Thu, 26 Mar 2026 19:55:53 +0800
Message-ID: <20260326115634.1199-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125678

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-core/ndctl/{ndctl_v83.bb => ndctl_v84.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/ndctl/{ndctl_v83.bb => ndctl_v84.bb} (96%)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v83.bb b/meta-oe/recipes-core/ndctl/ndctl_v84.bb
similarity index 96%
rename from meta-oe/recipes-core/ndctl/ndctl_v83.bb
rename to meta-oe/recipes-core/ndctl/ndctl_v84.bb
index ed3c639369..582e90b96d 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v83.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v84.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74a614eac8b2657a4b8e6607421a0883"
 
 inherit meson pkgconfig bash-completion systemd
 
-SRCREV = "4f7a1c63b3305c97013d3c46daa6c0f76feff10d"
+SRCREV = "8ad90e54f0ff4f7291e7f21d44d769d10f24e2b6"
 SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https;tag=${PV} \
            file://0001-include-libgen.h-for-basename.patch"
 
-- 
2.43.0


