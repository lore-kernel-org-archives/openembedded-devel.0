Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 434A8ECD9BF
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 03:28:39 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3492.1770348513061246832
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 19:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sMazbjL/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770348511; x=1801884511;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wxvPUxch6C1CLqBDwX009gSsEIJYoEn3CmFOU1y2hDo=;
  b=sMazbjL/wptRQ59nXf9GhP4+Bpc+bTQofEauVT68SAEcZtOvU9GQKGgO
   HrxJic42P2EqFhM2Mghh5ZEJITzkdsvtBR+Oorf75QWVTuuAYWisil38D
   XVoQZ7CUtABKyp4Y+l7GVqrZVpOYak6yiSvtGeE7qPKr8TVjTri/Z1Kio
   gJaovNPgWSA6VTGaUAbvqBpie4Ea+JUZEW8XTVepXkbNROrJeqwH2t3EC
   i4MFXKMJZfxNYX8Lh0HbaB42f8/AMdPgVbYda7OUpUNzjoCIfUV5nUoBW
   m3xRxQkHOrXMMci7B8jGAJ14/a0256+7KYbQdKpzsTJrKu8s7Z7T9wwMA
   A==;
X-CSE-ConnectionGUID: FsG55C9zR7ixK5JyPNED3g==
X-CSE-MsgGUID: 2hnciB/lThWWXeT+vyu4qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="228686493"
X-IronPort-AV: E=Sophos;i="6.21,275,1763391600"; 
   d="scan'208";a="228686493"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 12:28:29 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 3EC9C100037A
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 03:28:31 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id CBC7C861250
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 03:28:30 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8FFB414022DC
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 03:28:28 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] wireshark: Fix do_package_qa Issue
Date: Fri,  6 Feb 2026 11:27:52 +0800
Message-ID: <20260206032752.4974-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 03:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124224

There is no mate_grammar.c in new version of wireshark, so remove related sed.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
index 2cf9693f5c..d06310e41e 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
@@ -71,8 +71,6 @@ do_compile:append:class-target() {
     sed -i -e "s:** source file.*::g"  ${B}/wiretap/busmaster_parser.c
     sed -i -e "s:** source file.*::g"  ${B}/epan/protobuf_lang_parser.c
     sed -i -e "s:** source file.*::g"  ${B}/epan/dfilter/grammar.c
-    test -e ${B}/plugins/epan/mate/mate_grammar.c && \
-        sed -i -e "s:** source file.*::g"  ${B}/plugins/epan/mate/mate_grammar.c
 }
 
 do_install:append:class-native() {
-- 
2.43.0


