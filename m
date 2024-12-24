Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C2CE7718D
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:20 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.30501.1735032437818616454
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ut0DeOQP;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032437; x=1766568437;
  h=from:to:cc:subject:date:message-id;
  bh=Q3DR6tWOebcNBthB4bKrL8lLrHc+A0NessUiqQDYXOU=;
  b=Ut0DeOQPLAIonXnOxu96d/bh2Xvjz2gnY6y1JejDYwwtqSbhzAQBQBqK
   UqkYngLQfhSlN2ZWgxGeZsGFrkCKHQXUgnraz2YhSHA7Nx8P+EsKp2rlk
   /XxcMKVrjfbDB9P+fcGRw/9qTiqKuIfIijcD2n7PDM19B3oFNivti2cV7
   +/1Lcp6urBVs7oeH9Fdx4oc6OtED4s4/KUrCT/D0Fhu/mf4hwpH2qwUmg
   bAWeAmsqWt6UjmngtyynvbTC9fetZDluOXrFYrHph68W5Fmnp9IkFzvUh
   UTtrIOa9gyTru2Q4Cx9c1/C9pTPt9S+940jkoUUAwDTvBTEZnjqkSwgZP
   A==;
X-CSE-ConnectionGUID: EpEb46THR1eNIzQUc63pLA==
X-CSE-MsgGUID: rc42aqHCRtqCZFZgsflcTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="185003183"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="185003183"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C880C2264
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3689ED5B42
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BC40F6B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:12 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 431101A006C;
	Tue, 24 Dec 2024 17:27:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/67] ctags: upgrade 6.1.20241215.0 -> 6.1.20241222.0
Date: Tue, 24 Dec 2024 17:25:55 +0800
Message-Id: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-1.026400-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPZ9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrZFBAb4CyKPieM8KgZMynf4j6OrCq1tjNPMY3TTv7fNeY3igqmhPz3Nk/6
	HJqrGZx9M95TJLTlhp7gO+GaEjTLXiqW1y2L7qmB0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114474

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.1.20241215.0.bb => ctags_6.1.20241222.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.1.20241215.0.bb => ctags_6.1.20241222.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.1.20241215.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.1.20241222.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.1.20241215.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.1.20241222.0.bb
index c35d958cdb..a4bb412be3 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.1.20241215.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.1.20241222.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "0a9e33eb38401c260f8a5e307943b06985d05e31"
+SRCREV = "43ca055488cff7db0a5680cd9f07a76b3faa85f4"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


