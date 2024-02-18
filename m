Return-Path: <chen_heyun@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE46C48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 13:47:22 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by mx.groups.io with SMTP id smtpd.web10.17821.1708264038209353233
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Feb 2024 05:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@163.com header.s=s110527 header.b=iUh+fd30;
 spf=pass (domain: 163.com, ip: 220.197.31.3, mailfrom: chen_heyun@163.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7gQDj
	a1MsCOc/I4XXzfgtSc+IpWdzfiniMKYlzeGWKU=; b=iUh+fd30IzAHCDPzMXKfQ
	boHshllkjzmwd6tpDn1C9hlH/WPkmsr/I/D0OPMip3PBG1jEsIHJ8rXkHuWzXDlU
	/uYjr9FPIBDRgkfUHi0VSoK+rXaQ7Pk8wBV7adyhYmz4yIXLkWeTsvWzow6HZzhD
	uwgE+Qjl8H6mR9NjDZpM1k=
Received: from ubuntu.localdomain (unknown [119.86.46.60])
	by gzga-smtp-mta-g1-0 (Coremail) with SMTP id _____wCH6DhgCtJlMAC1Cw--.40971S2;
	Sun, 18 Feb 2024 21:47:12 +0800 (CST)
From: chenheyun <chen_heyun@163.com>
To: openembedded-devel@lists.openembedded.org,
	819869652@qq.com
Cc: chenheyun <chen_heyun@163.com>
Subject: [[meta-networking][PATCH] fix dropwatch] dropwatch tools compile with local head file,but it not matched with our real head file form kernel.(net_dropmon.h) net_dropmon.h in dropwatch local src/net_dropmon.h. linux kernel also have it in include/uapi/linux/net_dropmon.h
Date: Sun, 18 Feb 2024 05:47:08 -0800
Message-Id: <20240218134708.63400-1-chen_heyun@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCH6DhgCtJlMAC1Cw--.40971S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxury3try5JrW5XF1DGF4rZrb_yoW5Cry8pF
	y5urn8Cw4DWF12g397CFyxXa1jqw4kZw15WwnxWayayr13uF98JrWSyr9rWFW3GrWFkrWU
	W3sxJ393WrWrGw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UbiSJUUUUU=
X-Originating-IP: [119.86.46.60]
X-CM-SenderInfo: xfkh0spkh130i6rwjhhfrp/1tbiVhOIRmV4IA8muQABsn
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Feb 2024 13:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108838

for example,our kernel is linux5.10:
diff tmp/work/cortexa57-poky-linux/dropwatch/1.5.4+git-r0/recipe-sysroot/usr/
include/linux/net_dropmon.h tmp/work/cortexa57-poky-linux/dropwatch/1.5.4+git-r0/git/src/net_dropmon.h
1c1,3
<
95a94
>       NET_DM_ATTR_REASON,                     /* string */

it will cause missmatch when we use drop watch in lower kernel version(v5.10),
will cause dropwatch and kernel drop_monitor module missmatch with netlink talk.
we should build it with sysroot which comes from match kernel head file.

Signed-off-by: chenheyun <chen_heyun@163.com>
---
 ...th-sysroot-head-file-instead-of-loca.patch | 28 +++++++++++++++++++
 .../dropwatch/dropwatch_1.5.4.bb              |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100755 meta-networking/recipes-support/dropwatch/dropwatch/0001-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch

diff --git a/meta-networking/recipes-support/dropwatch/dropwatch/0001-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch b/meta-networking/recipes-support/dropwatch/dropwatch/0001-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch
new file mode 100755
index 000000000..33b72e05f
--- /dev/null
+++ b/meta-networking/recipes-support/dropwatch/dropwatch/0001-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch
@@ -0,0 +1,28 @@
+From 4872c52f55f9cb089e6681c3f1926663145b52ae Mon Sep 17 00:00:00 2001
+From: chenheyun <chen_heyun@163.com>
+Date: Sun, 18 Feb 2024 05:08:25 -0800
+Subject: [PATCH] fix bug: build with sysroot head file instead of local head
+ file:net_dropmon.h
+
+Signed-off-by: chenheyun <chen_heyun@163.com>
+---
+ src/main.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/main.c b/src/main.c
+index e4746d9..81dc4da 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -26,8 +26,8 @@
+ #include <netlink/netlink.h>
+ #include <netlink/genl/genl.h>
+ #include <netlink/genl/ctrl.h>
++#include <net_dropmon.h>
+ 
+-#include "net_dropmon.h"
+ #include "lookup.h"
+ 
+ /*
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
index e3dbac4a2..baa9398a1 100644
--- a/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
+++ b/meta-networking/recipes-support/dropwatch/dropwatch_1.5.4.bb
@@ -8,7 +8,9 @@ SECTION = "net/misc"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-SRC_URI = "git://github.com/nhorman/dropwatch.git;protocol=https;nobranch=1"
+SRC_URI = "git://github.com/nhorman/dropwatch.git;protocol=https;nobranch=1 \
+		  file://0001-fix-bug-build-with-sysroot-head-file-instead-of-loca.patch \
+"
 SRCREV = "1e7e487a019a7c02f1f429c4d3a4647fa3787a13"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


