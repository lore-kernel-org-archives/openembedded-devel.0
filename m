Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88DFC61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 06:39:29 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.7772.1676702360513537646
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Feb 2023 22:39:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h3fV5yqg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676702358; i=@fujitsu.com;
	bh=KBwHbrXMNh+Pz7oV/3IluQZyzu5/P0zTUWsEWFWkY5o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=h3fV5yqgWUwKF7u78iuUQWFhVMEw05XLU6yMW6HjG+juNQtRz/ZIrviwpXYNAJAxv
	 qungIgsDbe7t++GCtMRdDRKve7B92NLoMOEe61o1oAJOkJhLeIzJ6AkdI+2pT4W86a
	 H8G+I3FCm1DxMWSFkxSNeEA1QIP6uQVAlDlyafDLV9a9dFUcYRa4FfDzJ6SEZ8PEZW
	 wRNfZ4+GqL3aQ7FV3E25mEqrzPu+zzzmabjyslX+b43dd6d7juCMcysxYThln5qlv9
	 4KcSNXCVUsEt/nmXxarzt7SEb3XkujZy6Jux4mMjBkJtTozNvBD5aurk4sqi58Cc8u
	 Se3TBGJ+AKNSA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8ORpDul6EO
  ywcd3VhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ac1+vYCu7IV5x59IO1gfGvdBcjF4eQwENG
  idaGSewQzhUmiY2HLzJCOHsZJQ5MvMLaxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAg8Txa2tYQGwWAVWJgwdfMYLYvAJOEp2vFoPZEgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJVo//IKy1SSuntvEPIGRfxaS9llI2hcwMq1iNCtOLSpLLdI110sqykz
  PKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAzHlOJUzh2MK/v+
  6h1ilORgUhLl/bztfbIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd6fBR+ShQSLUtNTK9Iyc4CxA
  ZOW4OBREuE9nQ6U5i0uSMwtzkyHSJ1i1OXYtK/rALMQS15+XqqUOC9DKlCRAEhRRmke3AhYnF
  5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMy7FOQSnsy8ErhNr4COYAI6YgHzW5AjShIRUlI
  NTJH6Kwo9Nm+PU+j/9vJQ7zyujTO+fHNM5Pn7sdfm1oe8izMXnglZa3H23uWIDblmkTF5kd3i
  Tzl7nYTYPp3+tV6+Mif26VH2UpctvDarHsQfU2Ss7bjCLnnsZmeTvQ2ztOI1IdHw5fmrmuXVN
  Y0/ZSyaKf9q8m53o/V+avuyd1a/vclQdGkfk+GRuhO1Z2TFvLS1bt4PW2Hb6MXx+rzs1j7eRx
  x9wr5POqKuLQ3gEH76NGPhIfW88DsSe5gnX863X3p4U93ZO6GX3mVd37rD2C91yarC51+P/F/
  nGMuz0OJQ6arG53uMNzzTEDtePD1HV191CmeMoaP+qYPpDtYTff6JcmxY7/Y3k1V9w9/gZCWW
  4oxEQy3mouJEACKi+2ZOAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1676702356!53978!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19715 invoked from network); 18 Feb 2023 06:39:16 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 06:39:16 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 5F17C1AF
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:16 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 538A97B
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:16 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 06:39:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] jack: upgrade 1.19.21 -> 1.19.22
Date: Sat, 18 Feb 2023 14:38:59 +0800
Message-ID: <1676702342-30766-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 06:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101134

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch
removed since it's included in 1.19.22.

Changelog:
==========
The waf autooption --example-tools has been removed.
The example clients and tools are no longer part of the jack2 project.
Drop dependencies that were only used for example clients and tools (readline, sndfile and zita libs)
Fix build with python3.11+
Fix compatibility with macOS 12+
Fix ringbuffer thread safety on ARM

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...U-mode-bit-for-opening-files-in-pyth.patch | 52 -------------------
 .../jack/{jack_1.19.21.bb => jack_1.19.22.bb} |  6 +--
 2 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch
 rename meta-oe/recipes-multimedia/jack/{jack_1.19.21.bb => jack_1.19.22.bb} (92%)

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch b/meta-oe/recipes-multimedia/jack/jack/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch
deleted file mode 100644
index d3b203111..000000000
--- a/meta-oe/recipes-multimedia/jack/jack/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 415d50fc56b82963e5570c7738c61b22f4a83748 Mon Sep 17 00:00:00 2001
-From: Daan De Meyer <daan.j.demeyer@gmail.com>
-Date: Mon, 11 Jul 2022 00:56:28 +0200
-Subject: [PATCH] Remove usage of 'U' mode bit for opening files in python
-
-The 'U' mode bit is removed in python 3.11. It has been
-deprecated for a long time. The 'U' mode bit has no effect
-so this change doesn't change any behavior.
-
-See https://docs.python.org/3.11/whatsnew/3.11.html#changes-in-the-python-api
-
-Upstream-Status: Submitted [https://github.com/jackaudio/jack2/pull/884]
----
- waflib/ConfigSet.py | 2 +-
- waflib/Context.py   | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/waflib/ConfigSet.py b/waflib/ConfigSet.py
-index b300bb56..84736c9c 100644
---- a/waflib/ConfigSet.py
-+++ b/waflib/ConfigSet.py
-@@ -312,7 +312,7 @@ class ConfigSet(object):
- 		:type filename: string
- 		"""
- 		tbl = self.table
--		code = Utils.readf(filename, m='rU')
-+		code = Utils.readf(filename, m='r')
- 		for m in re_imp.finditer(code):
- 			g = m.group
- 			tbl[g(2)] = eval(g(3))
-diff --git a/waflib/Context.py b/waflib/Context.py
-index 9fee3fa1..761b521f 100644
---- a/waflib/Context.py
-+++ b/waflib/Context.py
-@@ -266,7 +266,7 @@ class Context(ctx):
- 				cache[node] = True
- 				self.pre_recurse(node)
- 				try:
--					function_code = node.read('rU', encoding)
-+					function_code = node.read('r', encoding)
- 					exec(compile(function_code, node.abspath(), 'exec'), self.exec_dict)
- 				finally:
- 					self.post_recurse(node)
-@@ -662,7 +662,7 @@ def load_module(path, encoding=None):
- 
- 	module = imp.new_module(WSCRIPT_FILE)
- 	try:
--		code = Utils.readf(path, m='rU', encoding=encoding)
-+		code = Utils.readf(path, m='r', encoding=encoding)
- 	except EnvironmentError:
- 		raise Errors.WafError('Could not read the file %r' % path)
- 
diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.21.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
similarity index 92%
rename from meta-oe/recipes-multimedia/jack/jack_1.19.21.bb
rename to meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
index 808b8259f..b85b7993d 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.21.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.22.bb
@@ -14,10 +14,8 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git;branch=master;protocol=https \
-    file://0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch \
-"
-SRCREV = "6b3c96d8aeef8aeb4b20f3aa647e6d01b4000ff8"
+SRC_URI = "git://github.com/jackaudio/jack2.git;branch=master;protocol=https"
+SRCREV = "4f58969432339a250ce87fe855fb962c67d00ddb"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


