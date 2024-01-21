Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E99C47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 04:26:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.41475.1705811179986590432
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jan 2024 20:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JRrMIkCj;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-29023dec816so1903087a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Jan 2024 20:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705811179; x=1706415979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/tqiew5yKRHQeMsc+FHNU1X3MhHL0RZA2QU50YfgKcg=;
        b=JRrMIkCj6OQLy5stIvJHamdu4yfdLDdyw4friD3SKmO2K2uVM8LE0Oj1Utf1zchsjD
         t52hb6aEm66D9wb2EnDywPmSuZsHDS1huHqSEtHRrNE/bZmGgqsbHNC21UE6jNOQLZHB
         urJT4qGn+tSQtdA7MW7R66I8ZDEOsO0XWgR2oRjbYTqstznVL1oDZ1MRPbVNt4P0PnOH
         xwKDMOoCWhNBpYKtWVDMHY6V01VUFcA3IVFPydPDAyw5GEmHbFjFHRGoG9/yQUH1wfIR
         NB8qzlU+WocpVX6e3MJrH/EDrHyonFHxBbbxsThJWniry/qPmyAxw2rNcPB23h53ttWv
         nScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705811179; x=1706415979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tqiew5yKRHQeMsc+FHNU1X3MhHL0RZA2QU50YfgKcg=;
        b=Q8W2GoSFWxHWAVjh89eiCKPpcUCwSO6A1jEpikp0HhcFwqutCT7olKYr3U7ao7tGRv
         bcJs4EtffOnIf8SpLO9SrKdFRPfUF8AwHcgDuAlXyxMs0fCNzjRW9jrhSgK2CDTX7ZaA
         TL+17oRg7TNvn6QnoS3GXmnyjBvLyBABEPmTv/lnbPgeTyXsuPyIzRHZXTYx7Avy1MNw
         6eFeWNgcC8nUTY2uX6uVxVRSpeEz3n1P65XTnbIImho08i2HgcRb9za/wUarqnT/Vow9
         6IBgdFWsfuHuti/UXULmmheaGuYPWm1qw484gKs/5CmSx/Sh3090VGQz81HoJkDRnSCW
         qOog==
X-Gm-Message-State: AOJu0YwHubC4AOUncevJEDtzZjIVO0RlXbBOVXkDLkN0GZvaBcycOUmS
	aTE+1oNMx4lifs9XAOekLNGxI4BFBL7opLF5GYTYvlOGUObPgBFBDAh07kI9Wg8=
X-Google-Smtp-Source: AGHT+IG1/qb5gE/yZWACs2KpBf6JO9vijZgZseY447MVqUL8NSOO9EtWXF+/TtgZpTXC+3QgMTlzog==
X-Received: by 2002:a17:902:ed0c:b0:1d7:2723:b074 with SMTP id b12-20020a170902ed0c00b001d72723b074mr2589574pld.48.1705811178613;
        Sat, 20 Jan 2024 20:26:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::edfc])
        by smtp.gmail.com with ESMTPSA id e3-20020a170902744300b001d704c0d5c8sm5105768plt.113.2024.01.20.20.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 20:26:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-multidict: Make it work with python 3.12
Date: Sat, 20 Jan 2024 20:26:16 -0800
Message-ID: <20240121042616.145262-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Jan 2024 04:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108365

The needed fixes are in master branch and one more fix it still in a
pull request, bring them all in until 6.0.5 is released

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...multidict-909-to-3.12-as-well-to-add.patch | 324 ++++++++++++++++++
 .../python/python3-multidict_6.0.4.bb         |  11 +-
 2 files changed, 332 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-multidict/0001-Extend-aio-libs-multidict-909-to-3.12-as-well-to-add.patch

