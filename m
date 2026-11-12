Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7996.1794465774165502305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Nov 2026 22:42:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mlilcE/V;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1956112a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Nov 2026 22:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794465773; x=1795070573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gs0S/S7xMDCz94nemv2+j2OzGwmqbIOXVA1sGE+Nv18=;
        b=mlilcE/V53Thv7V+uEM7z/7xWenK/Ob3F1jCiEhrexJr+IKByZJkOEemdZfO+mbLKu
         0fGZDBXdAtk9kLNnvfRHXXQMo625yoO4DcXs60+JRdT3mQt5i/c6kAjBpF6DEvAqq6ZH
         6Wk4/6smYZ8LtH93W7KnXhmNvbXIJEYtxYrEBxXNJ3hTCPhtLNXOV2PiD0J7dpCgDN/u
         z9e/OCVYTEAyk3NqHzezVu+YlShAMokrflKNlsB5jLsVcwk5Ds5Ad7RChg6gcrRDED5w
         RGoIgMBKNOlVcS+bnKApfzMBPxmufADdJpqtYBJrK3xgwodbs0TWYeIdfvWU48nLyVxY
         YBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465773; x=1795070573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gs0S/S7xMDCz94nemv2+j2OzGwmqbIOXVA1sGE+Nv18=;
        b=BhnjcTwaJ81T31GaAU0cSa37szlUbUlJrEWz6mGx0JqXQIdrpr8JTHVXxYVoubJ/Cs
         VMXQyCGlnr6WTXfYODAJvG1gCzrhm7skIneiEClO1JXqL3I4D2gx37YBkHQpmsOGrAsK
         h05FoMUi7zl+b8LbP4CR8LnJmqLl2j6+rJcfS5GlW50VlKAoAX8LdDOtMjUeggIXMVbJ
         5W4E1suQ5/M//A1WkwbXAJ5Z4S8AY07VMf6vkAjw+Ip6RVSjrX9gX0jHDCUkOwJVQRFi
         64JIeRTXN/CEPdIGez8keJlcVHaam87u16DylWT4eULUlQ4m8+y7g2cpkKi8rG675c2h
         zxsw==
X-Gm-Message-State: APuU4Z8yMoDCWaZ8Ssxb5sfaL/ypcqnZ5v0abRLApA0TexHYhWHipu7j
	JNkIHcc8rbDDvx7jA95UaNMxqOZhWE4WWRAglx2xFPOWhL4PcdxhNSJT2pGeGKnQfno=
X-Gm-Gg: AYBFou1Jc5odNPaOLRM4WoEv5wBtNUiE651K+Tp25k2+qrlpYjFFDANsLVBDOEiey6V
	RIcjdc8SpN85fx/z90HCfANxwRdQCUeHhGEwRiGAFY9E0JgVmst9tMSNq2jbUkC8Mf6p5fAXiHN
	G6En1YhDUJLVRJ6HjjjgWGPVU7vz7NNSA2pfMp9fnCBdpYJ2sj8flxkSmhPm5+WyBwvQNbUpXX1
	cxjzZG5M+IMwvJBOUNSlepgfOjVV5BgcvtgrVMSIM8hq6raDtF/HpfDcpWHQ1ShujnBkkNLoO8R
	/H1/ldMgXdMuFOlJJjh5/YgaBQii1De/l1K3JOsojvt0uP/b3tiIb4fsycQfa3LJeTdaEn4le07
	a3w/XUCpI91cZ7YhKg8sp4JCTwDmvpyBET/yUsYstsUY7rLTx/29eoK2G4GdBsYGeZgGbDEnB2q
	m1tR7NZr9IgEmtN/biDEDFKz7wjp/Y4oC80FTay/g8cYkC84qqUwMx9G3VUkph1gLQOqbhldIIu
	M9eKswZU6dZ49IXltl4lQda+rTr4BnMlhNcs3c3prDWUNNHHO/9rk+DkJI4tYoPmYpFgvZq1kbf
	E96TzYCwEacsoI6jQPU9Tn18b6evPC207/q7oDImqStFyUVJ1/rRZfJD7xwJPRKHpI2pN743SvJ
	5QcNROCHFBWY4URW+r7zKUwC1SB5Ccnr6aRjTjUonRLGi3vLvRosgKxBi5rv+6AbVI0e8bsEUJQ
	4UXaa/NYld4u4Z/nSUpPPc6Z7fgnlHAnV424TIpHWwnb8jnQ7DZTk9I48NFKmuMNvrPfI22VaaY
	B7GxcFRvC9gpEE75q7plLXTOKN8q5/RRzuN9I0p9vNgcbeKO8RskSWvFo6nNu0QyIAPm5MwFPCX
	IFQL
