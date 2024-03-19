Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C76AC54E74
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:57 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8229.1710827216420961727
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YJ8x/JlC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827216; x=1742363216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=i//VAVPnknlH+2lgDpv0EBp6SS9FsstMnNRkaIMV+90=;
  b=YJ8x/JlCcEGT3Txhby4CAMlyJmrY8yBtQ+2clzr1OOtezzjLq14kl8Mv
   CL+vFQu807hS8TH63aTer8zkkLu+c5hZoiCsw1BD/SyHhUa0sct/KswpD
   0zHZGgla/1jOutsJttVd/gGyI+N7sspsNC+3aFWxev34V3QY+gKfxI1gi
   CmEO6bA3DcAnZWdsKA3l1bDJUIxLonqNyB4Hw7OVPzkpoSncOmF0TYeA1
   8muydRJNwRjQOFIA3UpT5fqpXeo3rVg35oWj40eHJAq0xbpGg1/FdcE5Z
   RtJf2ghmqu79S/vgJ3BobePS8BVOaQWwp6kPEhw3WbwD8DQvif5LITcA+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="140303181"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="140303181"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:54 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 11259141214
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 400ADD6152
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C81902235E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 712421A006F;
	Tue, 19 Mar 2024 13:46:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/50] python3-types-psutil: upgrade 5.9.5.20240205 -> 5.9.5.20240316
Date: Tue, 19 Mar 2024 13:45:34 +0800
Message-Id: <1710827139-30056-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-1.712400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzo8w4N7te92r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFJiMLA+uK3FgCjLJICHg+Wzrss
	GB+6ciYTNxAEpECP3v729QveRHfmDQVD467Sr5fsibdO3OID9+FQn8H2KT2u6BVcovJcCqlux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109463

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-add settable info property
-Use PEP 570 syntax in third party stubs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...5.9.5.20240205.bb => python3-types-psutil_5.9.5.20240316.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_5.9.5.20240205.bb => python3-types-psutil_5.9.5.20240316.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240205.bb b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240316.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240205.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240316.bb
index 736024d45..c6f15696e 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240205.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_5.9.5.20240316.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "51df36a361aa597bf483dcc5b58f2ab7aa87452a36d2da97c90994d6a81ef743"
+SRC_URI[sha256sum] = "5636f5714bb930c64bb34c4d47a59dc92f9d610b778b5364a31daa5584944848"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


