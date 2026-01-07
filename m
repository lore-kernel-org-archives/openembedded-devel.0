Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A726CD5833
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3055.1767781746664652270
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FNcVFGdJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781746; x=1799317746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nW5fGG5RMly9YLQNdIy3isfDN0omMKC/P41LJNHPtb8=;
  b=FNcVFGdJ0NI6xplu0xIsQb/dD1z0ikX15l73VJqCj9BiuwnYc0mxgLh8
   TMNldhrVdua+V+N3Q3e8jDinDzGVhTl0QSv7mAWVJLdUtXUf9yuFr1UDJ
   TM6pwat7GpBaVxA/1J07bgZoZUbrIaVd161tJ32UJT/tiqWjKZlT2gb7Q
   1FsvQ+dgmxpxg9OVqlozxdbh6lWuqe4pFJ8oIdZ2ONGFIQj6gMOlERoNQ
   8fxfywpqfWmR1GeX3Msvr6bbDPYzh3lI+2xG3XAPJ6gN3jW0JufQkVK8P
   RCHxZabYwhwNCuWwiOKvma2+3nkTUa39JfMcg5YpuijishwEogQGBxf/b
   w==;
X-CSE-ConnectionGUID: p2otFc8KSROzFCrxPnCusA==
X-CSE-MsgGUID: itmTliy+RPCvo48cYTjFEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="225696255"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="225696255"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:04 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id E4B7D1C1C722
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:04 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 94B1A1809C1F
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B933682173E;
	Wed,  7 Jan 2026 10:29:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/24] ddrescue: upgrade 1.29.1 -> 1.30
Date: Wed,  7 Jan 2026 18:28:33 +0800
Message-ID: <20260107102855.228-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123200

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Replace pass 5 of copying with a sweeping phase after trimming.
* New option '-N, --no-sweep' to disable reading of skipped areas.
  Reassign short name '-N' from option '--no-trim' to '--no-sweep'.
* main.cc. Make '--size=output' use the size of outfile.
  (do_rescue): Make '-x 0' extend outfile to size of infile.
* main_common.cc (strtoll_): New function accepting underscores.
* rescuebook.cc (fcopy_non_tried, rcopy_non_tried): Limit pass 2 to
  blocks adjacent to a finished block. (Delimit bad area as a whole).
  (trim_errors): Trim only edges adjacent to a finished block.
  Initial skip size now defaults to (infile_size / 32_768).
  Only retrim blocks adjacent to a non-tried or finished block.
  (update_rates): Don't force update of a_rate, c_rate, ts.
  (Rescuebook): Estimate remaining time from last 60 seconds.
* genbook.cc (format_time), loggers.cc (format_time_dhms): Add years.
* loggers.cc (Event_logger): Add finished_size, a_rate, read errors.
* ddrescuelog.cc: New option '-H, --make-test'.
* ddrescue.texi: Document rescue with lziprecover's recovery record.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ddrescue/{ddrescue_1.29.1.bb => ddrescue_1.30.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ddrescue/{ddrescue_1.29.1.bb => ddrescue_1.30.bb} (93%)

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.29.1.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.30.bb
similarity index 93%
rename from meta-oe/recipes-extended/ddrescue/ddrescue_1.29.1.bb
rename to meta-oe/recipes-extended/ddrescue/ddrescue_1.30.bb
index 99c7d06706..55a9f50a6d 100644
--- a/meta-oe/recipes-extended/ddrescue/ddrescue_1.29.1.bb
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.30.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cca7f74ec83b7a9ce7ccd195aad471bd \
                     "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.lz"
-SRC_URI[sha256sum] = "ddd7d45df026807835a2ec6ab9c365df2ef19e8de1a50ffe6886cd391e04dd75"
+SRC_URI[sha256sum] = "2264622d309d6c87a1cfc19148292b8859a688e9bc02d4702f5cd4f288745542"
 
 # This isn't already added by base.bbclass
 do_unpack[depends] += "lzip-native:do_populate_sysroot"
-- 
2.43.0


