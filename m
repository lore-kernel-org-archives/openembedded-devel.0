Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8577964F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 01:24:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9H1NuXj015259
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 18:24:06 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 16 Oct 2018 18:23:45 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Oct 2018 09:23:44 +0800
Message-ID: <1539739424-287548-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] gnulib: Security fix for CVE-2018-17942
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
X-List-Received-Date: Wed, 17 Oct 2018 01:24:16 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../gnulib/gnulib/CVE-2018-17942.patch             | 88 ++++++++++++++++++++++
 .../recipes-support/gnulib/gnulib_2017-08-20.18.bb |  9 ++-
 2 files changed, 93 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch

diff --git a/meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch b/meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch
new file mode 100644
index 0000000..77e82b1
--- /dev/null
+++ b/meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch
@@ -0,0 +1,88 @@
+From e91600a7aae3bafbefbe13abf771e61badd16286 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 16 Oct 2018 14:26:11 +0800
+Subject: [PATCH] vasnprintf: Fix heap memory overrun bug.
+
+Reported by Ben Pfaff <blp@cs.stanford.edu> in
+<https://lists.gnu.org/archive/html/bug-gnulib/2018-09/msg00107.html>.
+
+* lib/vasnprintf.c (convert_to_decimal): Allocate one more byte of
+memory.
+* tests/test-vasnprintf.c (test_function): Add another test.
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/gitweb/?p=gnulib.git;
+a=commitdiff;h=278b4175c9d7dd47c1a3071554aac02add3b3c35]
+
+CVE: CVE-2018-17942
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ ChangeLog               |  8 ++++++++
+ lib/vasnprintf.c        |  4 +++-
+ tests/test-vasnprintf.c | 19 ++++++++++++++++++-
+ 3 files changed, 29 insertions(+), 2 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 9864353..5ff76a3 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,11 @@
++2018-09-23  Bruno Haible  <bruno@clisp.org>
++ 	vasnprintf: Fix heap memory overrun bug.
++	Reported by Ben Pfaff <blp@cs.stanford.edu> in
++	<https://lists.gnu.org/archive/html/bug-gnulib/2018-09/msg00107.html>.
++	* lib/vasnprintf.c (convert_to_decimal): Allocate one more byte of
++	memory.
++	* tests/test-vasnprintf.c (test_function): Add another test.
++
+ 2017-08-21  Paul Eggert  <eggert@cs.ucla.edu>
+ 
+ 	vc-list-files: port to Solaris 10
+diff --git a/lib/vasnprintf.c b/lib/vasnprintf.c
+index 2e4eb19..45de49f 100644
+--- a/lib/vasnprintf.c
++++ b/lib/vasnprintf.c
+@@ -860,7 +860,9 @@ convert_to_decimal (mpn_t a, size_t extra_zeroes)
+   size_t a_len = a.nlimbs;
+   /* 0.03345 is slightly larger than log(2)/(9*log(10)).  */
+   size_t c_len = 9 * ((size_t)(a_len * (GMP_LIMB_BITS * 0.03345f)) + 1);
+-  char *c_ptr = (char *) malloc (xsum (c_len, extra_zeroes));
++  /* We need extra_zeroes bytes for zeroes, followed by c_len bytes for the
++     digits of a, followed by 1 byte for the terminating NUL.  */
++  char *c_ptr = (char *) malloc (xsum (xsum (extra_zeroes, c_len), 1));
+   if (c_ptr != NULL)
+     {
+       char *d_ptr = c_ptr;
+diff --git a/tests/test-vasnprintf.c b/tests/test-vasnprintf.c
+index 2dd869f..ff68d5c 100644
+--- a/tests/test-vasnprintf.c
++++ b/tests/test-vasnprintf.c
+@@ -53,7 +53,24 @@ test_function (char * (*my_asnprintf) (char *, size_t *, const char *, ...))
+       ASSERT (result != NULL);
+       ASSERT (strcmp (result, "12345") == 0);
+       ASSERT (length == 5);
+-      if (size < 6)
++      if (size < 5 + 1)
++        ASSERT (result != buf);
++      ASSERT (memcmp (buf + size, &"DEADBEEF"[size], 8 - size) == 0);
++      if (result != buf)
++        free (result);
++    }
++   /* Note: This test assumes IEEE 754 representation of 'double' floats.  */
++  for (size = 0; size <= 8; size++)
++    {
++      size_t length;
++      char *result;
++       memcpy (buf, "DEADBEEF", 8);
++      length = size;
++      result = my_asnprintf (buf, &length, "%2.0f", 1.6314159265358979e+125);
++      ASSERT (result != NULL);
++      ASSERT (strcmp (result, "163141592653589790215729350939528493057529598899734151772468186268423257777068536614838678161083520756952076273094236944990208") == 0);
++      ASSERT (length == 126);
++      if (size < 126 + 1)
+         ASSERT (result != buf);
+       ASSERT (memcmp (buf + size, &"DEADBEEF"[size], 8 - size) == 0);
+       if (result != buf)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb b/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
index 4a7d84a..1de6c42 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
@@ -14,17 +14,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=56a22a6e5bcce45e2c8ac184f81412b5"
 SRCREV = "b23000de1e47c7d580e0e220966dd1ee42a5e5bc"
 
 SRC_URI = "git://git.sv.gnu.org/gnulib;protocol=git \
+           file://CVE-2018-17942.patch \
 "
 
 S = "${WORKDIR}/git"
 
 do_install () {
-    cd ${S}
-    git checkout master
-    git clone ${S} ${D}/${datadir}/gnulib
+    install -d ${D}/${datadir}/gnulib/
+    cp -rf ${S}/* ${D}/${datadir}/gnulib/
+    rm -rf ${D}/${datadir}/gnulib/.pc
+    rm -rf ${D}/${datadir}/gnulib/patches
 }
 
-do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_package[noexec] = "1"
-- 
2.7.4


