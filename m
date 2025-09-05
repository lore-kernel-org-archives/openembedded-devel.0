Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE656CA1002
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 02:04:02 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.11794.1757037835844980620
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 19:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XED7zd/f;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757037835; x=1788573835;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HWdxJH7hDNnS2rRcfoDACnCUHT7aQaJU6Ke4F33jzrc=;
  b=XED7zd/f/IaaYG/WpXHl5dK3HFicpPzZuM0EBU1aTr3FZkigib/avxY1
   qT6nKdcI6M7DWbZXPapBWYPqYrx5haxu7gSeEqNROXk5aB4cUUU9jJwsV
   gbrIRiYKEsXgQS5xLepFIhZjHlH1AqVxVPW7vIzjrqPJ3NhDTUH0Pk+Ur
   +vXgGsq3RM98JPdyB3IsKGgw5U+NlNIfmosBg0H27EKEsOPD8bFd8XG+z
   ZObn4biCEYyh7gsYB5K/WvyHgzVj3GRkSOsnoPxPcX1b7Rl6+oCbJB8Y8
   oh6W7+GYXR4++4aF2+sRq9Xq8o0fFGRrWYufH7PVSLq0xUSnH72v6G2Ar
   A==;
X-CSE-ConnectionGUID: eIrqZaSaT5G12Z9gLFxaVw==
X-CSE-MsgGUID: 1V3gq3A5T0W88sSNoQDDQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="190671995"
X-IronPort-AV: E=Sophos;i="6.18,239,1751209200"; 
   d="scan'208";a="190671995"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 11:03:53 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 001831467
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Sep 2025 02:03:54 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A8EDE1802AFA
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Sep 2025 02:03:53 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 722811802248
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Sep 2025 02:03:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9C2281A009A;
	Fri,  5 Sep 2025 10:03:47 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] sysprof: Add dependence to fix do_configure error
Date: Fri,  5 Sep 2025 10:03:45 +0800
Message-ID: <20250905020345.770-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 02:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119308

From: Wang Mingyu <wangmy@fujitsu.com>

Error message:
| Run-time dependency libdw found: NO (tried pkgconfig)
|
| ../sources/sysprof-48.0/src/sysprof-live-unwinder/meson.build:3:2: ERROR: Dependency "libdw" not found, tried pkgconfig

Add elfutils to DEPENDS

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
index 968b5d8e14..411fb624d1 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_48.0.bb
@@ -15,6 +15,7 @@ DEPENDS += " \
     libunwind \
     libxml2-native \
     yelp-tools-native \
+    elfutils \
 "
 
 SRC_URI += "file://0001-meson-Check-for-libunwind-instead-of-libunwind-gener.patch \
-- 
2.43.0


