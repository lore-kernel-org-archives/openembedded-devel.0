Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C284C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 12:45:06 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.25711.1646657104958080026
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 04:45:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=i0rakyu3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646657103; i=@fujitsu.com;
	bh=OdXWLUkB0A4qZx5C/KmArz4VcAUJ2+97MCMm7VVQzDI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=i0rakyu3CyXQc0BMKkFKhmHKOmlt2OTch6kfVtdgLfiC8tOxHJJKx8FUgcWN8popd
	 219aMCC069OUOHL07qkUlmEgGnugRHy7TZY1LdhUUJXKRpGBhwSGInZS/b20D5m3g/
	 Q29zRVtnyOHmEFVBP481WYhE683nuLOcIewr9QOQ5rfVrYQW0XT7MvsZBdJmHvY5Cc
	 Sc1fviK1PAz8O3e/TICGhBwBOBNbLfSaSewgU69oQ6Zl1z4qYhsoPwIcj7QFjj3cej
	 1npL1cB+omWVSo6MhJ3E3R+OcvfLMvxWp9n7lMsjHeTBhe+PBGJqbhT/h8CuH8vkKU
	 TWuXUxXh+BTcA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORqOv3TzX
  J4PM8ZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPl4omMBatdKv5enMLUwPjcqouRk0NI4Amj
  xOrTEV2MXED2BSaJLQdms0M4xxklHs1/xwRSxSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  UANHBzCAo4SN/dqgYRZgMLHdh5lB7F5BZwkPq6ayAJiSwgoSEx5+B6slVPAWeLR05vMEEc4ST
  y5D7GKV0BQ4uTMJywQ4yUkDr54wQzRqygx+3Iz1JwKiVmz2pggbDWJq+c2MU9gFJyFpH0WkvY
  FjEyrGO2SijLTM0pyEzNzdA0NDHQNDU11zcx0jYws9BKrdBP1Ukt1k1PzSooSgdJ6ieXFeqnF
  xXrFlbnJOSl6eaklmxiBoZxS7PRkB+Prvp96hxglOZiURHlTFqgmCfEl5adUZiQWZ8QXleakF
  h9ilOHgUJLg/foHKCdYlJqeWpGWmQOMK5i0BAePkghvyBegNG9xQWJucWY6ROoUozHH1StX9j
  Jz/P30dy+zEEtefl6qlDjvD5BJAiClGaV5cINg8X6JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAe
  jkjCv+1+gKTyZeSVw+14BncIEdEqVrRLIKSWJCCmpBiZrHuc/L/3DChIWJmQ8Ev/SMdFOgzuJ
  tyxMK3yBRQWH7eecmK2qN0vst1853q56pPO1tcDuLPEZMqbHX4v/+MB6uXzf9k6nkw7SUxcJa
  6+pVHb0OPtcrWX/qoW67+vytYVEf71Yv3H/g16f321pjMuOZHjZt5rU7fdZvHRigDKDaVTvvY
  ZC/ttrN1QHM/lGVpt/eNd8jv/+hXe79Kz9E7UmKDMGt0/v2Sb8c8F+nsD13bmFMwMVb8Qf+D9
  ZW+PmStb0/byLt93/IhHinxfNdGrqpSvvpRNye3RnJsTOe7+4V6ov/bTWeebqwq8Lrwkdn1Fw
  U+Xil2LLshdr2QzX314afU9h+6rj8V83Jsv6lSuxFGckGmoxFxUnAgC8c19NcgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-528.messagelabs.com!1646657102!21991!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2769 invoked from network); 7 Mar 2022 12:45:02 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 12:45:02 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A1ED01001A6
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 12:45:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8D8EE1001A5
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 12:45:01 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 12:44:47 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] smartmontools: upgrade 7.2 -> 7.3
Date: Mon, 7 Mar 2022 20:44:29 +0800
Message-ID: <1646657069-56146-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646657069-56146-1-git-send-email-wangmy@fujitsu.com>
References: <1646657069-56146-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 12:45:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95857

0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
refreshed for new version.

Changelog:
=========
- smartctl '-j': Many additions to the JSON output for SCSI/SAS devices.
- smartctl '-j': JSON output always includes timestamp, regardless of '-i'.
- smartctl '-i' and '--identify': ATA ACS-5 enhancements.
- smartctl '-l defects': additionally works for SCSI Pending Defects log
  subpage.
- smartctl '-l envrep': Prints SCSI Environmental Reporting log subpage.
- smartctl '-l scterc[,R,W],p': Gets/sets the persistent power-on values.
- smartctl '-l scterc,reset': Restores to manufacturer's default values.
- smartctl '-l tapedevstat': Prints SCSI Tape Device Statistics log page.
- smartctl '-l tapealert': Prints SCSI Tape Alert log page.
- smartctl '-l zdevstat': Prints SCSI Zoned Block Device Statistics log
  subpage.
