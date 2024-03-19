Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E24C54E7E
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8226.1710827208223500752
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oOiG/MT/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827210; x=1742363210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=thf66Qn9iIdKfjB6DTfuuw28lFX4VsZGZHJzPE1+3pA=;
  b=oOiG/MT/3zYm4wY7z0xtf1oIEoSlQH0006AZ5knkOQeQ+VmPH/WDiTej
   8LDH3eACCbHOnfZspX1hK6KgKryvV84jGzU8aZR3pCLlLA9cLLedfIDsX
   j1zBRBQmmFSj3uB2qtEa2z8nOUWNMrSpWjcAz1AQ30zUonKt14jX/3DR0
   WadXM6BbhTnTH8m55VeTCwfj0SCRx3FfWBQt+EeLggaMtzuFOdyK0k2X+
   VpWD3vrWAclQcRyIcE9jFIghxz2YQeZ7ua232/x0bV8Ps/O7GJVo/RIjW
   IDSSk3phK5HeXSrLqnlubscjyYDtmqShP6rIbh/oEi6wlx6WoE1mqRuBo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152562833"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152562833"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:49 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F18214121C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BDD48DADB2
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B5D32009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EA54D1A006B;
	Tue, 19 Mar 2024 13:46:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/50] python3-pymisp: upgrade 2.4.186 -> 2.4.187
Date: Tue, 19 Mar 2024 13:45:25 +0800
Message-Id: <1710827139-30056-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--2.250000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeWYOldwn+9MqL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uhhg
	7W1Bq9cX8x09lec/Dmy5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2mZ3
	96Gt5HhTN+vU42xJIueoWzfQ/D6KexazuOuGu2SgOaL0mO7USDYX3CBF1eG3P72x+It9CW0xBeC
	g1TeDPo2Mf8szkxvfxjW8BVCRlQmPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109453

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Bump templates, version.
- Bump deps.
- Bump extract-msg.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.186.bb => python3-pymisp_2.4.187.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.186.bb => python3-pymisp_2.4.187.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.186.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.187.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.186.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.187.bb
index e9000dd47..31b0d6446 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.186.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.187.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "bdf2d54b297ad890418179b044dd4ea79821fccef723823919d12262e9794ca3"
+SRC_URI[sha256sum] = "6880aa07cc6ed08f6d99df74c310839bce229e2031e1aa24311c74d8b01937f3"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


