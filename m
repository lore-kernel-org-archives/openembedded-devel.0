Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 476357C89C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 08:53:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f22so19343767wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NUKwCZcncMEyzXLQeQ7dV4JAiwYnoRKHIIEyGEj8Yck=;
	b=QmtXMTcmq/y16S3CP/plnzb3+9M2LpFQEHdl6oVkBPTc1mjnouuzl6tetm9osQ8soT
	ddYsWIHwNGxt/9xnBROymSYjtt3yaMvhWsnd42yvrbbfvitH02HLb7EF6jMStnsI6XvS
	Td9vRYYUgG9YqSDaUpClTWF1BdmTpcEGNuZOc1KgVteqYQ2O49+seyF+58X1B9ZH35kq
	f1kwUifI58rTM/l90SYRcdYts77U6E/3oNRCKNryuPPecgAeTxtv5qQ02F/mHX0yisHa
	FXu1uW78JROzW7HsDU/qe0AEF7AnC19+2DxA+jkwn5N/w2n7FWxPAGbVaKNlHSJe8tm9
	OiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NUKwCZcncMEyzXLQeQ7dV4JAiwYnoRKHIIEyGEj8Yck=;
	b=PE6kvmiwKOQ4G9JVVUkn0t4AL2DUKhNwdqhKH+VvOl+l8IilmRxPRt2trB3+3UE8Um
	l1UG6MrISoA5PY8L7Bzd/viBjXsCt6AYGkDfpiwYqcgUKz3obhJ+JHhgMoplhcLhQ+OK
	TTqXRjVwuXesgv50+Lv2GCrLZmooWDHntvyjx7Szbs2GKpNTfApPwQn1HoTtwTMwEbQ3
	FyV7yoYXA+qKhbQd7PEB3YBDGivm2fie8dZfKo6lO4RgFjZxPzTyBYjfgxWMlCaG9glk
	DDFgKPG+2OgeaRmvz7/w6iNuJHFsUpV8IlB0OzUU34GkHyuK2Jw8jKXNpSPAWfb8dsFg
	JIoA==
X-Gm-Message-State: APjAAAU7nJSAlbbRR8mn48vRRnMvZ/+6sCyrisjz9XGYuz0JLLol39Ev
	6x0vdrQuGmsMSxRz65qwqs/2f2TU8sI=
X-Google-Smtp-Source: APXvYqzkoWK5tRXIR87s60v4etthPwo5HLojaW2D5fHCMUO+JW2W7vd0EWdhDsc/xwPWim+75qrK+g==
X-Received: by 2002:a1c:a385:: with SMTP id m127mr19457224wme.50.1571129607611;
	Tue, 15 Oct 2019 01:53:27 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	b130sm32610537wmh.12.2019.10.15.01.53.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Oct 2019 01:53:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 08:53:23 +0000
Message-Id: <20191015085323.3329-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][warrior][PATCH] python3-twofish: Fix missing return statements in module stubs
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
X-List-Received-Date: Tue, 15 Oct 2019 08:53:27 -0000

* fixes build with -Werror=return-type
  twofish.c: In function 'init_twofish':
  twofish.c:45:1: error: control reaches end of non-void function [-Werror=return-type]
     45 | PyMODINIT_FUNC init_twofish(void) { }
        | ^~~~~~~~~~~~~~
  twofish.c: In function 'PyInit__twofish':
  twofish.c:46:1: error: control reaches end of non-void function [-Werror=return-type]
     46 | PyMODINIT_FUNC PyInit__twofish(void) { }
        | ^~~~~~~~~~~~~~
  cc1: some warnings being treated as errors

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ng-return-statements-in-module-stubs.patch | 38 +++++++++++++++++++
 .../python/python3-twofish_0.3.0.bb           |  2 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch

diff --git a/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch b/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
new file mode 100644
index 0000000000..c25b2457e2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
@@ -0,0 +1,38 @@
+From 5704610f4b3aed5210e9c5b7c05ff8b5b2364c9c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 12 Aug 2019 08:18:21 +0000
+Subject: [PATCH] Fix missing return statements in module stubs
+
+* fixes build with -Werror=return-type
+  twofish.c: In function 'init_twofish':
+  twofish.c:45:1: error: control reaches end of non-void function [-Werror=return-type]
+     45 | PyMODINIT_FUNC init_twofish(void) { }
+        | ^~~~~~~~~~~~~~
+  twofish.c: In function 'PyInit__twofish':
+  twofish.c:46:1: error: control reaches end of non-void function [-Werror=return-type]
+     46 | PyMODINIT_FUNC PyInit__twofish(void) { }
+        | ^~~~~~~~~~~~~~
+  cc1: some warnings being treated as errors
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Upstream-Status: Submitted [https://github.com/keybase/python-twofish/pull/6]
+---
+ twofish.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/twofish.c b/twofish.c
+index e324c34..d4487d8 100644
+--- a/twofish.c
++++ b/twofish.c
+@@ -42,5 +42,5 @@ DL_EXPORT(void) exp_Twofish_decrypt(Twofish_key * xkey, uint8_t c[16], uint8_t p
+ We need a stub init_twofish function so the module will link as a proper module.
+ Do not import _twofish from python; it will not work since _twofish is not a *real* module
+ */
+-PyMODINIT_FUNC init_twofish(void) { }
+-PyMODINIT_FUNC PyInit__twofish(void) { }
++PyMODINIT_FUNC init_twofish(void) { return NULL; }
++PyMODINIT_FUNC PyInit__twofish(void) { return NULL; }
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
index e593f6f212..7b8eb2ef0f 100644
--- a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
@@ -1,2 +1,4 @@
 require python-twofish.inc
 inherit setuptools3
+
+SRC_URI += "file://0001-Fix-missing-return-statements-in-module-stubs.patch"
-- 
2.17.1


