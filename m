Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA225EDE99C
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:31 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.18594.1725959008382244695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QPCIzdlL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959008; x=1757495008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rgCH6kRscBu63nsEYg5RwHodLk0yWpPcLhtRlQ9ETgk=;
  b=QPCIzdlLHAbp7fbwI4kaQVDPPZFr/f5zu2TMlycWXUJfUyVr2793v9U4
   AiaqRqjutwZuWYun7UZHX4GS7eJMaS8ODqDgweea8GG5RaN3kndd7KrPS
   b4Eg9o+MlqyGtqRPE8udrAugDhlrcAArDVO59wolZV/4z+2HHVWWRRgC7
   t3r+jyjDaDdk4EiP6gGZDk2jS8aHFldeWUmRHCFQTKbkP67cwmXlSvBrt
   c8Pe5v99zw1EMM3wSC0wsB4nJuJEIyBFT12DeyWKTbNqVXmTqiv2tigDw
   VoYQrP8IzgzkNCf+rRderRglkf7HYnAK0u1WnKFuMxY0tHiNo0HpMq7i2
   g==;
X-CSE-ConnectionGUID: diwtFkiQRNW+VriyHw9tWA==
X-CSE-MsgGUID: kd50pwCyTVm00YY5Ql3VWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="160627401"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="160627401"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:26 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id D09ECDB3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 16A08D3F11
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C00D6BE52
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4FBD21A01E9;
	Tue, 10 Sep 2024 17:03:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 12/42] libio-compress-lzma-perl: upgrade 2.212 -> 2.213
Date: Tue, 10 Sep 2024 17:02:40 +0800
Message-Id: <1725958990-5719-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10-0.427800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy+WtdtaO3wUEOwpfLMeBwRt9LQinZ4QefCP/VFuTOXUTae6
	hIZpj4MuOhzOa6g8KrVB4bpb4LWhsoQrKmKqyJXIDe945e5+a/o9QdpeNZ640q/QV63ZpP2HufN
	+84RSUpuRdB7pqsNyonL1yeC4NPXkLUbVOgp37Lh0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112198

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ess-lzma-perl_2.212.bb => libio-compress-lzma-perl_2.213.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-lzma-perl_2.212.bb => libio-compress-lzma-perl_2.213.bb} (88%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.212.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb
similarity index 88%
rename from meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.212.bb
rename to meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb
index cf5a9db66..f6733ad02 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.212.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.213.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=2a0fd6d30eaf8828958
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "51ef81f931cfd2c13fb2340c665204a9587843087dec1a57e9e9f4666d6dad40"
+SRC_URI[sha256sum] = "daa63c3fa1f7708aa55b97a4d189820f5e849f8e4583dc24b5cceebd06a493eb"
 
 S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
 
-- 
2.34.1


