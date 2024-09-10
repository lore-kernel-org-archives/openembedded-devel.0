Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EE7EDE9AA
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.18594.1725959008382244695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gjx46kiQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959015; x=1757495015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1ykBQeAHauUhaH+exmHVattay+6E8z4kW4TXr0GYNvw=;
  b=Gjx46kiQn+3wrlv4w/QBzLJWMsimv46z4YQqMMVNHC3jePnctlSQwlES
   18lnhwyR/4E24SO/zbklPFL2y7GlUDkFC6ZgLoXTvorDhvfIxoSVjte1p
   RgjM6ZmCrCbLdgMttJ95Tv6T6JSzgWNQDYBfR0Khhrxazg4yJ2CR8G/RO
   GBG0EbG5O5A8feYOrCInbSe0/HBytE2RS+tGGvbRx3BGEgWbGxq1lfJqF
   DOehSST8pOqrDxmRRgWVFiqH6GObANYxw+ahnDn6OD/tTpJ+T/P01hX3d
   k2uK4kSVZgeELYiL/j+Wi6hS6nMy34cPFn5NKaAxLhIH/QpTjqCDPY3Cv
   g==;
X-CSE-ConnectionGUID: wGSZQVjkQ+uNSNyOUeFx7w==
X-CSE-MsgGUID: 6nVJlPziR4mhjO/7AWA6/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="160627414"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="160627414"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A9CEDC68E7
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DCAFAD50EF
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E29E6BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 20C4B1A000B;
	Tue, 10 Sep 2024 17:03:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/42] python3-types-psutil: upgrade 6.0.0.20240621 -> 6.0.0.20240901
Date: Tue, 10 Sep 2024 17:03:00 +0800
Message-Id: <1725958990-5719-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--4.490000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yYMilwFDj2JEpxAd6mi1Ga0eZzJlaRLGxdnf
	JrUSEbFD/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrN6eNzRMFhZMndNoXv6UJm+f0iF5TZPPO8K3Ma88LL+bn0tCKdnhB589yM15V5aWpj6C0
	ePs7A07aZnf3oa3keFURiQeNh3hKmqBG3Vtgkw4L2Ajod1p2LUb37NSO4MffM3tY7iO3R1zkyMn
	/UEv60BhUj9kyQBUcUH5CQjb3ClOgFoXdMTiLPZ8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112218

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: "Apache-2.0 license" changed to "Apache-2.0"

Changelog:
 Fix types for psutil.cpu_* functions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-types-psutil_6.0.0.20240621.bb      | 10 ----------
 .../python/python3-types-psutil_6.0.0.20240901.bb      | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240621.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240901.bb

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240621.bb b/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240621.bb
deleted file mode 100644
index 92acdc4fd..000000000
--- a/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240621.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Typing stubs for psutil"
-HOMEPAGE = "https://github.com/python/typeshed"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1608a4a9c7b578e"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "1be027326c42ff51ebd65255a5146f9dc57e5cf8c4f9519a88b3f3f6a7fcd00e"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240901.bb b/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240901.bb
new file mode 100644
index 000000000..331756e46
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_6.0.0.20240901.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Typing stubs for psutil"
+HOMEPAGE = "https://github.com/python/typeshed"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462545aeb1356ad23"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "437affa76670363db9ffecfa4f153cc6900bf8a7072b3420f3bc07a593f92226"
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


