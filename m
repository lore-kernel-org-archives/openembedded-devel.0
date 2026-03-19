Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677A8108E1F8
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:47:47 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9087.1773920866781916833
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aUW2z0x3;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: skandigraun@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4648447e29bso357770b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 04:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773920866; x=1774525666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aH1Hy1QWN1SV68vx9Kj+PllcbdBxwGonay4FoNjy3B4=;
        b=aUW2z0x31kTt0hxkaLFvZPp2jaoPzgsM8+7cx7/rbQnE9nblAcEY4nKQd7+VLjprO+
         l2F384YBIo8hgNsbo3ZWbOgkG2YQr3b0YT360Qoc3GNvInzKNn5SBIa/oPSDZp/14ojQ
         6eRM2Se9vJ5bTJcv8bHnETfp2LjSMu7dPrChkb09ItDYe0o9tQ29EcubOdJJ0c3Yrnnm
         kng2yUpN3nl1CZ8D95qzfz5dgiN2J4UNoZpNnowhV9Cmfo3eOixYeIZrmLf9tN0fyn1R
         q7rGElSumCREGA/YlcaA8qQA1TdYGwfv2LKObxQUeuv/wQjxoHNpIvqZpOnC+ofWrBmj
         YLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920866; x=1774525666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aH1Hy1QWN1SV68vx9Kj+PllcbdBxwGonay4FoNjy3B4=;
        b=eDaCO2FgfOF2lzV2bo1WCBzZhH/ca2XIqm3hYvHqewJNhrZ4Csl/W1dnJDwFnLfBCV
         4xYqKxZJIcQh3+1XYyOXug7wrQ0Amphe6tgX4alR7f8+n1gYgf9OxvXbUr07UUTEphxo
         LNAvWrS3GMRu5VY2Qjj5uhTe3eKOc0tvc0JrxPAjPphjh6n9ekajbeUFE8ogk/5qd78U
         HvPV/q0U45Dy1qz8chZ0ocMOAzzQLq8aNWFeEa8vAa2WU37OL7Y7Cs/JUFE6OoN4t+D1
         YGnoL9LlmVS7U3243HtAixuJyBttCTlM5HewvT7ustGdFMOZwb/WCWnQYrU/hHJ4p+Zx
         vvGg==
X-Gm-Message-State: AOJu0Yyl9xnIuBe1yzZmZgfqvR+ERedCW4lbmcjXzcqVGAOOvivTU9Z7
	lzQs5AKTjOPSFVVxEv3j6Ab5yegCOk6vB+NoEPpXCWungvwzwik21qyC0NICQw==
X-Gm-Gg: ATEYQzzGAnKg8NOs6/HvMmzaLegByjNeEQUYLFix/UwrfrDthJWDOlFwzzu//6CE+/T
	m9p5/sklr8t+FwtMw03WKvternbcMerA6mJDkybPckPI4LDKOMx4Cm8o7t38fJkXBV5u0+3GlDO
	dwVU9h6qcpUy0EUB0tOfOCfua2FdJtWZ3/y34Kyi9eewZu74+BxIDvza4xSbtaBMpU4XSjwCwl0
	CyFt/AOzZcmPZygZUEqhEQTJPGZFMCn8R1qUd2AJH2d4xMl6gJzsskNkBaMV7LN0rB0OOIuvHNq
	suK2L3qVg5Z6AxTS49F1hkXScFoaGYDeaplTW9G4E9tbsZIJTpMWTnEBfZfllmJSQJWK71FL7UB
	bBgaVwgP+i8ddwnD43xFpeafNWC7XzTrE1TCAKWxfs1GvQPLgHFBGx1Alc6NrIVGUOdbXPxsKr+
	2s/liSEvIeIyihCPNazqsB
X-Received: by 2002:a05:6808:2386:b0:467:a44:dde2 with SMTP id 5614622812f47-467ba43955bmr4218236b6e.56.1773920865837;
        Thu, 19 Mar 2026 04:47:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41bd2828aa7sm5929707fac.1.2026.03.19.04.47.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:47:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] open-vm-tools: backport patch to build with glibc 2.43
Date: Thu, 19 Mar 2026 12:47:42 +0100
Message-ID: <20260319114742.4066574-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 11:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125397

As the subject says.

