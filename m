Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF29CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:48 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11263.1781686712526515305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ee0zXnsK;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686723; x=1813222723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=K6ZAnwfdFF4EHcwikroLnklQaJrOjT7PrG39GeXR4lI=;
  b=Ee0zXnsKj7x5TmxCPlq5tQjFGtZB5ivZtnHdpRaqrIkCcAlzIXeH6Q88
   MHv8NmQnQuZtSQQkgMwkLpdBecpqUGRuTDP/pVLeE4q7ZtMH0RyHeTQyo
   IqjNmWFGiTjM/7HaFMSu2O0LrjxgOvrJTRbLKTxl0IAr3lMKhc9P65Qs4
   +J2Q07GLOqcgRSeQvnkz03IvL0FzofXgfJClYa02qd/DNkbflQCfmB+7h
   0WySfifd7dc0jQfRDlf8Nmcrw+AbTJ/9y6ctGZfg0Id7J5OmJA9o856GD
   d9uoP9AfNneGIve5cR6JfmKheC5vL34kCV45STrgsZlx+t0qUax4kRqdd
   A==;
X-CSE-ConnectionGUID: SJ0CMhv5TgaKExpq/okJlQ==
X-CSE-MsgGUID: X44MJVF1R3qK701NJGnpPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="242543069"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="242543069"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:43 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E4A35820725
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:41 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id A2E101400618
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C78251000A47;
	Wed, 17 Jun 2026 08:58:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/17] spitools: upgrade 1.0.2 -> 1.1.0
Date: Wed, 17 Jun 2026 16:58:07 +0800
Message-ID: <20260617085807.542-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127654

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spitools/{spitools_git.bb => spitools_1.1.0.bb}          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/spitools/{spitools_git.bb => spitools_1.1.0.bb} (81%)

diff --git a/meta-oe/recipes-support/spitools/spitools_git.bb b/meta-oe/recipes-support/spitools/spitools_1.1.0.bb
similarity index 81%
rename from meta-oe/recipes-support/spitools/spitools_git.bb
rename to meta-oe/recipes-support/spitools/spitools_1.1.0.bb
index e313685d95..69f527a6eb 100644
--- a/meta-oe/recipes-support/spitools/spitools_git.bb
+++ b/meta-oe/recipes-support/spitools/spitools_1.1.0.bb
@@ -3,11 +3,10 @@ HOMEPAGE = "https://github.com/cpb-/spi-tools"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c16666ae6c159876a0ba63099614381"
 
-PV = "1.0.2"
-SRCREV = "1748e092425a4a0ff693aa347062a57fc1ffdd00"
+SRCREV = "a19dffe44fee857124a993598caae0c85894f914"
 
 
-SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/cpb-/spi-tools.git;protocol=https;branch=master;tag=${PV}"
 
 
 inherit autotools
-- 
2.43.0


