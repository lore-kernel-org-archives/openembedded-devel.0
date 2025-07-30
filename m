Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B98FC87FD9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.31369.1753869305704228510
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QpT2u6xx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869306; x=1785405306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qQGI2RkHMtZS/czpi74oSaebVeBTWYakXNX4aZ7MZWE=;
  b=QpT2u6xx55yAcUzHeUmyYziYjm4emvurDPco5inkVvL9SrRU9yNyPH9v
   TB/AI7pz+8El7ucc+ZlSn5GON6kJGQTngm1xeK4hC8UVjD2AzuS8JFlwS
   zuhG1PuHNXb9f1rhZP0bCeiq//u0vj7/AsLh6ZkLus41gaM9As/OXr86Z
   qUmkgu91AjG+HIrgOxUgCCC7rTIxCzFofRoFiYeeWFKEb3x2z0zKJjFec
   zzFJRIzwyWFa3qfuhjA4wz+mDnUXyA444Tgn/ZxEI0Oc/kMJAaEfYgUa1
   cNseKZSxD7e9EWhEcPQzMEJ39rhPK9aGKn3fgeORJ84guc/b3fFD0BPkb
   Q==;
X-CSE-ConnectionGUID: n3Q4cUkQQQe8NLh0WEl+IA==
X-CSE-MsgGUID: c9dqsXgMTDua5szVnAwt7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="211191702"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="211191702"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:04 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 018B342A30F
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:04 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6717D1C00169
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6425A1A0078;
	Wed, 30 Jul 2025 17:55:00 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/40] bolt: upgrade 0.9.6 -> 0.9.10
Date: Wed, 30 Jul 2025 17:54:20 +0800
Message-ID: <20250730095456.695-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118770

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix bolt exits when opening an empty version file
- Fix failure on integration test due to the change of the latest pygobject
- Several CI improvements and fixes.
- Fixed memory leak in boltctl
- The unused codes were removed from daemon
- Fixed a NULL syspath variable causes SIGSEGV
- A new NHI for REMBRANDT.
- CI fixes.
- Don't install an empty DB directory.
- Fixed: Determine the string length before writing file.
- Fixed: Free on error to prevent resource leak.
- Add a 'nopcie' security level since some devices report 'nopcie' when Thunderbolt
  is disabled through BIOS setting.
- Markdown lint styling is used for documents.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/bolt/{bolt_0.9.6.bb => bolt_0.9.10.bb} (92%)

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb b/meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb
similarity index 92%
rename from meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
rename to meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb
index ec3cdcaa75..3d1686bcf6 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.6.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.10.bb
@@ -8,7 +8,7 @@ DEPENDS = "udev polkit dbus"
 REQUIRED_DISTRO_FEATURES = "polkit"
 
 SRC_URI = "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=https;branch=master"
-SRCREV = "f03c50b22ae3fda26711ddabd91e2c5dd8103478"
+SRCREV = "c0d4cb2f4399e86417907a37c0d8ef3bb9fb406f"
 
 
 CVE_PRODUCT = "freedesktop:bolt"
-- 
2.43.0


