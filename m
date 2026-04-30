Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B7DCCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17442.1777546200651331781
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aKF3i+aI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546200; x=1809082200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ySUzfB9N7Z/SG7msp/txL7XlTN2hj/gpDe36eyvUdwA=;
  b=aKF3i+aIjUMGQXIKjOJPMWD/L8vM9IBuk7LtJLFI7w7ev9WWUUBA5qo+
   20uAgq0+IrA4QGwneZffhHtlsnCt/IFn/CH+jmHe5BEIIwXZyh1Vb0Cua
   HnOh/R77RonyjVsti3NwpoaxTHfiG9yAvFhbt0yZK0rDksuTExFmNs3JC
   XJ4wUHjStGg5o21iW/a+mCPXwthKbolAmrKfCvA0Rn3XSbUIl2zDO2zmF
   sUYtooWcPAeJVa7BfHtHj9gcMFDoEj2MY5K91tD9BxE7O6QNR8d3jAsv0
   /K1avi8Ngipo+QOTRkz4lLQ8ih391wdtt5Sw+JzmsJoQD/0zz4OLsrsX9
   w==;
X-CSE-ConnectionGUID: /WwbRGZ1Q5GDxQ5N+0wcPA==
X-CSE-MsgGUID: t3Nb/c8wRQuJQUjBejHkVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238552668"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238552668"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:59 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 22528820426
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:59 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D23C98D65E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:53 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 77543180113E;
	Thu, 30 Apr 2026 10:49:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/64] libblockdev: upgrade 3.4.0 -> 3.5.0
Date: Thu, 30 Apr 2026 18:48:35 +0800
Message-ID: <20260430104924.1106-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126687

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libblockdev_3.4.0.bb => libblockdev_3.5.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_3.4.0.bb => libblockdev_3.5.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.4.0.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.5.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_3.4.0.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_3.5.0.bb
index 2263e0bbdd..d7395bef44 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.4.0.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.5.0.bb
@@ -12,10 +12,10 @@ inherit autotools gobject-introspection pkgconfig lib_package
 
 DEPENDS = "autoconf-archive-native glib-2.0 kmod udev libnvme"
 
-SRC_URI = "git://github.com/storaged-project/libblockdev;branch=master;protocol=https \
+SRC_URI = "git://github.com/storaged-project/libblockdev;branch=master;protocol=https;tag=${PV} \
            file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
            "
-SRCREV = "c1053b3643f0b4f3d4549ac8f3ae85fdecbb2c72"
+SRCREV = "065d6910a0e915dbe633356da7bad9c4b3a2e2b9"
 
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
-- 
2.43.0


