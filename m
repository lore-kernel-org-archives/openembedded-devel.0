Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121F9C07E8E
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:39 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2716.1713318089007029656
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qyt8BIoo;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318090; x=1744854090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CKvMRuBFcEdR6GPdvU1TW2QNs4nVTg3nZcSCUU1zhi8=;
  b=Qyt8BIooPnS3AD1B5tnFs5Ty5EaZTyaXXBY5ABFvqVAR6WQAqXzCb8yS
   GtyS6dN0jEHDRiM8VTRzm1Lk1QLcmq10UMMzxnKNF8A9AFx11Y+fo9aXz
   mhqhg5Vpcoo/E1eZApIlFSMte+PZTyMu03K4L7e88rAV8SYhy/r0Rqyl6
   0pMumolQ3O01olJv3VW9JDALuVSrqWkE+u5GUeKToXKIDRu1Hkh0EaUAK
   a0iNSbbbw44GCXtzvUmncqcf3fnQ2o3n3w0OWebM5IfZ/ZNMnJggN8+TU
   rVIMUsPREIINzWnKx6FtaGmY+CCkivh2JbZ6G4PBPJzcttGy4WHK/Ar3D
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="155778449"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="155778449"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EED9279D0
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:23 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BD7C51660B
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AC33200932D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CA0171A0002;
	Wed, 17 Apr 2024 09:41:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/49] libopus: upgrade 1.5.1 -> 1.5.2
Date: Wed, 17 Apr 2024 09:40:24 +0800
Message-Id: <1713318061-17128-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10-2.713900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrG24YVeuZGmMli8Y5a0svL1og
	3qNekgos4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16u0p9
	DaZRzoN1af/8Uw5sGwnqJYosjSXtjGA7i8sktz/XdCok3ibXlQX0tCKdnhB58I/9UW5M5dRMQpr
	Z/7WnuveTCMddcL/gjxlblqLlYqXK+N6AGmnXjDj0PEcqVNqKQq8diWJYT5/2ZEA269OgTPrOTk
	q3bOVO9Iw74eOlqIEcjnGIpIy3Ef9yhadDbdbVbb3uf7C/CZ6r+v9v52ZIoWjoAf389xF3XFSk9
	HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110001

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 fixes a misalignment issue in the AVX2 code that could cause crashes under Windows.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libopus/{libopus_1.5.1.bb => libopus_1.5.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.5.1.bb => libopus_1.5.2.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.5.1.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/libopus/libopus_1.5.1.bb
rename to meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
index 4ce6dd202..02958ef02 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.5.1.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.5.2.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4b365c2155d66e550e1447075d6744a5"
 
 SRC_URI = "http://downloads.xiph.org/releases/opus/opus-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b84610959b8d417b611aa12a22565e0a3732097c6389d19098d844543e340f85"
+SRC_URI[sha256sum] = "65c1d2f78b9f2fb20082c38cbe47c951ad5839345876e46941612ee87f9a7ce1"
 
 S = "${WORKDIR}/opus-${PV}"
 
-- 
2.34.1


