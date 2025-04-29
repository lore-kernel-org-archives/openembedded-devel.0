Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85F3C3ABB0
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7615.1745900151983593155
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WICPOL94;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900152; x=1777436152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EeAth1rZYDdTbLeoFN7Mx6SWzcbfpD1fcDZfXJKPrc0=;
  b=WICPOL94+jB+GpNPgSDI8bQbG/xzKmxkWO3Y+kCDq0mffgItfaKV2oeM
   xfH9STSYxELVC2GdyDij8+Ig4XrL0GlmiA0vrvFji+Cl0OWJANGmash5V
   ywSnQIujkEPNyW0aiIfXG5GMvN42x4YrzaXkwDWBaVz+jeOR3qBt31pxT
   8pJxasHGOWAnK05RcVcoT8uieFe0yVkQz4/sePpHe2R6drTMBDbg0z4Ku
   57Rp2eyGAwLPKC+cw21NEQOKfUQzliHLIY3kUlRx1MHlQgaJXdPqm4neY
   aFtwkvxbK5vC9EAeqPull/fHrU3wEqcY5gnzg5zveKjif6uXGAuY+6PRP
   A==;
X-CSE-ConnectionGUID: cswPZuzjRnW0IJ/d+2zecw==
X-CSE-MsgGUID: ag0IlpMXRGaM34yK6mxsyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="177458652"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="177458652"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7342ED4C3C
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 26B1BBF49B
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AA9031A00A0;
	Tue, 29 Apr 2025 12:15:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/23] icewm: upgrade 3.7.3 -> 3.7.4
Date: Tue, 29 Apr 2025 12:15:19 +0800
Message-Id: <1745900138-26424-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117209

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Lower minimum required CMake version to 3.5.
- Fix CMake LTO build.
- Remove obsolete CMake warning for SVG library.
- Let icesh don't loop when interrupted.
- Use X-resource library 1.2 to reliably obtain process identifiers of
   client windows. Add the "toolbar" command to icesh to let icewm reload
   the toolbar configuration.
- Add xres_LDFLAGS to icewm_libs for CMake.
- Add a toolbar button to the CAD-dialog.
- Return first found PID in getNetWMPid.
- Better fix for getNetWMPid sorry.
- Add xres to dependencies.
- Make XRes disableable in configure. Up version to 3.7.3.
- Make XRes disableable in the CMake build.
- Give which a backup in rebuild.sh.
- Remove debugging statements.
- Add a --replace option to icewm-session.
- Add -Z filter to icesh to select only terminals.
- Drop old obsolete icons.
- Change default theme to icedesert.
- Fix the stacking order when a QuickSwitch ends.
- Replace -lXRes with $(XRES_LIBS) for icesh.
- Improve CAD-dialog up-down traversal.
- In getLastFocus, ignore unmanaged frames.
- Restack the windows after a QuickSwitch has ended.
- Fix typo.
- Permit some global keys in case the global keybinds are not active.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_3.7.3.bb => icewm_3.7.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.7.3.bb => icewm_3.7.4.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb b/meta-oe/recipes-extended/icewm/icewm_3.7.4.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_3.7.3.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.7.4.bb
index 311abc3702..fa76f2e34e 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.7.3.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.7.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "4d845d8af6194fa25b36524467ae9fdcca2faed5c4046515e3bc633ff1479230"
+SRC_URI[sha256sum] = "e248e299616f417f5051423ea65a15668b71c1fdc9b5e477b47b1e80db3a7724"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


