Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF7BC27C54
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.10786.1715677832659927880
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Iw4KJWMN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677833; x=1747213833;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=4bVqP8+oanLAO54Q5j4oEStKYD1ZVos1n4//xN7O5pE=;
  b=Iw4KJWMNfElm6B7z6nDAFiQDROyQWSLLW0thtGeXkS/pxi62H5xk3ZDt
   TdlTTxBCJD4vP5LpgIgPCXnDOZOcOAzt+irR2G2WsiNB/b18mVQL+Di5r
   J35sqJG9vaQzStKZxPH1YktSvKEc6Ml1Da7gsiQxG6Zv1GU6GLb36UT3x
   nttCIPtuoVnz8OfLA+L/FkD+HYhSLju/g66FtwVRAJIPjS3Ioq5gDX2jj
   seAbYCjzPpaw/0DqQv43gmvR1KLPmi18JkJx10E/a/rZE8okc429DcHEb
   db473AYPGIL/YTU2vSf0AVTOVNhCnscl0FF0eN5wteWG3EoQAQ1EULCkN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="157675024"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="157675024"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:31 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1AFBCE8FC2
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C6BDD52E7
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C9A226BB7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7735C1A000B;
	Tue, 14 May 2024 17:10:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/44] ndctl: upgrade v78 -> v79
Date: Tue, 14 May 2024 17:09:42 +0800
Message-Id: <1715677817-2223-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--4.886000-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mr9LMB0hXFSehM+b8yxBqvA7+I
	hmgj6NxWWW2Dmwvfm8fTq8WLFBPUkIeOKRRLcbIS5y1fRAwHJ4c3l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYvL3NxFKQpq1iCsqewnUZGA7Cl8sx4HBG4KMU5VqphqVsp5O052MzLoqyb
	XRNOEMIlslxAfd+6tXeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDsPnV
	hJpCrKileH7rBwhZ8dVsCKLRGwBpmuCm2wI51qXu+oJiPQk5Mi9SpLmdBUXRQQEkOm/PgfvEzcH
	8XjUm0PzvdXDGfCz1oK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110356

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- incorporates functionality up to and including the 6.9 kernel.
- Highlights include test and build fixes a new cxl-wait-sanitize
  command, support for QOS Class in cxl-create-region, and a new
  cxl-set-alert-config command.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-core/ndctl/{ndctl_v78.bb => ndctl_v79.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/ndctl/{ndctl_v78.bb => ndctl_v79.bb} (96%)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v78.bb b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
similarity index 96%
rename from meta-oe/recipes-core/ndctl/ndctl_v78.bb
rename to meta-oe/recipes-core/ndctl/ndctl_v79.bb
index 907c02c7c..9a4bc49d1 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v78.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74a614eac8b2657a4b8e6607421a0883"
 
 inherit meson pkgconfig bash-completion systemd
 
-SRCREV = "a871e6153b11fe63780b37cdcb1eb347b296095c"
+SRCREV = "16f45755f991f4fb6d76fec70a42992426c84234"
 SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https \
            file://0001-include-libgen.h-for-basename.patch"
 
-- 
2.34.1


