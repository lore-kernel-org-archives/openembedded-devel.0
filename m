Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3663CC433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 14:28:14 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.7134.1641565692696720769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 06:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iADQDioN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641565690; i=@fujitsu.com;
	bh=AENTYAnYdSuHE/SWikChuGfEjYPyjp8qY+KJju7UUcY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iADQDioNflq3Li0fhYG2l04OFdm5X1V5f6vIlhTknbBmMMaN7Xxw6ka2j8P8se3JO
	 JbuOlqeeA/WCMjJ+/D4NkJLE1UDA/98qsaZx750HHDx993IMeg9Q/cxGdoWeD6ZFzj
	 5qy8fp4svPBYI9mXCziSBD/VZnjWmfAR+ZWg4CHXxiB36duEwGFpv09GglaK9hP9I9
	 k0HHnrRDijE+C8Psjv+0d4chxmhFkt8z/sm7huLv8YhIkMDZ+1pLK/EZuhStD2fyEt
	 XyZFyDAD6jwWjg4cpT9PelyXMVS31NDvq927jI9sYnjgrNKPTDHye0JfbH1bOjlfwd
	 QeZdV61ZHc1Ow==
Received: from [100.115.66.135] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 FB/A9-31213-AFD48D16; Fri, 07 Jan 2022 14:28:10 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORqPvL90a
  iweclghYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8au9teMBfdVKt6uecPewDhPoYuRi0NI4Amj
  xJQPa5ggnAtMEr9W3mCDcI4zSlz+t4Kxi5GTg01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBG4mfmxaC1bAAxTfvOwEW5xVwkjj1ZjoLiC0hoCAx5eF7Zoi4oMTJmU9YIOZISBx88Y
  IZokZRYvblZqj6ColZs9qYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxjtkooy0zNKchMzc3QNDQx
  0DQ1Ndc3MdI2MLPQSq3QT9VJLdZNT80qKEoHSeonlxXqpxcV6xZW5yTkpenmpJZsYgeGZUuz0
  ZAfj676feocYJTmYlER5dZ1vJArxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4K3wAcoJFqWmp1akZ
  eYAYwUmLcHBoyTCexUkzVtckJhbnJkOkTrFqMvxuuXnDmYhlrz8vFQpcd7D3kBFAiBFGaV5cC
  NgcXuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvJpBVPJl5JXCbXgEdwQR0xArh6yBHlCQ
  ipKQamA5NzEpdE5vNyLhrW/Kmb1/1TlwvMPJOMDg3ode7q8jk1iaOY9aJOSIZ/h+tN1yacPxS
  o0K/WqK8iuxkjtaVIa0X5E8+P/xnqvc5K+c9SaJZBbb8RX6Pda027rktpra587fth9BfHuLXd
  USXcmgqSrLmNX9O2q5W3HrOL37GylWlTCudMmpLDt15y7L2VfjCzxUdbza67zz2VWpd8YGjk3
  1YuePf2EQfZl3H9Dbnwslnvue+++889E/j3ZcnE15JhkzrZZxX84/9mq9j2csdK6qeNNb13Q4
  OCi6erOBWWslZy7YgtP2cksBO2TN+htyz97Q0aOw1ZJWovL/HNPZ8lWDK/dO3LP78b2ruYSyx
  U2Ipzkg01GIuKk4EAHErayBWAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-532.messagelabs.com!1641565689!21598!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13096 invoked from network); 7 Jan 2022 14:28:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jan 2022 14:28:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BA1FC1001A4
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  7 Jan 2022 14:28:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AE2DF10018A
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  7 Jan 2022 14:28:09 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 7 Jan 2022 14:27:48 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bats: upgrade 1.4.1 -> 1.5.0
Date: Fri, 7 Jan 2022 22:27:32 +0800
Message-ID: <1641565655-53792-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 14:28:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94689

0001-install.sh-consider-multilib.patch
removed since it is included in 1.5.0

