Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696B6C54754
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8734.1724833559467221116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RQdGmkMz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833559; x=1756369559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FOsDbUMEP+yJGD4sGFM9wfhaC9mVjbCI7IN09xemwOg=;
  b=RQdGmkMzSm37lViZSUAEup2GZwN3kfeAzUm8VXFEEr+XqrCWNT/V6/yj
   lmbBkRCbC7GJI5O85toPMMQio9fQV6+C25VobYwUtZswD7HvxM3WFyfP2
   x1CXHzw8qUi6STfbv30e70oZJ+zMrDgSy5pLB+GGEkwON7kQcveX7ZJbO
   QeIaBZDLrfvLJDxVqcVMACsUFyKDHj9yciAEXqk6HMpWIBCCpTDYeh12W
   wcX1s9aw531ZIKlyK85OZuCalwQ3ss+w/abx6OP0jy8gG/OWKc9s9EIya
   NZE3yVb0hpOLES3UrbjPwdDKSWerBM8eYYFsVJAXOyBa1qbYVmlW90o+0
   Q==;
X-CSE-ConnectionGUID: 1RbVdPcHSca4PtrnQGGFmQ==
X-CSE-MsgGUID: vrXfjPrMQmaxD8dRhx9cXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171913216"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171913216"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4EA92D922F
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8580AD4BFC
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BC756BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BD5871A0002;
	Wed, 28 Aug 2024 16:25:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/46] python3-types-python-dateutil: upgrade 2.9.0.20240316 -> 2.9.0.20240821
Date: Wed, 28 Aug 2024 16:25:18 +0800
Message-Id: <1724833525-2162-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--4.490000-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbys6HV5wETgDxdnf
	JrUSEbFD/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrN6eNzRMFhZMndNoXv6UJm+f0iF5TZPPO8K3Ma88LL+bn0tCKdnhB589yM15V5aWpj6C0
	ePs7A07Z5Vb9l0vnaPKY61l6rHy2k+CDVsAlnv3UrsHxTfXRiUupn7hbuInYg0ZU4OarNPMgiUy
	rvOsuh/gaXJ/FcRsOHvOnnxPbVRvLGB1OKT4jcB8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112017

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix types for python-dateutil's relativedelta

License-Update:
 License changed from "Apache-2.0 license" to "Apache-2.0"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python3-types-python-dateutil_2.9.0.20240316.bb       | 8 --------
 .../python3-types-python-dateutil_2.9.0.20240821.bb       | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240316.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240821.bb

diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240316.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240316.bb
deleted file mode 100644
index 4b786066f..000000000
--- a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240316.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Typing stubs for python-dateutil"
-HOMEPAGE = "https://github.com/python/typeshed"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1608a4a9c7b578e"
-
-SRC_URI[sha256sum] = "5d2f2e240b86905e40944dd787db6da9263f0deabef1076ddaed797351ec0202"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240821.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240821.bb
new file mode 100644
index 000000000..f79edaaaf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240821.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Typing stubs for python-dateutil"
+HOMEPAGE = "https://github.com/python/typeshed"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462545aeb1356ad23"
+
+SRC_URI[sha256sum] = "9649d1dcb6fef1046fb18bebe9ea2aa0028b160918518c34589a46045f6ebd98"
+
+inherit pypi setuptools3
-- 
2.34.1


