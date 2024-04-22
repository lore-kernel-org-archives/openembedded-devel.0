Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F3EC07E8F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:10 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.13980.1713777369071639966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uEfOMKhB;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777369; x=1745313369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ab/nKsaigKWrODUFOZ3IK0PlWgT7rgryTjHxQ5P7xBI=;
  b=uEfOMKhBfVeKFqZ+yi410cLMxpokiFPnjBZxR1MzfuJAxyIiLk6zJU1e
   jtV3w/wXqJ0gOLedlURbqm9bH7zXiSZXOTY73xea5bghuurcMUPyWKvkf
   oF1vTf6yTf70L5Y+HsqHo0txIDzO7HJj4VylXeKIbcSXDFDZp4/GOHiym
   yHTCcN71gbmT8P5lDiw0APqoX9szkIg3WzovDnL+KPJNzqy308iCHCCpo
   mz8Xq06pAfrVgz6469bR8Gw7GyAPyZOAYkHsErkgfTi7ryu56hOz2j2tl
   pmlrFw8JMeKoyBhpRE1zrHwS7Nq3KUqMwUa/zsKVB80/+PWS325N8w6gw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="144288390"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="144288390"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:06 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B802FE8FC6
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:04 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3B1AD4C0F
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7814720093277
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 22CF81A000B;
	Mon, 22 Apr 2024 17:16:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/15] mpich: upgrade 4.2.0 -> 4.2.1
Date: Mon, 22 Apr 2024 17:15:33 +0800
Message-Id: <1713777345-29264-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10-4.323700-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mr8boZEVitthj447xhO06ewjuR
	oA1LVbPUwVeG+L4n/T/y7Kkqj/XZ0yupJvqHf1A8HWRJEfGP5nmyiNuZzgQ4vKvWBS71/UX/u21
	bCvU7tD1Nk1Boul/7uCmqOJk2EKACrP0ytbeargED2WXLXdz+AXIa+KQSxiLwB/FMznsE8cPs/R
	/hFDFDJSL637QCIVpienmD2BglYMt4HMSQIKmdGe9VsdrlGzy3xMZq+YajS9ZmCQUXISfaSp6ba
	/D5x6cp4vM1YF6AJbb2xnRRfQRo4hZ4ylU2GwzAxEHRux+uk8hxKpvEGAbTDioDxTAHD2FiX9c2
	dukUPrF96NSG/tz9SCvJy0lZ719Yf2pgTBnwU6Fl4ULTqor2FDn1pUm8ESOslqFR6d4N01MMD5F
	4u76KUoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110086

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-Disable flat_namespace to build libmpifort on macOS by default
-Prefix warning messages with "MPICH"
-Add --disable-doc configure option
-Fix support for building MPICH Fortran support with Xcode 15 on macOS
-Fix bug in MPI_WIN_SHARED_QUERY when window is not shared
-Fix bug in ch4/ofi gpu pipelining
-Fixes for Intel GPU support
-Fix memory leak in ch4/shm collectives
-Fix bug in MPI_COMM_SPLIT with intercommunicators and non-zero root
-Fix bug in DAOS ROMIO driver
-Fix bug in cycling error code array
-Return an error if there is failure to create a datatype in mpi_f08
 module for noncontiguous user data
-Return an error when shared memory segment creation fails

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_4.2.0.bb => mpich_4.2.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_4.2.0.bb => mpich_4.2.1.bb} (96%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.2.0.bb b/meta-oe/recipes-devtools/mpich/mpich_4.2.1.bb
similarity index 96%
rename from meta-oe/recipes-devtools/mpich/mpich_4.2.0.bb
rename to meta-oe/recipes-devtools/mpich/mpich_4.2.1.bb
index deb459ce5..9fd8c3bb7 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.2.0.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.2.1.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=7a88f0d96d0d7396a7c66bf353235b62"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a64a66781b9e5312ad052d32689e23252f745b27ee8818ac2ac0c8209bc0b90e"
+SRC_URI[sha256sum] = "23331b2299f287c3419727edc2df8922d7e7abbb9fd0ac74e03b9966f9ad42d7"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.34.1


