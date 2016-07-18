Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id EFD7460746
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:02:53 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id f93so10794383lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2016 01:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rlXDZ0ozWmZVa4WlxF13m0E1hyEj7rkP9RZZF4dpAQg=;
	b=Pgb9dYNfR0Fh8s9Lz/cRx7QPsKpEwgujGXJBTE5phBk355bFv37wO1TWhVSW7aDHm+
	mpPqNM/DXNP3snRwQ906F0LxlBueRAlBMYU5IZgjB1EdIU+BxGuc+cFwCG0ihG6abuE7
	7TMnftB0Bqv/e4rASJAQYrYugX5dibuXRQbgPU+OeSpvjxSHgulT+L/u8R5aaT1lrnOD
	1NDX0pcbq9BdDVBd0jc29PzEVoDWnhdv+IRBk0/qkW1r2SbNfgti1yFkRI0XEGWs0NT9
	g7RKt0S8IPbQ/oCswQw5uVMadBqglSy3BkOfCJIhgDY+c7q+4tPu+lw/gLcHcPwTMiIo
	qqGw==
X-Gm-Message-State: ALyK8tIelnMYD/0lzZA784GddvB5J962GeQW4AYwTdyEuNOO84IrA27t6KK5JxgiyW56Ww==
X-Received: by 10.25.21.197 with SMTP id 66mr12809078lfv.99.1468828973355;
	Mon, 18 Jul 2016 01:02:53 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id 29sm4170845lfu.43.2016.07.18.01.02.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 01:02:52 -0700 (PDT)
From: git@andred.net
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Jul 2016 09:02:47 +0100
Message-Id: <1468828968-19388-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2 1/2] c-ares: use our compilation flags
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
X-List-Received-Date: Mon, 18 Jul 2016 08:02:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

If not requested otherwise as ./configure option, c-ares will strip
any -g from CFLAGS / CPPFLAGS and add -g0 instead, disabling all
debug info.
Similarly, it will try to enable optimisation (but bail out since in
that case it honors an existing -O in CFLAGS / CPPFLAGS)

Since we want to control code generation, patch out the code
mangling -g (and -O for consistency). Alternatively, if we were to
pass --enable-debug to ./configure, c-ares would at the same time
assume that we don't want optimisation anymore.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 ...configure.ac-don-t-override-passed-cflags.patch | 26 ++++++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.11.0.bb        |  4 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch

diff --git a/meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch b/meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch
new file mode 100644
index 0000000..10fad4e
--- /dev/null
+++ b/meta-networking/recipes-support/c-ares/c-ares/0001-configure.ac-don-t-override-passed-cflags.patch
@@ -0,0 +1,26 @@
+From 2a7236d2a7bb9c3d3c3f44ebf59404bf7134fcb3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
+Date: Tue, 12 Apr 2016 11:37:28 +0100
+Subject: [PATCH] configure.ac: don't override passed cflags
+
+We are controlling debug and optimiser flags from OE
+---
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5c02450..3cf9fcd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -147,8 +147,6 @@ dnl **********************************************************************
+ 
+ CARES_CHECK_COMPILER
+ CARES_SET_COMPILER_BASIC_OPTS
+-CARES_SET_COMPILER_DEBUG_OPTS
+-CARES_SET_COMPILER_OPTIMIZE_OPTS
+ CARES_SET_COMPILER_WARNING_OPTS
+ 
+ if test "$compiler_id" = "INTEL_UNIX_C"; then
+-- 
+2.8.0.rc3
+
diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
index 2f72ab4..c98be7d 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
@@ -6,7 +6,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://ares_init.c;beginline=1;endline=3;md5=53f5ecf4c22c37cf1ddd1ef8f8eccce0"
 
-SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz"
+SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz \
+           file://0001-configure.ac-don-t-override-passed-cflags.patch \
+"
 SRC_URI[md5sum] = "d5c6d522cfc54bb6f215a0b7912d46be"
 SRC_URI[sha256sum] = "b3612e6617d9682928a1d50c1040de4db6519f977f0b25d40cf1b632900b3efd"
 
-- 
2.8.1


