Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B89CD129A
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:54 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.39488.1711983109308055610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ADdFnimz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983109; x=1743519109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YFIyHP2WTB42rC8Yzud3ixHpEtX9HHV7l7U8qxHkkNI=;
  b=ADdFnimzoKEtOEPLUhjgTxwk/Zjm9rGv4W5R/ZzXNyp2X7ITGG1jTBGJ
   024oSKoLkQPcJUifDn6HqLgyIgkbTtayVrTI2mesPM+mRlcz7IKa0LWPa
   O08BK+aC0DObTYb0YJ+F0CZ0+rI8BWUgu23N/Tz29ri7e0F3eeLABNAAJ
   jOVOIEs2nacWjOBqfbSVjUkIru58xrzQZca1jbB42tNkEmTKTDfKjptT7
   hRFl1VS0fsfibwLEKZ6F1yMj75wS9F1UgPVK3c8dsFINFUhMoSZfu8xQR
   Yy663Fy+1+9hlRasrWtgsoI9VVTMpKOuvuTLWmzQEKQvKNUhRvdf675pM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="141867304"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="141867304"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:47 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06CCE5AF62
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E51FD620F
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C0AD320093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 77A511A000A;
	Mon,  1 Apr 2024 22:51:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 41/47] st: upgrade 0.9 -> 0.9.1
Date: Mon,  1 Apr 2024 22:51:13 +0800
Message-Id: <1711983079-16849-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-1.259500-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yfx0ykrbAxjCchr4pBLGIvAH8UzOewTxw78F
	Hrw7frluf146W0iUu2vMJYD0aRF0Rbtj8w9EqUz13QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrQ1KR9+428TZu2tR7/4o/sAdHvpmwKDauHoqtx6Bezt/rRjm2Q0Q+Kiqgx
	wK6rxus9s8FXBuOvxobk5tdHLO31MvAxcH2HoNAR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109759

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/suckless/{st_0.9.bb => st_0.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/suckless/{st_0.9.bb => st_0.9.1.bb} (90%)

diff --git a/meta-oe/recipes-graphics/suckless/st_0.9.bb b/meta-oe/recipes-graphics/suckless/st_0.9.1.bb
similarity index 90%
rename from meta-oe/recipes-graphics/suckless/st_0.9.bb
rename to meta-oe/recipes-graphics/suckless/st_0.9.1.bb
index 517d467ab..18499cf3a 100644
--- a/meta-oe/recipes-graphics/suckless/st_0.9.bb
+++ b/meta-oe/recipes-graphics/suckless/st_0.9.1.bb
@@ -7,7 +7,7 @@ inherit pkgconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "f36359799734eae785becb374063f0be833cf22f88b4f169cd251b99324e08e7"
+SRC_URI[sha256sum] = "16f43b9433ade9d70d6085c31f9fd99f2835eaade31221020f22143035dfc0d2"
 
 DEPENDS += "libx11 libxft fontconfig ncurses-native"
 
-- 
2.34.1


