Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7940AC5473A
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2885.1722934018508117382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hLhokHbY;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934020; x=1754470020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=N1CAVZ+syzSaZJHb1E2A4N07EsvEKw/l5s/fRUlK0Vw=;
  b=hLhokHbYCqqnNui9CSo+ol4f/f5MA+IfFt4q1AdgtegEhhcfafdjoBGn
   Td/iU2AsddyE2JoQD4/4xqGlhZc5RLNRK68wPWfv0skStU5kaA8j611bu
   t2jXMCKo8iuRWFGrRPQfWTsiMUxDBh7IyczMwBXjmMpNEmBfV0TfFL7j+
   5thesHYyXGxTdGkBisxEPpBi7+w1oc4v84RJwPCbppmYgW5/kNCrEU8XV
   U5dlGJZCayE2WCNlbSvaX0zCP7gzgoRj9NGOkgJ0ukmU7g3eNWvpHh8RT
   jF4+BkHYYD5absrLod660jfBkdS0/Pr78gqnWZiLbO1u68KWdrURr0qHW
   A==;
X-CSE-ConnectionGUID: VRdGmGJTRva6mNeV5yYDrw==
X-CSE-MsgGUID: SHABSv/YRW2GmuG50jAE4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="157332581"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="157332581"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E9D28C68E2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 456B6CFBB0
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D2D0C401B2
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 818001A000D;
	Tue,  6 Aug 2024 16:46:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 28/60] openipmi: upgrade 2.0.35 -> 2.0.36
Date: Tue,  6 Aug 2024 16:46:02 +0800
Message-Id: <1722933994-32549-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--0.451400-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ5D53rZ0sb/UkjllSXrjtQFEUknJ/kEl5lVdRvgpNpe/oLR4+zsDTtoub
	v1b7BWh15PeRxI4QJeLb4k9tG/dcW4oJB2vCxF4zBD0AfbK0Wh5lehvUy76PPmEw0Trnc+ZdmAf
	9okwfVvimfCt0b5MDa2ViwCNfRixHyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111542

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openipmi/{openipmi_2.0.35.bb => openipmi_2.0.36.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openipmi/{openipmi_2.0.35.bb => openipmi_2.0.36.bb} (98%)

diff --git a/meta-networking/recipes-support/openipmi/openipmi_2.0.35.bb b/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
similarity index 98%
rename from meta-networking/recipes-support/openipmi/openipmi_2.0.35.bb
rename to meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
index c7c757367..74c5ef220 100644
--- a/meta-networking/recipes-support/openipmi/openipmi_2.0.35.bb
+++ b/meta-networking/recipes-support/openipmi/openipmi_2.0.36.bb
@@ -34,7 +34,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openipmi/OpenIPMI-${PV}.tar.gz \
 
 S = "${WORKDIR}/OpenIPMI-${PV}"
 
-SRC_URI[sha256sum] = "b059114f6299d73f04ff6e76a0857a0ab81aa362dee99644d256b223872437ad"
+SRC_URI[sha256sum] = "a0403148fa5f7bed930c958a4d1c558047e273763a408b3a0368edc137cc55d9"
 
 inherit autotools-brokensep pkgconfig perlnative update-rc.d systemd cpan-base python3targetconfig
 
-- 
2.34.1


