Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F98C27C51
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.10751.1715677832189086197
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R+/Qki5m;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677832; x=1747213832;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=V9z7KUKp/bmK7UKs4GjP/0zkRnFDlmR4PCO5H9KgXBY=;
  b=R+/Qki5mzpQDGiIa9A0gPd4+1ZQJf+CBQYsawfLbNDBWB7pXCCapaMZl
   rvCAIhjwvrQBV6boZJM5B8Erdl5lze5Yw7+QmGHInoVZp1Gv3IFc0rtQ5
   tzYitGp+NIXq1lLShYSxxog0WruYqNbNEXHrOwruraH7vQuzIyJadO1nM
   +WojfyCt5PJWa4IDJT6WIU63j0vgs2AIb0iQpqF3kFLft/BRfwc10AbnU
   8mvydkni82KeJKTT5aUEkORpR0f4aw9OOq6RCNXloymQGMG3NI7Yx8bgv
   du6x+uZ/BSto7QoYHxiaRh6AOunSF5VX36SXGFonyCU+69PSuGwV6OHw2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="158300493"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="158300493"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B91ACD6DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DD349D3F30
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CE7320091416
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ED1CA1A000B;
	Tue, 14 May 2024 17:10:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/44] nano: upgrade 7.2 -> 8.0
Date: Tue, 14 May 2024 17:09:41 +0800
Message-Id: <1715677817-2223-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-1.310600-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrsVwPMKjZm1ZeGtGjUrjdVVV2
	nPDrzspKoO4V4RSl8ocUe9+E+LEBJGdR1HJpsaceYrc32n84WHq6G/3hYXpyaefdksK3etFJCs/
	VLs0J6ZOSDWfGWrDtR8Yoh/qEF/tVATh1ufKMwlpO5y1KmK5bJRSLgSFq3Tnj31GU/N5W5BA0F0
	5EjNwjhg53fVvb76Db7NA6/n3MGWciXL+V+zm5id0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtuVfc976pNyqQBpYDywEqw5SOxrPDT/hUnFPMRXilebaCE4tvIFsxPjTaThckkGmGR7EX
	t+GQ3Mo56USBuDa8x8tjEEycY9A5YE34Tqx99sXyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110354

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Above modern bindings are activated also when the name of nano's
  executable (or a symlink to it) starts with the letter "e".
- To open a file at a certain line number, one can now use also
  'nano filename:number', besides 'nano +number filename'.
- <Alt+Home> and <Alt+End> put the cursor on the first and last
  row in the viewport, while retaining the horizontal position.
- When the three digits in an #RGB color code are all the same,
  the code is mapped to the xterm grey scale, giving access to
  fourteen levels of grey instead of just four.
- For easier access, M-" is bound to placing/removing an anchor,
  and M-' to jumping to the next anchor.
- Whenever an error occurs, the keystroke buffer is cleared, thus
  stopping the execution of a macro or a string bind.
- The mousewheel scrolls the viewport instead of moving the cursor.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_7.2.bb => nano_8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_7.2.bb => nano_8.0.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_7.2.bb b/meta-oe/recipes-support/nano/nano_8.0.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_7.2.bb
rename to meta-oe/recipes-support/nano/nano_8.0.bb
index 0642287c9..56aa47f64 100644
--- a/meta-oe/recipes-support/nano/nano_7.2.bb
+++ b/meta-oe/recipes-support/nano/nano_8.0.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "86f3442768bd2873cec693f83cdf80b4b444ad3cc14760b74361474fc87a4526"
+SRC_URI[sha256sum] = "c17f43fc0e37336b33ee50a209c701d5beb808adc2d9f089ca831b40539c9ac4"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.34.1