Changelog:
Issues for this release <https://github.com/bats-core/bats-core/pull/####>
=========
Added:
---------
 new command line flags (#488)
 --verbose-run: Make run print $output by default
 -x, --trace: Print test commands as they are executed (like set -x)`
 --show-output-of-passing-tests: Print output of passing tests
 --print-output-on-failure: Automatically print the value of $output on
 failed tests
 --gather-test-outputs-in <directory>: Gather the output of failing and
 passing tests as files in directory
 Experimental: add return code checks to run via !/-<N> (#367, #507)
 install.sh and uninstall.sh take an optional second parameter for the lib
 folder name to allow for multilib install, e.g. into lib64 (#452)
 add run flag --keep-empty-lines to retain empty lines in ${lines[@]} (#224,
 a894fbf)
 add run flag --separate-stderr which also fills $stderr and
 $stderr_lines (#47, 5c9b173d, #507)

Fixed:
---------
 don't glob run's $output when splitting into ${lines[@]}
 (#151, #152, #158, #156, #281, #289)
 remove empty line after test with pretty formatter on some terminals (#481)
 don't run setup_file/teardown_file on files without tests, e.g. due to
 filtering (#484)
 print final line without newline on Bash 3.2 for midtest (ERREXIT) failures
 too (#495, #145)
 abort with error on missing flock/shlock when running in parallel mode (#496)
 improved set -u test and fixed some unset variable accesses (#498, #501)
 shorten suite/file/test temporary folder paths to leave enough space even on
 restricted systems (#503)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bats/{bats_1.4.1.bb => bats_1.5.0.bb}     |  6 +--
 .../0001-install.sh-consider-multilib.patch   | 43 -------------------
 2 files changed, 2 insertions(+), 47 deletions(-)
 rename meta-oe/recipes-test/bats/{bats_1.4.1.bb => bats_1.5.0.bb} (87%)
 delete mode 100644 meta-oe/recipes-test/bats/files/0001-install.sh-consider-multilib.patch

diff --git a/meta-oe/recipes-test/bats/bats_1.4.1.bb b/meta-oe/recipes-test/bats/bats_1.5.0.bb
similarity index 87%
rename from meta-oe/recipes-test/bats/bats_1.4.1.bb
rename to meta-oe/recipes-test/bats/bats_1.5.0.bb
index 13babd5ea..ffbb37c8a 100644
--- a/meta-oe/recipes-test/bats/bats_1.4.1.bb
+++ b/meta-oe/recipes-test/bats/bats_1.5.0.bb
@@ -6,11 +6,9 @@ HOMEPAGE = "https://github.com/bats-core/bats-core"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2970203aedf9e829edb96a137a4fe81b"
 
-SRC_URI = "git://github.com/bats-core/bats-core.git;branch=master;protocol=https \
-           file://0001-install.sh-consider-multilib.patch \
-          "
+SRC_URI = "git://github.com/bats-core/bats-core.git;branch=master;protocol=https"
 # v1.4.1
-SRCREV = "54e965fa9d269c2b3ff9036d81f32bac3df0edea"
+SRCREV = "99d64eb017abcd6a766dd0d354e625526da69cb3"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-oe/recipes-test/bats/files/0001-install.sh-consider-multilib.patch b/meta-oe/recipes-test/bats/files/0001-install.sh-consider-multilib.patch
deleted file mode 100644
index c7393ca2e..000000000
--- a/meta-oe/recipes-test/bats/files/0001-install.sh-consider-multilib.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 6e3d01f1ff199383b78a7504858c374fbce05f4e Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Thu, 10 Jun 2021 11:11:07 +0800
-Subject: [PATCH] install.sh: consider multilib
-
-It may install files to /usr/lib64 when multilib is enabled. Add an
-optional parameter for install.sh to support it.
-
-Upstream-Status: Submitted [https://github.com/bats-core/bats-core/pull/452]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- install.sh | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/install.sh b/install.sh
-index e660866..d91159e 100755
---- a/install.sh
-+++ b/install.sh
-@@ -4,6 +4,7 @@ set -e
- 
- BATS_ROOT="${0%/*}"
- PREFIX="$1"
-+BASELIB="${2:-lib}"
- 
- if [[ -z "$PREFIX" ]]; then
-   printf '%s\n' \
-@@ -12,10 +13,10 @@ if [[ -z "$PREFIX" ]]; then
-   exit 1
- fi
- 
--install -d -m 755 "$PREFIX"/{bin,libexec/bats-core,lib/bats-core,share/man/man{1,7}}
-+install -d -m 755 "$PREFIX"/{bin,libexec/bats-core,${BASELIB}/bats-core,share/man/man{1,7}}
- install -m 755 "$BATS_ROOT/bin"/* "$PREFIX/bin"
- install -m 755 "$BATS_ROOT/libexec/bats-core"/* "$PREFIX/libexec/bats-core"
--install -m 755 "$BATS_ROOT/lib/bats-core"/* "$PREFIX/lib/bats-core"
-+install -m 755 "$BATS_ROOT/lib/bats-core"/* "$PREFIX/${BASELIB}/bats-core"
- install -m 644 "$BATS_ROOT/man/bats.1" "$PREFIX/share/man/man1"
- install -m 644 "$BATS_ROOT/man/bats.7" "$PREFIX/share/man/man7"
- 
--- 
-2.17.1
-
-- 
2.25.1


