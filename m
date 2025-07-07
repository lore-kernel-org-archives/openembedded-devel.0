Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E529C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.56128.1751879224005385705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qYztYYvf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879224; x=1783415224;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HopgvZe3t509IvCoGLq6WnAyPsNLb09qiVQTJwwCWWo=;
  b=qYztYYvftPqdb923ggBRRocU4uBVGpEYRzhtfpwuZ57FKi2x4Uhowh10
   ufREAX+zHLN4BqkW6Ij5ulvB0fZpfT3geHI5Xrp+y5uK3JRs/iQjf8A8Z
   JIt5lpQrhIkGBkJJImQKDeepVdTXg+OQ68OovxN0o8Sqk4D8LK3qUAalW
   dkZUQhjJrSqibSFrIvC8jKu2w+bRqlcFMk5WcufV36sUh+V9ecejcbVtC
   V2UH5IVN2GKhNJbWFPkaIB/BUuxaTXqbcT6Q94iEKNEC27vygWsa+/lna
   19frjpFOl/5doYz799peAW77qx8amCAMe4jEgQoh0/kR26wq9/tDvMJIY
   g==;
X-CSE-ConnectionGUID: FS5HkXApTK6aV4YChwQThw==
X-CSE-MsgGUID: Me4TMC44T0iFAY7sIcUm+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="193950545"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="193950545"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:02 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5BD5242A301
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:02 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id CE6E81800BD6
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:01 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 22552D4F40
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:00 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 180D71A000B;
	Mon,  7 Jul 2025 17:06:58 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 01/35] blueman: upgrade 2.4.4 -> 2.4.6
Date: Mon,  7 Jul 2025 17:06:21 +0800
Message-ID: <20250707090656.1216-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118246

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Make connection notifications transient
- StatusNotifierItem: announce children-display
- Manager: Hide bt status switch when PowerManager is not available
- Handling for new StatusNotifierWatcher

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../blueman/{blueman_2.4.4.bb => blueman_2.4.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/blueman/{blueman_2.4.4.bb => blueman_2.4.6.bb} (96%)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.4.6.bb
similarity index 96%
rename from meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb
rename to meta-networking/recipes-connectivity/blueman/blueman_2.4.6.bb
index 4a2e3a3ba0..817485f0f2 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.4.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.6.bb
@@ -8,8 +8,8 @@ inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon-cache f
 
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
-SRC_URI = "git://github.com/blueman-project/blueman.git;protocol=https;branch=2-4-stable"
-SRCREV = "bdacba8afe53066bc3a338997e26fee416af2261"
+SRC_URI = "git://github.com/blueman-project/blueman.git;protocol=https;branch=2-4-stable;tag=${PV}"
+SRCREV = "de92499405d392f344956e41b1b9e190b8177436"
 
 EXTRA_OEMESON = "-Druntime_deps_check=false \
     -Dsystemdsystemunitdir=${systemd_system_unitdir} \
-- 
2.43.0


