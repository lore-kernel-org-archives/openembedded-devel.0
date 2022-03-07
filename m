Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34F1C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:47:06 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.25289.1646653626060214366
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Xv/sZg6n;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653624; i=@fujitsu.com;
	bh=4lKwRIFWIKMEQVrPmH+5exS4UQ1aZ4nSs1BJg2x6WXI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Xv/sZg6nZWU/GjFxkWc/ZZtOeirUtPVgZ8cFtRvtXdvNfA8JXOvirIDKCyMwfIkyQ
	 ly/+9kKJd82wGTiRgFqllMDX2DBUniTLNE2JmRWZ6ratJj8T8SIFSchzYNNv1ihfcR
	 NFalGnlZ7pKDzuoMrLJbDSInTxueXTJhRkWqbENNcczyzJD781iZcOOxdO4N+yLNvM
	 C7+zAATMO1A9Iqw1hWesEmH5jGR6dRnZ7hlvHRY4tXv+uBZBhCbvlBVeS+oPhH8FMT
	 rGSizCwaaokM00a2Ik7Fkf4XD7E+k6wCRlFHlVch8TiPJmGmpAIR9l+Ebk/xBaskAW
	 010wIPtnzQCcA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8ORqLvjg2q
  SwfNVLBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b5g7NZChbKV6xvmMnUwLhFuouRi0NI4Amj
  xPQFr5khnAtMEkem/meFcI4zSjTcO8zYxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAh8SWm7vB6lmA4qe+TAeL8wo4SWyduQQsLiGgIDHl4XuwXk4BZ4nb516C1QgB1ayf3c
  wKUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJg1q40JwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itE2qSgzPaMkNzEzR9fQwEDX0NBU18xC18hEL7FKN1EvtVQ3OTWvpCgRKKuXWF6sl1pcrFdc
  mZuck6KXl1qyiREYzCnFLhI7GG/2/dQ7xCjJwaQkypuyQDVJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgTvpzdAOcGi1PTUirTMHGBkwaQlOHiURHiPXwJK8xYXJOYWZ6ZDpE4xGnOsbTiwl5lj55
  bLe5mFWPLy81KlxHk5gTErJABSmlGaBzcIFvGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgn
  zSoNM4cnMK4Hb9wroFCagU6pslUBOKUlESEk1MGUwLVO48KJprriInemkh6xiEQ+Meh45if8P
  9NXQNuf2brPmEG4Pmroxqy2rver65WMvzhwMy2v6ZFWz0/TJdZapqz7ZnDq/rUDNjT+b8cXM4
  4GTPIQZDx1MW/Tt08ppx651hbpp3T6/dkZP+LKjtw3nZaTMlP8g+UsvceW9CtcrO7Rfe0/757
  vGw0aTv+3xxUXzFk6LVAjs+JZ2IPtHqMNjlf0zJ9oeZeq9NXuP36/jk77cmtl8/q60skCu7Bd
  BFkV+Jcv/t2LUuBRDNzCZP9Vi7Zx+rHHN07MOpz+yt5zWvPHefbuUL3PQiRXO7Y+cG3nLsu2U
  3zEk3nn31yeoJ+EO84qgDt7VG2O+2Rd+e6zEUpyRaKjFXFScCAANM/yVcwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-545.messagelabs.com!1646653623!23854!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2853 invoked from network); 7 Mar 2022 11:47:04 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:47:04 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 81A9F1001A4
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:47:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 759B9100186
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:47:03 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:46:57 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lxml: upgrade 4.7.1 -> 4.8.0
Date: Mon, 7 Mar 2022 19:46:41 +0800
Message-ID: <1646653602-55882-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646653602-55882-1-git-send-email-wangmy@fujitsu.com>
References: <1646653602-55882-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:47:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95837

0001-setupinfo.py-check-the-return-value.patch
removed since it's included in 4.8.0.

Changelog:
=========
Features added
--------------

* GH#337: Path-like objects are now supported throughout the API instead of just strings.
  Patch by Henning Janssen.

* The ''ElementMaker'' now supports ''QName'' values as tags, which always override
  the default namespace of the factory.

Bugs fixed
----------

* GH#338: In lxml.objectify, the XSI float annotation "nan" and "inf" were spelled in
  lower case, whereas XML Schema datatypes define them as "NaN" and "INF" respectively.
  Patch by Tobias Deiminger.

Other changes
-------------

* Built with Cython 0.29.28.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-setupinfo.py-check-the-return-value.patch | 46 -------------------
 ...n3-lxml_4.7.1.bb => python3-lxml_4.8.0.bb} |  6 +--
 2 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-check-the-return-value.patch
 rename meta-python/recipes-devtools/python/{python3-lxml_4.7.1.bb => python3-lxml_4.8.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-check-the-return-value.patch b/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-check-the-return-value.patch
deleted file mode 100644
index 7d9121846..000000000
--- a/meta-python/recipes-devtools/python/python3-lxml/0001-setupinfo.py-check-the-return-value.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 057872fa40e061100d61117cee5c3413ef2e40fc Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 20 Jan 2022 15:18:20 +0800
-Subject: [PATCH] setupinfo.py: check the return value
-
-Use the return value altogether to check the subprocess execute
-successfully or not as in some case it will print some noise
-message though run successfully as below.
-
- # python
- Python 3.8.10 (default, Nov 26 2021, 20:14:08)
- [GCC 9.3.0] on linux
- Type "help", "copyright", "credits" or "license" for more information.
- >>> import subprocess
- >>> cmd = "pkg-config --modversion libxml-2.0"
- >>> p = subprocess.Popen(cmd, shell=True,stdout=subprocess.PIPE, stderr=subprocess.PIPE)
- >>> stdout_data, errors = p.communicate()
- >>> print(stdout_data)
- b'2.9.12\n'
- >>> print(errors)
- b'do_ypcall: clnt_call: RPC: Unable to send; errno = Network is unreachable\n'
- >>>
-
-Upstream-Status: Submitted [https://github.com/lxml/lxml/pull/336]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- setupinfo.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setupinfo.py b/setupinfo.py
-index 8c2a36fb..c1247c6d 100644
---- a/setupinfo.py
-+++ b/setupinfo.py
-@@ -365,7 +365,7 @@ def run_command(cmd, *args):
-                          stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-     stdout_data, errors = p.communicate()
- 
--    if errors:
-+    if p.returncode != 0 and errors:
-         return ''
-     return decode_input(stdout_data).strip()
- 
--- 
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb b/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb
index f3b7e0c6c..c4d4df383 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb
@@ -18,11 +18,9 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "a1613838aa6b89af4ba10a0f3a972836128801ed008078f8c1244e65958f1b24"
+SRC_URI[sha256sum] = "f63f62fc60e6228a4ca9abae28228f35e1bd3ce675013d1dfb828688d50c6e23"
 
-SRC_URI += " \
-           file://0001-setupinfo.py-check-the-return-value.patch \
-"
+SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
 
 # {standard input}: Assembler messages:
-- 
2.25.1


