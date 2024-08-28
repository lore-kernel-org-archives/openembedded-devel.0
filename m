Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8A7C54795
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8719.1724833543924964378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sGji8Hq5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833544; x=1756369544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iiXFuT/MjmXleNwwtsP13BUR+XKqw08bLSwAuD9S0B4=;
  b=sGji8Hq5t4ks/YpYWRYsDRKeQOZl7nTbrQSHsp8LAJDY0WIRpUMEkVE9
   1zJzxMGN5Mi0VpVvUjqsDr8PoNZGk3EEQuYUuru817hsHacAC8MQroT0L
   jL5eNvfSuJSgVRVlb9XaM1BHYfZ2EeTXyFDqaTWA6sqDFssdkwKLsS58E
   uKhVVfbYXzpuiAzXh8t+aBhQvk0Xhr40dNSfxftNRxoKzacZxnjB4E0xT
   1UOIWMvfuNSt8SuMJhETgzVNh0yABzLE4hyAoctGID9xxLLrlWVt0jpXi
   WO98lAemSScfhNHJcISx4auWjUNTjqHnQY+fO9jKGjIrZd7TAV3dW2BLC
   Q==;
X-CSE-ConnectionGUID: 1AaoxHatQBChfgMMfhVGZw==
X-CSE-MsgGUID: dijIf2p/QkKo4YowPz7cuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171866128"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171866128"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:42 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C74F2D5A47
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1475CCFA5C
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E23B6BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 371D41A000C;
	Wed, 28 Aug 2024 16:25:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 14/46] networkmanager: upgrade 1.48.6 -> 1.48.10
Date: Wed, 28 Aug 2024 16:24:52 +0800
Message-Id: <1724833525-2162-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-0.218600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKN5v0jh1hv25cFdomgH0lnFEUknJ/kEl5lVdRvgpNpe/oLR4+zsDTtRcD
	SKgj6IG0E2VoGE2sb5nP57wf+8yEh0LPR/OoCUStlGvZ1CCk32eXLXcCBASk0kpdrHFL0hp+mZz
	+BXrqoxn1xqSXVt27pVhCNewNSLovyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111991

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{networkmanager_1.48.6.bb => networkmanager_1.48.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.48.6.bb => networkmanager_1.48.10.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.10.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.6.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.10.bb
index e9284a29b..a9b9233b7 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.10.bb
@@ -44,7 +44,7 @@ SRC_URI = " \
 "
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "e65c496e06631a4977c795c0f248598c39c340e5635d7cf54ec3072acc998995"
+SRC_URI[sha256sum] = "5dc188fdffcf2d23c89d34b1e6319a6b20203e12eaec24b30037b7ea8ac8c613"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.34.1


