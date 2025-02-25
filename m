Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C7AC021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2198.1740525895087964817
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L3SuKllI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525896; x=1772061896;
  h=from:to:cc:subject:date:message-id;
  bh=Q1y2ERCejBvrxJ1c8zi1ptVlcGA4EOA8P5SKpeXCyHo=;
  b=L3SuKllIE0XtulvMxHEBm9LzDK/yuWHdc1J7yBD5+a3aOFJ9t1XiigjL
   BcjiriyBE60m1DlqPK9xwoBf2YiKerS9u86m/nHqq2JUTPJC4EJ/h8Atx
   Ok4yi8IZFvsIEQ+iBxDkCTaRLOQeuUOVTtanE82ZKTt6c9Al9+C7enFGp
   TDk3W6Kh1iJA3+hx0YGaat4uLEcDM3DFvBRKucU244IKvAM5dJwNlaDVQ
   VQ6fhrtkka/Xu4KIrjLmTr7XJMgMFeSvgU7791Nsx2N3eS7V70BmXDda8
   mOUqTcGc6GgGyKp4CZImQGi2GihARPM45+quUT05YGF0FtG+p6ibNRnTp
   A==;
X-CSE-ConnectionGUID: PyYEPRC7SDKv6uMQevOz1g==
X-CSE-MsgGUID: l9WxtFG7RnqP6+6XUrKEtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170624521"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170624521"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D1786DBB89
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 93E5FD7298
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:50 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0E81C1A000B;
	Wed, 26 Feb 2025 07:24:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/51] asyncmqtt: upgrade 9.0.2 -> 10.0.0
Date: Wed, 26 Feb 2025 07:23:51 +0800
Message-Id: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115599

From: Wang Mingyu <wangmy@fujitsu.com>

breaking changes #388
==================
- Re-organized include files.
- Removed non bulk read to meet Sans-I/O interface.
- Supported I/O independent (aka Sans-I/O) library.
- underlying_handshake functionality is updated from free function to member function.

other updates
================
- Added invalid combination checking of sharename and nl(no local).
- Fixed receive maximum processing.
- Fixed invalid Message Expiry Interval applying.
- Fixed invalid template parameter comparison.
- Added custom logger example.
- Refined documents.
- Made colored log selectable (by default true(colored)).
- Fixed misuse of bound allocator.
- Fixed TLS example.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asyncmqtt/{asyncmqtt_9.0.2.bb => asyncmqtt_10.0.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_9.0.2.bb => asyncmqtt_10.0.0.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_9.0.2.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.0.0.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_9.0.2.bb
rename to meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.0.0.bb
index dac83065c2..e44ddc58f9 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_9.0.2.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.0.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https"
-SRCREV = "51a97adfd022cf5205c3bb31f38ace1f7fbd21a1"
+SRCREV = "d802dc5491bfb17ea88c04bf9187a62252d64ddc"
 
 DEPENDS = "openssl boost"
 
-- 
2.43.0


