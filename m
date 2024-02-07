Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7341C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 01:14:37 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.10277.1707268474231759357
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 17:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZdIr0Lr9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707268475; x=1738804475;
  h=from:to:cc:subject:date:message-id;
  bh=CEV6a1+WdaecJDuaKe8gRBmbQx/3+nyVic0Gw8lc7QQ=;
  b=ZdIr0Lr9gbxlP3GG3UgP9IboxMR5sCleTWld44CTpPGbzN7kKidDnAyv
   zBTWAnPem4t4Mw1k/+qyv+4E6rC4RwU7WCJO2qjytf+2aS3YX5uyG8Fy0
   +yQxuOgmTohE1OEE/qd36HRsbEZAGryZUAiWUk+TII3U7VzK/RID7QUcU
   EWSOAnd6jcg0Q7yxmx//vbT6h+sBkR/pTZkkuEu2spvNReH+bIeql6T7e
   p9JFPk+j0HMUsRuWuTOiZnROKbFAgf3cga3Rcs378m4dqdOaVZTv+kMGH
   T07kp36FMb44ZRm5lCFI52WFY2Jr10rggx+GBtKSs/TF4I0TKRxcEf4oV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="148084576"
X-IronPort-AV: E=Sophos;i="6.05,248,1701097200"; 
   d="scan'208";a="148084576"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 10:14:32 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6026ED6477
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:14:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 956BA106F4D
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:14:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 566006BE5C
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:14:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DAE8C1A006B;
	Wed,  7 Feb 2024 09:14:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-waitress: upgrade 2.1.2 -> 3.0.0
Date: Wed,  7 Feb 2024 09:12:15 +0800
Message-Id: <1707268335-11839-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28174.001
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28174.001
X-TMASE-Result: 10--2.305700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr1cuIRwt/4MhhR1Y/uhfqyP+Y
	Kp2Mb6xJRFtgogO52Vivjpj2nQhvvR2P280ZiGmR/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQCmL
	ENVLWzffMyci7ueSYvC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO19R4
	Ss0oUmJ+9xrdsamWHQbQE0Ejasu3Dhjug1E/K16A6Lgcm8b1bhCwHPE9/S3QvHjo0RgJVE4M0Ee
	/4l/GSk+xsn75ISFuoXnGFU/jgc/vIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 01:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108641

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
-Rename "master" git branch to "main"
-clear_untrusted_proxy_headers is set to True by default.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-waitress_2.1.2.bb => python3-waitress_3.0.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_2.1.2.bb => python3-waitress_3.0.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb b/meta-python/recipes-devtools/python/python3-waitress_3.0.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
rename to meta-python/recipes-devtools/python/python3-waitress_3.0.0.bb
index 061586b5d..7470fc02a 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_3.0.0.bb
@@ -10,6 +10,6 @@ RDEPENDS:${PN} += " \
         python3-logging \
 "
 
-SRC_URI[sha256sum] = "780a4082c5fbc0fde6a2fcfe5e26e6efc1e8f425730863c04085769781f51eba"
+SRC_URI[sha256sum] = "005da479b04134cdd9dd602d1ee7c49d79de0537610d653674cc6cbde222b8a1"
 
 inherit python_setuptools_build_meta pypi
-- 
2.34.1


