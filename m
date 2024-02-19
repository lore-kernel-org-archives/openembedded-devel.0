Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B89C54790
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.37321.1708333364536851969
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HHzFa5J2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333365; x=1739869365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9rDJr7QEarfLwLDOrjabLm/Abh+OlSP09A8zIt4ThmI=;
  b=HHzFa5J2Klx5T+CT1jf5BFJz6u7NQ3uxzFM6iMnEdw0Ohr6+zVMKGYgN
   ZHya3XYX68I6mDANjkrNkDjaHSsWEa3DRZw8nV1j6VR7X3PejWF23IM49
   NKlNIeUCqn8JEM3V/5GP6lttG71Cm+3d1tyVAYllfAJkn/4hM8TrNGyAk
   BPxjbIPuLZnKa4ITAcCm1JnTxA6h2P7Jxn0jbciPGJHm/ADVBKvM5t7qg
   eNo6o7oQFzmg8gX2RLJT9wVAvmF64Fxr8IYSQ6yh2wW04y4Z3ilLPs0eR
   X2anaanaojzN44ZbpUMS/pMKu+lhGkkPi+7deJA8JcFqcwEbmXZbbG7Wr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="129150086"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="129150086"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:44 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E98714DA765
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F0BCD4F4F
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:41 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AE57A21F79D
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5B8051A006B;
	Mon, 19 Feb 2024 17:02:40 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/23] logwatch: upgrade 7.9 -> 7.10
Date: Mon, 19 Feb 2024 17:02:14 +0800
Message-Id: <1708333346-17704-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10-4.177300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z71Wx2uUbPLdlRzZAkKRGDUBc8PVt3Swwnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMO77kyP0TcAbMBUy
	MY/3UnmiH6HzGnoiKXvz0vZpsGW+bD3/husGUMdNGuQI+Ain7iIaOWNkOuB5ChFDSvVJBd14IFJ
	ErU7a73gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108856

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logwatch/{logwatch_7.9.bb => logwatch_7.10.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.9.bb => logwatch_7.10.bb} (96%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.9.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.10.bb
similarity index 96%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.9.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.10.bb
index 00dc2fb1d..2efaa2b3c 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.9.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ba882fa9b4b6b217a51780be3f4db9c8"
 RDEPENDS:${PN} = "perl"
 
 SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "49d2f1e99c9770f56fc3e82a46880e8900b874dfba593e45f599c89fd255738e"
+SRC_URI[sha256sum] = "329df0991b879764ed7e50a869de5b6bfa70d241eb254397a5659d1ff5f2588f"
 
 do_install() {
     install -m 0755 -d ${D}${sysconfdir}/logwatch/scripts
-- 
2.34.1


