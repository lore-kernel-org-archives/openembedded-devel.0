Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 964BA6BE2A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 18:46:34 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id b19so508934pfo.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Dec 2019 10:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3M5DDJTkZrK3KseVbm/LITVNF2yQhCMQ1O+g+5pFTrI=;
	b=SjVtQIPqCkapc4SgpK1VnfCM5liWcv0Y+8LeewPxazc2/Mc4RSGSfn44ooM55x0RhQ
	dloi1lvJag5dqugzxZy7VaDGoCNpXlWp830Cw2oI+TkNUFblAMtT/mrDDdjun4JiRuKU
	2jaBSUgEysFaQKRAz8W3mjtGNuJEQmuVo7RwW4loOfr9mgmULjQBaBLtSkkhRy6g0hNa
	m5lGftdnY2gubSl8+przmX+8v1Gux/qQPgtT2lTxEUS9wuvGXaPdn3Y6DD1xfSuLS0KE
	SJ5jckiHcueiG3pQO8dmfVQNxiVp8EhpwZnjFCW9aN7QfMUGJVGlyaMUij+SvXIlan8z
	C7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3M5DDJTkZrK3KseVbm/LITVNF2yQhCMQ1O+g+5pFTrI=;
	b=GuQg3oEDufjho4ZQ3/Dgf6kRSCd6yoHXsFRrwRrkhg8TAK8U5CObgO5whodx7hLkP4
	A2C+XjLu76OmoiQSx/HpGjacxSb7Nd4GCrRjrkHPshh8uMc3s23Pp693i5IveZ8Nc/PD
	kB/fz3tf5CV9bEvhxnZZRbFbgzazDfHeYjCNBhGPC7jes2WBP8yKW5ENy0ZNecuXiUeC
	DGLr1I/78W+4kkJmrBqyLB9FCCyeyQkfYh5YxsVmBjvWfmjg2GmYIJ2BIP+2ru+rlwtI
	1DURuqOBGGOwIzRSj8GHJtmVInHvxkeaQCNY/23oRG/p6GURll1x/uRsHyimauwvlXs2
	ZY4Q==
X-Gm-Message-State: APjAAAU+pZRTxw0+tjDlcDLIn53qFm3iMQmNathbBzIwR680PN/iXYga
	K3acHC1B2Gr+Y9JB8pH6NgbhcEfx7OM=
X-Google-Smtp-Source: APXvYqxYIkeMuTmyD6jQNTAh+27FbESWPIcvw/OB5VCuKSQQclfvoH32Gdj/z2UYOsEwoAcVkC9sRQ==
X-Received: by 2002:a63:fc13:: with SMTP id j19mr27147367pgi.327.1575225994846;
	Sun, 01 Dec 2019 10:46:34 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8500:1c20:55f2:e19b:8d5e:a884])
	by smtp.gmail.com with ESMTPSA id
	y24sm33916800pfr.116.2019.12.01.10.46.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Dec 2019 10:46:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Dec 2019 10:46:14 -0800
Message-Id: <20191201184622.889513-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/9] python-evdev: Fix build for 32bit arches with 64bit time_t
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Dec 2019 18:46:34 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python-evdev.inc  |  4 +
 ...ld-on-32bit-arches-with-64bit-time_t.patch | 83 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-evdev/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch

diff --git a/meta-python/recipes-devtools/python/python-evdev.inc b/meta-python/recipes-devtools/python/python-evdev.inc
index 953094ba74..a536815358 100644
--- a/meta-python/recipes-devtools/python/python-evdev.inc
+++ b/meta-python/recipes-devtools/python/python-evdev.inc
@@ -3,6 +3,10 @@ HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
 
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-evdev:"
+
+SRC_URI += " file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch"
+
 SRC_URI[md5sum] = "53e440943dfa2514f95b3c448d6a36cb"
 SRC_URI[sha256sum] = "b03f5e1be5b4a5327494a981b831d251a142b09e8778eda1a8b53eba91100166"
 
diff --git a/meta-python/recipes-devtools/python/python-evdev/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch b/meta-python/recipes-devtools/python/python-evdev/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
new file mode 100644
index 0000000000..154172ca88
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-evdev/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
@@ -0,0 +1,83 @@
+From 435e78aaf6745e4da0fe3d4455473011626c77d1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Nov 2019 11:21:20 -0800
+Subject: [PATCH] Fix build on 32bit arches with 64bit time_t
+
+time element is deprecated on new input_event structure in kernel's
+input.h [1]
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=152194fe9c3f
+
+Upstream-Status: Submitted [https://github.com/gvalkov/python-evdev/pull/112]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ evdev/input.c  | 13 +++++++++----
+ evdev/uinput.c |  9 ++++++++-
+ 2 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/evdev/input.c b/evdev/input.c
+index 67b9348..432db92 100644
+--- a/evdev/input.c
++++ b/evdev/input.c
+@@ -24,6 +24,11 @@
+ #include <linux/input.h>
+ #endif
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
++
+ #define MAX_NAME_SIZE 256
+ 
+ extern char*  EV_NAME[EV_CNT];
+@@ -60,8 +65,8 @@ device_read(PyObject *self, PyObject *args)
+         return NULL;
+     }
+ 
+-    PyObject* sec  = PyLong_FromLong(event.time.tv_sec);
+-    PyObject* usec = PyLong_FromLong(event.time.tv_usec);
++    PyObject* sec  = PyLong_FromLong(event.input_event_sec);
++    PyObject* usec = PyLong_FromLong(event.input_event_usec);
+     PyObject* val  = PyLong_FromLong(event.value);
+     PyObject* py_input_event = NULL;
+ 
+@@ -102,8 +107,8 @@ device_read_many(PyObject *self, PyObject *args)
+ 
+     // Construct a list of event tuples, which we'll make sense of in Python
+     for (unsigned i = 0 ; i < nread/event_size ; i++) {
+-        sec  = PyLong_FromLong(event[i].time.tv_sec);
+-        usec = PyLong_FromLong(event[i].time.tv_usec);
++        sec  = PyLong_FromLong(event[i].input_event_sec);
++        usec = PyLong_FromLong(event[i].input_event_usec);
+         val  = PyLong_FromLong(event[i].value);
+ 
+         py_input_event = Py_BuildValue("OOhhO", sec, usec, event[i].type, event[i].code, val);
+diff --git a/evdev/uinput.c b/evdev/uinput.c
+index 192568d..56fe86c 100644
+--- a/evdev/uinput.c
++++ b/evdev/uinput.c
+@@ -16,6 +16,10 @@
+ #include <linux/uinput.h>
+ #endif
+ 
++#ifndef input_event_sec
++#define input_event_sec time.tv_sec
++#define input_event_usec time.tv_usec
++#endif
+ 
+ // Workaround for installing on kernels newer than 4.4.
+ #ifndef FF_MAX_EFFECTS
+@@ -232,8 +236,11 @@ uinput_write(PyObject *self, PyObject *args)
+     if (!ret) return NULL;
+ 
+     struct input_event event;
++    struct timeval tval;
+     memset(&event, 0, sizeof(event));
+-    gettimeofday(&event.time, 0);
++    gettimeofday(&tval, 0);
++    event.input_event_usec = tval.tv_usec;
++    event.input_event_sec = tval.tv_sec;
+     event.type = type;
+     event.code = code;
+     event.value = value;
-- 
2.24.0


