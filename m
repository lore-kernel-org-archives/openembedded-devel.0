Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA357C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:38:15 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.151950.1692149894823798024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107669029"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107669029"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:38:12 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BF7BD3EA9
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:38:10 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BE04D5E88
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:38:09 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 618BE2FC7919;
	Wed, 16 Aug 2023 10:38:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] chrony: upgrade 4.3 -> 4.4
Date: Wed, 16 Aug 2023 09:37:46 +0800
Message-Id: <1692149866-5033-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10--8.670500-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/yTo39wOA02LhpxAd6mi1Ga3ozDhGeQC9EtSH
	nJDq2yhMrQul+l6zFlZPYdzP0JB46/pl4kxHvczFIGmn4OlOtCNqPM1MUyVAI8gVyTd/p+/IkKV
	W5HpbOFkQVF+RdRwAmXJcYaxXbIMB9X41s3bshlYdZEkR8Y/meRec4BHYbB/TAIHQXgQgQg+Xid
	r9etFZ1r00RZE03aJYT5qvV+wg6GYAzT8btdR147nHu4BcYSmt1cuIRwt/4MiysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmK1Z1Z7vc8GDSupJvqHf1A8vR08UROkEAehHrZE2+S869Z91MiFfg/zNInY
	86dvmV7v/nzK3rr9fsHFU143Oy/ZhKtME2+Ce8lvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1HI2pSDhttZ+bHRGjez/mZSntSP0aqZ063OVNJZuJSj2tCg/bFguCJw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104376

From: Wang Mingyu <wangmy@fujitsu.com>

arm_eabi.patch
refreshed for 4.4

Changelog:
===========
* Add support for AES-GCM-SIV with Nettle >= 3.9 to shorten NTS
  cookies to avoid some length-specific blocking of NTP on Internet
* Add support for multiple refclocks using extpps option on one PHC
* Add maxpoll option to hwtimestamp directive to improve PHC tracking
  with low packet rates
* Add hwtstimeout directive to configure timeout for late timestamps
* Handle late hardware transmit timestamps of NTP requests on all sockets
* Handle mismatched 32/64-bit time_t in SOCK refclock samples
* Improve source replacement
* Log important changes made by command requests (chronyc)
* Refresh address of NTP sources periodically
* Request nanosecond kernel RX timestamping on FreeBSD
* Set DSCP for IPv6 packets
* Shorten NTS-KE retry interval when network is down
* Update seccomp filter for musl
* Warn if loading keys from file with unexpected permissions
* Warn if source selection fails or falseticker is detected
* Add selectopts command to modify source-specific selection options
* Add timestamp sources to serverstats report and make its fields 64-bit
* Add -e option to chronyc to indicate end of response

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../chrony/chrony/arm_eabi.patch              | 20 +++++++++----------
 .../chrony/{chrony_4.3.bb => chrony_4.4.bb}   |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-support/chrony/{chrony_4.3.bb => chrony_4.4.bb} (98%)

diff --git a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
index 82c0e1b68b..b9bb374e53 100644
--- a/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
+++ b/meta-networking/recipes-support/chrony/chrony/arm_eabi.patch
@@ -1,4 +1,4 @@
-From 28b9f115e36e2133301b02fa02ad71a8efbed9b9 Mon Sep 17 00:00:00 2001
+From 71c44c214c0ab8dc8e9675e5e862f2e342fcb271 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Thu, 9 Mar 2017 10:58:06 -0800
 Subject: [PATCH] chrony: fix build failure for arma9
@@ -28,10 +28,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 9 insertions(+), 6 deletions(-)
 
 diff --git a/sys_linux.c b/sys_linux.c
-index f2baab1..14a9241 100644
+index 6849637..10f9a57 100644
 --- a/sys_linux.c
 +++ b/sys_linux.c
-@@ -484,7 +484,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -485,7 +485,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
  #endif
      SCMP_SYS(gettimeofday),
      SCMP_SYS(settimeofday),
@@ -39,15 +39,15 @@ index f2baab1..14a9241 100644
  
      /* Process */
      SCMP_SYS(clone),
-@@ -494,7 +493,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -495,7 +494,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(exit),
      SCMP_SYS(exit_group),
      SCMP_SYS(getpid),
 -    SCMP_SYS(getrlimit),
      SCMP_SYS(getuid),
      SCMP_SYS(getuid32),
- #ifdef __NR_rseq
-@@ -511,7 +509,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+ #ifdef __NR_membarrier
+@@ -515,7 +513,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      /* Memory */
      SCMP_SYS(brk),
      SCMP_SYS(madvise),
@@ -55,7 +55,7 @@ index f2baab1..14a9241 100644
      SCMP_SYS(mmap2),
      SCMP_SYS(mprotect),
      SCMP_SYS(mremap),
-@@ -571,8 +568,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -575,8 +572,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(sendmsg),
      SCMP_SYS(sendto),
      SCMP_SYS(shutdown),
@@ -64,15 +64,15 @@ index f2baab1..14a9241 100644
  
      /* General I/O */
      SCMP_SYS(_newselect),
-@@ -596,7 +591,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+@@ -600,7 +595,6 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
  #ifdef __NR_futex_time64
      SCMP_SYS(futex_time64),
  #endif
 -    SCMP_SYS(select),
      SCMP_SYS(set_robust_list),
      SCMP_SYS(write),
- 
-@@ -604,6 +598,15 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
+     SCMP_SYS(writev),
+@@ -609,6 +603,15 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
      SCMP_SYS(getrandom),
      SCMP_SYS(sysinfo),
      SCMP_SYS(uname),
diff --git a/meta-networking/recipes-support/chrony/chrony_4.3.bb b/meta-networking/recipes-support/chrony/chrony_4.4.bb
similarity index 98%
rename from meta-networking/recipes-support/chrony/chrony_4.3.bb
rename to meta-networking/recipes-support/chrony/chrony_4.4.bb
index 420cc78ca4..d4e03bc182 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.3.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.4.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://download.tuxfamily.org/chrony/chrony-${PV}.tar.gz \
 SRC_URI:append:libc-musl = " \
     file://0001-Fix-compilation-with-musl.patch \
 "
-SRC_URI[sha256sum] = "9d0da889a865f089a5a21610ffb6713e3c9438ce303a63b49c2fb6eaff5b8804"
+SRC_URI[sha256sum] = "eafb07e6daf92b142200f478856dfed6efc9ea2d146eeded5edcb09b93127088"
 
 DEPENDS = "pps-tools"
 
-- 
2.34.1


