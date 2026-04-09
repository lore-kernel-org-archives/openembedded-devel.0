Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D82EA3C28
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:32:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128810.1775730759257866994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:32:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ePq/8zdH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730761; x=1807266761;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SC2wj6An3Ua8kRwcXgcxi/rNTUDXLHNBm7Xia3QvERI=;
  b=ePq/8zdHOK/EKNiFFNPExWIrlj+Oy5C9wK/5m7Of8tF3D34GcmgbDunj
   ZrEBsT7+3qcbeRzMRfIrCImdf5a0VxHpsBbA4LEesapPQtRmwkXQZk2YO
   lEO/FJrN9SQJ4B6Rrz/u4e+r5Oo0OoAyOfyp2FuXwXUnXWR8rTrp6SmGx
   ZeKIQqtCm+fgokwM9x8NEsdW6eZ1/geJ4dUcQcPLK2ZH70cZSQsn9jXjL
   UjYPCXEjEc/2i+QQjziOrkv4XjON4vyf6YKpQztDjvV73s7NeFLkPvJFL
   4pprQYJybgbhX5zqw1rfk4fa8rwpnW9CrTVuDUAWwbB/9ZTyJE68klbDa
   Q==;
X-CSE-ConnectionGUID: cQ7hqvjUSY+3QiaAgO86sA==
X-CSE-MsgGUID: d2lBs7zZTzWhuupNcjhqNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="236386445"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="236386445"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:32:40 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B9C021C0054E
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:40 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6B514180323A
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id D0129405EC0;
	Thu,  9 Apr 2026 10:32:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/37] feh: upgrade 3.11.3 -> 3.12.1
Date: Thu,  9 Apr 2026 18:31:50 +0800
Message-ID: <20260409103223.1574-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126153

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Update tests to reflect the %f/%F changes implemented in v3.12
* Disallow %f and %n format specifiers in --action and --info strings;
  abort with an error message if those are encountered. Use %F and %N
  instead. Rationale: %f and %n do not escape shell-specific syntax and
  are thus a security risk when passing untrusted file names to feh. %F and
  %N, which have been available since v2.3 (Feb 2012), do escape
  shell-specific syntax. Migration path: Replace %f (or '%f') and %n (or
  '%n') with %F and %N (without '') in --action and --info commands.
* Fix formatting in man page for groff 1.23.0+
* Do not skip URLs when '--sort mtime' or similar are used
* Define '_GNU_SOURCE' macro for mkstemps usage (if enabled)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.11.3.bb => feh_3.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.11.3.bb => feh_3.12.1.bb} (88%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.11.3.bb b/meta-oe/recipes-graphics/feh/feh_3.12.1.bb
similarity index 88%
rename from meta-oe/recipes-graphics/feh/feh_3.11.3.bb
rename to meta-oe/recipes-graphics/feh/feh_3.12.1.bb
index c79ad488ba..2ac504a551 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.11.3.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.12.1.bb
@@ -9,7 +9,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "f2cca3592a433922c0db7a9365fd63e5402c121d932a9327e279c71be6501063"
+SRC_URI[sha256sum] = "6772f48e7956a16736e4c165a8367f357efc413b895f5b04133366e01438f95d"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.43.0


