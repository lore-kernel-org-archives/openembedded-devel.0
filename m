Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f47.google.com (unknown [209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 190A065FC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 18:52:37 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lf10so7884591pab.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2014 11:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=q9F12x2dpw2tNDaYtAertp7sW8zDLC+aNLyJ8awlYNA=;
	b=OIeeVLhCrtUw7HBHdWsC5u+Y4Tm+uMFfERBLBJxHIagOi3+igX1xFr4pU/bgFuzJsg
	/3LJHEQdVC2ulIyEVdA8fM+Tvz7NaSv6L0j70uKPw9476H8w3eUr/KDRwD0FuYNPRvmI
	7vAoWBCNqnwEkwIcFUiw4ofQA7CVbEtZ4yWGj/oWy1P4ztWQyrSQNKMGHbRK+gPRrecQ
	C67XB0sQjWzWvKWoH7+9HmrzLyN0y/FnhgA7bFyGGGWg59s+Byi40WPj1PVO7/48JP4h
	O6UsyBmBVgPj2kQ3wd/SidxUuz6e1YVT+GQ3KBpBHvdYCp8GSSuFZWrQ8bOFuYeT1M5z
	RGhQ==
X-Received: by 10.68.135.42 with SMTP id pp10mr30423690pbb.58.1401130358672;
	Mon, 26 May 2014 11:52:38 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	bi15sm31240416pac.31.2014.05.26.11.52.37 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 May 2014 11:52:38 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 May 2014 11:52:31 -0700
Message-Id: <1401130351-14909-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] mbuffer: Update to version 20140310 from 20091227
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 May 2014 18:52:39 -0000

The previous version of mbuffer could not be built out-of-tree and
seems rather old [1].

[1] http://www.maier-komor.de/mbuffer.html

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 .../recipes-support/mbuffer/mbuffer_20091227.bb    | 21 --------------------
 .../recipes-support/mbuffer/mbuffer_20140310.bb    | 23 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 21 deletions(-)
 delete mode 100644 meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
 create mode 100644 meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb

diff --git a/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb b/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
deleted file mode 100644
index bd80c84..0000000
--- a/meta-oe/recipes-support/mbuffer/mbuffer_20091227.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "mbuffer is a tool for buffering data streams with a large set of unique features."
-HOMEPAGE = "http://www.maier-komor.de/mbuffer.html"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
-SECTION = "console/network"
-PR = "r1"
-
-SRC_URI = "http://www.maier-komor.de/software/mbuffer/mbuffer-20091227.tgz"
-SRC_URI[md5sum] = "191663396b4b1752d7104803631b9e54"
-SRC_URI[sha256sum] = "e708b66f6cec9ba090877e8eb38e5627ac69aea9ebd9bca1360a29c7398a88ce"
-
-inherit autotools
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[md5] = "--enable-md5,--disable-md5,openssl"
-
-do_configure() {
-    gnu-configize
-    oe_runconf
-}
-
diff --git a/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb b/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb
new file mode 100644
index 0000000..3467d28
--- /dev/null
+++ b/meta-oe/recipes-support/mbuffer/mbuffer_20140310.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "mbuffer is a tool for buffering data streams with a large set of unique features."
+HOMEPAGE = "http://www.maier-komor.de/mbuffer.html"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
+SECTION = "console/network"
+
+SRC_URI = " \
+    http://www.maier-komor.de/software/mbuffer/mbuffer-20140310.tgz \
+"
+
+SRC_URI[md5sum] = "9937d7f666c19a2e6b2499b04dbecc44"
+SRC_URI[sha256sum] = "ab90b6fdce16db2bf08bcda0bc5d2bfb053a9a163d2a24f95fbf246460549b99"
+
+inherit autotools
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[md5] = "--enable-md5,--disable-md5,openssl"
+
+do_configure() {
+    ( cd ${S}; gnu-configize )
+    oe_runconf
+}
+
-- 
1.8.3.2


