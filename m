Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30241C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 22:21:46 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.2023.1647987705654769457
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 15:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: randy.macleod@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22MMLhUV011337
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 15:21:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 22MMLgUF019429
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 15:21:43 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 22 Mar 2022 15:21:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 22 Mar 2022 15:21:40 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 22 Mar 2022 15:21:40 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] edac-utils: update to latest git head
Date: Tue, 22 Mar 2022 15:21:40 -0700
Message-ID: <20220322222140.106793-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 22:21:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96154

Add a DESCRIPTION.

Commits added:
   1c57818 etc/labels.db: add MiTAC HAWK layout
   d98769e Merge pull request #13 from musicinmybrain/fsf-address
   edf15c8 Update obsolete FSF postal addresses
   556ebce Merge pull request #6 from paulmenzel/remove-blank-lines-at-eof-in-labels.db
   55865fb etc/labels.db: Remove blank lines at end of file

The COPYING license file was changed in:
   edf15c8 Update obsolete FSF postal addresses
In addition to changing the address, the file indentation was also changed.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
index da08979d7..455859ec8 100644
--- a/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-bsp/edac-utils/edac-utils_git.bb
@@ -1,12 +1,16 @@
 SUMMARY = "Userspace helper for Linux kernel EDAC drivers"
 HOMEPAGE = "https://github.com/grondo/edac-utils"
+DESCRIPTION = "EDAC (Error Detection and Correction) is a set of Linux kernel \
+modules that handle reporting of hardware-related errors. Currently \
+these modules mainly handle detection of ECC memory errors for many \
+x86 and x86-64 chipsets and PCI bus parity errors."
 SECTION = "Applications/System"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = " sysfsutils"
 
-SRCREV = "f9aa96205f610de39a79ff43c7478b7ef02e3138"
+SRCREV = "1c57818ecee186aa47af0342149577df5302c022"
 PV = "0.18+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-- 
2.31.1


