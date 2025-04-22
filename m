Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27DAC369D1
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 18:53:08 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.48215.1745347982326277580
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 11:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g8bylc/w;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so1445275e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 11:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745347981; x=1745952781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qznxz8J4FNuRxGjiuoSZa8vpZns2/sgx282MEK9euTM=;
        b=g8bylc/waJ+gz6DlNkDGp029BACKImh0D2usd4bxR2kaS1J77MkkXO2vt+cZ+FrVTL
         D+VS3Uh8BBKkKA0X3qWP72dJE+NXcqxcxuAt0rQgFsN4oGTGoiS2A5NR7fG1/7X9LMKi
         DjVV6baHq3zKA1QvIyh5WadUEQJHyNrpezjo1iz/rmyKvvAsjUQYdCrGxVUBX/VKP6F/
         YhZ0BIjGc64w9f4yf1wpVciWEEbEih3Ge49sFF/n2PTVS/FAYYr0S7+wefQYTdjSWtYA
         ExaCKEOWECtMJtsh5spV5rrLhy2Z31r3e6fKTF3UsugUoHrj1S2by4ygdKDQVmKho8na
         rfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347981; x=1745952781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qznxz8J4FNuRxGjiuoSZa8vpZns2/sgx282MEK9euTM=;
        b=kg2wA77bjZ5p+HLYzadMk5de9950mXwqpVHoaEPDeZPKu1r++iu0Rmbhm+Aa40Y89T
         jrMMrNB05f9CWD6YPnUiTkanHF/uK1SlmyqUQmNZbJWgRi9ZrEDU+Zi7hwCHOUAzuF8c
         fyQLkIu02ePDbdC8DrlFKoRKh2QfcS8N92gzY2CL0HlNKnC2m8KDIiIYIi/mpBnFU/TE
         N3Yigq0OeYaLHthnjcHNactU7KSAgIaatDETw0cKU/2Aw5wobMpyhGtLrmSLgL6hDYmH
         Grt73Sshp37z7OR3rTc9O1ucD1IaQHoi8gtivXZG6sWvPo29KERkftU58M4FoYuI80cq
         1YuQ==
X-Gm-Message-State: AOJu0YxFgnHJQeXQzJ/XwYMJ0mZKUPKheTjPqi0WEOSG8LimpKnNtDDl
	46wOinAiBgp3F1B9rwBfQwEyHdk07uyyB1eHlofeqGpE1C7nAXEhyg+c8rgr
X-Gm-Gg: ASbGncsNbROx6+2A2fxIeR11Y8FfPlU5+ZeyyfLT9hHOZPsPzh5HCcwJco6cIwY8XgP
	upEV3L77QJf8mh49qKZsZd+qOZpneomcil+jZvLr7lIRFkPFfCE6ABklkkZUO3b/AFGxKSZbkgF
	EdKNXJ6HX9xzU2QegxMUCJt63g93tiEybRov1XSP/NtN6DmUuV8e2NssdjM9RV5FcyKBY3DWQZk
	8HWJiJ2izYp0uMDdRh47u1dr4wmE5g0P4k6897omUiiGuphwP6QKWtx+swWt04GsT/1T2NMyNwP
	u4iTVVifbXmenNd2JpZNDNYZcmn06K2lVPbqZaWrj9dX6r4eT6DqiHb2hNaRZhCmcbWOcHkabg=
	=
X-Google-Smtp-Source: AGHT+IHckNMwEku9Ajl//Nenh+S4OI+5r0Y+KVkgvsel/3qNaqmoYUmgWfCH6Bj7jQ9/OLQhIAjxhQ==
X-Received: by 2002:a5d:6daf:0:b0:39c:1258:d12c with SMTP id ffacd0b85a97d-3a067292908mr57217f8f.28.1745347980640;
        Tue, 22 Apr 2025 11:53:00 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5a9e43sm182084885e9.5.2025.04.22.11.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:53:00 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] mce-test: fix build with gcc-15
Date: Tue, 22 Apr 2025 20:52:59 +0200
Message-ID: <20250422185259.1215105-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 18:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117067

From: Martin Jansa <martin.jansa@gmail.com>

fix wait_handler declaration to match definition in:
tools/ltp-pan/ltp-pan.c:wait_handler( int sig )

* fixes build with gcc-15:
  http://errors.yoctoproject.org/Errors/Details/852857/

