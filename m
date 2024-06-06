Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5118C27C79
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.9826.1717664817018311523
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qUlianQI;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664816; x=1749200816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PnvLxeIRwcWCQ6yDmKOwZwaM9P7ZUgjQZroE3SlAz6w=;
  b=qUlianQIrlXPMgUXxB0BOwcOsXfwIFXDyET81XzUbybZzqz1wHtnDX1k
   Y15zn93cQfl3MyZHezbW6wmEFNT0yl3EADRWXPUHjQBrWgb/D1gcij6VT
   BJmOkztN1eAl/XIFFXGOutx/g+OheO3uPAF8wk0kPajPCKW88PI+PmZS0
   T3q8yGFKKXykesX71yuS4tGkgoAjQ8B9Pk3nTlXyrsKM/Y19iSIlt9ArY
   w6LXXBkl8lAmyTCWV43j0Uuux7PtqBBJ+/y7OUkPOtuHywvxRo+7mlTQn
   PgmlI2C2Pkg12UXpKN+d3LiT+DPSrYOe3PIAKBODzModPKyW76IidqoTo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="150175837"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="150175837"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:54 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EA73D29E6
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id CC7A7D72AC
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6ADF520081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1742C1A000A;
	Thu,  6 Jun 2024 17:06:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/36] bubblewrap: upgrade 0.8.0 -> 0.9.0
Date: Thu,  6 Jun 2024 17:06:02 +0800
Message-Id: <1717664795-13902-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--3.996300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrYdBG+bhhiNQAIXlMppp3XynN
	YSmpHzdZT5jobNZwpKe1QhEk8s7S2LZBC9RJlKWjHWRJEfGP5nlUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmnmyE8VIo655CZwiP+utP51L/tBTZzO5Q25x7uAXGEprZiQDIJsDspXEd+K6O5Nt51/wV
	JvMu+9/m0C585xWIZ4gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyXaTuRXpJdAtiWSkitmH45LXRg
	Mxu+sdg+BTUra9TyVcdRnsn83UfEJRxl2vC8e2rWniyLKjBZZNoIi1vkDr1x/DOhPTMYA/L/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110717

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix a double-close on error reading from --args, --seccomp or --add-seccomp-fd argument
- Improve memory allocation behaviour
- Silence various compiler warnings
- Silence an Automake warning
- Fix a test failure when running as uid 0 in a container
- Fix a test failure when /mnt is a symlink
- Fix a test failure on NixOS
- Add --argv0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bubblewrap/{bubblewrap_0.8.0.bb => bubblewrap_0.9.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/bubblewrap/{bubblewrap_0.8.0.bb => bubblewrap_0.9.0.bb} (91%)

diff --git a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.8.0.bb b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.9.0.bb
similarity index 91%
rename from meta-oe/recipes-security/bubblewrap/bubblewrap_0.8.0.bb
rename to meta-oe/recipes-security/bubblewrap/bubblewrap_0.9.0.bb
index 06c42addb..c60c1dfd6 100644
--- a/meta-oe/recipes-security/bubblewrap/bubblewrap_0.8.0.bb
+++ b/meta-oe/recipes-security/bubblewrap/bubblewrap_0.9.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 DEPENDS = "libcap"
 
 SRC_URI = "https://github.com/containers/${BPN}/releases/download/v${PV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "957ad1149db9033db88e988b12bcebe349a445e1efc8a9b59ad2939a113d333a"
+SRC_URI[sha256sum] = "c6347eaced49ac0141996f46bba3b089e5e6ea4408bc1c43bab9f2d05dd094e1"
 
 inherit autotools bash-completion github-releases manpages pkgconfig
 
-- 
2.34.1


