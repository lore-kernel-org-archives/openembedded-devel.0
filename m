Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF26E7718D
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:01:56 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.77389.1734426112559769520
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Dec 2024 01:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n4+h/KZj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734426113; x=1765962113;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YzgTn0UVTEz2F5URi1E9qecYLXdb9p3ybm4SZN6HYaQ=;
  b=n4+h/KZjudgm4wjFHYjj6dDsQKoZW8duvgDQEvuuTq9IcnvHNt50uCxd
   i3v7f9+5BKF7GYFYRjguFEIZV+mZI5rzsvSDMOTl/Asct3y5V7AcrW4sV
   Y6fmeQZjHb0XsbPQz67+lsBjZUgQNeHMF+vOO6stCyWMiSf++k+Eet4Gg
   JwaQZGVOTnvMwv62UCnCmxCRoDFI1nXBIYCc436xcvsXCzbnHmhj8uLu2
   glJzNRgd5aRMHHw1WYfe5IPmniQv9RsanFRS2kOu4eR6L1TJmVi5t6EBl
   N7e5vMb3TibTur24AuerhbUS0ee+L2tIH58ZqQcg0DPWw5rubYRrs7MP3
   A==;
X-CSE-ConnectionGUID: ObkYkN0dR6itxYgT8OfFiQ==
X-CSE-MsgGUID: xc7JC5jxTy+2ksG+XMxufA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="186395533"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="186395533"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 18:01:51 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 796E1D4809
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5262AD9003
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D749E2007C3F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 18:01:47 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 73DB01A000B;
	Tue, 17 Dec 2024 17:01:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/17] ctags: upgrade 6.1.20241201.0 -> 6.1.20241215.0
Date: Tue, 17 Dec 2024 17:01:21 +0800
Message-Id: <1734426096-18300-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
References: <1734426096-18300-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8Krc9g9sLC3YAU4J2YSIlhB/gVpWnSEqmSt5XsIGdKacFGxcHxkbIaAanV56
	PFGhPaiiIvjXeyDVGIhqKpEd1G4w79VCZKkOgW6x0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Dec 2024 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114351

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../ctags/{ctags_6.1.20241201.0.bb => ctags_6.1.20241215.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20241201.0.bb => ctags_6.1.20241215.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20241201.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20241215.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20241201.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20241215.0.bb
index 209a6ce329..c35d958cdb 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20241201.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20241215.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "c828bc235e2ca2aee30f1c87248a963563353977"
+SRCREV = "0a9e33eb38401c260f8a5e307943b06985d05e31"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


