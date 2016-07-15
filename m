Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C968B606D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 12:54:24 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so2041322wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 05:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rlXDZ0ozWmZVa4WlxF13m0E1hyEj7rkP9RZZF4dpAQg=;
	b=SSHeX9W5KHqHxalX/qXZZIZdyM9yVtGla0tu0loS6NpLOQ0NCOZ4q+F1UhblFlL93I
	iDWUA8UkWDCsgfelZ9qBwM5+DG2ig8KwKGJUm0inRaoHpX+GCNdkH2pToNioXkQdvX02
	Z+EgugBzYCi+Ll543736nQVdpOnEECd5IDlkmbsN0w5LfJPvgJTlU0k9qgubDdaHg8Yp
	tBst+v6z7oeJHAVGt276Pi4PSjvhCi1zieM248t0KMp1LixX7IiJvpZlDnzHc4sOcb+v
	1dypCEzmmlMjaoqwFbJA9In+IVOCKts33HPa1j1l6iYwVQeUtLDEHi5KKB8RTvii8WHE
	feRg==
X-Gm-Message-State: ALyK8tLcE4BsVjQpQv/homL1pPrDKejM9M5qLL97TdUJBepEPFXKRFTyO/91pDZZeCbH/g==
X-Received: by 10.194.186.178 with SMTP id fl18mr634173wjc.8.1468587263987;
	Fri, 15 Jul 2016 05:54:23 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id f4sm59861wmf.8.2016.07.15.05.54.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 05:54:22 -0700 (PDT)
From: git@andred.net
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 13:54:20 +0100
Message-Id: <1468587261-18160-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] c-ares: use our compilation flags
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
X-List-Received-Date: Fri, 15 Jul 2016 12:54:25 -0000
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


