Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891D6C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:06:26 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.6406.1640012785005379781
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MiCoqfBn;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012782; i=@fujitsu.com;
	bh=CIjRokJqZRZnut9+pe1mP5TNo883NfgYLUF97CZoNN8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MiCoqfBnVk9XNouqsQqHF1Lf3H5DBKfp0p/lyPkeZYt+DNhBVEYMGTDAxPhJgCTDA
	 CURgvv/4Ti2vNbn0KfUF8B8IJMYBgXXi2yVgmZ0BRt3f4FzsVa4mkHKL0PcUYT9VPN
	 OU8++/e1XBkJmU7rlSOz390uaV/kuW3ymMFh8jZysJddCV3o8JpUbhYz7O6nYJBS6s
	 OhiK59La14vqyaWk/lEwx3HWYExHkTbUAAtfKN7SxVysF+bvrBVZUvszI9mOqOOF1y
	 SybWhaZ7Wg9JTB0yLmtY8+NYaBJVnMX/Okj8wHRjXDItg9n6iLvuoPVJiFosbjLIfK
	 8K1tbo0b6MQhQ==
Received: from [100.115.68.153] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 ED/09-06990-EEB90C16; Mon, 20 Dec 2021 15:06:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRWlGSWpSXmKPExsViZ8ORqPtu9oF
  Eg+WNYhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aWR22sBQtUKy6fnsvYwHhHvouRi0NI4Amj
  xJsTh1ggnAtMEtt7DkI5exgllsx8wNrFyMnBJqArce7xWnYQW0RAX2Lp7D3MILawgJPE7K6HY
  DaLgKrEmgMrwGxeAQ+Jdydvs4HYEgIKElMevoeKC0qcnPmEBcRmFpCQOPjiBVCcA6hGUWL2dH
  mI8gqJ14cvMUPYahJXz21insDINwtJ9ywk3QsYmVYx2iUVZaZnlOQmZuboGhoY6BoamuqaG+o
  aWhroJVbpJuqlluomp+aVFCUCpfUSy4v1UouL9Yorc5NzUvTyUks2MQKDMKXYfd8Oxhd9P/UO
  MUpyMCmJ8vL7HkgU4kvKT6nMSCzOiC8qzUktPsQow8GhJMH7cwZQTrAoNT21Ii0zBxgRMGkJD
  h4lEd4mkDRvcUFibnFmOkTqFKOilDivNzCOhARAEhmleXBtsCi8xCgrJczLyMDAIMRTkFqUm1
  mCKv+KUZyDUUmYN30W0BSezLwSuOmvgBYzAS1WCt8PsrgkESEl1cCU/MLQ2yskJVhC3/LlFMY
  90kvz6k7nSx9mnyyzP8Q26tYaDWYerRdzfs7++dP8obT1PVnnCpXY+PUVrdn/buq9cQ1fq9Zw
  dYqO6qGTwVmTMhf83m9w8YR7u6tWyQyDykLXtV9uPojcHhhTlPXOMtq2xz9LcE7VQp1JnicXM
  IvfjhP12uTcxuy5xHbXfR2r+XZ8wkm3Oo/4TDqnfTxi1RvWjqPn+KbFR7rP4OIu2lY8JWXih3
  98bnKNZ0RyJ4cH35GZWHLWKEL65/lp1xr1dj58b+56W03km1tueEyT+cfpW6yeVYaWbK6fcHM
  3f8tXTd6mh5d0ruh5CPb1ZKzK2vG8eX2LGtOGxff7hITau5VYijMSDbWYi4oTAT1DjEk9AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-532.messagelabs.com!1640012782!42714!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9197 invoked from network); 20 Dec 2021 15:06:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:06:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id CCEBE10024B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:06:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C1450100239
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:06:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:06:15 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] chrony: upgrade 4.1 -> 4.2
Date: Tue, 21 Dec 2021 08:06:03 +0800
Message-ID: <1640045163-88086-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 15:06:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94450

refresh arm_eabi.patch

Changelog:
==========
Enhancements
-Add support for NTPv4 extension field improving synchronisation stability and
resolution of root delay and dispersion (experimental)
-Add support for NTP over PTP (experimental)
-Add support for AES-CMAC and hash functions in GnuTLS
-Improve server interleaved mode to be more reliable and support multiple clients behind NAT
-Update seccomp filter
-Add statistics about interleaved mode to serverstats report

