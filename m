Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F93CA100C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8053.1756890210808345918
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GcUC5VLQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890211; x=1788426211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eFeSdGPdL9kfv1hLjwYdbGhT3q5D6X961W3K2selM90=;
  b=GcUC5VLQQQHJ506eGLuvD3yFcy/bpY1evo5FkptJQW/iqJ5Pw9LIgy7C
   eFHDMH9CfNxTskFaycbDzridOnuoJgdOOQPyg5aOJb+o8Hz4+B6mFfL5t
   TpcaykBSfmPet5o4d/lmLzNHXNQGJrHBeui1aHIKfcd+kyGpw9CE2I8We
   eSKo9Ztc3asyrspzxaincyqx0V4cpKWhgm5G3y3e03WraMAVf4qj8LBeT
   OqrhWanBKlwHzVstwAzmNsKrNiChJ2TfJMp/cFGso3DfX6xvcc0OEuHQe
   4pm95uJhGiQlzYdgUzEpi8ObGWcopHwa2fnSCWthVEYbUxn/dbF/iMP0X
   A==;
X-CSE-ConnectionGUID: PXcRntbSTjmFyWDehTfDWw==
X-CSE-MsgGUID: wkMdHbgNSSCINbZh+fL/Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211455892"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211455892"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:31 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 49651820710
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:30 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 07293182FD7D
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 050C91003105
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 08C031A0071;
	Wed,  3 Sep 2025 17:03:24 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 12/56] libdex: upgrade 0.10.1 -> 1.0.0
Date: Wed,  3 Sep 2025 17:02:33 +0800
Message-ID: <20250903090317.2002-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119205

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/libdex/{libdex_0.10.1.bb => libdex_1.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libdex/{libdex_0.10.1.bb => libdex_1.0.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/libdex/libdex_0.10.1.bb b/meta-gnome/recipes-gnome/libdex/libdex_1.0.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/libdex/libdex_0.10.1.bb
rename to meta-gnome/recipes-gnome/libdex/libdex_1.0.0.bb
index 3b83273272..7d7ae2fa2b 100644
--- a/meta-gnome/recipes-gnome/libdex/libdex_0.10.1.bb
+++ b/meta-gnome/recipes-gnome/libdex/libdex_1.0.0.bb
@@ -11,7 +11,7 @@ DEPENDS:append:libc-musl = " libucontext"
 
 LDFLAGS:append:libc-musl = " -lucontext"
 
-SRC_URI[archive.sha256sum] = "7472e88090db2b228307505edeba4483e872681340cb0404ae64ac3da5bed0a6"
+SRC_URI[archive.sha256sum] = "7b8f5c5db3796e14e12e10422e2356766ba830b92815fee70bbc867b5b207f5d"
 
 PACKAGECONFIG ?= ""
 EXTRA_OEMESON += "-Dintrospection=enabled -Dvapi=false"
-- 
2.43.0


