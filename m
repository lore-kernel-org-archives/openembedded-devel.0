Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D7AC27C78
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:59:08 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2441.1718161137738864048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n2p0AbiC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161138; x=1749697138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kQjgaIC2/YgE6rVUxjTflnf4xVAje0otrayxylj9ytY=;
  b=n2p0AbiCTKTDr0zbhRLHSQL8chrrJ1vr6gi9p8SIqyqe9UaaBpQ1x0CK
   ei95i41r+yla9f/jIdWQlf4MbkhPB2zfEyV3bDvZBWjMaFSmwFx712ANL
   4dHWbsKDw259HwtPRki5uNoW71zR7VaH+v8tm2ZN1cpvtnyLYuQil987X
   Cu/ExrKw/rmtt/knwLHolNKE7Y4qcBWhFy+QDtWB1dvkDoZObViHK49JT
   MAZunsDzMxdPvma+YJ4yO7Aj4AxQXN/D+qFAo3TplkS6r0Ji/i3QQPmqA
   c6o+Xh3bEudqfs3sKo/dt/QjiWQ7APRb2Ntb0nmpjMb0X0AbpjRm1CQDG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="161975309"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="161975309"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 675B8E8523
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A507AD50B1
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 38ED520071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8792A1A000C;
	Wed, 12 Jun 2024 10:58:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 39/43] sanlock: upgrade 3.9.2 -> 3.9.3
Date: Wed, 12 Jun 2024 10:58:12 +0800
Message-Id: <1718161096-29710-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10--4.060700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9etGD01Yl1Q8gyR
	/7/OH+yjoftpkb0YXswNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl76S7Hfu9IUxKpd
	i3M+FP40B1Zf5g6WzCQRWs9urnAvnQSbmi+6Hy02qFx2c/3V5cZi7ngo5v+d0myiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKhZI8LdjeeCjg/utIuPFqdqXsO1hzMtGkj/2Gr4l7psMoE7
	38l7LwQsFIBl36rTqWfn2nk65oEeLcIAs8SV3WRevYBJgaljvpLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110876

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- skip delay when same host acquires delta lease
- improve handling our_host_name

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sanlock/{sanlock_3.9.2.bb => sanlock_3.9.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.9.2.bb => sanlock_3.9.3.bb} (97%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.9.2.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.9.3.bb
similarity index 97%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.9.2.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.9.3.bb
index d369af1c6..3b558cafc 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.9.2.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.9.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
            "
-SRCREV = "e005fbec2324aa8de7e2f302e5a17483c525b1d1"
+SRCREV = "79b35bba8298f4444923c15e11bed38380cb18ee"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


