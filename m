Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29B2C369C1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:42 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.14429.1744794159555978773
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G8KnGNnm;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794161; x=1776330161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rRGx784ElWNvRa9XSACMlCMy0Rf3GgzdprgmMhygUvk=;
  b=G8KnGNnmn+oHGstts0FG6TYyGAakiHWyV7nMMRFnrNxLKhVG8lCW8yaH
   khdTxVC01cFkZzMvDCjBPKYDuTIzoBXahKCHuv7ZgSMgdVVZwyrVvHeKa
   n8zCzQxEW0S8ltZk8CIIRlRzQufRnDQYm9zWkkZHYncKiSYpItx9Rboxw
   tH4Grckf35T56WLaVxz5Wh2yvwfx/fnbpUCc7+SP7AtmsV1OWVJwNKyFU
   kjtP/XB6Te+O/kvxuylTBKrFgjXxk/6i9fuoy4mTmIQ2c/SkZ5l59J9ps
   /a+JaCg3R3+Yum429QgawrLDA9a0EDbvnJWrcOBUJW49329JclKqxQtyv
   Q==;
X-CSE-ConnectionGUID: RAQMirDTRxiVkd66QDIrUQ==
X-CSE-MsgGUID: 0Ba7FQ7dQsKgpLOIVMwWGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="196625259"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="196625259"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CA38D4C31
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D033AD8B97
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 66ACA1A00A0;
	Wed, 16 Apr 2025 17:02:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/31] ctags: upgrade 6.1.20250330.0 -> 6.1.20250413.0
Date: Wed, 16 Apr 2025 17:01:48 +0800
Message-Id: <1744794136-908-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116897

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ctags_6.1.20250330.0.bb => ctags_6.1.20250413.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250330.0.bb => ctags_6.1.20250413.0.bb} (93%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250330.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250413.0.bb
similarity index 93%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250330.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250413.0.bb
index dba1dddcd9..a1f0eca4f1 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250330.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250413.0.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "ac54c7206d2d7a12f7642e204c679d0009edca15"
-SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
+SRCREV = "fccad9b77c17c60e908a69af8d251eec5f5296b5"
+SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


