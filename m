Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9639C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 19:58:31 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.1679.1711396700938323626
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 12:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bUFAQSTu;
 spf=pass (domain: konsulko.com, ip: 209.85.208.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56c28b368efso19897a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 12:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711396699; x=1712001499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEf3pPKpgdfAn02D/H5LZ+juTmaDteag6GXMjSUT8VQ=;
        b=bUFAQSTuGwJU8Qj/V9DSguicuIod1W4VOUK3bv6shHUq+JjWZrwbEeX+Q51X1K61si
         dob9uVawzyzXxQYmRFx2Mcd1kQTaAvajn1N67iFLaO1jeRXqBYV+3Ivde6hK6MNtN0Pb
         6d8Ef9F3EsTpVZeBNd74PERqFBDUCpYpbx9q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711396699; x=1712001499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEf3pPKpgdfAn02D/H5LZ+juTmaDteag6GXMjSUT8VQ=;
        b=Pmdkce97SlukaHtF2yNq6yauK7PSDtzydtg52pNzI6UXProKuhX9fK+cKllLuNpEXa
         9OFlxdz4wHFLYmjxVfgbicPL6J9OH+KkQP0zmOlbmrHy43ZNUFE3/QMA+NfcqCR4d2uk
         LhlP/Cxgqt/1CDAKECqs07sU1Cb1wleLFCrPZZCIcERWg7d1isl3vrvRzKfScnrctOtG
         TBsL8y4CsTJ9NO06Gdt8tFqaf72b2z4zeFrKSEe5yY4DiiuF+v6P1E5YyvI/PIc1ghz8
         q722qu9RJzgXEF/J0Z71JWBzM+bsm4wicpXTPDpXbGkyI/mjAgrH3vqL7nN8vW384nWi
         W0TQ==
X-Gm-Message-State: AOJu0Yxaj29S4HilZO9WhCxx1BBNW4mBZUntn00swtHtAS6M0Bq8Cncl
	49k3gpNQsuKiyTZ3ShCohdmMMD3MXLbA5wpfETrZ7GZ++1phMvC1AxTiWavlysMPLSNoWGUy/QD
	/
X-Google-Smtp-Source: AGHT+IFQp9wTB76ZwtpwbZXDausovo/4FsQrVcgfJwFURkMC5ZB+vYNp3rgiEe3VWDWlhU/MT8ZIiA==
X-Received: by 2002:a50:9e65:0:b0:568:b5ce:14f9 with SMTP id z92-20020a509e65000000b00568b5ce14f9mr550262ede.38.1711396698703;
        Mon, 25 Mar 2024 12:58:18 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id r13-20020a056402018d00b0056c18b79cd3sm898574edv.22.2024.03.25.12.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:58:18 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-multidict: Upgrade 6.0.4 -> 6.0.5
Date: Mon, 25 Mar 2024 21:58:12 +0200
Message-Id: <20240325195814.2825816-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 19:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109605

Upgrade to version 6.0.5:

- Upgraded the C-API macros that have been deprecated in Python 3.9
  and later removed in 3.13
- Reverted to using the public argument parsing API
  PyArg_ParseTupleAndKeywords() under Python 3.12.
- The effect is that this change prevents build failures with clang
  16.9.6 and gcc-14. It also fixes a segmentation fault crash
  caused by passing keyword arguments to MultiDict.getall().
- Fixed a SystemError: null argument to internal routine error on a
  MultiDict.items().isdisjoint() call when using C Extensions.
- On the Contributing docs age, a link to the Towncrier philosophy
  has been fixed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...multidict-909-to-3.12-as-well-to-add.patch | 324 ------------------
 ...ct_6.0.4.bb => python3-multidict_6.0.5.bb} |   3 +-
 2 files changed, 1 insertion(+), 326 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-multidict/0001-Extend-aio-libs-multidict-909-to-3.12-as-well-to-add.patch
 rename meta-python/recipes-devtools/python/{python3-multidict_6.0.4.bb => python3-multidict_6.0.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict/0001-Extend-aio-libs-multidict-909-to-3.12-as-well-to-add.patch b/meta-python/recipes-devtools/python/python3-multidict/0001-Extend-aio-libs-multidict-909-to-3.12-as-well-to-add.patch
deleted file mode 100644
index c3cee4643..000000000
--- a/meta-python/recipes-devtools/python/python3-multidict/0001-Extend-aio-libs-multidict-909-to-3.12-as-well-to-add.patch
+++ /dev/null
@@ -1,324 +0,0 @@
-From 44eaa60cc6c86951ce36811e80c3411d1b1e4c39 Mon Sep 17 00:00:00 2001
-From: Charles Duffy <charles@dyfis.net>
-Date: Fri, 19 Jan 2024 17:47:59 -0600
-Subject: [PATCH] Extend aio-libs/multidict#909 to 3.12 as well to address aio-libs/multidict#926
-
-Upstream-Status: Submitted [https://github.com/aio-libs/multidict/pull/929]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- multidict/_multidict.c | 68 +++++++++++++++++++++---------------------
- 1 file changed, 34 insertions(+), 34 deletions(-)
-
-diff --git a/multidict/_multidict.c b/multidict/_multidict.c
-index 228d4df..6086495 100644
---- a/multidict/_multidict.c
-+++ b/multidict/_multidict.c
-@@ -9,7 +9,7 @@
- #include "_multilib/iter.h"
- #include "_multilib/views.h"
- 
--#if PY_MAJOR_VERSION < 3 || PY_MINOR_VERSION < 13
-+#if PY_MAJOR_VERSION < 3 || PY_MINOR_VERSION < 12
- #ifndef _PyArg_UnpackKeywords
- #define FASTCALL_OLD
- #endif
-@@ -444,7 +444,7 @@ fail:
- static inline PyObject *
- multidict_getall(
-     MultiDictObject *self,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     PyObject *args,
-     PyObject *kwds
- #else
-@@ -458,7 +458,7 @@ multidict_getall(
-              *key      = NULL,
-              *_default = NULL;
- 
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     static char *getall_keywords[] = {"key", "default", NULL};
- 
-     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:getall",
-@@ -509,7 +509,7 @@ skip_optional_pos:
- static inline PyObject *
- multidict_getone(
-     MultiDictObject *self,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     PyObject *args,
-     PyObject *kwds
- #else
-@@ -522,7 +522,7 @@ multidict_getone(
-     PyObject *key      = NULL,
-              *_default = NULL;
- 
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     static char *getone_keywords[] = {"key", "default", NULL};
- 
-     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:getone",
-@@ -563,7 +563,7 @@ skip_optional_pos:
- static inline PyObject *
- multidict_get(
-     MultiDictObject *self,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     PyObject *args,
-     PyObject *kwds
- #else
-@@ -577,7 +577,7 @@ multidict_get(
-              *_default = Py_None,
-              *ret;
- 
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     static char *getone_keywords[] = {"key", "default", NULL};
- 
-     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:getone",
-@@ -833,7 +833,7 @@ multidict_tp_init(MultiDictObject *self, PyObject *args, PyObject *kwds)
- static inline PyObject *
- multidict_add(
-     MultiDictObject *self,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     PyObject *args,
-     PyObject *kwds
- #else
-@@ -846,7 +846,7 @@ multidict_add(
-     PyObject *key = NULL,
-              *val = NULL;
- 
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     static char *kwlist[] = {"key", "value", NULL};
-     if (!PyArg_ParseTupleAndKeywords(args, kwds, "OO:add",
-                                      kwlist, &key, &val))
-@@ -913,7 +913,7 @@ multidict_clear(MultiDictObject *self)
- static inline PyObject *
- multidict_setdefault(
-     MultiDictObject *self,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     PyObject *args,
-     PyObject *kwds
- #else
-@@ -926,7 +926,7 @@ multidict_setdefault(
-     PyObject *key      = NULL,
-              *_default = NULL;
- 
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     static char *setdefault_keywords[] = {"key", "default", NULL};
- 
-     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:setdefault",
-@@ -967,7 +967,7 @@ skip_optional_pos:
- static inline PyObject *
- multidict_popone(
-     MultiDictObject *self,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     PyObject *args,
-     PyObject *kwds
- #else
-@@ -981,7 +981,7 @@ multidict_popone(
-              *_default = NULL,
-              *ret_val  = NULL;
- 
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     static char *popone_keywords[] = {"key", "default", NULL};
- 
-     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:popone",
-@@ -1046,7 +1046,7 @@ skip_optional_pos:
- static inline PyObject *
- multidict_pop(
-     MultiDictObject *self,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     PyObject *args,
-     PyObject *kwds
- #else
-@@ -1060,7 +1060,7 @@ multidict_pop(
-              *_default = NULL,
-              *ret_val  = NULL;
- 
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     static char *pop_keywords[] = {"key", "default", NULL};
- 
-     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:popone",
-@@ -1113,7 +1113,7 @@ skip_optional_pos:
- static inline PyObject *
- multidict_popall(
-     MultiDictObject *self,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     PyObject *args,
-     PyObject *kwds
- #else
-@@ -1128,7 +1128,7 @@ multidict_popall(
-              *ret_val  = NULL;
- 
- 
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     static char *popall_keywords[] = {"key", "default", NULL};
- 
-     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:popall",
-@@ -1270,7 +1270,7 @@ static PyMethodDef multidict_methods[] = {
-     {
-         "getall",
-         (PyCFunction)multidict_getall,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         METH_VARARGS
- #else
-         METH_FASTCALL
-@@ -1281,7 +1281,7 @@ static PyMethodDef multidict_methods[] = {
-     {
-         "getone",
-         (PyCFunction)multidict_getone,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         METH_VARARGS
- #else
-         METH_FASTCALL
-@@ -1292,7 +1292,7 @@ static PyMethodDef multidict_methods[] = {
-     {
-         "get",
-         (PyCFunction)multidict_get,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         METH_VARARGS
- #else
-         METH_FASTCALL
-@@ -1321,7 +1321,7 @@ static PyMethodDef multidict_methods[] = {
-     {
-         "add",
-         (PyCFunction)multidict_add,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         METH_VARARGS
- #else
-         METH_FASTCALL
-@@ -1350,7 +1350,7 @@ static PyMethodDef multidict_methods[] = {
-     {
-         "setdefault",
-         (PyCFunction)multidict_setdefault,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         METH_VARARGS
- #else
-         METH_FASTCALL
-@@ -1361,7 +1361,7 @@ static PyMethodDef multidict_methods[] = {
-     {
-         "popone",
-         (PyCFunction)multidict_popone,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         METH_VARARGS
- #else
-         METH_FASTCALL
-@@ -1372,7 +1372,7 @@ static PyMethodDef multidict_methods[] = {
-     {
-         "pop",
-         (PyCFunction)multidict_pop,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         METH_VARARGS
- #else
-         METH_FASTCALL
-@@ -1383,7 +1383,7 @@ static PyMethodDef multidict_methods[] = {
-     {
-         "popall",
-         (PyCFunction)multidict_popall,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         METH_VARARGS
- #else
-         METH_FASTCALL
-@@ -1559,7 +1559,7 @@ multidict_proxy_tp_init(MultiDictProxyObject *self, PyObject *args,
- static inline PyObject *
- multidict_proxy_getall(
-     MultiDictProxyObject *self,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     PyObject *args,
-     PyObject *kwds
- #else
-@@ -1572,7 +1572,7 @@ multidict_proxy_getall(
-     return multidict_getall(
-         self->md,
-         args,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         kwds
- #else
-         nargs,
-@@ -1584,7 +1584,7 @@ multidict_proxy_getall(
- static inline PyObject *
- multidict_proxy_getone(
-     MultiDictProxyObject *self,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     PyObject *args,
-     PyObject *kwds
- #else
-@@ -1596,7 +1596,7 @@ multidict_proxy_getone(
- {
-     return multidict_getone(
-         self->md, args,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         kwds
- #else
-         nargs, kwnames
-@@ -1607,7 +1607,7 @@ multidict_proxy_getone(
- static inline PyObject *
- multidict_proxy_get(
-     MultiDictProxyObject *self,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-     PyObject *args,
-     PyObject *kwds
- #else
-@@ -1620,7 +1620,7 @@ multidict_proxy_get(
-     return multidict_get(
-         self->md,
-         args,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         kwds
- #else
-         nargs,
-@@ -1734,7 +1734,7 @@ static PyMethodDef multidict_proxy_methods[] = {
-     {
-         "getall",
-         (PyCFunction)multidict_proxy_getall,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         METH_VARARGS
- #else
-         METH_FASTCALL
-@@ -1745,7 +1745,7 @@ static PyMethodDef multidict_proxy_methods[] = {
-     {
-         "getone",
-         (PyCFunction)multidict_proxy_getone,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         METH_VARARGS
- #else
-         METH_FASTCALL
-@@ -1756,7 +1756,7 @@ static PyMethodDef multidict_proxy_methods[] = {
-     {
-         "get",
-         (PyCFunction)multidict_proxy_get,
--#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
-+#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
-         METH_VARARGS
- #else
-         METH_FASTCALL
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb b/meta-python/recipes-devtools/python/python3-multidict_6.0.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.0.5.bb
index 19b94dee0..b12e180d0 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.0.5.bb
@@ -8,12 +8,11 @@ inherit pypi setuptools3 ptest
 
 PV .= "+git"
 
-SRCREV = "82b559cdd0b41548f3dadc5561a9aaaa7f93ae14"
+SRCREV = "a9b281b2ef4ab25d95d6b268aa88c428e75c3696"
 PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
 SRC_URI += " \
-  file://0001-Extend-aio-libs-multidict-909-to-3.12-as-well-to-add.patch \
 	file://run-ptest \
 "
 
-- 
2.39.2


