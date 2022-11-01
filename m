Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E9DFA3740
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 01:59:57 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web11.1606.1667267991572621469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 18:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WvH7wxe2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667267989; i=@fujitsu.com;
	bh=EshThV1jICSny8rrktkLC2sHPsxnJISLufjWAqSoh6c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WvH7wxe2e5YGy8Rt/51YEFHKs88XKMGIfzso4qEEiey5yFgjgtnFREf1HxH7Mnl5W
	 MkmHmkDy16+GF+Z87bN3EY3XUcGu5nEDMUEdeH9/BTFdZbBmYCwTERySPpgwOQ+ce+
	 pVD+oUVSodVQvbLuE6xZO38gdFnSLFzcCP8lfiHzE+NEbolAxSbEULF5oisyrUDn5n
	 GwL0nOlwWMfTBddAfUGMdKe9htN/vR+bXEuTrBfYSjvdB+CvxfaJmf8jlLO3/5RqYA
	 F1VBcdHyudHuaVrz3vU9x4nOZavnmx/Lu3QvjRMummys2QeYm8DGQANxhNeT+lEmEV
	 4bOylGMOL6WFw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWXdKbUK
  ywcONGhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aDtjVMBV8NK9Yeus/ewHhEp4uRi0NI4CGj
  ROe7F2wQzmUmiQd/djFBOHsYJU4u6QdyODnYBDQkdk+9zAxiiwjoSyydvQfMZhZQkzj68ieYL
  SzgLHFx4z2wehYBFYmdnx8ygti8Ai4SNxoeg8UlBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL14wQ9
  QoSby9tIcRwq6QmDWrDapXTeLquU3MExj5ZyFpn4WkfQEj0ypG0+LUorLUIl0LvaSizPSMktz
  EzBy9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAYEwpZnLfwXh02R+9Q4yS
  HExKorz/JRKShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwymYC5QSLUtNTK9Iyc4CRAZOW4OBRE
  uH9VQ2U5i0uSMwtzkyHSJ1i1OXo3N91gFmIJS8/L1VKnPcoSJEASFFGaR7cCFiUXmKUlRLmZW
  RgYBDiKUgtys0sQZV/xSjOwagkzMtRAzSFJzOvBG7TK6AjmICOYGuPAzmiJBEhJdXA5NB4q3v
  5WsY3Uz1Nlru/5d4j2S/kXmHKeXXn6c+XXtQpu57Plp8enPlEcvIck1uynObHDtx+m895/WOZ
  9g3+a9LVvzV2nHrzzXyPlPH1R1L3XzTec9Auq5Occvdo6lW576qWLurfvCb531KJvLlH9ujSv
  kSjCkmb5ZMVW01Wh8ZWneUsSedvqPjkFZPH9LnxTG3BzZYEJbWu34stdr5nUmLPDRF49HDjUt
  PU+b/mXDkT5NC7J/lBnNSf0BrjnVl+TnvvLdUPCdPnmeYw70u2uevye3y1Sw75ntd5ynV+zj3
  bfatzIz8v0TBT2bduFUdMdFVV4TTrvT56W4QZt9+v4Tp+QHuei777znRF2Z9aSizFGYmGWsxF
  xYkAt+cJ8k0DAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1667267988!874265!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12261 invoked from network); 1 Nov 2022 01:59:48 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 01:59:48 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 4D740151
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 01:59:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4082173
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 01:59:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 01:59:46 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [PATCH] samba: Fix install conflict with multilib enabled.
Date: Tue, 1 Nov 2022 09:59:34 +0800
Message-ID: <1667267974-3848-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 01:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99381

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...tiong-of-python-to-fix-the-install-confli.patch | 122 +++++++++++++++++++++
 .../recipes-connectivity/samba/samba_4.14.14.bb    |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-Deleted-settiong-of-python-to-fix-the-install-confli.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-Deleted-settiong-of-python-to-fix-the-install-confli.patch b/meta-networking/recipes-connectivity/samba/samba/0001-Deleted-settiong-of-python-to-fix-the-install-confli.patch
