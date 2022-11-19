Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E16DC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:39:15 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.15735.1668843554602468111
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sDIa2EqJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843552; i=@fujitsu.com;
	bh=552GkvOL/aA+e9ApUnRh82UNJaMJS11IAJMSUKIeSCg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sDIa2EqJ8Uel45Olg0y6xrn7nvNi4mz6KL8ArUzUrNbUqVjwv4pnzSx1VzoO74Pa/
	 S/GnxkJqXLrrER0jSJHoH0/m3/4VBLbK+/ypixjla0PNeLMHBaEMG6KO+mdVgl7bKB
	 ufEQf2cCsy+hiLta4DIQeskNKKIAStKRACbyYfRELMIy1yMZIeSeDSrY1SlFr4VUUh
	 z3cCbdNUDl2Vw3SBV0p9Pqk+Frtck+zFf8h6cjyIDch12KgbvzIgLoiLZmD0Ng9Voh
	 wpVq1qj5ItDyqI5aaGwjJq4VPiPtSIOmUhX0KMKNFXbQ0br8xHO8O+45Vl1OSDSd+Y
	 ZSZ9ZgVGTz78g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqCvfUZF
  s0L7N2OLi4aXMDowe5zauYAxgjGLNzEvKr0hgzdi3nbXguXDF1wO/GBsYXwl0MXJxCAk8YZS4
  +mYtM4RznUli6tmZUM4eRokntzYydjFycrAJSEncuP+fDcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4C7xfdZkFhCbRUBVYnr/brB6XgFHifUXt7GC2BICChJTHr4H6+UUcJJ4PusVmC0EVLP44S
  FGiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYxmxalFZalFumZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBwZtSnMS5g3HOsj96hxglOZiURHn3tpcnC/El5adUZiQWZ8QXleakFh9ilOHgUJLgj
  WurSBYSLEpNT61Iy8wBRhJMWoKDR0mEV8QHKM1bXJCYW5yZDpE6xagoJc6bBNInAJLIKM2Da4
  NF7yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrzTQabwZOaVwE1/BbSYCWhxjnMZyOKSRIS
  UVANTmlLRz5f+T3qtDvi+9jbotKqQnlNxu1rjW+NqxqSWh3569zbn5V1etCWe/4aQS8/u7kVX
  KnV+SBoIbWmeI7LZetse7+nXGvZOPLi0/Ot0u4mnzs83Zufz4ei4sXHnS523v26a+jm7/xP2+
  5Ye8phn+YKq81e+yihf+SUVsUE4xGJHg+w5pnbu2MobIgG7N/In5gilyiZF+Jz5unP93x99TL
  caO47yaE296zzxnThzVtOEdbt3O+YLbOnIeixb+uLjvvsLmm8rPayv2db0o+r7isPMmUVOpx9
  yHuTzZ67c2rR6be2EZUZfk1Z8n2q7Wf7nx5Q+s723Gj9I1xTO3ppTfLOzz1N7s2p1zl4L9s+X
  lViKMxINtZiLihMBe5RF7FkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-745.messagelabs.com!1668843551!127195!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13349 invoked from network); 19 Nov 2022 07:39:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:39:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 53F0C106EF5
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 484BE106EF4
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:39:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] googlebenchmark: upgrade 1.7.0 -> 1.7.1
Date: Sat, 19 Nov 2022 15:38:04 +0800
Message-ID: <1668843486-2933-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668843486-2933-1-git-send-email-wangmy@fujitsu.com>
References: <1668843486-2933-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99628

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========

    Remove stray comment and added missing header
    Initialize help hook before actually parsing the command line
    remove unnecessary generated include directory
    Fixed build issues on window
    Explicitly cast int literals to int8_t in tests to silence implicit-conversion warnings
    Ensure we don't need benchmark installed to pass c++ feature checks
    Avoid deprecation warning in NVHPC
    run ClearRegisteredBenchmarks at exit
    FIx typo in benchmark.h
    add debug option for enabling more output for failed cxxfeaturechecks
    Fix link error when use as static library on windows.
    use CMAKE_INSTALL_FULL in pkg-config file (fixes nix package)
    Clean up test documentation formatting
    Enable aarch64 Linux wheel builds, use cibuildwheel action directly
    Eliminate usage of deprecated API in sysinfo.cc
    Stop using pandas.Timedelta (fixes #1482)
    Discuss sources of variance in the user guide
    Bump pybind11 version to enable Python 3.11 wheel builds
    bump cmake dep and docs
    Support for QuRT OS (Hexagon RTOS)
    Fix Solaris compilation (#1499)
    Do not depend on unversioned python binary
    Partially revert "Do not depend on unversioned python binary (#1496)"
    Add information for supported Python versions to setup.py
    [bazel] Build libpfm as a dependency to allow collection of perf counters

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{googlebenchmark_1.7.0.bb => googlebenchmark_1.7.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.7.0.bb => googlebenchmark_1.7.1.bb} (90%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.0.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.1.bb
similarity index 90%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.0.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.1.bb
index 7fc6d6472..1a565636d 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.0.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.1.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
-SRCREV = "361e8d1cfe0c6c36d30b39f1b61302ece5507320"
+SRCREV = "d572f4777349d43653b21d6c2fc63020ab326db2"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


