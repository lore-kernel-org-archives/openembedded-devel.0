Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D88DC87FD2
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.31371.1753869307251550651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BnNvB73b;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869307; x=1785405307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QP4KlTISScpAjPydNfQmDOL467Clj6w+C6S1y+kElUs=;
  b=BnNvB73beD2aTsS+NASV/RTLLaJgv1W1LzHCGXF0yh2B73QlTxRGzMjW
   V1gVE1zTk6H+UkHQ35WRplI4QaXpYvqsn6jbtElTdheg2H0vjTvoFKYBI
   0SbnPdPfmb+855JUWFNDTnAbPq1OjzPmejFOq6mP+SEUO+oRxAHnk5KG6
   SPrG1mIA9k+XY/UR9KSWwRCW45R8Fd6katxwm7VbNYmcPM0r8FSI/+ouV
   TUVVJMjxesXv6R+lHDsuJqlwR+N96e+Exwq9n13S2ipTO34O4rdmAXdW3
   nEbFZxMcpDfbUGF895TUVSFbqV7/b3XcDltiRDqLIJVbdcIcl2FNRqBoH
   g==;
X-CSE-ConnectionGUID: 9Q61gYwXT+6Mf27NC4bVIQ==
X-CSE-MsgGUID: 8slynAIlTk29NPNU5A1u4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="186784560"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="186784560"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:05 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 79CC78204EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E3638C01804
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 105A01A008F;
	Wed, 30 Jul 2025 17:55:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/40] drm-info: upgrade 2.7.0 -> 2.8.0
Date: Wed, 30 Jul 2025 17:54:22 +0800
Message-ID: <20250730095456.695-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118773

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add support for the IN_FORMATS_ASYNC property
- json: fix trailing NUL byte in PATH data field
- readme: drop CI badge
- readme: add link to GitLab repo, use references
- build: bump minimum Meson version to 0.56.0
- build: bump minimum libdrm version to 2.4.104
- readme: make --wrap-mode=nofallback paragraph more generic
- readme: make usage list more readable
- ci: switch to debian/oldstable
- build: remove unnecessary libdrm fallback variable name
- build: bump libdrm headers to v2.4.125
- Add support for Apple format modifiers
- Add support for MediaTek format modifiers
- build: bump version to 2.8.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{drm-info_2.7.0.bb => drm-info_2.8.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/drm/{drm-info_2.7.0.bb => drm-info_2.8.0.bb} (78%)

diff --git a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb b/meta-oe/recipes-graphics/drm/drm-info_2.8.0.bb
similarity index 78%
rename from meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
rename to meta-oe/recipes-graphics/drm/drm-info_2.8.0.bb
index 810be40013..f94611a79e 100644
--- a/meta-oe/recipes-graphics/drm/drm-info_2.7.0.bb
+++ b/meta-oe/recipes-graphics/drm/drm-info_2.8.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
 
-SRC_URI = "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https"
-SRCREV = "c1f5ca4cf750b26eb26c1d9d5c2ef057acbcfefc"
+SRC_URI = "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "4dbc230d3236215198954e9284cdb2c5933f8f22"
 
 
 inherit meson pkgconfig
-- 
2.43.0


