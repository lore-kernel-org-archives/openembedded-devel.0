Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CD0C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:23:01 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.42944.1635765780039492514
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IhRnphoJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635765777; i=@fujitsu.com;
	bh=fmkhWPXXA6+pnAQOn1wFvQXuOEwyYzpcTbLRWLhAbc8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IhRnphoJ65R9ZXkxjfL+14eDfiQR/rvw4t3E5isbisoFFLDCnYseKdIWvx4jAS0Jm
	 RBUIeVyOMcku5pP9zdW4tlVOEoiVoYYtIiu5H+UEZppkYRwxVrAPD/os6T5vK4ogyN
	 KyPbV2xwjPkUHG7i3FqidVZ0G7i51xer3P2dXx1/cseINDwQrtJuqdiKDmtN8/gK/Q
	 I7ft/iNAePsjjI0mBAKs1R716Pxgm4WM7c5KrrA/7uBofY/ARRTj/khx7hJrOlu5fs
	 wydpo0QjiZ/QI6c96aH2IbYatBPB8e3XCgBFy3LZCsEt9vVZcv0CD036AdeeS8myJH
	 bBhXqYXVbAzlQ==
Received: from [100.113.4.229] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 19/0E-14220-11ECF716;
 Mon, 01 Nov 2021 11:22:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MxVVfgXH2
  iwb/r+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b//p3MBYdFK15/bGZsYPwj1MXIySEksJlJ
  omlxdhcjF5B9glHiyM/7jCAJNgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYQexhQUcJL5e3
  gtWwwIU7167A8zmFXCSODxjOxOILSGgIDHl4XtmiLigxMmZT1gg5khIHHzxghmiRlFi9uVmFg
  i7UmLV6j7mCYy8s5C0zELSsoCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhsa6prpGJoV5ilW6SXmq
  pbnJqXklRIlBWL7G8WK+4Mjc5J0UvL7VkEyMwwFIKWT/uYDz0+oPeIUZJDiYlUd6opfWJQnxJ
  +SmVGYnFGfFFpTmpxYcYZTg4lCR4U84A5QSLUtNTK9Iyc4DBDpOW4OBREuFdfhIozVtckJhbn
  JkOkTrFqMuxZOOSRcxCLHn5ealS4rxXQGYIgBRllObBjYBF3iVGWSlhXkYGBgYhnoLUotzMEl
  T5V4ziHIxKwrzMZ4Gm8GTmlcBtegV0BBPQEfvEakCOKElESEk1MNkLW6XPi0j/LB63PWTxNob
  Dq/avE5UsDJzAYF/1KNpiTd+VkFtrtNtn2H50Wm634tTUpYcjlqSu/1bGMUPjoMI2lrtpv67N
  DdkStzZifuRi/8Cl6ipitXZJSnEcf/Y6MeRv/tmUukj7Rpd/hG6mxLtZtndCHi30+HTwWFtZR
  vbPj+9u3Vpu1SbHejFfZpl1XFTaS2njyR+mOz/kyQzhKOj9tubROQYxdbui04XPbltZeotdOv
  YxU2/m3D+RYT1zf93nbLmxYca8IycdTyV+WvBSJCx7y/H/DLzNmvc1dzx+clPvXA1/s+W3b07
  3zQU/Kh19Yt2sx/fovqWXfWhofyDLlgBGofDyxReinz3Z8VKJpTgj0VCLuag4EQD84tHsNwMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-238.messagelabs.com!1635765776!440180!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13037 invoked from network); 1 Nov 2021 11:22:56 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-2.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Nov 2021 11:22:56 -0000
Received: from R01UKEXCASM224.r01.fujitsu.local (ex2k13_224.fs.fujitsu.com
 [10.182.185.122])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1A1BMo7t006392
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Nov 2021 11:22:56 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM224.r01.fujitsu.local (10.182.185.122) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 1 Nov 2021 11:22:48 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] avro-c: upgrade 1.10.2 -> 1.11.0
Date: Mon, 1 Nov 2021 19:22:24 +0800
Message-ID: <1635765747-37718-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM224.r01.fujitsu.local (10.182.185.122)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 11:23:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93697

release note:
All signed release artifacts, signatures and verification instructions can
be found here: https://avro.apache.org/releases.html

This release includes 120 Jira issues, including some interesting features:

Specification: AVRO-3212 Support documentation tags for FIXED types
C#: AVRO-2961 Support dotnet framework 5.0
C#: AVRO-3225 Prevent memory errors when deserializing untrusted data
C++: AVRO-2923 Logical type corrections
Java: AVRO-2863 Support Avro core on android
Javascript: AVRO-3131 Drop support for node.js 10
Perl: AVRO-3190 Fix error when reading from EOF
Python: AVRO-2906 Improved performance validating deep record data
Python: AVRO-2914 Drop Python 2 support
Python: AVRO-3004 Drop Python 3.5 support
Ruby: AVRO-3108 Drop Ruby 2.5 support

For the first time, the 1.11.0 release includes experimental support for
Rust. Work is continuing on this donated SDK, but we have not versioned and
published official artifacts for this release.

Python: The avro package fully supports Python 3. We will no longer publish a
separate avro-python3 package

And of course upgraded dependencies to latest versions, CVE fixes and more:
https://issues.apache.org/jira/issues/?jql=project%3DAVRO%20AND%20fixVersion%3D1.11.0

The link to all fixed JIRA issues and a brief summary can be found at:
https://github.com/apache/avro/releases/tag/release-1.11.0

In addition, language-specific release artifacts are available:

C#: https://www.nuget.org/packages/Apache.Avro/1.11.0
Java: from Maven Central,
Javascript: https://www.npmjs.com/package/avro-js/v/1.11.0
Perl: https://metacpan.org/release/Avro
Python 3: https://pypi.org/project/avro/1.11.0
Ruby: https://rubygems.org/gems/avro/versions/1.11.0
Thanks to everyone for contributing!

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../avro/{avro-c_1.10.2.bb => avro-c_1.11.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/avro/{avro-c_1.10.2.bb => avro-c_1.11.0.bb} (82%)

diff --git a/meta-oe/recipes-support/avro/avro-c_1.10.2.bb b/meta-oe/recipes-support/avro/avro-c_1.11.0.bb
similarity index 82%
rename from meta-oe/recipes-support/avro/avro-c_1.10.2.bb
rename to meta-oe/recipes-support/avro/avro-c_1.11.0.bb
index 98f464fd04..5fbd44a8ed 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.10.2.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.11.0.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 
 DEPENDS = "jansson zlib xz"
 
-BRANCH = "branch-1.10"
-SRCREV = "8111cdc35430ff68dcb644306362859de40999d9"
+BRANCH = "branch-1.11"
+SRCREV = "4e1fefca493029ace961b7ef8889a3722458565a"
 SRC_URI = "git://github.com/apache/avro;branch=${BRANCH} \
           "
 
-- 
2.25.1


