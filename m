Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F692C369C1
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:32 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.14609.1744794150722222430
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jIizjKIU;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794151; x=1776330151;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uvagw59/rx4Idu+f3xTylXuSG8AfYyc/EMfMCIfI2V0=;
  b=jIizjKIU7V5EqGmOGM6yo2ISBW/6qF10IT0Z4mDQNN83OL/gnu6VGbpI
   1WtL50NMGRg/m2PmGb29LVvbxrfwA0Chv0GFcCUkiWuvSmpFus3ZggyZf
   9GLyCJ9bsLWfIuXUTLMASiCal3gVnAhYTQOpmapAAXxN0NYDMht99vXCi
   nd1bGCX47fdRmcnuiiYigm7BUaRmB+BUeWhMIbuVhrl+Lu2yAciLX8iGY
   yMkzFURD1e9/Rv+8PKrMHmbed2GKmBW0Fa7KCPgvRfvXI4XVsp4B6Cbdo
   gt+NnrOJRhHffKINS1HKK56o6b7IOs82G4piYeXlAlT3esRhmtDEiTKRk
   Q==;
X-CSE-ConnectionGUID: jjw8vlMRRbO5XiO74IsSeQ==
X-CSE-MsgGUID: 1z95LutNSG+n0VyoJQTAOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="175523869"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="175523869"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:28 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A10BE96741
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F41CD50F4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E669F1A00A2;
	Wed, 16 Apr 2025 17:02:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 05/31] gnome-online-accounts: upgrade 3.54.1 -> 3.54.2
Date: Wed, 16 Apr 2025 17:01:50 +0800
Message-Id: <1744794136-908-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116875

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nline-accounts_3.54.1.bb => gnome-online-accounts_3.54.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.54.1.bb => gnome-online-accounts_3.54.2.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.1.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.2.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.1.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.2.bb
index 69bd6a9a80..d3608f0e74 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.2.bb
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'goabackend',
 
 DEPENDS += "gdk-pixbuf dbus glib-2.0 gcr keyutils"
 
-SRC_URI[archive.sha256sum] = "9d058b3aac8b2d8b6b2ae7cb57c8a8abe539e73c88220c315b5b99f87ce6efd8"
+SRC_URI[archive.sha256sum] = "0f7f3d29c0666ffbcc503f3e0f3396362effdb9317d41664ce65df147ef35372"
 
 PACKAGECONFIG ?= "goabackend kerberos owncloud google windows_live"
 
-- 
2.43.0