Fixes error:
| ../../../sources/open-vm-tools-13.0.10/open-vm-tools/lib/hgfs/hgfsEscape.c: In function 'HgfsAddEscapeCharacter':
| ../../../sources/open-vm-tools-13.0.10/open-vm-tools/lib/hgfs/hgfsEscape.c:201:15: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
|   201 |       illegal = strchr(HGFS_ILLEGAL_CHARS, bufIn[escapeContext->processedOffset]);

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...on-discards-const-qualifier-from-poi.patch | 144 ++++++++++++++++++
 .../open-vm-tools/open-vm-tools_13.0.10.bb    |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-fix-initialization-discards-const-qualifier-from-poi.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-fix-initialization-discards-const-qualifier-from-poi.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-fix-initialization-discards-const-qualifier-from-poi.patch
new file mode 100644
index 0000000000..c06a88f27e
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-fix-initialization-discards-const-qualifier-from-poi.patch
@@ -0,0 +1,144 @@
+From 070500fd0e97abb07585882ae448ac35b1c4396c Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Mon, 26 Jan 2026 11:55:03 +0000
+Subject: [PATCH] fix initialization discards 'const' qualifier from pointer
+ target type
+
+Since glibc-2.43:
+
+For ISO C23, the functions bsearch, memchr, strchr, strpbrk, strrchr,
+strstr, wcschr, wcspbrk, wcsrchr, wcsstr and wmemchr that return
+pointers into their input arrays now have definitions as macros that
+return a pointer to a const-qualified type when the input argument is
+a pointer to a const-qualified type.
+
+https://lists.gnu.org/archive/html/info-gnu/2026-01/msg00005.html
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+
+Upstream-Status: Submitted [https://github.com/vmware/open-vm-tools/pull/783]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ open-vm-tools/lib/hgfs/hgfsEscape.c            | 6 +++---
+ open-vm-tools/lib/hgfsServer/hgfsServerLinux.c | 2 +-
+ open-vm-tools/lib/misc/strutil.c               | 7 ++++---
+ open-vm-tools/lib/nicInfo/nicInfoPosix.c       | 2 +-
+ open-vm-tools/libvmtools/i18n.c                | 2 +-
+ open-vm-tools/services/plugins/vix/vixTools.c  | 2 +-
+ 6 files changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/open-vm-tools/lib/hgfs/hgfsEscape.c b/open-vm-tools/lib/hgfs/hgfsEscape.c
+index c4d39b12d..212ea1c79 100644
+--- a/open-vm-tools/lib/hgfs/hgfsEscape.c
++++ b/open-vm-tools/lib/hgfs/hgfsEscape.c
+@@ -175,7 +175,7 @@ HgfsAddEscapeCharacter(char const * bufIn,      // IN: input name
+    HgfsEscapeContext *escapeContext = (HgfsEscapeContext *)context;
+    uint32 charactersToCopy;
+    uint32 outputSpace;
+-   char* illegal;
++   const char* illegal;
+    Bool result = TRUE;
+ 
+    ASSERT(offset >= escapeContext->processedOffset); // Scanning forward
+@@ -573,7 +573,7 @@ HgfsIsEscapeSequence(char const *bufIn,   // IN: input name
+                      uint32 length)       // IN: length of the name in characters
+ {
+    if (bufIn[offset] == HGFS_ESCAPE_CHAR && offset > 0) {
+-      char *substitute;
++      const char *substitute;
+       if (bufIn[offset - 1] == HGFS_ESCAPE_SUBSTITUE_CHAR && offset > 1) {
+          /*
+           * Possibly a valid sequence, check it must be preceded with a substitute
+@@ -887,7 +887,7 @@ HgfsEscapeUndoComponent(char   *bufIn,             // IN: Characters to be unesc
+       size_t offset = escapePointer - bufIn;
+ 
+       if (HgfsIsEscapeSequence(bufIn, offset, sizeIn)) {
+-         char* substitute = strchr(HGFS_SUBSTITUTE_CHARS, bufIn[offset - 1]);
++         const char* substitute = strchr(HGFS_SUBSTITUTE_CHARS, bufIn[offset - 1]);
+          if (substitute != NULL) {
+             bufIn[offset - 1] = HGFS_ILLEGAL_CHARS[substitute - HGFS_SUBSTITUTE_CHARS];
+          } else if (bufIn[offset - 1] == HGFS_ESCAPE_SUBSTITUE_CHAR) {
+diff --git a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
+index 445a53881..eeabcadd4 100644
+--- a/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
++++ b/open-vm-tools/lib/hgfsServer/hgfsServerLinux.c
+@@ -1366,7 +1366,7 @@ static void
+ HgfsGetHiddenAttr(char const *fileName,         // IN:  Input filename
+                   HgfsFileAttrInfo *attr)       // OUT: Struct to copy into
+ {
+-   char *baseName;
++   const char *baseName;
+ 
+    ASSERT(fileName);
+    ASSERT(attr);
+diff --git a/open-vm-tools/lib/misc/strutil.c b/open-vm-tools/lib/misc/strutil.c
+index 4fc6502e4..4be63b7b8 100644
+--- a/open-vm-tools/lib/misc/strutil.c
++++ b/open-vm-tools/lib/misc/strutil.c
+@@ -1454,6 +1454,7 @@ StrUtil_ReplaceAll(const char *orig, // IN
+     char *result;
+     const char *current;
+     char *tmp;
++    const char *tmp2;
+     size_t lenWhat;
+     size_t lenWith;
+     size_t occurrences = 0;
+@@ -1467,8 +1468,8 @@ StrUtil_ReplaceAll(const char *orig, // IN
+     lenWith = strlen(with);
+ 
+     current = orig;
+-    while ((tmp = strstr(current, what)) != NULL) {
+-       current = tmp + lenWhat;
++    while ((tmp2 = strstr(current, what)) != NULL) {
++       current = tmp2 + lenWhat;
+        ++occurrences;
+     }
+ 
+@@ -1695,7 +1696,7 @@ StrUtilHasListItem(char const *list,                               // IN:
+                    char const *item,                               // IN:
+                    int (*ncmp)(char const *, char const*, size_t)) // IN:
+ {
+-   char *foundDelim;
++   const char *foundDelim;
+    int itemLen = strlen(item);
+ 
+    if (list == NULL) {
+diff --git a/open-vm-tools/lib/nicInfo/nicInfoPosix.c b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
+index 6f20547b2..a387e377b 100644
+--- a/open-vm-tools/lib/nicInfo/nicInfoPosix.c
++++ b/open-vm-tools/lib/nicInfo/nicInfoPosix.c
+@@ -267,7 +267,7 @@ static Bool
+ IpEntryMatchesDevice(const char *devName,
+                      const char *label)
+ {
+-   char *p;
++   const char *p;
+    size_t n;
+ 
+    if ((p = strchr(label, ':')) != NULL) {
+diff --git a/open-vm-tools/libvmtools/i18n.c b/open-vm-tools/libvmtools/i18n.c
+index 3085f72d7..f61406d14 100644
+--- a/open-vm-tools/libvmtools/i18n.c
++++ b/open-vm-tools/libvmtools/i18n.c
+@@ -698,7 +698,7 @@ VMTools_BindTextDomain(const char *domain,
+        * If we couldn't find the catalog file for the user's language, see if
+        * we can find a more generic language (e.g., for "en_US", also try "en").
+        */
+-      char *sep = Str_Strrchr(lang, '_');
++      const char *sep = Str_Strrchr(lang, '_');
+       if (sep != NULL) {
+          if (usrlang == NULL) {
+             usrlang = Util_SafeStrdup(lang);
+diff --git a/open-vm-tools/services/plugins/vix/vixTools.c b/open-vm-tools/services/plugins/vix/vixTools.c
+index b2079a10d..6a8498ffb 100644
+--- a/open-vm-tools/services/plugins/vix/vixTools.c
++++ b/open-vm-tools/services/plugins/vix/vixTools.c
+@@ -925,7 +925,7 @@ VixToolsBuildUserEnvironmentTable(const char * const *envp)   // IN: optional
+    for (; NULL != *envp; envp++) {
+       char *name;
+       char *value;
+-      char *whereToSplit;
++      const char *whereToSplit;
+       size_t nameLen;
+ 
+       whereToSplit = strchr(*envp, '=');
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
index 4ec6d5aa86..a48d1ce88d 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.10.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=maste
            file://0013-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            file://0014-timeSync-Portable-way-to-print-64bit-time_t.patch;patchdir=.. \
            file://0001-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch;patchdir=.. \
+           file://0001-fix-initialization-discards-const-qualifier-from-poi.patch;patchdir=.. \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"

