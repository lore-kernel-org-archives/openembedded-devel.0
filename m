Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9941C54E49
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:17 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7751.1709714648882035088
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ofIg0wjT;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714648; x=1741250648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eatQ2T8j2FjK0biajQQRkwN7KLPwtGaeK10y1B961Ws=;
  b=ofIg0wjT2xZ+pkdtQuPsipO9ZPMLdiZvccei77qhpXJc0BjOVQCLwjfj
   jfCEtbzOJVPUC4nfhr7Lm7yz3Em6oNHij1CDIxvuO6ta/+Av0BVyih/GN
   jqlbF0DMRxI+eX0PuH7njNaxZKZ3tGok30flOpO9mX0fZO0VbludWetxZ
   0RbWZBF/P1gHOIfj6TKYn00jNLHyWxx5y2OCPyEnN0UnvQUHsndqFW032
   iRhbuE76zVz0XS/00TmKspUthhgeQRKYGknWgD0NM2Fh2Yjdco1R0RWFR
   8PkspFZuUucupEx44rhNf6HMixEV/y22NnmxYIiTO9XjJqk+tVyU2vqiO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="139861519"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="139861519"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:06 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 92E8FC690F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CD21642613
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EE7F2008FF86
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E8B531A006A;
	Wed,  6 Mar 2024 16:44:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/26] ostree: upgrade 2024.3 -> 2024.4
Date: Wed,  6 Mar 2024 16:43:13 +0800
Message-Id: <1709714608-19296-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--4.810100-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ5D53rZ0sb/ewAaNLqXHEq6nHbeBu5LnnTlIO7ZQZ9769vZBFSQyQDnpt
	r8PnHpyni8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFFKMCIYAFIJyjDHDPHnA6icCik
	gqNWqztN6wDuQVShjf1M3aybhUGMOfbsMLCho4AKKm3dUN1Co8m5BDdH8JbwVQsJcaSFQmuOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109151

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ostree/{ostree_2024.3.bb => ostree_2024.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2024.3.bb => ostree_2024.4.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.3.bb b/meta-oe/recipes-extended/ostree/ostree_2024.4.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2024.3.bb
rename to meta-oe/recipes-extended/ostree/ostree_2024.4.bb
index 158ec9bc2..b01337c94 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.4.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "5e0daaaa70772bfa00bd3d0c25d11f7c1f6d41a996708fad8bf9941f0a36bc8d"
+SRC_URI[sha256sum] = "63c9190821333ac7373e0d923e4c2766b25ebdcfdf4efb44cb5928c6589d9fcb"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.34.1


