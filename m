Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1B1C52D71
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.33823.1721034173910166008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jkx7KGX8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034181; x=1752570181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=f0Hh3bMqpKI12fSj/Tg6Wji9iO4jnBVGAg+Gwf1S6hs=;
  b=jkx7KGX8GDGmqPK9yl1HrX99VpcgU/FVGHLLXS8MQIeJRiwmJouP79fg
   fYkQoCoslLqWYnQJB4SZr56MaZeR1mA03cGGpaQIRSOLUFfqNYV1/I9aH
   2+tuxq3pnDBOhc3TrBaPIMaD/5oqRfPsMoCA02xX5B+o+laRV1ryjMN4W
   d6LC4iaf0Qie9S9diIpy/IQffJIIAwAzkIod9ql+iSMdnNRYQE+PpyvSD
   uz7brURrS82KHYW3tvHOqsfDfp9iEsAxeKBBk/iGCIrPCMEV48S5nzkiF
   FGcrfp1dw6lO3UqzCDVkOpjZd1KOmEeDv6Nd7MvzHK5WeRNX31PvIcSaV
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="146374030"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="146374030"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 72BD8E428A
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id AB621CFB6D
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 336D86BE53
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D7B7B1A000C;
	Mon, 15 Jul 2024 17:02:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/38] python3-moteus: upgrade 0.3.71 -> 0.3.72
Date: Mon, 15 Jul 2024 17:02:13 +0800
Message-Id: <1721034151-540-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10-5.315700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrYjDXdM/x2VO4IXQ3z8dnaktz
	eDL7llW4VoDres9eB4s7rpOW1/ZEhwzfHIULUa4skCThXPqsqiuZmLDnd2pI34+FcgdQoKJ3vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBCE2NlBjIjcB1VGYAjOG0CjxY
	yRBa/qJcFwgTvxipFajoczmuoPCq3N6k4LF/WByfFJugi0a2vcZegEFA6U47icL36FqvI5v3cMr
	ftFgDHSXKn84rS/vwD2zqZnYlSjW+2wBwsqBXecrmM+Mhzy8Qd+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111338

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Properly decode AksIM-2 warning and error bits
- Make MA732 trimming for off-axis applications actually work
- When encoders are no longer active, stop using them and trigger a fault
- Limit the commanded velocity to something physically achievable
- Fault if a non-reducing gear ratio is configured without overriding
- Default bemf_feedforward to 0.0, and fault if it is configured non-zero without acceleration limits or override

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-moteus_0.3.71.bb => python3-moteus_0.3.72.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.71.bb => python3-moteus_0.3.72.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.71.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.72.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.71.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.72.bb
index 54c53afe4..be560c718 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.71.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.72.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7caa994ad7ed2b0a219b20e4a2e83b6bad01e549402c38a264f0d83d560d7908"
+SRC_URI[sha256sum] = "3aa30eea9ab9bc7209ab7c6f382650265ab648663edead5c54d69d9f0a3fd36e"
 
 S = "${WORKDIR}/moteus-${PV}"
 
-- 
2.34.1


