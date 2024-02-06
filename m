Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4917BC48286
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 08:30:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.17310.1707208222955102308
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 00:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sRKcNhVG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707208223; x=1738744223;
  h=from:to:cc:subject:date:message-id;
  bh=swU+BG/m5vzScFTj7x5PuwbS6cUHrQltfHYkME0QgpM=;
  b=sRKcNhVGyf73p/cRluoP2knFjOn1GwlXEBvhEHy6ieMhQgKlOojp+adw
   eWIBakIIdkSqWzGaQhSIHUQ/Kh790ijwYoyrCV97XglkrUq8HN5XlYIOM
   Yz5RqxuFSX71BXuZP6pKvpGIyWVSbpsLob3GkJOBJNV0MimyuYlCkUizY
   Cm2qv0VUEuS9bG2sV/nwP7jJpyvqGe09/abeEsxxGrLsfHsSIyyMj4gHb
   r16Z2mhhdOwzh24okwdfGtXB0SwkoeaJD5LyKXMzZdwLhcC1IHUCwFqLJ
   JoUIolY2BSL9Izq3kmXvzIoIaAzTKAtkpptZMFnqCFzOgIFFo2hZmWbSA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="150259219"
X-IronPort-AV: E=Sophos;i="6.05,246,1701097200"; 
   d="scan'208";a="150259219"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 17:30:20 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C1BC523B605
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:30:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0008CCFA5F
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:30:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 81831E20FD
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Feb 2024 17:30:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1D64C1A006A;
	Tue,  6 Feb 2024 16:30:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gcovr: upgrade 6.0 -> 7.0
Date: Tue,  6 Feb 2024 16:27:29 +0800
Message-Id: <1707208049-5608-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28170.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28170.005
X-TMASE-Result: 10--1.670700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSB1x0KuswXklOn7
	ya/+V5vjMzTo2qNcI5YNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3iqA3
	Rnhce1qgWm/gAtjCd7AYUFsN5WfiF1IFuO7TwhzBoMLOoNHsM9lXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZL+wxdYLO9Px4bibWn8Ns+VT12rtUqpYVOIgxPCxMoGnQUj7
	9aLXOOqvLhXrYzsGKDImWKiDqK2Gdpd1yIConsxXNm785SeahlLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Feb 2024 08:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108610

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/gcovr/gcovr/releases/tag/7.0

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gcovr_6.0.bb => python3-gcovr_7.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gcovr_6.0.bb => python3-gcovr_7.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb b/meta-python/recipes-devtools/python/python3-gcovr_7.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
rename to meta-python/recipes-devtools/python/python3-gcovr_7.0.bb
index bfb0aaf5e..6e5899ae2 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_7.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "generate GCC code coverage reports"
 HOMEPAGE = "https://gcovr.com"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6542fc4ce5904ffb741ef56f8fe33452"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5a58ca91c1758a53f896ba89d8aaac2"
 
 SRC_URI = "git://github.com/gcovr/gcovr.git;branch=main;protocol=https"
-SRCREV = "1221ef62ff0de15bbeaf79e68e08a65d62c73ff4"
+SRCREV = "fc190bcb85a25f5738315434a11f8e993edce515"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


