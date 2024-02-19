Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8A1C54E41
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.37571.1708333369186557507
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wo5pfSxT;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333370; x=1739869370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Xme0yDLTOFV7G/WJ84o4y68VWaD1zILGIQ4zj0vyya4=;
  b=Wo5pfSxTSgf6WPNYUBAJdS3QxV0DhhQ3Guvhgh7fUTHA2n0JwoUFW6+X
   EkU2exh4JWa6dbCwzZdiX8nGI+2sMvLxF6x1iVre2VynrcQeQtpfbwxnT
   aX1cBWVjhXvZ9uRX28Tas5/ovOwc9jwGxMbwqHFoilIb9OIMSwQiHyOer
   Bpk5UK+iEivq3Z6bB8q9aS2ASB+lw9xTlRkPUrjKZZyIVr2WgilFlo78o
   BkZ39VNZ0VSkhTWiCMUV63OEtN1BJfXNoI/wae6A4iUHsdnvBXBCa1qmD
   IjLZ+JTlyG3mIi5mZq9LX8SBr834F/j+VsHujeo8mxtvLcjNf4LZ3buGM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="151522212"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="151522212"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:47 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D05CD4800
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 341A7D5CE8
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B757821F79D
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 622AF1A006B;
	Mon, 19 Feb 2024 17:02:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/23] python3-cantools: upgrade 39.4.3 -> 39.4.4
Date: Mon, 19 Feb 2024 17:02:20 +0800
Message-Id: <1708333346-17704-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10-1.725700-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrQcdf3zsfloWU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8QhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFEh03+gcatUptyrkw6fiBekNtz
	+FGRpnMTospN7s18U/rOXryUVNgGkYb+RSsYdp/uMkG1UoC470/9E91szEDbGiasWZ+8A0UOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108862

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 slight modification to regex to enable small scaling factors that have scientific numbers in them

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_39.4.3.bb => python3-cantools_39.4.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_39.4.3.bb => python3-cantools_39.4.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_39.4.3.bb b/meta-python/recipes-devtools/python/python3-cantools_39.4.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cantools_39.4.3.bb
rename to meta-python/recipes-devtools/python/python3-cantools_39.4.4.bb
index 3cf956083..c8b8d1dfb 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_39.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_39.4.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "7aaa3d246bc5328bb29c681fc8162d2800be05ee095b3edb9470fa1478f9e506"
+SRC_URI[sha256sum] = "6e8e918b6671a62a9f3990546ece5623e1deb71defb1cef85a9955ac301da99e"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.34.1


