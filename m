Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA05C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 01:21:17 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.10396.1707268872859961790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 17:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y1joH032;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707268872; x=1738804872;
  h=from:to:cc:subject:date:message-id;
  bh=zH3/p+5+j2aUvGVfxvTMmAMDfMfyUvn7f3ueanaDC34=;
  b=Y1joH032QzP6yKVpHUiFki7rhHUw6F/QSHAyTbIhPgtA91rlgokcTCsw
   mkr+aF0qJMMrFF3IcFtp8U9gReAebJtxlQMlBBm/P7iFo7l4b8sFcNgXN
   UctL0q4hecO75BSr2oWJucDKxzfMXTN3ba+4V8IcAMHqZBhuBBnPbR9kA
   mu5gt2XkH8yWQ+sW8lcZJDCte7vJU2wRqOEXvGcp4aNsEMk0QOFOW5804
   tOS1GPHNJM/VrG+NLpBeCirL6a2zLahpUPWNtTRJE69FXYK7e87AT0xOx
   SR836Z3FowEZuinvc+u0yFWEvEU7o4LIkfj6B5Jb+D18rkxi4WPtoki4k
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="136249583"
X-IronPort-AV: E=Sophos;i="6.05,248,1701097200"; 
   d="scan'208";a="136249583"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 10:21:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C9498D9230
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:21:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E467D41E6
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:21:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 59FDF6BF6D
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:21:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 10CDF1A006B;
	Wed,  7 Feb 2024 09:21:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sip: upgrade 6.8.1 -> 6.8.2
Date: Wed,  7 Feb 2024 09:19:43 +0800
Message-Id: <1707268783-11995-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28174.001
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28174.001
X-TMASE-Result: 10--0.634600-10.000000
X-TMASE-MatchedRID: m4/crH8oCK67qz8f6326on1zro62qhdCpxAd6mi1Ga3G5dXdQTj2OKQt
	HlwwSfPRKaYrswcBhT7GKIf6hBf7VQE4dbnyjMJaTuctSpiuWyUUi4Ehat0545Tx+2LIqNmtBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7zqu
	QxPrQd/TpRmTQh3GUcoGXEM2u0PN91X7XGKbAzUx8I1IvsqY5oHapALYnAJSeF+/wmUOw4nrUA7
	+xgY8X3KKEzuBjCErOCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 01:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108644

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
 - Added the --deprecations-are-errors command line option to all build tools.
 - All generated files are UTF-8 encoded.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.8.1.bb => sip_6.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.8.1.bb => sip_6.8.2.bb} (87%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.8.1.bb b/meta-oe/recipes-devtools/sip/sip_6.8.2.bb
similarity index 87%
rename from meta-oe/recipes-devtools/sip/sip_6.8.1.bb
rename to meta-oe/recipes-devtools/sip/sip_6.8.2.bb
index e045431d6..5df494fa7 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.8.1.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.8.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "3002df415e168ac3ffe393942dbc7131cb82ade50000e1526f46a88ade26f598"
+SRC_URI[sha256sum] = "2e65a423037422ccfde095c257703a8ff45cc1c89bdaa294d7819bc836c87639"
 
 RDEPENDS:${PN} = " \
     python3-core \
-- 
2.34.1


