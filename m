Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A69ECC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 07:55:56 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.28838.1641801356115524019
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Jan 2022 23:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20A7tnM7011112
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 9 Jan 2022 23:55:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20A7tcPA008011
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 9 Jan 2022 23:55:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 9 Jan 2022 23:55:38 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 9 Jan 2022 23:55:38 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-initramfs][PATCH] grubby: fix confilict with debianutils
Date: Sun, 9 Jan 2022 23:55:38 -0800
Message-ID: <20220110075538.121858-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 07:55:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94709

Both of recipe grubby and debianutils provides installkernel,
use update-alternative to resolve the conflict

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-initramfs/recipes-devtools/grubby/grubby_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
index d275387c8..43fcc1aee 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_git.bb
@@ -38,4 +38,8 @@ do_install_ptest() {
 RDEPENDS:${PN} += "bash"
 RDEPENDS:${PN}-ptest = "util-linux-getopt bash"
 
+inherit update-alternatives
+ALTERNATIVE_${PN} = "installkernel"
+ALTERNATIVE_LINK_NAME[installkernel] = "${sbindir}/installkernel"
+
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
-- 
2.33.0


