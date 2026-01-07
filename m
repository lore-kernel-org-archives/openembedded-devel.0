Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BEFCD5832
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3059.1767781759261718924
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LuH9rWop;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781758; x=1799317758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+42PQiK5CvkiYUqW4AYUk4rET0WV0o5Y67oyf1WWfpU=;
  b=LuH9rWopRnvmaKHSQ0pDnmdka1HVZFOG92/uesoBMXOAmbpFgVjZmojN
   +IbZxP/uLiTH+NmrpmuVBivDYEwlG1y3xqrE9iSqO+3BXdBEIojAjCtAb
   tS7DTrDCF5og6VNyaEODx4FarmhrGlB4SYAgyVsAB1nd/59HhoGYj6xro
   kVEB2czZOIuhPEhFYkBjthHeWaiYsL7qsC+2rpmYLpQjgdnGoU8f/vdgS
   wJWSYabU6t0SboAhNYCPqLKBwv6EkBx356UaDyZi5GjFHgfw7ZxpyYj7M
   mv50Rs9Lvj329u88arjYNtL9b2gfmRhvhI3vn2ozydvMzdhHQwSSPQk+r
   A==;
X-CSE-ConnectionGUID: oma8vuqeSQO/NDVaIW/gXw==
X-CSE-MsgGUID: SkH4voejTgyCqToW4oiy6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="229043407"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="229043407"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:17 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id A71C4820711
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:17 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5FE61896E27
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7DAF982173A;
	Wed,  7 Jan 2026 10:29:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/24] libmbim: upgrade 1.33.1 -> 1.34.0
Date: Wed,  7 Jan 2026 18:28:39 +0800
Message-ID: <20260107102855.228-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123206

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Build:
  ** New "-Dmbim_groupname=<name>" meson build option to restrict MBIM kernel
     device access to a given Unix group and root. The access check works
     in parallel to the "-Dmbim_username" option; passing either check allows
     access to the kernel device (eg, logical OR).

* New Intel AT Tunnel service, including the following operations:
  * MBIM_CID_INTEL_AT_TUNNEL_AT_COMMAND

* Extended the SMS service:
  * MBIM_CID_SMS_CONFIGURATION now supports notifications

* mbimcli:
  ** New '--sms-query-configuration' and '--sms-query-message-store-status'
     actions
  ** New '--atds-query-rat' and '--atds-query-operators' actions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libmbim/{libmbim_1.33.1.bb => libmbim_1.34.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.33.1.bb => libmbim_1.34.0.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.34.0.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.34.0.bb
index 27d28d71cb..847cb3dcfc 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.33.1.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.34.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 
 inherit meson pkgconfig bash-completion gobject-introspection upstream-version-is-even
 
-SRCREV = "e10df4b6b3edfe6a46d93f7f5f5cab31c29a7091"
+SRCREV = "2bca5d22137883f348cb117597746483637491db"
 SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/libmbim.git;protocol=https;branch=main"
 
 
-- 
2.43.0


