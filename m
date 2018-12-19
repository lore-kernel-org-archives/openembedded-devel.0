Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 25DB279C9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 02:51:25 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id i12so9089028pfo.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 18:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=33iRvqybn3fGL5LiRBcvbOJeQzq2oVuqB0cAGXy9ld0=;
	b=Tevw/Tp25anpdzUkdOvS4DGg/mF0WHNRY9L+vvGvhWRrKEnSmbLSYLRzQNuVi0BDZ2
	5IeiFhza0T13OA21T1AKggSXx+b7BlVxvhCHp2JCQ0aMTuBRsHd86vhpGLM+LPtmDgdu
	k2Rh0NLq/fmw6nHHTz9c8MYiLyb971/ZlPX/3Fa5zULg6jD7v3fk+jACKo9XW0Te/U7n
	M0AxWybUQ0WPUl5wz4VknsmYvNSmaRsoDD6CGTM2GWzBKKgyvG08VBGfaItIoXV7krND
	HVgqsYnwZn84qNEGhO8ekAY3lySTRDiJnznGlIu+8YR6hThdg1sPyKL5vTkbg5CJSEdz
	Y9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=33iRvqybn3fGL5LiRBcvbOJeQzq2oVuqB0cAGXy9ld0=;
	b=Qm1uObS3PFZfnocyLG/xYJkjieg0B4EdrgexALP7vIkicYKVcz4SJAD2TBix0Dvo9B
	qPT3kve8z0/huSh13c77qCoJc5XptO/jlsAeHUrkm9uxhd4H/Wz20W4Bh7SZPEDrqAlb
	xoNpMZhXyW6k6nAEjNJcJ9zQKBWeovaTED4KZFRJShYt1/wAzNWxdM0MRCuy/Tdkhwix
	V3E2exK9xt6NJnrLtuTTw8cybdatyUHbtHSJm7fVbJFIAL8FuJ0QeUCb268vtHtf4Knx
	0Oa4kYZCKBBxfFh5wKWPdYU8sMpWabzOHX0r+xrmbeNyJ6g0rtB5XXb2ka17qZdO1lsL
	62Pg==
X-Gm-Message-State: AA+aEWYAFNUBBL3xy2MH8DrSzFgrK7arS9euGFs1/ZfSHJEZOyJuiZtN
	mHPwkqoDBqwXAaWnjaHNGV9jdVs+YWs=
X-Google-Smtp-Source: AFSGD/Wx4DJlykWQKFKHn7gz9BCit3QnckvXf8Ch6LzvbGxaSAhgbNZWas3/RTQrQ9HsTjbqKlsa5w==
X-Received: by 2002:a63:a35c:: with SMTP id v28mr17782924pgn.205.1545187885652;
	Tue, 18 Dec 2018 18:51:25 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m3sm28000563pff.173.2018.12.18.18.51.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 18:51:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2018 18:51:04 -0800
Message-Id: <20181219025109.19159-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/6] gnulib: Upgrade to 2018-03-07.03
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
X-List-Received-Date: Wed, 19 Dec 2018 02:51:25 -0000
Content-Transfer-Encoding: 8bit

Call check_git_config to setup git to function correctly
on some builders git might not be setup for user and email
address

Fixes:

Your branch is behind 'origin/master' by 584 commits, and can be
fast-forwarded.
  (use "git pull" to update your local branch)
Cloning into
'TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/gnulib/2017-08-20.18-r0/image//usr/share/gnulib'...
done.

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnulib/gnulib/CVE-2018-17942.patch        | 88 -------------------
 ...17-08-20.18.bb => gnulib_2018-03-07.03.bb} |  8 +-
 2 files changed, 5 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch
 rename meta-oe/recipes-support/gnulib/{gnulib_2017-08-20.18.bb => gnulib_2018-03-07.03.bb} (87%)