new file mode 100644
index 0000000..6e4cdf1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/0001-Deleted-settiong-of-python-to-fix-the-install-confli.patch
@@ -0,0 +1,122 @@
+From f8e1d71e702dfc6965ecb3109738b5d188af4267 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Sun, 30 Oct 2022 11:59:31 +0900
+Subject: [PATCH] Deleted settiong of python to fix the install conflict error
+ when enable multilib.
+
+  file /usr/bin/samba-tool conflicts between attempted installs of samba-4.14.14-r0.core2_64 and lib32-samba-4.14.14-r0.i686
+  file /usr/sbin/samba-gpupdate conflicts between attempted installs of samba-4.14.14-r0.core2_64 and lib32-samba-4.14.14-r0.i686
+  file /usr/sbin/samba_dnsupdate conflicts between attempted installs of samba-4.14.14-r0.core2_64 and lib32-samba-4.14.14-r0.i686
+  file /usr/sbin/samba_downgrade_db conflicts between attempted installs of samba-4.14.14-r0.core2_64 and lib32-samba-4.14.14-r0.i686
+  file /usr/sbin/samba_kcc conflicts between attempted installs of samba-4.14.14-r0.core2_64 and lib32-samba-4.14.14-r0.i686
+  file /usr/sbin/samba_spnupdate conflicts between attempted installs of samba-4.14.14-r0.core2_64 and lib32-samba-4.14.14-r0.i686
+  file /usr/sbin/samba_upgradedns conflicts between attempted installs of samba-4.14.14-r0.core2_64 and lib32-samba-4.14.14-r0.i686
+
+The conflict is because there is a  difference between of lib32-samba-* and samba-* as the following:
+64bit:
+sys.path.insert(0, "/usr/lib64/python3.10/site-packages")
+
+32bit:
+sys.path.insert(0, "/usr/lib/python3.10/site-packages")
+
+But this setting is for environment when running from source tree. There
+is no necessary on target.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ source4/scripting/bin/samba-gpupdate     | 1 -
+ source4/scripting/bin/samba-tool         | 1 -
+ source4/scripting/bin/samba_dnsupdate    | 1 -
+ source4/scripting/bin/samba_downgrade_db | 1 -
+ source4/scripting/bin/samba_kcc          | 1 -
+ source4/scripting/bin/samba_spnupdate    | 1 -
+ source4/scripting/bin/samba_upgradedns   | 1 -
+ 7 files changed, 7 deletions(-)
+
+diff --git a/source4/scripting/bin/samba-gpupdate b/source4/scripting/bin/samba-gpupdate
+index 85300e1..02f40cd 100755
+--- a/source4/scripting/bin/samba-gpupdate
++++ b/source4/scripting/bin/samba-gpupdate
+@@ -25,7 +25,6 @@ applied, have changed, or is in the right container'''
+ import os
+ import sys
+
+-sys.path.insert(0, "bin/python")
+
+ import optparse
+ from samba import getopt as options
+diff --git a/source4/scripting/bin/samba-tool b/source4/scripting/bin/samba-tool
+index f8a70a6..3c818de 100755
+--- a/source4/scripting/bin/samba-tool
++++ b/source4/scripting/bin/samba-tool
+@@ -22,7 +22,6 @@
+ import sys
+
+ # Find right direction when running from source tree
+-sys.path.insert(0, "bin/python")
+
+ # make sure the script dies immediately when hitting control-C,
+ # rather than raising KeyboardInterrupt. As we do all database
+diff --git a/source4/scripting/bin/samba_dnsupdate b/source4/scripting/bin/samba_dnsupdate
+index 518bb89..277f0ee 100755
+--- a/source4/scripting/bin/samba_dnsupdate
++++ b/source4/scripting/bin/samba_dnsupdate
+@@ -36,7 +36,6 @@ os.environ['PYTHONUNBUFFERED'] = '1'
+ os.environ["TZ"] = "GMT"
+
+ # Find right directory when running from source tree
+-sys.path.insert(0, "bin/python")
+
+ import samba
+ import optparse
+diff --git a/source4/scripting/bin/samba_downgrade_db b/source4/scripting/bin/samba_downgrade_db
+index 87a989b..93a7f8c 100755
+--- a/source4/scripting/bin/samba_downgrade_db
++++ b/source4/scripting/bin/samba_downgrade_db
+@@ -24,7 +24,6 @@ import optparse
+ import sys
+
+ # Find right directory when running from source tree
+-sys.path.insert(0, "bin/python")
+
+
+ import samba
+diff --git a/source4/scripting/bin/samba_kcc b/source4/scripting/bin/samba_kcc
+index 122a5ed..79165f3 100755
+--- a/source4/scripting/bin/samba_kcc
++++ b/source4/scripting/bin/samba_kcc
+@@ -37,7 +37,6 @@ os.environ['PYTHONUNBUFFERED'] = '1'
+ os.environ["TZ"] = "GMT"
+
+ # Find right directory when running from source tree
+-sys.path.insert(0, "bin/python")
+
+ import optparse
+ import time
+diff --git a/source4/scripting/bin/samba_spnupdate b/source4/scripting/bin/samba_spnupdate
+index 84ff771..b6fe041 100755
+--- a/source4/scripting/bin/samba_spnupdate
++++ b/source4/scripting/bin/samba_spnupdate
+@@ -32,7 +32,6 @@ os.environ['PYTHONUNBUFFERED'] = '1'
+ os.environ["TZ"] = "GMT"
+
+ # Find right directory when running from source tree
+-sys.path.insert(0, "bin/python")
+
+ import samba, ldb
+ import optparse
+diff --git a/source4/scripting/bin/samba_upgradedns b/source4/scripting/bin/samba_upgradedns
+index 308dbb0..d00244f 100755
+--- a/source4/scripting/bin/samba_upgradedns
++++ b/source4/scripting/bin/samba_upgradedns
+@@ -27,7 +27,6 @@ import grp
+ from base64 import b64encode
+ import shlex
+
+-sys.path.insert(0, "bin/python")
+
+ import ldb
+ import samba
+--
+2.25.1
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index f88dee6..9d7259e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -23,6 +23,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch \
            file://0001-waf-Fix-errors-with-Werror-implicit-function-declara.patch \
+           file://0001-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
            "
 
 SRC_URI:append:libc-musl = " \
-- 
1.8.3.1