X-Received: by 2002:a17:90b:164a:b0:3ac:9259:122c with SMTP id 98e67ed59e1d1-3b182f5a30cmr4341852a91.40.1794465773245;
        Wed, 11 Nov 2026 22:42:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c768e8sm2984715a91.11.2026.11.11.22.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:42:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 19/24] samba: upgrade 4.23.11 -> 4.25.1
Date: Wed, 11 Nov 2026 22:42:19 -0800
Message-ID: <20261112064225.2410019-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
References: <20261112064225.2410019-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 06:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132188
Content-Type: text/plain; charset="utf-8"

Drop the memset_explicit backports, included in this release, and
refresh 0003-Add-config-option-without-valgrind.patch.

The bundled talloc, tevent and tdb versions are unchanged (2.5.0,
0.17.2, 1.4.15).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ib-replace-Implement-memset_explicit.patch |  91 --------
 ...replace-Add-test-for-memset_explicit.patch | 154 --------------
 ...3-Add-config-option-without-valgrind.patch |  17 +-
 ...eplace-memset_s-with-memset_explicit.patch | 195 ------------------
 .../0004-lib-replace-Remove-memset_s.patch    | 136 ------------
 .../{samba_4.23.11.bb => samba_4.25.1.bb}     |   6 +-
 6 files changed, 11 insertions(+), 588 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-Implement-memset_explicit.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0002-lib-replace-Add-test-for-memset_explicit.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-with-memset_explicit.patch
 delete mode 100644 meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remove-memset_s.patch
 rename meta-networking/recipes-connectivity/samba/{samba_4.23.11.bb => samba_4.25.1.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-Implement-memset_explicit.patch b/meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-Implement-memset_explicit.patch
deleted file mode 100644
index 331d7eae87..0000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0001-lib-replace-Implement-memset_explicit.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From fba2c1dfb3b1f474a78e2613f150a9efc6d9b6c2 Mon Sep 17 00:00:00 2001
-From: Andreas Schneider <asn@samba.org>
-Date: Thu, 16 Oct 2025 11:06:56 +0200
-Subject: [PATCH 1/4] lib:replace: Implement memset_explicit()
-
-The memset_s() implementation is a bit obscure, as it requires a
-constraint handler to be set up. You don't really find any
-implmentations out there.
-
-With C23 memset_explicit() was added and this has been implemented
-for glibc 2.43 and also in FreeBSD.
-
-See https://sourceware.org/bugzilla/show_bug.cgi?id=32378
-See https://reviews.freebsd.org/D47286
-
-Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/ef08be24e9114b4477cc2b3f7a28a816ec66802c]
-Signed-off-by: Andreas Schneider <asn@samba.org>
-Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/replace/README    |  1 +
- lib/replace/replace.c | 13 +++++++++++++
- lib/replace/replace.h |  5 +++++
- lib/replace/wscript   |  2 +-
- 4 files changed, 20 insertions(+), 1 deletion(-)
-
-diff --git a/lib/replace/README b/lib/replace/README
-index 6612eab..bb9d008 100644
---- a/lib/replace/README
-+++ b/lib/replace/README
-@@ -73,6 +73,7 @@ symlink
- realpath
- poll
- setproctitle
-+memset_explicit
- memset_s
- 
- Types:
-diff --git a/lib/replace/replace.c b/lib/replace/replace.c
-index 68829f2..8615899 100644
---- a/lib/replace/replace.c
-+++ b/lib/replace/replace.c
-@@ -952,6 +952,19 @@ void rep_setproctitle_init(int argc, char *argv[], char *envp[])
- }
- #endif
- 
-+#ifndef HAVE_MEMSET_EXPLICIT
-+void *rep_memset_explicit(void *block, int c, size_t size)
-+{
-+	void *ptr = memset(block, c, size);
-+#ifdef HAVE_GCC_VOLATILE_MEMORY_PROTECTION
-+	/* See http://llvm.org/bugs/show_bug.cgi?id=15495 */
-+	__asm__ volatile("" : : "g"(block) : "memory");
-+#endif /* HAVE_GCC_VOLATILE_MEMORY_PROTECTION */
-+
-+	return ptr;
-+}
-+#endif
-+
- #ifndef HAVE_MEMSET_S
- # ifndef RSIZE_MAX
- #  define RSIZE_MAX (SIZE_MAX >> 1)
-diff --git a/lib/replace/replace.h b/lib/replace/replace.h
-index 25e6e14..1a8336d 100644
---- a/lib/replace/replace.h
-+++ b/lib/replace/replace.h
-@@ -994,6 +994,11 @@ void rep_setproctitle(const char *fmt, ...) PRINTF_ATTRIBUTE(1, 2);
- void rep_setproctitle_init(int argc, char *argv[], char *envp[]);
- #endif
- 
-+#ifndef HAVE_MEMSET_EXPLICIT
-+#define memset_explicit rep_memset_explicit
-+void *rep_memset_explicit(void *block, int c, size_t size);
-+#endif
-+
- #ifndef HAVE_MEMSET_S
- #define memset_s rep_memset_s
- int rep_memset_s(void *dest, size_t destsz, int ch, size_t count);
-diff --git a/lib/replace/wscript b/lib/replace/wscript
-index a22ae59..574740a 100644
---- a/lib/replace/wscript
-+++ b/lib/replace/wscript
-@@ -881,7 +881,7 @@ REPLACEMENT_FUNCTIONS = {
-                   'utime', 'utimes', 'dup2', 'chown', 'link', 'readlink',
-                   'symlink', 'lchown', 'realpath', 'memmem', 'vdprintf',
-                   'dprintf', 'get_current_dir_name', 'copy_file_range',
--                  'strerror_r', 'clock_gettime', 'memset_s'],
-+                  'strerror_r', 'clock_gettime', 'memset_explicit', 'memset_s'],
-     'timegm.c': ['timegm'],
-     # Note: C99_VSNPRINTF is not a function, but a special condition
-     # for replacement
diff --git a/meta-networking/recipes-connectivity/samba/samba/0002-lib-replace-Add-test-for-memset_explicit.patch b/meta-networking/recipes-connectivity/samba/samba/0002-lib-replace-Add-test-for-memset_explicit.patch
deleted file mode 100644
index 33e29533e9..0000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0002-lib-replace-Add-test-for-memset_explicit.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From ac2ee18b081483430b42c2cf35e423634aebbeb8 Mon Sep 17 00:00:00 2001
-From: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
-Date: Thu, 30 Oct 2025 16:01:36 +0100
-Subject: [PATCH 2/4] lib:replace: Add test for memset_explicit()
-
-Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/2b17c9816d4373eba365de803eec10435ea038d4]
-Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
-Reviewed-by: Andreas Schneider <asn@samba.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/replace/tests/test_memset_explicit.c | 99 ++++++++++++++++++++++++
- lib/replace/wscript                      |  5 ++
- selftest/tests.py                        |  6 ++
- 3 files changed, 110 insertions(+)
- create mode 100644 lib/replace/tests/test_memset_explicit.c
-
-diff --git a/lib/replace/tests/test_memset_explicit.c b/lib/replace/tests/test_memset_explicit.c
-new file mode 100644
-index 0000000..4e56d7a
---- /dev/null
-+++ b/lib/replace/tests/test_memset_explicit.c
-@@ -0,0 +1,99 @@
-+#include <stdarg.h>
-+#include <stddef.h>
-+#include <stdint.h>
-+#include <setjmp.h>
-+#include <cmocka.h>
-+
-+#include "lib/replace/replace.h"
-+
-+
-+/*
-+ * To check that a memset_explicit string is being memset when it
-+ * appears unused, we meed to be sneaky in our check -- otherwise the
-+ * check counts as a use.
-+ *
-+ * We are sneaky by using a function that seens to take an int
-+ * argument which is really a pointer, and we hide that it is a
-+ * pointer by masking it.
-+ *
-+ * For these tests we don't use talloc because the talloc magic gets
-+ * in the way a little bit.
-+ */
-+
-+#define MASK 0x12345678
-+
-+__attribute__((noinline))
-+static void check_memset_explicit(intmax_t p, const char *expected, size_t len)
-+{
-+	size_t i;
-+	char *secret = (char *) (p ^ MASK);
-+	for (i = 0; i < len; i++) {
-+		assert_int_equal(secret[i], expected[i]);
-+	}
-+}
-+
-+
-+__attribute__((noinline))
-+static char *get_secret(off_t offset)
-+{
-+	char * secret = malloc(7 + offset);
-+	memset(secret, 0, 7 + offset);
-+	memcpy(secret + offset, "secret", 7);
-+	/* avoiding *this* being elided */
-+	print_message("secret is '%s'\n", secret);
-+	asm("");
-+	return secret;
-+}
-+
-+
-+static void test_memset_explicit(void ** state)
-+{
-+	uintptr_t p;
-+	char zeros[7] = {0};
-+	char *secret = get_secret(0);
-+	p = ((uintptr_t)secret) ^ MASK;
-+	memset_explicit(secret, 'o', 3);
-+	check_memset_explicit(p, "oooret", 7);
-+	memset_explicit(secret, 0, 7);
-+	check_memset_explicit(p, zeros, 7);
-+	free(secret);
-+}
-+
-+static void test_memset_explicit_double_alloc(void ** state)
-+{
-+	size_t i, found;
-+	uintptr_t p, q;
-+	char *secret = get_secret(20);
-+	p = (uintptr_t)secret ^ MASK;
-+	memset_explicit(secret, 'x', 23);
-+	free(secret);
-+	/*
-+	 * Now we malloc the same size again, and hope we got the
-+	 * block we just freed.
-+	 */
-+	found = 0;
-+	for (i = 0; i < 1000; i++) {
-+		secret = malloc(27);
-+		q = (uintptr_t)secret ^ MASK;
-+		if (q == p) {
-+			q = (uintptr_t)(secret + 20) ^ MASK;
-+			check_memset_explicit(q, "xxxret", 7);
-+			found ++;
-+		}
-+		free(secret);
-+	}
-+	print_message("found freed pointer %zu/1000 times \n",
-+		found);
-+}
-+
-+int main(void)
-+{
-+	const struct CMUnitTest tests[] = {
-+		cmocka_unit_test(test_memset_explicit),
-+		cmocka_unit_test(test_memset_explicit_double_alloc),
-+	};
-+	if (! isatty(1)) {
-+		cmocka_set_message_output(CM_OUTPUT_SUBUNIT);
-+	}
-+	return cmocka_run_group_tests(tests, NULL, NULL);
-+}
-diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 574740a..9acebd3 100644
---- a/lib/replace/wscript
-+++ b/lib/replace/wscript
-@@ -964,6 +964,11 @@ def build(bld):
-                      deps='replace replace-test',
-                      install=False)
- 
-+    bld.SAMBA_BINARY('test_memset_explicit',
-+                     source='tests/test_memset_explicit.c',
-+                     deps='cmocka replace',
-+                     for_selftest=True)
-+
-     # build replacements for stdint.h and stdbool.h if needed
-     bld.SAMBA_GENERATOR('replace_stdint_h',
-                         rule='cp ${SRC} ${TGT}',
-diff --git a/selftest/tests.py b/selftest/tests.py
-index deb3c0b..3131905 100644
---- a/selftest/tests.py
-+++ b/selftest/tests.py
-@@ -414,6 +414,12 @@ plantestsuite("samba.unittests.smb1cli_session", "none",
- plantestsuite("samba.unittests.smb_util_translate", "none",
-               [os.path.join(bindir(), "default/libcli/smb/test_util_translate")])
- 
-+plantestsuite(
-+    "samba.unittests.memset_explicit",
-+    "none",
-+    [os.path.join(bindir(), "default/lib/replace/test_memset_explicit")],
-+)
-+
- plantestsuite("samba.unittests.talloc_keep_secret", "none",
-               [os.path.join(bindir(), "default/lib/util/test_talloc_keep_secret")])
- 
diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
index 70e7f28cc7..bf9c0973f9 100644
--- a/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
+++ b/meta-networking/recipes-connectivity/samba/samba/0003-Add-config-option-without-valgrind.patch
@@ -12,16 +12,19 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 Rebase to 4.19.3
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+Rebase to 4.25.1
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
  lib/replace/wscript | 5 +++--
  wscript             | 7 +++++++
  2 files changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 37d7759..9dd9b48 100644
+index be2a6ae..afbe16e 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -113,8 +113,9 @@ def configure(conf):
+@@ -134,8 +134,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
@@ -34,13 +37,13 @@ index 37d7759..9dd9b48 100644
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
 diff --git a/wscript b/wscript
-index 95ddd9e..6d9577a 100644
+index 5a98b6d..57b391f 100644
 --- a/wscript
 +++ b/wscript
-@@ -131,6 +131,13 @@
-                   help=('Disable kernely keyring support for credential storage'),
+@@ -131,6 +131,13 @@ def options(opt):
+                   help=('Disable kernel keyring support for credential storage'),
                    action='store_false', dest='enable_keyring')
-
+ 
 +    opt.add_option('--with-valgrind',
 +                   help=("Enable use of valgrind"),
 +                   action="store_true", dest='enable_valgrind')
@@ -49,5 +52,5 @@ index 95ddd9e..6d9577a 100644
 +                   action="store_false", dest='enable_valgrind', default=False)
 +
      opt.samba_add_onoff_option('ldap')
