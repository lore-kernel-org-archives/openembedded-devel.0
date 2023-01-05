Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A650C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 15:00:12 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.14654.1672930806822558738
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 07:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PO+I2T8z;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id z16so19907496wrw.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 07:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WG8vb4Xu84JIUvXOwmOGUGLeugjW3csNn5a4xh+Z3QY=;
        b=PO+I2T8zIHYEnxV5oW2i8FhextqmcdtsTyeqepOKLcVbsMm1l4to2uEAQPfSgSWLNF
         Em1rGeNZC7DWzeXefAz7qryHc11oLi80VlEjgk5E0Ildf4tD8J6/UDzt9bLhe9+Ex/VP
         sjF+aspBHhjhlEELLDxnrjOF1Lls7T28vzFL5IgoNLYsDrS7vq3tO/xRSYmngq6ZWjbx
         behdbIMq9XNsAYK0DhMuhONdikLHLIr5irBiMUiYVBfLKvHyOG9iqheNmt1CO0z7R71i
         sCdn0R8scDxcWHeKvGz/u8RL61ll9z9VWkJHaVeIatb0rpIg31qquus2G8CdrrOSiorv
         tPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WG8vb4Xu84JIUvXOwmOGUGLeugjW3csNn5a4xh+Z3QY=;
        b=BRhDaohr5YxzfA2h7jSlIkhCdC01UXML9wmtamDWMpnH8luxqGZRh8pF4/L0NpzlqU
         Ivr/22hraWtbyqxT+JPx696uOyDIvoReeKQzzCrnV50f2HDGHJjpMj5qFq3whOSH26Ls
         om8yS0aZBzwZyOFYiygwXI/cHg8B4WPAJUeLbwR9jqjysKR9qjjkJIxe7zyXM3yg1g5X
         ionrX8ESwnlbGQhg0geJ/nWJSmjIcN9ix/bW+OcbdQmmC75GMmqTSif1QpMZNhSfgzUP
         rwU1rHujYrXyR/sYQ6GjxgujuiceJmVqVibnw0ZHM80P+UloEplFEQXzSGma7moXXhfX
         Q6ng==
X-Gm-Message-State: AFqh2kqv5zR6J3Ow5tQsInOdOBn2+gvk+uof1bpou+HaXo/NoyeLn/w5
	UZE6jTSf2LMp9N5F46jnghc0G2v6uP4=
X-Google-Smtp-Source: AMrXdXtSaRjL8HfRH4WqOLvC5H4evS+ueW/2NlqoW14IV6h+g1ESXrq41b7ILCwUhJ1v0Y2OcPtp6Q==
X-Received: by 2002:adf:de04:0:b0:29a:f48:770a with SMTP id b4-20020adfde04000000b0029a0f48770amr9491208wrm.40.1672930805275;
        Thu, 05 Jan 2023 07:00:05 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z1-20020adfdf81000000b00268aae5fb5bsm36667282wrl.3.2023.01.05.07.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 07:00:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] nftables: fix builds with latest setuptools
Date: Thu,  5 Jan 2023 16:00:00 +0100
Message-Id: <20230105150000.1065209-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 15:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100415

Using a private module from setuptools is not a good idea and
no longer works with latest setuptools.

it's actually better to revert to official distutils even if
it is going away in the next python release. Hopefully by
then upstream will transition to something supported.

TMPDIR in .pyc can be addressed by simply not installing the .pyc.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...tables-python-Split-root-from-prefix.patch | 44 -------------------
 .../recipes-filter/nftables/nftables_1.0.6.bb |  6 ++-
 2 files changed, 5 insertions(+), 45 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-nftables-python-Split-root-from-prefix.patch

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-nftables-python-Split-root-from-prefix.patch b/meta-networking/recipes-filter/nftables/nftables/0001-nftables-python-Split-root-from-prefix.patch
deleted file mode 100644
index 377b29fff..000000000
--- a/meta-networking/recipes-filter/nftables/nftables/0001-nftables-python-Split-root-from-prefix.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c7513195a72b2e5be5c9c439cc606eb5dcc3fb7a Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Tue, 12 Jul 2022 17:44:34 +0100
-Subject: [PATCH] nftables: python: Split root from prefix
-
-The buildpaths QA check fails when python is enabled:
-
-  WARNING: nftables-1.0.4-r0 do_package_qa: QA Issue: File /usr/lib/python3.10/site-packages/nftables/__pycache__/nftables.cpython-310.pyc in package nftables-python contains reference to TMPDIR
-  File /usr/lib/python3.10/site-packages/nftables/__pycache__/__init__.cpython-310.pyc in package nftables-python contains reference to TMPDIR [buildpaths]
-
-Upstream-Status: Pending
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- py/Makefile.am | 2 +-
- py/setup.py    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/py/Makefile.am b/py/Makefile.am
-index 215ecd9e4751..a827cca10135 100644
---- a/py/Makefile.am
-+++ b/py/Makefile.am
-@@ -7,7 +7,7 @@ all-local:
- install-exec-local:
- 	cd $(srcdir) && \
- 		$(PYTHON_BIN) setup.py build --build-base $(abs_builddir) \
--		install --prefix $(DESTDIR)$(prefix)
-+		install --root $(DESTDIR) --prefix $(prefix)
- 
- uninstall-local:
- 	rm -rf $(DESTDIR)$(prefix)/lib*/python*/site-packages/nftables
-diff --git a/py/setup.py b/py/setup.py
-index 72fc8fd98b26..976aec583b71 100755
---- a/py/setup.py
-+++ b/py/setup.py
-@@ -1,5 +1,5 @@
- #!/usr/bin/env python
--from distutils.core import setup
-+from setuptools._distutils.core import setup
- from nftables import NFTABLES_VERSION
- 
- setup(name='nftables',
--- 
-2.35.1
-
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.6.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.6.bb
index 789a49312..fb9c6e7d6 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.6.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.6.bb
@@ -7,7 +7,6 @@ DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
-           file://0001-nftables-python-Split-root-from-prefix.patch \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "2407430ddd82987670e48dc2fda9e280baa8307abec04ab18d609df3db005e4c"
@@ -40,6 +39,11 @@ TESTDIR = "tests"
 
 PRIVATE_LIBS:${PN}-ptest:append = "libnftables.so.1"
 
+do_install:append() {
+    # Avoid "contains reference to TMPDIR" warning
+    find ${D} -name *.pyc -delete
+}
+
 do_install_ptest() {
     cp -rf ${S}/build-aux ${D}${PTEST_PATH}
     cp -rf ${S}/src ${D}${PTEST_PATH}
-- 
2.30.2


