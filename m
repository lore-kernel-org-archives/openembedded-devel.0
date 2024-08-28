Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E057C54750
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8729.1724833560542971353
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:26:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mS/Wdn09;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833561; x=1756369561;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=tNI3taP8Ad5U93v8glieZxM543jlhnHkNaZZynrD2yc=;
  b=mS/Wdn09F2dzMSxUUe5T8GWWjj5qk/J9LBmw6apZBD9XiX5q4omotVdU
   gqJ38JTO0wXT3+tB0ri069JIGHAYyPKmMyeXlr3pO+qvl9pSvy1LYt5SD
   CW6QfMle8lN7YINyuzPcMVBYQa084JUT/8kAT0RngPjv5qqtJ7m28YVS1
   pomey/ep/OT5nXxjEVsn3bKkle+v43Egof0pewgN1GC0QUoGM9Ygfww3p
   OYCVu+k7Bcb7w9imoW92yfU2MAAH7Bta5YUjIdp3JGz0cIAEymotnhgfs
   2HEd8PNWlTVyadBm/sfLdmh1YouXcEXyxQgLrSK/y7NIA+t7hcrCc7mrp
   w==;
X-CSE-ConnectionGUID: uVpmWrZcTDekOjl2NjfubQ==
X-CSE-MsgGUID: PLTYtWzsRRKWoaDCFZ8qLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171952050"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171952050"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:59 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C5CA2D9223
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:55 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D1D4D4BF9
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 97A8520079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 41C221A0002;
	Wed, 28 Aug 2024 16:25:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 41/46] python3-types-setuptools: upgrade 71.1.0.20240726 -> 73.0.0.20240822
Date: Wed, 28 Aug 2024 16:25:19 +0800
Message-Id: <1724833525-2162-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--5.826000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr/1vXbkGjWeU6HV5wETgDxdnf
	JrUSEbFD/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrN6eNzRMFhZMndNoXv6UJm+f0iF5TZPPO8K3Ma88LL+bn0tCKdnhB58I/9UW5M5dRMpg5
	yOcdoVgo6HM5rqDwqtNPvHlIf/abu+DV/wMslqNhFK+h0m+w2FRDN31ICqqC4VcjhEW8vdAw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112018

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Update incorrect or incomplete constants in distutils
- Use Generator instead of Iterator for 3rd-party context managers
- Bump mypy to 1.11.1

License-Update:
 License changed from "Apache-2.0 license" to "Apache-2.0"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-types-setuptools_71.1.0.20240726.bb | 10 ----------
 .../python/python3-types-setuptools_73.0.0.20240822.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-types-setuptools_71.1.0.20240726.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-types-setuptools_73.0.0.20240822.bb

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_71.1.0.20240726.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_71.1.0.20240726.bb
deleted file mode 100644
index ace198d04..000000000
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_71.1.0.20240726.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-SUMMARY = "Typing stubs for setuptools"
-HOMEPAGE = "https://github.com/python/typeshed"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1608a4a9c7b578e"
-
-inherit pypi setuptools3
-
-SRC_URI[sha256sum] = "85ba28e9461bb1be86ebba4db0f1c2408f2b11115b1966334ea9dc464e29303e"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_73.0.0.20240822.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_73.0.0.20240822.bb
new file mode 100644
index 000000000..2eaa2d136
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_73.0.0.20240822.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Typing stubs for setuptools"
+HOMEPAGE = "https://github.com/python/typeshed"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462545aeb1356ad23"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "3a060681098eb3fbc2fea0a86f7f6af6aa1ca71906039d88d891ea2cecdd4dbf"
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


