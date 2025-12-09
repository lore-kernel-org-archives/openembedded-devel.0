Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701DBD3B7F4
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:30 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4119.1765274185780992236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bWBSoDlK;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274185; x=1796810185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Oo2thwfmMgQSf5dfu2pBHa4xGN1hKKUk00dt8Cavc80=;
  b=bWBSoDlKfWEpXibi7Vq8MXYq0Dnt4w4J6nI/zQqHcDckvrLEJ02khdC8
   3+O1IlQCQlwK4s6opRTzY3Mhm6HMjIHvXylNKK595CxRd8yNF9NfFSbxT
   Bd3hObVi/e6uoGYowqKbh3ZtpoxOitWKsJOys8Q/0oWRdZzENX8sRjcq8
   kefiKklkz59j5MiKwK5VmYMGwgUqbvSq0SEN83ByCWQ2XARZnb+Ky8b1e
   G+HcFIsnVCcqFa+WcP8Yma/2WPBIGRo598eCCwzkodnITx1Z5nGD8YhWv
   NNNJ+N4vQNmdoMckJEDmFgubw5IhsigOm41zRlDfe4PFhPJ2aUJW7ZJgu
   w==;
X-CSE-ConnectionGUID: ssC+zCEKQKaTKcDFFEOXzA==
X-CSE-MsgGUID: sbHJHejBSfSxnjSBlaFkbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221991882"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221991882"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:23 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id F3076C0056E
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:23 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id A8C19C0246A
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 2F80C20002B8;
	Tue,  9 Dec 2025 09:56:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/38] libbytesize: upgrade 2.11 -> 2.12
Date: Tue,  9 Dec 2025 17:55:21 +0800
Message-ID: <20251209095552.690-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122411

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- packit: Bump release only for daily Copr builds
- tests: Split locale tests into multiple test cases
- misc: Separate Ansible tasks into a different file
- misc: Add build and test dependecies for CentOS
- misc: Use --break-system-packages for pip on Debian
- misc: Do not use "with_items" when installing packages
- HACKING: Update directions for updating documentation
- Fix compilation with C23

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libbytesize/{libbytesize_2.11.bb => libbytesize_2.12.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libbytesize/{libbytesize_2.11.bb => libbytesize_2.12.bb} (90%)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.12.bb
similarity index 90%
rename from meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
rename to meta-oe/recipes-support/libbytesize/libbytesize_2.12.bb
index ef2a6c76fb..e9a48f941c 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.11.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.12.bb
@@ -7,8 +7,8 @@ SECTION = "devel/lib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
 
-SRCREV = "9da72b2732508b0ba0ceed27f5e50bc276ef31f2"
-SRC_URI = "git://github.com/storaged-project/libbytesize;branch=main;protocol=https"
+SRCREV = "518fd4a0a863e896675a7f5ef0164a36eb4d7b03"
+SRC_URI = "git://github.com/storaged-project/libbytesize;branch=main;protocol=https;tag=${PV}"
 
 inherit gettext autotools pkgconfig python3native
 
-- 
2.43.0


