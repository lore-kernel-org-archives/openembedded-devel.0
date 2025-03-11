Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A382AC35FF8
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.4204.1741683328726289819
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oMLnnECt;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683334; x=1773219334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zv3S3yp0i8bBrTdZxqM7XNo4lZTuo88wiXUDlItif7U=;
  b=oMLnnECtgC1AFWj+cO4l17v31xo6IbvvZUke+0ijVbYxPMdLo08iajF/
   uyOwgeILlShP/T28mE0iEde1S6ei3mwawYu3xdHiofh0pD/DcM7ZMEYOe
   ngQf6mMCtdyGXXsQkt0GIlXOhJttPA+iw/Ga0jH9YOKq48liMtuIcTZlS
   6PXLyPPerrVkw+7TiD3BKwyNVUtalg7bfSDBU8RCXwGsXnuF4yo5ZR77m
   wM4vTrDt3RARAYiX5ZNhT9f0MBzsMcK9jbxzIcs5n1WXbt8I8TZw20QoK
   oOlghNMEAOtd8BFgVnFuNWgSXnzi2GeOX0fGpBfMp4HSdTcNuymeQpjUv
   g==;
X-CSE-ConnectionGUID: 7xqBLb15RqCX1d/FRunaGw==
X-CSE-MsgGUID: hDHQXth7TZaTiYPjI6DEcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192706375"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192706375"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:33 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E537D4810
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CA78FBDC93
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:30 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 90BA71A009B;
	Tue, 11 Mar 2025 16:55:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/36] python3-libusb1: upgrade 3.2.0 -> 3.3.0
Date: Tue, 11 Mar 2025 16:54:59 +0800
Message-Id: <1741683310-8681-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115873

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Improve deprecation warning, by showing the correct caller location.
- Fix finalizer registration errors on pypi by using a thread-safe sequential
  number generator instead of relying on object id unicity and timely finalizer
  triggering.
- Check in-dll version when creating Windows wheels. Should hopefully version
  mixups like what happened in 3.1.0 .

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-libusb1_3.2.0.bb => python3-libusb1_3.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-libusb1_3.2.0.bb => python3-libusb1_3.3.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-libusb1_3.2.0.bb b/meta-python/recipes-devtools/python/python3-libusb1_3.3.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-libusb1_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-libusb1_3.3.0.bb
index 8bbb8d2eb2..8bce352f10 100644
--- a/meta-python/recipes-devtools/python/python3-libusb1_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-libusb1_3.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
 "
 
-SRC_URI[sha256sum] = "a11a6095e718cd49418a96329314da271cca6be7b4317a142724523371ac8961"
+SRC_URI[sha256sum] = "b642aa518689f8e053f61955cba274e72bc8d0794c65d7990745aaae90dfc8a1"
 
 RDEPENDS:${PN} = "libusb1"
 
-- 
2.43.0


