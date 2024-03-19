Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D230CC54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:47:07 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.8167.1710827218453424876
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HuUKLEq1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827218; x=1742363218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jUgzRuvwkeudij8FOO9Mv0gwF9yogi1Dql4wLd6qM+Y=;
  b=HuUKLEq15ctJUCJlbJoez78d6pxxgOY/J19NWXoSZdNApP/XMwtTUteD
   OtrpPTrSTDN2Ebhr5T5VglPTWmUwG0XRvRKBGBj35ArjSOYDScfyRFNaU
   MXzMCQQHll8BSmB6Pi0nl7qeVyQzJJ9IXKezDICGAc1aYUHU7zqMHyjrk
   /oKXOnGBsAo+Sr+tMOSdX+H9+mCvQ+1rXIxldqC1VCueyuJM2Uw70lPDD
   pF0XOfhTyeytaLa1GKmhaU/x+5PpGTTrnZcC9mjE48INxy44Nr+YOBt4I
   krc4OLBCgUqsyiYOLx9hMvTDb8QrsT+Qwd9vS2AB8TLLAOkBCZQ+Hf8o8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152721927"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152721927"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:56 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A485D4802
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CF9BD561A
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BE8721BD45
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A9C851A006B;
	Tue, 19 Mar 2024 13:46:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 49/50] xmessage: upgrade 1.0.6 -> 1.0.7
Date: Tue, 19 Mar 2024 13:45:38 +0800
Message-Id: <1710827139-30056-49-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--7.260600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrfb+ZO7kHlEjk6Qbi+9i6D2Ma
	pnFC68XmXgmHhIV1tHtS1/spX4apEdGETJv1/WyONcwCMbCA8ajVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibIAcCikR3vq+gMXIQz044m0YiYKnFyo/uRI0Xk0o8D6BvcNEIBpZ+6wV3G
	fBHKow6
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109466

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-configure: Use AC_SYS_LARGEFILE to enable large file support
-Add -version option
-updates -help option to not require successfully opening a display
-Print which arguments were unknown before giving usage message

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xmessage_1.0.6.bb => xmessage_1.0.7.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xmessage_1.0.6.bb => xmessage_1.0.7.bb} (72%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.7.bb
similarity index 72%
rename from meta-oe/recipes-graphics/xorg-app/xmessage_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/xmessage_1.0.7.bb
index cb123837d..6682784fb 100644
--- a/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xmessage_1.0.7.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73c7f696a728de728d7446cbca814cc5"
 
 DEPENDS += "libxaw"
 
-SRC_URI[sha256sum] = "d2eac545f137156b960877e052fcc8e29795ed735c02f7690fd7b439e6846a12"
+SRC_URI[sha256sum] = "703fccb7a0b772d61d7e603c189b9739866aa97ba985c727275420f829a30356"
 SRC_URI_EXT = "xz"
-- 
2.34.1


