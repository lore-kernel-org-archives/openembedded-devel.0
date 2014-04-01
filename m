Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id DBE626F7CA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 17:14:11 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id q5so5585578wiv.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 10:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hNlxv/DjlbmAMUjIEPajYPZyXbW8msl5yC1+LeK4xdQ=;
	b=SNj+o8VnH42GPAUCdRS3rGaG4S556ANbB9clCWn8988e5m2/gQnaZxgo0tpwpMO4qr
	1ZdsXh9BjmF5s8xPlnbkql0WH6gYF+KG0xuCGHALs8v2mv6iNTXZxF/a6GXTVm5+cszr
	ze3NtKZi5gRsPyKvyw+eWr01MU2K6IU1dpCSC+e80scPNVnhqokg5mJM3r90k2XQNEPY
	1clkE5n484QtIZ4ug2p/to6XmpRVBbfcV6ZYx26cJTttJN3fXvS/xVzWCBktYhEL7BXU
	n1/JsjLtleynppTshz62XMqQZwMycNaoLHEusMKCPNGkGu0a3X4/ZQVm6mJE0XJlxa5f
	jf1w==
X-Received: by 10.180.188.66 with SMTP id fy2mr21713350wic.45.1396372451938;
	Tue, 01 Apr 2014 10:14:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm41868310eeg.8.2014.04.01.10.14.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 10:14:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 19:13:15 +0200
Message-Id: <1396372434-10710-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396372434-10710-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/46] efl, elementary, e-wm: upgrade to latest versions 1.9.2 and 1.18.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 17:14:12 -0000

* announcement:
  http://sourceforge.net/p/enlightenment/mailman/message/32148245/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-remove-another-elm-1.8-requirement.patch  | 25 ----------------------
 .../e17/{e-wm_0.18.4.bb => e-wm_0.18.6.bb}         |  5 ++---
 .../recipes-efl/efl/{efl_1.9.0.bb => efl_1.9.2.bb} |  4 ++--
 .../{elementary_1.9.0.bb => elementary_1.9.2.bb}   |  4 ++--
 4 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/0001-remove-another-elm-1.8-requirement.patch
 rename meta-efl/recipes-efl/e17/{e-wm_0.18.4.bb => e-wm_0.18.6.bb} (68%)
 rename meta-efl/recipes-efl/efl/{efl_1.9.0.bb => efl_1.9.2.bb} (81%)
 rename meta-efl/recipes-efl/efl/{elementary_1.9.0.bb => elementary_1.9.2.bb} (69%)

diff --git a/meta-efl/recipes-efl/e17/e-wm/0001-remove-another-elm-1.8-requirement.patch b/meta-efl/recipes-efl/e17/e-wm/0001-remove-another-elm-1.8-requirement.patch
deleted file mode 100644
index f4f034a..0000000
--- a/meta-efl/recipes-efl/e17/e-wm/0001-remove-another-elm-1.8-requirement.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From dd1406e40700df60a055db24d7358480b1fbc5bf Mon Sep 17 00:00:00 2001
-From: Mike Blumenkrantz <zmike@samsung.com>
-Date: Mon, 3 Mar 2014 17:38:55 -0500
-Subject: [PATCH] remove another elm 1.8 requirement
-
-Upstream-Status: backport dd1406e40700df60a055db24d7358480b1fbc5bf
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 999df79..26f6775 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -579,7 +579,6 @@ eina >= ${efl_version} \
- eldbus >= ${efl_version} \
- eio >= ${efl_version} \
- elementary >= ${elm_version} \
--elementary < 1.8.99 \
- emotion >= ${efl_version} \
- $udisks_mount \
- $eeze_mount \
--- 
-1.9.0
-
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.4.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.6.bb
similarity index 68%
rename from meta-efl/recipes-efl/e17/e-wm_0.18.4.bb
rename to meta-efl/recipes-efl/e17/e-wm_0.18.6.bb
index 0122cad..852046c 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.18.4.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.18.6.bb
@@ -6,13 +6,12 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 SRC_URI = "\
     ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://0001-remove-another-elm-1.8-requirement.patch \
     file://enlightenment_start.oe \
     file://applications.menu \
 "
 
-SRC_URI[md5sum] = "d3534c765d562524c63852f2f40932c3"
-SRC_URI[sha256sum] = "273afe860b65e1e39323bab80ab51e44845bcddcd25063b47eadab1c925a77c9"
+SRC_URI[md5sum] = "a3a707e32fd72547e0911e3765d112f1"
+SRC_URI[sha256sum] = "a75f85e65038672a0413c74bffc7f4869c3c41090afe6b66876241780e478c2b"
 
 do_configure_prepend() {
     sed '/^ *EFL_PKG_CHECK_VAR/ s/systemduserunitdir/systemdsystemunitdir/g' -i ${S}/configure.ac
diff --git a/meta-efl/recipes-efl/efl/efl_1.9.0.bb b/meta-efl/recipes-efl/efl/efl_1.9.2.bb
similarity index 81%
rename from meta-efl/recipes-efl/efl/efl_1.9.0.bb
rename to meta-efl/recipes-efl/efl/efl_1.9.2.bb
index b6aa77f..0670359 100644
--- a/meta-efl/recipes-efl/efl/efl_1.9.0.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.9.2.bb
@@ -4,8 +4,8 @@ SRC_URI = "\
     ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
 "
 
-SRC_URI[md5sum] = "f5d0c61db951cb6a5434a30672975dd1"
-SRC_URI[sha256sum] = "fd4703edb56c01b713f92849fb15f6ca3d866227ce4abff2d90b08244cd99a99"
+SRC_URI[md5sum] = "5520ed809cdccd8b2a3e376f56f9ae61"
+SRC_URI[sha256sum] = "530cec25c7f41c188599a1e239bef72142850f6a5f67c1dd4184354f756181ad"
 
 # Temporary disable until error like the one following are fixed
 # efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
diff --git a/meta-efl/recipes-efl/efl/elementary_1.9.0.bb b/meta-efl/recipes-efl/efl/elementary_1.9.2.bb
similarity index 69%
rename from meta-efl/recipes-efl/efl/elementary_1.9.0.bb
rename to meta-efl/recipes-efl/efl/elementary_1.9.2.bb
index e7cbb5b..110f07b 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.9.0.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.9.2.bb
@@ -8,5 +8,5 @@ SRC_URI = "\
 # these paths aren't passed in -native build
 SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
 
-SRC_URI[md5sum] = "408b61a080f51731eeed81968d3cc7f5"
-SRC_URI[sha256sum] = "95cb9ade6c1f135b673555d927d13b5e06986353047178125346abdf6c2b4d82"
+SRC_URI[md5sum] = "48a4b155ced187db87c503d4f376aa7a"
+SRC_URI[sha256sum] = "c31644109cd29675bc65b220d19c633c8d089feb955c439988b2e19f026b3376"
-- 
1.9.1


