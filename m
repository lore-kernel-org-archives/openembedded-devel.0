Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04948C021AD
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:57 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.46624.1739178116317966661
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SmP1hg9G;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178117; x=1770714117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QcRMliMibwDr9FWqAlbVcFcHNvxuiP8TYIql3RA9KEM=;
  b=SmP1hg9GErhZpB1jFDedCs8Tfrr6OvAw5+Ci8CFojLHbZ8/nARxGRERt
   auUAqxMFnPXFmvvfiJb66h7pfnVFhPV9SsAixHATvEORgK7qN7tJhY9ZT
   s0YYv/C7KegD9ImJ4vQh1ibcPfhJX65y5TdH5ocSJmtLgBIWGNNK/jOwu
   ryH2Ow3kvajkalyG7JA7LhcW9iJHqzbaxkaTHD2tot+MI5zzi7ybsZxLJ
   CMCaeyWz6PHMm8RIEIhk2tuFTwFJV7C6wJ18bxhUPEPT5W4oivDhnxIK1
   sySeJWJpc47EbkwXjbfrg9A6yGftqZdSlr31PWMyutBghDLLIIji682ug
   A==;
X-CSE-ConnectionGUID: dljBjyweT1aVPJjz92gbJw==
X-CSE-MsgGUID: p0lt1D/WRiOW3/6bwEYe/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189490504"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189490504"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:53 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9859ADC6A0
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A64ED88B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:50 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F3F2D1A000B;
	Mon, 10 Feb 2025 17:01:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 13/66] libspelling: upgrade 0.4.5 -> 0.4.6
Date: Mon, 10 Feb 2025 17:00:42 +0800
Message-Id: <1739178095-26432-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115344

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * Improve detection of asynchronous fragment cancellation to break out
   of long-running spellchecking.
 * Fix Rust example and documentation links.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libspelling/{libspelling_0.4.5.bb => libspelling_0.4.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/libspelling/{libspelling_0.4.5.bb => libspelling_0.4.6.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.5.bb b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.6.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/libspelling/libspelling_0.4.5.bb
rename to meta-gnome/recipes-gnome/libspelling/libspelling_0.4.6.bb
index 064dd0018c..b19c5f51e0 100644
--- a/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.5.bb
+++ b/meta-gnome/recipes-gnome/libspelling/libspelling_0.4.6.bb
@@ -16,4 +16,4 @@ GIDOCGEN_MESON_OPTION = 'docs'
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[sysprof] = "-Dsysprof=true,-Dsysprof=false,sysprof"
 
-SRC_URI[archive.sha256sum] = "ec0372d83f42b65aee3734248ef8e2ffbfba4ea91268419c98ea44a00ef3e83f"
+SRC_URI[archive.sha256sum] = "3248a9b5336ea2f727d2db912d2f0083accc0505ce707679b3d9b8266c0101f5"
-- 
2.43.0


