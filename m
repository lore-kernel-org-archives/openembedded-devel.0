Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77531CCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:20:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.10926.1760433600256738786
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AX6OzEk+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433601; x=1791969601;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ai5U4cdblwhK/1g6ccLoz1ID6PGegEDWRIPTM6e63uw=;
  b=AX6OzEk+BgPWos5JXIS09Xo8z3eBrp+ebuRUvg1AeJ8tJK/8MMlnEsiF
   AvN3Mx8UFpXYRa9tMkisXI+vR+bKIqdvqJ1L5xwBMveYGUQ2cgP6aCRTp
   8XjUzGxvUrJyBfhONh5YU71OH+TYkJUFYl7sKz3EotV9VLASUdIXXh+Qq
   7AOEYKISeE6xBD8u3o36kRVt75C4dP/tdGFNgI+Qlsg8mu0P3z7Ik3zHu
   pZ2fDjzceCeM7VDc932Cd77Ow1V8Ar65EGbWciRDO6VsHpi6wyx2vJnik
   tPGD/Xryyt1Wl3ic0ncZ0v7BISLxSXs13vdQmc+D0npE6U4NTMG1e3HP0
   w==;
X-CSE-ConnectionGUID: 30wl4bhuR0eLE4/ox8K+Ng==
X-CSE-MsgGUID: Wz80SgB0S1iTgzbO4ATAAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="215838935"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="215838935"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:59 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id A8F2AC00375
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:58 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 60BB2C00419
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C603B101BB76;
	Tue, 14 Oct 2025 09:19:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/44] ndctl: upgrade v82 -> v83
Date: Tue, 14 Oct 2025 17:18:57 +0800
Message-ID: <20251014091927.493-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120571

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-core/ndctl/{ndctl_v82.bb => ndctl_v83.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/ndctl/{ndctl_v82.bb => ndctl_v83.bb} (96%)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v82.bb b/meta-oe/recipes-core/ndctl/ndctl_v83.bb
similarity index 96%
rename from meta-oe/recipes-core/ndctl/ndctl_v82.bb
rename to meta-oe/recipes-core/ndctl/ndctl_v83.bb
index 2603217326..ed3c639369 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v82.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v83.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74a614eac8b2657a4b8e6607421a0883"
 
 inherit meson pkgconfig bash-completion systemd
 
-SRCREV = "74b9e411bf13e87df39a517d10143fafa7e2ea92"
+SRCREV = "4f7a1c63b3305c97013d3c46daa6c0f76feff10d"
 SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https;tag=${PV} \
            file://0001-include-libgen.h-for-basename.patch"
 
-- 
2.43.0


