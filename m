Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01122C54E73
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:47 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.8219.1710827197679791938
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GdO1oGRn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827197; x=1742363197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/HAZjVrsjOVLJArbLhNZ4EMWWG5FCqQ/l0oAow+I1Gs=;
  b=GdO1oGRnx0PM2EljrnovUz01HHPM/piGUZEnKRqPpMoHoz20Bwm4S2xC
   flzclPdxen6Op4R4fr3K3cL7Syp7PH+B83rxiBA14Z0i6kj0VWoHQDwHU
   xuzBOVRxr8MUAVXc9iP2GILLuhOkYfgpkGHLd/T2/TV4hKpd+2oF5l1Il
   xVgwGWaGRw2xTM1wF9Wgho5XZey4afz1bIKggFIeKpC8fwzXNWoWQ0sMf
   pMjBprg4XHPaHeZKkbpRPftG0US8npUwmPRhzyVr8IJHw5jV6I+z3PIGN
   L0yLxRuI6/eVJd60ABO2DsKPK2G06zbMAuFc/kWT/0LWfB0LI0ivI0jaR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="140681178"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="140681178"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:34 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CBC72141206
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 07BD1B8910
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8971E2009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 334791A006B;
	Tue, 19 Mar 2024 13:46:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/50] python3-argcomplete: upgrade 3.2.2 -> 3.2.3
Date: Tue, 19 Mar 2024 13:45:08 +0800
Message-Id: <1710827139-30056-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--1.694800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrAWQaZTMSP86Zug0ObbHqj76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO19R4
	Ss0oUmJzkw61oY+mJJEtL0gENAEIUoXwF1A/nRq/b601hCSzDzGkxU71rsz9CtuGRATTgi6l+2W
	AG2/0ee0ZV0dWenN/Xik6UzMpXXwPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109440

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Allow register-python-argcomplete output to be used as lazy-loaded zsh completion module
-Move debug_stream initialization to helper method to allow fd 9 behavior to be overridden in subclasses

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.2.2.bb => python3-argcomplete_3.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.2.2.bb => python3-argcomplete_3.2.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.2.2.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.2.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.2.2.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.2.3.bb
index 90560fabe..8d8c8a4e2 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.2.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "f3e49e8ea59b4026ee29548e24488af46e30c9de57d48638e24f54a1ea1000a2"
+SRC_URI[sha256sum] = "bf7900329262e481be5a15f56f19736b376df6f82ed27576fa893652c5de6c23"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.34.1


