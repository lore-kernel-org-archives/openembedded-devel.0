Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BEDC47258
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 06:36:56 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.17690.1706855814730994331
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Feb 2024 22:36:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K/l6pVd3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706855815; x=1738391815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ILEXeVrPp+ZraUHlTnPWXO7f+bF8zJI4FLwD8z6cvHg=;
  b=K/l6pVd3EFDDqneCfhkVVTTQM+bl5uFGESXg88J2vhRFcmamiqjyGbzw
   JE5qWoSSXDI5RXuShWFlqZER7n5dsnVu2BYoeOoxqCwKTlf0yMp7dAADa
   QlMYWKlB3Fd8UYHEPjKjl+5sXM2z2cdiQHFTqqm19rkCrkAzkQkMebjPY
   RMlHZzl0w7JLrDkX4mrHlXht/ko/ymiQiAR/Ge7r2gOMUtdGLBnMIcHbI
   7WIpekDZLdQ0j9b2DzSKFoOOkJi19obP0eM2AElAmWK7xZJ5Y1JJmHl3L
   kjOCb/AMaQKw0iXi1oEJ1GjbyXTORNWoDJoZUqFbYbDHoyX29km82caT8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="127531566"
X-IronPort-AV: E=Sophos;i="6.05,237,1701097200"; 
   d="scan'208";a="127531566"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 15:36:53 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 266602443DC
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Feb 2024 15:36:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 564F0D4F61
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Feb 2024 15:36:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C438C6BC47
	for <openembedded-devel@lists.openembedded.org>; Fri,  2 Feb 2024 15:36:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 665731A006A;
	Fri,  2 Feb 2024 14:36:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 2/2] czmq: Fix buildpaths warning.
Date: Fri,  2 Feb 2024 14:35:46 +0800
Message-Id: <1706855746-22640-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1706855746-22640-1-git-send-email-wangmy@fujitsu.com>
References: <1706855746-22640-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.005
X-TMASE-Result: 10--1.491800-10.000000
X-TMASE-MatchedRID: qil26QSh6dU6BiAI7o4CZhmCYUYerLHrN5dqZcIK7Vgg9R3V8qg5xL8F
	Hrw7frluf146W0iUu2uDEauN+IlduVxxDx5qbkR9FEUknJ/kEl5q8/xv2Um1avoLR4+zsDTtpmd
	/ehreR4VlZESiTEOIPYVtPJma/CYfEi1hMxYIGl7yiUbBl18jNmalcz+WnDJocfuSz+h/VTP1dl
	oQtYiaUPEE0zHXsI5xQgHw4UoduBXyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 06:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108527

From: Wang Mingyu <wangmy@fujitsu.com>

WARNING: czmq-4.2.1-r0 do_package_qa: QA Issue: File /usr/lib64/cmake/czmqTargets.cmake in package libczmq-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
index 32be9cd09..5ae72df86 100644
--- a/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
+++ b/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb
@@ -37,4 +37,5 @@ PACKAGECONFIG[uuid] = "-DCZMQ_WITH_UUID=ON,-DCZMQ_WITH_UUID=OFF,util-linux"
 do_install:append() {
         mkdir -p ${D}/${includedir}/${BPN}
         mv ${D}/${includedir}/sha1.h ${D}/${includedir}/${BPN}/.
+        sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/czmqTargets.cmake
 }
-- 
2.34.1


