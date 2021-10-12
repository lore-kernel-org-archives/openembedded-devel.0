Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FE2C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 05:28:02 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web10.9720.1634016481323919694
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 22:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UvR+z6Np;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634016478; i=@fujitsu.com;
	bh=amPREozHHB/P3UGp56LBbs4r9orwoP6JA6EQAE8mCNI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UvR+z6NpGnTsuHlddjw42lybwjkFPyasbWp9U1sWhqufwHSd06EGOVdO+rxW3/rFS
	 g1ap6zxudqh5/IlBcC7GZb40q0qMbcq5vKhi1lRG0yZrKgce1isIlxcsT5dbnZc1lQ
	 aW8tlVfrXjI/bOvKH2uwCH7rJ82vIgD5hRfLTsKBfAWos5db+2LGDUWLQO86aaJzb3
	 Dx6vg+BEUnexO+bN8+EzyRuQKQF5ZqMcN++4gPE99ryDS32uK8a5TjrDMLZcEDhg9r
	 ivzL2fkkHPsOiPzPMd9z+JL1PKiCidPshm33MXHXXg3VBl1QX5cecZpdDIHlEg+KD9
	 Bsjaf9QSU2O0g==
Received: from [100.113.2.26] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 24/92-11692-EDC15616;
 Tue, 12 Oct 2021 05:27:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1b0rk5p
  o8HCDkcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHj5BXmgp08FVPmzmJtYNzO3cXIxSEkMJtJ
  4s6KF8wQzglGiZknF7J3MXJysAnoSHS86GYBsUUE9CWWzt7DDGILC/hK/Pn/CCzOIqAqseb2A
  TYQm1fAXaLrYCcriC0hoCAx5eF7Zoi4oMTJmU/A6pkFJCQOvnjBDFGjKLF95xkWCLtC4vXhS8
  wTGHlmIWmZhaRlASPTKkaLpKLM9IyS3MTMHF1DAwNdQ0NjXSNdU0O9xCrdRL3UUt3k1LySokS
  gpF5iebFecWVuck6KXl5qySZGYCClFDIZ72C89vqD3iFGSQ4mJVHeoFMpiUJ8SfkplRmJxRnx
  RaU5qcWHGGU4OJQkeDv5UhOFBItS01Mr0jJzgEENk5bg4FES4Z0JDGwh3uKCxNzizHSI1ClGR
  Slx3h9CQAkBkERGaR5cGyySLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5i2UBprCk5lXAj
  f9FdBiJqDFgVEpIItLEhFSUg1Mp8tmhb6RPaqyJj1H927Eou2qdleMarp9W/hupH34KHf+wzy
  RL4ca7TUuHd/KVMZU7XiyqLrtf5ziTtacJ6dX7lit6J190TAs4dXTzGN16R5rqxPZuE2feWnW
  r2dlWff995PqTU9U5ulUZ27Y1XtR6/nvTEF2u/kbygxsVr88+8ReyvjVkk+JrvvWzyhp9OX7L
  CW7e8sbvdh/eWF+U9Uijyu1GlQGb5qhu8s2uLp/o4f7C7lQ248d8bEq61N5/5rmdUm1bsg7sS
  DGfOLfh9mLC4783L34uea9rhfMkob7w6Nr3m/hmBlq1D5h2aON/5snn7J58+BozKaabmvd/N+
  58r5e/vzVdl17tve4RmYosRRnJBpqMRcVJwIAU5TXox8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-226.messagelabs.com!1634016477!60577!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5438 invoked from network); 12 Oct 2021 05:27:57 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-7.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Oct 2021 05:27:57 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19C5RvAB012860
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 06:27:57 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Tue, 12 Oct 2021 06:27:56 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-jdatetime: upgrade 3.6.2 -> 3.6.4
Date: Tue, 12 Oct 2021 13:27:50 +0800
Message-ID: <1634016470-17090-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Oct 2021 05:28:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93247

-License-Update: Update PKG-INFO.

[3.6.4] - 2021-09-15
Add
Add date.min based on cpython implementation
Add date.max based on cpython implementation
[3.6.3] - 2020-12-11
Change
Run test and publish package from github action

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...python3-jdatetime_3.6.2.bb => python3-jdatetime_3.6.4.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jdatetime_3.6.2.bb => python3-jdatetime_3.6.4.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb b/meta-python/recipes-devtools/python/python3-jdatetime_3.6.4.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
rename to meta-python/recipes-devtools/python/python3-jdatetime_3.6.4.bb
index cadddc49f5..ad1ca428fe 100644
--- a/meta-python/recipes-devtools/python/python3-jdatetime_3.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-jdatetime_3.6.4.bb
@@ -1,10 +1,9 @@
 DESCRIPTION = "Jalali implementation of Python's datetime module"
 HOMEPAGE = "https://github.com/slashmili/python-jalali"
 LICENSE = "Python-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=fc0a323542d2fbe0ad822fa0b1a0a96f"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f6890b2f685363312aff7f520831cdef"
 
-SRC_URI[md5sum] = "3c9ee1bc7de48ff4d9c773046b2eb081"
-SRC_URI[sha256sum] = "a589e35f0dab89283c1a3de9d70ed6cf657932aaed8e8ce1b0e5801aaab1da67"
+SRC_URI[sha256sum] = "39d0be41076b3a3850c3bfa90817e7ed459edc0e9cadce37dc7229b11f121c7e"
 
 PYPI_PACKAGE = "jdatetime"
 
-- 
2.25.1


