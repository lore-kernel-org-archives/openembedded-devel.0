Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91016C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:05:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.8907.1678889108527287704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TDyGZtOE;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889110; i=@fujitsu.com;
	bh=Q4N5EzSXpTpZuOvWE3ivPDaGnD5/us8f50mlag5l5ak=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TDyGZtOEYFGVIAlXyZ/bRriJPBBFsa8Ewu2bWM5xSLcQJAXm/wQHBdmUkJiwcXePn
	 LweZWWpjL0G0sQZ1xWdcKUan6DzFW0pZRMs8avUcxesMRD6egof/USeTXdlPmLE9+o
	 DdAQnNVzvG9ES0c+jGiaSfgXza4NCbcc/WRwuEjBKzo6ohq87gf9/oTrsb3Eu0gOSf
	 DDGEboLKZ2XZg39KYuoXRRSAkDAl4J278kSq9YeVYYAuQSChpgzN3nHTTOE6IVvf3J
	 CJwxMCxwBKIpZGbO9dHU4LhBKj7GGU5au+F5nTkSCAad9ArWEHeNmUqEBMGoj+X5jp
	 Wr9ZJRai9H9uw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSXfqBcE
  UgxvTTC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oy3XfdZCn5rVrxefpq1gfGlchcjJ4eQwBNG
  iftf3boYuYDs60wSHze1MkE4exglNu9ewAJSxSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAq8Tezr+sIDaLgKrEvu52RhCbV8BJYs+6S2C2hICCxJSH78F6OQWcJT6/7QWKcwAtc5
  L4uNEaolxQ4uTMJywQ4yUkDr54wQzRqigx+3IzC4RdIdE4/RAThK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaN5cWpRWWqRrqGhXlJRZnpGSW5iZo5eYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVu
  ck6KXl5qySZGYPCmFKcd38H4su+v3iFGSQ4mJVHeP2sEUoT4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8P47I5giJFiUmp5akZaZA4wkmLQEB4+SCG/qeaA0b3FBYm5xZjpE6hSjLsfVK1f2Mgux5O
  XnpUqJ8/4FKRIAKcoozYMbAYvqS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZeBXMKTmVc
  Ct+kV0BFMQEfwzhMAOaIkESEl1cCUov3Eabrao3QnYGTYLuvnU2p1DuiemTHza9Fpw0vTnipt
  vZSmI/Ew7HTv0Z+bp3xo2XjIrn0CF9MWVb2fGavjoisTY3aUsNy1vxta9aea+VKIlqSy9fO0j
  pU6Ti8OGexibF4vp1dw69C1LOeSN1OvfvFbFpjWkHtHtUfTq9//rnu4Q8myyPAlTIt2F0zvm7
  ig0t1p/pOWJ7F1bsHvspvn7o7fMu9y/pHCllfeE49euzo1b3XpcQ3ZXc/3S4SKnTxslDpnTlH
  5Q4HYOYc5fcrfb9+9vEb+2O7F/DcSDrZIpT1+PYf7+58Djw6+Zq0NNihec0dP/Ya60x0Gzass
  +bE+dSdfPV5z6KPKeZ0uh+9KLMUZiYZazEXFiQDt851gZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-732.messagelabs.com!1678889109!66966!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26678 invoked from network); 15 Mar 2023 14:05:09 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:05:09 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 340721000D7
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:09 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 26B5B1000D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:09 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:05:07 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gcovr: upgrade 5.2 -> 6.0
Date: Wed, 15 Mar 2023 22:04:41 +0800
Message-ID: <1678889082-20604-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889082-20604-1-git-send-email-wangmy@fujitsu.com>
References: <1678889082-20604-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101541

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
==========
Breaking changes:
------------------
    Remove not allowed attributes function-rate, functions-covered and functions-valid from cobertura report. (:issue:'671')
    Remove "noncode" entries in JSON reports. (:issue:'663')
    New :option:'--exclude-noncode-lines' to exclude noncode lines. Noncode lines are not excluded by default anymore. (:issue:'704', :issue:'705')
    Changed :option:'--gcov-ignore-parse-errors' to accept list of errors to ignore. (:issue:'701')
    The default filename for :option:'--cobertura' is changed from coverage.xml to cobertura.xml (:issue:'721')
    Handling of gcov errors:
        Do not ignore return code of gcov. (:issue:'653')
        New :option:'--gcov-ignore-errors' to ignore gcov errors. Old behavior was to print a warning and continue. (:issue:'718')
    Revert changes from :issue:'623' and add documentation entry :ref:'support keil uvision format'. (:issue:'727')

