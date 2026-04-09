Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E084EA3C4A
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:41 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129143.1775730875325142407
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rMXt6Cv5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730874; x=1807266874;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x3mU8AZMJLxmSStf85uOZ39uZiJCgdD3XSpLjIXtjkY=;
  b=rMXt6Cv5LzEpfPfQogx29b86ZmqPlvj61q4mx29HXw5ly8oVutGJ5YJc
   aifcUMCrMFYS5p0RWaDroBm30ytINotvOtCcYBR2X881m/rSIUc2myzXs
   4UoLy+BXz1kwh1f5rN5P+6DvEnrgv54Tp5SHKo7b7qmBQ28wBwtoMh2BZ
   PF5hnye+xLLy+QoQLWNSwDPUfyjbAOsWbF9aRIN0xObNxMSfVFn63sopk
   UklufEyhDpVZqHknXwk9//sVe9mrr88uMnMIpDkqTiK/SqTuAujLHD+kb
   zt5AaaJF4P3R0n077uIffRrBqn12lptnMX8Vu01RJK5BlOz6aFqeX4evJ
   w==;
X-CSE-ConnectionGUID: GZeUEQuTRjCJlyfj9VIyMw==
X-CSE-MsgGUID: ToU+gW1qTNKpL+CHnMhC0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="223865656"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="223865656"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:32 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E0618C006D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:33 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 95FAFC008B1
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 2C7C14045FC;
	Thu,  9 Apr 2026 10:34:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 35/37] spectre-meltdown-checker: upgrade 0.46 -> 26.26.0404682
Date: Thu,  9 Apr 2026 18:32:21 +0800
Message-ID: <20260409103223.1574-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126184

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ker_git.bb => spectre-meltdown-checker_26.26.0404682.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-security/spectre-meltdown-checker/{spectre-meltdown-checker_git.bb => spectre-meltdown-checker_26.26.0404682.bb} (91%)

diff --git a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_git.bb b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.26.0404682.bb
similarity index 91%
rename from meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_git.bb
rename to meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.26.0404682.bb
index e239770584..454e702e66 100644
--- a/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_git.bb
+++ b/meta-oe/recipes-security/spectre-meltdown-checker/spectre-meltdown-checker_26.26.0404682.bb
@@ -8,10 +8,8 @@ BUGTRACKER = "https://github.com/speed47/spectre-meltdown-checker/issues"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://spectre-meltdown-checker.sh;beginline=2;endline=2;md5=3ae5399e70af7be9b93f72568069e2f4"
 
-PV = "0.46+git"
-
-SRC_URI = "git://github.com/speed47/spectre-meltdown-checker;protocol=https;branch=master"
-SRCREV = "a20641fbad57f37da6093203484ca28769e5bb64"
+SRC_URI = "git://github.com/speed47/spectre-meltdown-checker;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "8a6f9d5d638c601d2a875669015a6cb217e40f49"
 
 # binutils: readelf,objdump might be used for deeper analysis
 # coreutils: dd with iflag=skip_bytes oflag=seek_bytes in some cases
-- 
2.43.0


