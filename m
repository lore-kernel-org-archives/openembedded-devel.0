Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E79FC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 07:52:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2386.1700121124084394373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Nov 2023 23:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="118687560"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="118687560"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 16:51:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 95E89E753D
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:51:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E9A8D5CDE
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:51:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 664DC40E91;
	Thu, 16 Nov 2023 16:51:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] mdns: upgrade 2200.0.8 -> 2200.40.37.0.1
Date: Thu, 16 Nov 2023 15:50:36 +0800
Message-Id: <1700121036-21542-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10--0.256900-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZNc05u0K9Si3YTIYryGOdGp0C6WJNXTpi1Br
	5wWX7YQ2v2Y5N7C5p1M49/rxCN6wf9c0SSBk6D842aDVyTGx/pwK0ZgbTOeKU0EOtcDElThTX7Q
	qxdrFbPuLzNWBegCW29sZ0UX0EaOILbigRnpKlKZx+7GyJjhAU8OPW0Y5RgsCDX2mtWFI8JQRVT
	5l4JJ6C5wPfpAcicM16RXStx4Xd63LIZFJPkHRWrBcAguYW8620JCen2R7/u/6vHw8ScXhX7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 07:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106779

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mdns/{mdns_2200.0.8.bb => mdns_2200.40.37.0.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2200.0.8.bb => mdns_2200.40.37.0.1.bb} (98%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb b/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
similarity index 98%
rename from meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
index 8370ed50c..af2b33717 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2200.0.8.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2200.40.37.0.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
 DEPENDS:append:libc-musl = " musl-nscd"
 
-SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=main \
+SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=rel/mDNSResponder-2200 \
            file://0001-dns-sd-Include-missing-headers.patch \
            file://0002-make-Set-libdns_sd.so-soname-correctly.patch \
            file://0004-make-Separate-TLS-targets-from-libraries.patch \
@@ -25,7 +25,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0015-Add-missing-limits.h.patch \
            file://0001-Handle-interface-without-ifa_addr.patch \
            "
-SRCREV = "d5029b5dff8aa59d1fc07ed796e994106ef58dee"
+SRCREV = "a9f4049ab772ca57b5afc9804ae5004beb711d6e"
 
 # We install a stub Makefile in the top directory so that the various checks
 # in base.bbclass pass their tests for a Makefile, this ensures (that amongst
-- 
2.34.1


