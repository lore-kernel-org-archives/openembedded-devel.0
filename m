Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1BFC3065B
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:04 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.166848.1719305820468740232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k8gv+VJN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305821; x=1750841821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FkY2OkYnlwZgZ3VgoyFJIeRe0G1671iizdsxtZ+lws8=;
  b=k8gv+VJN+Ia3Cwwtx4xa+OaCknoEFHb05fVK7KyUUe4qsUbcj3LWbC1B
   IEypXuF9FEGPccrimo5Mg3mtvb+Wdz3Ggbgst1rVzbz86ieOF/z099kKU
   c5es103KpKThBRYNzvz/KHnp2lqLD+K1Ap5Pv9go+cytCRaU0XFVuKSD4
   dIV0f3McNjjIxdjEGs32aOpC3QaxFgZM7/fLvWpqdVCRdMN80I4YkHFUW
   aOW4u/Mog/i9Nx7+XECvMLn0i3O08Tc80DJ6wZEVYacKpMy5FMbKpMubP
   1/GL1ekkv7dNGm/dWRGpzcp2lGtP0wWJa7eCQxufajkOpaSwAXEv1CYYo
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164089068"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164089068"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:56:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9029ADB3AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CB5F9D3F03
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 52771E2A0B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:56:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F37FE1A0002;
	Tue, 25 Jun 2024 16:56:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 06/57] frr: upgrade 10.0 -> 10.0.1
Date: Tue, 25 Jun 2024 16:55:39 +0800
Message-Id: <1719305790-11484-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-1.190100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4Bchr4pBLGIvAH8UzOewTxw+z9
	H+EUMUMlIvrftAIhWmLHBvqhRdA8sup0MbEb2inAOjf3A4DTYuHhKQh1LCmGBlxOQqP2lG9go8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXI3B71ga6HHxjg+zyc+TLS5zxZrLEJtxUwwPE
	HGM04K81xdm/Gt1rj0nLAjWAGwlTl0xXF6VE/wDmyTxdQjNr4AdqRN05jAHqH+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111023

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-protocols/frr/{frr_10.0.bb => frr_10.0.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.0.bb => frr_10.0.1.bb} (99%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.0.bb b/meta-networking/recipes-protocols/frr/frr_10.0.1.bb
similarity index 99%
rename from meta-networking/recipes-protocols/frr/frr_10.0.bb
rename to meta-networking/recipes-protocols/frr/frr_10.0.1.bb
index afd2c95a0..20e0ddbba 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.0.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.0.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.0
            file://0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch \
            "
 
-SRCREV = "03a143cd49ed1b190cb38f48a31ef4d71fa01a02"
+SRCREV = "8fb5f22bd89fa6bedcb922b908b955d8a650566f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.34.1


