Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641F5CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 21:32:03 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.1564.1726608714538285399
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 14:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=O5o/bni0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20240917213151105e2611df7b6799d8-crkd5t@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20240917213151105e2611df7b6799d8
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 17 Sep 2024 23:31:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=49VRG4bURUKvo4H6d/eR26nhVFVgYhYITP01y6H3hTo=;
 b=O5o/bni01Yaj/lywfeMUWeYWRNWt2OviJSHnK0YB9XODmo3LRnzoxPgTW9FmT4h37gAikk
 v2dTHhCrNDyv56P7Q+phNiO2tC0SvwI9kaXVH2/uH97nwxtus/I6vezFBz2o/FFv/R/wgPf5
 LPfP7nXY/AE82ACbzyUyghn/v4KC6lS22PLtpZ6r6wip89uu880iDq5NFIB5BZIX3A9mhHib
 oAFjzXlF8mj33uHryTQBNxa0dPicnBBaBcawzTLCmqYTo5aTSo+Ae1GvMff2tKBTOWBr6Rrl
 dGJXpvjni6ti4ENbiUd9XvLjJt+XRB8YWtCRU8Yrww4GG8moH+YVlyow==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/3] python3: skip readline limited history tests
Date: Tue, 17 Sep 2024 23:30:43 +0200
Message-Id: <20240917213044.627091-2-peter.marko@siemens.com>
In-Reply-To: <20240917213044.627091-1-peter.marko@siemens.com>
References: <20240917213044.627091-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 21:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112350

From: Trevor Gamblin <tgamblin@baylibre.com>

Python 3.12.5 is failing a newer ptest for reading/writing limited
history when editline (default) is set in PACKAGECONFIG. Skip it for now
until a proper fix (if any) is determined.

A bug has been opened upstream: https://github.com/python/cpython/issues/123018

(From OE-Core rev: de569ddffd5ea36b70c56df21dec9c892e5dee7d)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...t_readline-skip-limited-history-test.patch | 41 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.5.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
new file mode 100644
index 0000000000..50a4609f7a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
@@ -0,0 +1,41 @@
+From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Tue, 13 Aug 2024 11:07:05 -0400
+Subject: [PATCH] test_readline: skip limited history test
+
+This test was added recently and is failing on the ptest image when
+using the default PACKAGECONFIG settings (i.e. with editline instead of
+readline).. Disable it until the proper fix is determined.
+
+A bug has been opened upstream: https://github.com/python/cpython/issues/123018
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_readline.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
+index 91fd7dd13f9..d81f9bf8eed 100644
+--- a/Lib/test/test_readline.py
++++ b/Lib/test/test_readline.py
+@@ -132,6 +132,7 @@ def test_nonascii_history(self):
+         self.assertEqual(readline.get_history_item(1), "entrée 1")
+         self.assertEqual(readline.get_history_item(2), "entrée 22")
+ 
++    @unittest.skip("Skipping problematic test")
+     def test_write_read_limited_history(self):
+         previous_length = readline.get_history_length()
+         self.addCleanup(readline.set_history_length, previous_length)
+@@ -349,6 +350,7 @@ def test_history_size(self):
+             self.assertEqual(len(lines), history_size)
+             self.assertEqual(lines[-1].strip(), b"last input")
+ 
++    @unittest.skip("Skipping problematic test")
+     def test_write_read_limited_history(self):
+         previous_length = readline.get_history_length()
+         self.addCleanup(readline.set_history_length, previous_length)
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/python/python3_3.12.5.bb b/meta/recipes-devtools/python/python3_3.12.5.bb
index 5c3b7a92f8..92109d58ce 100644
--- a/meta/recipes-devtools/python/python3_3.12.5.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
 	   file://0001-test_deadlock-skip-problematic-test.patch \
 	   file://0001-test_active_children-skip-problematic-test.patch \
+           file://0001-test_readline-skip-limited-history-test.patch \
            file://CVE-2024-7592.patch \
            file://CVE-2024-8088.patch \
            "
-- 
2.30.2


