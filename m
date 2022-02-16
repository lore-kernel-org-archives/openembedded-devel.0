Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF24C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 02:17:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.6916.1644977828231464371
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 18:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aVZ2yFxE;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644977826; i=@fujitsu.com;
	bh=h9PCQc9hfgQcvmYU2CQ7OQ/PLHa6wq/iigDcaiqpVqo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=aVZ2yFxEOvNHut2ItNme1byoQERV5hLZSoXyWRXfyw/F652QMVM77UcPKPazx02Gf
	 JHYR2aQuEqKp0qzKpEhxWrSjxAYugnLU0yKDHmOM2IbeA0GOMnsqIrzxvXcppQnCLE
	 0+vpF6nMCnRHSkVeVLyxzMbJxj4ildWAwrUw5qAWiCxVqARL0+5HSWr9WbBq6pxbD+
	 wbcxml30ikwXwlBfPsWtzDxPyKkwtM66cx0CHv9qyrFcPWQN8W7St2YfCX0yQ0hi3n
	 d9CtqAUiSZ6CrO2c1cKzzcgSQNuIvf62JEvGl01ZwFrOgH5H30kE8kvd6Hq9Fz+raa
	 wyAkGZqNTZDjQ==
Received: from [100.115.37.210] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 97/6B-14616-2AE5C026;
 Wed, 16 Feb 2022 02:17:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8MxSXdhHE+
  Swdl5+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bai/sYCxq4K87/ncTSwPies4uRi0NI4Amj
  xNzb/1ggnAtMEtu37IByTjBK9L8/w9bFyMnBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICDxP+r1xhBbBYBVYllm8+CxXkFHCVmbjwCZksIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrROqkoMz2jJDcxM0fX0MB
  A19DQVNfYQtfI0EgvsUo3US+1VLc8tbhEF8gtL9ZLLS7WK67MTc5J0ctLLdnECAzMlGK1KzsY
  96z6qXeIUZKDSUmUt+0Gd5IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5vUTxJQoJFqempFWmZO
  cAogUlLcPAoifC+DwFK8xYXJOYWZ6ZDpE4xKkqJ88bGAiUEQBIZpXlwbbDIvMQoKyXMy8jAwC
  DEU5BalJtZgir/ilGcg1FJmPdFDNAUnsy8Erjpr4AWMwEtVmzkAllckoiQkmpgUvvRtOdLzZ7
  NXZ8v9ekod9St3WjqoTYleC9r40w+jfKo+Ya5ig80Ja7M/PfykdTvp9xWuZx6VTuq3ujaV/+7
  F6e4NTt97n8GwfoktV071NfVr02fmhF4XSKyJ6L2y+ZLQXphdXsEsuYYVWTxXN0Wl75JRaydr
  22/Ua6Hr458wU3z2NPpTOfivzqpRsrs6Dly4c/XnWdvqE2Kab72uf1qzPPCdl42N+VEt2/PVd
  afDNi2Ojmva/m69TI2yQaMx27O3lBwLcFt6u5Xy7L3sztPur3K7Hms6vOyTUxnV++46iymFR+
  qfHuZlHJ8i+XXGYo72OcmFEj5HzO2ljr7QfjGpfxJVgJurg/uvK6bMidKiaU4I9FQi7moOBEA
  St5wWkcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1644977825!26828!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22174 invoked from network); 16 Feb 2022 02:17:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Feb 2022 02:17:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 6BEA2100450
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 02:17:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5EFCF100445
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 02:17:05 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 16 Feb 2022 02:16:43 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gjs: upgrade 1.70.0 -> 1.70.1
Date: Wed, 16 Feb 2022 10:16:34 +0800
Message-ID: <1644977794-8006-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 02:17:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95327

Changelog:
=========
- Build and crash fixes backported from the development branch.
- Closed bugs and merge requests:
  * Handle optional out parameters in callbacks
  * Link fails on Debian armel|mipsel|powerpc: needs more -latomic
  * gjs/jsapi-util.cpp: fix build on gcc-12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.70.0.bb => gjs_1.70.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.70.0.bb => gjs_1.70.1.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.70.1.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.70.1.bb
index af4d7f6cac..90ea140448 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.70.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.70.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "mozjs-78 gtk4"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even pkgconfig
 
-SRC_URI[archive.sha256sum] = "4b0629341a318a02374e113ab97f9a9f3325423269fc1e0b043a5ffb01861c5f"
+SRC_URI[archive.sha256sum] = "bbdc0eec7cf25fbc534769f6a1fb2c7a18e17b871efdb0ca58e9abf08b28003f"
 SRC_URI += " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.patch \
-- 
2.25.1


