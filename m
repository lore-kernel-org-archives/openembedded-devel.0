Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAB1C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 08:33:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.5663.1676536429621417802
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 00:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ytcTiH5C;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676536427; i=@fujitsu.com;
	bh=ak9gP7c0gO06D2Pk23Q3RkxQOyPnZ1raQzr6mLFaew0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ytcTiH5CZ9wK2EYfR8DkbnUNWp1xF6rhsm48ooB/eWkq3463GkUdwXxLUXYhVB0yh
	 qRtZKkgGIOa5O5YNwO+XMIbZw3+k3qmgwA8PD1BNL3GrwxexLmmJnv2xt5towAhrCD
	 Dyc0iySIpfGKcQT8NU6QbctwK24lbtQ0DSEwQhOIhhhHvRKZSR0duk0JcRiK8nGVz5
	 T0IMx0TP3bwyzJuyhBBmNSwZvDtDYIde6zCdNnXOouBucRsFw62xV77M64gzFQu3xo
	 iEWxkFXot7LGmOlBgtwAp+IFz+rqfzckM3XkpUchLh2kaPG9zZL0kz17yIMcgJSOwL
	 LyeAfPgYU7JoQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWTf71dt
  kgx2/BS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz9966yFjRJVGzc94+tgfGSSBcjF4eQwENG
  ieYlJ9kgnKtMEhe332CEcPYySsybMp+li5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBG4mFX1aAxVkEVCUedGxnBbF5BZwkjs5YD1YjIaAgMeXhe7AaTgFniW0bVgDN5wBa5i
  Qx/U00RLmgxMmZT1ggxktIHHzxghmiVVFi9uVmFgi7UqL1wy8oW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRrPi1KKy1CJdI72kosz0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OSc
  FL281JJNjMDgTSlO/rSDcV3vX71DjJIcTEqivMW6b5OF+JLyUyozEosz4otKc1KLDzHKcHAoS
  fBueAaUEyxKTU+tSMvMAUYSTFqCg0dJhFfwClCat7ggMbc4Mx0idYpRUUqcd+kLoIQASCKjNA
  +uDRa9lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ80aDTOHJzCuBm/4KaDET0OIFzGCLSxI
  RUlINTH5nVz1SWXVHzsj9zHXD8idJzxZ9lpy2RHDx1/PTV195++nWqbYfARYlFiUPVgVrJtyz
  2HZaJLNiY9mTI1XzQu7nLPm9++DyBXnrJza/n6G78uhH9xOrNIROr3kVwPfNre/iqUvhC9YLp
  P/YH52jG/LTgGfhU3ZJscm+npOPe7K3nLXc9KAtp4VbKuPjFdVTrvNro95XPizeJvMv6+ts+e
  /Ps/8pRu1eHsTBduQ0t7akxaSDE/s6MvweFaWrv9WpnhHuffdLwTwrxw0zE/f/bVK/riUcvHn
  yrgo+432v37xIuH/TYG3jV+1Z4pPcp807sHTr6Xksv+crvLR54b0xtPyqncJTD9YkrpOhXT59
  ztseKbEUZyQaajEXFScCAGJkwYdZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-728.messagelabs.com!1676536426!1050890!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25497 invoked from network); 16 Feb 2023 08:33:47 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-24.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Feb 2023 08:33:47 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A386A153
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:46 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 97537151
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 16 Feb 2023 08:33:44 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] htop: upgrade 3.2.1 -> 3.2.2
Date: Thu, 16 Feb 2023 16:33:23 +0800
Message-ID: <1676536403-14449-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676536403-14449-1-git-send-email-wangmy@fujitsu.com>
References: <1676536403-14449-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 08:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101094

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* CPUMeter now can show frequency in text mode
* Add option to render distribution path prefixes shadowed
* DiskIOMeter converts to bytes per second (not per interval)
* DiskIOMeter uses complete units, including missing "iB/s"
* DiskIOMeter indicates read and write in meter mode
* NetworkIOMeter converts to packets per second, shows packet rate
* Allow continued process following when changing display settings
* Update the panel header when changing to another tab
* Drop margin around the header if there are no meters
* Use Unicode replacement character for non-printable characters
* Default color preset uses bold blue for better visibility
* Update the Panel header on sort order inversions ('I')
* Toggle the header meters with pound key
* Fix ScreenPanel to handle quitting the panel while renaming
* Add fallback for HOME environment variable using passwd database
* Replace meaningless ID column with FD column in lock screen
* Use device format in the lock screen matching the files screen
* On Linux, improvements to file-descriptor lock detection
* On Linux, further distinguish systemd states in the SystemdMeter
* On Linux, improvements to cgroup and container identification
* On Linux, support openat(2) without readlinkat(2) platforms
* On Darwin, fix current process buffer handling for busy systems
* On DragonFly BSD, fix incorrect processor time of processes
* On FreeBSD, fix an issue with the memory graph not showing correctly
* On FreeBSD, add support for displaying shared memory usage
* On PCP, use pmLookupDescs(3) if available for efficiency
* On PCP, normalize generic columns values for consistent display
* On PCP, changes preparing for configurable, dynamic screens
* Handle invalid process columns from the configuration file
* Avoid undefined behaviour with deeply nested processes
* Fix crash when removing the currently active screen
* Prevent possible crash on a very early error path
* Include automake for Debian/Ubuntu
* Restore non-mouse support
* Reject unsupported command line arguments
* Document idle process state
* Clarify M_TRS/M_DRS columns

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/htop/{htop_3.2.1.bb => htop_3.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/htop/{htop_3.2.1.bb => htop_3.2.2.bb} (96%)

diff --git a/meta-oe/recipes-support/htop/htop_3.2.1.bb b/meta-oe/recipes-support/htop/htop_3.2.2.bb
similarity index 96%
rename from meta-oe/recipes-support/htop/htop_3.2.1.bb
rename to meta-oe/recipes-support/htop/htop_3.2.2.bb
index 233a1eeb5..68d4a3f8f 100644
--- a/meta-oe/recipes-support/htop/htop_3.2.1.bb
+++ b/meta-oe/recipes-support/htop/htop_3.2.2.bb
@@ -9,7 +9,7 @@ DEPENDS = "ncurses"
 SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https \
            file://0001-Use-pkg-config.patch \
 "
-SRCREV = "4e6ec4a0873c56ca9de63eadf730c5bd677bd8da"
+SRCREV = "55c10eccd71b6b016a50237bc8c8508b7bf66783"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


