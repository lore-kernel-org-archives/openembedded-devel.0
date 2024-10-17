Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B44FD2F7EF
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 06:17:23 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.43088.1729145835085297315
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Oct 2024 23:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZJNpyA9B;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e49ef3bb9so409703b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Oct 2024 23:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729145834; x=1729750634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b3T5FQWPxIJEp14rGBwVPMvpbykZnkVOdXsY690gcaw=;
        b=ZJNpyA9BxTUY29sPdFuNlG7cU6VrnVvYXGjdssRqnQN7Ipzj60iBqS+O32LGBhz/L8
         UpJjayqugYe3mldgMXWHKIIYpDZNRGKQk7cHhhMpGI4UoVF3vNimaGvx+879SHxmOQPA
         Hzjc8C+nAG/mJ4WltOfs1erQ7EFIGXK9XUhtgRxmshP7bD0qZKdR2XArMdNRWTj/h/wF
         U9s9CfYi1OxargUILzZ+NhbeRSRuv5u0JZOqZbSZml8/guuCI/H76umv6sPhL0rg3d19
         PpcBTjDARdu1MFmfUq3hNaqdeGmq+cE7gp2ZTnxSBd6oNMWPnOPv65DicdsSTamO0lnu
         5arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729145834; x=1729750634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b3T5FQWPxIJEp14rGBwVPMvpbykZnkVOdXsY690gcaw=;
        b=nIrEEVSsuDNT3XVmozcwDLMsZsd4o6waJot/Z8I+tfAMWuE3KVgtivTY2Kl61Qa1lG
         m7i3i+6DSCLs0weQzFx3yZ7O79Ngo+miINmImi3dnT4wYEHNAR0Ce+aFnviH4DjH7StF
         adK6vGUxfG5Hbq6PXwy5OKzytyspfMkptxZ8/dE/eBil1uMIegxwt6dxPHpHnroj0QH2
         O+rWwfyiMRxdshpJ9BnNi/Wt+xyXcjLJn984i8bQHxGnqNx5lGnH26LbPCSv+eyr/0ne
         uFeMErqVeSy+edV+GvuYLc0fFdKF7fJq0ZEa8Nomp50XRGQZsZJealRgYuUjmwcX6NnL
         eGHQ==
X-Gm-Message-State: AOJu0YzASPQkLleX7WzmegMp2kDHLYeLoDYzPDGoY8hssIEiX6BPAE3J
	hlMGbnQJ1Bfk7vUpS/ByovOevSIogwAx+SKf0nW696D6s/Vu8FBfH0CblFMX
X-Google-Smtp-Source: AGHT+IEwgFDmnPniNQhGM+rIU2OLSh4reqGtlS8RUZfE8ZkymHwtHCtN1h8BRyq3IKIWnI2nwnX4cw==
X-Received: by 2002:a05:6a00:1d15:b0:71e:591d:cb4c with SMTP id d2e1a72fcca58-71e8fd43bc5mr4141205b3a.1.1729145834011;
        Wed, 16 Oct 2024 23:17:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6310])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773a2ef1sm4043905b3a.79.2024.10.16.23.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:17:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] xmlrpc-c: Fix race condition triggered during symlink creation
Date: Wed, 16 Oct 2024 23:17:10 -0700
Message-ID: <20241017061710.1108077-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 06:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112958

This should fix race condition sometime seen in highly parallell builds

   | rm -f libxmlrpc_util.so.4
   | rm -f libxmlrpc_util.so.4
   | ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
   | ln -s libxmlrpc_util.so.4.60 libxmlrpc_util.so.4
   | rm -f libxmlrpc_util.so
   | ln: failed to create symbolic link 'libxmlrpc_util.so.4': File exists
   | make[2]: *** [/home/kraj01/yoe/build/tmp/work/core2-64-yoe-linux/xmlrpc-c/1.60.03/git/stable/unix-common.mk:72: libxmlrpc_util.so.4] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...nsuring-Sequential-Execution-of-rm-a.patch | 46 +++++++++++++++++++
 .../xmlrpc-c/xmlrpc-c_1.60.03.bb              |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch
new file mode 100644
index 0000000000..02b5244f3a
--- /dev/null
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch
@@ -0,0 +1,46 @@
+From c9bd05e8f0ad805b81625cfa717d06071cfd9b48 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 16 Oct 2024 22:52:38 -0700
+Subject: [PATCH] unix-common.mk: Ensuring Sequential Execution of rm and ln commands
+
+With high parallel execution, it results in race condition where
+its trying to create symlink while the original symlink while rm is
+not done deleting the existing file yet.
+
+force sequential execution by adding dependencies between the steps
+or combining them into a single shell command
+
+Here, && ensures that the ln -s command only runs after rm -f target
+successfully completes.
+
+Similar error reported here [1]
+
+[1] https://bugs.gentoo.org/932835
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ unix-common.mk | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/unix-common.mk b/unix-common.mk
+index 6954faf5..983c48cd 100644
+--- a/unix-common.mk
++++ b/unix-common.mk
+@@ -62,14 +62,12 @@ SHLIB_CMD = $(CCLD) $(LADD) $(LDFLAGS_SHLIB) -o $@ $^
+ SHLIB_LE_TARGETS = $(call shliblefn, $(SHARED_LIBS_TO_BUILD))
+ 
+ $(SHLIB_LE_TARGETS):%:%.$(MAJ)
+-	rm -f $@
+-	$(LN_S) $< $@
++	rm -f $@ && $(LN_S) $< $@
+ 
+ SONAME_TARGETS = $(SHLIB_LE_TARGETS:%=%.$(MAJ))
+ 
+ $(SONAME_TARGETS):%:%.$(MIN)
+-	rm -f $@
+-	$(LN_S) $< $@
++	rm -f $@ && $(LN_S) $< $@
+ 
+ .PHONY: $(SHLIB_INSTALL_TARGETS)
+ .PHONY: install-shared-libraries
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
index a34256c275..f5ee920cad 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
 
 SRC_URI = "git://github.com/mirror/xmlrpc-c.git;branch=master;protocol=https \
            file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
+           file://0001-unix-common.mk-Ensuring-Sequential-Execution-of-rm-a.patch \
            "
 # one more commit after Release 1.60.03 in the Stable series
 SRCREV = "a823b0bb5cf0a4dbd34f929cbfdfb0439c5d9b0e"

