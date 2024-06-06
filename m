Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 835C7C27C65
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:00 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.9824.1717664814572761252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qyc/N4xY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664815; x=1749200815;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eYvumf8I9Uvz0hsF6okVm8mdCkHXFeXX+k3M5VoUa0A=;
  b=qyc/N4xYPJXR+niP/GKN5K0vHt4J/zp8MTuVVT4r2LYEJ87IrNKlo4pN
   LI//sRG2HgGkanGIsmQokTtreRa+YCilYb2zo0Mn7any2f+WK3GzujvxJ
   5Qe2nnp2EH4VhhEa6FZZOHDVkvWYx/Rs+r2zTpHxO9ejRllQi9i8HHhRM
   Jt/RiecEYsDEKwKWDU+ACXnrjqj4+ICiBtXdiA0D39d2lNF2K5YEiv0Ik
   iwSmsb+9lv3kLOnoUvs+9YUEtyQc6fMLGvnDy3iZL1F2oSmPwxupQZf+h
   0TGMvmp8aJCCm3SArtIgUbNgecVG+S2yNH8gkp3/P5bJ8v7NspuOZt7aF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="141612165"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="141612165"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:06:53 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B791DB3B5
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 69359D3F03
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0774620081323
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:06:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A4BBE1A000A;
	Thu,  6 Jun 2024 17:06:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/36] ctags: upgrade 6.1.20240310.0 -> 6.1.20240602.0
Date: Thu,  6 Jun 2024 17:06:06 +0800
Message-Id: <1717664795-13902-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrZFBAb4CyKPieM8KgZMynf4j6OrCq1tjNPMY3TTv7fNeY3igqmhPz3P7Lt
	bSsDrRxWEFEy8qULr4I22NPAeHQT3z53WXBPBysx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110715

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20240310.0.bb => ctags_6.1.20240602.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20240310.0.bb => ctags_6.1.20240602.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240310.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240602.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20240310.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20240602.0.bb
index d4ffbb7f0..f8add448b 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20240310.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20240602.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "38fd8e39b877a79666393b90e38400fd8d7d5d14"
+SRCREV = "653ca9204527fe1da7ecf97c3da4308f9ab17d2c"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


