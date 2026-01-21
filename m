Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D148C44517
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:32:51 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9537.1768995163076870115
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:32:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k6ePyGv2;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995163; x=1800531163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pcMCkQmywguzA00M+aYT3jlEZjKKXrRUD65OLFbglMg=;
  b=k6ePyGv2e3sh9Mps1Q5pXtH6viICcYTWSNq5L8V9XLCXz/SGl1rKvkeM
   uVCClhzKqg94WzcLuNVCmTqg/wPUdcwJkYv9g9V+tSyOdvkq4jz9qK07r
   /xs5ikEO25q8+GoRWlT0/Jq3smmI1XM4JdZa9KPG9YGXyDdUmWL8iycKE
   KusVw+IjgFmvhxpBVGWqXAKbf+9p+Rc7WM0ycZ1b62WlAbwBhQQIBnWwu
   3FFQQEK03pdvToX1IsHga42nGwkpHAe/Sd/t7DdjpHUwxfcqPUZyPKgtc
   dm/dOJSAxh/QMpfHKzKuiOzEY+fNSAqN2zhcxMJhwC/87yQx/dxBD67BN
   g==;
X-CSE-ConnectionGUID: 02cv1PZ6TaaS1E1GGvtKWg==
X-CSE-MsgGUID: kKE0rYWZSXeO9jBtHoEwAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="215159536"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="215159536"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:32:41 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id A73F91000343
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:41 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 5D2471005943
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id BE02F140486A;
	Wed, 21 Jan 2026 11:32:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/30] ctags: upgrade 6.2.20260111.0 -> 6.2.20260118.0
Date: Wed, 21 Jan 2026 19:29:14 +0800
Message-ID: <20260121112921.857-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123714

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260111.0.bb => ctags_6.2.20260118.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260111.0.bb => ctags_6.2.20260118.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260111.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260118.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260111.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260118.0.bb
index 5f6f550829..fa8d06120c 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260111.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260118.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "b11e39a7a89dc0b556e843db5aa34d0198066b9d"
+SRCREV = "a5b50997ee99b74f3806a2aeeae0d32463a5ba39"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


