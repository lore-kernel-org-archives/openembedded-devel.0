Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BF8FD7F8D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:50 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92476.1772187349540052684
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kj57+R0h;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187348; x=1803723348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n0UnTkOMz9FNV1P6O3NJRkseZbFQNCBZ7JC9mr4Toko=;
  b=kj57+R0hHmWb4A7/15p4RAmlV9ht/l8q8WQh/n4uEPtbWwJxdFK0QDCw
   XYM39dpkn0AMW7pGUOaJ/kqORTiD5BzoYtH2sms5Ss14VfEyW3/vLt1J5
   9bjkc7wzPa3Mb4kboAmkmw0EL/BA2wa2UXQE5v320gGasXPA8fHe4dTxc
   EEBhyFUPBxuVFiba36F82Bphk/u3pOG3HW81T3+r7x+LCqDuw8SmsAWwS
   oqhcz/dfdo6YyKW139XlHTFgnB+HkGdYGY/cgk+RY7t+fcNqZpIVCZFy8
   9SMo0R6WHPAbVfo1XFPa8Eqn5e+4tuUBX/Obqq+T04OWW0xjYGCa03BZK
   g==;
X-CSE-ConnectionGUID: qZmvYhRxR1qPZSOwqEntew==
X-CSE-MsgGUID: 56CZ9MCJQLOuOlTBlA8Vjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="231300055"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="231300055"
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id E51F91002B98
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:47 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9A531180A337
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id B5E75180059F;
	Fri, 27 Feb 2026 10:15:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 51/52] xterm: upgrade 404 -> 407
Date: Fri, 27 Feb 2026 18:13:26 +0800
Message-ID: <20260227101327.1432-51-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124751

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year upted to 2026.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_404.bb => xterm_407.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_404.bb => xterm_407.bb} (90%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_404.bb b/meta-oe/recipes-graphics/xorg-app/xterm_407.bb
similarity index 90%
rename from meta-oe/recipes-graphics/xorg-app/xterm_404.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_407.bb
index 944d811566..4aecd77f98 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_404.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_407.bb
@@ -2,12 +2,12 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 SUMMARY = "xterm is the standard terminal emulator for the X Window System"
 DEPENDS = "libxaw xorgproto libxext libxau libxinerama libxpm ncurses desktop-file-utils-native"
 
-LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=170620b648626a97057ff6ea99e6396e"
+LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=413ff95100710d7a817c5257bf3940cb"
 
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "63332f921c227ba59e589fa07dfdad1599c10ac859ea26c72ac1dd4a41b565a4"
+SRC_URI[sha256sum] = "2136eba530068a1b7565abbf17823274f5cefb7fe3618355cbc89dc55c8b7b6a"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.43.0


