Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CB7C7EE2E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 05:47:16 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.5431.1684993635694500018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 22:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Tizwc0vz;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-51b33c72686so828992a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 22:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684993635; x=1687585635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0skwCOyQXTgWH9dRu2ko2Y+ZiUi+ZYNDUnbq620RxE=;
        b=Tizwc0vzFpu8QL/VFVruVOteBMswqZlminWTGsvTGun21Z7/wMwUt/kCQfXgPEkz1F
         49oNvzy9N+ZqmHfOdf0C+frInKlLCGWYjImlpTI7dTRL94qbKSWFSTwBLHWZrkT3LpBQ
         DZun5CKQwdLOdCkoHJNlXDvyY5wdBzLYz0ys/LaVGNempY6ttVs7WZnUDrhxeimiUkrY
         IpU4d7YiKuaBC2zsJYWUIS+qN4DuX3FHFOdVNkvNAbiOh9yE5CY9icvS8v+xUtznYLDU
         L2FuWN+GFrN8Qrca+CXbh7jMH1P48Zqk2su2EdoVhx5DNokrDfc7KISgVc/GgQXlQC1P
         q7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684993635; x=1687585635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0skwCOyQXTgWH9dRu2ko2Y+ZiUi+ZYNDUnbq620RxE=;
        b=UPgCV5nsjSPv3LQBF/Eu8Y4QI+FJk2PDvK6soenWSYOtx+A5N6izvUERpfUecfRStp
         Z8LqbYEmLvQekoTEWn8fj44slXYmKp2g6+s8VTiigt92cD1oI9WqKF72pf0DCr3WXPwj
         h+0tClrJZmLhjunzQ4+TqNVHc1Y1zXjBXcMJwmTT8ckxoq+SIX3kCQ7MRRQVFv41P0F9
         tBKCyNnI0DmOHtgXwZ5RfDqqbW4d0gmwoPox8iJPd/g5Ke/TAt33IxrkdMd47W3QckT/
         pjgXHQ3MFu48aNDohejiVs2yRuoE9Um5hNirLqQoE/TsIhTQReXF3APoZHijcTTX6GS8
         2qhg==
X-Gm-Message-State: AC+VfDzkRKytaywgNUhE0qmq1Txv3Sy3m0Y7LB/25o9k5CZKruvzTNqI
	vS/7eV1SiPNHloE5cdsBkmpsygY+Z+A=
X-Google-Smtp-Source: ACHHUZ7dZPu8fPSx+8Uqb3ENxCGUqHm/Awv6N3c8IVR4ebUrLZ1hlbrMnE3p7l8/MZyI/wlRgnegbw==
X-Received: by 2002:a17:902:d88f:b0:1ae:2b97:f387 with SMTP id b15-20020a170902d88f00b001ae2b97f387mr450608plz.21.1684993634714;
        Wed, 24 May 2023 22:47:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id j7-20020a17090276c700b001a6d4ea7301sm441286plt.251.2023.05.24.22.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 22:47:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] cgdb: Fix buildpaths emitted into cgdb binary
Date: Wed, 24 May 2023 22:47:09 -0700
Message-Id: <20230525054712.1593592-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525054712.1593592-1-raj.khem@gmail.com>
References: <20230525054712.1593592-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 05:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102800

Do not add builddir to search paths for cgdb.txt

Fixes
WARNING: cgdb-0.8.0-r0 do_package_qa: QA Issue: File /usr/bin/cgdb in package cgdb contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.40.1


