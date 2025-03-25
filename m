Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B20C369A8
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.61113.1742893339873671576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fEAo+eCb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893339; x=1774429339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rJIMWVKDSurUSMY11SzKBCpIMEl1SN92bj6nM367BQw=;
  b=fEAo+eCb/Tsf5p01j44Iwux6n7U4XsH1FHqggity4UuZMEllG+4p4jCa
   OLoEtOZgEwvVk/Fg3nvzW+SrkeDrFLRtx70toTuprds7lu07pX+nP+nUu
   CKTGjqDi4XYWTCvng9X/KUAIsEiDTQn5IibcADgVvYAVazgcJz0rkSSE8
   +6UDXGSUzx+vJj1hK5r0RnRzGKf1OO+E2bMv1xHrGGedKiN2rGOZkv/7W
   HVjlI6Q+tlI+j0E4nmTK1L42wcLofm1/Z4/vouHnYOsNvHuEW7Hb9Yvlz
   4jgQQtVpc0s5UXk50DWybXgtP0ioyQ0GyHtAyCGT+NzndzTDNPo5gy7+S
   g==;
X-CSE-ConnectionGUID: 5W3SG/pRSi2iqeQc2bKTew==
X-CSE-MsgGUID: nW79tTWwTK2ACFOLjtcIgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194490814"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194490814"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:17 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B11BCC2260
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 76E07BDCA6
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BFB6F1A00A2;
	Tue, 25 Mar 2025 17:02:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 18/45] memcached: upgrade 1.6.37 -> 1.6.38
Date: Tue, 25 Mar 2025 17:01:25 +0800
Message-Id: <1742893312-3809-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116245

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../memcached/{memcached_1.6.37.bb => memcached_1.6.38.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/memcached/{memcached_1.6.37.bb => memcached_1.6.38.bb} (95%)

diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.37.bb b/meta-networking/recipes-support/memcached/memcached_1.6.38.bb
similarity index 95%
rename from meta-networking/recipes-support/memcached/memcached_1.6.37.bb
rename to meta-networking/recipes-support/memcached/memcached_1.6.38.bb
index e77ca464c9..9799b55a09 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.6.37.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.6.38.bb
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "perl perl-module-posix perl-module-autoloader \
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
            file://memcached-add-hugetlbfs-check.patch \
            "
-SRC_URI[sha256sum] = "74a0629370f6bf60873937e439cd59659fbd7a84f24c1095bc082da0c8406969"
+SRC_URI[sha256sum] = "334d792294e37738796b5b03375c47bb6db283b1152e2ea4ccb720152dd17c66"
 
 CVE_STATUS[CVE-2022-26635] = "disputed: this is a problem of applications using php-memcached inproperly"
 
-- 
2.43.0