ltp-pan.c: In function 'main':
ltp-pan.c:459:19: error: assignment to '__sighandler_t' {aka 'void (*)(int)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
  459 |     sa.sa_handler = wait_handler;
      |                   ^
In file included from ltp-pan.c:67:
zoolib.h:52:6: note: 'wait_handler' declared here
   52 | void wait_handler();
      |      ^~~~~~~~~~~~
In file included from TOPDIR/tmp/work/core2-64-oe-linux/mce-test/20230601+git/recipe-sysroot/usr/include/sys/param.h:28,
                 from ltp-pan.c:56:
TOPDIR/tmp/work/core2-64-oe-linux/mce-test/20230601+git/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
   72 | typedef void (*__sighandler_t) (int);
      |                ^~~~~~~~~~~~~~
ltp-pan.c:489:17: error: too many arguments to function 'wait_handler'; expected 0, have 1
  489 |                 wait_handler(SIGINT);
      |                 ^~~~~~~~~~~~ ~~~~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...e.py-scov_merge.py-switch-to-python3.patch |  2 +-
 ...ltp-pan-fix-wait_handler-declaration.patch | 47 +++++++++++++++++++
 .../recipes-support/mcelog/mce-test_git.bb    |  7 +--
 3 files changed, 52 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/mcelog/mce-test/0001-ltp-pan-fix-wait_handler-declaration.patch

diff --git a/meta-oe/recipes-support/mcelog/mce-test/0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch b/meta-oe/recipes-support/mcelog/mce-test/0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch
index 969bfc17cf..80b9ae23b3 100644
--- a/meta-oe/recipes-support/mcelog/mce-test/0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch
+++ b/meta-oe/recipes-support/mcelog/mce-test/0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] gcov_merge.py/scov_merge.py: switch to python3
 
 Make gcov_merge.py and scov_merge.py port to python3.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/andikleen/mce-test/pull/8]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
diff --git a/meta-oe/recipes-support/mcelog/mce-test/0001-ltp-pan-fix-wait_handler-declaration.patch b/meta-oe/recipes-support/mcelog/mce-test/0001-ltp-pan-fix-wait_handler-declaration.patch
new file mode 100644
index 0000000000..3b2e9502ae
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mce-test/0001-ltp-pan-fix-wait_handler-declaration.patch
@@ -0,0 +1,47 @@
+From 3f1f2d143a1e365bb0451609d08194756951099a Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Tue, 22 Apr 2025 18:03:24 +0000
+Subject: [PATCH] ltp-pan: fix wait_handler declaration
+
+to match definition in:
+tools/ltp-pan/ltp-pan.c:wait_handler( int sig )
+
+* fixes build with gcc-15:
+  http://errors.yoctoproject.org/Errors/Details/852857/
+
+ltp-pan.c: In function 'main':
+ltp-pan.c:459:19: error: assignment to '__sighandler_t' {aka 'void (*)(int)'} from incompatible pointer type 'void (*)(void)' [-Wincompatible-pointer-types]
+  459 |     sa.sa_handler = wait_handler;
+      |                   ^
+In file included from ltp-pan.c:67:
+zoolib.h:52:6: note: 'wait_handler' declared here
+   52 | void wait_handler();
+      |      ^~~~~~~~~~~~
+In file included from TOPDIR/tmp/work/core2-64-oe-linux/mce-test/20230601+git/recipe-sysroot/usr/include/sys/param.h:28,
+                 from ltp-pan.c:56:
+TOPDIR/tmp/work/core2-64-oe-linux/mce-test/20230601+git/recipe-sysroot/usr/include/signal.h:72:16: note: '__sighandler_t' declared here
+   72 | typedef void (*__sighandler_t) (int);
+      |                ^~~~~~~~~~~~~~
+ltp-pan.c:489:17: error: too many arguments to function 'wait_handler'; expected 0, have 1
+  489 |                 wait_handler(SIGINT);
+      |                 ^~~~~~~~~~~~ ~~~~~~
+
+Upstream-Status: Submitted [https://github.com/andikleen/mce-test/pull/9]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ tools/ltp-pan/zoolib.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/ltp-pan/zoolib.h b/tools/ltp-pan/zoolib.h
+index 8b4049e..34ce76f 100644
+--- a/tools/ltp-pan/zoolib.h
++++ b/tools/ltp-pan/zoolib.h
+@@ -49,7 +49,7 @@ extern char zoo_error[ZELEN];
+ int lock_file( FILE *fp, short ltype, char **errmsg );
+ /* FILE *open_file( char *file, char *mode, char **errmsg ); */
+ 
+-void wait_handler();
++void wait_handler(int sig);
+ 
+ /*  char *zoo_active( void ); */
+ /* zoo_getname(): create a filename to use for the zoo
diff --git a/meta-oe/recipes-support/mcelog/mce-test_git.bb b/meta-oe/recipes-support/mcelog/mce-test_git.bb
index c43651f6eb..c1661b5ed4 100644
--- a/meta-oe/recipes-support/mcelog/mce-test_git.bb
+++ b/meta-oe/recipes-support/mcelog/mce-test_git.bb
@@ -11,9 +11,10 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-test.git;protocol=git;branch=master \
-           file://makefile-remove-ldflags.patch \
-           file://0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch \
-          "
+    file://makefile-remove-ldflags.patch \
+    file://0001-gcov_merge.py-scov_merge.py-switch-to-python3.patch \
+    file://0001-ltp-pan-fix-wait_handler-declaration.patch \
+"
 SRCREV = "9d11fc3e05eae7b454efeb5941beded56f80445b"
 PV = "20230601+git"
 