New features and notable changes:
---------------------------------
    New :option:'--html-nested' for reports that summarize subdirectories with aggregated statistics per directory. (:issue:'687')
    Accept NAN % which is used in GCOV 7.5.0 instead of an invalid value. (:issue:'651')
    New :option:'--json-base' to define a base bath used in JSON reports. (:issue:'656')
    New :option:'--calls' to report call coverage: function calls invoked/total (:issue:'666')
    New nox session to generate a portable application with pyinstaller, see :ref:'standalone application'. (:issue:'661')
    Print a warning if root directory contains symlinks. (:issue:'652')
    Change :option:'--keep' when calling gcov internaly. (:issue:'703')
    Allow annotations for never executed branches. (:issue:'711')
    Add function merge mode for same function defined in different lines. (:issue:'700')
    Update link to gcovr documentation in HTML report to point to the documentation of the used version. (:issue:'723')
    Add environment SOURCE_DATE_EPOCH to set default for :option:'--timestamp'. (:issue:'729')

Bug fixes and small improvements:
--------------------------------
    Fix :option:'--html-tab-size' feature. (:issue:'650')
    Fix alphabetical sort of html report, for when there are symlinks. (:issue:'685')
    Handle :option:'--version' before parsing the configuration file. (:issue:'696')
    Fix reports of excluded coverage. (:issue:'409', :issue:'503', :issue:'663')
    Fix handling for nonexistent source code for HTML-details and Coveralls reports. (:issue:'663')
    Exclude functions with :ref:'Exclusion markers'. (:issue:'713')
    Fix problem in decision parser if open block brace is on same line. (:issue:'681')
    Add Python 3.11 to test matrix. (:issue:'717')
    Fix casing of files if filesystem is case insensitive. (:issue:'694')
    Fix deadlock if :option:'-j' is used and there are errors from gcov execution. (:issue:'719')
    Fix problem in decision parser if case is not on a single line with the break statement. (:issue:'738')
    Do not use realpath for DirectoryPrefixFilter to support symlinks in root directory. (:issue:'712')

Documentation:
-------------
    Add detailed reference for the JSON output format. (:issue:'663')

Internal changes:
-----------------
    Select the :option:'--html-theme' using CSS classes. (:issue:'650')
    Change and extend cmake tests. (:issue:'676')
    Detect gcc version for running tests. (:issue:'686')
    Use scrubbed data for --update_reference option. (:issue:'698')
    Install ninja with package manager instead of GitHub action. (:issue:'699')
    Rename the reference files coverage.xml to cobertura.xml and the test from xml to cobertura (:issue:'721')
    Add support for clang-14 in our test suite and improve startup performance of docker image. (:issue:'731')
    Compare files by extension in test suite. (:issue:'733')
    Split HTML templates into one file for each part of the page. (:issue:'735')
    Change docker image to be able to use it like the nox command itself. (:issue:'734')

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gcovr_5.2.bb => python3-gcovr_6.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gcovr_5.2.bb => python3-gcovr_6.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_5.2.bb b/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-gcovr_5.2.bb
rename to meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
index 03231f926..901d0017d 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "generate GCC code coverage reports"
 HOMEPAGE = "https://gcovr.com"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e59af597b3484fa3b52c0fbfd5d17611"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6542fc4ce5904ffb741ef56f8fe33452"
 
 SRC_URI = "git://github.com/gcovr/gcovr.git;branch=master;protocol=https"
-SRCREV = "1040a85ecfb3ef0d01635df9d50a3cae5059d566"
+SRCREV = "1221ef62ff0de15bbeaf79e68e08a65d62c73ff4"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


