Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F44CAC5B9
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:14 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.15057.1758015723129926724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HWsd9eg5;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015723; x=1789551723;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hseOFBE/cF17OVaMhdlQQyDgljHA8UH51OJJyr4WdEg=;
  b=HWsd9eg5HpzkoNeeJAwUbOL0Do91O9Jvq9jBSvjlA+ROP+7JjZFFVPj3
   CgdT7HImIbtDdwc2WSpJYPqd4JgrUOYHAua7uNY1i78eUj/vfiQSniL5o
   ueyHr3GOeOEXQyNmK/GYO+Crwbqdj+lsin5R7h2sW3+JDg2kbfvsG0YtP
   vUe9MELSfThDXJrmFysFsqU9Nh/x4BnBiYg2lW7SfPrrCKmsYWSSB/5BH
   OgjXRBgaPgcJjRTn00moVMBQkVYCXRjSlbHcLeDg3odr8PcwIJPQpj80Y
   gebQC/DKL+AaAdIIhNA9h/P4hvB9CWGzK3J4L2xEDtU12BwavEYwUOLlr
   g==;
X-CSE-ConnectionGUID: nvhHqgp/RmSzpGDFkFYqiw==
X-CSE-MsgGUID: Ab4VhuCjRM+TSlcU4gdJiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="216458823"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="216458823"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:01 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 81F821000343
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:01 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3E7491000266
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:01 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 8DA8B100311E;
	Tue, 16 Sep 2025 09:41:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 28A5A1A008B;
	Tue, 16 Sep 2025 17:41:56 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/42] dool: upgrade 1.3.6 -> 1.3.8
Date: Tue, 16 Sep 2025 17:41:14 +0800
Message-ID: <20250916094152.1479-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119426

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/dool/{dool_1.3.6.bb => dool_1.3.8.bb}    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/dool/{dool_1.3.6.bb => dool_1.3.8.bb} (79%)

diff --git a/meta-oe/recipes-support/dool/dool_1.3.6.bb b/meta-oe/recipes-support/dool/dool_1.3.8.bb
similarity index 79%
rename from meta-oe/recipes-support/dool/dool_1.3.6.bb
rename to meta-oe/recipes-support/dool/dool_1.3.8.bb
index 074c8928b3..1c7350e871 100644
--- a/meta-oe/recipes-support/dool/dool_1.3.6.bb
+++ b/meta-oe/recipes-support/dool/dool_1.3.8.bb
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1ebbd3e34237af26da5dc08a4e440464"
 DEPENDS += "asciidoc-native xmlto-native"
 RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"
 
-SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=master;protocol=https;tag=v${PV} \
-          "
+SRC_URI = "git://github.com/scottchiefbaker/dool.git;branch=next;protocol=https;tag=v${PV}"
 
-SRCREV = "a52e710f74aad0eae46c5aafdb137070b4c00fe3"
+SRCREV = "b74503e2dfbca8ef01c284d40aa77dc82be308b9"
 
 
 do_install() {
-- 
2.43.0


