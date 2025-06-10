Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F127CC71137
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.77946.1749526420435893183
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qKuLG0jZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526421; x=1781062421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tsMQK8J6UM595OKT1+Xzw/1zRLCFPdbd3HS6h4jDpvM=;
  b=qKuLG0jZa8M/nD26bE7iC5zo7rnz/TxdEG/hhahnalSJimRJVYR7rnGE
   P2k36ATtu4QpSa2/pA36qCS9MbxD5PQKbUts6sk2aIU10VdfkcWLKBmYn
   j6S1Qu9vGrKTkfz8BgbdR7OgfsnNyCA9DQCD5wB0EvlT62fnL5JUA3JW1
   3XUsX3R/O6XqhO/S7/4hL/qGF/+qq0LD+fT4trAjKT/3VGRHicYRVCFs0
   P4zLfJyTUBNBUMlSZia24uYlN2y7P9MX45v9hw+pH+Kob4S9YNkFHRbAH
   +n3MCiulqUdmqOO368lltGLoigtrN5J29G1JbbHaWi2qoqs5qTu5ZcDYf
   A==;
X-CSE-ConnectionGUID: sZCoFVDdQsOpV6t1gT7zvQ==
X-CSE-MsgGUID: MNy4t30iRzWf72qPG6fwvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202680447"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202680447"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:39 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E145D6FBC
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A04CD5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:37 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AC5911A00A1;
	Tue, 10 Jun 2025 11:33:36 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 08/64] gnome-online-accounts: upgrade 3.54.2 -> 3.54.3
Date: Tue, 10 Jun 2025 11:32:34 +0800
Message-ID: <20250610033330.924-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117799

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Authentication failure in goa IMAP accounts
- Handle unexpected casing in domain names

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nline-accounts_3.54.2.bb => gnome-online-accounts_3.54.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-online-accounts/{gnome-online-accounts_3.54.2.bb => gnome-online-accounts_3.54.3.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.2.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.3.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.2.bb
rename to meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.3.bb
index d3608f0e74..98e67ad957 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.54.3.bb
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'goabackend',
 
 DEPENDS += "gdk-pixbuf dbus glib-2.0 gcr keyutils"
 
-SRC_URI[archive.sha256sum] = "0f7f3d29c0666ffbcc503f3e0f3396362effdb9317d41664ce65df147ef35372"
+SRC_URI[archive.sha256sum] = "bcf655dd1ddc22bc25793b6840da19f5cad7ba0b7227ff969ed9c252f036aac5"
 
 PACKAGECONFIG ?= "goabackend kerberos owncloud google windows_live"
 
-- 
2.43.0


