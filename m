Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF45DC021AB
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.46622.1739178112983859191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VT143Crz;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178113; x=1770714113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1Jeuj4dcDNd/Pyzv1E4r6BB23aomc7mwpNMbgvPgb94=;
  b=VT143CrzUUAEF3imG71BtAGQMR/kTm+gn5AcpVm2G0OJzJGjYptDXF2b
   Ffodqs8R4AytlBni933bn5DkhP/QYYvZdAezP7ljkdjkYAV9AdtyIbSYw
   nZjl27ZVl72giR9DeMfg0TNi8hA94NdLWhrhp2R5LLcraCRziGrn4Z064
   6ZG+24vPNXolqouXcFnhBqPcGDqohJ16W1qdMm0gD4HQ6ygb4IUsnEpvR
   TR9J90fTk6NnwQLXh0rYJiDVcsC4CkowTyCTk/xxeX2GrSfEMZPJaWUkJ
   YQV8Qub0eZ0W8RsF1EVcjzBYpkJH5Z2WgApoNHVn8Yl3irnhKZ7vqnK+G
   g==;
X-CSE-ConnectionGUID: pyd8lSLxT8i/jiY61D5BcA==
X-CSE-MsgGUID: fvO4lyo2RYOgt5Gk8QgWnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168346345"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168346345"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:50 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C8F38D5011
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8B95010361
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:48 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2E39B1A000B;
	Mon, 10 Feb 2025 17:01:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/66] libjcat: upgrade 0.2.2 -> 0.2.3
Date: Mon, 10 Feb 2025 17:00:38 +0800
Message-Id: <1739178095-26432-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115338

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
==========
 - Do not close the base stream when using jcat_file_import_stream()
 - Skip ed25519 part of a test with -Ded25519=false

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libjcat/{libjcat_0.2.2.bb => libjcat_0.2.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libjcat/{libjcat_0.2.2.bb => libjcat_0.2.3.bb} (95%)

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.2.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb
similarity index 95%
rename from meta-oe/recipes-gnome/libjcat/libjcat_0.2.2.bb
rename to meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb
index af516a77c6..0e6f4a2ed1 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.2.2.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.2.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
     file://run-ptest \
 "
-SRCREV = "fc04ad2d4e65e55024a4507e0aaa2659a0a588a3"
+SRCREV = "f284d18a694ed98f49ddb06e6920265781a30125"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome vala lib_package
-- 
2.43.0


