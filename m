Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0240C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:28:24 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.1110.1705973294401795615
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="134576539"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="134576539"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:28:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 02F12D9DA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:28:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 42C8AD3F21
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:28:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C6B8123E220
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:28:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5C0D71A006A;
	Tue, 23 Jan 2024 09:28:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sanlock: upgrade 3.8.5 -> 3.9.0
Date: Tue, 23 Jan 2024 09:25:54 +0800
Message-Id: <1705973154-25242-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10--2.864200-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrA81piVnI+HU2/UwdvFG5InTv
	92h/oRdlOuzeNmOGKnNb03U02TisKn3BCNQzSMywqhcdnP91eXFpeZ1cXZibx3RWPmBj3ysMFsL
	CADAFxVD4Q159XDoivJfGnAP+vZgegIlkYxu1LelVXhlmZsTdjMe2fOsLx7f4PGvvxo6IgKq+qc
	W0zo2r8vu0HEWlaGvJxiiH+oQX+1WhhjsqgSuNbxF4zyLyne+AQJMUEjEPPAqynk7TnYzMumdrj
	ZkJClxewR8xcrVL5FQzd5m7yDNi1zsE6PWVyEks3QqJN4m15UF9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO25V9z3vqk3Kmj+XcgJNrRpPEnZ7/MaoDt12imRi2127npj+AQhkZXsyKS+IdYomGR0XMQ
	b/ymr9/JPA/xciQONIvPf/HAeaOwkXgKQ0xrqr/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108397

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-sanlock: replace strncat for creating debug output
-sanlock: reduce warnings
-sanlock: fix direct_next_free missing init
-sanlock: use product_uuid for host name
-sanlock: add comment with timeout example
-sanlock: skip short delay in delta lease reacquire
-README.dev: update userstorage doc
-userstorage: replace by PyPI userstorage
-tox.ini: add py310 to environments
-README.dev: update prerequisites
-wdmd: close watchdog when not used
-watchdog timeout configuration
-Add python3-setuptools build requirement

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sanlock/{sanlock_3.8.5.bb => sanlock_3.9.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/sanlock/{sanlock_3.8.5.bb => sanlock_3.9.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb
rename to meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
index 962d19574..fa1c6c7ec 100644
--- a/meta-oe/recipes-extended/sanlock/sanlock_3.8.5.bb
+++ b/meta-oe/recipes-extended/sanlock/sanlock_3.9.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://pagure.io/sanlock.git;protocol=http;branch=master \
            file://0001-sanlock-Replace-cp-a-with-cp-R-no-dereference-preser.patch \
            file://0001-add-missing-system-header-string.h.patch \
           "
-SRCREV = "b820c63093c4ae85d7da4f719cf3026d7fca5d09"
+SRCREV = "23766f9119b7c06b463110aeb9b969a742f0fe23"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


