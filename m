Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165A6C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 11:59:15 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.5233.1655207951015287937
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 04:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=MQy2t/Rh;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.46,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f46.google.com with SMTP id c21so10984327wrb.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 04:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Kh45rz/IuGfZJhfMxwSrdKBsQY+VjOcFaRQjYe2I9Q=;
        b=MQy2t/Rh5QsVdN3TsoaPIg0fV8FABoxYoETrg+MEIte3SlEkYctM+KiBmhI+rkZlrW
         nzS6TYwnSeHUoPut7e7QPEiu3JADGKBXXWKgLOHp4rSSTn9gKmiJjt8oJ5BJ4vgoYuNH
         +Jbtz2+yntLNDZNnJ/IGC5gsOuv4NEVu4N1qfHv8uQA7dwFBmq9g6z40ClMc3YOHTEAr
         N3ifAN/+lrRLKeWUeoh57rUXy8dlooK/HqU9lJleIPE7W8yTQzCNzGwWzai7T9Uj3XTT
         uwozHY8cRoUig5ImsNGZn0TQxsLUt0XricEsLiMyPH4AzzgQOmlGtFUcIwFstKUyniI2
         ZDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Kh45rz/IuGfZJhfMxwSrdKBsQY+VjOcFaRQjYe2I9Q=;
        b=SmoLNIYuWs5RaTl8iMmF5/33LZveNfgeouUeIii5ttCAMrC8QwxLC5aqW06P7K9q8y
         oxqkB9uPq8RHYZ+7oJQNWhthj2UkXvPwILQ4D7dzVcdgi8tnmfZJ4cXucnB6j4C/jITA
         HOpCh3fDjlt4BJq2MbheqDADUxfyHdgTKZUApYwKBKN8vayZbx8PR4oIvAJEKZqU1rJY
         Z7119e5vtIC7GcU7dbkLeyCm4WpTmF3OrRgfF7utuplRACa5nV5mOQjKvi8ARGQGJsKo
         HaEE4XDBGN75Q+mdeYZK3KF3TGmNc8hF7BnKns/QcGtpKIbr/o1+sxO5k8PRTYFsf1YS
         Rfqg==
X-Gm-Message-State: AJIora9fnWEPacED01jitvFII/ao95Kl0BJKD1su1G2lzjsm/iv5iTPt
	hMkrEL3B2UEyHQDQxhvOas0xww==
X-Google-Smtp-Source: 
 AGRyM1te+4/0ycVdQXqEcJBd5DQxJAi6QwlOafNHojuF16fEGdxERaqcMa8R1B2zmzZ0yojzSqXsvw==
X-Received: by 2002:adf:f5c4:0:b0:210:2ac2:6aa0 with SMTP id
 k4-20020adff5c4000000b002102ac26aa0mr4477358wrp.300.1655207948901;
        Tue, 14 Jun 2022 04:59:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:1e97:30df:17ed:7932])
        by smtp.gmail.com with ESMTPSA id
 n31-20020a05600c501f00b003976fbfbf00sm12745710wmr.30.2022.06.14.04.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 04:59:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] python3-pybluez: fix a runtime issue with python 3.10
Date: Tue, 14 Jun 2022 13:59:06 +0200
Message-Id: <20220614115906.37309-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 11:59:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97513

Add an upstream patch that's not part of any release yet that addresses
an issue with python 3.10 (related to a missing macro).

Link: https://github.com/pybluez/pybluez/issues/426
Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 ...hen-parsing-buffer-length-fix-426-42.patch | 153 ++++++++++++++++++
 .../python/python3-pybluez_0.23.bb            |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch

