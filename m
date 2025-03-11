Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA63C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.4204.1741683328726289819
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vomk/iZ1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683338; x=1773219338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FzpJ1B69mORp7yzet0bLObL1YjuuZrI4Bie1Q/ed2xE=;
  b=Vomk/iZ1wekj3GH4kmBEoLcVB+qeOc8skNru1iyUoVBxYOs/rilW2jnY
   oB6Wu/0rFVtuu9RoyOFiFcGZ8Vq4DO/WJPRU/e+ouloaP17sf9MSqTKpz
   k76uBe0di5skSjcPIiiBQo1PhBm4gIkeq/6ASBqo0JosJdNNLGRv2xngM
   5ux+gN3RSCgexW2dxhi6w1v/i8jlR2uHvqTPWAeMo++s5mXcVUICjKUkL
   hExsLqKIDtfw1nIP3o3lGjiHeJNgmJYU+tY8gtQo5Lo6QUFB1m3BVboU1
   9HGv9K3QzzTSksL0b1/aTOCgyWtz/dvST/B5UqJePY5LGrCi8IzXxqE2f
   g==;
X-CSE-ConnectionGUID: byEnfp9MTdqrWtfCQU7VEw==
X-CSE-MsgGUID: jMWN+G0KR6yooWvn96NzgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192706380"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192706380"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:36 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 05CC1C2260
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BC5ECD8B74
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:33 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 81C321A0071;
	Tue, 11 Mar 2025 16:55:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/36] tftpy: upgrade 0.8.2 -> 0.8.5
Date: Tue, 11 Mar 2025 16:55:08 +0800
Message-Id: <1741683310-8681-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115884

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/python/{tftpy_0.8.2.bb => tftpy_0.8.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{tftpy_0.8.2.bb => tftpy_0.8.5.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/tftpy_0.8.2.bb b/meta-python/recipes-devtools/python/tftpy_0.8.5.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/tftpy_0.8.2.bb
rename to meta-python/recipes-devtools/python/tftpy_0.8.5.bb
index c1b3234f72..b2c7467df6 100644
--- a/meta-python/recipes-devtools/python/tftpy_0.8.2.bb
+++ b/meta-python/recipes-devtools/python/tftpy_0.8.5.bb
@@ -8,6 +8,6 @@ HOMEPAGE = "https://github.com/msoulier/tftpy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=22770e72ae03c61f5bcc4e333b61368d"
 
-SRC_URI[sha256sum] = "e1d1a680efd88eba176b351175844253067392a9b0f8b81588e3ff2b9e7bbb5b"
+SRC_URI[sha256sum] = "dd38e3744530d0c30fa1c715d7fa454319bc8d399bb40c05839cc771f05d0e6c"
 
 inherit pypi setuptools3
-- 
2.43.0


