Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BCDC52D7C
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.33825.1721034176804143516
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OccVn8C0;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034185; x=1752570185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=diEz8OV3AGFGxQ8FjxVhrROA1KYMWl0KiO26D1kXDL4=;
  b=OccVn8C0cuPSfhSw2/PCYwD/qre4M/BTCko0hSwOsypfScEMQ0qC2Gvf
   ZlZ4HYjtIL5V15gz84FNd8dy/nmGHBzARMR7RSbUaQttux10iVRhfXNP6
   i9kAkyuevkHAu6wHLqIKrcjZELbG7vOSxvVPZ/6TsW5YoX+iENkfq7rsR
   uwLGkflTgDVmv+gSRudvHs2/P9+AI/KNg2wd+a08nW1qTa9+Hh/7tOfXy
   FYQFQoGfka9uo8Q2p6hZZbIq5alfRSWQfyUvn5Ng2UZVm54oZ7C73tSe5
   OEO4qlasw7jYa8lAuQPiizPRCEXTzNrmBhE9J0q+JrKHvmvHu+YFKTXCi
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="154933606"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="154933606"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34751D800A
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:02 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 79854D8B00
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3099320071A31
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:03:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D4A721A000A;
	Mon, 15 Jul 2024 17:02:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 37/38] xterm: upgrade 392 -> 393
Date: Mon, 15 Jul 2024 17:02:30 +0800
Message-Id: <1721034151-540-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10-1.182300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yQPZZctd3P4BRzUPAqhCjtiBVYn8vqmiFtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJopGZilTi8ctSOwpfLMeBwRtr9+Kgn2XgeNzONa1Rspx3G0q
	oOc1rQcqUTVij24f8Ray8ojY+JYM95UcZtwNsCroURSScn+QSXt8dWDYdvqmp9zw4lzv7RUmOhz
	Oa6g8KrdWK8ftKijSIurtMrA3ukCFep5NTtAt964WtY0eS/I4xdmMUBCwKMwH9ErNop8luTCisM
	Nuz2yl5x1wPmV0MC/N+tvoUDSSThR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuEVM/dBEMBtjA
	KW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111357

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_392.bb => xterm_393.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_392.bb => xterm_393.bb} (95%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_392.bb b/meta-oe/recipes-graphics/xorg-app/xterm_393.bb
similarity index 95%
rename from meta-oe/recipes-graphics/xorg-app/xterm_392.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_393.bb
index 67bf8fe11..05e45345f 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_392.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_393.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=1a3032aa728f8fda9d
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "4d57372ef08eafa9fb7682db8d07be0fe0513e58e8478c2ec8e9b62486e7fe5e"
+SRC_URI[sha256sum] = "dc3abf533d66ae3db49e6783b0e1e29f0e4d045b4b3dac797a5e93be2735ec7b"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.34.1


