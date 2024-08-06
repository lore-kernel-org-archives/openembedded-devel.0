Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934EFC5320D
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.2884.1722934017920301362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BEqHKYbZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934021; x=1754470021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hLJAwR+qFePXzDfo95pmxwrzwVd1lhX8+Bw5BGqfUkI=;
  b=BEqHKYbZCbtdvhsKykXuLT1v06qSSd09tfXjQS5qpjw2Wn+ThHPRacDc
   J3zXfgGzR6Q8E1dc9+jiZVI6CnWg1FC5/ZRbQv8YdxrfwyEq93gOTLDdc
   mDOeCSz2P3dk/jAFiXuHdiPfkGPXVEey/OjGXdQLyQ1rKmB8jTWHhXPAV
   a9TuKuvqs77SAz4LSZ0bnpb/FpLNLntifmhRNB/17aZfGof4JpvVAr9I1
   lxYhA7ng2WocdZlDb8KzHetglaWHiPmlTB0thLE/mtbvqM/myfsTt05EW
   J9z3Fcsf6SKyS8QCjCiE6csY+3aDg2rT288D2DD/HpPl9fMEdKuuVbF+i
   g==;
X-CSE-ConnectionGUID: B7wGuuf2TlqikRjhxRpnsQ==
X-CSE-MsgGUID: Md8p45NYQha35yBbCAj9VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="171895529"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="171895529"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:47:00 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 64D32D64C6
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A343AD4C15
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 304FC20076D12
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EFBC71A000C;
	Tue,  6 Aug 2024 16:46:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 30/60] openvpn: upgrade 2.6.11 -> 2.6.12
Date: Tue,  6 Aug 2024 16:46:04 +0800
Message-Id: <1722933994-32549-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--2.396700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yQPZZctd3P4B1QQ6Jx/fflZgDeovr2tertMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNlVHM/F6YkvQL//VMxXlyE3W9481P/gy3DrG
	3Q1PIT6iaDRDqhZrJDAuinfgZ2xrH1ZteLfOPw7RhW/KqLK7NUH0tCKdnhB58hYfw868k05b3PD
	iXO/tFSY6HM5rqDwqtMwxRp4PHJZ5pjP2Cg41yHgPCbk2ZiaC91kIs4GmzqimVENFQ0m86/fDmk
	VtEgrNf1yIRdbMa2tr5qGk01hhYQxgtSbEs68b3HSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111548

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nfigure.ac-eliminate-build-path-from-openvpn-versi.patch | 6 +++---
 .../openvpn/{openvpn_2.6.11.bb => openvpn_2.6.12.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.11.bb => openvpn_2.6.12.bb} (97%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch b/meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch
index 7c6ad20a4..e1253db1e 100644
--- a/meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch
+++ b/meta-networking/recipes-support/openvpn/openvpn/0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch
@@ -1,4 +1,4 @@
-From a4d4ca981433705057c73086a6f1b4ebe07e614c Mon Sep 17 00:00:00 2001
+From 9cc13bdcb71cd16d2873637c491e07c01de9a3ea Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Mon, 13 Jun 2022 22:44:28 +0800
 Subject: [PATCH] configure.ac: eliminate build path from openvpn --version
@@ -31,10 +31,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f56d0cc..27ca06e 100644
+index df16c43..623ca65 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1447,7 +1447,7 @@ if test "${enable_async_push}" = "yes"; then
+@@ -1463,7 +1463,7 @@ if test "${enable_async_push}" = "yes"; then
  	esac
  fi
  
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.11.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
similarity index 97%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.11.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
index cf599666d..d81b8ce44 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.11.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.12.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "d60adf413d37e11e6e63531cacf2655906756046b4edffe88a13b9e2fec40d5e"
+SRC_URI[sha256sum] = "1c610fddeb686e34f1367c347e027e418e07523a10f4d8ce4a2c2af2f61a1929"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.34.1


