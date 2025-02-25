Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C54EC282D0
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.2201.1740525897971903896
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V3xNNhNA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525899; x=1772061899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=z9R/7beXVvR6KQy0NV8nu40LGN6X0De7dHzDb3W9QGU=;
  b=V3xNNhNAhOAl06entlaNSWwFFbL+Ym4xVSAVB1HsFZCei4F+pjyhNB5r
   XF0zS4Uf8PEG2xWvmgSFKGTOYHZljTKQJrOYrCW1SYrCBj6d0AyZdeyyp
   7EOSNhuiVc4Js6nfNcXFnwXhtY7EtKcsqGtpkSzk0XtBq/FmVr865eKnV
   LdNoQKSjDfwcvXI1gevDvTOxNGT3goH62RFb9TpQY6witAxJAomnLn2+J
   K6CanB98+dpEzPXBgEc+b1cxqOWKtXeNC927BO2NrPFto52XKgyvHPzDf
   TmBhLcBN8okpsSkE5AOAtQT9GRrdgV9UvzxnxDdRmuii2drgM9LXl9kku
   g==;
X-CSE-ConnectionGUID: Kq6Twh82Q4yp3NM71DpCPQ==
X-CSE-MsgGUID: /s9OArFqS3iUacbowh95jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="193783214"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="193783214"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:56 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C841AD4809
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9135FD7298
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 349971A000B;
	Wed, 26 Feb 2025 07:24:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/51] icewm: upgrade 3.6.0 -> 3.7.0
Date: Wed, 26 Feb 2025 07:23:59 +0800
Message-Id: <1740525881-21103-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115612

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_3.6.0.bb => icewm_3.7.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_3.6.0.bb => icewm_3.7.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_3.6.0.bb b/meta-oe/recipes-extended/icewm/icewm_3.7.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_3.6.0.bb
rename to meta-oe/recipes-extended/icewm/icewm_3.7.0.bb
index c6202905d0..2200a1973b 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.6.0.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.7.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "979fafd3a3371f73cbafe592e2be052475637ac4bb4385bb132331fd6924bc76"
+SRC_URI[sha256sum] = "7828ca860d110c54afceb9fa57f8171a3a857feabe5d45a427f30b788f38f6a8"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


