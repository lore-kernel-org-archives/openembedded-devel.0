Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9EFC36014
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:29 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.61532.1742893341583636729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rGG1Y066;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893344; x=1774429344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FgWGrmOlvaUE1eT8Zb1xTCDNQvDSXbW8cNE6ppwxM+s=;
  b=rGG1Y066B0IBCUFRs667yqsQScd9EDIHPzb/06YDBhE1Io4duQzP/BRZ
   kl4zDzsryREfgTjBQ8sCaK/R9WpxG9bzRmrksiBJ9D0I2nmh1kUx75T9O
   E4l/3Q4FgGZ3/lIyoZh7VVb5x/Ksmlhqc5PFGgr7Y3TpqeyD2AQsP/0sV
   gBdjYELb4sN8iTGmkGM1td+DRfmT67/6NvAx6ylpTJXpoIJOXt+K4Zevc
   ceqz5yqj6xS52jYxyLr0aJGfs/pA7PmB4l71Sgb7VgBxYs+vOMJGAyenh
   m19BUZl1cpKVaFpWNOEhYj+wPP4yAEtXdz3xat2D1YgCNtD+hhw0+bEs2
   w==;
X-CSE-ConnectionGUID: 5nEpIoMQQQOASq4km3fzfw==
X-CSE-MsgGUID: 9Pk6bvVGROOyYG4jrDAk0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194166815"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194166815"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:23 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 88E61C2277
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4ED06D6FE7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 128C51A009B;
	Tue, 25 Mar 2025 17:02:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 42/45] qpdf: upgrade 11.10.1 -> 12.0.0
Date: Tue, 25 Mar 2025 17:01:49 +0800
Message-Id: <1742893312-3809-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116264

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  https://qpdf.readthedocs.io/en/stable/release-notes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-printing/qpdf/{qpdf_11.10.1.bb => qpdf_12.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_11.10.1.bb => qpdf_12.0.0.bb} (94%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_11.10.1.bb b/meta-oe/recipes-printing/qpdf/qpdf_12.0.0.bb
similarity index 94%
rename from meta-oe/recipes-printing/qpdf/qpdf_11.10.1.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_12.0.0.bb
index a82303d455..538faafb5c 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_11.10.1.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_12.0.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 DEPENDS = "zlib jpeg ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls', 'openssl', d)}"
 
 SRC_URI = "git://github.com/qpdf/qpdf.git;protocol=https;branch=main"
-SRCREV = "8a1d34bb74e6bae1b57076485386fc56e7c22aaa"
+SRCREV = "f84bf9778d141f2392c810eed340ade1eda5e421"
 
 inherit cmake pkgconfig gettext
 
-- 
2.43.0


