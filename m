Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3D4CCA479
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 15:48:41 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.73595.1656949717943966797
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 08:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 264FmFEk017975
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 4 Jul 2022 08:48:15 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 4 Jul 2022 08:48:14 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 4 Jul 2022 08:48:14 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/4] libdbi-perl: fix interpreter on shebang line
Date: Mon, 4 Jul 2022 23:48:09 +0800
Message-ID: <20220704154812.17732-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 15:48:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97694

From: Kai Kang <kai.kang@windriver.com>

Update interpreter on shebang line in scripts to fix error:

ERROR: QA Issue: : /work/x86_64-linux/libdbi-perl-native/1.643-r0/sysroot-destdir/work/x86_64-linux/libdbi-perl-native/1.643-r0/recipe-sysroot-native/usr/bin/dbiproxy maximum shebang size exceeded, the maximum size is 128. [shebang-size]
ERROR: QA Issue: : /work/x86_64-linux/libdbi-perl-native/1.643-r0/sysroot-destdir/work/x86_64-linux/libdbi-perl-native/1.643-r0/recipe-sysroot-native/usr/bin/dbiprof maximum shebang size exceeded, the maximum size is 128. [shebang-size]
ERROR: QA Issue: : /work/x86_64-linux/libdbi-perl-native/1.643-r0/sysroot-destdir/work/x86_64-linux/libdbi-perl-native/1.643-r0/recipe-sysroot-native/usr/bin/dbilogstrip maximum shebang size exceeded, the maximum size is 128. [shebang-size]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
index 94f98fe40..1fee83a8f 100644
--- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
+++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.643.bb
@@ -29,6 +29,11 @@ do_install:prepend() {
 	rm -rf ${B}/t/z*.t
 }
 
+do_install:append() {
+	sed -i "s:^#!.*:#!/usr/bin/env perl:" ${D}${bindir}/dbiproxy \
+		${D}${bindir}/dbiprof ${D}${bindir}/dbilogstrip
+}
+
 RDEPENDS:${PN}:class-target = " \
     perl \
     perl-module-carp \
-- 
2.17.1


