Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B68C27C6D
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.9748.1717664819136228305
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y2D23kYR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664820; x=1749200820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WRWqgFnkKmlwWQ2vPhClsXmuHeWm76wgTMwpQqVvo4Y=;
  b=Y2D23kYRjiSQdatwEEPwJhHYnYKgFAGNKzmbU05KNyxeqvga1WdOgkb9
   zUsfmYrZZKxxvjYn6zl6j/mcdBYY4OEko1wMPQlzyJDKecEJ4raZKXa6E
   yIeNTY0d75xX3L1gt7gQsVL/DFnVR2G3C5FzotgNOWcgPSfMJTO5/XasQ
   KXUO3XLgKF4hYG5jBi2pIQX7X74LRSRYS0aquMr5QaWQhIP0LZ05JNsxx
   0jnKhr1lVGLC61nFGHoJlJjMV3g+I7b82kgLsdQSd8HoSY2dsFmtVB58D
   fZV25WNhScdiqMjh5ftnfymGOgrXxCMXFG13nuKexq67QnLqOCuU+CHbX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="162200490"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="162200490"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:58 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id CE2C4D29E6
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2058FD4BE9
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AD7BEE2B12
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5BC9D1A000A;
	Thu,  6 Jun 2024 17:06:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 14/36] iscsi-initiator-utils: upgrade 2.1.8 -> 2.1.10
Date: Thu,  6 Jun 2024 17:06:13 +0800
Message-Id: <1717664795-13902-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10-1.184400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPaR1LeQ+VpnJZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SB7IMcZOJRFcpFmp80qNy47uZnHBwP6rOqtm2X6HWobCVCY
	iPu3JenKkl2U7poztKQX+la8+Z+0wTOzpj5VTd+pwlxZr/y9CPS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110722

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...initiator-utils_2.1.8.bb => iscsi-initiator-utils_2.1.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.8.bb => iscsi-initiator-utils_2.1.10.bb} (98%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.10.bb
similarity index 98%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.10.bb
index 0f9f34f1f..6a272775f 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.10.bb
@@ -12,7 +12,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "543ba0f15d340b97f30782308cec424a6738fec3"
+SRCREV = "d0f04ae4b9bf0bc0be55fbda5f235afdfbf5dd19"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https \
            file://0001-Makefile-Do-not-set-Werror.patch \
-- 
2.34.1