diff --git a/meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch b/meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch
deleted file mode 100644
index 77e82b1674..0000000000
--- a/meta-oe/recipes-support/gnulib/gnulib/CVE-2018-17942.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From e91600a7aae3bafbefbe13abf771e61badd16286 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Tue, 16 Oct 2018 14:26:11 +0800
-Subject: [PATCH] vasnprintf: Fix heap memory overrun bug.
-
-Reported by Ben Pfaff <blp@cs.stanford.edu> in
-<https://lists.gnu.org/archive/html/bug-gnulib/2018-09/msg00107.html>.
-
-* lib/vasnprintf.c (convert_to_decimal): Allocate one more byte of
-memory.
-* tests/test-vasnprintf.c (test_function): Add another test.
-
-Upstream-Status: Backport [http://git.savannah.gnu.org/gitweb/?p=gnulib.git;
-a=commitdiff;h=278b4175c9d7dd47c1a3071554aac02add3b3c35]
-
-CVE: CVE-2018-17942
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- ChangeLog               |  8 ++++++++
- lib/vasnprintf.c        |  4 +++-
- tests/test-vasnprintf.c | 19 ++++++++++++++++++-
- 3 files changed, 29 insertions(+), 2 deletions(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 9864353..5ff76a3 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,11 @@
-+2018-09-23  Bruno Haible  <bruno@clisp.org>
-+ 	vasnprintf: Fix heap memory overrun bug.
-+	Reported by Ben Pfaff <blp@cs.stanford.edu> in
-+	<https://lists.gnu.org/archive/html/bug-gnulib/2018-09/msg00107.html>.
-+	* lib/vasnprintf.c (convert_to_decimal): Allocate one more byte of
-+	memory.
-+	* tests/test-vasnprintf.c (test_function): Add another test.
-+
- 2017-08-21  Paul Eggert  <eggert@cs.ucla.edu>
- 
- 	vc-list-files: port to Solaris 10
-diff --git a/lib/vasnprintf.c b/lib/vasnprintf.c
-index 2e4eb19..45de49f 100644
---- a/lib/vasnprintf.c
-+++ b/lib/vasnprintf.c
-@@ -860,7 +860,9 @@ convert_to_decimal (mpn_t a, size_t extra_zeroes)
-   size_t a_len = a.nlimbs;
-   /* 0.03345 is slightly larger than log(2)/(9*log(10)).  */
-   size_t c_len = 9 * ((size_t)(a_len * (GMP_LIMB_BITS * 0.03345f)) + 1);
--  char *c_ptr = (char *) malloc (xsum (c_len, extra_zeroes));
-+  /* We need extra_zeroes bytes for zeroes, followed by c_len bytes for the
-+     digits of a, followed by 1 byte for the terminating NUL.  */
-+  char *c_ptr = (char *) malloc (xsum (xsum (extra_zeroes, c_len), 1));
-   if (c_ptr != NULL)
-     {
-       char *d_ptr = c_ptr;
-diff --git a/tests/test-vasnprintf.c b/tests/test-vasnprintf.c
-index 2dd869f..ff68d5c 100644
---- a/tests/test-vasnprintf.c
-+++ b/tests/test-vasnprintf.c
-@@ -53,7 +53,24 @@ test_function (char * (*my_asnprintf) (char *, size_t *, const char *, ...))
-       ASSERT (result != NULL);
-       ASSERT (strcmp (result, "12345") == 0);
-       ASSERT (length == 5);
--      if (size < 6)
-+      if (size < 5 + 1)
-+        ASSERT (result != buf);
-+      ASSERT (memcmp (buf + size, &"DEADBEEF"[size], 8 - size) == 0);
-+      if (result != buf)
-+        free (result);
-+    }
-+   /* Note: This test assumes IEEE 754 representation of 'double' floats.  */
-+  for (size = 0; size <= 8; size++)
-+    {
-+      size_t length;
-+      char *result;
-+       memcpy (buf, "DEADBEEF", 8);
-+      length = size;
-+      result = my_asnprintf (buf, &length, "%2.0f", 1.6314159265358979e+125);
-+      ASSERT (result != NULL);
-+      ASSERT (strcmp (result, "163141592653589790215729350939528493057529598899734151772468186268423257777068536614838678161083520756952076273094236944990208") == 0);
-+      ASSERT (length == 126);
-+      if (size < 126 + 1)
-         ASSERT (result != buf);
-       ASSERT (memcmp (buf + size, &"DEADBEEF"[size], 8 - size) == 0);
-       if (result != buf)
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb b/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
similarity index 87%
rename from meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
rename to meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
index e048810554..be1aee5537 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_2017-08-20.18.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_2018-03-07.03.bb
@@ -11,16 +11,18 @@ SECTION = "devel"
 LICENSE = "LGPLv2+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a22a6e5bcce45e2c8ac184f81412b5"
-SRCREV = "b23000de1e47c7d580e0e220966dd1ee42a5e5bc"
+SRCREV = "0d6e3307bbdb8df4d56043d5f373eeeffe4cbef3"
 
-SRC_URI = "git://git.sv.gnu.org/gnulib;protocol=git \
-           file://CVE-2018-17942.patch \
+SRC_URI = "git://git.sv.gnu.org/gnulib.git \
 "
 
 S = "${WORKDIR}/git"
 
+inherit utils
+
 do_install () {
     cd ${S}
+    check_git_config
     git checkout master
     git clone ${S} ${D}/${datadir}/gnulib
     cd ${D}/${datadir}/gnulib
-- 
2.20.1


