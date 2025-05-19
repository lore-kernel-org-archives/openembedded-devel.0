Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B246C3DA6D
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 08:18:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.46274.1747642687719661139
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 May 2025 01:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ivBUUuF6;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-441c99459e9so24518415e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747642686; x=1748247486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DKcS9Xel5rDawbkP4z6e8eOfoE7wKqKRP17e2blLoPQ=;
        b=ivBUUuF6aHlrxexUpQzrij3nUYdjq4VEEfLfDCaQvU4Z4tM0WFmiUpjJHKbC6jgL2+
         NReY+lW5nr0Mnk5Bf8fBGNqtHVwvGi6uCTlb6KoTch1FJGgV+3gsTqK09Gj4OVwp4qN7
         z9xGEL9g980gNtYMK8injgxoETxNkLDtZmdgjP5/yJf5sEWTxBKJ8y33mwFNKwMnbq72
         1nNaaIngUQUmLdZ3v+51nO2dz+RlC0CtgMrOY2eh3DkmIDiexIS2W+RuJynW1tc7Ijcw
         Y5sxMz4IDO0PLEidOZQWqGwKO8NLDuKhV8bZGjRyshv/YV0ER6HPS+Z0jTFJNLFsqyLW
         eD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642686; x=1748247486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKcS9Xel5rDawbkP4z6e8eOfoE7wKqKRP17e2blLoPQ=;
        b=PT39el02sX+BmLeQoqnrX12DTBDqr2dnJhDHkurgH88Ho1Z1nqW4VMartoriK46fDl
         uILvyizdaUMeN6BgdC83G80kpQeG9V1+glEnS/9SizOR7punbkUklVQj36WxRoOEmOty
         pvucilc6fS1L3wOwCqowaxLz32B/wCSUcZMU6q8Q8SWzMtqyNiOF+D8sj3Qby/EC6O4+
         DD/NPXIF5xYSw/StMRk+UOjef7UacSMpvtfQollgipzgV5xDaxiC4rCyyw0YYrIvV0vM
         bZJSUtbm9LzJR9yXpUmiO10RIQ52NRzPuOmZaKerzq9oZ9hgvFaZEiHAqwFEtwueVBEY
         qJ6w==
X-Gm-Message-State: AOJu0Yw3ZaVVWt/WwNPPZd4HEp7zgoSZkSPWggFdSBlmr6Skda8UFYJA
	MwpvlqYpGQ0V7KSmrJgVfkaT5/JWqKpv5/EfJ9xlyu93qh6vC2WYhGTLxzJaiw==
X-Gm-Gg: ASbGncv97724T/DxLfYfyEVWAOaUi49F0oNY0QrkkyUCa2AXUkU823RTDJIBvRfPC/j
	kqAD8ytcUAZnu4OKuT/jBbx7J+7duz1xFqcaaY2mBTDH2nBDMH6LEjF7PAnPATymX67Q46L7gLb
	M1NwhXPnDtTUJlj7VZmZe17T13TUHe/niXHA1cUgGSxkm1kjG+l81BHuUy5kcWSW5O869tymgSU
	wITumUukbqyejha21AUfmgwHdmGuagHnJzTfz7m+fjNRANPB/jB/YH2//Pbmkv2gAZgFPXQ/K0s
	Jfwr+BJWaNEX7D6+sLhaL7yB7/JOKtnyvJ7jZXpBWjyNQBLVw/ISmI3eeqHM60iDKq8pcS07lEL
	SuFr7n5J7
X-Google-Smtp-Source: AGHT+IHGOjNDSvFSxdRUEfdlD/SLq8oErZlMXKa9zRMCFktUy2oJ+NrjKkoTRMAPnQbzcOdHl1fTZQ==
X-Received: by 2002:a05:600c:5247:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-442fd60b4e8mr90896795e9.6.1747642685763;
        Mon, 19 May 2025 01:18:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a35ca8cf66sm11691022f8f.87.2025.05.19.01.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:18:05 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] python3-posix-ipc: improve build_support
Date: Mon, 19 May 2025 10:18:02 +0200
Message-ID: <20250519081804.685926-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 08:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117473

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
  https://lists.openembedded.org/g/openembedded-devel/message/117255

DEBUG: Executing shell function do_compile
* Getting build dependencies for wheel...
/usr/lib/ld-linux-aarch64.so.1: No such file or directory
Traceback (most recent call last):
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py",
line 389, in <module>
    main()
    ~~~~^^
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py",
line 373, in main
    json_out["return_val"] = hook(**hook_input["kwargs"])
                             ~~~~^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/pyproject_hooks/_in_process/_in_process.py",
line 143, in get_requires_for_build_wheel
    return hook(config_settings)
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/build_meta.py",
line 334, in get_requires_for_build_wheel
    return self._get_build_requires(config_settings, requirements=[])
           ~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/build_meta.py",
