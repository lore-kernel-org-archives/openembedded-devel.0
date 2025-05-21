Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0788EC67861
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:07 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6745.1747818004731831507
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J5UGenOz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818006; x=1779354006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HosV0dNb4AqQQyv+mDBdPngtbwyHI93QQYI07NZc1Co=;
  b=J5UGenOzDLRnx5Xf631ZpzpwSCMNh+yHEqi/GIT0DxKFeX2Q43gTerlr
   lt3mRGM4yFvoO/i/e6/7nQ5YoTIyG95qzOcaz0NSLsWCQr4CLyk3jWcdA
   nYEKhHIJKk2RuU6fOvwSkA9W8AelSSo+1JATpm6AQvy8qZkVyOSP9LTCM
   D8xMBdnut8+xM/oQ4sAoft7ogPxB81DQww27thWTduxxXBSXcRvT07lqE
   Dk2kQ4rY4NIk6j86plzSrZJUucudi/QgZchXoAOVEXZ+SIbDE0Xxzy5y4
   WeM3ZjIDNNJX8jz/1+9ysVbKRznQ534aO4Wxylki/GF8m37IzvFnnfJHq
   w==;
X-CSE-ConnectionGUID: mm4jy7nERWSGsNQEQLHoMg==
X-CSE-MsgGUID: WC0htXntS5WRUdDI75DbRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="203136725"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="203136725"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:05 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA81AD8E64
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 63375BDCBB
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 18:00:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EB8E91A009A;
	Wed, 21 May 2025 17:00:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/43] python3-zeroconf: upgrade 0.146.5 -> 0.147.0
Date: Wed, 21 May 2025 16:59:32 +0800
Message-Id: <1747817972-28874-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117566

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add cython 3.1 support
- Cython 3.1 support
- Cython 3.11 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.146.5.bb => python3-zeroconf_0.147.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.146.5.bb => python3-zeroconf_0.147.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.146.5.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.147.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.146.5.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.147.0.bb
index 63383a6079..d2ce53905f 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.146.5.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.147.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
-SRC_URI[sha256sum] = "e2907ce4c12b02c0e05082f3e0fce75cbac82deecb53c02ce118d50a594b48a5"
+SRC_URI[sha256sum] = "f517375de6bf2041df826130da41dc7a3e8772176d3076a5da58854c7d2e8d7a"
 
 inherit pypi python_poetry_core cython
 
-- 
2.43.0


