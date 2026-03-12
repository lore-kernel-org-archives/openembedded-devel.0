Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A13105A568
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:47 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18772.1773312824760925638
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K8BgwWvP;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312825; x=1804848825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b8LFxXRQN0HPMiDvdJo6zMdBVyidkuaua3/pAnGUbtc=;
  b=K8BgwWvPUBvnjbLiUtxQLp/V4wbTtK8mBQiplDiDuuBLOAkRimcKOlkG
   AGTl8ylZ/7DWs+Dw3Z4bwPMaqPorLtDFvWtVBF58gzGqBYUhpEUTaHZl1
   lO4jB2f8XRnCiQXAK18wESU6iQkWizC4PuL9Xl9pK5AbYjroqzWUsXltz
   8RqbX158lRCKj4xBakewrNyajVi4ZChpCsruYZrdJQWPYw+7lSfkj1gUp
   YSuWdFSH63pYyXfaLMCwNdZPgwvkO6cQHOuGrqtgEvMo+OLULuXzVumFG
   68Mhznw2lyv2w/rhH4iBeYCJW3AhTq8PHqV63midg6mWhieZqBI/ELOQ2
   g==;
X-CSE-ConnectionGUID: pQWFT/GXQwC16/gs1VDJYw==
X-CSE-MsgGUID: +b18P17DSFa9kPctvIKm9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220449417"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220449417"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:43 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5AA848204CE
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:43 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 077438D65F8
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0C59B18005B4;
	Thu, 12 Mar 2026 10:53:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/64] python3-h5py: upgrade 3.15.0 -> 3.16.0
Date: Thu, 12 Mar 2026 18:51:52 +0800
Message-ID: <20260312105220.1856-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125136

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-h5py_3.15.0.bb => python3-h5py_3.16.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.15.0.bb => python3-h5py_3.16.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.15.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.16.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-h5py_3.15.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.16.0.bb
index dd71a18534..883aeb2033 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.16.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "ede198dde0c359a3f9dc0af15962707c7195102235cb26b4826e33918789559a"
+SRC_URI[sha256sum] = "a0dbaad796840ccaa67a4c144a0d0c8080073c34c76d5a6941d6818678ef2738"
 
 SRC_URI += "file://0001-setup_build.py-avoid-absolute-path.patch"
 
-- 
2.43.0


