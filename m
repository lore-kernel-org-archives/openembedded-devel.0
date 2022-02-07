Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96AAC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 00:34:21 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com
 [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web09.16196.1644194060225152896
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Feb 2022 16:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: shin.matsunaga@fujitsu.com)
IronPort-SDR: 
 WBKKLd8Pj2wDSYHJashD4SUTWFFZCQn3GVaB8QbnfI++/86CANE8wI6yRgyHTE2xuZy9N3eJsX
 buy0+VaYFrtCcwaguFieI66Kc6mXtPEWY7EoP+SrOpuNd4et4MmGjrOXYy1PyXziuVG853jOz4
 CvWPmGRRqsSBoFVYI5tXchZdEuMsV4zhp8WAe5uhmgIh3sA17v1K+54VWaCeeXw974r5yfhZyh
 VxJxIEc4PCbmAvPeCYnyfDJJEAgfV/KspUJdAV0CVEmudbQnCwwuIoJ3flMwV/CTe1f74h5h4h
 0wTdoK6PhrG5je/wH7oRd2O5
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="41545498"
X-IronPort-AV: E=Sophos;i="5.88,348,1635174000";
   d="scan'208";a="41545498"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP; 07 Feb 2022 09:34:16 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C9D20CA263
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 09:34:15 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 25774CFBC1
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Feb 2022 09:34:15 +0900 (JST)
Received: from localhost.localdomain (bakeccha.fct.css.fujitsu.com
 [10.126.195.136])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id 175F340063B71;
	Mon,  7 Feb 2022 09:34:15 +0900 (JST)
From: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: shin.matsunaga@fujitsu.com
Subject: [PATCH] openldap: add CVE-2015-3276 to allowlist
Date: Mon,  7 Feb 2022 00:30:45 +0000
Message-Id: <20220207003045.3300116-1-shin.matsunaga@fujitsu.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Feb 2022 00:34:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95236

CVE-2015-3276 has no target code.

Signed-off-by: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
---
 meta-oe/recipes-support/openldap/openldap_2.5.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
index f3b8c6c98..a170b135f 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
@@ -236,3 +236,6 @@ python populate_packages:prepend () {
 }
 
 BBCLASSEXTEND = "native"
+
+# CVE-2015-3276 has no target code.
+CVE_CHECK_WHITELIST += "CVE-2015-3276"
-- 
2.17.1


