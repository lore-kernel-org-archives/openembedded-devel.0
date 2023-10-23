Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D225C25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:51:05 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.6859.1698105056456405615
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="125586262"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="125586262"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:50:54 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20AD8CA1EB
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:50:52 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5747BBF3C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:50:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 41F452FC5D89;
	Tue, 24 Oct 2023 08:50:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tio: upgrade 2.6 -> 2.7
Date: Tue, 24 Oct 2023 07:50:34 +0800
Message-Id: <1698105034-32407-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27954.003
X-TMASE-Result: 10--0.922200-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy3L2aPW6sT0l7E
	dVZXsXPvJsxYngyx+QU2OrICH2A/XjpVPRuvrVLlWFHKJ2wSViR7tnRTJA7lM3hh5KUdlgWi7v0
	MlFSLfmmiJGJGoluOFgFd21k9Z8naL/tBTZzO5Q0D2WXLXdz+AfNYQxCOihTNYA3qL69rXq6RY0
	JyfRdA4t6Ap/+vpvjqLmth8cTQ473lRxm3A2wKuhRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07blX3
	Pe+qTcq4hgHpQGDwLyfByvT3fvFO+l/J5WAXFCoTRuw3Oh/xd+OBK2uWhiUMbthK5UhcyCwo/6D
	rTkdnOjfHK77VOxKPhRU9gk/Xu3s8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105712

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * Add xmodem and ymodem file send support
 * tty_stdin_input_thread(): write to pipe only if byte_count > 0.
 * Ignore EINTR error.
 * CYGWIN: Add support for "COM*" naming.
 * chore: reorder log-strip and log-append
 * chore: update readme, bash completion, man page
 * fix: support --log-append in cli options

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tio/{tio_2.6.bb => tio_2.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tio/{tio_2.6.bb => tio_2.7.bb} (91%)

diff --git a/meta-oe/recipes-support/tio/tio_2.6.bb b/meta-oe/recipes-support/tio/tio_2.7.bb
similarity index 91%
rename from meta-oe/recipes-support/tio/tio_2.6.bb
rename to meta-oe/recipes-support/tio/tio_2.7.bb
index faef290737..59c772b5d0 100644
--- a/meta-oe/recipes-support/tio/tio_2.6.bb
+++ b/meta-oe/recipes-support/tio/tio_2.7.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
 
 SRC_URI = "git://github.com/tio/tio;protocol=https;branch=master"
-SRCREV = "88ef473362c5a1ff0dcd389fd5b1d4d6bf202472"
+SRCREV = "1c32555c2a4f26b60f94757656825fc6684d6892"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


