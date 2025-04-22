Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 996D5C3ABA0
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.35427.1745311775402904762
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eXwzvnJp;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311778; x=1776847778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OH7Fe3xAFkEYc6Gn5Fgokfv+vq2mamWONvwWbxjFvEE=;
  b=eXwzvnJp9mqSGTAsn2En+tH10BbpSSErU2ti4hCN5XqqXa1WjGf5Ptm6
   5WFab55WeBNaFXORVFDbFsrRj53DQjkDYjEz1n1AIfKK4UHY9gOFtgGnQ
   4jnvoj0atBuHIU3svAtIup82qi8MhHjNSuRsIzDr1eogpg7XwOkaS6Vjz
   B0g9/9OSkxq8ouKq1zRoo076SDKySQshgRHNcQp+czXxLbqXkV9trMjkG
   4gubiFv/vdJwfrKrlGcilddcCv0uWZi3EaPPNkkx6g5hLkBuW9jJu0d/g
   OIvD9njNn4irbhSTzIzHFJ1nYcOEjVztB92DJ3A6SLLOuY6ERnyiDRb9W
   g==;
X-CSE-ConnectionGUID: w/UYylEWSaW48u/mJwSqxg==
X-CSE-MsgGUID: 3AR0h1IPSTm/be2GR0WGGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="176756786"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="176756786"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7706EA80F4
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 33318D50B9
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B940D1A0078;
	Tue, 22 Apr 2025 16:49:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 29/30] smarty: update 5.4.3 -> 5.4.5
Date: Tue, 22 Apr 2025 16:49:20 +0800
Message-Id: <1745311761-1912-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117039

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Update StringEval.php
- Fix syntax error occurring when registering a function plugin
- Replace SMARTY_VERSION constant with $smarty.version in debug.tpl

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../smarty/{smarty_5.4.3.bb => smarty_5.4.5.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.4.3.bb => smarty_5.4.5.bb} (93%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.4.3.bb b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
similarity index 93%
rename from meta-oe/recipes-support/smarty/smarty_5.4.3.bb
rename to meta-oe/recipes-support/smarty/smarty_5.4.5.bb
index 30a274e6c8..7072641d45 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.4.3.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.4.5.bb
@@ -10,9 +10,9 @@ BUGTRACKER = "https://github.com/smarty-php/smarty/issues"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
-SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "c6bff5795081ca5e60aabda59fb87daa511acd1e"
+SRCREV = "e26f82d02c4d18fc82094c28fbc65f711e39ed5d"
 
 S = "${UNPACKDIR}/git"
 
-- 
2.43.0


