Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66739C36002
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:57:57 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.3049.1742461075359278144
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 01:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X3iP+A5M;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742461076; x=1773997076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=juE74AUgznTh+PABMHlKEBavIQMaFswsNb25iTPeMwU=;
  b=X3iP+A5MnbXQ5y6csAHjCXkcjL6Ka0A3ILwqyyBfVzyi4aD3cjFC0TzV
   9lBjFFV/d1WUbcisF+vjmwqL5u+KLGnrKqnwxViq2BE9h2eKlkQKsqJBi
   TECcW1AbB/M80wjAd2tdiFm+yUMpVTjgCDUnQajuAy9nCH83WJl5m53un
   1qzj4akHQIDYaLaXaEKcQ2oiJCgGxu5bspnVJXEd2SCLdpYlLnJGAwyce
   nIfL+OW1VBP9qYoNmcj+oR9DW/KXCUfCVj+1kZwseAmLiR1oxgzut/cI5
   +7otWtbKPmtUzAb8eiTeoAYcJV0t2JKFTQuGexTn1gy5DpwVIuyS6Y0Q0
   Q==;
X-CSE-ConnectionGUID: MVeoFvLRRa6nRVTMNQEtrQ==
X-CSE-MsgGUID: ALJdp4veRjGH5Kua9I7HIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="196397495"
X-IronPort-AV: E=Sophos;i="6.14,261,1736780400"; 
   d="scan'208";a="196397495"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 17:57:53 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B1AD3D6EA1
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 17:57:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D737D97B1
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 17:57:50 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DB8BF1A009A;
	Thu, 20 Mar 2025 16:57:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 2/5] ctags: upgrade 6.1.20250302.0 -> 6.1.20250316.0
Date: Thu, 20 Mar 2025 16:57:40 +0800
Message-Id: <1742461063-20828-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742461063-20828-1-git-send-email-wangmy@fujitsu.com>
References: <1742461063-20828-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 08:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116125

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20250302.0.bb => ctags_6.1.20250316.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20250302.0.bb => ctags_6.1.20250316.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250302.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250316.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20250302.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20250316.0.bb
index 4163cfc506..744d4dfe80 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20250302.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20250316.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "f272e5cfff4950770eb0c6563c1d9281e5119204"
+SRCREV = "3ee9ce5e3f6c7f58133af61f2490bbdb1afd93b7"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


