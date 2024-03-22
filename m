Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A948C47DD9
	for <webhook@archiver.kernel.org>; Fri, 22 Mar 2024 12:31:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.11869.1711110666752333136
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Mar 2024 05:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g3WcWCDv;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4146a1ac117so12541055e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 05:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711110665; x=1711715465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gkOVTmNvm7AWW69efUWHyizoixLB902d6CtRTONYBtc=;
        b=g3WcWCDviUIYjw5w2d8eDY+aK7UbmUgaynVWn1Rv448WFyerw693O49sHdkAihAGaj
         117qUzmWuwfaZ/amBTH5l9y8pABL61kfWarGq9QPH905ig4unGISymsRj1N4xzJQELxi
         hZ5I273sZTzvNzcnKJ+0HNTFRJb5USZyg32H96857EY3z788/DDYXv4nKLoZJ3idGFYg
         MIWtW/acS0ABjpmtmlqcW7t8Qn0Pr6pH43CY+3iTIkHgmlOhAS8mBKgwg0pY+sQbOQb9
         ffnT0xF4HeJ1OFamTJvDXNGMWw6/sm8kUPtFJOyAISL1gL+Rh7/lVjHW/jc3R5qoq4nM
         YlvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711110665; x=1711715465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkOVTmNvm7AWW69efUWHyizoixLB902d6CtRTONYBtc=;
        b=llRrL05RM/znrKoLg8NWjOJgwpJ/cYaQ0MI4Gr1lL46q3+AX7DA9amTnyXg4Km1x4o
         6hs1F5CELyWt2qSCKyaeZ6U7aIE285mXAaZ0+4DFcvkMpYDmZpfTMJ7AsUAoHBNSEBRN
         RJi+4P8992YDRKjMMpLWLIK63/QVMwV+HgOZjLIFvrw0y2J6BdesenC05CLoT7V3xsmL
         gTAEuGOTR4t/5s1jB4Fd0U9MPulr5qZ+iOUiHdUHEDw7M2lgZgZ5Jz9uO/oVg5Sm72Gl
         Pm0sgLbtFnDq0FpkPr8txyjOKDhHJo7rcMx3TLprPp0QN0KknO+FIAjJEf06O04yDLtA
         X4lQ==
X-Gm-Message-State: AOJu0YwMJYImwX52kMlME1AO4oYNc0UtNXaZ2BF+efgDxb7xCinoJIqT
	/oBiw+uGdfcSbCvLN+2Y8JQWJmd75iRv5swBy/iLu7KbOAYmcjpW7vOoXnse
X-Google-Smtp-Source: AGHT+IEG4Ee1gAdUa1YQD6AMlArTtxBbOt2BcLZT3wj7voQZB+ISfy+q3v90J0yb4+yRDIkGZnVcqA==
X-Received: by 2002:a05:600c:46ce:b0:414:e6e:756a with SMTP id q14-20020a05600c46ce00b004140e6e756amr1704506wmo.9.1711110664734;
        Fri, 22 Mar 2024 05:31:04 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c469100b004132ae838absm2926178wmo.43.2024.03.22.05.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 05:31:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-filesystems][PATCH] xfstests: upgrade to v2024.03.03
Date: Fri, 22 Mar 2024 13:30:55 +0100
Message-ID: <20240322123057.1591121-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Mar 2024 12:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109518

* drop 0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch which
  was merged upstream

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...ake-sure-group.list-DIRT-exists-befo.patch | 239 ------------------
 ...s_2024.01.14.bb => xfstests_2024.03.03.bb} |   3 +-
 2 files changed, 1 insertion(+), 241 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2024.01.14.bb => xfstests_2024.03.03.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch
