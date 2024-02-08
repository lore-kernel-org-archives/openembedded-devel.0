Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D381C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 23:40:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.4869.1707435637745973673
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 15:40:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NZZaPBG2;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33b29b5ea96so228512f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 15:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707435636; x=1708040436; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd0pTLTSJe4A04J9GgVP0Lxw+wIPh/Sg+7PkXC7Dg+Y=;
        b=NZZaPBG2yjqYih/Jr0jarKe1+AP+NpvGUpJk8aNnuvjLcJJ5m9QYxsrH4CWrvF62vg
         +pWWCa7qkjDZZpNp0bDDWkjNonyNwtUWAcIWGMqDrUPQbgYhCRFbouvGLkmo1nj0DUTI
         Oc6ut+GFtA9dUTdbzwF/+u27DJHBZUZG9aN04ZKcpv7436O5vnwL9xFwzKCqX3vDHVoA
         O1+JR5KFbkf1ziHTq+4CmfzvWRZMs5uh2qNyHiV9YgQTTy9oDmN0ja2vd5QO/sRM6N9k
         0yypr51bt0PZX9DLqUtJrltKb1R7jhahLXgFJI4VEPdT3XQwXKCiyBycYIJSlvOAbgPm
         0Eiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707435636; x=1708040436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pd0pTLTSJe4A04J9GgVP0Lxw+wIPh/Sg+7PkXC7Dg+Y=;
        b=kCLXMFzbsBjluY41yzFNQ3+0J+mi/CkBGpvOWW5VTRtjPeEcXJfafUnod3sqdhQ5cn
         BhrrcNi7RteFu6FGCFWF3RlrKE3Sg6CXGizuna8sdbWGorm3HU4/G3upr3NxflUwrDIt
         hIORMZ4rZg7j1x9jBCIlZAIBoYGc3q70IGICivDqtyZbX2CiTXWAuS2KFjBScW48wMx6
         FHp3fAtXP0OFcLouRJcBfnPVjLJIpVaYkfU01DncWmWuY2/iKmcdJpNbEh2yKQ/38xKD
         qa2SFMsE9zMgQv1OQkYpwd+Ajbk3RxlQ7LvexTCTnrv72Vhs+WtOiBYQogQ+0YjLLk8N
         qMIw==
X-Gm-Message-State: AOJu0YwdVhq9sxVOT6ATCl2TI84nCNcSv8hZWGvAR52PhfMMduW7OnWo
	jv2om3wxv1iwzkegqFNanhgfg1edFIvmaSb74KWdNS1gyM+MXCFnVvdi8uIM
X-Google-Smtp-Source: AGHT+IGXEk9GA8ZVRXzYRrLln00CsX1BueYU15TyFOt8P0q5eEBvvC5XHnere4qTfhMYAi4CPTHh9Q==
X-Received: by 2002:a5d:60d2:0:b0:33b:1398:2614 with SMTP id x18-20020a5d60d2000000b0033b13982614mr142757wrt.25.1707435635879;
        Thu, 08 Feb 2024 15:40:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUahJr9JmzREJsL3zbBa+VQX/Jf0wP8EXXqNbWT+JYN6mOKDW1sCJkiwsAusTFYU2b9Hua8CnQK+cxImKNR0ogJRNhjLQQc5bzpHYDi5Lq0mTT9nfyNSwm3v/6xPEaPlFFEof23s0n4naB2YGo64cK8aIGbN4MlDGE=
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id by13-20020a056000098d00b0033b5efcd0cbsm414635wrb.11.2024.02.08.15.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 15:40:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: uvv.mail@gmail.com,
	wangmy@fujitsu.com,
	Vyacheslav.Yurkov@bruker.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-filesystems][PATCH] xfstests: fix make install race condition
Date: Fri,  9 Feb 2024 00:40:26 +0100
Message-ID: <20240208234026.3515183-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 23:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108674

* sometimes make install was failing with:
  cp: cannot stat 'group.list': No such file or directory
  and bunch of non-fatal messages:
  mv: failed to preserve ownership for 'group.list': Invalid argument

* this was when tools/mkgroupfile did
  mv -f "$new_groups" "$groupfile"
  overwritting the group.list file while install-sh was already
  copying it to output

