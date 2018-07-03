Return-Path: <gregory.vimont@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id B7AAC770D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 12:04:04 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p1-v6so1701733wrs.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jul 2018 05:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wxTh5lMjY33gVvlu50MDri6rcFJA8UjiGNI2Awefo/s=;
	b=KgMpiFeq+bfouJavryLBlA+BZoxALizKYXAPGGNHcA5GNAt2v1XrpW+XqsKZtVFtdb
	ZdwtRZvo1S89XhmteVkX4OhK8hidWFYOPtVbuFVnZS44iUfzVuHxKq4uboT3dIRvsbRj
	plIzuRCruQrnHrBnzw3NsggcibbsErdfihWCGdpoSDizDKlUb1fmPGj+amH0si9pzq9B
	KOF5SYukW3KVS5gCS+EmA/jZ7w1Wz9Artg+JmkSYG0b7hDjlrNj3VC8l9xo4ClubUXvP
	WWeB3BqBaXeT/8IHAeQTmLJCPgW0XNq3IguFFQ5XICbIUz62Ot6fcbq0Qsc4PeSjZZOT
	j1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wxTh5lMjY33gVvlu50MDri6rcFJA8UjiGNI2Awefo/s=;
	b=OsPiLu1s44tgMcHYf7lYe67m1kwZjCoZjDso4skmdl3nI8H4oraQPgoLQFdRqfcwx4
	2MXz50HyEvk/xMwJqqgqYPgXWJ7DXFjgYqyGRHDzvZKzwtDskXymyp2DP9pPKNhvZxoo
	xMdkkna79OG/cycit8i3BV/30VrN4oVWvp3Rl1G1S5fwKUUo+BZS9Ln09XDg17PnudA1
	F887qhNnM/ZIJntRVoO3NnSq9HuP3Nf+Oi4v02fsEoJL4U1262tGn6eKPhoIMu3Aq+k8
	TuzH2R1d8m1TrFNzj+t2rl8DSyRIrQdv2UOLBTkKhaaHFyKmNuattGKzskN1/XoHMXN/
	Q63w==
X-Gm-Message-State: APt69E164LnQfvDju3bkEXxvXF731OrMj2XSydBhhTuQc/+3xC/rFh9i
	fO3VWyFiriTeeh+mL45Na24kpaUk
X-Google-Smtp-Source: AAOMgpfWfL+3eIQYbApYOfdr4ipxdkiSpHm8UzCFOXHgF6MCA9ME0DsowFdZGpbVsvi0PT+bHrqa7A==
X-Received: by 2002:adf:c44c:: with SMTP id
	a12-v6mr23569024wrg.20.1530619445076; 
	Tue, 03 Jul 2018 05:04:05 -0700 (PDT)
Received: from ALD-1799-DE.aldebaran.lan
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	q17-v6sm1408276wro.30.2018.07.03.05.04.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Jul 2018 05:04:04 -0700 (PDT)
From: Gregory Vimont <gregory.vimont@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  3 Jul 2018 14:01:59 +0200
Message-Id: <1530619319-27082-1-git-send-email-gregory.vimont@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Gregory Vimont <gregory.vimont@softbankrobotics.com>
Subject: [meta-oe][PATCH] tbb: check the version of the cross gcc instead of host gcc
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
X-List-Received-Date: Tue, 03 Jul 2018 12:04:05 -0000

From: Gregory Vimont <gregory.vimont@softbankrobotics.com>

When cross compiling on linux with gcc, the host gcc was used instead of
the cross gcc to set compilation flags according to gcc version.

Signed-off-by: Gregory Vimont <gregory.vimont@softbankrobotics.com>
---
 meta-oe/recipes-support/tbb/tbb.bb                 |  1 +
 .../tbb/tbb/0002-linux-Fix-gcc-version-check.patch | 57 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch

diff --git a/meta-oe/recipes-support/tbb/tbb.bb b/meta-oe/recipes-support/tbb/tbb.bb
index bad9481..f870104 100644
--- a/meta-oe/recipes-support/tbb/tbb.bb
+++ b/meta-oe/recipes-support/tbb/tbb.bb
@@ -13,6 +13,7 @@ PV = "${PRDATE}+${SRCPV}"
 SRC_URI = "git://github.com/01org/tbb;branch=${BRANCH} \
            file://cross-compile.patch \
            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
+           file://0002-linux-Fix-gcc-version-check.patch \
            file://tbb.pc \
 "
 
diff --git a/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch b/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
new file mode 100644
index 0000000..9824b61
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0002-linux-Fix-gcc-version-check.patch
@@ -0,0 +1,57 @@
+From aee098f1bf0511c6b5544de3170a9e8b51673b60 Mon Sep 17 00:00:00 2001
+From: Pierre Le Magourou <plemagourou@softbankrobotics.com>
+Date: Tue, 23 Jan 2018 15:25:50 +0100
+Subject: [PATCH] linux.gcc: Fix cross compilation error.
+
+When cross compiling on linux with gcc, the host gcc was used instead of
+the cross gcc to set compilation flags according to gcc version.
+
+When the cross gcc was in version 5.X and the host gcc in version 7.X,
+tbb was compiled with the -flifetime-dse=1 flag that does not exist on
+gcc 5.X.
+---
+ build/linux.gcc.inc | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
+index 5c1889c..a4d6698 100644
+--- a/build/linux.gcc.inc
++++ b/build/linux.gcc.inc
+@@ -41,29 +41,29 @@ LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
+ C_FLAGS = $(CPLUS_FLAGS)
+ 
+ # gcc 4.2 and higher support OpenMP
+-ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[2-9]|[5-9])"))
+     OPENMP_FLAG = -fopenmp
+ endif
+ 
+ # gcc 4.8 and later support RTM intrinsics, but require command line switch to enable them
+-ifneq (,$(shell gcc -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^(4\.[8-9]|[5-9])"))
+     RTM_KEY = -mrtm
+ endif
+ 
+ # gcc 4.0 and later have -Wextra that is used by some our customers.
+-ifneq (,$(shell gcc -dumpversion | egrep  "^([4-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([4-9])"))
+     TEST_WARNING_KEY += -Wextra
+ endif
+ 
+ # gcc 5.0 and later have -Wsuggest-override option
+ # enable it via a pre-included header in order to limit to C++11 and above
+-ifneq (,$(shell gcc -dumpversion | egrep  "^([5-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([5-9])"))
+     INCLUDE_TEST_HEADERS = -include $(tbb_root)/src/test/harness_preload.h
+ endif
+ 
+ # gcc 6.0 and later have -flifetime-dse option that controls
+ # elimination of stores done outside the object lifetime
+-ifneq (,$(shell gcc -dumpversion | egrep  "^([6-9])"))
++ifneq (,$(shell $(CC) -dumpversion | egrep  "^([6-9])"))
+     # keep pre-contruction stores for zero initialization
+     DSE_KEY = -flifetime-dse=1
+ endif
+-- 
+2.15.1
+
-- 
2.7.4