deleted file mode 100644
index 5e8bf0c606..0000000000
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch
+++ /dev/null
@@ -1,239 +0,0 @@
-From b30d5690d7245aa8bd5ca2896e629e62ec97afda Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Thu, 8 Feb 2024 23:01:36 +0100
-Subject: [PATCH] tests/*/Makefile: make sure group.list DIRT exists before
- install
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* sometimes make install was failing with:
-  cp: cannot stat 'group.list': No such file or directory
-  and bunch of non-fatal messages:
-  mv: failed to preserve ownership for 'group.list': Invalid argument
-
-* this was when tools/mkgroupfile did
-  mv -f "$new_groups" "$groupfile"
-  overwritting the group.list file while install-sh was already
-  copying it to output
-
-* in the end easily reproducible by
-  1) removing tests/*/group.list before each make install
-  2) adding some sleep in mkgroupfile before the mv call
-
-Upstream-Status: Submitted [https://lore.kernel.org/fstests/20240208225241.644701-1-martin.jansa@gmail.com/]
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
----
- tests/btrfs/Makefile    | 2 +-
- tests/ceph/Makefile     | 2 +-
- tests/cifs/Makefile     | 2 +-
- tests/ext4/Makefile     | 2 +-
- tests/f2fs/Makefile     | 2 +-
- tests/generic/Makefile  | 2 +-
- tests/nfs/Makefile      | 2 +-
- tests/ocfs2/Makefile    | 2 +-
- tests/overlay/Makefile  | 2 +-
- tests/perf/Makefile     | 2 +-
- tests/selftest/Makefile | 2 +-
- tests/shared/Makefile   | 2 +-
- tests/tmpfs/Makefile    | 2 +-
- tests/udf/Makefile      | 2 +-
- tests/xfs/Makefile      | 2 +-
- 15 files changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/tests/btrfs/Makefile b/tests/btrfs/Makefile
-index 1b72a1a1..6d9995b4 100644
---- a/tests/btrfs/Makefile
-+++ b/tests/btrfs/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/ceph/Makefile b/tests/ceph/Makefile
-index 2761e1e9..5f24d518 100644
---- a/tests/ceph/Makefile
-+++ b/tests/ceph/Makefile
-@@ -12,7 +12,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/cifs/Makefile b/tests/cifs/Makefile
-index 62c48935..0b89a01d 100644
---- a/tests/cifs/Makefile
-+++ b/tests/cifs/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/ext4/Makefile b/tests/ext4/Makefile
-index a2a0d561..296e3850 100644
---- a/tests/ext4/Makefile
-+++ b/tests/ext4/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/f2fs/Makefile b/tests/f2fs/Makefile
-index 9d1ed3c6..0a90b465 100644
---- a/tests/f2fs/Makefile
-+++ b/tests/f2fs/Makefile
-@@ -15,7 +15,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/generic/Makefile b/tests/generic/Makefile
-index b464b22b..d6ed3e55 100644
---- a/tests/generic/Makefile
-+++ b/tests/generic/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/nfs/Makefile b/tests/nfs/Makefile
-index 128d2a3a..51590b5c 100644
---- a/tests/nfs/Makefile
-+++ b/tests/nfs/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/ocfs2/Makefile b/tests/ocfs2/Makefile
-index 260ad31b..17e01bf3 100644
---- a/tests/ocfs2/Makefile
-+++ b/tests/ocfs2/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/overlay/Makefile b/tests/overlay/Makefile
-index 2785b94d..c71e78d6 100644
---- a/tests/overlay/Makefile
-+++ b/tests/overlay/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/perf/Makefile b/tests/perf/Makefile
-index 0c74ba39..d72c04d9 100644
---- a/tests/perf/Makefile
-+++ b/tests/perf/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/selftest/Makefile b/tests/selftest/Makefile
-index 3ddfca37..cabc35a9 100644
---- a/tests/selftest/Makefile
-+++ b/tests/selftest/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/shared/Makefile b/tests/shared/Makefile
-index f3128714..2e6aa718 100644
---- a/tests/shared/Makefile
-+++ b/tests/shared/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/tmpfs/Makefile b/tests/tmpfs/Makefile
-index 46544313..46b62dad 100644
---- a/tests/tmpfs/Makefile
-+++ b/tests/tmpfs/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/udf/Makefile b/tests/udf/Makefile
-index ed4434f0..feda69a6 100644
---- a/tests/udf/Makefile
-+++ b/tests/udf/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
-diff --git a/tests/xfs/Makefile b/tests/xfs/Makefile
-index 5f413e67..6bfafdb1 100644
---- a/tests/xfs/Makefile
-+++ b/tests/xfs/Makefile
-@@ -14,7 +14,7 @@ default: $(DIRT)
- 
- include $(BUILDRULES)
- 
--install:
-+install: default
- 	$(INSTALL) -m 755 -d $(TARGET_DIR)
- 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
- 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
index 2800a4c30f..2d5fedb417 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.03.03.bb
@@ -2,7 +2,7 @@ SUMMARY = "File system QA test suite"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038"
 
-SRCREV = "c46ca4d1f6c0c45f9a3ea18bc31ba5ae89e02c70"
+SRCREV = "088e5bd4cb6d7295612430a56ae84ff5c8f54730"
 SRCREV_unionmount = "e3825b16b46f4c4574a1a69909944c059835f914"
 SRCREV_FORMAT = "default_unionmount"
 
@@ -10,7 +10,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master \
            git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
            file://0001-add-missing-FTW_-macros-when-not-available-in-libc.patch \
            file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
-           file://0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.44.0