* in the end easily reproducible by
  1) removing tests/*/group.list before each make install
  2) adding some sleep in mkgroupfile before the mv call

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...ake-sure-group.list-DIRT-exists-befo.patch | 239 ++++++++++++++++++
 .../xfstests/xfstests_2024.01.14.bb           |  10 +-
 2 files changed, 242 insertions(+), 7 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch
new file mode 100644
index 0000000000..5e8bf0c606
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch
@@ -0,0 +1,239 @@
+From b30d5690d7245aa8bd5ca2896e629e62ec97afda Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Thu, 8 Feb 2024 23:01:36 +0100
+Subject: [PATCH] tests/*/Makefile: make sure group.list DIRT exists before
+ install
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* sometimes make install was failing with:
+  cp: cannot stat 'group.list': No such file or directory
+  and bunch of non-fatal messages:
+  mv: failed to preserve ownership for 'group.list': Invalid argument
+
+* this was when tools/mkgroupfile did
+  mv -f "$new_groups" "$groupfile"
+  overwritting the group.list file while install-sh was already
+  copying it to output
+
+* in the end easily reproducible by
+  1) removing tests/*/group.list before each make install
+  2) adding some sleep in mkgroupfile before the mv call
+
+Upstream-Status: Submitted [https://lore.kernel.org/fstests/20240208225241.644701-1-martin.jansa@gmail.com/]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ tests/btrfs/Makefile    | 2 +-
+ tests/ceph/Makefile     | 2 +-
+ tests/cifs/Makefile     | 2 +-
+ tests/ext4/Makefile     | 2 +-
+ tests/f2fs/Makefile     | 2 +-
+ tests/generic/Makefile  | 2 +-
+ tests/nfs/Makefile      | 2 +-
+ tests/ocfs2/Makefile    | 2 +-
+ tests/overlay/Makefile  | 2 +-
+ tests/perf/Makefile     | 2 +-
+ tests/selftest/Makefile | 2 +-
+ tests/shared/Makefile   | 2 +-
+ tests/tmpfs/Makefile    | 2 +-
+ tests/udf/Makefile      | 2 +-
+ tests/xfs/Makefile      | 2 +-
+ 15 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/tests/btrfs/Makefile b/tests/btrfs/Makefile
+index 1b72a1a1..6d9995b4 100644
+--- a/tests/btrfs/Makefile
++++ b/tests/btrfs/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/ceph/Makefile b/tests/ceph/Makefile
+index 2761e1e9..5f24d518 100644
+--- a/tests/ceph/Makefile
++++ b/tests/ceph/Makefile
+@@ -12,7 +12,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/cifs/Makefile b/tests/cifs/Makefile
+index 62c48935..0b89a01d 100644
+--- a/tests/cifs/Makefile
++++ b/tests/cifs/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/ext4/Makefile b/tests/ext4/Makefile
+index a2a0d561..296e3850 100644
+--- a/tests/ext4/Makefile
++++ b/tests/ext4/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/f2fs/Makefile b/tests/f2fs/Makefile
+index 9d1ed3c6..0a90b465 100644
+--- a/tests/f2fs/Makefile
++++ b/tests/f2fs/Makefile
+@@ -15,7 +15,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/generic/Makefile b/tests/generic/Makefile
+index b464b22b..d6ed3e55 100644
+--- a/tests/generic/Makefile
++++ b/tests/generic/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/nfs/Makefile b/tests/nfs/Makefile
+index 128d2a3a..51590b5c 100644
+--- a/tests/nfs/Makefile
++++ b/tests/nfs/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/ocfs2/Makefile b/tests/ocfs2/Makefile
+index 260ad31b..17e01bf3 100644
+--- a/tests/ocfs2/Makefile
++++ b/tests/ocfs2/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/overlay/Makefile b/tests/overlay/Makefile
+index 2785b94d..c71e78d6 100644
+--- a/tests/overlay/Makefile
++++ b/tests/overlay/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/perf/Makefile b/tests/perf/Makefile
+index 0c74ba39..d72c04d9 100644
+--- a/tests/perf/Makefile
++++ b/tests/perf/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/selftest/Makefile b/tests/selftest/Makefile
+index 3ddfca37..cabc35a9 100644
+--- a/tests/selftest/Makefile
++++ b/tests/selftest/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/shared/Makefile b/tests/shared/Makefile
+index f3128714..2e6aa718 100644
+--- a/tests/shared/Makefile
++++ b/tests/shared/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/tmpfs/Makefile b/tests/tmpfs/Makefile
+index 46544313..46b62dad 100644
+--- a/tests/tmpfs/Makefile
++++ b/tests/tmpfs/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/udf/Makefile b/tests/udf/Makefile
+index ed4434f0..feda69a6 100644
+--- a/tests/udf/Makefile
++++ b/tests/udf/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
+diff --git a/tests/xfs/Makefile b/tests/xfs/Makefile
+index 5f413e67..6bfafdb1 100644
+--- a/tests/xfs/Makefile
++++ b/tests/xfs/Makefile
+@@ -14,7 +14,7 @@ default: $(DIRT)
+ 
+ include $(BUILDRULES)
+ 
+-install:
++install: default
+ 	$(INSTALL) -m 755 -d $(TARGET_DIR)
+ 	$(INSTALL) -m 755 $(TESTS) $(TARGET_DIR)
+ 	$(INSTALL) -m 644 group.list $(TARGET_DIR)
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
index 711637a70d..5ff1914569 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
@@ -7,8 +7,9 @@ SRCREV_FORMAT = "xfstests_unionmount"
 
 SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;name=xfstests \
            git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
-           file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            file://0001-add-missing-FTW_-macros-when-not-available-in-libc.patch \
+           file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
+           file://0003-tests-Makefile-make-sure-group.list-DIRT-exists-befo.patch \
            "
 
 SRCREV_xfstests = "c46ca4d1f6c0c45f9a3ea18bc31ba5ae89e02c70"
@@ -51,12 +52,7 @@ do_configure:prepend() {
     cp -a ${S}/include/install-sh .
 }
 
-# Not sure if this is needed, but with old install-sh it was sometimes failing with:
-# cp: cannot stat 'group.list': No such file or directory
-# http://errors.yoctoproject.org/Errors/Details/752404/
-# PARALLEL_MAKEINST = "-j1"
-
-do_install:prepend() {
+do_install() {
     # otherwise install-sh duplicates DESTDIR prefix
     export DIST_ROOT="/" DIST_MANIFEST="" DESTDIR="${D}"
     oe_runmake install
-- 
2.43.0


