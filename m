Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA56DC25B75
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:10 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.9828.1717664820317303594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tv+gCFU5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664821; x=1749200821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=W/Pz+eWFNeSPUjKGnpn9zRUxJdPOAcLdnZi6s/kaDU8=;
  b=Tv+gCFU5aDXsz8ZslZGrwgcnWuCw33nzOW9st3nQSoDW+35pIgboTwKL
   bmz2omMeDJP0ib1S48C7BX2qB1y+I18GNKU+JjiN86Kpdnlt9Q2brWV/H
   jYPlIg4l9/f4oSGEi4jQaP1bUZon4CQ0vTBsB5lSRtJUBuhk5h5UB3K+a
   vH/YQBt11to2rbLjcST/cE30MzkgJD7fwZwaG+QjBONlGbHnqf/SQyNAF
   77YdaHsQiRrjM/MxDhsckMF9WvvJH1kUCngpOI3oiwGZsPyDAZOC6znqI
   LStxcb8/g4ddY2BjnZIEIr68ddB8+WoRqqCOg2Pt5pR6aHWZquZQQjV4y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="162136671"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="162136671"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:58 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E27BD6482
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C9EBD72A0
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 04C192008132A
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A62801A000A;
	Thu,  6 Jun 2024 17:06:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 16/36] libcompress-raw-bzip2-perl: upgrade 2.206 -> 2.212
Date: Thu,  6 Jun 2024 17:06:15 +0800
Message-Id: <1717664795-13902-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--0.161100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8AtH/ey8zRp8SiwizsgluQdTe
	gpK7QnXFvQZuQp/ypDOuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4BWW
	qv8w9M1bdp1cOvj56g6jHsTCn+15nRIMCVbqRfAqfrwdYWaeDcVRiphRdtAbkgSM4rM3fLndgfo
	Y+jmcy+6wuMwr47Aa6CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110723

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...zip2-perl_2.206.bb => libcompress-raw-bzip2-perl_2.212.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-bzip2-perl_2.206.bb => libcompress-raw-bzip2-perl_2.212.bb} (79%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.206.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.212.bb
similarity index 79%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.206.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.212.bb
index 2bd98e73b..712073041 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.206.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-bzip2-perl_2.212.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Bzip2"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=85ab0f65a47c4c0f72dd6d033ff74ece"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=cd551ef796cc7fa34351ced771a3a7f9"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Bzip2-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "212b81db1c0ae822d19928619a603bd108cb5d5c4700fc67dc7cb169e0cc6525"
+SRC_URI[sha256sum] = "6caeee843c428f45fa9646ea98dc675470db63dbac0ee3e2d8e9ee4eb58a856d"
 
 DEPENDS += "bzip2"
 
-- 
2.34.1


