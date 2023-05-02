Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBB6C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 18:51:16 +0000 (UTC)
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web11.1962.1683052123987473116
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 11:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: bhargav_das@mentor.com)
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; 
   d="scan'208";a="4161756"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 02 May 2023 10:28:42 -0800
IronPort-SDR: 6b2IECtH2uhcVfU1brzH9/8d3pwTSsEZskT7NUcnMcgz+3jUqubjW0nxAWSoJfokA0hDaITpUx
 3Ucc5pRj8gzTBo5Xc1FEZeR4n2JW8WLMESAwOxk7dus8cqV8RRiqjQky6fK8zSKM4OGofe8+gi
 cIUj1ba4mRjzqlTK0jPRbe3P7/NyVsmnrP9NAlbbE4vmjFRMV/UGFW6/9wwPBVsjO7DvUQ84hg
 IJ9TleyzOX6TkR2bIVRoqebaoLa0NCUIoOpx3ZpfXtm4T6OwBhYM6axGSD+SO84HsdlVV9OyMI
 RKk=
From: "Bhargav Das" <bhargav_das@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Bhargav Das <bhargav.das@siemens.com>
Subject: [meta-oe][PATCH 1/2] tslib: Add native & nativestdk package support
Date: Tue, 2 May 2023 23:57:58 +0530
Message-ID: <20230502182759.149005-1-bhargav_das@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-14.mgc.mentorg.com (147.34.90.214) To
 svr-orw-mbx-13.mgc.mentorg.com (147.34.90.213)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 18:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102277

From: Bhargav Das <bhargav.das@siemens.com>

Add support for building native and nativesdk variants.

Signed-off-by: Bhargav Das <bhargav.das@siemens.com>
---
 meta-oe/recipes-graphics/tslib/tslib_1.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
index c2000b264..cb2563225 100644
--- a/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
+++ b/meta-oe/recipes-graphics/tslib/tslib_1.22.bb
@@ -81,3 +81,5 @@ FILES:tslib-uinput += "${bindir}/ts_uinput"
 
 FILES:tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw ${bindir}/ts_print_mt \
                      ${bindir}/ts_test ${bindir}/ts_test_mt ${bindir}/ts_verify ${bindir}/ts_finddev ${bindir}/ts_conf"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


