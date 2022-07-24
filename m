Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F84C00144
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:45:16 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.14503.1658882699635535672
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=iixJWoxj;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658882697; i=@fujitsu.com;
	bh=TtJBOSTOQQFxdknPvp5rMxUSv4rVodiEGf9fXBoCHpM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=iixJWoxjrgVmPQx0YJR+eL/rllLVvJ9XpGn55fGE2p8L0PQL/CSQFPp31AjZ9d9Wo
	 rDHnu7WqbNIjePmxfpS11BKmMAfdltlRtg8mSXFNQgumdwjFp22R96v5wvcKy8URfc
	 v04cothngEeaNpZgraZbyANIE6GEq7lRMAAnvZS0AVFlqqTKf0c4OQXmrDahTuuOiC
	 M1PMffglXRyR7Cq6JgRApOB3fwPSKbt9xDZt9LX6xgLDYmxaqdwzOrOfSoXzWFlN3u
	 XQrQzthXIQ7jItys5KPkGrPb5d3zrrfWXn/q7MU6sFmbrX3z8qyNO8VDj4lU132eFG
	 9tGVqcwxd6f6g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRWlGSWpSXmKPExsViZ8MxSbej60G
  SweKbYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8baLT+YCjYqVvTPecDYwLhSpouRi0NI4Amj
  xMoXh9khnOtMEm9X3GOGcPYwSrQ/amTsYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAQ2Le+e9gNouAqsTrgwfB6nkFnCRONlwBsyUEFCSmPHzPDBEXlDg58wkLxBxNidbtv9
  khbHmJ5q2zmSHqFSVmX25mgbArJGbM2MYGYatJXD23iXkCo8AsJKNmIRk1C8moBYzMqxhtk4o
  y0zNKchMzc3QNDQx0DQ1NgbSRrqGpsV5ilW6iXmqpbl5+UUmGrqFeYnmxXmpxsV5xZW5yTope
  XmrJJkZgMKcUp83cwbhl3y+9Q4ySHExKoryV9g+ShPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwb
  usAygkWpaanVqRl5gAjCyYtwcGjJMJb2AmU5i0uSMwtzkyHSJ1itOSYOvvffmaO5WBy5te2A8
  xCLHn5ealS4ryqIA0CIA0ZpXlw42DRf4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG84yBS
  ezLwSuK2vgA5iAjpoiwLYQSWJCCmpBibJ5W8vnz/A0JZ3sMQ4SFZwvtXVS4LH5hkYWs3y23BV
  j+v3r8nbxXP+Z004MDsjWfEe/9+pHiveVJ+NYktV3OE3e/VPxvLGU76sB3emrp4hUSJaMW3+J
  Pa858zzuPlKmB5PWpCzm7PpWN3V0+fOvj1k1XQ2c3Yg/+ePN/z2VexhdT3r2ZbonfJcWOzxs8
  6D8tF+RX+sZ+41+S44eZaCxIqADsakRF4FkeqgpcfKw05vX/dR/4LiOreykGqOiifntycziST
  fsbPcpP7ZTGutxzdv7p/qnU/ub/1Xr5hl7Ze4tH8bU930J2vcrKY9jLH4+XLqXu9mXRn+WM8Z
  WRy3dgdrfH44uZFPIHsPn2+RzHklluKMREMt5qLiRABiBJh6eQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-728.messagelabs.com!1658882695!198930!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15126 invoked from network); 27 Jul 2022 00:44:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 00:44:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id BCBEA100078
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 01:44:55 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B0102100077
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 01:44:55 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 01:44:53 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] googlebenchmark: upgrade 1.6.1 ->  1.7.0
Date: Sun, 24 Jul 2022 10:50:09 +0800
Message-ID: <1658631009-16775-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 00:45:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97998

Changelog from 1.6.1 to 1.7.0:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  Stop generating the export header and just check it in
  use target_compile_definitions
  simplified code
  Add docs for ThreadRange.
  Add docs on Memory profiling (#1217).
  Suppress GoogleTest warnings on windows (MSVC) too.
  Expand documentation for unpacking arbitrary arguments.
  Refine docs on changing cpufreq governor
  Refine the User Guide CPU Frequency Scaling section
  Fix some errors in Custom Statistics document demo code.
  Cache PerfCounters instance in PerfCountersMeasurement
  Fix cross compilation for macOS ARM builds in cibuildwheel
  bump numby, as per dependabot
  Use Win32 API only for Win32 apps
  Add mutex when reading counters_ (Fixes #1335)
  Avoid potential truncation issues for the integral type parameterized tests.
  Expose default display reporter creation in public API
  explicitly export public symbols
  Check for macro existence before using
  simplify reference to internal path
  Introduce the possibility to customize the help printer function
  move bzl file out of tools
  resolve case sensitivity issues with WORKSPACE and workspace
  Make generate_export_header.bzl work for Windows.
  @platforms is magical; remove it from WORKSPACE.
  restore BENCHMARK_MAIN()
  Allow setting the default time unit globally
  Add long description and content type for proper PyPI presentation
  Add SetBenchmarkFilter() to set --benchmark_filter flag value in user code
  Add PyPI upload job to wheel building workflow
  Fix float comparaison and add float comparison warning
  Add BENCHMARK_STATIC_DEFINE to the Python bindings' cc_binary local=E2=80=A6
  Remove conditional trigger from PyPI upload job
  Change artifact download name to dist to match upload name
  Build //:benchmark as a static library only.
  Fix Bazel build breakage caused by commit 6a894bd.
  [nfc] Reformat doc-string in generate_export_header
  Updates for inclusive language
  getting sysinfo in line with Google style
  Small optimization to counter map management
  Shut down Bazel gracefully and revert wheel build strategy to job matrix
  Fix wheel job name for PyPI uploads
  Filter out benchmarks that start with "DISABLED_"
  Add benchmark labels to the output of the comparison tool
  Enable -Wconversion
  Add installation and build instructions for Python bindings
  fix some typos
  Add option to get the verbosity provided by commandline flag -v (#1330)
  Add support to get clock for new architecture CSKY
  Introduce warmup phase to BenchmarkRunner (#1130)
  Report large numbers in scientific notation in console reporter (#1303)
  add multiple OSes to bazel workflow
  Add possibility to ask for libbenchmark version number (#1004)
  Fix DoNotOptimize() GCC copy overhead (#1340)
  Clarify that the cpu frequency is not used for benchmark timings.
  Revert "Add possibility to ask for libbenchmark version number (#1004)"
  Remove redundant formatting tags
  Fix DoNotOptimize() GCC compile error with some types (#1340)
  Expose default help printer function
  fix sanitizer builds by using clang 13
  Suppress nvcc offsetof warning
  Expose google_benchmark.State for python bindings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{googlebenchmark_1.6.1.bb =3D> googlebenchmark_1.7.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/googlebenchmark/{googlebenchmark_1.6.1.bb =3D> googlebenchmark_1.7.0.bb} (90%)

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.0.bb
similarity index 90%
rename from meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb
rename to meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.0.bb
index b44d3bee27..7fc6d64728 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.6.1.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.7.0.bb
@@ -5,7 +5,7 @@ LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI =3D "git://github.com/google/benchmark.git;protocol=3Dhttps;branch=3Dmain"
-SRCREV =3D "0d98dba29d66e93259db7daa53a9327df767a415"
+SRCREV =3D "361e8d1cfe0c6c36d30b39f1b61302ece5507320"
 
 S =3D "${WORKDIR}/git"
 
-- 
2.25.1


