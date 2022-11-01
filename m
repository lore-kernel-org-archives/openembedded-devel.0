Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03536FA3741
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:07:17 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.1674.1667268430349100482
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JFWvD3fG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268428; i=@fujitsu.com;
	bh=zIUomCvUjLNene0mRrG+aWZNS2EKN8hlrQOA72G8dug=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JFWvD3fGjLyjmlxI8fq2nV8cKCwcM0XndfRBt7lDpc7j2pvj9fhEbHUPOdbxmpeXJ
	 0aHYUFnm20So9HIVkfTMkGgAuMCcyyZmLhYbR8/6aTRIOhmkCRzKAM44XLTq8LQ5CF
	 7XkDxI1ZqOSGsbYuePqsekMvGXv8a0zUBNusodb7lKS2/b0Q7PCitKYOJWpRfJ/obo
	 0u7A7i9CtwezPiH2JP/iAioQEBXvN0gv1huH+PudyvBJIGgtanuoGA7bnSzvdnMoJb
	 3HLWZgLj8R3oiXvqCnFkvPV5TBxvD5/6/waVC1VDL2GFWJLV1S+QIE4qqb6pwT7gAE
	 rdM7pXH1X5UlQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8MxSde7PiH
  ZYPlWU4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPqjCeMBdsEK6b/2svYwLiHv4uRi0NI4Amj
  xKbDvcwQznUmif+v1rJDOLsZJY7enAmU4eRgE5CSuHH/PxuILSKgL7F09h6wOLOAisSL3z3sI
  LawQIhE34VrLCA2C1D84pZpYHFeAUeJD8d+gvVKCChITHn4HqiXg4NTwEli6YN8kLAQUEnX7W
  3MEOWCEidnPmGBGC8hcfDFC2aIVkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdA2N9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECgzelmGHrDsaO5X/0DjFKcjApifL+l0hIFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBG
  1kDlBMsSk1PrUjLzAFGEkxagoNHSYT3VzVQmre4IDG3ODMdInWK0ZJj6ux/+5k5loPJmV/bDj
  ALseTl56VKifM61QI1CIA0ZJTmwY2DRfslRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8DSB
  X8WTmlcBtfQV0EBPQQWztcSAHlSQipKQamGYub2zPuJWj1L4hkyPujH5UWtHCYOfNLWkTBXbV
  OTp1Oij02/rulOSzL+h//PePyp1HjY+5WWbs/Cnx/+y7t8nB9Wanv5X2VTfJzzc74f2pqUPjU
  uJ2nV3KHzOEyia+KXE7PX9Z4aqL52W6A/49mbKL8+mkbQ8YQlZvk9B/YLH/F1dB6cEHDuJMU6
  4cDGLNDpm44M2me+pPbhYHlUdLLLq2U1/Kj7fqZfqVvIvpx2vZ3WYFLyl20L24fxNvcvrVZ6U
  c77vm7ZqoZmJuu32proZ5wpHvYTznpMtNlivYlwizztp287LlC6E+7QccaorcXjwrpvUs/DZp
  MuOknOXmvgYiLztVsw4E2V2pbRRNUWIpzkg01GIuKk4EAIwmMfJxAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1667268427!877988!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20675 invoked from network); 1 Nov 2022 02:07:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:07:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 821DD1000DC
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:07:07 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 75BD91000D7
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:07:07 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:07:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-benchmark: upgrade 3.4.1 -> 4.0.0
Date: Tue, 1 Nov 2022 10:06:46 +0800
Message-ID: <1667268408-9931-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667268408-9931-1-git-send-email-wangmy@fujitsu.com>
References: <1667268408-9931-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99384

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2022.

Changelog:
==========
    Dropped support for legacy Pythons (2.7, 3.6 or older).
    Switched CI to GitHub Actions.
    Removed dependency on the py library (that was not properly specified as a dependency anyway).
    Fix skipping test in test_utils.py if appropriate VCS not available. Also fix typo. Contributed by Sam James in #211.
    Added support for pytest 7.2.0 by using pytest.hookimpl and pytest.hookspec to configure hooks. Contributed by Florian Bruhin in #224.
    Now no save is attempted if --benchmark-disable is used. Fixes #205. Contributed by Friedrich Delgado in #207.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...enchmark_3.4.1.bb => python3-pytest-benchmark_4.0.0.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-benchmark_3.4.1.bb => python3-pytest-benchmark_4.0.0.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-benchmark_3.4.1.bb b/meta-python/recipes-devtools/python/python3-pytest-benchmark_4.0.0.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-pytest-benchmark_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-benchmark_4.0.0.bb
index bde9935ffe..98ba6c3822 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-benchmark_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-benchmark_4.0.0.bb
@@ -1,12 +1,9 @@
-# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
 SUMMARY = "A ``pytest`` fixture for benchmarking code. It will group the tests into rounds that are calibrated to the chosen timer."
 HOMEPAGE = "https://github.com/ionelmc/pytest-benchmark"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9c5c2c74370826468065c5702b8a1fcf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7d2e9d24c2b5bad57ca894da972e22e"
 
-SRC_URI[sha256sum] = "40e263f912de5a81d891619032983557d62a3d85843f9a9f30b98baea0cd7b47"
+SRC_URI[sha256sum] = "fb0785b83efe599a6a956361c0691ae1dbb5318018561af10f3e915caa0048d1"
 
 inherit pypi setuptools3
 
-- 
2.25.1


