Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E9AC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 09:40:04 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.21729.1664962798467306906
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 02:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pc5qPaaN;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id j16so13136030wrh.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 02:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uAK/am4t0fQGFgRZHqJomGg3IbRhceqEpWWrZCy9vE0=;
        b=pc5qPaaNgmoNvaI/WT2KCitVIF7XA29d4cusuDRHzLArcI268DF9J1vQyZtUOboz99
         KL0/XDYB6WEs2IHVSe7uybh4WybWKhXJM5N6ph5kYAaymF+5RKGi2OrIfxIear1YzZxR
         zPXSanru5pdKf5Yof8Iat72QvLdPP/ZdBrtD9OmIPflhnQ1hKgNzbb4z5Bw0eY5q8UMR
         EI0oJXc7GQ6cW1XsyFYVT9Si80YU2CPmSWzFhgTiAlBg1PfhTgyy9YlR98HsPtdiyNtR
         4UJfDFkloASA7iRAzwIV2eyTDKHtP1DS9YtDMYDYh7xmNTfVBpXPeYwDvyFBMgETGAeP
         oQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uAK/am4t0fQGFgRZHqJomGg3IbRhceqEpWWrZCy9vE0=;
        b=IXAghuYC77Su1F7zK5CQHYOZqF9RTlukO31mhZVdLcusePHJ1NoVhJ4xju1wBlRLxL
         Uy9fAC3YEPktsNSyS4CXpof7nScDMr2YJ7pQ0sJXBxS68jAD9s6bgwoN2yJ+9M++RnJY
         GC8h6UoyYvxHrP/LodjYGJ6rUzYAg8H53lyB1ymy8EZy7QS+Jj+Sb0B8R0T7y0dXbyqh
         /sWJOgfZHmiwPT08d2VglaZMg+GOe5GRzD+ILntgZRD9oKAhebDMchlIA5R7JaxA+306
         Ry6fnFik49EvLhwA6AnGp/+ciksEC/kxX3macxJXCQuB4GuPvdMmPhSxnLr9uT/TsIRO
         LP1w==
X-Gm-Message-State: ACrzQf2gkA8VhjRnyNUl3ZtSLoOKoHSVDe7Z022hTsGTHuroY4el+IC0
	KxRdKXy7rMTQxyiCrzTNwebIsu/f7A0=
X-Google-Smtp-Source: 
 AMsMyM477te+CsXy+8lTaOLpcnWfo8FZaLewcf5EDpAX84+4Nylv0GUZ0k2bg/8RBlVEhkJHNs54DA==
X-Received: by 2002:adf:d20c:0:b0:22e:3347:cf5b with SMTP id
 j12-20020adfd20c000000b0022e3347cf5bmr11321153wrh.517.1664962796759;
        Wed, 05 Oct 2022 02:39:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 d10-20020a5d6dca000000b0022917d58603sm14641736wrz.32.2022.10.05.02.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 02:39:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] python3-gevent: make compatible with python 3.11
Date: Wed,  5 Oct 2022 11:39:48 +0200
Message-Id: <20221005093949.1527779-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221005093949.1527779-1-alex@linutronix.de>
References: <20221005093949.1527779-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Oct 2022 09:40:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99066

Force regeneration of cython files in particular
(and strip build paths out of them afterwards).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-gevent/py-3.11.patch       | 170 ++++++++++++++++++
 .../python/python3-gevent_21.12.0.bb          |  13 +-
 2 files changed, 181 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-gevent/py-3.11.patch

