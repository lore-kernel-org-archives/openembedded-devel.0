Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC7AE7FDE4
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:32:20 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2068.1770067936846494848
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=JYaucuHF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260202213213fb57d791c000020766-d01oqp@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260202213213fb57d791c000020766
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 02 Feb 2026 22:32:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RS8eJ9aA1IVWByDxrznjsuJw5cqTNBGZLFwdujBE4+c=;
 b=JYaucuHFoqYNVZXXW+nC1b06Un0l9fHI72i1cvAkhP9O5Gwh3Ufv5bGMnNqqXWIQxJ45QD
 hlwe7XDnt6qmG/1oGsOB0XY+eOwwY9bjkh5cTI/O92rXzFyQiKJjMxxLqCr1NZn2A6Db2dvz
 zM5JrenFvqJXRXTsu0azjVxI6G+YG+YGvAaxe8oDUGZQ299vIUdzC86Hxee1fTYR2eD+fTz1
 Ksognn9fOfGvsrLH+mn4c9AeyVS+oP49vSIHaZbRzO0kgipcilta9DZQH+hz+3TH2vQqHrPC
 4/3KyK65ArOYpbndFFzwULuyVPeqd9RK6hHy7oeaIawWyDv7Cio++ZYA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][kirkstone][PATCH] python3-protobuf: patch CVE-2026-0994
Date: Mon,  2 Feb 2026 22:32:06 +0100
Message-Id: <20260202213206.2116704-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124089

From: Peter Marko <peter.marko@siemens.com>

Pick patch from PR in NVD report.
It is the only code change in 33.5 release.
Skip the test file change as it's not shipped in python module sources.
Resolve formatting-only conflict.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python3-protobuf/CVE-2026-0994.patch      | 47 +++++++++++++++++++
 .../python/python3-protobuf_3.20.3.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-protobuf/CVE-2026-0994.patch

diff --git a/meta-python/recipes-devtools/python/python3-protobuf/CVE-2026-0994.patch b/meta-python/recipes-devtools/python/python3-protobuf/CVE-2026-0994.patch
new file mode 100644
index 0000000000..156be3be29
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-protobuf/CVE-2026-0994.patch
@@ -0,0 +1,47 @@
+From c4eda3e58680528147a4cc7e2b3c9044f795c9c9 Mon Sep 17 00:00:00 2001
+From: zhangskz <sandyzhang@google.com>
+Date: Thu, 29 Jan 2026 14:31:08 -0500
+Subject: [PATCH] Fix Any recursion depth bypass in Python
+ json_format.ParseDict (#25239) (#25586)
+
+This fixes a security vulnerability where nested google.protobuf.Any messages could bypass the max_recursion_depth limit, potentially leading to denial of service via stack overflow.
+
+The root cause was that _ConvertAnyMessage() was calling itself recursively via methodcaller() for nested well-known types, bypassing the recursion depth tracking in ConvertMessage().
+
+The fix routes well-known type parsing through ConvertMessage() to ensure proper recursion depth accounting for all message types including nested Any.
+
+Fixes #25070
+
+Closes #25239
+
+COPYBARA_INTEGRATE_REVIEW=https://github.com/protocolbuffers/protobuf/pull/25239 from aviralgarg05:fix-any-recursion-depth-bypass 3cbbcbea142593d3afd2ceba2db14b05660f62f4
+PiperOrigin-RevId: 862740421
+
+Co-authored-by: Aviral Garg <gargaviral99@gmail.com>
+
+CVE: CVE-2026-0994
+Upstream-Status: Backport [https://github.com/protocolbuffers/protobuf/commit/c4eda3e58680528147a4cc7e2b3c9044f795c9c9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ google/protobuf/json_format.py | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/google/protobuf/json_format.py b/google/protobuf/json_format.py
+index 1b6ce9d03..9acbaefb5 100644
+--- a/google/protobuf/json_format.py
++++ b/google/protobuf/json_format.py
+@@ -652,9 +652,11 @@ class _Parser(object):
+       self._ConvertWrapperMessage(value['value'], sub_message,
+                                   '{0}.value'.format(path))
+     elif full_name in _WKTJSONMETHODS:
+-      methodcaller(_WKTJSONMETHODS[full_name][1], value['value'], sub_message,
+-                   '{0}.value'.format(path))(
+-                       self)
++      # For well-known types (including nested Any), use ConvertMessage
++      # to ensure recursion depth is properly tracked
++      self.ConvertMessage(
++          value['value'], sub_message, '{0}.value'.format(path)
++      )
+     else:
+       del value['@type']
+       self._ConvertFieldValuePair(value, sub_message, path)
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
index b3846ddeb3..dbb30ad4df 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.20.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 inherit pypi setuptools3
 
 SRC_URI += "file://CVE-2025-4565.patch"
+SRC_URI += "file://CVE-2026-0994.patch"
 
 SRC_URI[sha256sum] = "2e3427429c9cffebf259491be0af70189607f365c2f41c7c3764af6f337105f2"
 

