Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86414EB28E7
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:40 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7069.1770365558351418882
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DeaH4PR4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770365559; x=1801901559;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fafZIQkCSQozM/l78oO4byy18P1mfO1mLUoz2kTI7Co=;
  b=DeaH4PR4+Bm/8+aJanW1TaOf94qOO4gyfPWOkH+5LHNLPsUDY/au3W9/
   yOs2AtllILRpw0YRS0ph6waVyrFFMf8MTdJ4+dw8/PtuFgYO9rNwJpq6o
   idMeAZCvMYLtT6TW3yg1geEPn68jD/yzrf30QzIlLSghwD67kHGiol017
   hW8PWr7S4/Mov5xi2F66Ikngy4D0pcdjrXj0/efzHL4+98e2QYAhUIYYd
   /J0GlG+UaMrFRiHqTNfltFWpeMLyrxw10729lL0nzkvd9zA6kr/W45V9P
   K02fVdM4/ddUiizA096GCqrasZv21wEolNchtFIC6KNM9tN2HL0P2y3AB
   A==;
X-CSE-ConnectionGUID: Z9rk7f80TIi/fK+ke35kRQ==
X-CSE-MsgGUID: 0ofS/m50Qc+vwgcT5uTmRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="228783376"
X-IronPort-AV: E=Sophos;i="6.21,276,1763391600"; 
   d="scan'208";a="228783376"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 17:12:37 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id D13EA100037C
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 08:12:36 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 872BCC00D5B
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 08:12:36 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3FF7B1800D70
	for <openembedded-devel@lists.openembedded.org>; Fri,  6 Feb 2026 08:12:33 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH v2] wireshark: Fix do_compile error
Date: Fri,  6 Feb 2026 16:12:29 +0800
Message-ID: <20260206081230.5793-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124229

If there is no mate_grammar.c, it will cause exit code 1 by "test -e" as following:

WARNING: exit code 1 from a shell command.

So use "if" instead of "test"

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
index 2cf9693f5c..897be7adfa 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
@@ -71,8 +71,9 @@ do_compile:append:class-target() {
     sed -i -e "s:** source file.*::g"  ${B}/wiretap/busmaster_parser.c
     sed -i -e "s:** source file.*::g"  ${B}/epan/protobuf_lang_parser.c
     sed -i -e "s:** source file.*::g"  ${B}/epan/dfilter/grammar.c
-    test -e ${B}/plugins/epan/mate/mate_grammar.c && \
-        sed -i -e "s:** source file.*::g"  ${B}/plugins/epan/mate/mate_grammar.c
+    if [ -f "${B}/plugins/epan/mate/mate_grammar.c" ]; then
+        sed -i -e 's:** source file.*::g' "${B}/plugins/epan/mate/mate_grammar.c"
+    fi
 }
 
 do_install:append:class-native() {
-- 
2.43.0


