Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100EFC7EE2E
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.13711.1750662715422368177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I9FLwVu/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662715; x=1782198715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fJFPyNY94Sc4d7T4O3zHe58DQOVyowNrYbvvYybtBug=;
  b=I9FLwVu//L3EAf1nrsUy/mvkKmM7JxG1x2Q84Gn9YlXGca5vCr/p9/Gd
   0EwfftCQF2C4zcbIh7CwH/Q0r7BKwWziGBqInO5O/65hutIMUVDdYFwmM
   HZ6DRzvxxNLUC+so04ZXUw+lF+gvNFI6pH+fiLkNHkNJBHYBmkhtFYBIU
   0K39fvQQiyPB6uQS+UzuHmwRMltl8j9ozp9RUPJhTBK6wbah39MkZR+A9
   QyxnU8vq22tx0mGKoVv0SvOhn3AlrXI4TPTiUOP5Mw+gxWIwixhiuo6Qm
   IH4daJJQso34TEjRNm8qf/5024k5N6OVIIWv49n2bbaCyhj65yog4ZYT5
   Q==;
X-CSE-ConnectionGUID: LkRdI/1cRQW/uJ2dH51J+Q==
X-CSE-MsgGUID: UaEl9LZvSliSPFHi4Tyb2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="203633438"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="203633438"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:53 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 012BBE0ABE
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2B97D4E07
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:50 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 45A611A0073;
	Mon, 23 Jun 2025 15:11:50 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/30] python3-drgn: upgrade 0.0.31 -> 0.0.32
Date: Mon, 23 Jun 2025 15:11:20 +0800
Message-ID: <20250623071138.402-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118044

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drgn/{python3-drgn_0.0.31.bb => python3-drgn_0.0.32.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/drgn/{python3-drgn_0.0.31.bb => python3-drgn_0.0.32.bb} (97%)

diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.32.bb
similarity index 97%
rename from meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
rename to meta-oe/recipes-kernel/drgn/python3-drgn_0.0.32.bb
index b1ff8d4019..31674ffec0 100644
--- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.31.bb
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.32.bb
@@ -6,7 +6,7 @@ LICENSE = " LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c83d30e99508d6b790eacdd3abab846"
 
 SRC_URI = "git://github.com/osandov/drgn.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "8209a147fb61deed38ca376d063bbff0343ca234"
+SRCREV = "348d6efc5c18e0ae4ef2f3aea50a8edf17cb1fe9"
 
 
 DEPENDS = "\
-- 
2.43.0


