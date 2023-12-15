Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69897C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 05:57:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.54263.1702619824227251261
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 21:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="122293451"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="122293451"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 14:57:01 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A7EEFE8BE9
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:56:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DD955BF3CE
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 14:56:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F1D61EBD81;
	Fri, 15 Dec 2023 14:56:58 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sip: upgrade 6.8.0 -> 6.8.1
Date: Fri, 15 Dec 2023 13:56:29 +0800
Message-Id: <1702619789-4239-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28058.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28058.005
X-TMASE-Result: 10-0.465800-10.000000
X-TMASE-MatchedRID: tqtwwRx2oeC7qz8f6326on1zro62qhdCN5dqZcIK7VgwcMedHxxRAiFL
	Sh+QCTPZIvrftAIhWmLy9zcRSkKatYgrKnsJ1GRgOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJ0N7nFmx634JUmYBwZYqxrLPgQJcjLq4R4tk
	MNYWX03HrjDlXWnt9f21tpMhTfOkpHJmaGlZ2TZ+06C6aHzzoM2hG622eHSXr+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 05:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107490

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.8.0.bb => sip_6.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.8.0.bb => sip_6.8.1.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.8.0.bb b/meta-oe/recipes-devtools/sip/sip_6.8.1.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.8.0.bb
rename to meta-oe/recipes-devtools/sip/sip_6.8.1.bb
index 6c7f22dd9..e045431d6 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.8.0.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.8.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "2ed1904820cb661b7207eb1dccfaebec1a5463dcad903ba448ad1945502d089c"
+SRC_URI[sha256sum] = "3002df415e168ac3ffe393942dbc7131cb82ade50000e1526f46a88ade26f598"
 
 RDEPENDS:${PN} = " \
     python3-core \
-- 
2.34.1


