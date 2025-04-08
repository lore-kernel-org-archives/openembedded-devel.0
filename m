Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB03C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 11:45:19 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web10.73160.1744112705214393881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 04:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.53 with ESMTP; 8 Apr 2025 20:45:02 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.127 with ESMTP; 8 Apr 2025 20:45:02 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] enscript: fix error with gcc-15
Date: Tue,  8 Apr 2025 20:45:01 +0900
Message-Id: <20250408114501.2345068-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 11:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116707

From: "mark.yang" <mark.yang@lge.com>

* Imported the submitted patch from:
  https://savannah.gnu.org/bugs/?66845
  to fix:
  http://errors.yoctoproject.org/Errors/Details/851187/
  ../../enscript-1.6.6/compat/regex.c:3565:13: error: too many arguments to function 're_match_2_internal'; expected 0, have 8
 3565 |       val = re_match_2_internal (bufp, string1, size1, string2, size2,
      |             ^~~~~~~~~~~~~~~~~~~  ~~~~

* Modified the Upstream-Status since the same content as
  0001-getopt-Include-string.h-for-strcmp-stcncmp-functions.patch is already in the backport.
Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...ipt-does-not-build-with-C23-standard.patch | 32 +++++++++++++++++++
 ...tring.h-for-strcmp-stcncmp-functions.patch |  3 +-
 .../enscript/enscript_1.6.6.bb                |  1 +
 3 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/enscript/enscript/0001-enscript-does-not-build-with-C23-standard.patch

diff --git a/meta-oe/recipes-extended/enscript/enscript/0001-enscript-does-not-build-with-C23-standard.patch b/meta-oe/recipes-extended/enscript/enscript/0001-enscript-does-not-build-with-C23-standard.patch
new file mode 100644
index 0000000000..28f6764319
--- /dev/null
+++ b/meta-oe/recipes-extended/enscript/enscript/0001-enscript-does-not-build-with-C23-standard.patch
@@ -0,0 +1,32 @@
+From 9865262d7287320eba7d2fad2d4fcb12b489fc6c Mon Sep 17 00:00:00 2001
+From: zdohnal <email-is-unavailable>
+Date: Tue, 8 Apr 2025 20:25:47 +0900
+Subject: [PATCH] enscript does not build with C23 standard
+
+* Imported the submitted patch from:
+  https://savannah.gnu.org/bugs/?66845
+  to fix:
+  http://errors.yoctoproject.org/Errors/Details/851187/
+  ../../enscript-1.6.6/compat/regex.c:3565:13: error: too many arguments to function 're_match_2_internal'; expected 0, have 8
+ 3565 |       val = re_match_2_internal (bufp, string1, size1, string2, size2,
+      |             ^~~~~~~~~~~~~~~~~~~  ~~~~
+
+Upstream-Status: Submitted [https://savannah.gnu.org/bugs/?66845]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ compat/regex.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/compat/regex.c b/compat/regex.c
+index c6907f3..da28664 100644
+--- a/compat/regex.c
++++ b/compat/regex.c
+@@ -336,7 +336,7 @@ typedef char boolean;
+ #define false 0
+ #define true 1
+ 
+-static int re_match_2_internal ();
++static int re_match_2_internal (struct re_pattern_buffer*, const char*, int, const char*, int, int, struct re_registers*, int);
+ 
+ /* These are the command codes that appear in compiled regular
+    expressions.  Some opcodes are followed by argument bytes.  A
diff --git a/meta-oe/recipes-extended/enscript/enscript/0001-getopt-Include-string.h-for-strcmp-stcncmp-functions.patch b/meta-oe/recipes-extended/enscript/enscript/0001-getopt-Include-string.h-for-strcmp-stcncmp-functions.patch
index a080b3aef7..e84c2d3937 100644
--- a/meta-oe/recipes-extended/enscript/enscript/0001-getopt-Include-string.h-for-strcmp-stcncmp-functions.patch
+++ b/meta-oe/recipes-extended/enscript/enscript/0001-getopt-Include-string.h-for-strcmp-stcncmp-functions.patch
@@ -3,9 +3,10 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 2 Sep 2022 21:24:27 -0700
 Subject: [PATCH] getopt: Include string.h for strcmp/stcncmp functions
 
-Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [http://git.savannah.gnu.org/gitweb/?p=enscript.git;a=commit;h=300ecf85a8fe166a39f9dd818945c7b8a970db39]
+Signed-off-by: mark.yang <mark.yang@lge.com>
 ---
  compat/getopt.c | 1 +
  1 file changed, 1 insertion(+)
diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
index f6400213c0..4ca7c081ea 100644
--- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
+++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://enscript-autoconf.patch \
            file://0001-Fix-builds-with-recent-gettext.patch \
            file://0001-getopt-Include-string.h-for-strcmp-stcncmp-functions.patch \
+           file://0001-enscript-does-not-build-with-C23-standard.patch \
            "
 
 inherit autotools gettext

