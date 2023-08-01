Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEADC04FDF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:42:28 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7641.1690875746764236702
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126613541"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126613541"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:42:25 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 90BB2D3EA9
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D419DD9680
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Aug 2023 16:42:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 631CB10211;
	Tue,  1 Aug 2023 16:42:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-jedi: upgrade 0.18.2 -> 0.19.0
Date: Tue,  1 Aug 2023 15:41:47 +0800
Message-Id: <1690875717-21608-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
References: <1690875717-21608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27786.005
X-TMASE-Result: 10--2.179900-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr6Of2S2YKMi/ozDhGeQC9EiTy
	iQBROeeGweebJ+rKEhw486vsentZ7+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4iiOf1NDnCI+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO25V9
	z3vqk3KoEnCTngim1nnOOsRomhoFBwlquaZ4ja2DhARUz8iVjvbKZvCesvSOJHvBdTqeHq5lAIW
	RLb8/85EDYopiKMecuKRQfhkZXltfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Aug 2023 07:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104188

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Python 3.11 support
-Massive improvements in performance for Interpreter (e.g. IPython) users.
 This especially affects pandas users with large datasets.
-Add jedi.settings.allow_unsafe_interpreter_executions to make it easier for
 IPython users to avoid unsafe executions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-jedi_0.18.2.bb => python3-jedi_0.19.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jedi_0.18.2.bb => python3-jedi_0.19.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.18.2.bb b/meta-python/recipes-devtools/python/python3-jedi_0.19.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-jedi_0.18.2.bb
rename to meta-python/recipes-devtools/python/python3-jedi_0.19.0.bb
index 41063d2ad2..91517f7098 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.18.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.19.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
 
 PYPI_PACKAGE = "jedi"
 
-SRC_URI[sha256sum] = "bae794c30d07f6d910d32a7048af09b5a39ed740918da923c6b780790ebac612"
+SRC_URI[sha256sum] = "bcf9894f1753969cbac8022a8c2eaee06bfa3724e4192470aaffe7eb6272b0c4"
 
 RDEPENDS:${PN} = " \
 	${PYTHON_PN}-parso \
-- 
2.34.1


