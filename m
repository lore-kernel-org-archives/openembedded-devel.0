Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00301CD12A1
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:44 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.39471.1711983092271528304
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H0Dq/+77;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983097; x=1743519097;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=a9qN/lFVGydsBrQYI9uKRn1AgYtlndR26jkDZ1Wi1sg=;
  b=H0Dq/+77CylsBurfpO9fuDTQjeBIvpdRpnJUaLoWSoCQdlwqCEhSXGCC
   S8NZu+h8kvvF4hszjHp8zyOv0g8xAO7rugWIHy4/biaZzyIKMz2Kj2iNv
   UcnmgirVDZ9GFrq3E2ji9fZIp2dPCZiMvZuqqkXIeNa5qvJfa4l3NthRf
   jNym2DdWbyJnj5g0Wa52p1Mfu9YUZsOh2NmSSMu8euXrfD10dLSD+3tan
   dDsaimKK1zN7/twoJgcwh6ERP3KjLNLpXJuzkuU0PU8ih4zoquBqC0Ej7
   xhiHYeX7ex78Rm2gXG2D74NMe0TLtjuu8UC6Le5i7Rz+X1DI+iws4TfiI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133053926"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133053926"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:36 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9751BD3EAC
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DAD9DD7B62
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C32521EEEF
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 00F7A1A000A;
	Mon,  1 Apr 2024 22:51:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/47] python3-flask-marshmallow: upgrade 1.2.0 -> 1.2.1
Date: Mon,  1 Apr 2024 22:50:50 +0800
Message-Id: <1711983079-16849-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--0.722800-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv+Aw16GgqpO5uk
	y+ZQoKJG4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyWY5v+NllnxQoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJoxwfOy5V4BzVGbnXl54kfX5hpt05wNWN8cz
	kCoBHYZtVKaMxK5ybS0A9v3RjjAfobrKOCyX0G+ocAJ9XMXFXClCPtu16bcPH+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109734

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix File field when it receives an empty value
-Fix validate.FileSize to handle SpooledTemporaryFile

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-marshmallow_1.2.0.bb => python3-flask-marshmallow_1.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-marshmallow_1.2.0.bb => python3-flask-marshmallow_1.2.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.0.bb b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.1.bb
index 573b20291..8408ebd7b 100644
--- a/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-marshmallow_1.2.1.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "flask_marshmallow"
 
-SRC_URI[sha256sum] = "d0f79eb9743f0c530a3d9e848503e1f2228e6b35a819c91e913af02e68421805"
+SRC_URI[sha256sum] = "00ee96399ed664963afff3b5d6ee518640b0f91dbc2aace2b5abcf32f40ef23a"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.34.1


