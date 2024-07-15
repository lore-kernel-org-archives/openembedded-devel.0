Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3FFC3DA5D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:04 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.33825.1721034176804143516
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fifi/+he;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034176; x=1752570176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WCf6Badv1XvstSes0acmBbbJlajd1ayxL/m5dQ9hAiI=;
  b=fifi/+heF2jA/xK8nlJNuHZSEFtL9SamUTxRqZj9chM3Xx9ISHlZFEv5
   lSlBRLc8tlxBPV3b9q0zc3aDS+BpznQIj2+VqeM43PXxZv+YIuSu9JZex
   R66cd6idXaLUadTr8hCImWdaZkGAS6BhHy1qDND50oRhUaNBUhX6ZMfNs
   gTFeKSpsq07qca1+b9zTd4UyXN01HMn6AlIfn0okN0ZXhfZZ3I4pRQVWf
   VqzEnLw+hYdx8a+0tJxevHmlGZjWAycniWTc6ddGrtaU5LHDI8qc1xdeV
   tqBX7MMEHJ8NucO6jGr6B3ILo+Fc9FbvCh4Zhxug/b/+JakkYrHPsAEOT
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="154933593"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="154933593"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:02:54 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 661EAD4240
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:52 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 94A2BD4C01
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 25B6B6BE53
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C98071A000A;
	Mon, 15 Jul 2024 17:02:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/38] exiftool: upgrade 12.87 -> 12.89
Date: Mon, 15 Jul 2024 17:01:56 +0800
Message-Id: <1721034151-540-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.005
X-TMASE-Result: 10--5.293800-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrKQNhMboqZlrVbZFdXapsKZpj
	+XNqU6N7zIVGiRcEkmntpuHnoJaRs80ZW7sNo8j1sZaZ5UBQsoegF7yh6oLPs8piZi8vz7ib/hB
	H/uhQMnLgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZIosqYPA5i/eRY0
	JyfRdA4vN+XKhORaFFgDLqnrRlXrbIDt27MLDp0t0H8LFZNFG7bkV4e2xSge5pxJE6TSiAe4o7h
	2z5daatuqK/6ckPJtwDuXRSkoeE7cWFcyN1Agmm
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111323

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added new Sony lenses and updated decoding of some tags
- Minor change to description of NKA files
- Fixed Archive::Zip problem in Windows executable version

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{exiftool_12.87.bb => exiftool_12.89.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/perl/{exiftool_12.87.bb => exiftool_12.89.bb} (92%)

diff --git a/meta-oe/recipes-devtools/perl/exiftool_12.87.bb b/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
similarity index 92%
rename from meta-oe/recipes-devtools/perl/exiftool_12.87.bb
rename to meta-oe/recipes-devtools/perl/exiftool_12.89.bb
index 1f9bf7759..3d745146f 100644
--- a/meta-oe/recipes-devtools/perl/exiftool_12.87.bb
+++ b/meta-oe/recipes-devtools/perl/exiftool_12.89.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://perl-Image-ExifTool.spec;beginline=5;endline=5;md5=ff
 
 inherit cpan
 
-SRCREV = "30e6ca0b462591262c6ac39f0261e6528262b142"
+SRCREV = "e04534a40925354187e8432d44248229d774f34a"
 SRC_URI = "git://github.com/exiftool/exiftool;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


