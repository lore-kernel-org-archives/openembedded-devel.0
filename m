Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62359C19778
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.2203.1740525898314938418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iX4TzayV;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525900; x=1772061900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wBjaIIO8kak+RZu/gt2N9E4GYAROyjVz6k2YpekcxU0=;
  b=iX4TzayVB1EbjwQOgbHiYVLfhqHyZ9J9VdD2t1owebm3i/cAv4XLVkPW
   VXa2OrggVRwCIkUs6hEL0yMAXNHUwLOh1sMmbgIqCfDzNOEAlTo8ZC0ZM
   y8xE/vNikGjuHeVXUgTtZplbu5BfVoc51gmhWf2/ZVyzPmX23dKpDxVFx
   64UkMaoUfyiX0WF6R3OSf9DWd+oT7So2w7Xaa1G2bYsiJFA0wbG5Vy55B
   a72GRrZt/zRGuBNzIxfkYPctb6M0WwG0ulK0SV3dcSlvJfoOValPrHTj8
   hABbXDl2fIzQkbfhdIUrJcrbWap9AK8w2j9UCNBb7V2Z1aiiIqFs8+uLd
   A==;
X-CSE-ConnectionGUID: Cg7+YJ6sQd+ug0lJjxkvyA==
X-CSE-MsgGUID: wC/ztp6fSBSnFlJKZY7e3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="179142882"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="179142882"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:58 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 61908B40FE
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 29C7FC8BF7
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E22B11A0073;
	Wed, 26 Feb 2025 07:24:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 21/51] multipath-tools: upgrade 0.11.0 -> 0.11.1
Date: Wed, 26 Feb 2025 07:24:11 +0800
Message-Id: <1740525881-21103-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115621

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix multipathd crash because of invalid path group index value, for example
  if an invalid path device was removed from a map.
* Make sure maps are reloaded in the path checker loop after detecting an
  inconsistent or wrong kernel state (e.g. missing or falsely mapped path
  device). Wrongly mapped paths will be unmapped and released to the system.
* Fix the problem that 'group_by_tpg' might be disabled if one or more
  paths were offline during initial configuration.
* Fix possible misdetection of changed pathgroups in a map.
* Fix the problem that if a map was scheduled to be reloaded already,
  'max_sectors_kb' might not be set on a path device that
  was being added to a multipath map. This problem was introduced in 0.9.9.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{multipath-tools_0.11.0.bb => multipath-tools_0.11.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.11.0.bb => multipath-tools_0.11.1.bb} (98%)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.0.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
similarity index 98%
rename from meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.0.bb
rename to meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
index 67e293dac2..3037d0da8d 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.0.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.11.1.bb
@@ -29,7 +29,7 @@ DEPENDS = "libdevmapper \
 
 LICENSE = "GPL-2.0-only"
 
-SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=stable-0.11.y \
            file://multipathd.oe \
            file://multipath.conf.example \
            file://0001-RH-fixup-udev-rules-for-redhat.patch \
@@ -49,7 +49,7 @@ SRC_URI = "git://github.com/opensvc/multipath-tools.git;protocol=https;branch=ma
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ec28527f3d544b51ceb0e1907d0bf3f"
 
-SRCREV = "de16cf82c5263fc148118be56ebf44c8f0ee60b8"
+SRCREV = "cb8de98b2cc3b62fd1a578ba479c0820778e9c02"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