-
+ 
      opt.option_group('developer options')
diff --git a/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-with-memset_explicit.patch b/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-with-memset_explicit.patch
deleted file mode 100644
index 74ea1a7ab4..0000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0003-Replace-memset_s-with-memset_explicit.patch
+++ /dev/null
@@ -1,195 +0,0 @@
-From 8174382fe7a278309fc98b6e11ff99b6f41a8719 Mon Sep 17 00:00:00 2001
-From: Andreas Schneider <asn@samba.org>
-Date: Thu, 16 Oct 2025 11:19:51 +0200
-Subject: [PATCH 3/4] Replace memset_s() with memset_explicit()
-
-Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/3e81b73a050e511c658afc786478431ceef175ee]
-Signed-off-by: Andreas Schneider <asn@samba.org>
-Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/replace/replace.h                    | 18 +++++++++---------
- lib/util/memory.h                        | 16 +++++++++-------
- lib/util/tests/test_talloc_keep_secret.c | 19 ++++++++-----------
- 3 files changed, 26 insertions(+), 27 deletions(-)
-
---- a/lib/replace/replace.h
-+++ b/lib/replace/replace.h
-@@ -811,50 +811,50 @@ typedef unsigned long long ptrdiff_t ;
- /**
-  * Zero a structure.
-  */
--#define ZERO_STRUCT(x) memset_s((char *)&(x), sizeof(x), 0, sizeof(x))
-+#define ZERO_STRUCT(x) memset_explicit((char *)&(x), 0, sizeof(x))
- 
- /**
-  * Zero a structure given a pointer to the structure.
-  */
- #define ZERO_STRUCTP(x) do { \
- 	if ((x) != NULL) { \
--		memset_s((char *)(x), sizeof(*(x)), 0, sizeof(*(x))); \
-+		memset_explicit((char *)(x), 0, sizeof(*(x))); \
- 	} \
- } while(0)
- 
- /**
-  * Zero a structure given a pointer to the structure - no zero check
-  */
--#define ZERO_STRUCTPN(x) memset_s((char *)(x), sizeof(*(x)), 0, sizeof(*(x)))
-+#define ZERO_STRUCTPN(x) memset_explicit((char *)(x), 0, sizeof(*(x)))
- 
- /**
-  * Zero an array - note that sizeof(array) must work - ie. it must not be a
-  * pointer
-  */
--#define ZERO_ARRAY(x) memset_s((char *)(x), sizeof(x), 0, sizeof(x))
-+#define ZERO_ARRAY(x) memset_explicit((char *)(x), 0, sizeof(x))
- 
- /**
-  * Zero a given len of an array
-  */
--#define ZERO_ARRAY_LEN(x, l) memset_s((char *)(x), (l), 0, (l))
-+#define ZERO_ARRAY_LEN(x, l) memset_explicit((char *)(x), 0, (l))
- 
- /**
-  * Explicitly zero data from memory. This is guaranteed to be not optimized
-  * away.
-  */
--#define BURN_DATA(x) memset_s((char *)&(x), sizeof(x), 0, sizeof(x))
-+#define BURN_DATA(x) memset_explicit((char *)&(x), 0, sizeof(x))
- 
- /**
-  * Explicitly zero data from memory. This is guaranteed to be not optimized
-  * away.
-  */
--#define BURN_DATA_SIZE(x, s) memset_s((char *)&(x), (s), 0, (s))
-+#define BURN_DATA_SIZE(x, s) memset_explicit((char *)&(x), 0, (s))
- 
- /**
-  * Explicitly zero data from memory. This is guaranteed to be not optimized
-  * away.
-  */
--#define BURN_PTR_SIZE(x, s) memset_s((x), (s), 0, (s))
-+#define BURN_PTR_SIZE(x, s) memset_explicit((x), 0, (s))
- 
- /**
-  * Explicitly zero data in string. This is guaranteed to be not optimized
-@@ -863,7 +863,7 @@ typedef unsigned long long ptrdiff_t ;
- #define BURN_STR(x)	do { \
- 				if ((x) != NULL) { \
- 					size_t s = strlen(x); \
--					memset_s((x), s, 0, s); \
-+					memset_explicit((x), 0, s); \
- 				} \
- 			} while(0)
- 
---- a/lib/util/memory.h
-+++ b/lib/util/memory.h
-@@ -40,7 +40,7 @@
- #define BURN_FREE_STR(x) do { \
- 				if ((x) != NULL) { \
- 					size_t s = strlen(x); \
--					memset_s((x), s, 0, s); \
-+					memset_explicit((x), 0, s); \
- 					free(x); (x) = NULL; \
- 				} \
- 			} while(0)
-@@ -53,7 +53,7 @@
-  **/
- #define BURN_FREE(x, s) do { \
- 				if ((x) != NULL) { \
--					memset_s((x), (s), 0, (s)); \
-+					memset_explicit((x), 0, (s)); \
- 					free(x); (x) = NULL; \
- 				} \
- 			} while(0)
-@@ -78,7 +78,7 @@
-  * Zero a structure.
-  */
- #ifndef ZERO_STRUCT
--#define ZERO_STRUCT(x) memset_s((char *)&(x), sizeof(x), 0, sizeof(x))
-+#define ZERO_STRUCT(x) memset_explicit((char *)&(x), 0, sizeof(x))
- #endif
- 
- /**
-@@ -87,7 +87,7 @@
- #ifndef ZERO_STRUCTP
- #define ZERO_STRUCTP(x) do { \
- 	if ((x) != NULL) { \
--		memset_s((char *)(x), sizeof(*(x)), 0, sizeof(*(x))); \
-+		memset_explicit((char *)(x), 0, sizeof(*(x))); \
- 	} \
- } while(0)
- #endif
-@@ -96,7 +96,7 @@
-  * Zero a structure given a pointer to the structure - no zero check.
-  */
- #ifndef ZERO_STRUCTPN
--#define ZERO_STRUCTPN(x) memset_s((char *)(x), sizeof(*(x)), 0, sizeof(*(x)))
-+#define ZERO_STRUCTPN(x) memset_explicit((char *)(x), 0, sizeof(*(x)))
- #endif
- 
- /**
-@@ -104,13 +104,15 @@
-  * pointer.
-  */
- #ifndef ZERO_ARRAY
--#define ZERO_ARRAY(x) memset_s((char *)(x), sizeof(x), 0, sizeof(x))
-+#define ZERO_ARRAY(x) memset_explicit((char *)(x), 0, sizeof(x))
- #endif
- 
- /**
-  * Zero a given len of an array
-  */
--#define ZERO_ARRAY_LEN(x, l) memset_s((char *)(x), (l), 0, (l))
-+#ifndef ZERO_ARRAY_LEN
-+#define ZERO_ARRAY_LEN(x, l) memset_explicit((char *)(x), 0, (l))
-+#endif
- 
- /**
-  * Work out how many elements there are in a static array
---- a/lib/util/tests/test_talloc_keep_secret.c
-+++ b/lib/util/tests/test_talloc_keep_secret.c
-@@ -8,12 +8,11 @@
- #include <talloc.h>
- #include "lib/util/talloc_keep_secret.h"
- 
--int rep_memset_s(void *dest, size_t destsz, int ch, size_t count);
-+int rep_memset_explicit(void *dest, int ch, size_t count);
- 
--int rep_memset_s(void *dest, size_t destsz, int ch, size_t count)
-+int rep_memset_explicit(void *dest, int ch, size_t count)
- {
- 	check_expected_ptr(dest);
--	check_expected(destsz);
- 	check_expected(ch);
- 	check_expected(count);
- 
-@@ -44,10 +43,9 @@ static void test_talloc_keep_secret(void
- 	ptr1_size = talloc_get_size(ptr1);
- 	assert_int_equal(ptr1_size, strlen(ptr1) + 1);
- 
--	expect_string(rep_memset_s, dest, "secret");
--	expect_value(rep_memset_s, destsz, strlen(ptr1) + 1);
--	expect_value(rep_memset_s, ch, (int)'\0');
--	expect_value(rep_memset_s, count, strlen(ptr1) + 1);
-+	expect_string(rep_memset_explicit, dest, "secret");
-+	expect_value(rep_memset_explicit, ch, (int)'\0');
-+	expect_value(rep_memset_explicit, count, strlen(ptr1) + 1);
- 
- 	talloc_free(ptr1);
- 
-@@ -73,10 +71,9 @@ static void test_talloc_keep_secret_vali
- 	assert_non_null(password);
- 	talloc_keep_secret(password);
- 
--	expect_string(rep_memset_s, dest, "secret");
--	expect_value(rep_memset_s, destsz, strlen(password) + 1);
--	expect_value(rep_memset_s, ch, (int)'\0');
--	expect_value(rep_memset_s, count, strlen(password) + 1);
-+	expect_string(rep_memset_explicit, dest, "secret");
-+	expect_value(rep_memset_explicit, ch, (int)'\0');
-+	expect_value(rep_memset_explicit, count, strlen(password) + 1);
- 
- 	talloc_free(mem_ctx);
- }
diff --git a/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remove-memset_s.patch b/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remove-memset_s.patch
deleted file mode 100644
index 6e01ae35e7..0000000000
--- a/meta-networking/recipes-connectivity/samba/samba/0004-lib-replace-Remove-memset_s.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-From 06b9291b4a351c5d3a40f6c80ee11713840b1039 Mon Sep 17 00:00:00 2001
-From: Andreas Schneider <asn@samba.org>
-Date: Thu, 16 Oct 2025 11:22:46 +0200
-Subject: [PATCH 4/4] lib:replace: Remove memset_s()
-
-Upstream-Status: Backport [https://gitlab.com/samba-team/samba/-/commit/f3b380b8a3866286244725903287211cf54a4e74]
-Signed-off-by: Andreas Schneider <asn@samba.org>
-Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
-
-Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
-Autobuild-Date(master): Tue Nov 11 14:51:45 UTC 2025 on atb-devel-224
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/replace/README                      |  1 -
- lib/replace/replace.c                   | 87 ++++++++-----------------
- lib/replace/replace.h                   |  5 --
- lib/replace/wscript                     |  2 +-
- third_party/heimdal_build/roken.h       |  4 --
- third_party/heimdal_build/wscript_build |  5 ++
- 6 files changed, 34 insertions(+), 70 deletions(-)
-
-diff --git a/lib/replace/README b/lib/replace/README
-index bb9d008..d8431e7 100644
---- a/lib/replace/README
-+++ b/lib/replace/README
-@@ -73,7 +73,6 @@ realpath
- poll
- setproctitle
- memset_explicit
--memset_s
- 
- Types:
- bool
-diff --git a/lib/replace/replace.c b/lib/replace/replace.c
-index 8615899..a419837 100644
---- a/lib/replace/replace.c
-+++ b/lib/replace/replace.c
-@@ -965,37 +965,6 @@
- }
- #endif
-
--#ifndef HAVE_MEMSET_S
--# ifndef RSIZE_MAX
--#  define RSIZE_MAX (SIZE_MAX >> 1)
--# endif
--
--int rep_memset_s(void *dest, size_t destsz, int ch, size_t count)
--{
--	if (dest == NULL) {
--		return EINVAL;
--	}
--
--	if (destsz > RSIZE_MAX ||
--	    count > RSIZE_MAX ||
--	    count > destsz) {
--		return ERANGE;
--	}
--
--#if defined(HAVE_MEMSET_EXPLICIT)
--	memset_explicit(dest, ch, count);
--#else /* HAVE_MEMSET_EXPLICIT */
--	memset(dest, ch, count);
--# if defined(HAVE_GCC_VOLATILE_MEMORY_PROTECTION)
--	/* See http://llvm.org/bugs/show_bug.cgi?id=15495 */
--	__asm__ volatile("" : : "g"(dest) : "memory");
--# endif /* HAVE_GCC_VOLATILE_MEMORY_PROTECTION */
--#endif /* HAVE_MEMSET_EXPLICIT */
--
--	return 0;
--}
--#endif /* HAVE_MEMSET_S */
--
- #ifndef HAVE_GETPROGNAME
- # ifndef HAVE_PROGRAM_INVOCATION_SHORT_NAME
- # define PROGNAME_SIZE 32
-diff --git a/lib/replace/replace.h b/lib/replace/replace.h
-index 6b72c1f..24b2d8c 100644
---- a/lib/replace/replace.h
-+++ b/lib/replace/replace.h
-@@ -999,11 +999,6 @@ void rep_setproctitle_init(int argc, char *argv[], char *envp[]);
- void *rep_memset_explicit(void *block, int c, size_t size);
- #endif
- 
--#ifndef HAVE_MEMSET_S
--#define memset_s rep_memset_s
--int rep_memset_s(void *dest, size_t destsz, int ch, size_t count);
--#endif
--
- #ifndef HAVE_GETPROGNAME
- #define getprogname rep_getprogname
- const char *rep_getprogname(void);
-diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 9acebd3..faef185 100644
---- a/lib/replace/wscript
-+++ b/lib/replace/wscript
-@@ -881,7 +881,7 @@ REPLACEMENT_FUNCTIONS = {
-                   'utime', 'utimes', 'dup2', 'chown', 'link', 'readlink',
-                   'symlink', 'lchown', 'realpath', 'memmem', 'vdprintf',
-                   'dprintf', 'get_current_dir_name', 'copy_file_range',
--                  'strerror_r', 'clock_gettime', 'memset_explicit', 'memset_s'],
-+                  'strerror_r', 'clock_gettime', 'memset_explicit'],
-     'timegm.c': ['timegm'],
-     # Note: C99_VSNPRINTF is not a function, but a special condition
-     # for replacement
-diff --git a/third_party/heimdal_build/roken.h b/third_party/heimdal_build/roken.h
-index 3870609..4740a3d 100644
---- a/third_party/heimdal_build/roken.h
-+++ b/third_party/heimdal_build/roken.h
-@@ -123,10 +123,6 @@
- #define HAVE_SETEUID
- #endif
- 
--#ifndef HAVE_MEMSET_S
--#define HAVE_MEMSET_S
--#endif
--
- #ifndef HAVE_DIRFD
- #ifdef HAVE_DIR_DD_FD
- #define dirfd(x) ((x)->dd_fd)
-diff --git a/third_party/heimdal_build/wscript_build b/third_party/heimdal_build/wscript_build
-index 8aea52b..1988535 100644
---- a/third_party/heimdal_build/wscript_build
-+++ b/third_party/heimdal_build/wscript_build
-@@ -366,6 +366,11 @@ if not bld.CONFIG_SET('USING_SYSTEM_ROKEN'):
-         lib/roken/getuserinfo.c
-     '''
- 
-+    if not bld.CONFIG_SET('HAVE_MEMSET_S'):
-+        ROKEN_SOURCE += '''
-+            lib/roken/memset_s.c
-+        '''
-+
-     HEIMDAL_LIBRARY('roken',
-         ROKEN_SOURCE,
-         includes='../heimdal/lib/roken ../heimdal/include ../heimdal_build/include',
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb b/meta-networking/recipes-connectivity/samba/samba_4.25.1.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.25.1.bb
index 17d7d186aa..a5c299eef7 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.23.11.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.25.1.bb
@@ -28,10 +28,6 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://0005-Fix-pyext_PATTERN-for-cross-compilation.patch \
            file://0006-smbtorture-skip-test-case-tfork_cmd_send.patch \
            file://0007-Deleted-settiong-of-python-to-fix-the-install-confli.patch \
-           file://0001-lib-replace-Implement-memset_explicit.patch \
-           file://0002-lib-replace-Add-test-for-memset_explicit.patch \
-           file://0003-Replace-memset_s-with-memset_explicit.patch \
-           file://0004-lib-replace-Remove-memset_s.patch \
            "
 
 SRC_URI:append:libc-musl = " \
@@ -39,7 +35,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "089fdeeaf83593d8f9a16847a86b6cad2fc90f7a893eb8d9d5f509bbecadc0d4"
+SRC_URI[sha256sum] = "7f367545bca69aa96897628f82f0f04d4b66b3bcb36cb978b9bb952c4b4c428d"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>\d+\.\d+(\.\d+)+).tar.gz"
 
