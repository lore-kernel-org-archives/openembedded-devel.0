Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1224BC3ABAD
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:44 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.35396.1745311772873861980
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DKQaF0Op;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311774; x=1776847774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ShWea8CNT4LTgI+RJy94drFw5aTHgv8UqsBe0+yv+1M=;
  b=DKQaF0OpSaKM1zUsfHKezH8W//WSSVHVjqWZJYkpijt+LGQAxKlFI1xa
   DMXJFfcNTDzHxcY0RA98zdyUcEfl3Rp/tYgQ5wUfa4nQZD2021Vz+2vJK
   luPP+kAk6UQaEXmn/twSmBCLf1LolnIDPgCayq4hQH4TO8+iFwFAJkiCb
   hDOvYyLHKeGKy9FXk/qI/k5xd/kZCIIbRG6N8b8bVdrAivG4ugqdfcIQ2
   labm4JdZuz5sx1/o625prvp0ZvfHj1sqw60LRt/u0cIi7Nfbsqvxmg0Sj
   VR+LhNbbJfBzjJp5LNHe2ZLCTDO7iKpWgNsLm0A8GJkZZlbGu9aUU25na
   Q==;
X-CSE-ConnectionGUID: CwSUm/YzRUas332vQhsaqw==
X-CSE-MsgGUID: xU/ISkTEQlCd48zgwTjzWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="200132593"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="200132593"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:32 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A973EE0767
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 60541D5060
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EEDD81A0078;
	Tue, 22 Apr 2025 16:49:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/30] libspelling: upgrade 0.4.7 -> 0.4.8
Date: Tue, 22 Apr 2025 16:48:57 +0800
Message-Id: <1745311761-1912-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117026

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 * Improve initial dictionary selection which is particularly
   useful for languages which don't typically use spaces to
   separate word boundaries.
 * Build system fixes for building without enchant
 * Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libspelling/{libspelling_0.4.7.bb => libspelling_0.4.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libspelling/{libspelling_0.4.7.bb => libspelling_0.4.8.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.7.bb b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.8.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libspelling/libspelling_0.4.7.bb
rename to meta-gnome/recipes-gnome/libspelling/libspelling_0.4.8.bb
index 38476a6787..9c59e211f8 100644
--- a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.7.bb
+++ b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.8.bb
@@ -16,4 +16,4 @@ GIDOCGEN_MESON_OPTION = 'docs'
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[sysprof] = "-Dsysprof=true,-Dsysprof=false,sysprof"
 
-SRC_URI[archive.sha256sum] = "42f130f295f5addb6e9e8e74ccfbb709794bd2dfd021293e2875b9481bbd4e88"
+SRC_URI[archive.sha256sum] = "277646285818da7b295ef007b2c5ebd815d0930b3ad097505b3ced96965af517"
-- 
2.43.0


