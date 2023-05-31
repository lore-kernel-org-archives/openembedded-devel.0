Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FDCC7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:43 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.11437.1685531596290989976
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bNl/+aL/;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-55db055b412so12539777b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531621; x=1688123621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYnqBgakSQIZ2Q9njOYF4HwqcvmTTvJCMUTwrujppLY=;
        b=bNl/+aL/t6yKHdzrSI9HeGcc128efc87RVjGULBeu9RZjthX+QTPABWNL/mVd1WZUh
         V10moP8tTrBYuW7tVss9bCX4IkDa9x42qzobUoWth7yOUWFBhS9OxdjOGEFqoJZRL2OL
         5VKIq4TJVqpkxhdFuB9CSWswoWpz6BuJI+Pvjyu5GwVYwnXle6DD4xwlJuxNXlHPgIoj
         Kyv8yajF/i2RogGIci/cXLQZ6CWKEMfRjAfOd0to6w53le+EZVo7FzC9vW3wjbVpvDGD
         BFcVi5ge1oQ3iu184fujtA5Da0oatNTOskmiCrRhkTAKeO3RUlQoQCwZTW5BjJyfYI/d
         sx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531621; x=1688123621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYnqBgakSQIZ2Q9njOYF4HwqcvmTTvJCMUTwrujppLY=;
        b=ZV3H/Ogv5/7AvDD6q+QjdFWXHAQNC9KAlBAEin3Jf3GZmPbx8KIHxsQMuCsdTnpBsa
         QwQikrkGQQyktLJFsNYKggPa10/4DsKYhfLCpHbWyW6YGQr0VgkdXUS0S/AEJTv7xaI6
         mLm6ZOGjp+G4xzQMw+vXpkEYn9Pz6kijiExL16XWNbxU/jbl3m0YZOKRwBcLIWVFovdQ
         7CAQvR/4amn93KvjH/DbwZTa5WIam76lIsecbH24BgjyOkHjgxNCUkLZqfmwlJro1VwM
         4kG/LUQmmaVCSmfaJdbanICCDxl5R9u9EzaVtvxlQLvyg/8Xpamk2JZbDFKLP1rrxw/f
         r8Lg==
X-Gm-Message-State: AC+VfDx/F36pUsSLVE5isLjjpQEhVWAiTFt/Aa1ftVOLX8aplqK17Oma
	dC7ImRt9lMCy2cdJt2ZzsMelcIAS5QU=
X-Google-Smtp-Source: ACHHUZ7e/qa+mAT467KxH6s2e20KjlTUC9m/zDO8LxsZBYVkplbtTFs4cQ+CfISz0WD/WFxlN9OrKg==
X-Received: by 2002:a05:690c:985:b0:55a:103:db0d with SMTP id ce5-20020a05690c098500b0055a0103db0dmr17173249ywb.7.1685531621163;
        Wed, 31 May 2023 04:13:41 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 30/36] cgdb: Fix buildpaths emitted into cgdb binary
Date: Wed, 31 May 2023 07:13:03 -0400
Message-Id: <20230531111309.2454603-30-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103059

From: Khem Raj <raj.khem@gmail.com>

Do not add builddir to search paths for cgdb.txt

Fixes
WARNING: cgdb-0.8.0-r0 do_package_qa: QA Issue: File /usr/bin/cgdb in package cgdb contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ee2f57c7c3b489ddaab3343b9501f6257c65dcee)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...not-search-for-cgdb.txt-in-build-dir.patch | 34 +++++++++++++++++++
 meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb   |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/cgdb/cgdb/0001-cgdb-Do-not-search-for-cgdb.txt-in-build-dir.patch

diff --git a/meta-oe/recipes-devtools/cgdb/cgdb/0001-cgdb-Do-not-search-for-cgdb.txt-in-build-dir.patch b/meta-oe/recipes-devtools/cgdb/cgdb/0001-cgdb-Do-not-search-for-cgdb.txt-in-build-dir.patch
new file mode 100644
index 0000000000..989df8ed92
--- /dev/null
+++ b/meta-oe/recipes-devtools/cgdb/cgdb/0001-cgdb-Do-not-search-for-cgdb.txt-in-build-dir.patch
@@ -0,0 +1,34 @@
+From be56e955a32e5e9da0be32008afb8a8ee60e9b56 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 24 May 2023 19:31:23 -0700
+Subject: [PATCH] cgdb: Do not search for cgdb.txt in build dir
+
+If we do cross builds it encodes the build time workdir here and it wont
+be useful to look into this dir since cross-built cgdb may not run on
+build host and build workdir will not exist on target
+
+Upstream-Status: Inappropriate [Cross-compile specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cgdb/interface.cpp | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/cgdb/interface.cpp b/cgdb/interface.cpp
+index dc58137..d3aab5e 100644
+--- a/cgdb/interface.cpp
++++ b/cgdb/interface.cpp
+@@ -1568,11 +1568,6 @@ void if_display_help(void)
+ 
+     fs_util_get_path(PKGDATADIR, "cgdb.txt", cgdb_help_file);
+ 
+-    /* File doesn't exist. Try to find cgdb.txt in the build dir in case
+-     * the user is running a built cgdb binary directly. */
+-    if (!fs_verify_file_exists(cgdb_help_file))
+-        fs_util_get_path(TOPBUILDDIR, "doc/cgdb.txt", cgdb_help_file);
+-
+     ret_val = source_set_exec_line(src_viewer, cgdb_help_file, 1, 0);
+ 
+     if (ret_val == 0)
+-- 
+2.40.1
+
diff --git a/meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb b/meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb
index c5a0030823..922dfc7763 100644
--- a/meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb
+++ b/meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb
@@ -9,7 +9,8 @@ DEPENDS = "flex-native readline ncurses"
 
 inherit autotools texinfo
 
-SRC_URI = "http://cgdb.me/files/${BP}.tar.gz"
+SRC_URI = "http://cgdb.me/files/${BP}.tar.gz \
+           file://0001-cgdb-Do-not-search-for-cgdb.txt-in-build-dir.patch"
 SRC_URI[sha256sum] = "0d38b524d377257b106bad6d856d8ae3304140e1ee24085343e6ddf1b65811f1"
 
 CACHED_CONFIGUREVARS = "ac_cv_file__dev_ptmx=yes ac_cv_rl_version=6.2 ac_cv_file__proc_self_status=yes"
-- 
2.25.1


