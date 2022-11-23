Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90CEBC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 05:40:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13582.1669182008194554044
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Nov 2022 21:40:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=KVYeu8Ww;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83266acff9=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AN5e7Pt028527
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 21:40:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=YXg8w+65AVZOp7AQgyaxsLvOe9aKQ2vJLPPXe4KstwU=;
 b=KVYeu8WwjPhDDTNxylwcSgxwQw3urYtjLePU6/SP5narw1a1yGT4/GsjapqOPTSEi92/
 U7cZyK0m4PWntU3df+Ft5hH6VrgoGFvdmEX2ueMIIaodViVe9MH0B2lgRsOZFJc80pYH
 qOLlSKhrcFKMysE507ifW7MUiPjb800QVbqqPHXTHP59dHxUmc95Lbv4ITgyrlvdGm4E
 BAGWhnwJm/l5REP7yTAALZz0lf30+mBcWSglpwSIKeeMuCmdx2T7zlytCktu2E7n2TwZ
 yp+1vubmbm5kGL9O5Zeyg2hkLe2/30AGFRCY3g/oUvKeg2DnmmsQxA9xKEodLEOgXctE XQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqawt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Nov 2022 21:40:07 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 22 Nov 2022 21:40:06 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 22 Nov 2022 21:40:05 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH v2] python3-wxgtk4: 4.1.1 -> 4.2.0
Date: Wed, 23 Nov 2022 13:40:00 +0800
Message-ID: <20221123054000.4728-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <172A18318142C5B3.9021@lists.openembedded.org>
References: <172A18318142C5B3.9021@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: iUMALrYX5o9NRpgXZjXOCdlSST-cNrMF
X-Proofpoint-GUID: iUMALrYX5o9NRpgXZjXOCdlSST-cNrMF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 05:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99692

From: Kai Kang <kai.kang@windriver.com>

Upgrade python3-wxgtk4 from 4.1.1 to 4.2.0:

* fix licence according to LICENSE.txt that it is licenced under
  LGPL-2.0, and WXwindows is used for documents
