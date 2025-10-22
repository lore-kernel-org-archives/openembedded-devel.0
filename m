Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42D8CCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:19 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.4833.1761099790357281416
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FpvIAzu+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099790; x=1792635790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3ebiUMK1SJoGLRY5Fd4Jld59R6m0MBw0l2M2BKaaP4s=;
  b=FpvIAzu+S+2RCkTiM+s6K0nZPv97yi7w/jiChcrpiOBNNCSn6AdMM0qI
   Ferw/osrU0CRThpxtHsi/PTJc5Gt3FnYwGrEL8GYRtEZUR5g0SJx1r6H1
   wUnPxoiSkAm8cjZIq9rcrFys1D+/HYZIpnUYDMFmsdcI65MTh7+0rCQ0R
   uRUdIhklvkJSQa/qgNZ3rVOkeSnD3IOg85mZPvObS2sUuue2Kj9+CtUSF
   7vRMHNoXjKqaerxo1VtkqmI1lyg766wXqFyDWrhVlgfVIS5+EOXU2c+GO
   iUXDPUdjzQGOHJS/0/V003kQDaVBe/DykeWSYnKrBStBug1V98wxtonI6
   Q==;
X-CSE-ConnectionGUID: hvBCEPtTSOu3KQjDv00amw==
X-CSE-MsgGUID: MGM09raMRHiziIseAcqlxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="204094682"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="204094682"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:09 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id D9C211002BBE
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:08 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 8F0318D205C
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DACAD82C0DB;
	Wed, 22 Oct 2025 02:23:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/29] python3-humanize: upgrade 4.13.0 -> 4.14.0
Date: Wed, 22 Oct 2025 10:22:14 +0800
Message-ID: <20251022022227.226-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120865

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Drop support for Python 3.9
- Add Uzbek language

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-humanize_4.13.0.bb => python3-humanize_4.14.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.13.0.bb => python3-humanize_4.14.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.13.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.14.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.13.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.14.0.bb
index 7bcb0f62a7..d5f81d8ee6 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.14.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "78f79e68f76f0b04d711c4e55d32bebef5be387148862cb1ef83d2b58e7935a0"
+SRC_URI[sha256sum] = "2fa092705ea640d605c435b1ca82b2866a1b601cdf96f076d70b79a855eba90d"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


