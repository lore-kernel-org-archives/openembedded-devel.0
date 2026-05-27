Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB17CD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:02 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16932.1779875328565226714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iq4RnDec;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875334; x=1811411334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YIJJpYJS3lnThmXSax6PuPLSTqER17/aqcmdC6gJlII=;
  b=iq4RnDeceBF4I+wjIZ2JLgjLxnn2eu40xdZXP3uSfSdS1Zrw8Lp+4ydS
   MNNBGIWyXp1NJDiT3k6Ri+g19kN2Y+xSiqXrTQK33ZS9ohndzyRb6/TB0
   6wCoxSxTJ/IPldTrqBgU4h70XuSB8rkyaik6qN3LFvMkN3ipajAJUSGUp
   2JZ/Abo62W8NN22h5pNd6ym1Cpty5UXnYrBJpyGF8FBTM3X4gpCIm6jp7
   MF7SnCRTaMrEqyf3aBkn7G8ROWk2Oj5brtPC3OoMWqAcb+g+wjze0fF5j
   NFwchzrMRFBLcCQTwJa9iD+3+yT3k5hnWhPbzPM8jRHvVws9wQq7I7nJ3
   A==;
X-CSE-ConnectionGUID: gEo7KpMwSB+QS/NB9bL3aA==
X-CSE-MsgGUID: noqG9wP8T6KP0EuEx1T1hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="229391887"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="229391887"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:53 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5DC9842A33A
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:53 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 1769B100D211
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3615982A2C9;
	Wed, 27 May 2026 09:48:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/56] python3-aiohappyeyeballs: upgrade 2.6.1 -> 2.6.2
Date: Wed, 27 May 2026 17:47:30 +0800
Message-ID: <20260527094805.2039-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127228

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Clear error on empty addr_infos in start_connection
- Stop verify_no_lingering_tasks from leaking an event loop
- Optimize obtaining event-loop down to 1 line

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...happyeyeballs_2.6.1.bb => python3-aiohappyeyeballs_2.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohappyeyeballs_2.6.1.bb => python3-aiohappyeyeballs_2.6.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.1.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.2.bb
index 441016fd23..05edac0c5b 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.6.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohappyeyeballs"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
-SRC_URI[sha256sum] = "c3f9d0113123803ccadfdf3f0faa505bc78e6a72d1cc4806cbd719826e943558"
+SRC_URI[sha256sum] = "e202810ee718bd01fc6ef49e8ea53d023d5cb6b581076d7925aa499fa55dbe64"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