* remove backported patches
* not overwrite CFLAGS and CXXFLAGS in file wscript

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v2:
* add Upstream-Status for not-overwrite-cflags-cxxflags.patch

 ...rsion-to-fix-NanoSVG-issues-with-Pyt.patch | 861 ------------------
 .../not-overwrite-cflags-cxxflags.patch       |  28 +
 .../sip-fix-override-functions.patch          |  35 -
 ...xgtk4_4.1.1.bb => python3-wxgtk4_4.2.0.bb} |  15 +-
 4 files changed, 35 insertions(+), 904 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-Update-Cython-version-to-fix-NanoSVG-issues-with-Pyt.patch
 create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch
 delete mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch
 rename meta-python/recipes-devtools/python3-wxgtk4/{python3-wxgtk4_4.1.1.bb => python3-wxgtk4_4.2.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-Update-Cython-version-to-fix-NanoSVG-issues-with-Pyt.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-Update-Cython-version-to-fix-NanoSVG-issues-with-Pyt.patch
deleted file mode 100644
index 6be56cb90..000000000
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-Update-Cython-version-to-fix-NanoSVG-issues-with-Pyt.patch
+++ /dev/null
@@ -1,861 +0,0 @@
-Upstream-Status: Backport [https://github.com/wxWidgets/Phoenix/commit/b40ab0f8]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From b40ab0f806bdf7aa0c0a51a8c4876ac47754515d Mon Sep 17 00:00:00 2001
-From: Scott Talbert <swt@techie.net>
-Date: Thu, 7 Oct 2021 17:53:05 -0400
-Subject: [PATCH] Update Cython version to fix NanoSVG issues with Python 3.10
-
----
- requirements/devel.txt |   2 +-
- wx/svg/_nanosvg.c      | 554 ++++++++++++++++++++++++++---------------
- 2 files changed, 359 insertions(+), 197 deletions(-)
-
-diff --git a/requirements/devel.txt b/requirements/devel.txt
-index 1d427be0..18164bdc 100644
---- a/requirements/devel.txt
-+++ b/requirements/devel.txt
-@@ -9,7 +9,7 @@ wheel
- twine
- requests
- requests[security]
--cython==0.29.21
-+cython==0.29.24
- pytest
- pytest-xdist
- pytest-forked
-diff --git a/wx/svg/_nanosvg.c b/wx/svg/_nanosvg.c
-index d8f1e158..fd4a5a67 100644
---- a/wx/svg/_nanosvg.c
-+++ b/wx/svg/_nanosvg.c
-@@ -1,4 +1,4 @@
--/* Generated by Cython 0.29.21 */
-+/* Generated by Cython 0.29.24 */
- 
- /* BEGIN: Cython Metadata
- {
-@@ -33,15 +33,17 @@
- }
- END: Cython Metadata */
- 
-+#ifndef PY_SSIZE_T_CLEAN
- #define PY_SSIZE_T_CLEAN
-+#endif /* PY_SSIZE_T_CLEAN */
- #include "Python.h"
- #ifndef Py_PYTHON_H
-     #error Python headers needed to compile C extensions, please install development version of Python.
- #elif PY_VERSION_HEX < 0x02060000 || (0x03000000 <= PY_VERSION_HEX && PY_VERSION_HEX < 0x03030000)
-     #error Cython requires Python 2.6+ or Python 3.3+.
- #else
--#define CYTHON_ABI "0_29_21"
--#define CYTHON_HEX_VERSION 0x001D15F0
-+#define CYTHON_ABI "0_29_24"
-+#define CYTHON_HEX_VERSION 0x001D18F0
- #define CYTHON_FUTURE_DIVISION 0
- #include <stddef.h>
- #ifndef offsetof
-@@ -459,8 +461,12 @@ static CYTHON_INLINE void * PyThread_tss_get(Py_tss_t *key) {
- #endif
- #if PY_VERSION_HEX > 0x03030000 && defined(PyUnicode_KIND)
-   #define CYTHON_PEP393_ENABLED 1
-+  #if defined(PyUnicode_IS_READY)
-   #define __Pyx_PyUnicode_READY(op)       (likely(PyUnicode_IS_READY(op)) ?\
-                                               0 : _PyUnicode_Ready((PyObject *)(op)))
-+  #else
-+  #define __Pyx_PyUnicode_READY(op)       (0)
-+  #endif
-   #define __Pyx_PyUnicode_GET_LENGTH(u)   PyUnicode_GET_LENGTH(u)
-   #define __Pyx_PyUnicode_READ_CHAR(u, i) PyUnicode_READ_CHAR(u, i)
-   #define __Pyx_PyUnicode_MAX_CHAR_VALUE(u)   PyUnicode_MAX_CHAR_VALUE(u)
-@@ -469,7 +475,11 @@ static CYTHON_INLINE void * PyThread_tss_get(Py_tss_t *key) {
-   #define __Pyx_PyUnicode_READ(k, d, i)   PyUnicode_READ(k, d, i)
-   #define __Pyx_PyUnicode_WRITE(k, d, i, ch)  PyUnicode_WRITE(k, d, i, ch)
-   #if defined(PyUnicode_IS_READY) && defined(PyUnicode_GET_SIZE)
-+  #if CYTHON_COMPILING_IN_CPYTHON && PY_VERSION_HEX >= 0x03090000
-+  #define __Pyx_PyUnicode_IS_TRUE(u)      (0 != (likely(PyUnicode_IS_READY(u)) ? PyUnicode_GET_LENGTH(u) : ((PyCompactUnicodeObject *)(u))->wstr_length))
-+  #else
-   #define __Pyx_PyUnicode_IS_TRUE(u)      (0 != (likely(PyUnicode_IS_READY(u)) ? PyUnicode_GET_LENGTH(u) : PyUnicode_GET_SIZE(u)))
-+  #endif
-   #else
-   #define __Pyx_PyUnicode_IS_TRUE(u)      (0 != PyUnicode_GET_LENGTH(u))
-   #endif
-@@ -1736,33 +1746,38 @@ static void __pyx_insert_code_object(int code_line, PyCodeObject* code_object);
- static void __Pyx_AddTraceback(const char *funcname, int c_line,
-                                int py_line, const char *filename);
- 
-+/* GCCDiagnostics.proto */
-+#if defined(__GNUC__) && (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6))
-+#define __Pyx_HAS_GCC_DIAGNOSTIC
-+#endif
-+
- /* CIntToPy.proto */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_long(long value);
- 
-+/* CIntFromPy.proto */
-+static CYTHON_INLINE int __Pyx_PyInt_As_int(PyObject *);
-+
- /* CIntToPy.proto */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_int(int value);
- 
- /* CIntToPy.proto */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_char(char value);
- 
-+/* CIntFromPy.proto */
-+static CYTHON_INLINE char __Pyx_PyInt_As_char(PyObject *);
-+
- /* CIntToPy.proto */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_unsigned_char(unsigned char value);
- 
-+/* CIntFromPy.proto */
-+static CYTHON_INLINE long __Pyx_PyInt_As_long(PyObject *);
-+
- /* CIntToPy.proto */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg_SVGpaintType(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType value);
- 
- /* CIntToPy.proto */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_unsigned_int(unsigned int value);
- 
--/* CIntFromPy.proto */
--static CYTHON_INLINE int __Pyx_PyInt_As_int(PyObject *);
--
--/* CIntFromPy.proto */
--static CYTHON_INLINE char __Pyx_PyInt_As_char(PyObject *);
--
--/* CIntFromPy.proto */
--static CYTHON_INLINE long __Pyx_PyInt_As_long(PyObject *);
--
- /* CIntToPy.proto */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg_SVGfillRule(enum __pyx_t_2wx_3svg_8_nanosvg_SVGfillRule value);
- 
-@@ -1844,6 +1859,7 @@ typedef struct {
-     PyObject *gi_qualname;
-     PyObject *gi_modulename;
-     PyObject *gi_code;
-+    PyObject *gi_frame;
-     int resume_label;
-     char is_running;
- } __pyx_CoroutineObject;
-@@ -14641,11 +14657,9 @@ if (!__Pyx_RefNanny) {
-   #endif
-   /*--- Library function declarations ---*/
-   /*--- Threads initialization code ---*/
--  #if defined(__PYX_FORCE_INIT_THREADS) && __PYX_FORCE_INIT_THREADS
--  #ifdef WITH_THREAD /* Python build with threading support? */
-+  #if defined(WITH_THREAD) && PY_VERSION_HEX < 0x030700F0 && defined(__PYX_FORCE_INIT_THREADS) && __PYX_FORCE_INIT_THREADS
-   PyEval_InitThreads();
-   #endif
--  #endif
-   /*--- Module creation code ---*/
-   #if CYTHON_PEP489_MULTI_PHASE_INIT
-   __pyx_m = __pyx_pyinit_module;
-@@ -16766,7 +16780,7 @@ invalid_keyword:
- #if CYTHON_COMPILING_IN_CPYTHON
- static CYTHON_INLINE PyObject* __Pyx_PyObject_Call(PyObject *func, PyObject *arg, PyObject *kw) {
-     PyObject *result;
--    ternaryfunc call = func->ob_type->tp_call;
-+    ternaryfunc call = Py_TYPE(func)->tp_call;
-     if (unlikely(!call))
-         return PyObject_Call(func, arg, kw);
-     if (unlikely(Py_EnterRecursiveCall((char*)" while calling a Python object")))
-@@ -17149,7 +17163,7 @@ static CYTHON_INLINE PyObject* __Pyx_PyObject_CallOneArg(PyObject *func, PyObjec
-         if (likely(PyCFunction_GET_FLAGS(func) & METH_O)) {
-             return __Pyx_PyObject_CallMethO(func, arg);
- #if CYTHON_FAST_PYCCALL
--        } else if (PyCFunction_GET_FLAGS(func) & METH_FASTCALL) {
-+        } else if (__Pyx_PyFastCFunction_Check(func)) {
-             return __Pyx_PyCFunction_FastCall(func, &arg, 1);
- #endif
-         }
-@@ -18800,7 +18814,8 @@ static PyObject *
- __Pyx_CyFunction_reduce(__pyx_CyFunctionObject *m, CYTHON_UNUSED PyObject *args)
- {
- #if PY_MAJOR_VERSION >= 3
--    return PyUnicode_FromString(m->func.m_ml->ml_name);
-+    Py_INCREF(m->func_qualname);
-+    return m->func_qualname;
- #else
-     return PyString_FromString(m->func.m_ml->ml_name);
- #endif
-@@ -19443,37 +19458,6 @@ bad:
-     Py_XDECREF(py_frame);
- }
- 
--/* CIntToPy */
--static CYTHON_INLINE PyObject* __Pyx_PyInt_From_long(long value) {
--    const long neg_one = (long) ((long) 0 - (long) 1), const_zero = (long) 0;
--    const int is_unsigned = neg_one > const_zero;
--    if (is_unsigned) {
--        if (sizeof(long) < sizeof(long)) {
--            return PyInt_FromLong((long) value);
--        } else if (sizeof(long) <= sizeof(unsigned long)) {
--            return PyLong_FromUnsignedLong((unsigned long) value);
--#ifdef HAVE_LONG_LONG
--        } else if (sizeof(long) <= sizeof(unsigned PY_LONG_LONG)) {
--            return PyLong_FromUnsignedLongLong((unsigned PY_LONG_LONG) value);
--#endif
--        }
--    } else {
--        if (sizeof(long) <= sizeof(long)) {
--            return PyInt_FromLong((long) value);
--#ifdef HAVE_LONG_LONG
--        } else if (sizeof(long) <= sizeof(PY_LONG_LONG)) {
--            return PyLong_FromLongLong((PY_LONG_LONG) value);
--#endif
--        }
--    }
--    {
--        int one = 1; int little = (int)*(unsigned char *)&one;
--        unsigned char *bytes = (unsigned char *)&value;
--        return _PyLong_FromByteArray(bytes, sizeof(long),
--                                     little, !is_unsigned);
--    }
--}
--
- /* CIntFromPyVerify */
- #define __PYX_VERIFY_RETURN_INT(target_type, func_type, func_value)\
-     __PYX__VERIFY_RETURN_INT(target_type, func_type, func_value, 0)
-@@ -19497,148 +19481,31 @@ static CYTHON_INLINE PyObject* __Pyx_PyInt_From_long(long value) {
-     }
- 
- /* CIntToPy */
--static CYTHON_INLINE PyObject* __Pyx_PyInt_From_int(int value) {
--    const int neg_one = (int) ((int) 0 - (int) 1), const_zero = (int) 0;
--    const int is_unsigned = neg_one > const_zero;
--    if (is_unsigned) {
--        if (sizeof(int) < sizeof(long)) {
--            return PyInt_FromLong((long) value);
--        } else if (sizeof(int) <= sizeof(unsigned long)) {
--            return PyLong_FromUnsignedLong((unsigned long) value);
--#ifdef HAVE_LONG_LONG
--        } else if (sizeof(int) <= sizeof(unsigned PY_LONG_LONG)) {
--            return PyLong_FromUnsignedLongLong((unsigned PY_LONG_LONG) value);
--#endif
--        }
--    } else {
--        if (sizeof(int) <= sizeof(long)) {
--            return PyInt_FromLong((long) value);
--#ifdef HAVE_LONG_LONG
--        } else if (sizeof(int) <= sizeof(PY_LONG_LONG)) {
--            return PyLong_FromLongLong((PY_LONG_LONG) value);
--#endif
--        }
--    }
--    {
--        int one = 1; int little = (int)*(unsigned char *)&one;
--        unsigned char *bytes = (unsigned char *)&value;
--        return _PyLong_FromByteArray(bytes, sizeof(int),
--                                     little, !is_unsigned);
--    }
--}
--
--/* CIntToPy */
--static CYTHON_INLINE PyObject* __Pyx_PyInt_From_char(char value) {
--    const char neg_one = (char) ((char) 0 - (char) 1), const_zero = (char) 0;
--    const int is_unsigned = neg_one > const_zero;
--    if (is_unsigned) {
--        if (sizeof(char) < sizeof(long)) {
--            return PyInt_FromLong((long) value);
--        } else if (sizeof(char) <= sizeof(unsigned long)) {
--            return PyLong_FromUnsignedLong((unsigned long) value);
--#ifdef HAVE_LONG_LONG
--        } else if (sizeof(char) <= sizeof(unsigned PY_LONG_LONG)) {
--            return PyLong_FromUnsignedLongLong((unsigned PY_LONG_LONG) value);
--#endif
--        }
--    } else {
--        if (sizeof(char) <= sizeof(long)) {
--            return PyInt_FromLong((long) value);
--#ifdef HAVE_LONG_LONG
--        } else if (sizeof(char) <= sizeof(PY_LONG_LONG)) {
--            return PyLong_FromLongLong((PY_LONG_LONG) value);
--#endif
--        }
--    }
--    {
--        int one = 1; int little = (int)*(unsigned char *)&one;
--        unsigned char *bytes = (unsigned char *)&value;
--        return _PyLong_FromByteArray(bytes, sizeof(char),
--                                     little, !is_unsigned);
--    }
--}
--
--/* CIntToPy */
--static CYTHON_INLINE PyObject* __Pyx_PyInt_From_unsigned_char(unsigned char value) {
--    const unsigned char neg_one = (unsigned char) ((unsigned char) 0 - (unsigned char) 1), const_zero = (unsigned char) 0;
--    const int is_unsigned = neg_one > const_zero;
--    if (is_unsigned) {
--        if (sizeof(unsigned char) < sizeof(long)) {
--            return PyInt_FromLong((long) value);
--        } else if (sizeof(unsigned char) <= sizeof(unsigned long)) {
--            return PyLong_FromUnsignedLong((unsigned long) value);
--#ifdef HAVE_LONG_LONG
--        } else if (sizeof(unsigned char) <= sizeof(unsigned PY_LONG_LONG)) {
--            return PyLong_FromUnsignedLongLong((unsigned PY_LONG_LONG) value);
--#endif
--        }
--    } else {
--        if (sizeof(unsigned char) <= sizeof(long)) {
--            return PyInt_FromLong((long) value);
--#ifdef HAVE_LONG_LONG
--        } else if (sizeof(unsigned char) <= sizeof(PY_LONG_LONG)) {
--            return PyLong_FromLongLong((PY_LONG_LONG) value);
--#endif
--        }
--    }
--    {
--        int one = 1; int little = (int)*(unsigned char *)&one;
--        unsigned char *bytes = (unsigned char *)&value;
--        return _PyLong_FromByteArray(bytes, sizeof(unsigned char),
--                                     little, !is_unsigned);
--    }
--}
--
--/* CIntToPy */
--static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg_SVGpaintType(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType value) {
--    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) ((enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) 0 - (enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) 1), const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) 0;
--    const int is_unsigned = neg_one > const_zero;
--    if (is_unsigned) {
--        if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) < sizeof(long)) {
--            return PyInt_FromLong((long) value);
--        } else if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) <= sizeof(unsigned long)) {
--            return PyLong_FromUnsignedLong((unsigned long) value);
--#ifdef HAVE_LONG_LONG
--        } else if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) <= sizeof(unsigned PY_LONG_LONG)) {
--            return PyLong_FromUnsignedLongLong((unsigned PY_LONG_LONG) value);
-+static CYTHON_INLINE PyObject* __Pyx_PyInt_From_long(long value) {
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
- #endif
--        }
--    } else {
--        if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) <= sizeof(long)) {
--            return PyInt_FromLong((long) value);
--#ifdef HAVE_LONG_LONG
--        } else if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) <= sizeof(PY_LONG_LONG)) {
--            return PyLong_FromLongLong((PY_LONG_LONG) value);
-+    const long neg_one = (long) -1, const_zero = (long) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
- #endif
--        }
--    }
--    {
--        int one = 1; int little = (int)*(unsigned char *)&one;
--        unsigned char *bytes = (unsigned char *)&value;
--        return _PyLong_FromByteArray(bytes, sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType),
--                                     little, !is_unsigned);
--    }
--}
--
--/* CIntToPy */
--static CYTHON_INLINE PyObject* __Pyx_PyInt_From_unsigned_int(unsigned int value) {
--    const unsigned int neg_one = (unsigned int) ((unsigned int) 0 - (unsigned int) 1), const_zero = (unsigned int) 0;
-     const int is_unsigned = neg_one > const_zero;
-     if (is_unsigned) {
--        if (sizeof(unsigned int) < sizeof(long)) {
-+        if (sizeof(long) < sizeof(long)) {
-             return PyInt_FromLong((long) value);
--        } else if (sizeof(unsigned int) <= sizeof(unsigned long)) {
-+        } else if (sizeof(long) <= sizeof(unsigned long)) {
-             return PyLong_FromUnsignedLong((unsigned long) value);
- #ifdef HAVE_LONG_LONG
--        } else if (sizeof(unsigned int) <= sizeof(unsigned PY_LONG_LONG)) {
-+        } else if (sizeof(long) <= sizeof(unsigned PY_LONG_LONG)) {
-             return PyLong_FromUnsignedLongLong((unsigned PY_LONG_LONG) value);
- #endif
-         }
-     } else {
--        if (sizeof(unsigned int) <= sizeof(long)) {
-+        if (sizeof(long) <= sizeof(long)) {
-             return PyInt_FromLong((long) value);
- #ifdef HAVE_LONG_LONG
--        } else if (sizeof(unsigned int) <= sizeof(PY_LONG_LONG)) {
-+        } else if (sizeof(long) <= sizeof(PY_LONG_LONG)) {
-             return PyLong_FromLongLong((PY_LONG_LONG) value);
- #endif
-         }
-@@ -19646,14 +19513,21 @@ static CYTHON_INLINE PyObject* __Pyx_PyInt_From_unsigned_int(unsigned int value)
-     {
-         int one = 1; int little = (int)*(unsigned char *)&one;
-         unsigned char *bytes = (unsigned char *)&value;
--        return _PyLong_FromByteArray(bytes, sizeof(unsigned int),
-+        return _PyLong_FromByteArray(bytes, sizeof(long),
-                                      little, !is_unsigned);
-     }
- }
- 
- /* CIntFromPy */
- static CYTHON_INLINE int __Pyx_PyInt_As_int(PyObject *x) {
--    const int neg_one = (int) ((int) 0 - (int) 1), const_zero = (int) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const int neg_one = (int) -1, const_zero = (int) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-     const int is_unsigned = neg_one > const_zero;
- #if PY_MAJOR_VERSION < 3
-     if (likely(PyInt_Check(x))) {
-@@ -19840,9 +19714,92 @@ raise_neg_overflow:
-     return (int) -1;
- }
- 
-+/* CIntToPy */
-+static CYTHON_INLINE PyObject* __Pyx_PyInt_From_int(int value) {
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const int neg_one = (int) -1, const_zero = (int) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-+    const int is_unsigned = neg_one > const_zero;
-+    if (is_unsigned) {
-+        if (sizeof(int) < sizeof(long)) {
-+            return PyInt_FromLong((long) value);
-+        } else if (sizeof(int) <= sizeof(unsigned long)) {
-+            return PyLong_FromUnsignedLong((unsigned long) value);
-+#ifdef HAVE_LONG_LONG
-+        } else if (sizeof(int) <= sizeof(unsigned PY_LONG_LONG)) {
-+            return PyLong_FromUnsignedLongLong((unsigned PY_LONG_LONG) value);
-+#endif
-+        }
-+    } else {
-+        if (sizeof(int) <= sizeof(long)) {
-+            return PyInt_FromLong((long) value);
-+#ifdef HAVE_LONG_LONG
-+        } else if (sizeof(int) <= sizeof(PY_LONG_LONG)) {
-+            return PyLong_FromLongLong((PY_LONG_LONG) value);
-+#endif
-+        }
-+    }
-+    {
-+        int one = 1; int little = (int)*(unsigned char *)&one;
-+        unsigned char *bytes = (unsigned char *)&value;
-+        return _PyLong_FromByteArray(bytes, sizeof(int),
-+                                     little, !is_unsigned);
-+    }
-+}
-+
-+/* CIntToPy */
-+static CYTHON_INLINE PyObject* __Pyx_PyInt_From_char(char value) {
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const char neg_one = (char) -1, const_zero = (char) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-+    const int is_unsigned = neg_one > const_zero;
-+    if (is_unsigned) {
-+        if (sizeof(char) < sizeof(long)) {
-+            return PyInt_FromLong((long) value);
-+        } else if (sizeof(char) <= sizeof(unsigned long)) {
-+            return PyLong_FromUnsignedLong((unsigned long) value);
-+#ifdef HAVE_LONG_LONG
-+        } else if (sizeof(char) <= sizeof(unsigned PY_LONG_LONG)) {
-+            return PyLong_FromUnsignedLongLong((unsigned PY_LONG_LONG) value);
-+#endif
-+        }
-+    } else {
-+        if (sizeof(char) <= sizeof(long)) {
-+            return PyInt_FromLong((long) value);
-+#ifdef HAVE_LONG_LONG
-+        } else if (sizeof(char) <= sizeof(PY_LONG_LONG)) {
-+            return PyLong_FromLongLong((PY_LONG_LONG) value);
-+#endif
-+        }
-+    }
-+    {
-+        int one = 1; int little = (int)*(unsigned char *)&one;
-+        unsigned char *bytes = (unsigned char *)&value;
-+        return _PyLong_FromByteArray(bytes, sizeof(char),
-+                                     little, !is_unsigned);
-+    }
-+}
-+
- /* CIntFromPy */
- static CYTHON_INLINE char __Pyx_PyInt_As_char(PyObject *x) {
--    const char neg_one = (char) ((char) 0 - (char) 1), const_zero = (char) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const char neg_one = (char) -1, const_zero = (char) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-     const int is_unsigned = neg_one > const_zero;
- #if PY_MAJOR_VERSION < 3
-     if (likely(PyInt_Check(x))) {
-@@ -20029,9 +19986,54 @@ raise_neg_overflow:
-     return (char) -1;
- }
- 
-+/* CIntToPy */
-+static CYTHON_INLINE PyObject* __Pyx_PyInt_From_unsigned_char(unsigned char value) {
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const unsigned char neg_one = (unsigned char) -1, const_zero = (unsigned char) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-+    const int is_unsigned = neg_one > const_zero;
-+    if (is_unsigned) {
-+        if (sizeof(unsigned char) < sizeof(long)) {
-+            return PyInt_FromLong((long) value);
-+        } else if (sizeof(unsigned char) <= sizeof(unsigned long)) {
-+            return PyLong_FromUnsignedLong((unsigned long) value);
-+#ifdef HAVE_LONG_LONG
-+        } else if (sizeof(unsigned char) <= sizeof(unsigned PY_LONG_LONG)) {
-+            return PyLong_FromUnsignedLongLong((unsigned PY_LONG_LONG) value);
-+#endif
-+        }
-+    } else {
-+        if (sizeof(unsigned char) <= sizeof(long)) {
-+            return PyInt_FromLong((long) value);
-+#ifdef HAVE_LONG_LONG
-+        } else if (sizeof(unsigned char) <= sizeof(PY_LONG_LONG)) {
-+            return PyLong_FromLongLong((PY_LONG_LONG) value);
-+#endif
-+        }
-+    }
-+    {
-+        int one = 1; int little = (int)*(unsigned char *)&one;
-+        unsigned char *bytes = (unsigned char *)&value;
-+        return _PyLong_FromByteArray(bytes, sizeof(unsigned char),
-+                                     little, !is_unsigned);
-+    }
-+}
-+
- /* CIntFromPy */
- static CYTHON_INLINE long __Pyx_PyInt_As_long(PyObject *x) {
--    const long neg_one = (long) ((long) 0 - (long) 1), const_zero = (long) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const long neg_one = (long) -1, const_zero = (long) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-     const int is_unsigned = neg_one > const_zero;
- #if PY_MAJOR_VERSION < 3
-     if (likely(PyInt_Check(x))) {
-@@ -20218,9 +20220,92 @@ raise_neg_overflow:
-     return (long) -1;
- }
- 
-+/* CIntToPy */
-+static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg_SVGpaintType(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType value) {
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) -1, const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-+    const int is_unsigned = neg_one > const_zero;
-+    if (is_unsigned) {
-+        if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) < sizeof(long)) {
-+            return PyInt_FromLong((long) value);
-+        } else if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) <= sizeof(unsigned long)) {
-+            return PyLong_FromUnsignedLong((unsigned long) value);
-+#ifdef HAVE_LONG_LONG
-+        } else if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) <= sizeof(unsigned PY_LONG_LONG)) {
-+            return PyLong_FromUnsignedLongLong((unsigned PY_LONG_LONG) value);
-+#endif
-+        }
-+    } else {
-+        if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) <= sizeof(long)) {
-+            return PyInt_FromLong((long) value);
-+#ifdef HAVE_LONG_LONG
-+        } else if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType) <= sizeof(PY_LONG_LONG)) {
-+            return PyLong_FromLongLong((PY_LONG_LONG) value);
-+#endif
-+        }
-+    }
-+    {
-+        int one = 1; int little = (int)*(unsigned char *)&one;
-+        unsigned char *bytes = (unsigned char *)&value;
-+        return _PyLong_FromByteArray(bytes, sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGpaintType),
-+                                     little, !is_unsigned);
-+    }
-+}
-+
-+/* CIntToPy */
-+static CYTHON_INLINE PyObject* __Pyx_PyInt_From_unsigned_int(unsigned int value) {
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const unsigned int neg_one = (unsigned int) -1, const_zero = (unsigned int) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-+    const int is_unsigned = neg_one > const_zero;
-+    if (is_unsigned) {
-+        if (sizeof(unsigned int) < sizeof(long)) {
-+            return PyInt_FromLong((long) value);
-+        } else if (sizeof(unsigned int) <= sizeof(unsigned long)) {
-+            return PyLong_FromUnsignedLong((unsigned long) value);
-+#ifdef HAVE_LONG_LONG
-+        } else if (sizeof(unsigned int) <= sizeof(unsigned PY_LONG_LONG)) {
-+            return PyLong_FromUnsignedLongLong((unsigned PY_LONG_LONG) value);
-+#endif
-+        }
-+    } else {
-+        if (sizeof(unsigned int) <= sizeof(long)) {
-+            return PyInt_FromLong((long) value);
-+#ifdef HAVE_LONG_LONG
-+        } else if (sizeof(unsigned int) <= sizeof(PY_LONG_LONG)) {
-+            return PyLong_FromLongLong((PY_LONG_LONG) value);
-+#endif
-+        }
-+    }
-+    {
-+        int one = 1; int little = (int)*(unsigned char *)&one;
-+        unsigned char *bytes = (unsigned char *)&value;
-+        return _PyLong_FromByteArray(bytes, sizeof(unsigned int),
-+                                     little, !is_unsigned);
-+    }
-+}
-+
- /* CIntToPy */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg_SVGfillRule(enum __pyx_t_2wx_3svg_8_nanosvg_SVGfillRule value) {
--    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGfillRule neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGfillRule) ((enum __pyx_t_2wx_3svg_8_nanosvg_SVGfillRule) 0 - (enum __pyx_t_2wx_3svg_8_nanosvg_SVGfillRule) 1), const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGfillRule) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGfillRule neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGfillRule) -1, const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGfillRule) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-     const int is_unsigned = neg_one > const_zero;
-     if (is_unsigned) {
-         if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGfillRule) < sizeof(long)) {
-@@ -20251,7 +20336,14 @@ static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg
- 
- /* CIntToPy */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg_SVGflags(enum __pyx_t_2wx_3svg_8_nanosvg_SVGflags value) {
--    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGflags neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGflags) ((enum __pyx_t_2wx_3svg_8_nanosvg_SVGflags) 0 - (enum __pyx_t_2wx_3svg_8_nanosvg_SVGflags) 1), const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGflags) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGflags neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGflags) -1, const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGflags) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-     const int is_unsigned = neg_one > const_zero;
-     if (is_unsigned) {
-         if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGflags) < sizeof(long)) {
-@@ -20282,7 +20374,14 @@ static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg
- 
- /* CIntToPy */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg_SVGlineCap(enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineCap value) {
--    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineCap neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineCap) ((enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineCap) 0 - (enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineCap) 1), const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineCap) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineCap neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineCap) -1, const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineCap) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-     const int is_unsigned = neg_one > const_zero;
-     if (is_unsigned) {
-         if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineCap) < sizeof(long)) {
-@@ -20313,7 +20412,14 @@ static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg
- 
- /* CIntToPy */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg_SVGlineJoin(enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineJoin value) {
--    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineJoin neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineJoin) ((enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineJoin) 0 - (enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineJoin) 1), const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineJoin) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineJoin neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineJoin) -1, const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineJoin) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-     const int is_unsigned = neg_one > const_zero;
-     if (is_unsigned) {
-         if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGlineJoin) < sizeof(long)) {
-@@ -20344,7 +20450,14 @@ static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg
- 
- /* CIntToPy */
- static CYTHON_INLINE PyObject* __Pyx_PyInt_From_enum____pyx_t_2wx_3svg_8_nanosvg_SVGspreadType(enum __pyx_t_2wx_3svg_8_nanosvg_SVGspreadType value) {
--    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGspreadType neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGspreadType) ((enum __pyx_t_2wx_3svg_8_nanosvg_SVGspreadType) 0 - (enum __pyx_t_2wx_3svg_8_nanosvg_SVGspreadType) 1), const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGspreadType) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wconversion"
-+#endif
-+    const enum __pyx_t_2wx_3svg_8_nanosvg_SVGspreadType neg_one = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGspreadType) -1, const_zero = (enum __pyx_t_2wx_3svg_8_nanosvg_SVGspreadType) 0;
-+#ifdef __Pyx_HAS_GCC_DIAGNOSTIC
-+#pragma GCC diagnostic pop
-+#endif
-     const int is_unsigned = neg_one > const_zero;
-     if (is_unsigned) {
-         if (sizeof(enum __pyx_t_2wx_3svg_8_nanosvg_SVGspreadType) < sizeof(long)) {
-@@ -20907,6 +21020,30 @@ PyObject *__Pyx_Coroutine_MethodReturn(CYTHON_UNUSED PyObject* gen, PyObject *re
-     }
-     return retval;
- }
-+#if CYTHON_COMPILING_IN_CPYTHON && PY_VERSION_HEX >= 0x03030000 && (defined(__linux__) || PY_VERSION_HEX >= 0x030600B3)
-+static CYTHON_INLINE
-+PyObject *__Pyx_PyGen_Send(PyGenObject *gen, PyObject *arg) {
-+#if PY_VERSION_HEX <= 0x030A00A1
-+    return _PyGen_Send(gen, arg);
-+#else
-+    PyObject *result;
-+    if (PyIter_Send((PyObject*)gen, arg ? arg : Py_None, &result) == PYGEN_RETURN) {
-+        if (PyAsyncGen_CheckExact(gen)) {
-+            assert(result == Py_None);
-+            PyErr_SetNone(PyExc_StopAsyncIteration);
-+        }
-+        else if (result == Py_None) {
-+            PyErr_SetNone(PyExc_StopIteration);
-+        }
-+        else {
-+            _PyGen_SetStopIterationValue(result);
-+        }
-+        Py_CLEAR(result);
-+    }
-+    return result;
-+#endif
-+}
-+#endif
- static CYTHON_INLINE
- PyObject *__Pyx_Coroutine_FinishDelegation(__pyx_CoroutineObject *gen) {
-     PyObject *ret;
-@@ -20943,12 +21080,12 @@ static PyObject *__Pyx_Coroutine_Send(PyObject *self, PyObject *value) {
-         #endif
-         #if CYTHON_COMPILING_IN_CPYTHON && PY_VERSION_HEX >= 0x03030000 && (defined(__linux__) || PY_VERSION_HEX >= 0x030600B3)
-         if (PyGen_CheckExact(yf)) {
--            ret = _PyGen_Send((PyGenObject*)yf, value == Py_None ? NULL : value);
-+            ret = __Pyx_PyGen_Send((PyGenObject*)yf, value == Py_None ? NULL : value);
-         } else
-         #endif
-         #if CYTHON_COMPILING_IN_CPYTHON && PY_VERSION_HEX >= 0x03050000 && defined(PyCoro_CheckExact) && (defined(__linux__) || PY_VERSION_HEX >= 0x030600B3)
-         if (PyCoro_CheckExact(yf)) {
--            ret = _PyGen_Send((PyGenObject*)yf, value == Py_None ? NULL : value);
-+            ret = __Pyx_PyGen_Send((PyGenObject*)yf, value == Py_None ? NULL : value);
-         } else
-         #endif
-         {
-@@ -21032,7 +21169,7 @@ static PyObject *__Pyx_Generator_Next(PyObject *self) {
-         #endif
-         #if CYTHON_COMPILING_IN_CPYTHON && PY_VERSION_HEX >= 0x03030000 && (defined(__linux__) || PY_VERSION_HEX >= 0x030600B3)
-         if (PyGen_CheckExact(yf)) {
--            ret = _PyGen_Send((PyGenObject*)yf, NULL);
-+            ret = __Pyx_PyGen_Send((PyGenObject*)yf, NULL);
-         } else
-         #endif
-         #ifdef __Pyx_Coroutine_USED
-@@ -21192,6 +21329,7 @@ static int __Pyx_Coroutine_clear(PyObject *self) {
-     }
- #endif
-     Py_CLEAR(gen->gi_code);
-+    Py_CLEAR(gen->gi_frame);
-     Py_CLEAR(gen->gi_name);
-     Py_CLEAR(gen->gi_qualname);
-     Py_CLEAR(gen->gi_modulename);
-@@ -21208,7 +21346,7 @@ static void __Pyx_Coroutine_dealloc(PyObject *self) {
-         if (PyObject_CallFinalizerFromDealloc(self))
- #else
-         Py_TYPE(gen)->tp_del(self);
--        if (self->ob_refcnt > 0)
-+        if (Py_REFCNT(self) > 0)
- #endif
-         {
-             return;
-@@ -21235,7 +21373,7 @@ static void __Pyx_Coroutine_del(PyObject *self) {
-     }
- #if !CYTHON_USE_TP_FINALIZE
-     assert(self->ob_refcnt == 0);
--    self->ob_refcnt = 1;
-+    __Pyx_SET_REFCNT(self, 1);
- #endif
-     __Pyx_PyThreadState_assign
-     __Pyx_ErrFetch(&error_type, &error_value, &error_traceback);
-@@ -21302,17 +21440,17 @@ static void __Pyx_Coroutine_del(PyObject *self) {
-     }
-     __Pyx_ErrRestore(error_type, error_value, error_traceback);
- #if !CYTHON_USE_TP_FINALIZE
--    assert(self->ob_refcnt > 0);
-+    assert(Py_REFCNT(self) > 0);
-     if (--self->ob_refcnt == 0) {
-         return;
-     }
-     {
--        Py_ssize_t refcnt = self->ob_refcnt;
-+        Py_ssize_t refcnt = Py_REFCNT(self);
-         _Py_NewReference(self);
--        self->ob_refcnt = refcnt;
-+        __Pyx_SET_REFCNT(self, refcnt);
-     }
- #if CYTHON_COMPILING_IN_CPYTHON
--    assert(PyType_IS_GC(self->ob_type) &&
-+    assert(PyType_IS_GC(Py_TYPE(self)) &&
-            _Py_AS_GC(self)->gc.gc_refs != _PyGC_REFS_UNTRACKED);
-     _Py_DEC_REFTOTAL;
- #endif
-@@ -21378,6 +21516,27 @@ __Pyx_Coroutine_set_qualname(__pyx_CoroutineObject *self, PyObject *value, CYTHO
-     Py_XDECREF(tmp);
-     return 0;
- }
-+static PyObject *
-+__Pyx_Coroutine_get_frame(__pyx_CoroutineObject *self, CYTHON_UNUSED void *context)
-+{
-+    PyObject *frame = self->gi_frame;
-+    if (!frame) {
-+        if (unlikely(!self->gi_code)) {
-+            Py_RETURN_NONE;
-+        }
-+        frame = (PyObject *) PyFrame_New(
-+            PyThreadState_Get(),            /*PyThreadState *tstate,*/
-+            (PyCodeObject*) self->gi_code,  /*PyCodeObject *code,*/
-+            __pyx_d,                 /*PyObject *globals,*/
-+            0                               /*PyObject *locals*/
-+        );
-+        if (unlikely(!frame))
-+            return NULL;
-+        self->gi_frame = frame;
-+    }
-+    Py_INCREF(frame);
-+    return frame;
-+}
- static __pyx_CoroutineObject *__Pyx__Coroutine_New(
-             PyTypeObject* type, __pyx_coroutine_body_t body, PyObject *code, PyObject *closure,
-             PyObject *name, PyObject *qualname, PyObject *module_name) {
-@@ -21411,6 +21570,7 @@ static __pyx_CoroutineObject *__Pyx__Coroutine_NewInit(
-     gen->gi_modulename = module_name;
-     Py_XINCREF(code);
-     gen->gi_code = code;
-+    gen->gi_frame = NULL;
-     PyObject_GC_Track(gen);
-     return gen;
- }
-@@ -21534,6 +21694,8 @@ static PyGetSetDef __pyx_Generator_getsets[] = {
-      (char*) PyDoc_STR("name of the generator"), 0},
-     {(char *) "__qualname__", (getter)__Pyx_Coroutine_get_qualname, (setter)__Pyx_Coroutine_set_qualname,
-      (char*) PyDoc_STR("qualified name of the generator"), 0},
-+    {(char *) "gi_frame", (getter)__Pyx_Coroutine_get_frame, NULL,
-+     (char*) PyDoc_STR("Frame of the generator"), 0},
-     {0, 0, 0, 0, 0}
- };
- static PyTypeObject __pyx_GeneratorType_type = {
--- 
-2.33.0
-
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch
new file mode 100644
index 000000000..67f7949b3
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/not-overwrite-cflags-cxxflags.patch
@@ -0,0 +1,28 @@
+Not overwrite CFLAGS and CXXFLAGS. It also avoid buildpaths qa issue:
+
+  WARNING: python3-wxgtk4-4.2.0-r0 do_package_qa: QA Issue: File
+  /usr/lib64/python3.11/site-packages/wx/.debug/_xml.cpython-311-aarch64-linux-gnu.so
+  in package python3-wxgtk4-dbg contains reference to TMPDIR [buildpaths]
+
+Upstream-Status: Pending [oe specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ wscript | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/wscript b/wscript
+index 067b307..50d96d1 100644
+--- a/wscript
++++ b/wscript
+@@ -195,8 +195,8 @@ def configure(conf):
+         cfg.finishSetup(conf.env.wx_config, conf.env.debug,
+                         'mingw32' if isWindows and not conf.env.use_msvc else None)
+ 
+-        conf.env.CFLAGS = cfg.cflags[:]
+-        conf.env.CXXFLAGS = cfg.cxxflags[:]
++        #conf.env.CFLAGS = cfg.cflags[:]
++        #conf.env.CXXFLAGS = cfg.cxxflags[:]
+         conf.env.CFLAGS_WX = list()
+         conf.env.CXXFLAGS_WX = list()
+         conf.env.CFLAGS_WXPY = list()
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch
deleted file mode 100644
index 51b9a462b..000000000
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/sip-fix-override-functions.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-It fails to compile with errors:
-
-| ../../../../sip/cpp/sip_gridwxGridEvent.cpp:35:9: error: 'int sipwxGridEvent::GetRow()'
-  marked 'override', but does not override
-|    35 |     int GetRow() SIP_OVERRIDE;
-|       |         ^~~~~~
-| ../../../../sip/cpp/sip_gridwxGridEvent.cpp:36:9: error: 'int sipwxGridEvent::GetCol()'
-  marked 'override', but does not over      ride
-|    36 |     int GetCol() SIP_OVERRIDE;
-|       |         ^~~~~~
-
-Make these functions non-override.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- sip/cpp/sip_gridwxGridEvent.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/sip/cpp/sip_gridwxGridEvent.cpp b/sip/cpp/sip_gridwxGridEvent.cpp
-index 0830b677..314aec94 100644
---- a/sip/cpp/sip_gridwxGridEvent.cpp
-+++ b/sip/cpp/sip_gridwxGridEvent.cpp
-@@ -32,8 +32,8 @@ public:
-      * this class.
-      */
- protected:
--    int GetRow() SIP_OVERRIDE;
--    int GetCol() SIP_OVERRIDE;
-+    int GetRow() ;
-+    int GetCol() ;
-      ::wxEvent* Clone() const SIP_OVERRIDE;
-      ::wxEventCategory GetEventCategory() const SIP_OVERRIDE;
- 
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
rename to meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
index 842c57646..faea43777 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.1.1.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
@@ -1,19 +1,20 @@
 DESCRIPTION = "Python3 interface to the wxWidgets Cross-platform C++ GUI toolkit."
 HOMEPAGE = "http://www.wxpython.org"
 
-LICENSE = "WXwindows"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce1d18e2d633d41786c0a8dfbc80917"
+LICENSE = "LGPL-2.0-only & WXwindows"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bdabf9e11191e2b9d3b6aef5f338ec00"
 
-DEPENDS = "wxwidgets-native wxwidgets"
+DEPENDS = "python3-attrdict3-native python3-six-native wxwidgets-native \
+           wxwidgets \
+           "
 
 PYPI_PACKAGE = "wxPython"
 
 SRC_URI += "file://add-back-option-build-base.patch \
             file://wxgtk-fixup-build-scripts.patch \
-            file://sip-fix-override-functions.patch \
-            file://0001-Update-Cython-version-to-fix-NanoSVG-issues-with-Pyt.patch \
+            file://not-overwrite-cflags-cxxflags.patch \
             "
-SRC_URI[sha256sum] = "00e5e3180ac7f2852f342ad341d57c44e7e4326de0b550b9a5c4a8361b6c3528"
+SRC_URI[sha256sum] = "663cebc4509d7e5d113518865fe274f77f95434c5d57bc386ed58d65ceed86c7"
 
 S = "${WORKDIR}/wxPython-${PV}"
 
@@ -33,5 +34,3 @@ RDEPENDS:${PN} = "\
     python3-six \
     python3-xml \
 "
-
-SKIP_RECIPE[python3-wxgtk4] ?= "Not compatible with py3.11; needs version update for both itself and wxwidgets"
-- 
2.17.1


