Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA92CC36012
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:29 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.61110.1742893331453657027
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sx1DlQfs;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893340; x=1774429340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xWFAVnIVjEynHFwoLtrvFnrB4LJPZldCzWK0nrUnyaw=;
  b=sx1DlQfsEHCvCMImiCt5gfQUwtIlC6uFVo4urligyiRFzINbVZEe81RF
   r23t6py17U52WSII0H8mvhRYGwmxReGy0DYvsXCrD5nSHZQNllR2ImKTq
   V9MwXlCodzDhIZ3ptwwE/2hdKVrgcswRkvIFdhKadafzo4HPGSWl9HZ1i
   shJJRjV3AbC3cPnvj6uCASZMoRBXk+4+gQqyt++tv5a+qtPDXMHlz/D9P
   vG1b2qvaIYyT3h2MXaGRtHDfoCBWgXZZQnJ6Pgi1F31zlbyIawTT8W9e9
   SFxTHJ68m2zmOzacK7W14wRUVuh/c8lnEBaY/cvJf7bHH6SJom6oTHDqP
   g==;
X-CSE-ConnectionGUID: tOGjGzQwTVWV7K4P7Cri/Q==
X-CSE-MsgGUID: E/8A14PeQtqZBQwmfqmmIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="173638116"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="173638116"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:19 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C804EE689B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B825D8B32
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 25C961A0078;
	Tue, 25 Mar 2025 17:02:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/45] python3-dbus-fast: upgrade 2.39.3 -> 2.39.6
Date: Tue, 25 Mar 2025 17:01:31 +0800
Message-Id: <1742893312-3809-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116246

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Don't limit python upper bound
- fix: adjust pygobject pin to required python < 4
- Remove workflow from previous failed attempt at testing big-endian
- Upgrade to ruff 0.1.0 and fix violations
- Multiple calls on the root logger instead of module logger
- deps-dev: Bump setuptools from 75.8.2 to 76.0.0
- pre-commit.ci: Pre-commit autoupdate

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.39.3.bb => python3-dbus-fast_2.39.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.39.3.bb => python3-dbus-fast_2.39.6.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.39.3.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.39.6.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.39.3.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.39.6.bb
index 5eb7672d0a..3ca220b72e 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.39.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.39.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "84b4ff23bcadfa794842e8d3eccb521907f7c6cb8d6534c895995840306512aa"
+SRC_URI[sha256sum] = "fc3349ffea522d137d856f8967129dd4b87394c0bf8b8b1648295c5eb0a457fe"
 
 PYPI_PACKAGE = "dbus_fast"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


