Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF364C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 00:45:04 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web08.14899.1665535494942744213
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Oct 2022 17:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bUkzn3xK;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso2369371pjq.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Oct 2022 17:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7CVVss3tVZveNOnIsfQEKFARQLTGkmVsyuiTIf6gIzQ=;
        b=bUkzn3xKcUeiAFUiKUo33lgiLdN8+W3GiEfxq5Ld7C9pKCJi8/bZTqmwadiTYt2jAd
         WIX0tJ1DphhJTeCJxwvYPgTeIOSwB+utz4JX2xdemmmLDZqzJKbEBnXz122OTKmoqvbd
         GBHM3BO+QN7Upaf12OcmQbQZ4bot1d3bOvmE2vKi4YDD7juA6aZ7NtARhNCCD8bQe6YY
         oF2g7hS1S9yir2m9XazluYwwg7sN5WHJSr88r+okRZID7XKVtRtlqYWUw7CRNS2zp+n5
         v4ThaoTe7KJkZZ4qslvZ2MZ6Smwquwx6Zk3pglkCT0cex7lKH3oVgSogbH6VPRo4IZz+
         tjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7CVVss3tVZveNOnIsfQEKFARQLTGkmVsyuiTIf6gIzQ=;
        b=pUNwmVJXTRonI480205ReHtUIfPKhjW0FAlY5QR2VuU7XdTQHNLBWOZUhRXwsYn499
         z5v7Sh27lXQ140GJbz/AC3BwfZJSAAYTwcRdZus+FztmOZKda0oGn1WNWcp6ujLiWULI
         L/RMjhGc+NUCee+Lg0q7L2HJaWUEdTD7HAe3v5ial7XhyC1LZbmS8vUbyMe3xXlZp2IY
         MiWsmSIfkP+rDgesJkRNHBuzpty9Ls9bQi7buMX7At+b+Hb/9rMQisPQILAV6flm8PBz
         yOOg1DMn87TBA6uJEzBRnAPcsBeLXMkz9zkHYJ8VIYzUbvNKcew537W3NNaHygyJC1RW
         2QGQ==
X-Gm-Message-State: ACrzQf1JVQtax8GvxiqdRl2cE5FryrJpdJnjwNw2KnuP+zeuD4Zk2Ghp
	zzvCGhA2xrlfNpVX8um5Bn6cMSDH3WMj3g==
X-Google-Smtp-Source: AMsMyM4IR6pIPmmvdb3ydqwJVf/MUxCAkkUD4wzvKeyPu4jnZvAQVI0n4yFDei7JxkSFYsJ4nQUc2w==
X-Received: by 2002:a17:90b:4c8b:b0:203:5db5:8b71 with SMTP id my11-20020a17090b4c8b00b002035db58b71mr2108584pjb.51.1665535493985;
        Tue, 11 Oct 2022 17:44:53 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::32cd])
        by smtp.gmail.com with ESMTPSA id h73-20020a62834c000000b0056164b52bd8sm9625579pfe.32.2022.10.11.17.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 17:44:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [meta-python][PATCH v2] python3-gevent: Upgrade to 22.8.0
Date: Tue, 11 Oct 2022 17:44:51 -0700
Message-Id: <20221012004451.317150-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 00:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99141

