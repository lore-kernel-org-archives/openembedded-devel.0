Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7A4C021BB
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.46460.1739178117103226972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Byt/B2EZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178118; x=1770714118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=b5LSQID96on8yTE7WKDZN56883J1/OE3hzFoG7pA0jk=;
  b=Byt/B2EZv+voTfiANCJuyjtbDCfiTGgD5BxXO58zZl6/vkI8hJ0IUyof
   W2f9hLvv3fmyYAC7H7WNHzia4HPdjYLkC5u2ap4SHI/3l9QTqyGs0BjMQ
   Jk3UklgTC6CpLuzc8bbGfHeASWXUqHe3+lT07sDwkmvacFJ7Hzs9u/ToC
   jQ8Eh3a8Qykzp8dJtHA3A5T/7DUkD6JxiARkgpfViEfC4seH4SAvKPThM
   8zGLH8gI7INNxh2bXhB7jBhwpdUpg+5VroMAEkanVuO3Ew1bfUW+r/+9W
   7hA4e4ZnNgG6B9iYM+IvBLpiCCc8khU0HpLsmRZLICUogL+mePlgkvd9m
   A==;
X-CSE-ConnectionGUID: fDhGt7xZT7ectXrj7uhF0Q==
X-CSE-MsgGUID: p6l/mjKNRVK3CflNBfQn2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177845821"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177845821"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E12DDC6A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 21F37D4C33
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BA16E1A006C;
	Mon, 10 Feb 2025 17:01:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 22/66] osinfo-db: upgrade 20240701 -> 20250124
Date: Mon, 10 Feb 2025 17:00:51 +0800
Message-Id: <1739178095-26432-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115349

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libosinfo/{osinfo-db_20240701.bb => osinfo-db_20250124.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libosinfo/{osinfo-db_20240701.bb => osinfo-db_20250124.bb} (90%)

diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db_20240701.bb b/meta-oe/recipes-support/libosinfo/osinfo-db_20250124.bb
similarity index 90%
rename from meta-oe/recipes-support/libosinfo/osinfo-db_20240701.bb
rename to meta-oe/recipes-support/libosinfo/osinfo-db_20250124.bb
index d369046055..59d80816d2 100644
--- a/meta-oe/recipes-support/libosinfo/osinfo-db_20240701.bb
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db_20250124.bb
@@ -8,7 +8,7 @@ DEPENDS = "osinfo-db-tools-native"
 
 SRC_URI = "git://gitlab.com/libosinfo/osinfo-db.git;branch=main;protocol=https"
 
-SRCREV = "cde78484ab747c87532d47cf3f09b76f280c0b74"
+SRCREV = "5be10e2c781b62bbaa55bd8f9ae990697fc325b4"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


