Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED89C54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:06 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8143.1710827163397527694
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y9XKTL+M;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827163; x=1742363163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gILp4xydy0zJmoEveMB9tv3y1yHaf5ZPSA6ig+Q6TrI=;
  b=Y9XKTL+MqVN5x1gRFsHkUMpPOulsM6hKvcyNjVaS2yj4zuhMHUheJ74b
   p433It4mqoJGpXqRsny6dd/tg+5YakzttL0ekKMDz97ciJ/xYZSf4xyqM
   8sl8rvb1agpz6+D5Q5IfxvGDhnupjUYFPZxEAMel85N8S4dyhhkaAXPS9
   UYkJrlva4NhD3dfwgQsRofod2lKlYCsVmkr3oaj5FmW4DYKTlSRwptbSY
   veki6Qor07b8BB60JQKP74tfLhYhzldEtA338Y1FL/ILZn4lFGqazypMY
   koidHuT71m2ODiuBkKLzrfgHa2HNg0K2u7KVAV3+wlN6QZlmdG54JEcKf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152144770"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152144770"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BAC0B15FA8
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:45:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D8F8D7B87
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:45:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CF8F21BD45
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:45:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 04E6D1A006B;
	Tue, 19 Mar 2024 13:45:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/50] ctags: upgrade 6.1.20240225.0 -> 6.1.20240310.0
Date: Tue, 19 Mar 2024 13:44:51 +0800
Message-Id: <1710827139-30056-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPauLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJRsa+0tFX+C5ioaS7Bpknb6+lQ/zw3NVL8eO
	ItjRV2Aye/wfqUnrbuwmwcKDTnThRjkOwmO09gTYO6BQBoPE8B2PS3hnpw3s/+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109418

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20240225.0.bb => ctags_6.1.20240310.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240225.0.bb => ctags_6.1.20240310.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240225.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240310.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240225.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240310.0.bb
index e092800d5..d4ffbb7f0 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240225.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240310.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "5d8c5927aa7dd7c14b2ffd9da3193126ff81cb4b"
+SRCREV = "38fd8e39b877a79666393b90e38400fd8d7d5d14"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


