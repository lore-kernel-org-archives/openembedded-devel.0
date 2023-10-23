Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A81CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:21:19 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.116155.1698049275575418592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="136999362"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="136999362"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:21:13 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 002C6D6187
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:21:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C931CFB67
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:21:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8053734786;
	Mon, 23 Oct 2023 17:21:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libcoap: upgrade 4.3.3 -> 4.3.4
Date: Mon, 23 Oct 2023 16:20:48 +0800
Message-Id: <1698049248-24519-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10--0.583400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrwpoFhxXXuNDa9yHV8yqYjznG
	P45AxioiMzTo2qNcI5YNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDKa7IVNHJKd7gwxXcerFDp6+/CYwUsia6FvTnqYKYXTRn0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtZeVgXAUu98R+C/wXimJYRLxH5uNo4V6QzmAJR5bbJtqWHwnHLC9OIxwsj
	F0MqO22jVTllv+0ObsaYwwQ1BByM6M48xdG1IY9HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105639

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Clean up use of tags.
* Support for MacOS with Contiki-NG builds.
* Support for Windows with OpenSSL 3.x builds.
* Reported bugs fixed.
* Documentation updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcoap/{libcoap_4.3.3.bb => libcoap_4.3.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.3.bb => libcoap_4.3.4.bb} (97%)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.3.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
similarity index 97%
rename from meta-networking/recipes-devtools/libcoap/libcoap_4.3.3.bb
rename to meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
index 6e5bc07c59..20bdbee252 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.3.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.4.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1978dbc41673ab1c20e64b287c8317bc"
 SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
            file://run-ptest \
            "
-SRCREV = "9cde7cdee171e3f47486c6e70d479fdf49f3d2d6"
+SRCREV = "5fd2f89ef068214130e5d60b7087ef48711fa615"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


