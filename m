Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65098C369C2
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 07:08:55 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.44646.1746428929673166886
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 00:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BEGw27k+;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso16441545e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 00:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746428928; x=1747033728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fwZWDEU+HlTfQLXGxQupF41Zsglqu/Vqvc2ZT/0BFs=;
        b=BEGw27k+2RcySgulmHwLk22+MpjeWPwSZT/ZJp8NFX5UxWXnM6b/XWDr/q0MfgHJA6
         wmEOQGOTsY9Pwcj07m4FggXA706pvjbJXEEy/FqJYavrOfZ1MY+Ne+ZPwbsjzl12tCvk
         nX9gvzsmDqBskVFsL33n3xCu9J/t++RK25Kx1nWaTZs52l0iQdoF0G6OZmanW0MTa2rI
         ofWkLT0BiMjqxJ1bSqK5O19kKpf1tFip8wbhCs6Wjr16yheQlErAqKrblaIZC5ExEcnl
         DzrYq9XBiXo7YPdSJJlKhH69+pnx+isiYxjg9n9qhhuSFa7Bz0UHZkgVqk2yUuUtiNaJ
         Q5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746428928; x=1747033728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fwZWDEU+HlTfQLXGxQupF41Zsglqu/Vqvc2ZT/0BFs=;
        b=ujA/twrMP7xzS6J+DD+qBMTgNmue2QVSVdfWRFINssBDVUyCD1u0cZtm1TnyS4SVTt
         lFUM7CICNPknSTj7I522/crHu5OU4wuFVVr20ZHwyaCLoYpMO+mqCUWpt/Z+dyzUxmjm
         iM6h3LkKwepADg2/eYXPiiZD88c0N75RRV6SxRX2kzh91+RIAwmCtVr++pCByKukm1IT
         3AjWZS9rjaaRQ8CLLrwFpxzNr9UzskGB2uf/ZRd6TKJ4O93xUfALngJV4+/hQrf4GZU2
         8UdBYhSx7svNbxeQF+6roLB/DUC7F1bnjsR777HpjOGSbFbgMfR0EhN2JOn0IXjNufiz
         Q0Ew==
X-Gm-Message-State: AOJu0YyuBGyv0TdkpeJvMhyWbQzRbm7iCmTMMsvNoypiLnmUL5qDxyO5
	ax1swfnPOjklaW5qZ51pCScq7l2tIo7RQUoZmCcGaB2JicfOb3Co4+xLDQ==
X-Gm-Gg: ASbGncs8Lz+AyepL0R4K6jLbaQCGgS+ufBRQX4WeK+E/ZLmH3wCsLzIEO6hyIglYn8J
	dB8uhxsVdUQMj6MaAUBNA8TO7ZCOb4qTjmYbwOTOaZOHY3xpYWjDxDxi2Rw48hSgL4Cxv57/Fv4
	xnVh637gYj6XbwapzbJ24CYKxyFj6ZV6FWv2SRhxTg7KOfFE47lTQ2KMp346tB9Ye2NboWIOBnW
	F/Ua9g0qLAmC1MEQC+VsiEFh4bZjkZ/zos9WYCr96K9tz8fzeBnyKRO3HEjL0qfnt2fkozGKJGw
	97d1Rea3IG5EG83DYUinPhsU5BnpBPwTjql4CXdH+1ljfqOCAEsaz0a2vOLCcFmTKKZtU/L8Cg=
	=
X-Google-Smtp-Source: AGHT+IEb1EFoCt9WO5QJir2JALR7pLj5wYaZSThDzegEqIEh72WVo/5uDcufsdZGbON4T5FNHvtgEA==
X-Received: by 2002:a05:600c:b96:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-441c48bdf8emr53254685e9.10.1746428927704;
        Mon, 05 May 2025 00:08:47 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b89ed4f5sm124023265e9.18.2025.05.05.00.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:08:46 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] python3-posix-ipc: improve build_support
Date: Mon,  5 May 2025 09:07:56 +0200
Message-ID: <20250505070757.63856-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 07:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117298

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
index b3da09c35b..05a73f2896 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -9,4 +9,9 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 SRC_URI[sha256sum] = "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529ebc881cfb2aedb3838"
 
+SRC_URI += " \
+    file://0001-build_support-use-source-filename-instead-of-foo-for.patch \
+    file://0002-build_support-handle-empty-max_priority-value-as-Non.patch \
+    file://0003-build_support-use-does_build_succeed-in-compile_and_.patch \
+"
 inherit pypi python_setuptools_build_meta

