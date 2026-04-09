Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC15EA3C2D
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:33:30 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128821.1775730808459803089
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fySjPIZk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730808; x=1807266808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eDDU+wJly188BUmOrlTNk7o9pmoNH57vkvhwxCw61uU=;
  b=fySjPIZkOL/nfro6hxGQedSJvzqftBnjPgfLDikU60mwgnsSgILhO35l
   gpjQUx/uODq3yNvK72O9LTuNlVcABEk/vQZ0+kewhTWfnUUZMkt8xhTQs
   W7PC+/GCtRt4Xsl7hD67JFuyok10Ol7XK6SOvXDMj55I6scrV9QaasQtN
   VYnTO9mWfFgDLP/hfP7lUAbz0+cmrW2u0pexhyf351lOcG6Mj3Er3S8wY
   pRXsKXSZ6wLYCb6MGgmyAMCFbCY1mQSJSSQM4i/n/LAknEBG65ip5gdOs
   OQrQkRM3RvqsUnwwWcBhoiWHLQFylDAVE5Lu2DH74SbN5Bvwh+0pAWfgr
   w==;
X-CSE-ConnectionGUID: dRRw3a4pQ0mTg+WuSIQUYw==
X-CSE-MsgGUID: V4kG2QFfQUm1zMgqOnJyRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="236386489"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="236386489"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:27 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D6377C000B2
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:26 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8D9A2C00402
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 214A74046A8;
	Thu,  9 Apr 2026 10:33:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 07/37] libburn: upgrade 1.5.6 -> 1.5.8
Date: Thu,  9 Apr 2026 18:31:53 +0800
Message-ID: <20260409103223.1574-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126156

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Bug-fix-Faulty-signal-handler-prototype-spoiled-comp.patch
removed since it's included in 1.5.8

Changelog:
=============
* Bug fix: burn_offst_source_new() parameter "size" rolled over at 2 exp 31
* Bug fix: ATA and SATA drives under sg did not register their SCSI address
           tuple
* Bug fix: WAVE files with unsuitable audio format were read as raw audio file.
* New API calls use and return off_t sizes instead of int or uint32_t
* Augmented struct burn_toc_entry by new off_t block addresses and counters
* New struct burn_progress_v2 and API call burn_drive_get_status_v2()
* New API call burn_disc_track_lba_nwa_v2()
* New API calls burn_disc_get_sectors_v2(), burn_session_get_sectors_v2(),
  burn_track_get_sectors_v2()
* New API call burn_get_read_capacity_v2()
* New API call burn_drive_release_v2()
* New API call burn_write_opts_set_perform_opc_v2
* New cdrskin option --audio_not_raw
* New cdrskin options --perform_opc and --perform_opc_growisofs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ignal-handler-prototype-spoiled-comp.patch | 27 -------------------
 .../{libburn_1.5.6.bb => libburn_1.5.8.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/burnia/libburn/0001-Bug-fix-Faulty-signal-handler-prototype-spoiled-comp.patch
 rename meta-filesystems/recipes-filesystems/burnia/{libburn_1.5.6.bb => libburn_1.5.8.bb} (70%)

diff --git a/meta-filesystems/recipes-filesystems/burnia/libburn/0001-Bug-fix-Faulty-signal-handler-prototype-spoiled-comp.patch b/meta-filesystems/recipes-filesystems/burnia/libburn/0001-Bug-fix-Faulty-signal-handler-prototype-spoiled-comp.patch
deleted file mode 100644
index 6061352cb7..0000000000
--- a/meta-filesystems/recipes-filesystems/burnia/libburn/0001-Bug-fix-Faulty-signal-handler-prototype-spoiled-comp.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d537f9dd35282df834a311ead5f113af67d223b3 Mon Sep 17 00:00:00 2001
-From: Thomas Schmitt <scdbackup@gmx.net>
-Date: Tue, 26 Nov 2024 23:02:03 +0100
-Subject: [PATCH] Bug fix: Faulty signal handler prototype spoiled compilation
- under C23
-
-Upstream-Status: Backport [https://dev.lovelyhq.com/libburnia/libburn/commit/d537f9dd35282df834a311ead5f113af67d223b3]
----
- test/poll.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/poll.c b/test/poll.c
-index 660f384..cd5ff90 100644
---- a/test/poll.c
-+++ b/test/poll.c
-@@ -14,7 +14,7 @@ static struct burn_drive_info *drives;
- static unsigned int n_drives;
- int NEXT;
- 
--static void catch_int ()
-+static void catch_int (int signum)
- {
- 	NEXT = 1;
- }
--- 
-2.34.1
-
diff --git a/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb b/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.8.bb
similarity index 70%
rename from meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
rename to meta-filesystems/recipes-filesystems/burnia/libburn_1.5.8.bb
index e84a60a543..1e84d12a03 100644
--- a/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.6.bb
+++ b/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.8.bb
@@ -5,10 +5,9 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
                     file://COPYRIGHT;md5=a91b9b862895b64e68e5b321873c9111"
 
-SRC_URI = "http://files.libburnia-project.org/releases/${BP}.tar.gz \
-           file://0001-Bug-fix-Faulty-signal-handler-prototype-spoiled-comp.patch"
+SRC_URI = "http://files.libburnia-project.org/releases/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "7295491b4be5eeac5e7a3fb2067e236e2955ffdc6bbd45f546466edee321644b"
+SRC_URI[sha256sum] = "8e24dd99f5b7cafbecf0116d61b619ee89098e20263e6f47c793aaf4a98d6473"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.43.0


