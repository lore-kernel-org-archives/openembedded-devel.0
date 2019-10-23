Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5D87F882
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 16:14:02 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id l24so7490193pgh.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Rs9ys8z9jBIau4+qYDjtDYUAG5LwJQcA0DBeW7Cwp/4=;
	b=emX/JxQoYUJD8Uu57DfZrjY+iWgFnfemYrAIrnRv7WoiVJWGvDRZ1u2c3C5swMobzb
	oqLGDr/41dLPDVbJjw9rmaHSVPvLJV6CQR9OH7w6sr6uxIQm5SWgHZvkbPofVesS3tZC
	BFyG5hdYKkCe4JnGTY+AQ7IXlQcGIjN6jQTLP0BF+1C7tXaRB7dBTWYVtZaD/cr6PaNL
	nFktqdOVv2ipl1g3z8TugeWMgMwLUv7b2yePrro3So+ouftyERq9MDWfPpXtp4D5Hjk+
	YB1jdfAti6JwCwDv24gQYrInw5QtfhuqY+lyfbVIvISWAwCcGQBd9vYwmyTE7tyGyJUa
	4u7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Rs9ys8z9jBIau4+qYDjtDYUAG5LwJQcA0DBeW7Cwp/4=;
	b=QfT2mDRJJdqyPkMFEdnYq1LN3aUioucRvMubZQVfqQtBVxXAFeO48EgPAnMqADAl/t
	5efbpJvvk0bETPpXR7xdGxKxmhgeUYIBvyvi2tMNsBumcMjh6a1nFmK2RfnNl5LAVMEa
	y/f3fAOgxRFD1yL6b6veV20u7tbrLMdu7ls6E3JoXzJ82TeRJZziADppBLtHc7wpW2wb
	OxfRw1kJO/V1jiUlvSrzxQ76n0ptaJK56hpbZh9yFB33StSHLYbsMpI5kDEO5M8JTDb2
	vFBSJTJLoYf/iqkg15BXvEShDzRVc0xFKo6zvPs3IApzAEUO9aul6XcC3eWWVILYMKIZ
	lk2A==
X-Gm-Message-State: APjAAAWN3yMGFU3DakOK9WMCH7rjQJVWyw/sXhihRBFukxY/neHGykWu
	y0JyvCLHhuDB5zSG6TFK2aGh17rJ
X-Google-Smtp-Source: APXvYqzfaBcVFYep1Uq5SqPQ1WJ5Xyx6ULm9dj4HnylVSV+1qT6Baq6nh47aKwvJUP/SOxvD1/lSlQ==
X-Received: by 2002:a62:65c1:: with SMTP id z184mr11808410pfb.42.1571847242765;
	Wed, 23 Oct 2019 09:14:02 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d998:942e:6613:6ef4])
	by smtp.gmail.com with ESMTPSA id
	d19sm23179067pjz.5.2019.10.23.09.14.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Oct 2019 09:14:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 09:13:49 -0700
Message-Id: <59475ff3927faad212816c1894c140ffae1eeabf.1571847041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571847041.git.akuster808@gmail.com>
References: <cover.1571847041.git.akuster808@gmail.com>
Subject: [warrior 04/10] python3-twofish: Fix missing return statements in module stubs
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
X-List-Received-Date: Wed, 23 Oct 2019 16:14:02 -0000

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...missing-return-statements-in-module-stubs.patch | 38 ++++++++++++++++++++++
 .../python/python3-twofish_0.3.0.bb                |  2 ++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch

diff --git a/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch b/meta-python/recipes-devtools/python/python3-twofish/0001-Fix-missing-return-statements-in-module-stubs.patch
new file mode 100644
index 0000000..c25b245
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
index e593f6f..7b8eb2e 100644
--- a/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twofish_0.3.0.bb
@@ -1,2 +1,4 @@
 require python-twofish.inc
 inherit setuptools3
+
+SRC_URI += "file://0001-Fix-missing-return-statements-in-module-stubs.patch"
-- 
2.7.4


