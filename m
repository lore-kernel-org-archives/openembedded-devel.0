Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web12.9035.1626360634736878390
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iuMGTA2K;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626360632; i=@fujitsu.com;
	bh=IJZ2pqkn2PmWJNiEmqD4BsSc/4Mf7iPjEPqefN3049E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iuMGTA2K/3ehuE/THflGyWpEdODp4WCNfJG9KBKxvSUboUaLsjtj7fb4KveuA7vu+
	 tgfxUjtUeZxJz048gmbEePLlZzNUt6WJ0aYvKo1/HfUZiPwcM7eQVKMJNF3vgQoVu0
	 8FiY5Zk8gqDP9Mvift3z+Pls/zdLlWLjUok50wZPEWUTNNqsGB9uZ21OGc9j6Jezoe
	 +vTsAT4vZGuVJXqLZs9jpYoNV+Wuk/xU93iDx7dnVsrfrMQxNAqGE+rJ2inaxFKBg+
	 2HVj5QgUEf73pIGWZ4S4/qctaiHtm/G4etp7WXsYJ90Uzu+N3WkIdiJ0YpSjW5LmJ7
	 rARGsR//9B+hQ==
Received: from [100.113.4.179] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id BB/62-07695-83B40F06; Thu, 15 Jul 2021 14:50:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MRqmvh/SH
  BYMIhZouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPd8YSCd4IVja8WsjUwXuPvYuTiEBLYxiSx
  7tg9FgjnJKPE2sMHmbsYOTnYBNQkpt+6wQpiiwjoSyydvQcsziygIvHidw87iC0sYCtxZMpfJ
  hCbRUBV4u+bPWwgNq+Ak8Sd5WfB6iUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXkDVKErMvtwMFO
  cAsislbjxOncDIOwtJxywkHQsYmVYxWiYVZaZnlOQmZuboGhoY6BoaGuua6hqaGuslVukm6aW
  W6ian5pUUJQJl9RLLi/WKK3OTc1L08lJLNjECwyulkHXmDsZPrz/oHWKU5GBSEuXd1Po+QYgv
  KT+lMiOxOCO+qDQntfgQowwHh5IEL4PnhwQhwaLU9NSKtMwcYKjDpCU4eJREeP3tgNK8xQWJu
  cWZ6RCpU4y6HC+uLl7ELMSSl5+XKiXOKwYyQwCkKKM0D24ELO4uMcpKCfMyMjAwCPEUpBblZp
  agyr9iFOdgVBLmdQOZwpOZVwK36RXQEUxAR2iveQtyREkiQkqqgaku8nyHXe0t6zU6FsyTvO4
  yu8h4TLabfqP1G+OD2OCLrKLOc05OjwtfJ8D79ta+zZc8dcz6Qr6mux9l8038ddZxmelxZ6b7
  t0JnRYmXLFpy086n++/HdD2L1+sES/fZivP57P0jpRlyS6Lss2/7DcGphXW/X9ZwtIptNC6ql
  576W8/4kHdeeP0SDd3+zezmN9s3eeUtbNwleGnrbJkjG6/vPzpxYS7/zsNPKs6e97jntVaMx9
  HA//WDSO+Xnx8aCLBxHjxgGaWS4dRouvChdXHSZal7pRtXJL49Oavsh+LyTpZf3Vu+6/1UmGL
  AoOB2fH7+jIqgAxcMgv4s5Sr5fMuu9of/I+s7HaZc3apiJ5RYijMSDbWYi4oTAaEMA2g2AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-248.messagelabs.com!1626360631!50734!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23669 invoked from network); 15 Jul 2021 14:50:31 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-2.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jul 2021 14:50:31 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16FEoOtw014590
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 15:50:31 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 15 Jul 2021 15:50:22 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] icewm: upgrade 2.3.4 -> 2.6.0
Date: Thu, 15 Jul 2021 22:50:09 +0800
Message-ID: <1626360609-26207-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Changelog:
Keep track of changes to modal flag.
Optimize raising of modal windows.
Fix a memory leak for dynamic menu's.
Free start menu and windowlist menu on exit.
Fix for browse menu's for root and home in start menu.
Eliminate several memory leaks in icon handling.
Use absolute paths for the Exec definition in desktop files.
Only do a passive grab on buttons which are defined by the ButtonRaiseMask.
Guard against buffer overflow when copying the degrees centigrade symbol.
When a focused window can't raise, or there is no overlapping window,
then there shouldn't be a passive button grab by icewm, in order to
improve menu handling in applications which don't use windows for menu's.
Release the passive button grab from a focused window,
when a button click wouldn't raise it, for improved menu
handling for applications with internal menu's (CSS drawing).
These fix the Debian Bug report with number #989764:
"icewm: Intermittently unable to select menu items in drop-down menus.",
which was reported versus IceWM version 2.1.2 on June 12 on:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989764.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/icewm/{icewm_2.3.4.bb => icewm_2.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/icewm/{icewm_2.3.4.bb => icewm_2.6.0.bb} (94%)

diff --git a/meta-oe/recipes-extended/icewm/icewm_2.3.4.bb b/meta-oe/recipes-extended/icewm/icewm_2.6.0.bb
similarity index 94%
rename from meta-oe/recipes-extended/icewm/icewm_2.3.4.bb
rename to meta-oe/recipes-extended/icewm/icewm_2.6.0.bb
index f80611356f..90c0d244f2 100644
--- a/meta-oe/recipes-extended/icewm/icewm_2.3.4.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "1368f7db61589b1309274a2fe7250961e21904a294b1cff2c13273abd73725f4"
+SRC_URI[sha256sum] = "33cc69ba1fb762d85cc2755a930d6cf1a7c23e33f736ef2ec01c59d612f9b2eb"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
-- 
2.25.1

