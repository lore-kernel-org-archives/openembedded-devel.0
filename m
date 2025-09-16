Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D480CAC5A3
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.15418.1758015722613435364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fse35NkZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015725; x=1789551725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ssov50ynI4CO8A/oEPy/kU0irjy8nZjKWRjAmk4yA7M=;
  b=fse35NkZwocwPhkDpFfTBKCogmDowmLZaYu6hilZe0ySnCZyCJQuCYeN
   YRhqGKgST5RtcTrKJ4Nr+7EbBKplnluAS3N4veHp28M5hb/yuQn2ZaSk9
   RRpqZAUf2y39iqA5YXVrBllHP6k9t8PNQYkxB1uToPF4LaASrXkwIYVwT
   4Oq7681MgzU+KsrqsTSnKTnF7DJJMz/bLJNkzb9n603mbKXaliGgOvHf5
   vYk/Up1x11ze0ad6lP1Mjtu4yJ6Py/toOKoNG6LwKov1KwWpSLe+wBdzP
   uHYGK3utV2/qeRxV8f9F8GR5m40hxmhkjZfiTAP2otOHwC6AEyzm8Sbb8
   g==;
X-CSE-ConnectionGUID: uOtOLNKcRN2btk8SPg7JHg==
X-CSE-MsgGUID: g5NOFBWjSSys/bknMdq73Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="212969200"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="212969200"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:04 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3C4781002B8F
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E7E3518000DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 667DD1400ADF;
	Tue, 16 Sep 2025 09:42:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9A4F31A0096;
	Tue, 16 Sep 2025 17:41:58 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/42] libssh: upgrade 0.11.2 -> 0.11.3
Date: Tue, 16 Sep 2025 17:41:21 +0800
Message-ID: <20250916094152.1479-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119429

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libssh/{libssh_0.11.2.bb => libssh_0.11.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.2.bb => libssh_0.11.3.bb} (96%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.2.bb b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
similarity index 96%
rename from meta-oe/recipes-support/libssh/libssh_0.11.2.bb
rename to meta-oe/recipes-support/libssh/libssh_0.11.3.bb
index b50177ab9d..bfeeccdad4 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.2.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
 
-SRCREV = "dff6c0821ed54f6fbf5b755af43f54cbb723b1b1"
+SRCREV = "301d0e16dfa8a5cac1cff956b6880ca90eb82864"
 
 
 inherit cmake ptest
-- 
2.43.0


