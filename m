Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B26C48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:33:04 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.17344.1707208378412964322
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WiWcbmej;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707208379; x=1738744379;
  h=from:to:cc:subject:date:message-id;
  bh=45CzitaV0T81sPITAcYhzjL2zDsgIDe4kTg85aoRWW0=;
  b=WiWcbmejGbBApTZzGgVOr9lb7oipctXUq5SU1lWm/xpC3nbwWQXt6MqV
   fFkuvoavVccLOoWpW7sVKr3ZhOTUhQ/DkkQqtZZ1H5i8dhX04cpdd+Yo5
   JluZq46y0Ajfr6ZjVudMuDJeEc8CIvg/u23EZwwP1sN/DVt45IIfdxTVe
   fv8JnM+dZGt8Md3Ju/Ma5vr6B70lXUnQl18bLJPK64TMI1geaT/GuFoaQ
   Do622kVKHvsDGs/4dlZZtVsXjNIWCKyQLhKkpmrWwaAUPsGPfdX3r+S3q
   9g4ddEvP6dXxnESyjODvtuoI3YNrkkKL7MjFa75T14+WnhdPYUOQyTLYY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="148537756"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="148537756"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:32:57 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2FAEDE9A25
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:32:54 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 74A03D968A
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:32:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 063A721D176
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:32:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ABE2E1A006A;
	Tue,  6 Feb 2024 16:32:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ostree: upgrade 2023.8 -> 2024.1
Date: Tue,  6 Feb 2024 16:30:44 +0800
Message-Id: <1707208244-5666-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--4.810100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ5D53rZ0sb/ewAaNLqXHEq6nHbeBu5LnnTlIO7ZQZ9769vZBFSQyQDnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFPj3aojITUOvYuEXq00T6iAM1j
	Xj35EH8ZF6a7iKlbuymRIQbTqeSZUmGshA2Gv3qNnGzodmypbC10nqM9VJBoG3JgKBaSNgo+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108611

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2023.8.bb => ostree_2024.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2023.8.bb => ostree_2024.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.8.bb b/meta-oe/recipes-extended/ostree/ostree_2024.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2023.8.bb
rename to meta-oe/recipes-extended/ostree/ostree_2024.1.bb
index 0704c9162..d4ad765c0 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.8.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.1.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "b6fffc267188e40d60755e6d7f2be65831795baa53b0fd9dd6c6809c7e54796d"
+SRC_URI[sha256sum] = "152327fe804512d4f896fb9b9e9cdc84ad9b4c0b205b8625472147d5a28164af"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.34.1


