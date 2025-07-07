Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E079C83F0C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.55568.1751879234028344688
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ONKgjPpo;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879243; x=1783415243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iu+MeLVoUQxBwGK5wWPpZYGR6z0QVlaXz4Ab8IvzWxU=;
  b=ONKgjPpoI1vRIrOG9tVnRx4sKE5KYWMcip7pehOtIiFKIq/kbrbg+uYC
   ih1S/O/prZzRXwshxKmRlhKJZEPPBBWQx7Gsyf2m7foiK1IXqstP6ZZKx
   xi4jIY36jj2WFNDvYU3IQWrvUmBdWJIVJIekAZuOGJBeyorDCDVdcov8u
   I8qQvIv+r1u2T/TOLn4zVEOtMRIbJ8DCKWRsygHthJaBANRIjHocOVKU2
   NWNMdobbuSbxjNuYZ67sBBfiFSAzXCNRjL/o4tWHkqAXQ6fQ+6RT/vSx4
   Svim4ffPtZ4dJcOtmPDmyYhoX9uRqrj4sDKMErR4rIx+IaqDMGB19rGem
   Q==;
X-CSE-ConnectionGUID: QT8yAYulRdC2LFtukuNrYA==
X-CSE-MsgGUID: T6wcFRuBTyyi0iTF9szGmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="193452757"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="193452757"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:23 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6971342A301
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:23 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTP id DE0C31C00181
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:22 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BE3CBF3C5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:21 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 811DD1A000B;
	Mon,  7 Jul 2025 17:07:20 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 35/35] xterm: upgrade 394 -> 401
Date: Mon,  7 Jul 2025 17:06:55 +0800
Message-ID: <20250707090656.1216-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118280

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_394.bb => xterm_401.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_394.bb => xterm_401.bb} (90%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_394.bb b/meta-oe/recipes-graphics/xorg-app/xterm_401.bb
similarity index 90%
rename from meta-oe/recipes-graphics/xorg-app/xterm_394.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_401.bb
index 94953b288e..3543eff33c 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_394.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_401.bb
@@ -2,12 +2,12 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=1a3032aa728f8fda9d686948940ca58d"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=170620b648626a97057ff6ea99e6396e"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "a2a0cb206eb0423dedc34794f5c2d38c83390d2dd1106b66aba0960c3a976c7a"
+SRC_URI[sha256sum] = "3da2b5e64cb49b03aa13057d85e62e1f2e64f7c744719c00d338d11cd3e6ca1a"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.43.0