line 304, in _get_build_requires
    self.run_setup()
    ~~~~~~~~~~~~~~^^
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/build_meta.py",
line 320, in run_setup
    exec(code, locals())
    ~~~~^^^^^^^^^^^^^^^^
  File "<string>", line 23, in <module>
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/posix_ipc-1.2.0/build_support/discover_system_info.py",
line 409, in discover
    d["QUEUE_PRIORITY_MAX"] = sniff_mq_prio_max()
                              ~~~~~~~~~~~~~~~~~^^
  File "TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/posix_ipc-1.2.0/build_support/discover_system_info.py",
line 238, in sniff_mq_prio_max
    if max_priority < 0:
       ^^^^^^^^^^^^^^^^
TypeError: '<' not supported between instances of 'str' and 'int'

ERROR Backend subprocess exited when trying to invoke
get_requires_for_build_wheel
WARNING: TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/temp/run.do_compile.2736023:168
exit 1 from 'nativepython3 -m build --no-isolation --wheel --outdir
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/dist
TOPDIR/BUILD/work/raspberrypi4_64-webos-linux/python3-posix-ipc/1.2.0/posix_ipc-1.2.0'
WARNING: Backtrace (BB generated script):

On some hosts.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-source-filename-instead-of-foo-for.patch | 50 +++++++++++++++
 ...ndle-empty-max_priority-value-as-Non.patch | 49 +++++++++++++++
 ...e-does_build_succeed-in-compile_and_.patch | 62 +++++++++++++++++++
 .../python/python3-posix-ipc_1.2.0.bb         |  5 ++
 4 files changed, 166 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-use-source-filename-instead-of-foo-for.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0002-build_support-handle-empty-max_priority-value-as-Non.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0003-build_support-use-does_build_succeed-in-compile_and_.patch

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-use-source-filename-instead-of-foo-for.patch b/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-use-source-filename-instead-of-foo-for.patch
new file mode 100644
index 0000000000..8bb7267086
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_support-use-source-filename-instead-of-foo-for.patch
@@ -0,0 +1,50 @@
+From 09cfcf7de2aab873a13949d5a128ccfb9e54732d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Mon, 5 May 2025 08:15:37 +0200
+Subject: [PATCH] build_support: use source filename instead of 'foo' for
+ discover tests
+
+* helps when debugging the issues
+* use the same order of CC arguments in compile_and_run and
+  does_build_succeed just for consistency
+* use pthread in both compile_and_run and does_build_succeed functions
+  it was added only to does_build_succeed in 5ec39f7af8cfd8525d225b1302fa93f7133b3849
+  not sure if it was intentional
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/77]
+---
+ build_support/discover_system_info.py | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/build_support/discover_system_info.py b/build_support/discover_system_info.py
+index bc4d174..6d059d9 100644
+--- a/build_support/discover_system_info.py
++++ b/build_support/discover_system_info.py
+@@ -60,7 +60,7 @@ def does_build_succeed(filename, linker_options=""):
+     #     Rather than testing whether or not it's needed, I just specify it
+     #     everywhere since it's harmless to specify it when it's not needed.
+     cc = os.getenv("CC", "cc")
+-    cmd = "%s -Wall -o ./build_support/src/foo ./build_support/src/%s %s -lpthread" % (cc, filename, linker_options)
++    cmd = "%s -Wall -o ./build_support/src/%s ./build_support/src/%s %s -lpthread" % (cc, filename[:-2], filename, linker_options)
+ 
+     p = subprocess.Popen(cmd, shell=True, stdout=STDOUT, stderr=STDERR)
+ 
+@@ -73,7 +73,7 @@ def compile_and_run(filename, linker_options=""):
+     # Utility function that returns the stdout output from running the
+     # compiled source file; None if the compile fails.
+     cc = os.getenv("CC", "cc")
+-    cmd = "%s -Wall -o ./build_support/src/foo %s ./build_support/src/%s" % (cc, linker_options, filename)
++    cmd = "%s -Wall -o ./build_support/src/%s ./build_support/src/%s %s -lpthread" % (cc, filename[:-2], filename, linker_options)
+ 
+     p = subprocess.Popen(cmd, shell=True, stdout=STDOUT, stderr=STDERR)
+ 
+@@ -82,7 +82,7 @@ def compile_and_run(filename, linker_options=""):
+         return None
+     
+     try:
+-        s = subprocess.Popen(["./build_support/src/foo"],
++        s = subprocess.Popen(["./build_support/src/%s" % filename[:-2]],
+                              stdout=subprocess.PIPE).communicate()[0]
+         return s.strip().decode()
+     except Exception:
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0002-build_support-handle-empty-max_priority-value-as-Non.patch b/meta-python/recipes-devtools/python/python3-posix-ipc/0002-build_support-handle-empty-max_priority-value-as-Non.patch
new file mode 100644
index 0000000000..54c8ddaba7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0002-build_support-handle-empty-max_priority-value-as-Non.patch
@@ -0,0 +1,49 @@
+From 8fc46d871639dbe799f6ff0a61b046412ef5dcc6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Mon, 5 May 2025 08:16:30 +0200
+Subject: [PATCH] build_support: handle empty max_priority value as None
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When cross-compiling these tests they fail when the host cannot execute
+the binaries built for target.
+
+On my local ubuntu-22.04 docker container running
+build_support/src/sniff_mq_prio_max results in:
+posix_ipc-1.2.0 $ ./build_support/src/foo
+bash: ./build_support/src/foo: cannot execute binary file: Exec format error
+which triggers the Exception in compile_and_run and returns None
+
+While on some other ubuntu-22.04 containers I see:
+posix_ipc-1.2.0$ ./build_support/src/sniff_mq_prio_max
+/usr/lib/ld-linux-aarch64.so.1: No such file or directory
+
+and the compile_and_run returns
+b''
+which then causes
+posix_ipc-1.2.0/build_support/discover_system_info.py", line 244, in sniff_mq_prio_max
+    if max_priority < 0:
+       ^^^^^^^^^^^^^^^^
+
+Handle the empty value the same as None to avoid this.
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/77]
+---
+ build_support/discover_system_info.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build_support/discover_system_info.py b/build_support/discover_system_info.py
+index 6d059d9..f8a3c83 100644
+--- a/build_support/discover_system_info.py
++++ b/build_support/discover_system_info.py
+@@ -223,7 +223,7 @@ def sniff_mq_prio_max():
+         except ValueError:
+             max_priority = None
+ 
+-    if max_priority is None:
++    if not max_priority:
+         # Looking for a #define didn't work; ask sysconf() instead.
+         # Note that sys.sysconf_names doesn't exist under Cygwin.
+         if hasattr(os, "sysconf_names") and \
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0003-build_support-use-does_build_succeed-in-compile_and_.patch b/meta-python/recipes-devtools/python/python3-posix-ipc/0003-build_support-use-does_build_succeed-in-compile_and_.patch
new file mode 100644
index 0000000000..b36d1cdb3a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0003-build_support-use-does_build_succeed-in-compile_and_.patch
@@ -0,0 +1,62 @@
+From 760374e778fc28193cfea1416a739e206f9201c6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Mon, 5 May 2025 08:28:56 +0200
+Subject: [PATCH] build_support: use does_build_succeed in compile_and_run
+
+* avoid the duplication and building the sniff_mq_prio_max.c twice
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/77]
+---
+ build_support/discover_system_info.py | 27 ++++++++++-----------------
+ 1 file changed, 10 insertions(+), 17 deletions(-)
+
+diff --git a/build_support/discover_system_info.py b/build_support/discover_system_info.py
+index f8a3c83..f6e6c8c 100644
+--- a/build_support/discover_system_info.py
++++ b/build_support/discover_system_info.py
+@@ -72,22 +72,17 @@ def does_build_succeed(filename, linker_options=""):
+ def compile_and_run(filename, linker_options=""):
+     # Utility function that returns the stdout output from running the
+     # compiled source file; None if the compile fails.
+-    cc = os.getenv("CC", "cc")
+-    cmd = "%s -Wall -o ./build_support/src/%s ./build_support/src/%s %s -lpthread" % (cc, filename[:-2], filename, linker_options)
+-
+-    p = subprocess.Popen(cmd, shell=True, stdout=STDOUT, stderr=STDERR)
+-
+-    if p.wait():
++    if does_build_succeed(filename, linker_options=""):
++        try:
++            s = subprocess.Popen(["./build_support/src/%s" % filename[:-2]],
++                                 stdout=subprocess.PIPE).communicate()[0]
++            return s.strip().decode()
++        except Exception:
++            # execution resulted in an error
++            return None
++    else:
+         # uh-oh, compile failed
+         return None
+-    
+-    try:
+-        s = subprocess.Popen(["./build_support/src/%s" % filename[:-2]],
+-                             stdout=subprocess.PIPE).communicate()[0]
+-        return s.strip().decode()
+-    except Exception:
+-        # execution resulted in an error
+-        return None
+ 
+ 
+ def get_sysctl_value(name):
+@@ -211,11 +206,9 @@ def sniff_mq_prio_max():
+     # ref: http://www.opengroup.org/onlinepubs/009695399/basedefs/limits.h.html
+     DEFAULT_PRIORITY_MAX = 32
+ 
+-    max_priority = None
+     # OS X up to and including 10.8 doesn't support POSIX messages queues and
+     # doesn't define MQ_PRIO_MAX. Maybe this aggravation will cease in 10.9?
+-    if does_build_succeed("sniff_mq_prio_max.c"):
+-        max_priority = compile_and_run("sniff_mq_prio_max.c")
++    max_priority = compile_and_run("sniff_mq_prio_max.c")
+ 
+     if max_priority:
+         try:
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index e314bb8e3b..8147e4108b 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -8,4 +8,9 @@ PYPI_PACKAGE = "posix_ipc"
 
 SRC_URI[sha256sum] = "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529ebc881cfb2aedb3838"
 
+SRC_URI += " \
+    file://0001-build_support-use-source-filename-instead-of-foo-for.patch \
+    file://0002-build_support-handle-empty-max_priority-value-as-Non.patch \
+    file://0003-build_support-use-does_build_succeed-in-compile_and_.patch \
+"
 inherit pypi python_setuptools_build_meta

