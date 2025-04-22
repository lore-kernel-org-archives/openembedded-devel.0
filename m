Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855D8C369DC
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.35398.1745311773126484848
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aUQL2nCR;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311773; x=1776847773;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8/2i3kZnk6EtrnrH5zn1ejzFvVcc0JddRWQ2EHsl0ks=;
  b=aUQL2nCRGyWAZo477g9soiT3aOJWmr3RruMykZ6sslnnc3nLoAI5gY7t
   5KWzFjwnNQ0/GdahgAu/6RzyqGES24nQkUZylrJY3V4pN+lMl1Wttf6po
   zOwQHA12FRIbz3tb9pp8JqNI2I9ZwfidBk7DUOq4evP0wkwao6F83ySUl
   O/rvUhq9IwXz3CH/wMJ+AK1wRPeFnURURiJQKup6n4oy4e1IosDUtdeWt
   91ggPNRDBAsSXC1PvsioxDLZYiCkuHZPLnY4wJKQ8W1+5B3Gt0oxkhwKn
   aY1PUSjn2cECuI96i+j6qVIIh285eqqItHZ/p280sL2LSrsk42tOBmzEl
   Q==;
X-CSE-ConnectionGUID: kEN6ADcfRgmyFF4uslDDkw==
X-CSE-MsgGUID: aONu1FpvTHKDYZvEcrD4Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="176196152"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="176196152"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:30 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AAB84194F8
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 687A8D50BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EEFD01A009B;
	Tue, 22 Apr 2025 16:49:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/30] jsoncons: upgrade 1.3.1 -> 1.3.2
Date: Tue, 22 Apr 2025 16:48:54 +0800
Message-Id: <1745311761-1912-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117024

From: Wang Mingyu <wangmy@fujitsu.com>

- Fixed bug:

    - Git Issue #607: Fixed issue with 'staj_object_view' and 'staj_array_view' iterators that got introduced
    as a consequence of a change in 1.3.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.3.1.bb => jsoncons_1.3.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.3.1.bb => jsoncons_1.3.2.bb} (90%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.1.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
similarity index 90%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.3.1.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
index 49db67b1c4..781a0ef18f 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.3.1.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.3.2.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "9ccf27f2b1a142d737f0dcc42780d8b02baf9743"
+SRCREV = "64b9da1e9f15eeff4ec9d6bc856538db542118f2"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


