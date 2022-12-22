Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47103C4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 02:53:28 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.37282.1671677607008704034
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Dec 2022 18:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DnGByQkw;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id c13so326813pfp.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 18:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRmMWSCr5lCpfWhWxTWO8/R+rmwk29nKnWN4KTY4lZk=;
        b=DnGByQkw4IqVlTCPxPYtPee6k/g6cuaEz6Ag/Nv2NyFvHtUw9BT9vPRiYAhMWWCLA/
         +cak+CvgWKCUJxN4GmS7TZk4NRTNRdoPx/XOgIUuOEvbAYCtxc0tB2+jUrmJ/MMVU+0L
         bEOprw2pDd/N/AOkxaRyc/FpSymdee76Ws67Dmx41mJAgwAPPynqF8FHzo3bPqYeZhj2
         QQBkUU0NFcOs1SNtLbPrJ65nutZw6BgnS+Hwu6kq5EYcBy/rH+Fkcmu89O8p94uwSs78
         H3pCOcTeHD75LV/RaZr7EORoJ0tKdfaeKAQJHnznCt3p6dSTpNHTpOXKy+URaOKvmNQC
         QBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRmMWSCr5lCpfWhWxTWO8/R+rmwk29nKnWN4KTY4lZk=;
        b=kOJssIqDb9L0Y1V6aZTIQ5BFwM7bVFFmlMZ/I4OqiLePoCQ9uc0o91S0zuJpggnkZD
         Y6FSuV0VvAbXGXhGKIET1mtpJ6QBxny3ABevC3qjZBT1txACgK0Ny1YWxhe1H8ExRqgC
         yZfYwqC5lassUuCTOVA/eZKobTMexZ4W2WvfKE10GukNqBFWLt2Xsvu8ENRMED7VWamg
         Dx/xys5zKrF7/lQAI83o6sCThNxgSl6pNoNFQZ5czp714swBzt7y5AykKs0ke8z+7yM+
         ZQi/mFX6t2bZJopjwHIcXuBbPJjMhnxTN1vJC1onQWbXbqRdBYTyKYssEV5OQbZTljAC
         N1xw==
X-Gm-Message-State: AFqh2krz7YDus+BMzu1I/M/ujR6HZVhKQbD8GBXOJs2eBKv8FfC6rLRn
	ZLSd/Cf7SEAx9m9XvKkTdCByQbf2GqE=
X-Google-Smtp-Source: AMrXdXu/RQtNzXRWfCzGhzjgQLEVeoX44n/OMkh7zRtvG2C0cyWVnj8DVcT2h96IQaluJMnYTfwBNg==
X-Received: by 2002:a62:506:0:b0:56d:d678:aecd with SMTP id 6-20020a620506000000b0056dd678aecdmr4861060pff.23.1671677606191;
        Wed, 21 Dec 2022 18:53:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id g5-20020aa796a5000000b00576c291976dsm11283630pfk.201.2022.12.21.18.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 18:53:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 2/2] f2fs-tools: Upgrade to 1.15.0
Date: Wed, 21 Dec 2022 18:53:23 -0800
Message-Id: <20221222025323.994194-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222025323.994194-1-raj.khem@gmail.com>
References: <20221222025323.994194-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 02:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100184

Add patches to build builds when S != B and largefile support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-f2fs_io-Fix-out-of-tree-builds.patch | 27 +++++++++++
 ...-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch | 47 +++++++++++++++++++
 ...s-tools_1.14.0.bb => f2fs-tools_1.15.0.bb} |  4 +-
 3 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch
 create mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch
 rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.14.0.bb => f2fs-tools_1.15.0.bb} (74%)

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch
new file mode 100644
index 0000000000..aa243bd9c0
--- /dev/null
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch
@@ -0,0 +1,27 @@
+From f110e34d7a4929cdea647b98fa177cf1bccf8b1e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Dec 2022 18:21:42 -0800
+Subject: [PATCH] f2fs_io: Fix out of tree builds
+
+Relative path does not work when searching for include files
+when srcdir != builddir
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-f2fs-devel/20221222022830.976309-1-raj.khem@gmail.com/T/#t]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/f2fs_io/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/f2fs_io/Makefile.am b/tools/f2fs_io/Makefile.am
+index 6c17db1..bc4f9d0 100644
+--- a/tools/f2fs_io/Makefile.am
++++ b/tools/f2fs_io/Makefile.am
+@@ -1,7 +1,7 @@
+ ## Makefile.am
+ 
+ if LINUX
+-AM_CPPFLAGS = -I../../include
++AM_CPPFLAGS = -I$(top_srcdir)/include
+ AM_CFLAGS = -Wall
+ sbin_PROGRAMS = f2fs_io
+ f2fs_io_SOURCES = f2fs_io.c
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch
new file mode 100644
index 0000000000..66a70bca8c
--- /dev/null
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch
@@ -0,0 +1,47 @@
+From 3c0314e1820afc9a98e890cc5f7973c3c81877f8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Dec 2022 18:23:03 -0800
+Subject: [PATCH] f2fs_io: Define _FILE_OFFSET_BITS=64
+
+Remove _LARGEFILE64_SOURCE, this is redundant when _FILE_OFFSET_BITS=64
+additionally it fixes build with musl because the detection logic for
+lseek64 fails because when using _LARGEFILE64_SOURCE musl also define's
+lseek64 as an alias to lseek
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-f2fs-devel/20221222022830.976309-2-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/libf2fs_io.c        | 4 +++-
+ tools/f2fs_io/f2fs_io.c | 4 ++--
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
+index a392255..f02336c 100644
+--- a/lib/libf2fs_io.c
++++ b/lib/libf2fs_io.c
+@@ -11,7 +11,9 @@
+  *
+  * Dual licensed under the GPL or LGPL version 2 licenses.
+  */
+-#define _LARGEFILE64_SOURCE
++#ifndef _FILE_OFFSET_BITS
++#define _FILE_OFFSET_BITS 64
++#endif
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
+index 0edac6f..2a67927 100644
+--- a/tools/f2fs_io/f2fs_io.c
++++ b/tools/f2fs_io/f2fs_io.c
+@@ -12,8 +12,8 @@
+ #ifndef _LARGEFILE_SOURCE
+ #define _LARGEFILE_SOURCE
+ #endif
+-#ifndef _LARGEFILE64_SOURCE
+-#define _LARGEFILE64_SOURCE
++#ifndef _FILE_OFFSET_BITS
++#define _FILE_OFFSET_BITS 64
+ #endif
+ #ifndef O_LARGEFILE
+ #define O_LARGEFILE 0
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.15.0.bb
similarity index 74%
rename from meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb
rename to meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.15.0.bb
index fb71b18b60..5da059f738 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.15.0.bb
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=362b4b2594cd362b874a97718faa51d3"
 # to provide libuuid
 DEPENDS = "util-linux"
 
-SRCREV = "d41dcbdf46dc3841cd0a0507e6573e38cb6c55bb"
+SRCREV = "64f2596142800c215cb40a658ebd5793ed37c936"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;branch=master \
+           file://0001-f2fs_io-Fix-out-of-tree-builds.patch \
+           file://0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-- 
2.39.0