Bug fixes
-Fix RTC support with 64-bit time_t on 32-bit Linux
-Fix seccomp filter to work correctly with bind*device directives
-Suppress kernel adjustments of system clock (dosynctodr) on illumos

Other changes
-Switch Solaris support to illumos

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../chrony/chrony/arm_eabi.patch              | 30 +++++++++++--------
 .../chrony/{chrony_4.1.bb => chrony_4.2.bb}   |  2 +-
 2 files changed, 19 insertions(+), 13 deletions(-)
 rename meta-networking/recipes-support/chrony/{chrony_4.1.bb => chrony_4.2.bb} (98%)

diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
index 837cb6d72..4a2769b84 100644
--- a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
+++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
@@ -23,19 +23,22 @@ Subject: [PATCH] chrony: fix build failure for arma9
 
     Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sys_linux.c | 20 ++++++++++++++------
- 1 file changed, 14 insertions(+), 6 deletions(-)
+ sys_linux.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
 
+diff --git a/sys_linux.c b/sys_linux.c
+index 9cab2ef..8104b8f 100644
 --- a/sys_linux.c
 +++ b/sys_linux.c
-@@ -499,14 +499,12 @@ SYS_Linux_EnableSystemCallFilter(int lev
+@@ -484,7 +484,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
  #endif
      SCMP_SYS(gettimeofday),
      SCMP_SYS(settimeofday),
 -    SCMP_SYS(time),
-
+ 
      /* Process */
      SCMP_SYS(clone),
+@@ -494,7 +493,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(exit),
      SCMP_SYS(exit_group),
      SCMP_SYS(getpid),
@@ -43,7 +46,7 @@ Subject: [PATCH] chrony: fix build failure for arma9
      SCMP_SYS(getuid),
      SCMP_SYS(getuid32),
      SCMP_SYS(rt_sigaction),
-@@ -520,7 +518,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
+@@ -508,7 +506,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      /* Memory */
      SCMP_SYS(brk),
      SCMP_SYS(madvise),
@@ -51,28 +54,28 @@ Subject: [PATCH] chrony: fix build failure for arma9
      SCMP_SYS(mmap2),
      SCMP_SYS(mprotect),
      SCMP_SYS(mremap),
-@@ -580,8 +577,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
+@@ -568,8 +565,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(sendmsg),
      SCMP_SYS(sendto),
      SCMP_SYS(shutdown),
 -    /* TODO: check socketcall arguments */
 -    SCMP_SYS(socketcall),
-
+ 
      /* General I/O */
      SCMP_SYS(_newselect),
-@@ -604,7 +599,6 @@ SYS_Linux_EnableSystemCallFilter(int lev
+@@ -593,7 +588,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
  #ifdef __NR_futex_time64
      SCMP_SYS(futex_time64),
  #endif
 -    SCMP_SYS(select),
      SCMP_SYS(set_robust_list),
      SCMP_SYS(write),
-
-@@ -612,6 +606,15 @@ SYS_Linux_EnableSystemCallFilter(int lev
+ 
+@@ -601,6 +595,15 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(getrandom),
      SCMP_SYS(sysinfo),
      SCMP_SYS(uname),
-+    /* not always available */
++   /* not always available */
 +#if ! defined(__ARM_EABI__)
 +    SCMP_SYS(time),
 +    SCMP_SYS(getrlimit),
@@ -82,5 +85,8 @@ Subject: [PATCH] chrony: fix build failure for arma9
 +    SCMP_SYS(socketcall),
 +#endif
    };
-
+ 
    const int denied_any[] = {
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/chrony/chrony_4.1.bb b/meta-networking/recipes-support/chrony/chrony_4.2.bb
similarity index 98%
rename from meta-networking/recipes-support/chrony/chrony_4.1.bb
rename to meta-networking/recipes-support/chrony/chrony_4.2.bb
index 117451db2..609aaab88 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.1.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.2.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
 SRC_URI:append:libc-musl = " \
     file://0001-Fix-compilation-with-musl.patch \
 "
-SRC_URI[sha256sum] = "ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c"
+SRC_URI[sha256sum] = "273f9fd15c328ed6f3a5f6ba6baec35a421a34a73bb725605329b1712048db9a"
 
 DEPENDS = "pps-tools"
 
-- 
2.25.1


