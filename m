Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB4FEDE99E
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:31 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.18330.1725959003202735294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jkpXeih+;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959009; x=1757495009;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+YShI9O45rzY0rFk6dqiYgakdDHNwyzr72u4ISOMRfE=;
  b=jkpXeih+SDMceYp9MuV5a3cgrjBodIuA3ki71LAx4w2okXrPE3/Wzz8m
   Sru+1etHmKuSRHRe9PdL7a4MCLzfAuX4j/Y57DNAl8TWTemv/2WIV9ZaF
   5PfcjhU9WkyboATqULYcZ07U0smR0o3WIkFdF0dfT4j1nUMJAdaE9f/7h
   Yzj/yFBgy/GPeRc18qr9tmH597kmF4shNxoM7eqYsXgi6X08A0ul7eooe
   JymG2vWJ0h2tQ/hdulqhjODlGjyLaNF7eMiDa+DzoUmZ7kKnA4PY6GRig
   KQfamPk5HL24Pm+Sv86TMcyHcKyxA4J+6aUaRUY7B7I34FV2YiqBRetUU
   w==;
X-CSE-ConnectionGUID: KrkN0Y0YRQy43L32EaCO6Q==
X-CSE-MsgGUID: FtIop9etS5yAlMTfoplciA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="161244769"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="161244769"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:27 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 12F2ED2AC9
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 50D7BBF3C0
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DEA7D200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 926C01A000B;
	Tue, 10 Sep 2024 17:03:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/42] python3-dbus-fast: upgrade 2.24.0 -> 2.24.2
Date: Tue, 10 Sep 2024 17:02:45 +0800
Message-Id: <1725958990-5719-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--1.125900-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/ySrLqyE6Ur/jF4r8H5YrEqz7fZJfDdCIXC+I
	lhyKgys+KqrQ7lLcMnygKELwwYMNFm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6w+w
	OvCmbSjNrAAEjuBji8bfRmOFm3jwWfcoOfgOovZq/B3jK0s6iFpqZ8RAYUdwlypSN8LD3EQ+5LD
	xQ1eUBDjJL4FUB4IUSCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112201

From: Wang Mingyu <wangmy@fujitsu.com>

Fix:
=======
- Ensure build uses cython3
- Add missing cython version pin to the build system

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.24.0.bb => python3-dbus-fast_2.24.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.24.0.bb => python3-dbus-fast_2.24.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.0.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.24.0.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.24.2.bb
index a1cb537b3..ccac69924 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.24.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "72b59c51e882300fd7f6d5bec8fb84ae8dea58040ade1d15c62c7fd9fa546f35"
+SRC_URI[sha256sum] = "20c517dc70dbc940b8bf2e0f079abf3dfe821fdda3013641a17e3d8f18e131ae"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1


