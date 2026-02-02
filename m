Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EA3E7FDE9
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 21:32:40 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2034.1770067955673956806
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 13:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=I9dAxLRo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026020221323373a084253d0002077b-s1yq44@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026020221323373a084253d0002077b
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 02 Feb 2026 22:32:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=X5VXULoA0tjVqYTcUEEN2nP4lX86XBbyyytGTP4qqpQ=;
 b=I9dAxLRok2R/UGgM1C+qiSNUa2ESF+RMz94qjjt81Vko52xI9NNAwLChTD2n364WaU+mD3
 hLqzRvkQkcDwEGkIo1Jzr36a9e1k3OFqtEojl1F2twTdKH2MCreKv+GDOUuk138ysGKEcMUR
 IfSNorKVmGrfK+oP1nNgjpZ6QgU+rPx9yVpdJeS0Vp9KJh4qx0DcIG7s6fFDRxmEWoNgEKHy
 nqTeK0QeS+m42WmMbc/3hye4jkigLF82tukkWw8ktULBNoHLBhVXpqqzt5I6ZRyLBVmCVJ/F
 EMrcTXluYNejFvGlHx2XpslN9uxAfaqnFEf6/DuyUVV4cpCsP0KD7BHQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][scarthgap][PATCH 1/2] python3-protobuf: patch CVE-2026-0994
Date: Mon,  2 Feb 2026 22:32:27 +0100
Message-Id: <20260202213228.2116741-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 21:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124090

From: Peter Marko <peter.marko@siemens.com>

Pick patch from PR in NVD report.
It is the only code change in 33.5 release.
Skip the test file change as it's not shipped in python module sources.
Resolve formatting-only conflict.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python3-protobuf/CVE-2026-0994.patch      | 47 +++++++++++++++++++
 .../python/python3-protobuf_4.25.8.bb         |  2 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-protobuf/CVE-2026-0994.patch

diff --git a/meta-python/recipes-devtools/python/python3-protobuf/CVE-2026-0994.patch b/meta-python/recipes-devtools/python/python3-protobuf/CVE-2026-0994.patch
new file mode 100644
index 0000000000..494a57ad63
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
+@@ -644,9 +644,11 @@ class _Parser(object):
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
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb
index aca30efdee..6ba24899f6 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.8.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 inherit pypi setuptools3
 SRC_URI[sha256sum] = "6135cf8affe1fc6f76cced2641e4ea8d3e59518d1f24ae41ba97bcad82d397cd"
 
+SRC_URI += "file://CVE-2026-0994.patch"
+
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
 CLEANBROKEN = "1"

