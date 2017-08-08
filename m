Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 986E977BB1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:48:18 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id y129so4154208pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uiEPDrrdwE0BNK1RQe5/p0Yv55IvkzXy/BEQ2X+pt7I=;
	b=FSCe1OzudTQRrRtyr2lOeYTwCvoScTZ6Tza4pevl0huQLOK5aOX6I5l/5KkLh717V3
	dWC4LE/jnXx2HiJqZ8s49yfyIKFmn2Dhqg5Gv5tlteeVjXtAle5pMK1YFO0kpyEQjvtl
	xSxuOe9jfnksxAjYVVykuVDlAFZmF3Fb6dhPM6lEqP5xSHD/ILEcOPaHky1w/uYzo0PN
	/3/3GvD4NUYVJsCK0ONDEZesBATtHgka+wZ0xavKEOvcNBPmVtmded9E5ni/B8N9OWBC
	9w/n+qQvBB2W//IKvcpV26ilwiNsJQNBKR6P8OsPR5UWjXmGuyroVIMrQgCREJtfVqLC
	KQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uiEPDrrdwE0BNK1RQe5/p0Yv55IvkzXy/BEQ2X+pt7I=;
	b=lxrdE4NVvSei9FFrNWHurD9lRnaNZj0+cQXotXOsYhLKWsvGtFq7Ijid+JQqX10TQE
	4A1cxudKHbWQpzUueaaCxe3qd2g/Sxo7282Fpv5Wzr2eD6venk9tOZp63lvfkaRkzEnH
	mvft4+rfH6d2RCnCkWXfPbTaa6WcKZv4N2hJBAY/eXOqwyLSU/kA2ymjjhSeL7fVcLas
	BTlYa6GTmN6ej1aL64uukQuPNTQALQQZqWNTuf+biWm3UZQZNmMuSAdY7k8iRJx035x6
	QzdvyUGKbSodKM8v9v0K3ZYFPXTnO1I1HK3UCzp0yuNlFuoRa6I2CMiV/1G1Hb8RIiYb
	KDog==
X-Gm-Message-State: AHYfb5hxEeUZNAHWncTgw/c+EIz+JL6tFzxTdwH7/ocPpIzedYkIQmmR
	370Rlid/FyE+d2+i
X-Received: by 10.98.209.87 with SMTP id t23mr5953618pfl.86.1502228899637;
	Tue, 08 Aug 2017 14:48:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::f213])
	by smtp.gmail.com with ESMTPSA id
	d135sm2768713pga.6.2017.08.08.14.48.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:48:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:47:57 -0700
Message-Id: <20170808214800.39621-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170808214800.39621-1-raj.khem@gmail.com>
References: <20170808214800.39621-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 6/9] python3-twisted: Fix build with clang
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
X-List-Received-Date: Tue, 08 Aug 2017 21:48:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-initsendmsg-Return-NULL-on-error.patch    | 76 ++++++++++++++++++++++
 .../python/python3-twisted_13.2.0.bb               |  3 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twisted/0001-initsendmsg-Return-NULL-on-error.patch

diff --git a/meta-python/recipes-devtools/python/python3-twisted/0001-initsendmsg-Return-NULL-on-error.patch b/meta-python/recipes-devtools/python/python3-twisted/0001-initsendmsg-Return-NULL-on-error.patch
new file mode 100644
index 000000000..d4cf34554
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twisted/0001-initsendmsg-Return-NULL-on-error.patch
@@ -0,0 +1,76 @@
+From 890d039f067d52a0ab77b561d40da13f0c135634 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 3 Aug 2017 11:24:43 -0700
+Subject: [PATCH] initsendmsg: Return NULL on error
+
+Fixes a clang error
+
+sendmsg.c:129:9: error: non-void function 'initsendmsg' should return a value [-Wreturn-type]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ twisted/python/sendmsg.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/twisted/python/sendmsg.c b/twisted/python/sendmsg.c
+index 9f2fd8c..9c080e1 100644
+--- a/twisted/python/sendmsg.c
++++ b/twisted/python/sendmsg.c
+@@ -126,7 +126,7 @@ PyMODINIT_FUNC initsendmsg(void) {
+     module = Py_InitModule3("sendmsg", sendmsg_methods, sendmsg_doc);
+ 
+     if (!module) {
+-        return;
++        return NULL;
+     }
+ 
+     /*
+@@ -135,39 +135,39 @@ PyMODINIT_FUNC initsendmsg(void) {
+     */
+ 
+     if (-1 == PyModule_AddIntConstant(module, "SCM_RIGHTS", SCM_RIGHTS)) {
+-        return;
++        return NULL;
+     }
+ 
+ 
+     /* BSD, Darwin, Hurd */
+ #if defined(SCM_CREDS)
+     if (-1 == PyModule_AddIntConstant(module, "SCM_CREDS", SCM_CREDS)) {
+-        return;
++        return NULL;
+     }
+ #endif
+ 
+     /* Linux */
+ #if defined(SCM_CREDENTIALS)
+     if (-1 == PyModule_AddIntConstant(module, "SCM_CREDENTIALS", SCM_CREDENTIALS)) {
+-        return;
++        return NULL;
+     }
+ #endif
+ 
+     /* Apparently everywhere, but not standardized. */
+ #if defined(SCM_TIMESTAMP)
+     if (-1 == PyModule_AddIntConstant(module, "SCM_TIMESTAMP", SCM_TIMESTAMP)) {
+-        return;
++        return NULL;
+     }
+ #endif
+ 
+     module = PyImport_ImportModule("socket");
+     if (!module) {
+-        return;
++        return NULL;
+     }
+ 
+     sendmsg_socket_error = PyObject_GetAttrString(module, "error");
+     if (!sendmsg_socket_error) {
+-        return;
++        return NULL;
+     }
+ }
+ 
+-- 
+2.13.4
+
diff --git a/meta-python/recipes-devtools/python/python3-twisted_13.2.0.bb b/meta-python/recipes-devtools/python/python3-twisted_13.2.0.bb
index 98016cca3..57406cd52 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_13.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_13.2.0.bb
@@ -1,6 +1,9 @@
 inherit pypi setuptools3
 require python-twisted.inc
 
+SRC_URI += "file://0001-initsendmsg-Return-NULL-on-error.patch \
+           "
+
 RDEPENDS_${PN}-core = "python3-core python3-zopeinterface python3-lang"
 
 FILES_${PN}-core_append += " \
-- 
2.14.0


