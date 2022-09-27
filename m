Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBF3C6FA83
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 09:36:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.8715.1664271393416240952
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 02:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R5vHZC2J;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664271391; i=@fujitsu.com;
	bh=rXFnvfyHKAv75uhYLvg1LB8Kzc/Wht1JfEla/llPfXQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=R5vHZC2JuWNObTjc49aJGE8R2wViWplaiNApUXz9dqu0LrjmC71Mg+m3iZNFFur9r
	 vvuNe5eO9A8/4bk4o4oFHoQtw+Nbpcdkpxu0C7VGQyY0WnKd9Uc5D/gLUm/y5AxY9T
	 fzR09WMrkN+B1RbHIU14HBP6mZ3oWAJJJ5fGCE3tYzjtSXbamUnaVTsJTXYldB2wGY
	 ya84VmempWIiZ8w8do+lZ0rAHksj30YtbAhFEs9+RYNZJq+SWEOzSprUpWRizKXPNb
	 kFZAtkN/nRzNwMN5khodLp/JtQGV4IH+/IGHMfmp96dTIjFeXNs0M5KFgEVZPiqsd/
	 CHnoTYa1/GiyA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORpCt3xCj
  ZoO+woMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrG05w9jwUSuil8P6hoY13J2MXJxCAk8ZJRo
  nX+YsYuRE8i5wiSx9IM8hH2AUeLlHi8Qm01AV+LFj8UsILaIgL7E0tl7mEFsYQEfidPvprOC2
  CwCqhIPN/8Bsjk4eAXcJZ53poKEJQQUJKY8fA9WzisgKHFy5hOwMcwCEhIHX7xgBimXEFCUmD
  1dHqK8QqJx+iEmCFtN4uq5TcwTGPlmIemehaR7ASPTKkbrpKLM9IyS3MTMHF1DAwNdQ0NTXWM
  TXSNDC73EKt1EvdRS3fLU4hJdI73E8mK91OJiveLK3OScFL281JJNjMCwSylWurWDccOqn3qH
  GCU5mJREee0XGSUL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuBNPgSUEyxKTU+tSMvMAcYATFqCg
  0dJhHcHSJq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+XmpUuK8pluAigRAijJK8+BGwOLxEqOslD
  AvIwMDgxBPQWpRbmYJqvwrRnEORiVhXiGQVTyZeSVwm14BHcEEdIQdnz7IESWJCCmpBqbYzcL
  /fjPWeT7h2OtjnLtz97OT6ms+ft0QnXCn/tnPutojk1WP8oWYBHtyrrKM4IqofeN22m1H21er
  70st070aPEq23qk6uTT6o2iLwQxpj9bc781e1+bwLec60SrDvCl26inBc+UCc337HynXLlyS0
  tbSdkdEt47p+6FrdeeC/+q3qli8+fx8Lnf8/03cKhNT9l5tfHql3SgvfdEaOb55PvdivP5vPR
  h350ryPaXzUVGxc/b8/rnYYulapheKRXKXjDk/ab3l2++7+s/KqCD3bRypu5t36688zVNW8zv
  ljX1xcW2G7P5CF+3O4Ds7Puwr/bxW7q6KWeXCj+Lqrh9yFi6WrNh9/M1WqXOfXfiVWIozEg21
  mIuKEwHQDGzUQgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-571.messagelabs.com!1664271390!392528!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3721 invoked from network); 27 Sep 2022 09:36:30 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 09:36:30 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E66AC1AE
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:36:29 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id DAEAC1AD
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:36:29 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 10:36:28 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyscaffold: upgrade 4.3 -> 4.3.1
Date: Tue, 27 Sep 2022 17:36:20 +0800
Message-ID: <1664271380-2590-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 09:36:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98987

Modify tox.ini template to allow passing the TWINE_REPOSITORY_URL environment variable, PR #666.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pyscaffold_4.3.bb => python3-pyscaffold_4.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.3.bb => python3-pyscaffold_4.3.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.3.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.3.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.3.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.3.1.bb
index 027d7b9029..a19e38770a 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.3.1.bb
@@ -9,7 +9,7 @@ LICENSE = "0BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "1a8c39bbad9abc121d6e126035740ba5f043434abb432f368a3a76596184b3ed"
+SRC_URI[sha256sum] = "50cb1f910163204caec30c7c6bbe70f1a81c377538b8c8340d23abe31f5ca5b4"
 
 inherit pypi python_setuptools_build_meta
 PYPI_PACKAGE = "PyScaffold"
-- 
2.25.1


