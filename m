Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DB6C30658
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 03:19:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.9160.1719544780540677095
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 20:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fR5cwY9h;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719544780; x=1751080780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=SnsWCxy7eoTSkNNOXvxY3yDDCK53Mpt7wx6c4wLMEkU=;
  b=fR5cwY9hNyjNSUpTlxLAiM7WsJHFi/4d8vYnGzCrSGi+5usrxNiqn9l0
   sAXTlsAotPOsBkjW80BNkofm4rVsJnzjOt6CwlEFq2JowbsqwXELu5JpQ
   YiffwA7PyF7VqqR2Bgqc4/i09JJYNRBy+eG4HBQ9VjcpOfQkgS1r8JRcv
   FYUZlP3gkwBVON+JOebDdlcl0cSRQcnsxtViOZbq0QkeRqcK/nyMNoIWq
   LZupia5Ehq7eMunzbfTYlimeefByBvvuXsWcFw33fz07O4sJwjS4WrgQZ
   pSfO8l8bieD7md5L5YLGxPYcjbqHao1ZlbH8bDJFNGnXStTKtq8BxOyRm
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="152616060"
X-IronPort-AV: E=Sophos;i="6.09,167,1716217200"; 
   d="scan'208";a="152616060"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 12:19:37 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E65C2E7521
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 27751D53E4
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C084B2007CDE9
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 12:19:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 705E51A0002;
	Fri, 28 Jun 2024 11:19:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 4/4] daemontools: fix build failure with gcc-14
Date: Fri, 28 Jun 2024 11:19:27 +0800
Message-Id: <1719544767-17994-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719544767-17994-1-git-send-email-wangmy@fujitsu.com>
References: <1719544767-17994-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28486.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28486.004
X-TMASE-Result: 10-1.961300-10.000000
X-TMASE-MatchedRID: BrApPpprBkT3NhTrOUQg2wk3qL3jdFBN1QQ6Jx/fflbAuQ0xDMaXkCpY
	AmrFxIhiX2TxVGxWCcHF13tOkUn5xHEWVXH5btzQngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDXWArjsnlY9D1JdipJS/ni/Yjn2+lfqm27CzTWzTkG2iWFhR3G9uh/qzNqifobyhlIUau
	3lDp9W0Fl1nOfb+9BSkzV360XefU7yvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 03:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111137

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/daemontools/daemontools/cross-compile.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch b/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
index 98d4a5e45..e37af2665 100644
--- a/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
+++ b/meta-oe/recipes-support/daemontools/daemontools/cross-compile.patch
@@ -13,7 +13,7 @@ diff -Nurp daemontools-0.76.orig/src/conf-cc daemontools-0.76/src/conf-cc
 +++ daemontools-0.76/src/conf-cc	2014-11-26 09:34:38.828812162 +0800
 @@ -1,3 +1,3 @@
 -gcc -O2 -Wimplicit -Wunused -Wcomment -Wchar-subscripts -Wuninitialized -Wshadow -Wcast-qual -Wcast-align -Wwrite-strings
-+${CC} -O2 -Wimplicit -Wunused -Wcomment -Wchar-subscripts -Wuninitialized -Wshadow -Wcast-qual -Wcast-align -Wwrite-strings
++${CC} -O2 -Wimplicit -Wunused -Wcomment -Wchar-subscripts -Wuninitialized -Wshadow -Wcast-qual -Wcast-align -Wwrite-strings -Wno-error=incompatible-pointer-types
  
  This will be used to compile .c files.
 diff -Nurp daemontools-0.76.orig/src/conf-ld daemontools-0.76/src/conf-ld
-- 
2.34.1


