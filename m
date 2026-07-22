Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E80C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:49 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44780.1784715823109653632
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XxTiO0YC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715823; x=1816251823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RrIAMd1JCmQMxfjymKzGLxj6ZoUP/FaBqqUYE+/IA7o=;
  b=XxTiO0YCwY5O2KY6yLxGH/7ISHZztXmq360wb3x9+Srw2IOE2mXYfLFK
   3QnwARV8YlZVWJIFPTgLcjQ55Jl381KN40OAuT85gaUvcSxcqjzU0CyvO
   CTF12CCxsLOLFOB3A+TtrxzjgdXRs0IzVNx22Ykspp1sP5iqKuraFnBLJ
   WuYrx+1Kx8NYeafdloh3innzRxsxdoCObFN7QhIYKhT+bH6kMSygZXIv9
   mFqf30981CbJ7KbaSagAG1XwqnCpjP/qGB+MNyXZwNsD4dgAjl7lgyf0Q
   4G7/qyEveJOUmyUDmfkv818wTusW7JJ6rLVTkKIulRBBbiZn8409FKuY2
   Q==;
X-CSE-ConnectionGUID: esIs7SDeRceQT+5TfDPFeA==
X-CSE-MsgGUID: hVkw2YlITbKu2NrkAlopPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="248228210"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="248228210"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:41 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 634F5C00227
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:41 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 197B18D29EE
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 3805D4064B2;
	Wed, 22 Jul 2026 10:23:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 08/37] libwacom: upgrade 2.19.0 -> 2.19.1
Date: Wed, 22 Jul 2026 18:22:51 +0800
Message-ID: <20260722102320.1019-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128378

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Use g_strv_builder_add() instead of g_strv_builder_take()
- Revert "Add support for Lenovo Yoga 9 2-in-1 14IPH11"
- test: add libc.so.6.1 as libc SONAME
- Add support for Lenovo Yoga 9 2-in-1 14IPH11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libwacom/{libwacom_2.19.0.bb => libwacom_2.19.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libwacom/{libwacom_2.19.0.bb => libwacom_2.19.1.bb} (93%)

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_2.19.0.bb b/meta-gnome/recipes-support/libwacom/libwacom_2.19.1.bb
similarity index 93%
rename from meta-gnome/recipes-support/libwacom/libwacom_2.19.0.bb
rename to meta-gnome/recipes-support/libwacom/libwacom_2.19.1.bb
index 853b035805..4342f98a35 100644
--- a/meta-gnome/recipes-support/libwacom/libwacom_2.19.0.bb
+++ b/meta-gnome/recipes-support/libwacom/libwacom_2.19.1.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
 
 SRC_URI = "git://github.com/linuxwacom/libwacom.git;branch=master;protocol=https;tag=${BP}"
-SRCREV = "b697d5a70f0e4dd4c18512b38911eebba33a4558"
+SRCREV = "8d904ebbbf879adacb8d59f7dde06eee2ed6ee80"
 
 DEPENDS = " \
     libxml2-native \
-- 
2.43.0