diff --git a/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch b/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch
new file mode 100644
index 000000000..9126aba8d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybluez/0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch
@@ -0,0 +1,153 @@
+From aa8ee5e5e934908f0357364f6ec90a3ecda62880 Mon Sep 17 00:00:00 2001
+From: Nicolas Schodet <nico@ni.fr.eu.org>
+Date: Mon, 3 Jan 2022 02:37:01 +0100
+Subject: [PATCH] Use Py_ssize_t when parsing buffer length, fix #426 (#427)
+
+From python 3.9 documentation:
+
+> For all # variants of formats (s#, y#, etc.), the macro
+> PY_SSIZE_T_CLEAN must be defined before including Python.h. On Python
+> 3.9 and older, the type of the length argument is Py_ssize_t if the
+> PY_SSIZE_T_CLEAN macro is defined, or int otherwise.
+
+From python 3.8 changes:
+
+> Use of # variants of formats in parsing or building value (e.g.
+> PyArg_ParseTuple(), Py_BuildValue(), PyObject_CallFunction(), etc.)
+> without PY_SSIZE_T_CLEAN defined raises DeprecationWarning now. It
+> will be removed in 3.10 or 4.0. Read Parsing arguments and building
+> values for detail. (Contributed by Inada Naoki in bpo-36381.)
+
+Fixes https://github.com/pybluez/pybluez/issues/426
+---
+Upstream-Status: Accepted
+
+ bluez/btmodule.c | 23 ++++++++++++++---------
+ msbt/_msbt.c     |  6 ++++--
+ 2 files changed, 18 insertions(+), 11 deletions(-)
+
+diff --git a/bluez/btmodule.c b/bluez/btmodule.c
+index 518b723..912a489 100644
+--- a/bluez/btmodule.c
++++ b/bluez/btmodule.c
+@@ -16,7 +16,8 @@ Local naming conventions:
+ - names starting with bt_ are module-level functions
+ 
+ */
+-
++#define PY_SSIZE_T_CLEAN 1
++#include "Python.h"
+ #include "btmodule.h"
+ #include "structmember.h"
+ 
+@@ -732,7 +733,7 @@ sock_setsockopt(PySocketSockObject *s, PyObject *args)
+     int optname;
+     int res;
+     void *buf;
+-    int buflen;
++    Py_ssize_t buflen;
+     int flag;
+ 
+     if (PyArg_ParseTuple(args, "iii:setsockopt", &level, &optname, &flag)) {
+@@ -2001,7 +2002,8 @@ static PyObject *
+ bt_hci_send_cmd(PyObject *self, PyObject *args)
+ {
+     PySocketSockObject *socko = NULL;
+-    int err, plen = 0;
++    int err;
++    Py_ssize_t plen = 0;
+     uint16_t ogf, ocf;
+     char *param = NULL;
+     int dd = 0;
+@@ -2036,6 +2038,7 @@ bt_hci_send_req(PyObject *self, PyObject *args, PyObject *kwds)
+     int err;
+     int to=0;
+     char rparam[256];
++    Py_ssize_t req_clen;
+     struct hci_request req = { 0 };
+     int dd = 0;
+ 
+@@ -2043,9 +2046,10 @@ bt_hci_send_req(PyObject *self, PyObject *args, PyObject *kwds)
+                                 "timeout", 0 };
+ 
+     if( !PyArg_ParseTupleAndKeywords(args, kwds, "OHHii|s#i", keywords,
+-                &socko, &req.ogf, &req.ocf, &req.event, &req.rlen, 
+-                &req.cparam, &req.clen, &to) )
++                &socko, &req.ogf, &req.ocf, &req.event, &req.rlen,
++                &req.cparam, &req_clen, &to) )
+         return 0;
++    req.clen = req_clen;
+ 
+     req.rparam = rparam;
+     dd = socko->sock_fd;
+@@ -2274,7 +2278,8 @@ Returns the name of the device, or raises an error on failure");
+ static PyObject * bt_hci_filter_ ## name (PyObject *self, PyObject *args )\
+ { \
+     char *param; \
+-    int len, arg; \
++    Py_ssize_t len; \
++    int arg; \
+     if( !PyArg_ParseTuple(args,"s#i", &param, &len, &arg) ) \
+         return 0; \
+     if( len != sizeof(struct hci_filter) ) { \
+@@ -2303,7 +2308,7 @@ DECL_HCI_FILTER_OP_1(test_opcode, "test opcode!")
+ static PyObject * bt_hci_filter_ ## name (PyObject *self, PyObject *args )\
+ { \
+     char *param; \
+-    int len; \
++    Py_ssize_t len; \
+     if( !PyArg_ParseTuple(args,"s#", &param, &len) ) \
+         return 0; \
+     if( len != sizeof(struct hci_filter) ) { \
+@@ -2364,7 +2369,7 @@ static PyObject *
+ bt_ba2str(PyObject *self, PyObject *args)
+ {
+     char *data=NULL;
+-    int len=0;
++    Py_ssize_t len=0;
+     char ba_str[19] = {0};
+     if (!PyArg_ParseTuple(args, "s#", &data, &len)) return 0;
+     ba2str((bdaddr_t*)data, ba_str);
+@@ -2579,7 +2584,7 @@ bt_sdp_advertise_service( PyObject *self, PyObject *args )
+          *provider = NULL, 
+          *description = NULL;
+     PyObject *service_classes, *profiles, *protocols;
+-    int namelen = 0, provlen = 0, desclen = 0;
++    Py_ssize_t namelen = 0, provlen = 0, desclen = 0;
+     uuid_t svc_uuid = { 0 };
+     int i;
+     char addrbuf[256] = { 0 };
+diff --git a/msbt/_msbt.c b/msbt/_msbt.c
+index b3d27ff..81f5ee9 100644
+--- a/msbt/_msbt.c
++++ b/msbt/_msbt.c
+@@ -2,6 +2,8 @@
+ #define UNICODE
+ #endif
+ 
++#define PY_SSIZE_T_CLEAN 1
++
+ #include <winsock2.h>
+ #include <ws2bth.h>
+ #include <BluetoothAPIs.h>
+@@ -155,7 +157,7 @@ static PyObject *
+ msbt_bind(PyObject *self, PyObject *args)
+ {
+     wchar_t *addrstr = NULL;
+-    int addrstrlen = -1;
++    Py_ssize_t addrstrlen = -1;
+     int sockfd = -1;
+     int port = -1;
+     char buf[100] = { 0 };
+@@ -765,7 +767,7 @@ msbt_set_service_raw(PyObject *self, PyObject *args)
+     WSAESETSERVICEOP op;
+ 
+     char *record = NULL;
+-    int reclen = -1;
++    Py_ssize_t reclen = -1;
+     BTH_SET_SERVICE *si = NULL;
+     int silen = -1;
+     ULONG sdpVersion = BTH_SDP_VERSION;
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
index b32f3a362..6a1df273a 100644
--- a/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
+++ b/meta-python/recipes-devtools/python/python3-pybluez_0.23.bb
@@ -7,6 +7,7 @@ DEPENDS = "bluez5"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
 
+SRC_URI += "file://0001-Use-Py_ssize_t-when-parsing-buffer-length-fix-426-42.patch"
 SRC_URI[md5sum] = "afbe8429bb82d2c46a3d0f5f4f898f9d"
 SRC_URI[sha256sum] = "c8f04d2e78951eaa9de486b4d49381704e8943d0a6e6e58f55fcd7b8582e90de"
 
-- 
2.34.1


