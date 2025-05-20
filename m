Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D23C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.16488.1747731315687047643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PgYpPLTh;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731316; x=1779267316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wYG3AV2Y74PdLo6t8Vl360M0t90YRwSaXpqMlHvs1Nw=;
  b=PgYpPLThXKBJ3UIZasfg1g192SdfFMLbOkfjX8d4S38rhWGvlRteli5h
   v78oN8BM63AJaQWZvagFsUElKyp+0ptGSZFTK8atNdyxuIg6cfGL/7BXV
   +BGnSqLte+GKecjTh2n6ZqJf8Tz+Ov00LFyjSsQo9gN2sq0XDqjfYUMay
   GT+bWOIUlQ5FVK4/L2+8wTNDlu5fYe59J8VKuu2+ULEPl2BXmr4U44xpT
   0UY9OMNN3zS7DcsiO5K/VxyuW1yHxut2WUgQb8a6891Bje1FM6/tcbMM6
   jomcALnUYn1/DtjAV+3lD7kpOArvaj785b12L9kPNDKy0IjCGVyIcjQuk
   Q==;
X-CSE-ConnectionGUID: OtLgNlDGRASVDL+5ip6PRQ==
X-CSE-MsgGUID: IHkNxo9aRGan2itcYjZrOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="200435229"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="200435229"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:13 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7073FD4C31
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 29D8ED6FE1
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B41991A009A;
	Tue, 20 May 2025 16:55:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/27] libdecor: upgrade 0.2.2 -> 0.2.3
Date: Tue, 20 May 2025 16:54:38 +0800
Message-Id: <1747731299-20448-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117489

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdecor/{libdecor_0.2.2.bb => libdecor_0.2.3.bb}       | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/libdecor/{libdecor_0.2.2.bb => libdecor_0.2.3.bb} (82%)

diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.2.bb b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb
similarity index 82%
rename from meta-oe/recipes-graphics/libdecor/libdecor_0.2.2.bb
rename to meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb
index 6621389b5a..9c6807d7e6 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.2.bb
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.3.bb
@@ -2,9 +2,7 @@ SUMMARY = "libdecor - A client-side decorations library for Wayland clients"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7ae2be7fb1637141840314b51970a9f7"
 
-SRC_URI = " \
-    git://gitlab.freedesktop.org/libdecor/libdecor.git;protocol=https;branch=master \
-"
+SRC_URI = "git://gitlab.freedesktop.org/libdecor/libdecor.git;protocol=https;branch=libdecor-0.2;tag=${PV}"
 
 DEPENDS = " \
     cairo \
@@ -15,7 +13,7 @@ DEPENDS = " \
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "7807ae3480f5c6a37c5e8505d94af1e764aaf704"
+SRCREV = "15afd30a6e23e949d022ff18f17dd7fdbd3361e4"
 
 PACKAGECONFIG ?= "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk+3', d)}"
 
-- 
2.43.0


