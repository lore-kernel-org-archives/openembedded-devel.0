Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F28EDE999
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:31 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.18591.1725959003836765641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rKTC8Zye;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959004; x=1757495004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BiTzWim6tPHbJSv2LmK4KjjDIr1MKFiuyg1sm4u/FQ0=;
  b=rKTC8ZyeUtACAokTdCtp6EmU2bpETx9eQ9t1O58veA+9fpemATnuwqLg
   t2lGnPKTMXy+s5P4iEHTA7LA09pY8OsmDwn8WEw7YzE6oTk/t+LnpVA6g
   G3BMh6XW3sOPBwhxIzacK5lZ8ASuP2KtjRSD34exQFy1t9jLusDqKYlpQ
   ZQnAbyzyr8cuEsh34fSS/HNPZG0hSgLaoJHZFaC68GxScr50qFEYpYjvU
   sD71m70k+4PbOOsAgzjP+49ii3AFy7FBwVYpWyNHfqJPIgoDnp7GYixa8
   +q8uNCFmhSmTVCaZEtBB+At+v0IB6gqx/x3xYVH8yaqT+jI0bwHWiGN24
   Q==;
X-CSE-ConnectionGUID: iuflTUAeTqKUSp7NUGfZuw==
X-CSE-MsgGUID: qNa4Nl1tRYqbiivpWe5W0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="173293549"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="173293549"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:21 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5BBECD6EEE
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 986A5CFBD2
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D4276BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CF87C1A000B;
	Tue, 10 Sep 2024 17:03:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/42] flatpak-xdg-utils: upgrade 1.0.5 -> 1.0.6
Date: Tue, 10 Sep 2024 17:02:31 +0800
Message-Id: <1725958990-5719-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-2.602000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrzlT5a6V0OSMxIdvSMUlmMpgU
	Ly4zAbFBcL7UGNQSoTbUdYnGRBp+th2P280ZiGmRP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFrsq/7BhdGyCVd49c0zgWM30tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtSgHPHUB1tsr74j/7Z/uMYjkCdPaybaUGzbGZbzVLbIDpQpU48H9jLCBzH
	95zdZXtxUhH2TD9NEWdIhbXgjKxORQLWbOQuQYmHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112189

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- flatpak-spawn now supports --sandbox-a11y-own-name (if supported by portal)
- flatpak-spawn prints a useful error when --host isn't permitted
- fixed minor leak in flatpak-spawn

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{flatpak-xdg-utils_1.0.5.bb => flatpak-xdg-utils_1.0.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/flatpak/{flatpak-xdg-utils_1.0.5.bb => flatpak-xdg-utils_1.0.6.bb} (88%)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.5.bb b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
similarity index 88%
rename from meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.5.bb
rename to meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
index 423c6faf7..5dfba2514 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.5.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak-xdg-utils_1.0.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/flatpak/flatpak-xdg-utils.git;protocol=https;branch=main"
 
-SRCREV = "5ba39872f81bf8d98d58c5f8acb86604645be468"
+SRCREV = "05abdd7421688be5835a6b12f2b068086c38d4aa"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


