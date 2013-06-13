Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE406A59B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 09:06:15 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr13so7477723pbb.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 02:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=gQMM5pKY6S1BsDcYKWJEwEjBsMfAiHU0FZ4LEqIb15E=;
	b=le5ZHnx9Fzs6HMnnrQMujtm/ubOJuqML5XiKg8NILilf4PuXrh6fA/muMZlUEh7vvt
	5Rya17gAVE+mLF/NmhhNy0wumheXuEfn8p/RpVevjafjHnmPWxd8JsV0do6DYLOM2Inf
	K5gccAo1Z+gtBF3BrPD9iQMiM6UCplbAz3CFdzUD8hi3uRteNzSpc8LlsQOcvWe5/csg
	PfTP3A1hHdJa5vcyPJkjhPXwCCTUeLZir8iefdD7FO4VSsEau827el2jaeuGpNnLLW+I
	Kgve0GmOvUKXt6jmpIulbKj/Ojhw3GByCRS7U4Qzwx4YGlsWSKHv/3R9/uIKeLkX99U6
	r0Nw==
X-Received: by 10.66.13.8 with SMTP id d8mr2016735pac.4.1371114376020;
	Thu, 13 Jun 2013 02:06:16 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	qi1sm28441087pac.21.2013.06.13.02.06.14 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 02:06:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jun 2013 02:04:00 -0700
Message-Id: <1371114240-24672-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH] ipsec-tools: Upgrade to 0.8.1 and fix build with gcc 4.8
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
X-List-Received-Date: Thu, 13 Jun 2013 09:06:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ipsec-tools/files/ipsec-tools-install.patch    |   18 ----------
 .../0001-Fix-warning-with-gcc-4.8.patch            |   35 ++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.7.2.bb               |    7 ----
 .../{ipsec-tools.inc => ipsec-tools_0.8.1.bb}      |   13 ++++----
 4 files changed, 42 insertions(+), 31 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch
 delete mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
 rename meta-networking/recipes-support/ipsec-tools/{ipsec-tools.inc => ipsec-tools_0.8.1.bb} (83%)

diff --git a/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patch b/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
deleted file mode 100644
index 85035b1..0000000
--- a/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Avoid attempting to install vmbuf.h twice
-
-Upstream-Status: Accepted
-
-Taken from pld-linux.org:
-http://cvs.pld-linux.org/cgi-bin/cvsweb.cgi/packages/ipsec-tools/ipsec-tools-install.patch
-
---- ipsec-tools-0.7.2/src/racoon/Makefile.am~	2008-07-23 13:48:40.000000000 +0200
-+++ ipsec-tools-0.7.2/src/racoon/Makefile.am	2009-07-04 01:43:48.148433975 +0200
-@@ -3,7 +3,7 @@
- sbin_PROGRAMS = racoon racoonctl plainrsa-gen
- noinst_PROGRAMS = eaytest
- include_racoon_HEADERS = racoonctl.h var.h vmbuf.h misc.h gcmalloc.h admin.h \
--	schedule.h sockmisc.h vmbuf.h isakmp_var.h isakmp.h isakmp_xauth.h \
-+	schedule.h sockmisc.h isakmp_var.h isakmp.h isakmp_xauth.h \
- 	isakmp_cfg.h isakmp_unity.h ipsec_doi.h evt.h
- lib_LTLIBRARIES = libracoon.la
- 
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch
new file mode 100644
index 0000000..569b545
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0001-Fix-warning-with-gcc-4.8.patch
@@ -0,0 +1,35 @@
+From fc230d5ded73fe4049aa586eacbe4098aeff912f Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Wed, 12 Jun 2013 17:39:06 +0100
+Subject: [PATCH] Fix warning with gcc 4.8.
+
+The line "memset(pair, 0, sizeof(pair));" was causing the following warning:
+
+	error: argument to 'sizeof' in 'memset' call is the same expression as
+	the destination; did you mean to dereference
+
+Compiling with -Werror (as specified in configure.ac) was causing this warning
+to become an error. The line itself is not needed as memory is allocated via
+calloc which performs zero initialization. Therefore, the line is removed to fix
+the warning and does not need replacing anything.
+---
+ src/racoon/ipsec_doi.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+Upstream-Status: Submitted
+
+diff --git a/src/racoon/ipsec_doi.c b/src/racoon/ipsec_doi.c
+index 2b48d49..4e9d3a8 100644
+--- a/src/racoon/ipsec_doi.c
++++ b/src/racoon/ipsec_doi.c
+@@ -1183,7 +1183,6 @@ get_proppair_and_doi_sit(sa, mode, doitype, sittype)
+ 			"failed to get buffer.\n");
+ 		goto bad;
+ 	}
+-	memset(pair, 0, sizeof(pair));
+ 
+ 	bp = (caddr_t)(sab + 1);
+ 	tlen = sa->l - sizeof(*sab);
+-- 
+1.8.3
+
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
deleted file mode 100644
index 255246e..0000000
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ipsec-tools.inc
-
-LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7ff40beff19fe6bc6aef26bd2b24"
-
-SRC_URI += "file://ipsec-tools-install.patch"
-SRC_URI[ipsec-tools-0.7.2.md5sum] = "72861f005746ee27984b2ee715ecc629"
-SRC_URI[ipsec-tools-0.7.2.sha256sum] = "08722ff6c62de3e042fef337454f03622a79053108d6dcc686c9c854f9f9e031"
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools.inc b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
similarity index 83%
rename from meta-networking/recipes-support/ipsec-tools/ipsec-tools.inc
rename to meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
index 264b49a..ef753c0 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools.inc
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
@@ -3,9 +3,15 @@ Linux-2.6 IPsec implementation."
 HOMEPAGE = "http://ipsec-tools.sourceforge.net/"
 SECTION = "console/network"
 LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7ff40beff19fe6bc6aef26bd2b24"
+
 DEPENDS = "virtual/kernel openssl readline flex"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/ipsec-tools/ipsec-tools-${PV}.tar.bz2;name=ipsec-tools-${PV}"
+SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV}.tar.bz2 \
+           file://0001-Fix-warning-with-gcc-4.8.patch \
+          "
+SRC_URI[md5sum] = "d38b39f291ba2962387c3232e7335dd8"
+SRC_URI[sha256sum] = "fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc830a881d63abe8153dd4"
 
 inherit autotools
 
@@ -44,8 +50,3 @@ EXTRA_OECONF = "--with-kernel-headers=${STAGING_INCDIR} \
 
 # See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=530527
 CFLAGS += "-fno-strict-aliasing"
-
-# Sometimes it attempts to use y.tab.c before it is actually
-# generated. Note that the failure case is very rare, but it does
-# happen.
-PARALLEL_MAKE = ""
-- 
1.7.9.5