This has the python 3.11 fix in it so drop the patch
Add a patch to avoid adding native include paths to compiler cmdline

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>
---
v2: Fix native path inclusion issue

 ...setuputils.py-Do-not-add-sys_inc_dir.patch |  40 +++++
 .../python/python3-gevent/py-3.11.patch       | 170 ------------------
 ...nt_21.12.0.bb => python3-gevent_22.8.0.bb} |   6 +-
 3 files changed, 43 insertions(+), 173 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-gevent/py-3.11.patch
 rename meta-python/recipes-devtools/python/{python3-gevent_21.12.0.bb => python3-gevent_22.8.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch b/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
new file mode 100644
index 0000000000..ac8b031cf5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gevent/0001-_setuputils.py-Do-not-add-sys_inc_dir.patch
@@ -0,0 +1,40 @@
+From f3267ad7994a4b66e6bcf72cb0e418105f77bd52 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Oct 2022 17:37:01 -0700
+Subject: [PATCH] _setuputils.py: Do not add sys_inc_dir
+
+sys_inc_dir computes to ignore sysroot and ends with paths into host
+system include area, which is then flagged by OE gcc since it finds
+the host include path poisoning. Since we are adding the syroot anyway
+we really do not need setuptools to deduce it for us.
+
+Upstream-Status: Inappropriate [ Cross-compile specific ]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ _setuputils.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/_setuputils.py b/_setuputils.py
+index d98f716..31134a4 100644
+--- a/_setuputils.py
++++ b/_setuputils.py
+@@ -161,7 +161,6 @@ def get_include_dirs(*extra_paths):
+     # Neither sysconfig dir is not enough if we're in a virtualenv; the greenlet.h
+     # header goes into a site/ subdir. See https://github.com/pypa/pip/issues/4610
+     dist_inc_dir = os.path.abspath(dist_sysconfig.get_python_inc()) # 1
+-    sys_inc_dir = os.path.abspath(sysconfig.get_path("include")) # 2
+     venv_include_dir = os.path.join(
+         sys.prefix, 'include', 'site',
+         'python' + sysconfig.get_python_version()
+@@ -175,7 +174,7 @@ def get_include_dirs(*extra_paths):
+ 
+     return [
+         p
+-        for p in (dist_inc_dir, sys_inc_dir, dep_inc_dir) + extra_paths
++        for p in (dist_inc_dir, dep_inc_dir) + extra_paths
+         if os.path.exists(p)
+     ]
+ 
+-- 
+2.38.0
+
diff --git a/meta-python/recipes-devtools/python/python3-gevent/py-3.11.patch b/meta-python/recipes-devtools/python/python3-gevent/py-3.11.patch
deleted file mode 100644
index 6750c1a3cf..0000000000
--- a/meta-python/recipes-devtools/python/python3-gevent/py-3.11.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From 90e9169c915a640739880b55ed95f88ce21fa7b0 Mon Sep 17 00:00:00 2001
-From: Victor Stinner <vstinner@python.org>
-Date: Tue, 1 Mar 2022 22:28:40 +0100
-Subject: [PATCH] Add Python 3.11 alpha 6 support
-
-* On Python 3.11a6 and newer, get the PyFrameObject structure from
-  the internal C API ("internal/pycore_frame.h").
-* On Python 3.9 and newer, use PyFrame_GetBack() and
-  PyFrame_GetCode().
-* Add frame getter and setter functions to greenlet:
-
-  * get_f_code(frame)
-  * set_f_lineno(frame, lineno)
-  * set_f_code(frame, code)
-
-* greenlet.h: the CFrame type has been renamed to _PyCFrame.
-
-Upstream-Status: Submitted [https://github.com/gevent/gevent/pull/1872]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- _setuputils.py                   |  4 +++
- deps/greenlet/greenlet.h         |  6 +++-
- src/gevent/_gevent_cgreenlet.pxd | 59 ++++++++++++++++++++++++--------
- src/gevent/greenlet.py           |  7 ++--
- 4 files changed, 59 insertions(+), 17 deletions(-)
-
-diff --git a/_setuputils.py b/_setuputils.py
-index 7257b3eea..0b14ab1f0 100644
---- a/_setuputils.py
-+++ b/_setuputils.py
-@@ -244,6 +244,10 @@ def cythonize1(ext):
-                 'infer_types': True,
-                 'nonecheck': False,
-             },
-+            compile_time_env={
-+                'PY39B1': sys.hexversion >= 0x030900B1,
-+                'PY311A6': sys.hexversion >= 0x030B00A6,
-+            },
-             # The common_utility_include_dir (not well documented)
-             # causes Cython to emit separate files for much of the
-             # static support code. Each of the modules then includes
-diff --git a/deps/greenlet/greenlet.h b/deps/greenlet/greenlet.h
-index 830bef8dd..f07ce1833 100644
---- a/deps/greenlet/greenlet.h
-+++ b/deps/greenlet/greenlet.h
-@@ -14,6 +14,10 @@ extern "C" {
- /* This is deprecated and undocumented. It does not change. */
- #define GREENLET_VERSION "1.0.0"
- 
-+#if PY_VERSION_HEX < 0x30B00A6
-+#  define _PyCFrame CFrame
-+#endif
-+
- typedef struct _greenlet {
-     PyObject_HEAD
-     char* stack_start;
-@@ -39,7 +43,7 @@ typedef struct _greenlet {
-     PyObject* context;
- #endif
- #if PY_VERSION_HEX >= 0x30A00B1
--    CFrame* cframe;
-+    _PyCFrame* cframe;
- #endif
- } PyGreenlet;
- 
-diff --git a/src/gevent/_gevent_cgreenlet.pxd b/src/gevent/_gevent_cgreenlet.pxd
-index cbb81a638..246773e24 100644
---- a/src/gevent/_gevent_cgreenlet.pxd
-+++ b/src/gevent/_gevent_cgreenlet.pxd
-@@ -57,30 +57,61 @@ cdef extern from "Python.h":
-     ctypedef class types.CodeType [object PyCodeObject]:
-         pass
- 
--cdef extern from "frameobject.h":
--
--    ctypedef class types.FrameType [object PyFrameObject]:
--        cdef CodeType f_code
--        # Accessing the f_lineno directly doesn't work. There is an accessor
--        # function, PyFrame_GetLineNumber that is needed to turn the raw line number
--        # into the executing line number.
--        # cdef int f_lineno
--        # We can't declare this in the object as an object, because it's
--        # allowed to be NULL, and Cython can't handle that.
--        # We have to go through the python machinery to get a
--        # proper None instead, or use an inline function.
--        cdef void* f_back
-+IF PY311A6:
-+    cdef extern from "internal/pycore_frame.h":
-+        ctypedef class types._PyInterpreterFrame [object _PyInterpreterFrame]:
-+            cdef CodeType f_code
-+
-+        ctypedef class types.FrameType [object PyFrameObject]:
-+            cdef _PyInterpreterFrame f_frame
-+            # Accessing the f_lineno directly doesn't work. There is an accessor
-+            # function, PyFrame_GetLineNumber that is needed to turn the raw line number
-+            # into the executing line number.
-+            # cdef int f_lineno
-+            # We can't declare this in the object as an object, because it's
-+            # allowed to be NULL, and Cython can't handle that.
-+            # We have to go through the python machinery to get a
-+            # proper None instead, or use an inline function.
-+            cdef void* f_back
-+ELSE:
-+    cdef extern from "frameobject.h":
-+        ctypedef class types.FrameType [object PyFrameObject]:
-+            cdef CodeType f_code
-+            cdef void* f_back
- 
-+cdef extern from "frameobject.h":
-     int PyFrame_GetLineNumber(FrameType frame)
-+    IF PY39B1:
-+        CodeType PyFrame_GetCode(FrameType frame)
-+        void* PyFrame_GetBack(FrameType frame)
- 
- @cython.nonecheck(False)
- cdef inline FrameType get_f_back(FrameType frame):
-+    IF PY39B1:
-+        f_back = PyFrame_GetBack(frame)
-+    ELSE:
-+        f_back = frame.f_back
-     if frame.f_back != NULL:
--        return <FrameType>frame.f_back
-+        return <FrameType>f_back
- 
- cdef inline int get_f_lineno(FrameType frame):
-     return PyFrame_GetLineNumber(frame)
- 
-+cdef inline void set_f_lineno(FrameType frame, int lineno):
-+    frame.f_lineno = lineno
-+
-+cdef inline CodeType get_f_code(FrameType frame):
-+    IF PY39B1:
-+        return PyFrame_GetCode(frame)
-+    ELSE:
-+        return frame.f_code
-+
-+cdef inline void set_f_code(FrameType frame, CodeType code):
-+    IF PY311A6:
-+        frame.f_frame.f_code = code
-+    ELSE:
-+        frame.f_code = code
-+
- cdef void _init()
- 
- cdef class SpawnedLink:
-diff --git a/src/gevent/greenlet.py b/src/gevent/greenlet.py
-index bed12ed44..f925770bb 100644
---- a/src/gevent/greenlet.py
-+++ b/src/gevent/greenlet.py
-@@ -58,6 +58,9 @@
- # Frame access
- locals()['get_f_back'] = lambda frame: frame.f_back
- locals()['get_f_lineno'] = lambda frame: frame.f_lineno
-+locals()['set_f_lineno'] = lambda frame, lineno: setattr(frame, 'f_lineno', lineno)
-+locals()['get_f_code'] = lambda frame: frame.f_code
-+locals()['set_f_code'] = lambda frame, code: setattr(frame, 'f_code', code)
- 
- if _PYPY:
-     import _continuation # pylint:disable=import-error
-@@ -157,8 +160,8 @@ def _extract_stack(limit):
-         # Arguments are always passed to the constructor as Python objects,
-         # meaning we wind up boxing the f_lineno just to unbox it if we pass it.
-         # It's faster to simply assign once the object is created.
--        older_Frame.f_code = frame.f_code
--        older_Frame.f_lineno = get_f_lineno(frame) # pylint:disable=undefined-variable
-+        set_f_code(older_Frame.f_code, get_f_code(frame))
-+        set_f_lineno(older_Frame.f_lineno, get_f_lineno(frame)) # pylint:disable=undefined-variable
-         if newer_Frame is not None:
-             newer_Frame.f_back = older_Frame
-         newer_Frame = older_Frame
diff --git a/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb b/meta-python/recipes-devtools/python/python3-gevent_22.8.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_22.8.0.bb
index f891c2eeab..96a0cb78e2 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_22.8.0.bb
@@ -11,7 +11,9 @@ RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 		  ${PYTHON_PN}-pprint \
 		 "
 
-SRC_URI[sha256sum] = "f48b64578c367b91fa793bf8eaaaf4995cb93c8bc45860e473bf868070ad094e"
+SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch"
+
+SRC_URI[sha256sum] = "868d500fe2b7f9750eadc07ada8ab32360c0e71976be2bf5919482f14a6477c7"
 
 inherit pypi setuptools3
 
@@ -31,5 +33,3 @@ do_configure:append() {
 do_compile:append() {
         sed -i -e 's#${WORKDIR}##g' ${S}/src/gevent/*.c ${S}/src/gevent/libev/*.c ${S}/src/gevent/resolver/*.c
 }
-
-SRC_URI += "file://py-3.11.patch"
-- 
2.38.0


