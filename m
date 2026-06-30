Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B204C44502
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17223.1782811340767122617
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Q72GC8+e;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811341; x=1814347341;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hF17gqYm8VQ6Lx3bhKDvYJ5T2EE/EmqYOPygThEHYT8=;
  b=Q72GC8+eD9C2vk4EG79IrWN+j8i+cRiPNF2WznYqTc+ptOhuGZSCZR3d
   W34/o3a41WAd3ZU/K9sKozrzEkq0IlJPOpMeE5mWl2bviPBz/wkV8vztN
   utM2z1APWTk0CAROoA0rDfM0Orr3wuWpcC/Nxh+4ZGI0AnQhcqUp3gi7c
   YtRCaKc25z8SEI9QjkoKifQppNjNH61XGTvCpx345fah9glmhD2guqbMU
   olwxo3tT6FTfqZDF6uFt0ddn3UTFao6Hsi/Ia3xfSExbVA0qyOZLJ8GkN
   jEkOq2gIut1OkKbmiyCsFLYrqjuBaBhYOClTFg6zae0RaK44/PZxH9oQi
   A==;
X-CSE-ConnectionGUID: aKdZ98TUR3WW6X6pI8BS2w==
X-CSE-MsgGUID: XGqkOvptQYiV4RlM9wUkYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="233222217"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="233222217"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:19 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2E1A61002B94
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:19 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id DC12BC0181B
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id F20D682DDC0;
	Tue, 30 Jun 2026 09:22:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/37] haveged: upgrade 1.9.24 -> 1.9.26
Date: Tue, 30 Jun 2026 17:21:34 +0800
Message-ID: <20260630092206.322-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127948

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix initramfs switch-root failure
- Add haveged-initramfs.service for use inside the initramfs (without --no-command, without PrivateNetwork=true)
- Update dracut module to install the initramfs-specific service file
- Fix 100% CPU spin when --no-command is used

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../haveged/{haveged_1.9.24.bb => haveged_1.9.26.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.24.bb => haveged_1.9.26.bb} (94%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.24.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
similarity index 94%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.24.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
index 68c8d2bdb2..fbebb158ee 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.24.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "b52433d9234863050d52358f4a6cea86fbfb8e52"
+SRCREV = "c0edcf284f654321b7c5665fe38106f9321ceeb3"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https;tag=v${PV} \
 "
 
-- 
2.43.0


