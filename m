Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E80FA3740
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:08:57 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.1687.1667268531306322733
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:08:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jarBuar1;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268529; i=@fujitsu.com;
	bh=g4h42cxHrj4roTWdi/waHC2joKJI9T/Rl+NzY2NTM+k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jarBuar1Q+BPdETVqEoXIx1Hs3iqWVHTWGbAD7JolTUAqkmkAzbXpofM5OSR58RB2
	 54+6JIQzjA5rtZ97rApDOG4jcHCb4OYNUiLXujnmwzZFwErGIv+QHVBl8qJCyiL3GA
	 2/uxiSWh99ODLLv+IddlJ5VHivfQ4J2XuqbRqndQb4G2kD8kuax3kCMtVIHfpiy27v
	 JL1rPtIcWM8oOKGylrAhmKykcmX0cuDlsjQreyEUb3HTxyFtY/MhX0CLHOYYA/d4mw
	 WbOe+4yRTP0VMRJqW1SiIoSMX+dFBvxctatkSAIuO718PSB/ZxJBFlwNf6p5l0iv7R
	 LwFoABSP3O+eA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8ORpLuhPiH
  ZYM0+A4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePB3ydsBec5K+4c/c3cwPiDo4uRi0NI4CGj
  xIkdrSwQzmUmiZur97FCOLsZJQ7NeMfexcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgIBEq+nnwOKc3CwAMUvdICV8wo4SSw+9YcFxJYQUJCY8vA9WCungLPEx++3mEBsIaCak4
  /OMULUC0qcnPmEBWK8hMTBFy+YIXoVJWZfboaaUyExa1YbE4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjaXFqUVlqka6pXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg6KYUM5btYOxe9kfvEKMkB5OSKO9/iYRkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8k
  TVAOcGi1PTUirTMHGAcwaQlOHiURHh/VQOleYsLEnOLM9MhUqcYLTmmzv63n5ljOZic+bXtAL
  MQS15+XqqUOK9TLVCDAEhDRmke3DhYrF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMzbAHI
  VT2ZeCdzWV0AHMQEdxNYeB3JQSSJCSqqBiVXkRNbHmY+OVU5Q2j//xeonNk41G1aHyhvPmlvw
  SPXRMul8Hw8d91Omrwo4NUI/tAQaHWSP7Jl+3pmh2cf60kY5rtCW4BVyarP91M+y/WrwEoiUf
  y+wMDNO9+zF79e279mqdvalcJBpwuyI9HfXq0/y31ya8EIn99NLnaDVUe7mk904jqf/7f5/mW
  uvduZp24OLZs5r/prMe3Rln92FLWUiazSfuv6q/NMnYip74vJ05Ue+nkZOsY9+5XIeSN9olTB
  9TcOfjXn5rdMU6wQvrrX6YvKzrtCUydlAT2z9ybgz2yXLGO5FNlYFhrU8NfgwSyX31fan1Y17
  DtY0T39196PpVf/0vJ7AvqV293caKrEUZyQaajEXFScCAG3xNJVwAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-585.messagelabs.com!1667268528!39561!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19443 invoked from network); 1 Nov 2022 02:08:48 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:08:48 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 6C71B1AD
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:08:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6092673
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:08:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:08:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-xdist: upgrade 2.5.0 -> 3.0.2
Date: Tue, 1 Nov 2022 10:07:59 +0800
Message-ID: <1667268480-10004-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667268480-10004-1-git-send-email-wangmy@fujitsu.com>
References: <1667268480-10004-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99390

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pytest-xdist_2.5.0.bb => python3-pytest-xdist_3.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-xdist_2.5.0.bb => python3-pytest-xdist_3.0.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.0.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-xdist_3.0.2.bb
index c3e69e3e0a..4024905710 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pytest-xdist"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
-SRC_URI[sha256sum] = "4580deca3ff04ddb2ac53eba39d76cb5dd5edeac050cb6fbc768b0dd712b4edf"
+SRC_URI[sha256sum] = "688da9b814370e891ba5de650c9327d1a9d861721a524eb917e620eec3e90291"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