diff --git a/meta-python/recipes-devtools/python/python3-gevent/py-3.11.patch b/meta-python/recipes-devtools/python/python3-gevent/py-3.11.patch
new file mode 100644
index 000000000..6750c1a3c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gevent/py-3.11.patch
@@ -0,0 +1,170 @@
+From 90e9169c915a640739880b55ed95f88ce21fa7b0 Mon Sep 17 00:00:00 2001
+From: Victor Stinner <vstinner@python.org>
+Date: Tue, 1 Mar 2022 22:28:40 +0100
+Subject: [PATCH] Add Python 3.11 alpha 6 support
+
+* On Python 3.11a6 and newer, get the PyFrameObject structure from
+  the internal C API ("internal/pycore_frame.h").
+* On Python 3.9 and newer, use PyFrame_GetBack() and
+  PyFrame_GetCode().
+* Add frame getter and setter functions to greenlet:
+
+  * get_f_code(frame)
+  * set_f_lineno(frame, lineno)
+  * set_f_code(frame, code)
+
+* greenlet.h: the CFrame type has been renamed to _PyCFrame.
+
+Upstream-Status: Submitted [https://github.com/gevent/gevent/pull/1872]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ _setuputils.py                   |  4 +++
+ deps/greenlet/greenlet.h         |  6 +++-
+ src/gevent/_gevent_cgreenlet.pxd | 59 ++++++++++++++++++++++++--------
+ src/gevent/greenlet.py           |  7 ++--
+ 4 files changed, 59 insertions(+), 17 deletions(-)
+
+diff --git a/_setuputils.py b/_setuputils.py
+index 7257b3eea..0b14ab1f0 100644
+--- a/_setuputils.py
++++ b/_setuputils.py
+@@ -244,6 +244,10 @@ def cythonize1(ext):
+                 'infer_types': True,
+                 'nonecheck': False,
+             },
++            compile_time_env={
++                'PY39B1': sys.hexversion >= 0x030900B1,
++                'PY311A6': sys.hexversion >= 0x030B00A6,
++            },
+             # The common_utility_include_dir (not well documented)
+             # causes Cython to emit separate files for much of the
+             # static support code. Each of the modules then includes
+diff --git a/deps/greenlet/greenlet.h b/deps/greenlet/greenlet.h
+index 830bef8dd..f07ce1833 100644
+--- a/deps/greenlet/greenlet.h
++++ b/deps/greenlet/greenlet.h
+@@ -14,6 +14,10 @@ extern "C" {
+ /* This is deprecated and undocumented. It does not change. */
+ #define GREENLET_VERSION "1.0.0"
+ 
++#if PY_VERSION_HEX < 0x30B00A6
++#  define _PyCFrame CFrame
++#endif
++
+ typedef struct _greenlet {
+     PyObject_HEAD
+     char* stack_start;
+@@ -39,7 +43,7 @@ typedef struct _greenlet {
+     PyObject* context;
+ #endif
+ #if PY_VERSION_HEX >= 0x30A00B1
+-    CFrame* cframe;
++    _PyCFrame* cframe;
+ #endif
+ } PyGreenlet;
+ 
+diff --git a/src/gevent/_gevent_cgreenlet.pxd b/src/gevent/_gevent_cgreenlet.pxd
+index cbb81a638..246773e24 100644
+--- a/src/gevent/_gevent_cgreenlet.pxd
++++ b/src/gevent/_gevent_cgreenlet.pxd
+@@ -57,30 +57,61 @@ cdef extern from "Python.h":
+     ctypedef class types.CodeType [object PyCodeObject]:
+         pass
+ 
+-cdef extern from "frameobject.h":
+-
+-    ctypedef class types.FrameType [object PyFrameObject]:
+-        cdef CodeType f_code
+-        # Accessing the f_lineno directly doesn't work. There is an accessor
+-        # function, PyFrame_GetLineNumber that is needed to turn the raw line number
+-        # into the executing line number.
+-        # cdef int f_lineno
+-        # We can't declare this in the object as an object, because it's
+-        # allowed to be NULL, and Cython can't handle that.
+-        # We have to go through the python machinery to get a
+-        # proper None instead, or use an inline function.
+-        cdef void* f_back
++IF PY311A6:
++    cdef extern from "internal/pycore_frame.h":
++        ctypedef class types._PyInterpreterFrame [object _PyInterpreterFrame]:
++            cdef CodeType f_code
++
++        ctypedef class types.FrameType [object PyFrameObject]:
++            cdef _PyInterpreterFrame f_frame
++            # Accessing the f_lineno directly doesn't work. There is an accessor
++            # function, PyFrame_GetLineNumber that is needed to turn the raw line number
++            # into the executing line number.
++            # cdef int f_lineno
++            # We can't declare this in the object as an object, because it's
++            # allowed to be NULL, and Cython can't handle that.
++            # We have to go through the python machinery to get a
++            # proper None instead, or use an inline function.
++            cdef void* f_back
++ELSE:
++    cdef extern from "frameobject.h":
++        ctypedef class types.FrameType [object PyFrameObject]:
++            cdef CodeType f_code
++            cdef void* f_back
+ 
++cdef extern from "frameobject.h":
+     int PyFrame_GetLineNumber(FrameType frame)
++    IF PY39B1:
++        CodeType PyFrame_GetCode(FrameType frame)
++        void* PyFrame_GetBack(FrameType frame)
+ 
+ @cython.nonecheck(False)
+ cdef inline FrameType get_f_back(FrameType frame):
++    IF PY39B1:
++        f_back = PyFrame_GetBack(frame)
++    ELSE:
++        f_back = frame.f_back
+     if frame.f_back != NULL:
+-        return <FrameType>frame.f_back
++        return <FrameType>f_back
+ 
+ cdef inline int get_f_lineno(FrameType frame):
+     return PyFrame_GetLineNumber(frame)
+ 
++cdef inline void set_f_lineno(FrameType frame, int lineno):
++    frame.f_lineno = lineno
++
++cdef inline CodeType get_f_code(FrameType frame):
++    IF PY39B1:
++        return PyFrame_GetCode(frame)
++    ELSE:
++        return frame.f_code
++
++cdef inline void set_f_code(FrameType frame, CodeType code):
++    IF PY311A6:
++        frame.f_frame.f_code = code
++    ELSE:
++        frame.f_code = code
++
+ cdef void _init()
+ 
+ cdef class SpawnedLink:
+diff --git a/src/gevent/greenlet.py b/src/gevent/greenlet.py
+index bed12ed44..f925770bb 100644
+--- a/src/gevent/greenlet.py
++++ b/src/gevent/greenlet.py
+@@ -58,6 +58,9 @@
+ # Frame access
+ locals()['get_f_back'] = lambda frame: frame.f_back
+ locals()['get_f_lineno'] = lambda frame: frame.f_lineno
++locals()['set_f_lineno'] = lambda frame, lineno: setattr(frame, 'f_lineno', lineno)
++locals()['get_f_code'] = lambda frame: frame.f_code
++locals()['set_f_code'] = lambda frame, code: setattr(frame, 'f_code', code)
+ 
+ if _PYPY:
+     import _continuation # pylint:disable=import-error
+@@ -157,8 +160,8 @@ def _extract_stack(limit):
+         # Arguments are always passed to the constructor as Python objects,
+         # meaning we wind up boxing the f_lineno just to unbox it if we pass it.
+         # It's faster to simply assign once the object is created.
+-        older_Frame.f_code = frame.f_code
+-        older_Frame.f_lineno = get_f_lineno(frame) # pylint:disable=undefined-variable
++        set_f_code(older_Frame.f_code, get_f_code(frame))
++        set_f_lineno(older_Frame.f_lineno, get_f_lineno(frame)) # pylint:disable=undefined-variable
+         if newer_Frame is not None:
+             newer_Frame.f_back = older_Frame
+         newer_Frame = older_Frame
diff --git a/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb b/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb
index 5cbb3268b..f891c2eea 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb
@@ -4,7 +4,7 @@ a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "http://www.gevent.org"
 LICENSE = "MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65"
-DEPENDS += "${PYTHON_PN}-greenlet libev libuv c-ares"
+DEPENDS += "${PYTHON_PN}-greenlet libev libuv c-ares python3-cython-native"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 		  ${PYTHON_PN}-mime \
@@ -20,7 +20,16 @@ export GEVENTSETUP_EMBED_CARES = "0"
 export GEVENTSETUP_EMBED_LIBEV = "0"
 export GEVENTSETUP_EMBED_LIBUV = "0"
 
-# Delete the embedded copies of libraries so we can't accidentally link to them
 do_configure:append() {
+	# Delete the embedded copies of libraries so we can't accidentally link to them
 	rm -rf ${S}/deps
+
+	# Delete the generated cython files, as they are all out of date with python 3.11
+	rm -rf ${S}/src/gevent/*.c
+}
+
+do_compile:append() {
+        sed -i -e 's#${WORKDIR}##g' ${S}/src/gevent/*.c ${S}/src/gevent/libev/*.c ${S}/src/gevent/resolver/*.c
 }
+
+SRC_URI += "file://py-3.11.patch"
-- 
2.30.2


