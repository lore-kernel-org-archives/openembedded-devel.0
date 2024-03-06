Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB7DC54E49
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:27 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7732.1709714658475136337
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hQp9barm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714658; x=1741250658;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=g/pnFCHBtAjJm9UrkdZwloVrd9jkICqfM7ruXOTJf+Q=;
  b=hQp9barmDx25VSbONFMvRI8ByDzKkIMl0RDuDnlMMdPYZ0/6C0B2kcJB
   qwwCOrXj1mpmoJiywg+3Bu5dKgke0Ay8fqtOABS7m/7PgaUBRTI25reTc
   8Bp6rKFu3p6XS+g1an6ziCjXpACC1pu4M2r3enj0/cHoPwEMGLIY9Y/Eq
   sgdaEZKtoe0/NxvPHFBvujtvLjwJr0YJnB2jsFkFOSHciyrqclVzfVFPv
   8lThY3oXrIIDEY9bEW/NXJFcb6xUWGprFtX+5aiEkrnni1UafaHlG6+zk
   7eSQLTCI9B/Di9ntLA5WqS2VQ8jzkcTahsiY+Uo2J6DJoZI20rftwwsVZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="139861532"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="139861532"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:11 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id CA279EB462
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F0C534EC03
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 97ACA41182
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4E0821A006D;
	Wed,  6 Mar 2024 16:44:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/26] python3-gcovr: upgrade 7.0 -> 7.2
Date: Wed,  6 Mar 2024 16:43:18 +0800
Message-Id: <1709714608-19296-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--4.835000-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyrNVSgF5+L4fzx
	fg6IZlFluFuhxGj94H02PXkQ743k2cOY7UMlS7FZOyPKih4RysiqBtQrKPbs305oN2XumCC9Buh
	MNLfO6UD4cVSLKz6QAA3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXtLALfOrPJxRgkD
	4cHBIWJ+eT48+FcKZsYWn2p9yKOL1O8fMZwaqIgp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOMomNjaUH2aT1TcUK2BZbEM3ccv9ad5y3fpFPfOe0i+CzCDjJbCJn4WGxdYBwI/d8W0VL
	oi6twFax3aK3i3RZHlf2bKN+FyFqgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109156

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Add support for coloured logging.
-Add support for TOML configuration format.
-Add support for Clover XML output format.
-Add decision to JSON summary report if option --decisions is used.
-Add support for files with more than 9999 lines.
-Do not suppress gcov errors if exception occur.
-Add nox session to generate the screenshots from the HTML files.
-Improve Dockerfile for faster rebuilds by using cache.
-Fix deprecation warnings from GitHub actions.
-Add pipeline job to apply tag if new version is bumped.
-Improve test coverage and generate coverage report if executed in local environment.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gcovr_7.0.bb => python3-gcovr_7.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gcovr_7.0.bb => python3-gcovr_7.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_7.0.bb b/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-gcovr_7.0.bb
rename to meta-python/recipes-devtools/python/python3-gcovr_7.2.bb
index 1a81a38b0..2965e2f09 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5a58ca91c1758a53f896ba89d8aaac2"
 
 SRC_URI = "git://github.com/gcovr/gcovr.git;branch=main;protocol=https"
-SRCREV = "fc190bcb85a25f5738315434a11f8e993edce515"
+SRCREV = "c4b74b0859611283be646d590c7915e787911b6f"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


