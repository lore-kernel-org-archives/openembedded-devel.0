Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5572C25B7E
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:48 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.12692.1716860977605935354
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j3Jn/nDI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860983; x=1748396983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IxsPV8PcEgZV6oD+RdbRL83355PDmJb8hgNQbL3LYoQ=;
  b=j3Jn/nDIHlt9BIpZcCYL3rLqTfBMsukXZCitfmsW3wU0k/YXjUavzghV
   13VUpQxvJaLlQhwnk9P98ljtFLVTl9ejiRunp+YjpV7B+eL3AOlyRDEbO
   MbIVeYtD90naPmSpmJXTtg/YNVPCCu/wpW2kuUJlPWYJwMVkpDUCjbge4
   /fwQm3RRwdt8jKh/ap2dT9dY1Yl5rfkv7tzI2kPLPWhzCeXawDBKROIp+
   h0QtxsZU8r8gRLVWXiPhDqjKp6uOmynHiH1DmRBN9s4yEFS7wGJiHXiLs
   kMPqrjpKJzBWpWI5yd1Ed6ymY1h/wjK7dOLJ5WWmrF/SNXE4S6kl71N8I
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160605081"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160605081"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:41 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 96DA6DE571
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:34 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C52A8BF3C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BCDA411AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0AA061A000A;
	Tue, 28 May 2024 09:49:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/40] python3-platformdirs: upgrade 4.2.1 -> 4.2.2
Date: Tue, 28 May 2024 09:48:01 +0800
Message-Id: <1716860901-863-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--2.330800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrtwvME24mZU4UWpzATs/hIixX
	wd9S2XGh4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2a9vZBFSQyQDnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFP5XB5Pd4JrNgPwfIbvUbMKVtU
	u60O9JoVMdVtR/T8fI3UXCgmj4MuZqwtjl0DF8hkMqxyBjy61KEMMOxlYnD64ocXCKICwjoOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110554

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 ix android detection when python4android is present

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_4.2.1.bb => python3-platformdirs_4.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.2.1.bb => python3-platformdirs_4.2.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.1.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.2.2.bb
index 5f0aafc93..5821aedd4 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.2.bb
@@ -7,7 +7,7 @@ SRC_URI += " \
     file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "031cd18d4ec63ec53e82dceaac0417d218a6863f7745dfcc9efe7793b7039bdf"
+SRC_URI[sha256sum] = "38b7b51f512eed9e84a22788b4bce1de17c0adb134d6becb09836e37d8654cd3"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


