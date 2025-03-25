Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51356C36008
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.61108.1742893329397324945
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ql8km3NM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893330; x=1774429330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=q5YEZ/Ahx+UgVv6sHOUa6+iuutMcxJXW9GB46aRNvrI=;
  b=ql8km3NMCrumsGjKGwE9vZiPfzpBGfE639u4CxtNgJdxojn8HZJoFIUX
   qPrrBURPScncBZzdy3JjE+k//bKoZqmLKIBSFQwDPIjR0wsOaJh0fGGda
   05STdLR7hjJxJpcNmSOhnKLXsVpORa/n78vslkpcDmbezXuVKx/blXmzq
   tTwlMBFC1+h6q5vXu1qBjzV3nl9+DWc/PgYH5RUyiBxOlg59ABr67bLmu
   oteEjf15pxtUaEay7Y6URKaepOIRHHYN9MBHKxguOurd7zKDgeVQWP6qP
   J4jyus0f4AGg4vSAyR0fVQZbTtG/PW3jNN9F4DsZpAJ8DB4ymPu3ljr2S
   g==;
X-CSE-ConnectionGUID: 8x/MXpH2Sn2azDdhmmMAyQ==
X-CSE-MsgGUID: FU5QaLSxRW2gV0xSWZe9Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194202219"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194202219"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:08 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F170A9674B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AEFE7C8BFC
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:04 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F1DDA1A0078;
	Tue, 25 Mar 2025 17:02:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/45] icewm: upgrade 3.7.1 -> 3.7.2
Date: Tue, 25 Mar 2025 17:01:13 +0800
Message-Id: <1742893312-3809-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116230

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Always print icons double-quoted
- Also support SVG icons when the image library supports it natively.
- Mark the WindowList as a toplevel and redirect its input to the listbox.
- Fix compiling without internationalization for icewm-menu-fdo.
- Also update the server time before setting focus to the topWindow.
- Try not to go backwards in our notion of the X server time.
- Only save event time when it is non-zero.
- Add updateServerTime to class declaration in header.
- Use the window handle when retrieving the user time.
- Fix off-by-one errors in the QuickSwitch bottom right border
- Log the keycode as a decimal.
- Improve readability in SwitchWindow::resize.
- Ignore key releases and modifier presses in the top window key handler.
- Remove the incompatible cmake_path from the po CMakefile.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_3.7.1.bb => icewm_3.7.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.7.1.bb => icewm_3.7.2.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_3.7.1.bb b/meta-oe/recipes-extended/icewm/icewm_3.7.2.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_3.7.1.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.7.2.bb
index a0acffae52..747a0c23ce 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.7.1.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.7.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "0d86e542c5d56aa0f443d67549e150c419d497ae869f561edae06b293571add8"
+SRC_URI[sha256sum] = "b4ed8a357352f761f0d2d547235e35e97051f7e5db55d32f689d2c5262f202d8"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