- smartctl '-H': No longer checks and clears the SCSI Tape Alert log page
  unless the option is given twice.
- smartctl '-H': No longer sets bit 2 of exit status if ATA attributes are
  available.
- smartctl '-H': Checks new NVME 1.4 status bit.
- smartctl '-n POWERMODE': ATA: Optionally exits immediately if unsupported.
- smartctl: Support for Zoned block device characteristics and statistics.
- smartctl: Various fixes related to SCSI supported log pages and subpages.
- smartd: Fixed code execution vulnerability in conjunction with
  GNU mailutils < 3.13.
- smartd '-u USER[:GROUP]': Runs the warning script as a non-privileged user.
- smartd '--capabilities': No longer suppresses mail notification.
- smartd '--capabilities=mail': Adds capabilities required for exim MTA.
- smartd '-q *nodev0*': Three new options to change the exit status to 0 if
  there are no devices to monitor.
- smartd '-s' and '-A': Allows one to disable preconfigured files with '-'.
- smartd: Fixed handling of multiple email addresses in conjunction with
  plugin scripts.  Added new environment variable SMARTD_ADDRESS_ORIG.
- smartd: No longer writes 'smartd -D' output to syslog on syntax error.
- smartd.conf '-c i=N': Allows one to specify device specific check intervals.
- SCSI: Retry on UNIT ATTENTION when fetching capacity.
- NVMe/USB: Device type '-d sntasmedia' for ASMedia ASM2362 USB to
  NVMe bridges.
- VERSION information in drive database files of all branches.
- smartctl and smartd print drive database VERSION information.
- HDD, SSD and USB additions to drive database.
- update-smart-drivedb: Now checks VERSION information to prevent downgrades.
- update-smart-drivedb '--force': Overrides the VERSION check.
- update-smart-drivedb '--file' and '--url': Updates from local files or
  other URLs.
- update-smart-drivedb '-q': Suppresses info messages.
- update-smart-drivedb: Added long option variants for all short options.
- update-smart-drivedb: Prevents dangling gpg-agents and temp directories.
- update-smart-drivedb '--install': Installs runtime drivedb.h from location
  specified by ...
- configure '--with-drivedbinstdir: drivedb.h package install location.
- configure: SOURCE_DATE_EPOCH prevents inclusion of configure arguments
  in executables.
- configure: Check for '-fstack-protector' now includes the required libs.
- Dropped restriction to C++98, a C++11 compiler is now required.
- Linux: Device scan range enhanced to '/dev/sdzz'.
- Linux: Fixed access to '-d aacraid' and '-d megaraid' devices from smartd
  if '--capabilities' is used.
- Linux: '-d cciss,N' is no longer required for non-RAID hpsa devices.
- Darwin: smartctl '-s apm,N' is now supported.
- OpenBSD: Fixed too short command timeouts.
- OpenBSD: Fixed device name used for autodetection.
- OpenBSD: Fixed SAT autodetection of sd* devices.
- FreeBSD: Added direct access ('-d megaraid,N') and scanning for LSI RAID on
  'mfi' and 'mrsas' controllers.
- Windows: smartd '-u restricted': Runs the warning script with a restricted
  access token.
- Windows: New script 'update-smartd-drivedb.ps1' provides gpg verification
  and replaces 'update-smartd-drivedb.exe'.
- Windows: Disabled '-d aacraid' support due to unresolved bugs.
  Added '-d accraid,...,force' flag to try anyway.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch | 66 +++----------------
 ...rtmontools_7.2.bb => smartmontools_7.3.bb} |  3 +-
 2 files changed, 9 insertions(+), 60 deletions(-)
 rename meta-oe/recipes-extended/smartmontools/{smartmontools_7.2.bb => smartmontools_7.3.bb} (93%)

diff --git a/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch b/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
index 87c0e1458..23d066617 100644
--- a/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
+++ b/meta-oe/recipes-extended/smartmontools/files/0001-configure.ac-Define-SOURCE_DATE_EPOCH-in-CPPFLAGS.patch
@@ -1,4 +1,4 @@
-From b621a313e0bc67803abfba18e1ae15e7a8b9b59f Mon Sep 17 00:00:00 2001
+From 898fd4115be5cdd848db99fe85e1d0d7f1b3fa02 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Mon, 22 Feb 2021 17:21:33 +0200
 Subject: [PATCH] smartmontools: Improve reproducibility
@@ -8,18 +8,18 @@ https://github.com/smartmontools/smartmontools/commit/24838916b4c0e91f5c897d44fc
 
 Upstream-Status: Backported
 Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+
 ---
