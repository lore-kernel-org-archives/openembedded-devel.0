Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAE8C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 03:43:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.61.1718250223918527780
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jun 2024 20:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n5Vs1IMk;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718250224; x=1749786224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=a6x/by2DwtX5HKfSpR6a+FRNpS0EWpu5E3BUAKrPw8k=;
  b=n5Vs1IMkLaSssIgH5HWs2Qk232WKNTOTGZrfl7IJgfwHGTdmR5KEM+3r
   yxm+SG7BHKde1oa+ug9Zbev2qd4T7CH3uqagizRI1wySJms3om10saUVL
   Y42NJGUzIoKDxOWyyAM55a48j/0EEmQFRKwWnLFCd762H6L8yc2YTeiQg
   uET2hIX4s0KgSNW8Q/rDABroc48tUj63EkNWPNGK77kbWd9992ZyOTewl
   jDmIM5D47qY6XQ4EcegDPhQCsWvBq6uNczFRxUgFlYuiXneGGCWgK3zaL
   JCaY9EDKfw6iX7QrChrECTuCCOHQXKX6UCmisdT73t6lUPUGUTkAqJ+Zd
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="141953412"
X-IronPort-AV: E=Sophos;i="6.08,234,1712588400"; 
   d="scan'208";a="141953412"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 12:43:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E9EC0DB3C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:43:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 383FED50FB
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:43:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BE5B92007CA9E
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 12:43:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 696A81A000B;
	Thu, 13 Jun 2024 11:43:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 2/2] libsmi: use update-alternatives to solve conflicts with frr
Date: Thu, 13 Jun 2024 11:43:25 +0800
Message-Id: <1718250205-6029-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718250205-6029-1-git-send-email-wangmy@fujitsu.com>
References: <1718250205-6029-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28450.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28450.004
X-TMASE-Result: 10--3.464600-10.000000
X-TMASE-MatchedRID: 9CLtS+2vXX+txhXyTqc02bstbCLHbulS96ryTp77YeGysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmLy9zcRSkKatcwitucT3dE7s0T0PE+KHuV9LQinZ4QefCP/VFuTOXUTC5M
	umjkcRzWOhzOa6g8KrRRyvgp0XmxWll9T1oRj7RBFehoJATHa0EJgxInRLtCsfrPjnbXxGLN1bq
	V39JC3X9NV6vLbJvR2tcSX9kDeDBslQA8QWak6kR0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 03:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110887

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/share/yang/ietf-netconf-acm.yang conflicts between attempted installs of libsmi-yang-0.5.0-r0.aarch64 and frr-10.0-r0.aarch64
  file /usr/share/yang/ietf-netconf-with-defaults.yang conflicts between attempted installs of libsmi-yang-0.5.0-r0.aarch64 and frr-10.0-r0.aarch64
  file /usr/share/yang/ietf-netconf.yang conflicts between attempted installs of libsmi-yang-0.5.0-r0.aarch64 and frr-10.0-r0.aarch64

frr also uses the doc 'ietf-netconf-acm.yang ietf-netconf-with-defaults.yang ietf-netconf.yang'.
frr has a priority of 100.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
index 73aeb5539..1f7442af0 100644
--- a/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
+++ b/meta-oe/recipes-support/libsmi/libsmi_0.5.0.bb
@@ -18,8 +18,11 @@ DEPENDS += "bison-native flex-native wget-native gawk-native"
 
 inherit autotools-brokensep update-alternatives
 ALTERNATIVE_PRIORITY = "50"
-ALTERNATIVE:${PN}-yang = "ietf-interfaces "
+ALTERNATIVE:${PN}-yang = " ietf-interfaces ietf-netconf-acm ietf-netconf-with-defaults ietf-netconf"
 ALTERNATIVE_LINK_NAME[ietf-interfaces] = "${datadir}/yang/ietf-interfaces.yang"
+ALTERNATIVE_LINK_NAME[ietf-netconf-acm] = "${datadir}/yang/ietf-netconf-acm.yang"
+ALTERNATIVE_LINK_NAME[ietf-netconf-with-defaults] = "${datadir}/yang/ietf-netconf-with-defaults.yang"
+ALTERNATIVE_LINK_NAME[ietf-netconf] = "${datadir}/yang/ietf-netconf.yang"
 
 EXTRA_OECONF:class-native = "ac_cv_path_SH=/bin/sh"
 EXTRA_OECONF:class-target = "ac_cv_path_SH=/bin/sh ac_cv_path_WGET=${bindir}/wget ac_cv_path_AWK=${bindir}/awk"
-- 
2.34.1


