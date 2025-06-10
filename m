Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1E7C7114C
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.78430.1749526423382039445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cSpn2aGx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526423; x=1781062423;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MN/u2C9U1LdHOXzVbY9qRImr8ZbZF1O9WCPIemTrMVk=;
  b=cSpn2aGxwy0MzNjhpuW4OpbOAmcSyAeMqqqW7/n5RyLJriz8U+Mv/ZLO
   C2+06fkPc6NbYJB0PBkNmaDW4qfuteddrWCVKWDCKFIGCyLNQKw9J/cSN
   gs/0r5CBiWxOXbIVDQj9ZwfhDzCn5aQlwsOYl/wX77ybirtZPP6rK5r5d
   jB/tcFoCeL62PJb8nIbfsdwPPc6oa/S4ZrE0muArOr9AmUzX/+LCudzpe
   fqEKQjulM5T8ACQPEGbN57ZLK3/vpqKa9K54HEgOI731kjl7TBv/gm9IY
   5JvMGxf0mVy6fY/ZvKejULORDi83kz9jVRramOioHCqM/srnTgEesi/vb
   A==;
X-CSE-ConnectionGUID: eVVvnYGaSYKnhc9GZ+u/MA==
X-CSE-MsgGUID: LL6z2hDERHCDCrnGSci7yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="205286167"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="205286167"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:41 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DF1EC68FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AC46AD5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:38 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 33B871A0071;
	Tue, 10 Jun 2025 11:33:38 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/64] iotop: upgrade 1.29 -> 1.30
Date: Tue, 10 Jun 2025 11:32:38 +0800
Message-ID: <20250610033330.924-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117804

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- kernel commit 0bf2d83 fixes the problem with struct taskstats, now iotop 1.30
  handles only v15 of the struct in a different way, retaining compatibility
  with both old and new kernels
- show zero current values for exited processes
- flush stdout after each batch run

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/iotop/{iotop_1.29.bb => iotop_1.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/iotop/{iotop_1.29.bb => iotop_1.30.bb} (93%)

diff --git a/meta-oe/recipes-extended/iotop/iotop_1.29.bb b/meta-oe/recipes-extended/iotop/iotop_1.30.bb
similarity index 93%
rename from meta-oe/recipes-extended/iotop/iotop_1.29.bb
rename to meta-oe/recipes-extended/iotop/iotop_1.30.bb
index fc1251a899..7d04a3b17b 100644
--- a/meta-oe/recipes-extended/iotop/iotop_1.29.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_1.30.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3154adaa1a9ca0d8dcc1944518ece1b9"
 DEPENDS = "ncurses"
 
 SRC_URI = "git://github.com/Tomas-M/iotop.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "dd0f4ad5ec03b9fd642f54144f6465cf6d2c1d12"
+SRCREV = "c3366a8a235f9c8ddc4797625f22cfdf12ba2c36"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


