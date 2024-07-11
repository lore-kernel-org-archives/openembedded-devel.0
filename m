Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CD2C3DA42
	for <webhook@archiver.kernel.org>; Thu, 11 Jul 2024 03:11:48 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.3764.1720667501448260228
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jul 2024 20:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t6/6CTuG;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720667501; x=1752203501;
  h=from:to:cc:subject:date:message-id;
  bh=a3O9b26+tlbyWlCz+UphfR78RQ8fwrxqEj2C8DKcjFU=;
  b=t6/6CTuGIwjcgyMaeCFOEt03xLmhd6k8L+q4RWw5NoZ5Te0fi0NfNq6R
   /qa+HNWXm9eKfMoyutfZXfcRzeL6Gl+oLyB77v3NHB2oyio+W53OHrrmA
   IgRL2jbHzX+6S4WK8ZeZoJ/cUA7wWgcwT1G5zdiengBjhPTWZMavObAR3
   HEI0c+YjIxgItetGE3yKf5PKm6PCfzz5w3Ht3bTSS35I/4zinHR7TESKJ
   UPvaLLywXZF5/3ntLl2hQs8/shqvBOCLvNvNMBivEQM6sxCxAd3k6tJ8a
   SSS28+PM3qI0BwW03ozbmeJ0z+FVOclb5Fc3t/rSg35mmryYl5D9vN0oi
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="145661425"
X-IronPort-AV: E=Sophos;i="6.09,198,1716217200"; 
   d="scan'208";a="145661425"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 12:11:38 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A0231A8C1B
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jul 2024 12:11:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DB373D8B86
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jul 2024 12:11:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AF3E320086EB1
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jul 2024 12:11:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3EF0A1A000A;
	Thu, 11 Jul 2024 11:11:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] procmail: fix build failure with gcc-14
Date: Thu, 11 Jul 2024 11:11:21 +0800
Message-Id: <1720667481-29661-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28522.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28522.004
X-TMASE-Result: 10--3.575700-10.000000
X-TMASE-MatchedRID: tV3h6RfwUKBaQiLka9EcSk7nLUqYrlslFIuBIWrdOePfUZT83lbkEJtC
	OUPy2BVakzpHopPQfRrOkqBOmxsNEwzyMxeMEX6wFEUknJ/kEl5jFT88f69nG/oLR4+zsDTtjoc
	zmuoPCq3k1ukizRdZn6ulBB3P/LJ0fWTIDgNIPIWu0+KALmEn0wW+41Zb9lO6mem0d/Auflg1c8
	U0BvMetynv53DbmbbBLxw5R+JrGVwdJuEZuYbKVcUkrvIudlEZl07dDrsiYvyCLhFTP3QRDAbYw
	Clu/qh3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jul 2024 03:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111310

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/procmail/procmail_3.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.22.bb b/meta-oe/recipes-support/procmail/procmail_3.22.bb
index 16917666a..abb87f993 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.22.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.22.bb
@@ -33,7 +33,7 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake -i TARGET_CFLAGS="$TARGET_CFLAGS -Wno-comments -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
+    oe_runmake -i CFLAGS="$TARGET_CFLAGS -Wno-comments -Wno-implicit-int -Wno-implicit-function-declaration -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS0="${LDFLAGS}"
 }
 
 do_install() {
-- 
2.34.1