- ChangeLog    |  8 ++++++++
- configure.ac | 12 ++++++++++++
- utility.cpp  | 10 ++++++++++
- 3 files changed, 30 insertions(+)
+ ChangeLog | 8 ++++++++
+ 1 file changed, 8 insertions(+)
 
 diff --git a/ChangeLog b/ChangeLog
-index 39eac2d..6a3b4ee 100644
+index 5f0930a..4c5a91e 100644
 --- a/ChangeLog
 +++ b/ChangeLog
-@@ -1,5 +1,13 @@
- $Id: ChangeLog 5155 2020-12-30 16:49:18Z chrfranke $
+@@ -705,6 +705,14 @@ $Id: ChangeLog 5338 2022-02-28 16:34:26Z chrfranke $
+ 
+ 	Happy New Year!  Update copyright year in version info.
  
 +2021-02-07  Christian Franke  <franke@computer.org>
 +
@@ -32,53 +32,3 @@ index 39eac2d..6a3b4ee 100644
  2020-12-30  Christian Franke  <franke@computer.org>
  
  	smartmontools 7.2
-diff --git a/configure.ac b/configure.ac
-index ee6f0e5..c37c9bc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -61,6 +61,18 @@ case "${host}" in
-     ;;
- esac
- 
-+AC_MSG_CHECKING([whether reproducible build is selected (SOURCE_DATE_EPOCH)])
-+res=no
-+if test -n "$SOURCE_DATE_EPOCH"; then
-+  res=yes
-+  test -z "`echo "$SOURCE_DATE_EPOCH" | sed 's,[[0-9]]*,,'`" || res=error
-+fi
-+AC_MSG_RESULT([$res])
-+case $res in
-+  error) AC_MSG_ERROR([Malformed SOURCE_DATE_EPOCH]) ;;
-+  yes) CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-DSOURCE_DATE_EPOCH=$SOURCE_DATE_EPOCH" ;;
-+esac
-+
- # Check for SVN.
- AC_MSG_CHECKING([whether this is a build from SVN])
- is_svn_build=no
-diff --git a/utility.cpp b/utility.cpp
-index 0483c6f..8ab38c9 100644
---- a/utility.cpp
-+++ b/utility.cpp
-@@ -134,9 +134,19 @@ std::string format_version_info(const char * prog_name, bool full /*= false*/)
- #endif
-                                                           "\n"
-     "smartmontools configure arguments:"
-+#ifdef SOURCE_DATE_EPOCH
-+                                      " [hidden in reproducible builds]\n"
-+    "reproducible build SOURCE_DATE_EPOCH: "
-+#endif
-   ;
-+#ifdef SOURCE_DATE_EPOCH
-+  char ts[32]; struct tm tmbuf;
-+  strftime(ts, sizeof(ts), "%Y-%m-%d %H:%M:%S", time_to_tm_local(&tmbuf, SOURCE_DATE_EPOCH));
-+  info += strprintf("%u (%s)", (unsigned)SOURCE_DATE_EPOCH, ts);
-+#else
-   info += (sizeof(SMARTMONTOOLS_CONFIGURE_ARGS) > 1 ?
-            SMARTMONTOOLS_CONFIGURE_ARGS : " [no arguments given]");
-+#endif
-   info += '\n';
- 
-   return info;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/smartmontools/smartmontools_7.2.bb b/meta-oe/recipes-extended/smartmontools/smartmontools_7.3.bb
similarity index 93%
rename from meta-oe/recipes-extended/smartmontools/smartmontools_7.2.bb
rename to meta-oe/recipes-extended/smartmontools/smartmontools_7.3.bb
index 28f0ce8cd..1bf55bfcf 100644
--- a/meta-oe/recipes-extended/smartmontools/smartmontools_7.2.bb
+++ b/meta-oe/recipes-extended/smartmontools/smartmontools_7.3.bb
@@ -23,8 +23,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'libcap-ng selinux', d)
 PACKAGECONFIG[libcap-ng] = "--with-libcap-ng=yes,--with-libcap-ng=no,libcap-ng"
 PACKAGECONFIG[selinux] = "--with-selinux=yes,--with-selinux=no,libselinux"
 
-SRC_URI[md5sum] = "e8d134c69ae4959a05cb56b31172ffb1"
-SRC_URI[sha256sum] = "5cd98a27e6393168bc6aaea070d9e1cd551b0f898c52f66b2ff2e5d274118cd6"
+SRC_URI[sha256sum] = "a544f8808d0c58cfb0e7424ca1841cb858a974922b035d505d4e4c248be3a22b"
 
 inherit autotools update-rc.d systemd
 
-- 
2.25.1