diff --git a/meta-python/recipes-devtools/python/python3-multidict/0001-Extend-aio-libs-multidict-909-to-3.12-as-well-to-add.patch b/meta-python/recipes-devtools/python/python3-multidict/0001-Extend-aio-libs-multidict-909-to-3.12-as-well-to-add.patch
new file mode 100644
index 0000000000..c3cee46439
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-multidict/0001-Extend-aio-libs-multidict-909-to-3.12-as-well-to-add.patch
@@ -0,0 +1,324 @@
+From 44eaa60cc6c86951ce36811e80c3411d1b1e4c39 Mon Sep 17 00:00:00 2001
+From: Charles Duffy <charles@dyfis.net>
+Date: Fri, 19 Jan 2024 17:47:59 -0600
+Subject: [PATCH] Extend aio-libs/multidict#909 to 3.12 as well to address aio-libs/multidict#926
+
+Upstream-Status: Submitted [https://github.com/aio-libs/multidict/pull/929]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ multidict/_multidict.c | 68 +++++++++++++++++++++---------------------
+ 1 file changed, 34 insertions(+), 34 deletions(-)
+
+diff --git a/multidict/_multidict.c b/multidict/_multidict.c
+index 228d4df..6086495 100644
+--- a/multidict/_multidict.c
++++ b/multidict/_multidict.c
+@@ -9,7 +9,7 @@
+ #include "_multilib/iter.h"
+ #include "_multilib/views.h"
+ 
+-#if PY_MAJOR_VERSION < 3 || PY_MINOR_VERSION < 13
++#if PY_MAJOR_VERSION < 3 || PY_MINOR_VERSION < 12
+ #ifndef _PyArg_UnpackKeywords
+ #define FASTCALL_OLD
+ #endif
+@@ -444,7 +444,7 @@ fail:
+ static inline PyObject *
+ multidict_getall(
+     MultiDictObject *self,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     PyObject *args,
+     PyObject *kwds
+ #else
+@@ -458,7 +458,7 @@ multidict_getall(
+              *key      = NULL,
+              *_default = NULL;
+ 
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     static char *getall_keywords[] = {"key", "default", NULL};
+ 
+     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:getall",
+@@ -509,7 +509,7 @@ skip_optional_pos:
+ static inline PyObject *
+ multidict_getone(
+     MultiDictObject *self,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     PyObject *args,
+     PyObject *kwds
+ #else
+@@ -522,7 +522,7 @@ multidict_getone(
+     PyObject *key      = NULL,
+              *_default = NULL;
+ 
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     static char *getone_keywords[] = {"key", "default", NULL};
+ 
+     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:getone",
+@@ -563,7 +563,7 @@ skip_optional_pos:
+ static inline PyObject *
+ multidict_get(
+     MultiDictObject *self,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     PyObject *args,
+     PyObject *kwds
+ #else
+@@ -577,7 +577,7 @@ multidict_get(
+              *_default = Py_None,
+              *ret;
+ 
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     static char *getone_keywords[] = {"key", "default", NULL};
+ 
+     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:getone",
+@@ -833,7 +833,7 @@ multidict_tp_init(MultiDictObject *self, PyObject *args, PyObject *kwds)
+ static inline PyObject *
+ multidict_add(
+     MultiDictObject *self,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     PyObject *args,
+     PyObject *kwds
+ #else
+@@ -846,7 +846,7 @@ multidict_add(
+     PyObject *key = NULL,
+              *val = NULL;
+ 
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     static char *kwlist[] = {"key", "value", NULL};
+     if (!PyArg_ParseTupleAndKeywords(args, kwds, "OO:add",
+                                      kwlist, &key, &val))
+@@ -913,7 +913,7 @@ multidict_clear(MultiDictObject *self)
+ static inline PyObject *
+ multidict_setdefault(
+     MultiDictObject *self,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     PyObject *args,
+     PyObject *kwds
+ #else
+@@ -926,7 +926,7 @@ multidict_setdefault(
+     PyObject *key      = NULL,
+              *_default = NULL;
+ 
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     static char *setdefault_keywords[] = {"key", "default", NULL};
+ 
+     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:setdefault",
+@@ -967,7 +967,7 @@ skip_optional_pos:
+ static inline PyObject *
+ multidict_popone(
+     MultiDictObject *self,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     PyObject *args,
+     PyObject *kwds
+ #else
+@@ -981,7 +981,7 @@ multidict_popone(
+              *_default = NULL,
+              *ret_val  = NULL;
+ 
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     static char *popone_keywords[] = {"key", "default", NULL};
+ 
+     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:popone",
+@@ -1046,7 +1046,7 @@ skip_optional_pos:
+ static inline PyObject *
+ multidict_pop(
+     MultiDictObject *self,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     PyObject *args,
+     PyObject *kwds
+ #else
+@@ -1060,7 +1060,7 @@ multidict_pop(
+              *_default = NULL,
+              *ret_val  = NULL;
+ 
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     static char *pop_keywords[] = {"key", "default", NULL};
+ 
+     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:popone",
+@@ -1113,7 +1113,7 @@ skip_optional_pos:
+ static inline PyObject *
+ multidict_popall(
+     MultiDictObject *self,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     PyObject *args,
+     PyObject *kwds
+ #else
+@@ -1128,7 +1128,7 @@ multidict_popall(
+              *ret_val  = NULL;
+ 
+ 
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     static char *popall_keywords[] = {"key", "default", NULL};
+ 
+     if (!PyArg_ParseTupleAndKeywords(args, kwds, "O|O:popall",
+@@ -1270,7 +1270,7 @@ static PyMethodDef multidict_methods[] = {
+     {
+         "getall",
+         (PyCFunction)multidict_getall,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         METH_VARARGS
+ #else
+         METH_FASTCALL
+@@ -1281,7 +1281,7 @@ static PyMethodDef multidict_methods[] = {
+     {
+         "getone",
+         (PyCFunction)multidict_getone,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         METH_VARARGS
+ #else
+         METH_FASTCALL
+@@ -1292,7 +1292,7 @@ static PyMethodDef multidict_methods[] = {
+     {
+         "get",
+         (PyCFunction)multidict_get,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         METH_VARARGS
+ #else
+         METH_FASTCALL
+@@ -1321,7 +1321,7 @@ static PyMethodDef multidict_methods[] = {
+     {
+         "add",
+         (PyCFunction)multidict_add,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         METH_VARARGS
+ #else
+         METH_FASTCALL
+@@ -1350,7 +1350,7 @@ static PyMethodDef multidict_methods[] = {
+     {
+         "setdefault",
+         (PyCFunction)multidict_setdefault,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         METH_VARARGS
+ #else
+         METH_FASTCALL
+@@ -1361,7 +1361,7 @@ static PyMethodDef multidict_methods[] = {
+     {
+         "popone",
+         (PyCFunction)multidict_popone,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         METH_VARARGS
+ #else
+         METH_FASTCALL
+@@ -1372,7 +1372,7 @@ static PyMethodDef multidict_methods[] = {
+     {
+         "pop",
+         (PyCFunction)multidict_pop,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         METH_VARARGS
+ #else
+         METH_FASTCALL
+@@ -1383,7 +1383,7 @@ static PyMethodDef multidict_methods[] = {
+     {
+         "popall",
+         (PyCFunction)multidict_popall,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         METH_VARARGS
+ #else
+         METH_FASTCALL
+@@ -1559,7 +1559,7 @@ multidict_proxy_tp_init(MultiDictProxyObject *self, PyObject *args,
+ static inline PyObject *
+ multidict_proxy_getall(
+     MultiDictProxyObject *self,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     PyObject *args,
+     PyObject *kwds
+ #else
+@@ -1572,7 +1572,7 @@ multidict_proxy_getall(
+     return multidict_getall(
+         self->md,
+         args,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         kwds
+ #else
+         nargs,
+@@ -1584,7 +1584,7 @@ multidict_proxy_getall(
+ static inline PyObject *
+ multidict_proxy_getone(
+     MultiDictProxyObject *self,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     PyObject *args,
+     PyObject *kwds
+ #else
+@@ -1596,7 +1596,7 @@ multidict_proxy_getone(
+ {
+     return multidict_getone(
+         self->md, args,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         kwds
+ #else
+         nargs, kwnames
+@@ -1607,7 +1607,7 @@ multidict_proxy_getone(
+ static inline PyObject *
+ multidict_proxy_get(
+     MultiDictProxyObject *self,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+     PyObject *args,
+     PyObject *kwds
+ #else
+@@ -1620,7 +1620,7 @@ multidict_proxy_get(
+     return multidict_get(
+         self->md,
+         args,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         kwds
+ #else
+         nargs,
+@@ -1734,7 +1734,7 @@ static PyMethodDef multidict_proxy_methods[] = {
+     {
+         "getall",
+         (PyCFunction)multidict_proxy_getall,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         METH_VARARGS
+ #else
+         METH_FASTCALL
+@@ -1745,7 +1745,7 @@ static PyMethodDef multidict_proxy_methods[] = {
+     {
+         "getone",
+         (PyCFunction)multidict_proxy_getone,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         METH_VARARGS
+ #else
+         METH_FASTCALL
+@@ -1756,7 +1756,7 @@ static PyMethodDef multidict_proxy_methods[] = {
+     {
+         "get",
+         (PyCFunction)multidict_proxy_get,
+-#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 13
++#if PY_MAJOR_VERSION >= 3 && PY_MINOR_VERSION >= 12
+         METH_VARARGS
+ #else
+         METH_FASTCALL
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb b/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
index 4869e846b0..23d3eb3155 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
@@ -2,13 +2,18 @@ SUMMARY = "Multidicts are useful for working with HTTP headers, URL query args e
 HOMEPAGE = "https://github.com/aio-libs/multidict/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=84c63e2bcd84e619d249af5181e2147f"
-
-SRC_URI[sha256sum] = "3666906492efb76453c0e7b97f2cf459b0682e7402c0489a95484965dbc1da49"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b4fef6e4b0828c2401fb983363985b39"
 
 inherit pypi setuptools3 ptest
 
+PV .= "+git"
+
+SRCREV = "82b559cdd0b41548f3dadc5561a9aaaa7f93ae14"
+PYPI_SRC_URI = "git://github.com/aio-libs/multidict;branch=master;protocol=https"
+S = "${WORKDIR}/git"
+
 SRC_URI += " \
+  file://0001-Extend-aio-libs-multidict-909-to-3.12-as-well-to-add.patch \
 	file://run-ptest \
 "
 
-- 
2.43.0


