Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0C7C3ABAF
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:54 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.7602.1745900152042896936
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C6Rx+LzI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900154; x=1777436154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vz/zFAKA9S/JIaQ6SHD/whDTcGnfRhTWfeWIw+7avFA=;
  b=C6Rx+LzIR/amFGJP7m9Ake4Mil6XLGOmZamtGP7tgK+2Sr8kbesYY19l
   DvG3ecFZSMDASeWdNMOqV5hJeLx3MtUlS/L/MyZdDWOTBlIXXEXDIGp69
   LwxCitTcSM61Qz/ehYIPjDbxxxGojfOVkklT0GSzieYRNt4inLRAsfK+h
   lNZQqiJAM2e0xe44qAV4c7EWaX6nzQVhwjJ37QzQ9ehPQUaaDg3bEMlES
   GaWRFtoD0KsmQUubxtXdEld/gY2B06DJzGeoPosaNd2vOGYf9ciVykV9/
   5v1SzK9o2FFq6J7OseGOhV7izoQIU2WAqNRXlgjfj+5jwMJRQ3VZDv2Y2
   Q==;
X-CSE-ConnectionGUID: EtRRJuQdRI6LVBcKzpp3RQ==
X-CSE-MsgGUID: YONkwD5lTy2URx0+hRKDKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="197987829"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="197987829"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:53 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 386FADBD42
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EAADBD88A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AD6F31A0071;
	Tue, 29 Apr 2025 12:15:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/23] python3-inline-snapshot: upgrade 0.22.3 -> 0.23.0
Date: Tue, 29 Apr 2025 12:15:32 +0800
Message-Id: <1745900138-26424-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117219

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.22.3.bb => python3-inline-snapshot_0.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.22.3.bb => python3-inline-snapshot_0.23.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.3.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.3.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.0.bb
index ff814ea1a4..0442f74f92 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.3.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.23.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "34c02a8567dafc88bb720872edde792ff5e665c8726f6af3bfc5fa85dd0016be"
+SRC_URI[sha256sum] = "872d027b1eae4e3e3b4028e0d46128bafbf62889a2424a2667dbe4b69cb1ffdf"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


