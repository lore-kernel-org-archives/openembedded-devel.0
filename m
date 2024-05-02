Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882BFC27C42
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.6690.1714628982458041676
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P2ooHEGk;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628983; x=1746164983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bT/9P53S7Yf+bIIhcYAywkICr0RictkCjvNJGVatAno=;
  b=P2ooHEGki9NwmNlkVzfPm8979tgp2hXL+mLP05GcM2nKaUtLA1B1r98X
   KXPQLFSBVsQqpmwx6GPYdXl5bL8J6sq52YcJACI4Y3xjt+chR0O822gLb
   kFyyuZPEgeCUG8lh8+RrwztVj8hnvw/ggQTp4mlDYB6sYyV8sorpWpeLG
   vyj8oQWMm4WehuAFGT8kWOSTZ0M79sOrvA+ONcoiSxUacF+x3lWclL7Bi
   gP4Orsyp1nkeUZoDxf5DKd0UGkSv2HY1dJGZKjpBv0zfarPyQgo9SHVcT
   WvTS0HoPFQ1qgnFbuMEAZCZ7tdfLkmJ0vqBA9EMhTAnA575bs8ZpiAGtk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="156670730"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="156670730"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D2BE3D6F02
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 27467D7B61
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B8074223FE0
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:33 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5BDD01A0002;
	Thu,  2 May 2024 13:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 29/30] tracker: upgrade 3.7.1 -> 3.7.2
Date: Thu,  2 May 2024 10:48:28 -0400
Message-Id: <20240502144829.241208-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--2.513600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJcQ/FXybE45oadzrWEfJJMOjf3A4DTYuHpKYVp5Qz29/lRTIgxjQatoXZ
	EgRzN0sF3vWnifSZNM3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5W3b
	vAFichtg4lVn2y0GIpxcGKfOcUahWeeFl3UU+9JDKFk0hKPi2F89o/yAbAxbsudRrCg/2l+iP8L
	pLFOwHzjDyhE0OaSPNbjBuldNvkMkoq97WSHdFjfupJaud1uZCfRs6uIbkFVw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110237

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tracker_3.7.1.bb => tracker_3.7.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.7.1.bb => tracker_3.7.2.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.7.1.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.7.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb
index 1d5c79ab4..f3c482b27 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.7.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.7.2.bb
@@ -22,7 +22,7 @@ DEPENDS = " \
 inherit gettext gnomebase gobject-introspection vala gtk-doc bash-completion python3native
 
 SRC_URI += "file://0001-fix-reproducibility.patch"
-SRC_URI[archive.sha256sum] = "cd91b885ee9839cde5387f8e05ed24a7108d1627629cb6b1b2aa51a9603e130a"
+SRC_URI[archive.sha256sum] = "debcaa291e46afadc1cf6a251f17efb02440aa48bff643d78c61123807dce00f"
 
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
-- 
2.34.1


