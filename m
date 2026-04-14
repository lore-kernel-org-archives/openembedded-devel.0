Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E6DED7BAB
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15979.1776163207015447916
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uInMdoGA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163207; x=1807699207;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zjx47e06A3v7tzSYk/vM9uR/6y6pqYjS+7hfw391DSU=;
  b=uInMdoGAVsftleW7hUMC25A8tQWjhe0DYeLtIn9gJBUiwWb4MdprCO+1
   gg8OEupdG8TvjpCR1n8QzSjRcIgKR/srEnhsaQLTwqLDk8wv3jPqZWReZ
   Pm4AHJY6frop9RZfLc9HwObVlYDtSRtUIAiXz0np5SCcz+n6o8kcZKfvD
   1YvjlNpVimDw/D2b2wL4WovrqJX2LOcyF83EX46gRotGhO2F97pFViUUn
   IzkblDtR9f2dAEm2XcOWsjjMIaZDdrcc6MQLUH7yZZQ4PCMvM8ZQWkydj
   HXbIm0tfzZy07skY07NggpgRASJ6jfAobNt24gef1IiBwhbjkkS0gFwfC
   A==;
X-CSE-ConnectionGUID: otNy8VFxSkuJpp6EyBHvKg==
X-CSE-MsgGUID: xkYg8SJzQ4+mjz5An7sLJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="236364898"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236364898"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:05 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9854B1C0009F
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:05 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 482521800E9A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id AF80C14000E2;
	Tue, 14 Apr 2026 10:40:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/32] nano: upgrade 8.7.1 -> 9.0
Date: Tue, 14 Apr 2026 18:38:25 +0800
Message-ID: <20260414103845.1728-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126316

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- When the cursor almost goes offscreen to the right, all lines are
  now scrolled sideways together, by just the amount needed to keep
  the cursor in view.  Use --solosidescroll or 'set solosidescroll'
  to get back the old, jerky, single-line horizontal scrolling.
- The viewport can be scrolled sideways (in steps of one tabsize)
  with M-< and M->.  See 'man nanorc' if M-< and M-> should switch
  between buffers (as they did earlier).
- M-Left, M-Right, M-Up, and M-Down have become rebindable.
- Stopping the recording of a macro immediately after starting it
  cancels the recording and leaves an existing macro in place.
- Feature toggles no longer break a chain of ^K cuts or M-6 copies,
  except the M-K cut-from-cursor toggle.
- With --mouse and --indicator, one can click in the scrollbar area
  to roughly navigate within the buffer.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_8.7.1.bb => nano_9.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_8.7.1.bb => nano_9.0.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_8.7.1.bb b/meta-oe/recipes-support/nano/nano_9.0.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_8.7.1.bb
rename to meta-oe/recipes-support/nano/nano_9.0.bb
index e62529ff9b..06bb7a63ce 100644
--- a/meta-oe/recipes-support/nano/nano_8.7.1.bb
+++ b/meta-oe/recipes-support/nano/nano_9.0.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "76f0dcb248f2e2f1251d4ecd20fd30fb400a360a3a37c6c340e0a52c2d1cdedf"
+SRC_URI[sha256sum] = "9f384374b496110a25b73ad5a5febb384783c6e3188b37063f677ac908013fde"
 
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/nano"
 
-- 
2.43.0


