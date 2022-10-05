Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A322C4332F
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 09:40:04 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.21730.1664962799387813704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 02:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pT7U+DB7;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id ay36so10429899wmb.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 02:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Ztd5W4tcQnGoF8w+OIbOVuyunGOWGTpJFHGoXX6PSj0=;
        b=pT7U+DB7VfiS6TgTFKmDnfpKNZB1xTnA1xN77H2xV8FSvq+RshrSUYrh1jFUDLFupN
         N+ScKw9sLan0hYhcHMdFd2MRT5VdKjHb4fPpyuFW4cmqsOxCB5ZflM1YZRYLqIZIOATJ
         Rgi9fEBTGQ4TYj/xsexh7PJT5bj9Fx/J5nIB19vojNAF7OkomYhtnoSKu+HuzRYbGff9
         4ACMVMkxUriFS3nW88acc6UIBNd3/EiGRMQFFfeDANiSQ3RJa5FuynQOb30JxxBjCc/+
         0uDwHZk2ysOXqyUQBCIcsSmtXZUyMICA5dIasXkSUUSpTh5YNP5bCQTghcO8bI5xR2MM
         96Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Ztd5W4tcQnGoF8w+OIbOVuyunGOWGTpJFHGoXX6PSj0=;
        b=jb5gZt15bO7Cj1F3g8Vaes8+Jo+OMlz4CPECpHrAKLgByQxG5hbGOJiH3GslXSdshR
         8MsBXQI08Lr0DMxiK3/kwTp0Pnq6gzl/IyVzngtkhFRhIOzSelahsQL0vvLmFQ79KJEq
         qLuCa0MuzerlXUz2jiS8KjvjBB5yQwE9323pkUNgUUPu2Lr/6lR8TOoUXDM+rN/IM74S
         vqr4z6F/9R10iTOKVlyATVuA8YcerXXWyS89fB+k8Mzt48gXsPNgZwMBNVBwbm3luKGm
         VivRQtJ1ds9Qijtrn8FIA8CLpJyw1Gf5eh0GDPPkYYLJBZGtxGLj/oowGqy57faKvUqn
         nI8A==
X-Gm-Message-State: ACrzQf3Nu3RxdM8/UA8aaOvF0RxiVqWph5yhTu9qn3/QLM8l1c7MPdfB
	9wIvwu1EAcVNp0EKuKt5R2GqOLejK5Q=
X-Google-Smtp-Source: 
 AMsMyM4n6rYSLtdmsl7eafhmel0Us4DLn2K02/ibYWqMcsXvYyhV1owOgUQtzLN+iFtQ4QUsomce+A==
X-Received: by 2002:a05:600c:46c6:b0:3b4:cad4:7d3e with SMTP id
 q6-20020a05600c46c600b003b4cad47d3emr2746858wmo.78.1664962797537;
        Wed, 05 Oct 2022 02:39:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 d10-20020a5d6dca000000b0022917d58603sm14641736wrz.32.2022.10.05.02.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 02:39:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/3] python3-pybluez: add python 3.11 patch
Date: Wed,  5 Oct 2022 11:39:49 +0200
Message-Id: <20221005093949.1527779-3-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-devel/message/99067

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-pybluez/py-3.11.patch      | 454 ++++++++++++++++++
 .../python/python3-pybluez_0.23.bb            |   3 +-
 2 files changed, 456 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybluez/py-3.11.patch

