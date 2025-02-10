Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AE0C021A3
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.46460.1739178117103226972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RUqykCGR;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178117; x=1770714117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VVtLQTxAlxfc5qEaCWyjk7L4+bF5jkUQeR8b0jJE5HA=;
  b=RUqykCGR0EK7iTbZ+RyVVWK5XUgRUXgOBfpiuitsm1KYoX/2a+vMF9vz
   y3Hn0Y/u6CKfNiyA8Opt8WJ2XA0JI0yMShWr1yPCtl4oyopioGpre5EPY
   beugXu0dTE013TrliebSHLUMPbztckMnn2/Ikfx5G+nLPFpOBRjW1EuwH
   K06E40LPT+hKRkapyeLJ4rFdU/K5qjnIZ3Rn68JzOh4ObmNu9ur9xsbW6
   +OgdSsmygmCoZUGCn7ZD6+iOvBjqEgLYwjfdqBOIPM813UYsKoqZg7XBG
   4kfsIIAy/u1Mm/yGG2nRddvUMIpu92RZ3ExMM2bEO/x1y4V82Fjh1SrQV
   w==;
X-CSE-ConnectionGUID: Z0oesltGTEekl6zth18Iig==
X-CSE-MsgGUID: 3M2tc8FQTie2u0ZLN4WqlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177845818"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177845818"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:54 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A521D4F62
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 48E7910361
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:52 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E12AA1A000B;
	Mon, 10 Feb 2025 17:01:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 17/66] msgraph: upgrade 0.2.3 -> 0.3.3
Date: Mon, 10 Feb 2025 17:00:46 +0800
Message-Id: <1739178095-26432-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115347

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- CI release service fix
- Extended user service (photo, contacts, folders, find)
- Improved mail service
- Add rate limiting support
- Fix pkgconfig file using wrong api version
- Set select scopes during requests
- Add support for business "Add to OneDrive" sharepoints

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../msgraph/{msgraph_0.2.3.bb => msgraph_0.3.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/msgraph/{msgraph_0.2.3.bb => msgraph_0.3.3.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.3.bb b/meta-gnome/recipes-gnome/msgraph/msgraph_0.3.3.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/msgraph/msgraph_0.2.3.bb
rename to meta-gnome/recipes-gnome/msgraph/msgraph_0.3.3.bb
index f3f66c3dcf..fe4faff356 100644
--- a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.3.bb
+++ b/meta-gnome/recipes-gnome/msgraph/msgraph_0.3.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 inherit gnomebase gobject-introspection gi-docgen features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI[archive.sha256sum] = "ed42e800cb7f0a07477cd9e3e744cdc1a240a6ad7ab96b8a875806267a9fddb0"
+SRC_URI[archive.sha256sum] = "37d7e12f2a990490aea21184f0b27e0b915ebb4e5096f4d6632c62051c054012"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.43.0


