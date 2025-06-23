Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB672C7EE3A
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:07 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.13875.1750662713507588128
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tVlYRdWR;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662718; x=1782198718;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jYH+26lrRgz3I61Uwtgw5o1NEw2JMF5cWP+eq+fLyTM=;
  b=tVlYRdWRgimb4POOKzlW72Ax/x3uuWkfmQMs90Yhq+r6EwV/kNMZotsX
   CSX4rAWQ4Louu69vqgTSI6AGjptfIR0+1BAEX5GmRGMdkwtWEeGwGTTBm
   CJ02qdHJV82rllEQyaiCWBeKcZsBtpCBW7Xg84mNcKAAMOgWPoH6BWoFN
   DUFZxy4gdrqD6hu08v1ctY/hB+5yyMytKVpd7KuV+WKjTweYK5Grmn3Om
   /M4Wu3O61yH7YBVz0C54+V03rR99ptwNbKogMh+0HbkCviO3Lfo4e+HeM
   ru1RpONpIB40Bb6L7ehSGu6AoX6caVDa29lXeJY9tqs/HHRGzhV2J8iPE
   Q==;
X-CSE-ConnectionGUID: jg1sPUgbS7e3Ma7LCaQ8NA==
X-CSE-MsgGUID: YKL/nJoPQZG45k1/hgdqPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="191575223"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="191575223"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:57 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A1358D8E65
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E2DDD7624
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:55 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CA4FF1A0073;
	Mon, 23 Jun 2025 15:11:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/30] python3-robotframework: upgrade 7.3 -> 7.3.1
Date: Mon, 23 Jun 2025 15:11:32 +0800
Message-ID: <20250623071138.402-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118052

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_7.3.bb => python3-robotframework_7.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.3.bb => python3-robotframework_7.3.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.3.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.3.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.3.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.3.1.bb
index 38417926cf..0f205b9274 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.3.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "676f75a58e34db04cde91922c0bc68d4d73f091b6be753809ce16e9579412323"
+SRC_URI[sha256sum] = "10be47f826a5ecff09d08e57bf17fce124d38b6e022b380ce67c526ef747194f"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.43.0