diff --git a/meta-python/recipes-devtools/python/python3-pybluez/py-3.11.patch b/meta-python/recipes-devtools/python/python3-pybluez/py-3.11.patch
new file mode 100644
index 000000000..af4869f73
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybluez/py-3.11.patch
@@ -0,0 +1,454 @@
+From f83d38687fec2239c517037453ed4a2191279796 Mon Sep 17 00:00:00 2001
+From: Victor Stinner <vstinner@python.org>
+Date: Fri, 28 Jan 2022 00:14:04 +0100
+Subject: [PATCH] Port to Python 3.11 (#410)
+
+* Replace "arg == Py_None" with Py_IsNone(arg)
+* Replace arg->ob_type with Py_TYPE(arg)
+* Replace "Py_TYPE(obj) = type" with Py_SET_TYPE(obj, type).
+* Copy pythoncapi_compat.h from:
+  https://github.com/pythoncapi/pythoncapi_compat
+* pythoncapi_compat.h provides Py_SET_TYPE() and Py_IsNone() to old
+  Python versions.
+
+Upstream-Status: Backport [https://github.com/pybluez/pybluez/commit/5096047f90a1f6a74ceb250aef6243e144170f92]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ bluez/btmodule.c          |  14 +-
+ bluez/pythoncapi_compat.h | 364 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 372 insertions(+), 6 deletions(-)
+ create mode 100644 bluez/pythoncapi_compat.h
+
+diff --git a/bluez/btmodule.c b/bluez/btmodule.c
+index 912a489..b61f74a 100644
+--- a/bluez/btmodule.c
++++ b/bluez/btmodule.c
+@@ -21,6 +21,8 @@ Local naming conventions:
+ #include "btmodule.h"
+ #include "structmember.h"
+ 
++#include "pythoncapi_compat.h"
++
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+@@ -678,7 +680,7 @@ sock_settimeout(PySocketSockObject *s, PyObject *arg)
+ {
+ 	double timeout;
+ 
+-	if (arg == Py_None)
++	if (Py_IsNone(arg))
+ 		timeout = -1.0;
+ 	else {
+ 		timeout = PyFloat_AsDouble(arg);
+@@ -1752,7 +1754,7 @@ bt_btohl(PyObject *self, PyObject *args)
+ 	else
+ 		return PyErr_Format(PyExc_TypeError,
+ 				    "expected int/long, %s found",
+-				    arg->ob_type->tp_name);
++				    Py_TYPE(arg)->tp_name);
+ 	if (x == (unsigned long) -1 && PyErr_Occurred())
+ 		return NULL;
+ 	return PyInt_FromLong(btohl(x));
+@@ -1816,7 +1818,7 @@ bt_htobl(PyObject *self, PyObject *args)
+ 	else
+ 		return PyErr_Format(PyExc_TypeError,
+ 				    "expected int/long, %s found",
+-				    arg->ob_type->tp_name);
++				    Py_TYPE(arg)->tp_name);
+ 	return PyInt_FromLong(htobl(x));
+ }
+ 
+@@ -1889,7 +1891,7 @@ bt_setdefaulttimeout(PyObject *self, PyObject *arg)
+ {
+ 	double timeout;
+ 
+-	if (arg == Py_None)
++	if (Py_IsNone(arg))
+ 		timeout = -1.0;
+ 	else {
+ 		timeout = PyFloat_AsDouble(arg);
+@@ -2980,8 +2982,8 @@ PyMODINIT_FUNC
+ init_bluetooth(void)
+ #endif
+ {
+-    Py_TYPE(&sock_type) = &PyType_Type;
+-    Py_TYPE(&sdp_session_type) = &PyType_Type;
++    Py_SET_TYPE(&sock_type, &PyType_Type);
++    Py_SET_TYPE(&sdp_session_type, &PyType_Type);
+ #if PY_MAJOR_VERSION >= 3
+     PyObject *m = PyModule_Create(&moduledef);
+ #else
+diff --git a/bluez/pythoncapi_compat.h b/bluez/pythoncapi_compat.h
+new file mode 100644
+index 0000000..e660b61
+--- /dev/null
++++ b/bluez/pythoncapi_compat.h
+@@ -0,0 +1,364 @@
++// Header file providing new functions of the Python C API to old Python
++// versions.
++//
++// File distributed under the MIT license.
++// Copyright Contributors to the pythoncapi_compat project.
++//
++// Homepage:
++// https://github.com/pythoncapi/pythoncapi_compat
++//
++// Latest version:
++// https://raw.githubusercontent.com/pythoncapi/pythoncapi_compat/master/pythoncapi_compat.h
++//
++// SPDX-License-Identifier: MIT
++
++#ifndef PYTHONCAPI_COMPAT
++#define PYTHONCAPI_COMPAT
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#include <Python.h>
++#include "frameobject.h"          // PyFrameObject, PyFrame_GetBack()
++
++
++// Compatibility with Visual Studio 2013 and older which don't support
++// the inline keyword in C (only in C++): use __inline instead.
++#if (defined(_MSC_VER) && _MSC_VER < 1900 \
++     && !defined(__cplusplus) && !defined(inline))
++#  define inline __inline
++#  define PYTHONCAPI_COMPAT_MSC_INLINE
++   // These two macros are undefined at the end of this file
++#endif
++
++
++// Cast argument to PyObject* type.
++#ifndef _PyObject_CAST
++#  define _PyObject_CAST(op) ((PyObject*)(op))
++#endif
++#ifndef _PyObject_CAST_CONST
++#  define _PyObject_CAST_CONST(op) ((const PyObject*)(op))
++#endif
++
++
++// bpo-42262 added Py_NewRef() to Python 3.10.0a3
++#if PY_VERSION_HEX < 0x030A00A3 && !defined(Py_NewRef)
++static inline PyObject* _Py_NewRef(PyObject *obj)
++{
++    Py_INCREF(obj);
++    return obj;
++}
++#define Py_NewRef(obj) _Py_NewRef(_PyObject_CAST(obj))
++#endif
++
++
++// bpo-42262 added Py_XNewRef() to Python 3.10.0a3
++#if PY_VERSION_HEX < 0x030A00A3 && !defined(Py_XNewRef)
++static inline PyObject* _Py_XNewRef(PyObject *obj)
++{
++    Py_XINCREF(obj);
++    return obj;
++}
++#define Py_XNewRef(obj) _Py_XNewRef(_PyObject_CAST(obj))
++#endif
++
++
++// See https://bugs.python.org/issue42522
++#if !defined(_Py_StealRef)
++static inline PyObject* __Py_StealRef(PyObject *obj)
++{
++    Py_DECREF(obj);
++    return obj;
++}
++#define _Py_StealRef(obj) __Py_StealRef(_PyObject_CAST(obj))
++#endif
++
++
++// See https://bugs.python.org/issue42522
++#if !defined(_Py_XStealRef)
++static inline PyObject* __Py_XStealRef(PyObject *obj)
++{
++    Py_XDECREF(obj);
++    return obj;
++}
++#define _Py_XStealRef(obj) __Py_XStealRef(_PyObject_CAST(obj))
++#endif
++
++
++// bpo-39573 added Py_SET_REFCNT() to Python 3.9.0a4
++#if PY_VERSION_HEX < 0x030900A4 && !defined(Py_SET_REFCNT)
++static inline void _Py_SET_REFCNT(PyObject *ob, Py_ssize_t refcnt)
++{
++    ob->ob_refcnt = refcnt;
++}
++#define Py_SET_REFCNT(ob, refcnt) _Py_SET_REFCNT(_PyObject_CAST(ob), refcnt)
++#endif
++
++
++// Py_SETREF() and Py_XSETREF() were added to Python 3.5.2.
++// It is excluded from the limited C API.
++#if (PY_VERSION_HEX < 0x03050200 && !defined(Py_SETREF)) && !defined(Py_LIMITED_API)
++#define Py_SETREF(op, op2)                      \
++    do {                                        \
++        PyObject *_py_tmp = _PyObject_CAST(op); \
++        (op) = (op2);                           \
++        Py_DECREF(_py_tmp);                     \
++    } while (0)
++
++#define Py_XSETREF(op, op2)                     \
++    do {                                        \
++        PyObject *_py_tmp = _PyObject_CAST(op); \
++        (op) = (op2);                           \
++        Py_XDECREF(_py_tmp);                    \
++    } while (0)
++#endif
++
++
++// bpo-43753 added Py_Is(), Py_IsNone(), Py_IsTrue() and Py_IsFalse()
++// to Python 3.10.0b1.
++#if PY_VERSION_HEX < 0x030A00B1 && !defined(Py_Is)
++#  define Py_Is(x, y) ((x) == (y))
++#endif
++#if PY_VERSION_HEX < 0x030A00B1 && !defined(Py_IsNone)
++#  define Py_IsNone(x) Py_Is(x, Py_None)
++#endif
++#if PY_VERSION_HEX < 0x030A00B1 && !defined(Py_IsTrue)
++#  define Py_IsTrue(x) Py_Is(x, Py_True)
++#endif
++#if PY_VERSION_HEX < 0x030A00B1 && !defined(Py_IsFalse)
++#  define Py_IsFalse(x) Py_Is(x, Py_False)
++#endif
++
++
++// bpo-39573 added Py_SET_TYPE() to Python 3.9.0a4
++#if PY_VERSION_HEX < 0x030900A4 && !defined(Py_SET_TYPE)
++static inline void
++_Py_SET_TYPE(PyObject *ob, PyTypeObject *type)
++{
++    ob->ob_type = type;
++}
++#define Py_SET_TYPE(ob, type) _Py_SET_TYPE(_PyObject_CAST(ob), type)
++#endif
++
++
++// bpo-39573 added Py_SET_SIZE() to Python 3.9.0a4
++#if PY_VERSION_HEX < 0x030900A4 && !defined(Py_SET_SIZE)
++static inline void
++_Py_SET_SIZE(PyVarObject *ob, Py_ssize_t size)
++{
++    ob->ob_size = size;
++}
++#define Py_SET_SIZE(ob, size) _Py_SET_SIZE((PyVarObject*)(ob), size)
++#endif
++
++
++// bpo-40421 added PyFrame_GetCode() to Python 3.9.0b1
++#if PY_VERSION_HEX < 0x030900B1
++static inline PyCodeObject*
++PyFrame_GetCode(PyFrameObject *frame)
++{
++    assert(frame != NULL);
++    assert(frame->f_code != NULL);
++    return (PyCodeObject*)Py_NewRef(frame->f_code);
++}
++#endif
++
++static inline PyCodeObject*
++_PyFrame_GetCodeBorrow(PyFrameObject *frame)
++{
++    return (PyCodeObject *)_Py_StealRef(PyFrame_GetCode(frame));
++}
++
++
++// bpo-40421 added PyFrame_GetCode() to Python 3.9.0b1
++#if PY_VERSION_HEX < 0x030900B1 && !defined(PYPY_VERSION)
++static inline PyFrameObject*
++PyFrame_GetBack(PyFrameObject *frame)
++{
++    assert(frame != NULL);
++    return (PyFrameObject*)Py_XNewRef(frame->f_back);
++}
++#endif
++
++#if !defined(PYPY_VERSION)
++static inline PyFrameObject*
++_PyFrame_GetBackBorrow(PyFrameObject *frame)
++{
++    return (PyFrameObject *)_Py_XStealRef(PyFrame_GetBack(frame));
++}
++#endif
++
++
++// bpo-39947 added PyThreadState_GetInterpreter() to Python 3.9.0a5
++#if PY_VERSION_HEX < 0x030900A5
++static inline PyInterpreterState *
++PyThreadState_GetInterpreter(PyThreadState *tstate)
++{
++    assert(tstate != NULL);
++    return tstate->interp;
++}
++#endif
++
++
++// bpo-40429 added PyThreadState_GetFrame() to Python 3.9.0b1
++#if PY_VERSION_HEX < 0x030900B1 && !defined(PYPY_VERSION)
++static inline PyFrameObject*
++PyThreadState_GetFrame(PyThreadState *tstate)
++{
++    assert(tstate != NULL);
++    return (PyFrameObject *)Py_XNewRef(tstate->frame);
++}
++#endif
++
++#if !defined(PYPY_VERSION)
++static inline PyFrameObject*
++_PyThreadState_GetFrameBorrow(PyThreadState *tstate)
++{
++    return (PyFrameObject *)_Py_XStealRef(PyThreadState_GetFrame(tstate));
++}
++#endif
++
++
++// bpo-39947 added PyInterpreterState_Get() to Python 3.9.0a5
++#if PY_VERSION_HEX < 0x030900A5
++static inline PyInterpreterState *
++PyInterpreterState_Get(void)
++{
++    PyThreadState *tstate;
++    PyInterpreterState *interp;
++
++    tstate = PyThreadState_GET();
++    if (tstate == NULL) {
++        Py_FatalError("GIL released (tstate is NULL)");
++    }
++    interp = tstate->interp;
++    if (interp == NULL) {
++        Py_FatalError("no current interpreter");
++    }
++    return interp;
++}
++#endif
++
++
++// bpo-39947 added PyInterpreterState_Get() to Python 3.9.0a6
++#if 0x030700A1 <= PY_VERSION_HEX && PY_VERSION_HEX < 0x030900A6 && !defined(PYPY_VERSION)
++static inline uint64_t
++PyThreadState_GetID(PyThreadState *tstate)
++{
++    assert(tstate != NULL);
++    return tstate->id;
++}
++#endif
++
++
++// bpo-37194 added PyObject_CallNoArgs() to Python 3.9.0a1
++#if PY_VERSION_HEX < 0x030900A1
++static inline PyObject*
++PyObject_CallNoArgs(PyObject *func)
++{
++    return PyObject_CallFunctionObjArgs(func, NULL);
++}
++#endif
++
++
++// bpo-39245 made PyObject_CallOneArg() public (previously called
++// _PyObject_CallOneArg) in Python 3.9.0a4
++#if PY_VERSION_HEX < 0x030900A4
++static inline PyObject*
++PyObject_CallOneArg(PyObject *func, PyObject *arg)
++{
++    return PyObject_CallFunctionObjArgs(func, arg, NULL);
++}
++#endif
++
++
++// bpo-1635741 added PyModule_AddObjectRef() to Python 3.10.0a3
++#if PY_VERSION_HEX < 0x030A00A3
++static inline int
++PyModule_AddObjectRef(PyObject *module, const char *name, PyObject *value)
++{
++    Py_XINCREF(value);
++    int res = PyModule_AddObject(module, name, value);
++    if (res < 0) {
++        Py_XDECREF(value);
++    }
++    return res;
++}
++#endif
++
++
++// bpo-40024 added PyModule_AddType() to Python 3.9.0a5
++#if PY_VERSION_HEX < 0x030900A5
++static inline int
++PyModule_AddType(PyObject *module, PyTypeObject *type)
++{
++    const char *name, *dot;
++
++    if (PyType_Ready(type) < 0) {
++        return -1;
++    }
++
++    // inline _PyType_Name()
++    name = type->tp_name;
++    assert(name != NULL);
++    dot = strrchr(name, '.');
++    if (dot != NULL) {
++        name = dot + 1;
++    }
++
++    return PyModule_AddObjectRef(module, name, (PyObject *)type);
++}
++#endif
++
++
++// bpo-40241 added PyObject_GC_IsTracked() to Python 3.9.0a6.
++// bpo-4688 added _PyObject_GC_IS_TRACKED() to Python 2.7.0a2.
++#if PY_VERSION_HEX < 0x030900A6 && !defined(PYPY_VERSION)
++static inline int
++PyObject_GC_IsTracked(PyObject* obj)
++{
++    return (PyObject_IS_GC(obj) && _PyObject_GC_IS_TRACKED(obj));
++}
++#endif
++
++// bpo-40241 added PyObject_GC_IsFinalized() to Python 3.9.0a6.
++// bpo-18112 added _PyGCHead_FINALIZED() to Python 3.4.0 final.
++#if PY_VERSION_HEX < 0x030900A6 && PY_VERSION_HEX >= 0x030400F0 && !defined(PYPY_VERSION)
++static inline int
++PyObject_GC_IsFinalized(PyObject *obj)
++{
++    return (PyObject_IS_GC(obj) && _PyGCHead_FINALIZED((PyGC_Head *)(obj)-1));
++}
++#endif
++
++
++// bpo-39573 added Py_IS_TYPE() to Python 3.9.0a4
++#if PY_VERSION_HEX < 0x030900A4 && !defined(Py_IS_TYPE)
++static inline int
++_Py_IS_TYPE(const PyObject *ob, const PyTypeObject *type) {
++    return ob->ob_type == type;
++}
++#define Py_IS_TYPE(ob, type) _Py_IS_TYPE(_PyObject_CAST_CONST(ob), type)
++#endif
++
++
++// Py_UNUSED() was added to Python 3.4.0b2.
++#if PY_VERSION_HEX < 0x030400B2 && !defined(Py_UNUSED)
++#  if defined(__GNUC__) || defined(__clang__)
++#    define Py_UNUSED(name) _unused_ ## name __attribute__((unused))
++#  else
++#    define Py_UNUSED(name) _unused_ ## name
++#  endif
++#endif
++
++
++#ifdef PYTHONCAPI_COMPAT_MSC_INLINE
++#  undef inline
++#  undef PYTHONCAPI_COMPAT_MSC_INLINE
++#endif
++
++#ifdef __cplusplus
++}
++#endif
++#endif  // PYTHONCAPI_COMPAT
+-- 
+2.30.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
index 6a1df273a..219642849 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
@@ -7,7 +7,8 @@ DEPENDS = "bluez5"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
 
-SRC_URI += "file://0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch"
+SRC_URI += "file://0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch \
+            file://py-3.11.patch "
 SRC_URI[md5sum] = "afbe8429bb82d2c46a3d0f5f4f898f9d"
 SRC_URI[sha256sum] = "c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f55fcd7b8582e90de"
 
-- 
2.30.2


