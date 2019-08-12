Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 936BD7C326
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 09:06:43 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id p17so103878117wrf.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 02:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NUKwCZcncMEyzXLQeQ7dV4JAiwYnoRKHIIEyGEj8Yck=;
	b=QSba63xN1Dd5g8txrBYZp+VNqoUDwaU9EZC3Lnqssa2bLPFQzS4SpZoKZlJK9ByhH+
	N/IRZGFU/SNi08R3VMe4LwDKBTza2n51aqwYNesB9YicNXxqJaDJ4Wz2sGmaKcY85q+m
	+Hl0DtmyBbetwExJaGn9cgdEXH625DO2lFKUu0olyRqkfy0Gsms7x79+IA2iTfiveHpy
	Ao3U+Ev6jF56Rk6VZT14OTn+M0zewLZnDugt/wVpWQUCoWtL0yyEK3LOJWWO0KuxkOeF
	ek/3pqa1k635o6/FCQctvQVUq66ZkBOaNVF+YWs+QepVW/Wvqi1uK/P5opEhisHM7WLb
	opOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NUKwCZcncMEyzXLQeQ7dV4JAiwYnoRKHIIEyGEj8Yck=;
	b=dZ+QCTReo5j+YQ8Vbz72v08qe4eumk79nLid6Co33unPzKi7Y9gb1CmHo9J2MeuWXw
	LiiCXGaJv26E4w9LhyoM2CJ20eJTp1sPFLazLXcbDU7hJjLan3xdchZVhympjGxy/2bD
	hj0xcwfnmuM3d7cvMJv10kAsfiHlqWl9L2GNQF8hpJTmbH4O1wzFHfcY4reaGKeVOC6R
	T/1jgRopqTuBgjgpZbqK1jSwc0ifqoRqjWGIVZsBBGggravZ82xzE7aKczWXPocC2I6T
	JT5dFohgvBzEXCaHuaTIoWGJ6z+SEVtsA35Q7Wnre2KKPyeIwUUk+pOPn3m6ItXF5ffh
	2Log==
X-Gm-Message-State: APjAAAXkwyRiQ4lPlGcZM8ltsdEqoIidmblviul1K+n7t2fZhFhlWnuX
	RVbJBqMI6imtl+gT/B2N6giiindJ
X-Google-Smtp-Source: APXvYqymxT2vDCeuMkeoBqKRlASQDH2W6SK6ci7/6xeZac1e2rfK/jHzIALFx5BE+1uSya1eAM005g==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr31051567wrm.2.1565600803946;
	Mon, 12 Aug 2019 02:06:43 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 4sm365149wmd.26.2019.08.12.02.06.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Aug 2019 02:06:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Aug 2019 09:06:42 +0000
Message-Id: <20190812090642.761-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-twofish: Fix missing return statements in module stubs
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
X-List-Received-Date: Mon, 12 Aug 2019 09:06:43 -0000

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


