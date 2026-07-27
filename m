Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F569C53200
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 02:19:50 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22808.1785118789621455341
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2026 19:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FICYhZG1;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: festevam@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-667971437d6so2442671d50.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2026 19:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785118789; x=1785723589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WiCSIEBqZt0W+BeXc9gwzml5QWitzFo8uevKAgsyRQA=;
        b=FICYhZG1iWh5HloGTqKWjELd+k1m1P//qZcfhGRb6f6bu214yJ6B6NWEiEd0bdemoQ
         B1mfBNJGWftoKzc46GmNZmclGV00Mgidx0h8UK5R5Td7iZJ/4p690YVvHJladzXfbcA9
         dir5bcxmcnSP8BVxSax3Sz7zfu3REpKJZ8aCK4t6CDYmqWchQBStC94HF10g1qnK9UGk
         ABDlxMt3Mo9oXSXCLZFhyJMmL2f0kBQzabf15kLj5QtMm1sPrKVi/2GFqxJw3EO9upbu
         MAoevAkIavQ37kObOYIlIwAqRNvd9jBYNfbFWJ30K182mRPqzfLzI3T+cfksopAp5t0B
         zJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785118789; x=1785723589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WiCSIEBqZt0W+BeXc9gwzml5QWitzFo8uevKAgsyRQA=;
        b=jL5eKHDVCl2p8jL85+d+7JOBQfXzmXuyU7Se0cJxTqMMXPgI9cc4PlTu8beOKDSlsd
         qjyb63o5b+v2Ke/TOjyseVeHTKgiSREkkCF2MH+NRl7dpFbV+6fIvkU4qSmXK4LQGYP5
         ABNgqDr27gyhBJdb5TH7AxbyRS/DzPGue1XAbSVO4d9gFK0Ng3/1i3uwfpC6FeweTlXN
         o1gYTA3Gkl2F8TQZhNLSWWdFxJQlVTdehT2x5xga5/9gUW/b42AlzyOSx2LoMdqfxjJW
         klX2ckFqBtDNmMxRoM8pIQlxvDG7qPhpJTQLT6h9fcI9xe7UvC+GDaTdoEmmu7qTy5hn
         bjnA==
X-Gm-Message-State: AOJu0Yy8cAPiS/rZCmm9rmJowu7IiE+IMbB/8+gdO0//F471fXTlxiq+
	3yPmLSQhrSCu9O+rpO5LnmLYkBBPnPB675INMyppXEKDJ8uTGLJQguUfIgGgvQ==
X-Gm-Gg: AR+sD12T8FsJgSnqf9VoBDXA2jqq+K4MoB6Cl7eAHVRVu+pFqCIH0RX0+EhD+V3vcwo
	jbsgxntkJL9f3rudW5sPotnF9cGaFfU7XvfpCMY+kgCWn+xnBTpZwaJj//lzzVSfh/+HUP5pGGr
	He3yXhWIi7PWy661SqXBlCFSjWx4PwJy4un7WzcSRQyByXprJnYxg/X5BWO/yB4/kytQaGQmuh0
	NKqqCaM/x6nEryJ+/IBzuiUF3WGIfQq6uaZ8s2xqjD1HRt5nd+VS0oJ+5cWpqwojGiWQcguHpP6
	xNrsI1I1pE9gPJVxGec7EbiNzaSQVOJiSyj7AsnxdoHAMfQK7ve5IPv1pQt5/LVYpWc6O/x3qpK
	EdSBaXfLnnVy0KfVbJjIHhDa7AP5/QLYwhsF0uk4UZ7tIBrjFSQwlhF6IWFArrB8yPJSo6dryDd
	wpmhal3t7k3xKNRgyCEtbfxQyDrv11vQ9jODMKbkTzSoTpwOhpVGc=
X-Received: by 2002:a05:690e:c4b:b0:665:2296:216c with SMTP id 956f58d0204a3-668c78b5f3amr1861559d50.24.1785118787791;
        Sun, 26 Jul 2026 19:19:47 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:2441:250a:18e0:faad])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81f65774b0dsm26512467b3.1.2026.07.26.19.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 19:19:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] imx-cst: upgrade 3.4.1 -> 4.0.1
Date: Sun, 26 Jul 2026 23:19:35 -0300
Message-ID: <20260727021935.2495371-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2026 02:19:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128454

CST 4.0.1 replaces the custom Makefile build with CMake. Inherit the
cmake class, point OECMAKE_SOURCEPATH at src, switch the parser
dependency from byacc to bison, and add json-c.

Disable installation of internal CST static libraries. Suppress line
directives from flex and bison generated sources to avoid embedding
build paths in the output.

Import Debian's complete 4.0.1+dfsg-2 patch series:

https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/tree/debian/unstable/debian/patches

The series fixes script regressions and shell portability, big-endian
and 32-bit builds, unchecked fgets() return values, HABv4 digest
initialization, OpenSSL 4 compatibility, PKCS#11 engine loading, and
dynamic linking of OpenSSL, json-c, hidapi-libusb, and libusb. Pin each
Origin tag to Debian's packaging commit.

With bundled third-party libraries no longer linked, the redistributed
CST sources and binaries are BSD-3-Clause; OpenSSL and json-c remain
recipe dependencies under their own licenses.

Refresh the source and license checksums and drop the obsolete Makefile
race fix.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Applied all imx-cst Debian patches.
- Fixed clang/qemuarm64 failure.

 .../0001-check-return-value-of-fgets.patch    | 101 +++
 ...fix-missing-makefile-rule-dependency.patch |  45 --
 ...e-ntohl-for-big-endian-compatibility.patch |  30 +
 .../0003-link-libjson-c-dynamically.patch     |  23 +
 ...-fix-format-errors-on-32-bit-targets.patch |  79 ++
 .../0005-fix-add-key-message-digest.patch     |  43 ++
 .../imx-cst/0006-unbreak-pki-scripts.patch    | 700 ++++++++++++++++++
 .../imx-cst/0007-fix-shell-syntax.patch       |  25 +
 .../imx-cst/0008-fix-scripts-shebang.patch    |  43 ++
 .../0009-load-pkcs11-engine-dynamically.patch |  69 ++
 ...10-link-libhidapi-libusb-dynamically.patch |  27 +
 .../0011-link-libusb-dynamically.patch        |  26 +
 .../0012-fix-openssl-4-asn1-opaque.patch      |  43 ++
 ...vlb-remove-redundant-NULL-definition.patch |  31 +
 ...4-fix-pointer-sign-errors-with-clang.patch |  57 ++
 .../recipes-support/imx-cst/imx-cst_3.4.1.bb  |  42 --
 .../recipes-support/imx-cst/imx-cst_4.0.1.bb  |  47 ++
 17 files changed, 1344 insertions(+), 87 deletions(-)
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fgets.patch
 delete mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-dependency.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0002-use-ntohl-for-big-endian-compatibility.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0003-link-libjson-c-dynamically.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0004-fix-format-errors-on-32-bit-targets.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0005-fix-add-key-message-digest.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0006-unbreak-pki-scripts.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0007-fix-shell-syntax.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0008-fix-scripts-shebang.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0009-load-pkcs11-engine-dynamically.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0010-link-libhidapi-libusb-dynamically.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0011-link-libusb-dynamically.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0012-fix-openssl-4-asn1-opaque.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0013-convlb-remove-redundant-NULL-definition.patch
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0014-fix-pointer-sign-errors-with-clang.patch
 delete mode 100644 meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb

diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fgets.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fgets.patch
new file mode 100644
index 000000000000..76bde5040064
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fgets.patch
@@ -0,0 +1,101 @@
+From 8a0717cc07e78d1133cc10e62220770734181bee Mon Sep 17 00:00:00 2001
+From: Tobias Deiminger <tobias.deiminger@linutronix.de>
+Date: Fri, 30 Jan 2026 01:55:36 +0100
+Subject: [PATCH] Check return value of fgets
+
+The cmake project has a reasonable default setting
+CMAKE_COMPILE_WARNING_AS_ERROR=ON in cmake/compiler_options.cmake. With this
+setting our build will fail on unchecked return values from fgets(). This
+patch fixes the issue by adding return value checks.
+
+This is not just to silence the errors. C99 defines for fgets: "If a read
+error occurs during the operation, the array contents are indeterminate and a
+null pointer is returned". We should actually check the return value to avoid
+undefined behavior from processing indeterminate data.
+
+Let get_passcode_to_key_file return -1 on error, since it is used as callback
+to OpenSSLs PEM_read_bio_PrivateKey_ex where documentation states "The
+callback must return the number of characters in the passphrase or -1 if an
+error occurred".
+
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/check_return_values.patch]
+---
+ src/lib/back_end/pkey.c            |  6 +++++-
+ src/tools/pki_tree/hab4_pki_tree.c | 25 +++++++++++++++++++++----
+ 2 files changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/src/lib/back_end/pkey.c b/src/lib/back_end/pkey.c
+index 31b5c3d..d6e9784 100644
+--- a/src/lib/back_end/pkey.c
++++ b/src/lib/back_end/pkey.c
+@@ -102,8 +102,12 @@ int get_passcode_to_key_file(char *buf, int size, int rwflag, void *userdata)
+         return 0;
+     }
+ 
+-    fgets(buf, size, password_fp);
++    buf = fgets(buf, size, password_fp);
+     fclose(password_fp);
++    if (buf == NULL)
++    {
++        return -1;
++    }
+     chomp(buf);
+ 
+     return strlen(buf);
+diff --git a/src/tools/pki_tree/hab4_pki_tree.c b/src/tools/pki_tree/hab4_pki_tree.c
+index 3c878e4..4ff15b2 100644
+--- a/src/tools/pki_tree/hab4_pki_tree.c
++++ b/src/tools/pki_tree/hab4_pki_tree.c
+@@ -118,6 +118,7 @@ int main(int argc, char **argv)
+     int num_srk = 0;
+     int val_period = 0;
+     char *pass = NULL;
++    char *user_input = NULL;
+     unsigned long serial = 0;
+     char duration_str[10] = {0};
+     char num_srk_str[10] = {0};
+@@ -304,10 +305,18 @@ int main(int argc, char **argv)
+         if (strcmp(existing_ca, "y") == 0)
+         {
+             printf("Enter CA key name: ");
+-            fgets(ca_key, sizeof(ca_key), stdin);
++            user_input = fgets(ca_key, sizeof(ca_key), stdin);
++            if (user_input == NULL) {
++                fprintf(stderr, "Error while reading user input\n");
++                return 1;
++            }
+             ca_key[strcspn(ca_key, "\n")] = '\0';
+             printf("Enter CA certificate name: ");
+-            fgets(ca_cert, sizeof(ca_cert), stdin);
++            user_input = fgets(ca_cert, sizeof(ca_cert), stdin);
++            if (user_input == NULL) {
++                fprintf(stderr, "Error while reading user input\n");
++                return 1;
++            }
+             ca_cert[strcspn(ca_cert, "\n")] = '\0';
+         }
+         printf("\nKey type options (confirm targeted device supports desired "
+@@ -330,10 +339,18 @@ int main(int argc, char **argv)
+                             ARRAY_SIZE(rsa_kl_values));
+         }
+         printf("Enter PKI tree duration (years): ");
+-        fgets(duration_str, sizeof(duration_str), stdin);
++        user_input = fgets(duration_str, sizeof(duration_str), stdin);
++        if (user_input == NULL) {
++            fprintf(stderr, "Error while reading user input\n");
++            return 1;
++        }
+         duration = atoi(duration_str);
+         printf("How many Super Root Keys should be generated ? : ");
+-        fgets(num_srk_str, sizeof(num_srk_str), stdin);
++        user_input = fgets(num_srk_str, sizeof(num_srk_str), stdin);
++        if (user_input == NULL) {
++            fprintf(stderr, "Error while reading user input\n");
++            return 1;
++        }
+         num_srk = atoi(num_srk_str);
+         ask_until_valid(
+             "Do you want the SRK certificates to have the CA flag set? (y/n) :",
+-- 
+2.47.3
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-dependency.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-dependency.patch
deleted file mode 100644
index ce7626ab31e5..000000000000
--- a/meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-dependency.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 73509cb22ffab827dc3e3ccda2781683b8e8296d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?K=C3=A9l=C3=A9fa=20San=C3=A9?= <kelefa.sane@smile.fr>
-Date: Mon, 2 Jun 2025 11:07:08 +0200
-Subject: [PATCH] fix missing makefile rule dependency
-
-During, the package build with an high CPU load we can face
-a build failed issue, caused by the header file cst_parser.h not present
-when compiling cst_lexer.c, which depend on cst_parser.h:
-| x86_64-poky-linux-gcc  ... -c cst_lexer.c -o cst_lexer.d
-| ../../code/front_end/src/cst_lexer.l:21:10: fatal error:
-|cst_parser.h: No such file or directory
-|    21 | #include "cst_parser.h"
-|       |          ^~~~~~~~~~~~~~
-| compilation terminated.
-
-The file cst_parser.h is generated during compilation
-by a makefile rule which also generate cst_parser.c
-
-To fix the issue, makefile rule needed to be update
-in order for compilation of cst_lexer.c to be done,
-always after the generation of cst_parser.h and .c
-
-Upstream-Status: Submitted [https://community.nxp.com/t5/Other-NXP-Products/Package-imx-code-signing-tool-3-4-0-dfsg-2-build-issue/m-p/2108575#M28853]
-
-Signed-off-by: Kelefa Sane <kelefa.sane@smile.fr>
----
- code/build/make/rules.mk | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/code/build/make/rules.mk b/code/build/make/rules.mk
-index 7720e4b..239108b 100644
---- a/code/build/make/rules.mk
-+++ b/code/build/make/rules.mk
-@@ -35,6 +35,11 @@ LFLAGS  := -t
- 	@echo "Link $@"
- 	$(LD) $^ $(LDFLAGS) -o $@
- 
-+# Compilation of cst_lexer.c require cst_parser.h 
-+# (cst_lexer.c include cst_parser.h) which is generated
-+# by the same makefile genrating cst_parser.c
-+cst_lexer.o: cst_parser.c
-+
- %.o: %.c
- 	@echo "Compile $@"
- 	# generate dependency file
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0002-use-ntohl-for-big-endian-compatibility.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0002-use-ntohl-for-big-endian-compatibility.patch
new file mode 100644
index 000000000000..8450183b0e58
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0002-use-ntohl-for-big-endian-compatibility.patch
@@ -0,0 +1,30 @@
+From: Andrej Shadura <andrew.shadura@collabora.co.uk>
+Date: Tue, 3 Jun 2025 17:20:10 +0200
+Subject: [PATCH] Use ntohl instead of a custom macro for big-endian compat
+
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/be-compat.patch]
+---
+ src/tools/hab_csf_parser/csf_parser.h | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/src/tools/hab_csf_parser/csf_parser.h b/src/tools/hab_csf_parser/csf_parser.h
+index b387cdc..e6755bd 100644
+--- a/src/tools/hab_csf_parser/csf_parser.h
++++ b/src/tools/hab_csf_parser/csf_parser.h
+@@ -17,12 +17,10 @@
+ #define PASS 1
+ #define FAIL 0
+ 
++#include <arpa/inet.h>
++
+ /* For little endian systems */
+-#define from_be32(x) \
+-        ((((x) & 0x000000ff) << 24) | \
+-        (((x) & 0x0000ff00) << 8 ) | \
+-        (((x) & 0x00ff0000) >> 8 ) | \
+-        (((x) & 0xff000000) >> 24))
++#define from_be32(x) ntohl(x)
+ 
+ #define assert(x)       if ((x) == 0) { \
+                                 printf("ASSERT failed at %s:%d\n", __FUNCTION__, __LINE__);    \
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0003-link-libjson-c-dynamically.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0003-link-libjson-c-dynamically.patch
new file mode 100644
index 000000000000..a3c8458f1b52
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0003-link-libjson-c-dynamically.patch
@@ -0,0 +1,23 @@
+From: Tobias Deiminger <tobias.deiminger@linutronix.de>
+Date: Fri, 30 Jan 2026 01:55:37 +0100
+Subject: [PATCH] Link libjson-c as shared system library
+
+The ahab_signed_message tool requires libjson-c. Upstream hardcodes static
+linking. Use the system shared library instead.
+
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/libjson_c_dynlink.patch]
+---
+ src/tools/ahab_signed_message/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tools/ahab_signed_message/CMakeLists.txt b/src/tools/ahab_signed_message/CMakeLists.txt
+index 1555ff7..6616986 100644
+--- a/src/tools/ahab_signed_message/CMakeLists.txt
++++ b/src/tools/ahab_signed_message/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-find_cst_dependency_library("libjson-c.a" json_c_DIR JSONC_LIB JSONC_INCLUDE_DIR)
++find_cst_dependency_library("libjson-c.so" json_c_DIR JSONC_LIB JSONC_INCLUDE_DIR)
+ 
+ add_executable(ahab_signed_message
+     ahab_signed_message.c
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0004-fix-format-errors-on-32-bit-targets.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0004-fix-format-errors-on-32-bit-targets.patch
new file mode 100644
index 000000000000..8ba89ccae91f
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0004-fix-format-errors-on-32-bit-targets.patch
@@ -0,0 +1,79 @@
+From: Tobias Deiminger <tobias.deiminger@linutronix.de>
+Date: Fri, 30 Jan 2026 01:55:37 +0100
+Subject: [PATCH] Fix -Wformat errors on i386
+
+gcc -Wformat ahab_image_verifier.c fails on i386 with the following errors:
+  "format '%zu' expects argument of type 'size_t', but argument has type 'long int'"
+  "format '%ld' expects argument of type 'long int', but argument has type 'size_t' {aka 'unsigned int'}"
+
+'printf("%zu", (long) 0);' and 'printf("%ld", (size_t) 0);' work by chance on
+architectures like amd64 where size_t expands to 'typedef long unsigned int
+size_t;'. However, on i386, size_t expands to 'typedef unsigned int size_t;'
+and thus -Wformat triggers a compilation error.
+
+To fix it, replace the format specifiers with the actual variable types.
+
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/formatstr-compat.patch]
+---
+ src/tools/image_verifier/ahab_image_verifier.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/tools/image_verifier/ahab_image_verifier.c b/src/tools/image_verifier/ahab_image_verifier.c
+index 17880ba..d7e73dd 100644
+--- a/src/tools/image_verifier/ahab_image_verifier.c
++++ b/src/tools/image_verifier/ahab_image_verifier.c
+@@ -671,7 +671,7 @@ static void verify_image(FILE *file, long file_size, long container_offset,
+     if (image->image_size > file_size)
+     {
+         fprintf(stderr,
+-                "Error: Invalid image size (image_size: %u, file_size: %zu).\n",
++                "Error: Invalid image size (image_size: %u, file_size: %li).\n",
+                 image->image_size, file_size);
+         return;
+     }
+@@ -1760,7 +1760,7 @@ static void parse_signature(FILE *file, long file_size, long container_offset,
+         (size_t) data_offset > file_size)
+     {
+         fprintf(stderr,
+-                "Error: Offset exceeds file size (file_size: %zu, "
++                "Error: Offset exceeds file size (file_size: %li, "
+                 "signature_offset: %ld, data_offset: %ld).\n",
+                 file_size, signature_offset, data_offset);
+         return;
+@@ -1770,7 +1770,7 @@ static void parse_signature(FILE *file, long file_size, long container_offset,
+     {
+         fprintf(
+             stderr,
+-            "Error: Invalid data length (data_length: %zu, file_size: %zu).\n",
++            "Error: Invalid data length (data_length: %zu, file_size: %li).\n",
+             data_length, file_size);
+         return;
+     }
+@@ -1779,7 +1779,7 @@ static void parse_signature(FILE *file, long file_size, long container_offset,
+     {
+         fprintf(stderr,
+                 "Error: Data range exceeds file bounds (data_offset: %ld, "
+-                "data_length: %zu, file_size: %zu).\n",
++                "data_length: %zu, file_size: %li).\n",
+                 data_offset, data_length, file_size);
+         return;
+     }
+@@ -1791,7 +1791,7 @@ static void parse_signature(FILE *file, long file_size, long container_offset,
+         fprintf(
+             stderr,
+             "Error: Signature offset is outside valid range (container_offset: "
+-            "%zu, file_size: %zu, signature_offset: %ld).\n",
++            "%li, file_size: %li, signature_offset: %ld).\n",
+             container_offset, file_size, signature_offset);
+         return;
+     }
+@@ -1829,7 +1829,7 @@ static void parse_signature(FILE *file, long file_size, long container_offset,
+ 
+     if (signature_length > MAX_SIGNATURE_LENGTH)
+     {
+-        fprintf(stderr, "Error: Invalid signature length: %ld\n",
++        fprintf(stderr, "Error: Invalid signature length: %zu\n",
+                 signature_length);
+         exit(EXIT_FAILURE);
+     }
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0005-fix-add-key-message-digest.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0005-fix-add-key-message-digest.patch
new file mode 100644
index 000000000000..d431e4467d11
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0005-fix-add-key-message-digest.patch
@@ -0,0 +1,43 @@
+From: Tobias Deiminger <tobias.deiminger@linutronix.de>
+Date: Fri, 30 Jan 2026 01:55:37 +0100
+Subject: [PATCH] Fix setting message digest in non-interactive mode for HABv4
+
+add_key must hard code message digest to sha256 if HABv4 is selected. However,
+this was only done in interactive mode. In non-interactive mode, the variable
+remained uninitialized and OpenSSL then failed in EVP_DigestSignInit_ex.
+Move the hard coding to a place where it is effective for all modes.
+
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/fix_add_key_md.patch]
+---
+ src/tools/pki_tree/add_key.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/tools/pki_tree/add_key.c b/src/tools/pki_tree/add_key.c
+index 09dd191..d276140 100644
+--- a/src/tools/pki_tree/add_key.c
++++ b/src/tools/pki_tree/add_key.c
+@@ -342,10 +342,6 @@ int main(int argc, char **argv)
+                 sizeof(md), md_valid_values, ARRAY_SIZE(md_valid_values));
+ #endif
+         }
+-        else
+-        {
+-            strcpy(md, "sha256");
+-        }
+ 
+         do
+         {
+@@ -397,6 +393,12 @@ int main(int argc, char **argv)
+         }
+     }
+ 
++    /* Hardcode sha256 for HAB4 */
++    if (strcmp(ver, "4") == 0)
++    {
++        strcpy(md, "sha256");
++    }
++
+     /* Compute validity period */
+     val_period = duration * 365;
+ 
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0006-unbreak-pki-scripts.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0006-unbreak-pki-scripts.patch
new file mode 100644
index 000000000000..a67b97f5f0eb
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0006-unbreak-pki-scripts.patch
@@ -0,0 +1,700 @@
+From: Andrej Shadura <andrew.shadura@collabora.co.uk>
+Date: Mon, 2 Jun 2025 14:42:22 +0200
+Subject: Undo 3.3.1 changes which break the script for no good reason
+
+Fall back to the installed openssl configuration directory if none is given.
+
+Based on the original patch by Sean Anderson <seanga2@gmail.com>
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/unbreak-scripts.patch]
+---
+ src/scripts/add_key.sh           | 56 ++++----------------------------
+ src/scripts/ahab_pki_tree.sh     | 68 ++++++++------------------------------
+ src/scripts/hab4_pki_tree.sh     | 70 ++++++++--------------------------------
+ src/scripts/hsm_add_key.sh       | 45 ++++----------------------
+ src/scripts/hsm_ahab_pki_tree.sh | 65 +++++++------------------------------
+ src/scripts/hsm_hab4_pki_tree.sh | 70 ++++++++--------------------------------
+ 6 files changed, 67 insertions(+), 307 deletions(-)
+
+diff --git a/src/scripts/add_key.sh b/src/scripts/add_key.sh
+index 6f4d3db..77ed2a7 100755
+--- a/src/scripts/add_key.sh
++++ b/src/scripts/add_key.sh
+@@ -307,47 +307,16 @@ else
+     fi
+ fi
+ 
+-# Check existance of keys/, crts/ and ca/ directories of <cst> before generating keys and
+-# switch current working directory to <cst>/keys directory, if needed.
+-crt_dir=$(pwd)
+-script_name=$(readlink "$0")
+-if [ "${script_name}" = "" ]
+-then
+-	script_name=$0
+-fi
+-script_path=$(cd $(dirname "${script_name}") && pwd -P)
+-keys_dir=${script_path}/../keys/
+-crts_dir=${script_path}/../crts/
+-ca_dir=${script_path}/../ca/
+-
+-if [ ! -d "${keys_dir}" ]
+-then
+-    echo ERROR: "Private keys directory ${keys_dir} is missing. Expecting script to be located inside <cst>/keys directory."
+-    exit 1
+-fi
+-
+-if [ ! -d "${crts_dir}" ]
+-then
+-    echo ERROR: "Public keys directory ${crts_dir} is missing. Expecting <cst>/crts directory to be already created."
+-    exit 1 
+-fi
++keys_dir=../keys
++crts_dir=../crts
++ca_dir=../ca
+ 
+ if [ ! -d "${ca_dir}" ]
+ then
+-    echo ERROR: "Openssl configuration directory ${ca_dir} is missing. Expecting <cst>/ca directory to hold openssl configuration files."
+-    exit 1 
++    ca_dir=/usr/share/doc/imx-code-signing-tool/pki_scripts/ca
+ fi
+ 
+-# Switch current working directory to keys directory, if needed.
+-if [ "${crt_dir}" != "${keys_dir}" ]
+-then
+-    cd "${keys_dir}" 
+-    if [ $? -ge 1 ]
+-    then
+-        echo ERROR: "Cannot change directory to ${keys_dir}"
+-        exit 1
+-    fi 
+-fi
++mkdir -p "$crts_dir"
+ 
+ # Generate outputs
+ if [ $kt = "ecc" ]
+@@ -379,10 +348,10 @@ openssl ca -batch -passin file:./key_pass.txt \
+     -in ./${key_fullname}_req.pem \
+     -cert ${signing_crt} \
+     -keyfile ${signing_key} \
+-    -extfile ../ca/v3_${ca}.cnf \
++    -extfile $ca_dir/v3_${ca}.cnf \
+     -out ../crts/${key_fullname}_crt.pem \
+     -days ${val_period} \
+-    -config ../ca/openssl.cnf
++    -config $ca_dir/openssl.cnf
+ 
+ # Convert certificate to DER format
+ openssl x509 -inform PEM -outform DER \
+@@ -406,15 +375,4 @@ mv ${key_fullname}_key_tmp.pem ${key_fullname}_key.pem
+ 
+ # Clean up
+ \rm -f *_req.pem
+-
+-# Switch back to initial working directory, if needed.
+-if [ "${crt_dir}" != "${keys_dir}" ]
+-then
+-    cd "${crt_dir}" 
+-    if [ $? -ge 1 ]
+-    then
+-        echo ERROR: "Cannot change directory to ${crt_dir}"
+-        exit 1
+-    fi
+-fi
+ exit 0
+diff --git a/src/scripts/ahab_pki_tree.sh b/src/scripts/ahab_pki_tree.sh
+index e1b5a44..f4304ca 100755
+--- a/src/scripts/ahab_pki_tree.sh
++++ b/src/scripts/ahab_pki_tree.sh
+@@ -292,47 +292,16 @@ then
+     read srk_ca
+ fi
+ 
+-# Check existance of keys/, crts/ and ca/ directories of <cst> before generating keys and
+-# switch current working directory to <cst>/keys directory, if needed.
+-crt_dir=$(pwd)
+-script_name=$(readlink "$0")
+-if [ "${script_name}" = "" ]
+-then
+-	script_name=$0
+-fi
+-script_path=$(cd $(dirname "${script_name}") && pwd -P)
+-keys_dir=${script_path}/../keys/
+-crts_dir=${script_path}/../crts/
+-ca_dir=${script_path}/../ca/
+-
+-if [ ! -d "${keys_dir}" ]
+-then
+-    echo ERROR: "Private keys directory ${keys_dir} is missing. Expecting script to be located inside <cst>/keys directory."
+-    exit 1
+-fi
+-
+-if [ ! -d "${crts_dir}" ]
+-then
+-    echo ERROR: "Public keys directory ${crts_dir} is missing. Expecting <cst>/crts directory to be already created."
+-    exit 1
+-fi
++keys_dir=../keys
++crts_dir=../crts
++ca_dir=../ca
+ 
+ if [ ! -d "${ca_dir}" ]
+ then
+-    echo ERROR: "Openssl configuration directory ${ca_dir} is missing. Expecting <cst>/ca directory to hold openssl configuration files."
+-    exit 1
++    ca_dir=/usr/share/doc/imx-code-signing-tool/pki_scripts/ca
+ fi
+ 
+-# Switch current working directory to keys directory, if needed.
+-if [ "${crt_dir}" != "${keys_dir}" ]
+-then
+-    cd "${keys_dir}"
+-    if [ $? -ge 1 ]
+-    then
+-        echo ERROR: "Cannot change directory to ${keys_dir}"
+-        exit 1
+-    fi
+-fi
++mkdir -p "$crts_dir"
+ 
+ # Check that the file "serial" is present, if not create it:
+ if [ ! -f serial ]
+@@ -397,7 +366,7 @@ then
+         -out ${ca_cert}.pem \
+         -days ${val_period} \
+         -extensions v3_ca \
+-        -extfile ../ca/openssl.cnf
++        -extfile $ca_dir/openssl.cnf
+ else
+     # Generate Elliptic Curve parameters:
+     eck='ec-'$cn'.pem'
+@@ -414,7 +383,7 @@ else
+                 -x509 -extensions v3_ca \
+                 -keyout temp_ca.pem \
+                 -out ${ca_cert}.pem \
+-                -days ${val_period} -config ../ca/openssl.cnf
++                -days ${val_period} -config $ca_dir/openssl.cnf
+ fi
+     # Generate CA key in PKCS #8 format - both PEM and DER
+     openssl pkcs8 -passin file:./key_pass.txt -passout file:./key_pass.txt \
+@@ -482,10 +451,10 @@ then
+                       -in ./temp_srk_req.pem \
+                       -cert ${ca_cert}.pem \
+                    -keyfile ${ca_key}.pem \
+-                      -extfile ../ca/v3_usr.cnf \
++                      -extfile $ca_dir/v3_usr.cnf \
+                       -out ${srk_crt}.pem \
+                       -days ${val_period} \
+-                      -config ../ca/openssl.cnf
++                      -config $ca_dir/openssl.cnf
+ 
+         # Convert SRK Certificate to DER format
+         openssl x509 -inform PEM -outform DER \
+@@ -557,10 +526,10 @@ do
+                   -in ./temp_srk_req.pem \
+                   -cert ${ca_cert}.pem \
+                   -keyfile ${ca_key}.pem \
+-                  -extfile ../ca/v3_ca.cnf \
++                  -extfile $ca_dir/v3_ca.cnf \
+                   -out ${srk_crt}.pem \
+                   -days ${val_period} \
+-                  -config ../ca/openssl.cnf
++                  -config $ca_dir/openssl.cnf
+ 
+     # Convert SRK Certificate to DER format
+     openssl x509 -inform PEM -outform DER \
+@@ -627,10 +596,10 @@ do
+                -in ./temp_sgk_req.pem \
+                -cert ${srk_crt_i} \
+                -keyfile ${srk_key_i} \
+-               -extfile ../ca/v3_usr.cnf \
++               -extfile $ca_dir/v3_usr.cnf \
+                -out ${sgk_crt}.pem \
+                -days ${val_period} \
+-               -config ../ca/openssl.cnf
++               -config $ca_dir/openssl.cnf
+ 
+     # Convert SGK Certificate to DER format
+     openssl x509 -inform PEM -outform DER \
+@@ -654,15 +623,4 @@ do
+     i=$((i+1))
+ done
+ fi
+-
+-# Switch back to initial working directory, if needed.
+-if [ "${crt_dir}" != "${keys_dir}" ]
+-then
+-    cd "${crt_dir}"
+-    if [ $? -ge 1 ]
+-    then
+-        echo ERROR: "Cannot change directory to ${crt_dir}"
+-        exit 1
+-    fi
+-fi
+ exit 0
+diff --git a/src/scripts/hab4_pki_tree.sh b/src/scripts/hab4_pki_tree.sh
+index be9f968..7d2378a 100755
+--- a/src/scripts/hab4_pki_tree.sh
++++ b/src/scripts/hab4_pki_tree.sh
+@@ -285,47 +285,16 @@ then
+     read srk_ca
+ fi
+ 
+-# Check existance of keys/, crts/ and ca/ directories of <cst> before generating keys and
+-# switch current working directory to <cst>/keys directory, if needed.
+-crt_dir=$(pwd)
+-script_name=$(readlink "$0")
+-if [ "${script_name}" = "" ]
+-then
+-	script_name=$0
+-fi
+-script_path=$(cd $(dirname "${script_name}") && pwd -P)
+-keys_dir=${script_path}/../keys/
+-crts_dir=${script_path}/../crts/
+-ca_dir=${script_path}/../ca/
+-
+-if [ ! -d "${keys_dir}" ]
+-then
+-    echo ERROR: "Private keys directory ${keys_dir} is missing. Expecting script to be located inside <cst>/keys directory."
+-    exit 1
+-fi
+-
+-if [ ! -d "${crts_dir}" ]
+-then
+-    echo ERROR: "Public keys directory ${crts_dir} is missing. Expecting <cst>/crts directory to be already created."
+-    exit 1 
+-fi
++keys_dir=../keys
++crts_dir=../crts
++ca_dir=../ca
+ 
+ if [ ! -d "${ca_dir}" ]
+ then
+-    echo ERROR: "Openssl configuration directory ${ca_dir} is missing. Expecting <cst>/ca directory to hold openssl configuration files."
+-    exit 1 
++    ca_dir=/usr/share/doc/imx-code-signing-tool/pki_scripts/ca
+ fi
+ 
+-# Switch current working directory to keys directory, if needed.
+-if [ "${crt_dir}" != "${keys_dir}" ]
+-then
+-    cd "${keys_dir}" 
+-    if [ $? -ge 1 ]
+-    then
+-        echo ERROR: "Cannot change directory to ${keys_dir}"
+-        exit 1
+-    fi 
+-fi
++mkdir -p "$crts_dir"
+ 
+ # Check that the file "serial" is present, if not create it:
+ if [ ! -f serial ]
+@@ -384,7 +353,7 @@ then
+                    -x509 -extensions v3_ca \
+                    -keyout temp_ca.pem \
+                    -out ${ca_cert}.pem \
+-                   -days ${val_period} -config ../ca/openssl.cnf
++                   -days ${val_period} -config $ca_dir/openssl.cnf
+ 
+     # Generate CA key in PKCS #8 format - both PEM and DER
+     openssl pkcs8 -passin file:./key_pass.txt -passout file:./key_pass.txt \
+@@ -452,10 +421,10 @@ then
+                       -in ./temp_srk_req.pem \
+                       -cert ${ca_cert}.pem \
+                    -keyfile ${ca_key}.pem \
+-                      -extfile ../ca/v3_usr.cnf \
++                      -extfile $ca_dir/v3_usr.cnf \
+                       -out ${srk_crt}.pem \
+                       -days ${val_period} \
+-                      -config ../ca/openssl.cnf
++                      -config $ca_dir/openssl.cnf
+ 
+         # Convert SRK Certificate to DER format
+         openssl x509 -inform PEM -outform DER \
+@@ -526,10 +495,10 @@ do
+                   -in ./temp_srk_req.pem \
+                   -cert ${ca_cert}.pem \
+                   -keyfile ${ca_key}.pem \
+-                  -extfile ../ca/v3_ca.cnf \
++                  -extfile $ca_dir/v3_ca.cnf \
+                   -out ${srk_crt}.pem \
+                   -days ${val_period} \
+-                  -config ../ca/openssl.cnf
++                  -config $ca_dir/openssl.cnf
+ 
+     # Convert SRK Certificate to DER format
+     openssl x509 -inform PEM -outform DER \
+@@ -596,10 +565,10 @@ do
+                -in ./temp_csf_req.pem \
+                -cert ${srk_crt_i} \
+                -keyfile ${srk_key_i} \
+-               -extfile ../ca/v3_usr.cnf \
++               -extfile $ca_dir/v3_usr.cnf \
+                -out ${csf_crt}.pem \
+                -days ${val_period} \
+-               -config ../ca/openssl.cnf
++               -config $ca_dir/openssl.cnf
+ 
+     # Convert CSF Certificate to DER format
+     openssl x509 -inform PEM -outform DER \
+@@ -659,10 +628,10 @@ do
+                -in ./temp_img_req.pem \
+                -cert ${srk_crt_i} \
+                -keyfile ${srk_key_i} \
+-               -extfile ../ca/v3_usr.cnf \
++               -extfile $ca_dir/v3_usr.cnf \
+                -out ${img_crt}.pem \
+                -days ${val_period} \
+-               -config ../ca/openssl.cnf
++               -config $ca_dir/openssl.cnf
+ 
+     # Convert IMG Certificate to DER format
+     openssl x509 -inform PEM -outform DER \
+@@ -686,15 +655,4 @@ do
+     i=$((i+1))
+ done
+ fi
+-
+-# Switch back to initial working directory, if needed.
+-if [ "${crt_dir}" != "${keys_dir}" ]
+-then
+-    cd "${crt_dir}" 
+-    if [ $? -ge 1 ]
+-    then
+-        echo ERROR: "Cannot change directory to ${crt_dir}"
+-        exit 1
+-    fi
+-fi
+ exit 0
+diff --git a/src/scripts/hsm_add_key.sh b/src/scripts/hsm_add_key.sh
+index 5fb010e..eff1844 100755
+--- a/src/scripts/hsm_add_key.sh
++++ b/src/scripts/hsm_add_key.sh
+@@ -330,47 +330,16 @@ else
+     fi
+ fi
+ 
+-# Check existance of keys/, crts/ and ca/ directories of <cst> before generating keys and
+-# switch current working directory to <cst>/keys directory, if needed.
+-crt_dir=$(pwd)
+-script_name=$(readlink "$0")
+-if [ "${script_name}" = "" ]
+-then
+-	script_name=$0
+-fi
+-script_path=$(cd $(dirname "${script_name}") && pwd -P)
+-keys_dir=${script_path}/../keys/
+-crts_dir=${script_path}/../crts/
+-ca_dir=${script_path}/../ca/
+-
+-if [ ! -d "${keys_dir}" ]
+-then
+-    echo ERROR: "Private keys directory ${keys_dir} is missing. Expecting script to be located inside <cst>/keys directory."
+-    exit 1
+-fi
+-
+-if [ ! -d "${crts_dir}" ]
+-then
+-    echo ERROR: "Public keys directory ${crts_dir} is missing. Expecting <cst>/crts directory to be already created."
+-    exit 1 
+-fi
++keys_dir=../keys
++crts_dir=../crts
++ca_dir=../ca
+ 
+ if [ ! -d "${ca_dir}" ]
+ then
+-    echo ERROR: "Openssl configuration directory ${ca_dir} is missing. Expecting <cst>/ca directory to hold openssl configuration files."
+-    exit 1 
++    ca_dir=/usr/share/doc/imx-code-signing-tool/pki_scripts/ca
+ fi
+ 
+-# Switch current working directory to keys directory, if needed.
+-if [ "${crt_dir}" != "${keys_dir}" ]
+-then
+-    cd "${keys_dir}" 
+-    if [ $? -ge 1 ]
+-    then
+-        echo ERROR: "Cannot change directory to ${keys_dir}"
+-        exit 1
+-    fi 
+-fi
++mkdir -p "$crts_dir"
+ 
+ # Generate outputs
+ if [ $kt = "ecc" ]
+@@ -405,11 +374,11 @@ openssl ca -engine pkcs11 -batch \
+     -cert "${signing_crt}" \
+     -keyform engine \
+     -keyfile "label_${signing_key_label}" \
+-    -extfile ../ca/v3_${ca}.cnf \
++    -extfile $ca_dir/v3_${ca}.cnf \
+     -out "../crts/${key_label}_crt.pem" \
+     -notext \
+     -days ${val_period} \
+-    -config ../ca/openssl.cnf \
++    -config $ca_dir/openssl.cnf \
+     -passin pass:$USR_PIN
+ 
+ # # Convert certificate to DER format
+diff --git a/src/scripts/hsm_ahab_pki_tree.sh b/src/scripts/hsm_ahab_pki_tree.sh
+index b2d26d1..ee740ad 100755
+--- a/src/scripts/hsm_ahab_pki_tree.sh
++++ b/src/scripts/hsm_ahab_pki_tree.sh
+@@ -289,47 +289,16 @@ then
+     read srk_ca
+ fi
+ 
+-# Check existance of keys/, crts/ and ca/ directories of <cst> before generating keys and
+-# switch current working directory to <cst>/keys directory, if needed.
+-crt_dir=$(pwd)
+-script_name=$(readlink "$0")
+-if [ "${script_name}" = "" ]
+-then
+-	script_name=$0
+-fi
+-script_path=$(cd $(dirname "${script_name}") && pwd -P)
+-keys_dir=${script_path}/../keys/
+-crts_dir=${script_path}/../crts/
+-ca_dir=${script_path}/../ca/
+-
+-if [ ! -d "${keys_dir}" ]
+-then
+-    echo ERROR: "Private keys directory ${keys_dir} is missing. Expecting script to be located inside <cst>/keys directory."
+-    exit 1
+-fi
+-
+-if [ ! -d "${crts_dir}" ]
+-then
+-    echo ERROR: "Public keys directory ${crts_dir} is missing. Expecting <cst>/crts directory to be already created."
+-    exit 1
+-fi
++keys_dir=../keys
++crts_dir=../crts
++ca_dir=../ca
+ 
+ if [ ! -d "${ca_dir}" ]
+ then
+-    echo ERROR: "Openssl configuration directory ${ca_dir} is missing. Expecting <cst>/ca directory to hold openssl configuration files."
+-    exit 1
++    ca_dir=/usr/share/doc/imx-code-signing-tool/pki_scripts/ca
+ fi
+ 
+-# Switch current working directory to keys directory, if needed.
+-if [ "${crt_dir}" != "${keys_dir}" ]
+-then
+-    cd "${keys_dir}"
+-    if [ $? -ge 1 ]
+-    then
+-        echo ERROR: "Cannot change directory to ${keys_dir}"
+-        exit 1
+-    fi
+-fi
++mkdir -p "$crts_dir"
+ 
+ # Check that the file "serial" is present, if not create it:
+ if [ ! -f serial ]
+@@ -387,7 +356,7 @@ then
+         -out ${ca_cert}.pem \
+         -text -x509 -extensions v3_ca \
+         -days ${val_period} \
+-        -config ../ca/openssl.cnf \
++        -config $ca_dir/openssl.cnf \
+ 	-passin pass:$USR_PIN
+ 
+     # # Convert CA Certificate to DER format
+@@ -447,11 +416,11 @@ then
+             -cert "${ca_cert}.pem" \
+             -keyform engine \
+             -keyfile "label_${ca_key_label}" \
+-            -extfile ../ca/v3_usr.cnf \
++            -extfile $ca_dir/v3_usr.cnf \
+             -out "${srk_crt}.pem" \
+             -notext \
+             -days ${val_period} \
+-            -config ../ca/openssl.cnf \
++            -config $ca_dir/openssl.cnf \
+ 	    -passin pass:$USR_PIN
+ 
+         # # Convert SRK Certificate to DER format
+@@ -522,11 +491,11 @@ do
+         -cert "${ca_cert}.pem" \
+         -keyform engine \
+         -keyfile "label_${ca_key_label}" \
+-        -extfile ../ca/v3_ca.cnf \
++        -extfile $ca_dir/v3_ca.cnf \
+         -out "${srk_crt}.pem" \
+         -notext \
+         -days ${val_period} \
+-        -config ../ca/openssl.cnf \
++        -config $ca_dir/openssl.cnf \
+ 	-passin pass:$USR_PIN
+ 
+     # # Convert SRK Certificate to DER format
+@@ -594,11 +563,11 @@ do
+         -cert "${srk_crt_i}.pem" \
+         -keyform engine \
+         -keyfile "label_${srk_key_i_label}" \
+-        -extfile ../ca/v3_usr.cnf \
++        -extfile $ca_dir/v3_usr.cnf \
+         -out "${sgk_crt}.pem" \
+         -notext \
+         -days ${val_period} \
+-        -config ../ca/openssl.cnf \
++        -config $ca_dir/openssl.cnf \
+ 	-passin pass:$USR_PIN
+ 
+     # # Convert SGK Certificate to DER format
+@@ -621,14 +590,4 @@ do
+ done
+ fi
+ 
+-# Switch back to initial working directory, if needed.
+-if [ "${crt_dir}" != "${keys_dir}" ]
+-then
+-    cd "${crt_dir}"
+-    if [ $? -ge 1 ]
+-    then
+-        echo ERROR: "Cannot change directory to ${crt_dir}"
+-        exit 1
+-    fi
+-fi
+ exit 0
+diff --git a/src/scripts/hsm_hab4_pki_tree.sh b/src/scripts/hsm_hab4_pki_tree.sh
+index f3d15aa..d46d1b1 100755
+--- a/src/scripts/hsm_hab4_pki_tree.sh
++++ b/src/scripts/hsm_hab4_pki_tree.sh
+@@ -277,47 +277,16 @@ then
+     read srk_ca
+ fi
+ 
+-# Check existance of keys/, crts/ and ca/ directories of <cst> before generating keys and
+-# switch current working directory to <cst>/keys directory, if needed.
+-crt_dir=$(pwd)
+-script_name=$(readlink "$0")
+-if [ "${script_name}" = "" ]
+-then
+-	script_name=$0
+-fi
+-script_path=$(cd $(dirname "${script_name}") && pwd -P)
+-keys_dir=${script_path}/../keys/
+-crts_dir=${script_path}/../crts/
+-ca_dir=${script_path}/../ca/
+-
+-if [ ! -d "${keys_dir}" ]
+-then
+-    echo ERROR: "Private keys directory ${keys_dir} is missing. Expecting script to be located inside <cst>/keys directory."
+-    exit 1
+-fi
+-
+-if [ ! -d "${crts_dir}" ]
+-then
+-    echo ERROR: "Public keys directory ${crts_dir} is missing. Expecting <cst>/crts directory to be already created."
+-    exit 1
+-fi
++keys_dir=../keys
++crts_dir=../crts
++ca_dir=../ca
+ 
+ if [ ! -d "${ca_dir}" ]
+ then
+-    echo ERROR: "Openssl configuration directory ${ca_dir} is missing. Expecting <cst>/ca directory to hold openssl configuration files."
+-    exit 1
++    ca_dir=/usr/share/doc/imx-code-signing-tool/pki_scripts/ca
+ fi
+ 
+-# Switch current working directory to keys directory, if needed.
+-if [ "${crt_dir}" != "${keys_dir}" ]
+-then
+-    cd "${keys_dir}"
+-    if [ $? -ge 1 ]
+-    then
+-        echo ERROR: "Cannot change directory to ${keys_dir}"
+-        exit 1
+-    fi
+-fi
++mkdir -p "$crts_dir"
+ 
+ # Check that the file "serial" is present, if not create it:
+ if [ ! -f serial ]
+@@ -373,7 +342,7 @@ then
+         -out ${ca_cert}.pem \
+         -text -x509 -extensions v3_ca \
+         -days ${val_period} \
+-        -config ../ca/openssl.cnf \
++        -config $ca_dir/openssl.cnf \
+ 	-passin pass:$USR_PIN
+ 
+     # # Convert CA Certificate to DER format
+@@ -433,11 +402,11 @@ then
+             -cert "${ca_cert}.pem" \
+             -keyform engine \
+             -keyfile "label_${ca_key_label}" \
+-            -extfile ../ca/v3_usr.cnf \
++            -extfile $ca_dir/v3_usr.cnf \
+             -out "${srk_crt}.pem" \
+             -notext \
+             -days ${val_period} \
+-            -config ../ca/openssl.cnf \
++            -config $ca_dir/openssl.cnf \
+ 	    -passin pass:$USR_PIN
+ 
+         # # Convert SRK Certificate to DER format
+@@ -508,11 +477,11 @@ do
+         -cert "${ca_cert}.pem" \
+         -keyform engine \
+         -keyfile "label_${ca_key_label}" \
+-        -extfile ../ca/v3_ca.cnf \
++        -extfile $ca_dir/v3_ca.cnf \
+         -out "${srk_crt}.pem" \
+         -notext \
+         -days ${val_period} \
+-        -config ../ca/openssl.cnf \
++        -config $ca_dir/openssl.cnf \
+ 	-passin pass:$USR_PIN
+ 
+     # # Convert SRK Certificate to DER format
+@@ -580,11 +549,11 @@ do
+         -cert "${srk_crt_i}.pem" \
+         -keyform engine \
+         -keyfile "label_${srk_key_i_label}" \
+-        -extfile ../ca/v3_usr.cnf \
++        -extfile $ca_dir/v3_usr.cnf \
+         -out "${csf_crt}.pem" \
+         -notext \
+         -days ${val_period} \
+-        -config ../ca/openssl.cnf \
++        -config $ca_dir/openssl.cnf \
+ 	-passin pass:$USR_PIN
+ 
+     # # Convert CSF Certificate to DER format
+@@ -646,11 +615,11 @@ do
+         -cert "${srk_crt_i}.pem" \
+         -keyform engine \
+         -keyfile "label_${srk_key_i_label}" \
+-        -extfile ../ca/v3_usr.cnf \
++        -extfile $ca_dir/v3_usr.cnf \
+         -out "${img_crt}.pem" \
+         -notext \
+         -days ${val_period} \
+-        -config ../ca/openssl.cnf \
++        -config $ca_dir/openssl.cnf \
+ 	-passin pass:$USR_PIN
+ 
+     # # Convert IMG Certificate to DER format
+@@ -672,15 +641,4 @@ do
+     i=$((i+1))
+ done
+ fi
+-
+-# Switch back to initial working directory, if needed.
+-if [ "${crt_dir}" != "${keys_dir}" ]
+-then
+-    cd "${crt_dir}"
+-    if [ $? -ge 1 ]
+-    then
+-        echo ERROR: "Cannot change directory to ${crt_dir}"
+-        exit 1
+-    fi
+-fi
+ exit 0
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0007-fix-shell-syntax.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0007-fix-shell-syntax.patch
new file mode 100644
index 000000000000..2afe919e6b1f
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0007-fix-shell-syntax.patch
@@ -0,0 +1,25 @@
+From: Andrej Shadura <andrew.shadura@collabora.co.uk>
+Date: Tue, 3 Jun 2025 14:50:29 +0200
+Subject: Remove commented out lines resulting in incorrect shell syntax
+
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/fix-shell-syntax.patch]
+---
+ src/tools/hab_srktool_scripts/createSRKTable | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/src/tools/hab_srktool_scripts/createSRKTable b/src/tools/hab_srktool_scripts/createSRKTable
+index 171f430..85237df 100755
+--- a/src/tools/hab_srktool_scripts/createSRKTable
++++ b/src/tools/hab_srktool_scripts/createSRKTable
+@@ -164,10 +164,3 @@ printf "%04s" $SRKTableSize | \
+ 			dd of=SRK_table.bin bs=1 seek=1 conv=notrunc
+ 
+ 
+-if [ $DEBUG = 0 ]; then
+-
+-#If hexdiff utility is installed you can compare SRK table generated
+-#with SRK table from SRKTOOL as follows
+-
+-#hexdiff SRK_table.bin SRK_1_2_3_4_table.bin
+-fi
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0008-fix-scripts-shebang.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0008-fix-scripts-shebang.patch
new file mode 100644
index 000000000000..c7d70c296677
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0008-fix-scripts-shebang.patch
@@ -0,0 +1,43 @@
+From: Tobias Deiminger <tobias.deiminger@linutronix.de>
+Date: Fri, 30 Jan 2026 01:55:36 +0100
+Subject: Fix shebang in hab_srktool_scripts
+
+The shebang has to be the first line, *above* the copyrights.
+Description: Fix shebang in hab_srktool_scripts The shebang has to be the first line, *above* the copyrights.
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/fix_scripts_shebang.patch]
+---
+ src/tools/hab_srktool_scripts/createSRKFuses | 2 +-
+ src/tools/hab_srktool_scripts/createSRKTable | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tools/hab_srktool_scripts/createSRKFuses b/src/tools/hab_srktool_scripts/createSRKFuses
+index b7b0ad0..a932868 100755
+--- a/src/tools/hab_srktool_scripts/createSRKFuses
++++ b/src/tools/hab_srktool_scripts/createSRKFuses
+@@ -1,9 +1,9 @@
++#!/bin/bash
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+ # Copyright 2017-2018, 2023 NXP
+ #
+ ##########################################################################
+-#!/bin/bash
+ #
+ # SCRIPT:  	createSRKFuses
+ #
+diff --git a/src/tools/hab_srktool_scripts/createSRKTable b/src/tools/hab_srktool_scripts/createSRKTable
+index 85237df..03f41a2 100755
+--- a/src/tools/hab_srktool_scripts/createSRKTable
++++ b/src/tools/hab_srktool_scripts/createSRKTable
+@@ -1,9 +1,9 @@
++#!/bin/bash
+ # SPDX-License-Identifier: BSD-3-Clause
+ #
+ # Copyright 2017-2018, 2023 NXP
+ #
+ ##########################################################################
+-#!/bin/bash
+ #
+ # SCRIPT:  	createSRKTable
+ #
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0009-load-pkcs11-engine-dynamically.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0009-load-pkcs11-engine-dynamically.patch
new file mode 100644
index 000000000000..5eba63c4819b
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0009-load-pkcs11-engine-dynamically.patch
@@ -0,0 +1,69 @@
+From: Tobias Deiminger <tobias.deiminger@linutronix.de>
+Date: Fri, 30 Jan 2026 01:55:36 +0100
+Subject: Load pkcs11 engine dynamically
+
+Upstream links a static copy of OpenSSL. It also hardcodes to statically link
+the pkcs11 engine from libp11.
+ We want to use system shared libraries instead and therefore adjust the
+ following:
+ - Don't call the bind_engine function from pkcs11 explicitly. It would require
+   linking, which in turn would require rpath for engines-3/pkcs11.so since
+   it's not in the system search path. Rather use OpenSSLs dynamic engine load
+   feature.
+ - Remove hardcoded static linking settings from CMakeLists.txt.
+
+Last-Update: 2025-05-27
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/openssl_engine_dynload.patch]
+---
+ src/CMakeLists.txt        |  2 --
+ src/lib/back_end/engine.c | 16 +---------------
+ 2 files changed, 1 insertion(+), 17 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 73035c6..236cc47 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -4,7 +4,6 @@ set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
+ 
+ option(CST_WITH_OPENSSL "Enable OpenSSL backend" ON)
+ if (CST_WITH_OPENSSL)
+-  set(OPENSSL_USE_STATIC_LIBS TRUE)
+   find_package(OpenSSL 3.0.0 REQUIRED)
+   if(NOT OPENSSL_FOUND)
+       message(FATAL "Cannot find OpenSSL, please check environment")
+@@ -119,7 +118,6 @@ function(find_cst_dependency_library LIB_NAME LIB_DIR_VAR LIB_VAR INCLUDE_VAR)
+ endfunction()
+ 
+ if(CST_WITH_PKCS11)
+-    find_cst_dependency_library("libpkcs11.a" libp11_DIR PKCS11_LIB PKCS11_INCLUDE_DIR)
+     add_compile_definitions(CST_WITH_PKCS11)
+ endif()
+ 
+diff --git a/src/lib/back_end/engine.c b/src/lib/back_end/engine.c
+index 83fa6dc..dd7eeb0 100644
+--- a/src/lib/back_end/engine.c
++++ b/src/lib/back_end/engine.c
+@@ -61,21 +61,7 @@ int32_t engine_ctx_init(struct engine_ctx *ctx)
+ 
+ 	ENGINE_load_builtin_engines();
+ 
+-    ctx->engine = ENGINE_new();
+-    if (ctx->engine == NULL) {
+-        error("Error creating new engine instance: %s\n",
+-              ERR_reason_error_string(ERR_get_error()));
+-        return 0;
+-    }
+-
+-    memset(&fns, 0, sizeof(fns));
+-    /* Bind the engine using the bind_engine function */
+-    if (!bind_engine(ctx->engine, "pkcs11", &fns)) {
+-        error("Error binding pkcs11 engine: %s\n",
+-              ERR_reason_error_string(ERR_get_error()));
+-        ENGINE_free(ctx->engine);
+-        return 0;
+-    }
++	ctx->engine = ENGINE_by_id("pkcs11");
+ 
+ #ifdef DEBUG
+ 	ENGINE_ctrl_cmd_string(ctx->engine, "VERBOSE", NULL, 0);
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0010-link-libhidapi-libusb-dynamically.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0010-link-libhidapi-libusb-dynamically.patch
new file mode 100644
index 000000000000..44f500d71f37
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0010-link-libhidapi-libusb-dynamically.patch
@@ -0,0 +1,27 @@
+From: Tobias Deiminger <tobias.deiminger@linutronix.de>
+Date: Fri, 30 Jan 2026 01:55:37 +0100
+Subject: Link libhidapi-libusb as shared system library
+
+The hab_log_parser tool requires libhidapi-libusb. Upstream hardcodes static
+linking.
+ We want to link the system shared library instead and must thus change the
+ related cmake find function.
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/hidapi_libusb_dynlink.patch]
+---
+ src/tools/hab_log_parser/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tools/hab_log_parser/CMakeLists.txt b/src/tools/hab_log_parser/CMakeLists.txt
+index 1dd6303..086496e 100644
+--- a/src/tools/hab_log_parser/CMakeLists.txt
++++ b/src/tools/hab_log_parser/CMakeLists.txt
+@@ -8,7 +8,7 @@ find_cst_dependency_library("libusb-1.0.a" libusb_DIR LIBUSB_LIB LIBUSB_INCLUDE_
+ if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
+     find_cst_dependency_library("libhidapi.a" hidapi_DIR LIBHIDAPI_LIB LIBHIDAPI_INCLUDE_DIR)
+ else()
+-    find_cst_dependency_library("libhidapi-libusb.a" hidapi_DIR LIBHIDAPI_LIB LIBHIDAPI_INCLUDE_DIR)
++    find_cst_dependency_library("libhidapi-libusb.so.0" hidapi_DIR LIBHIDAPI_LIB LIBHIDAPI_INCLUDE_DIR)
+ endif()
+ 
+ target_include_directories(hab_log_parser PUBLIC ${LIBHIDAPI_INCLUDE_DIR})
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0011-link-libusb-dynamically.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0011-link-libusb-dynamically.patch
new file mode 100644
index 000000000000..37cdbaef53fd
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0011-link-libusb-dynamically.patch
@@ -0,0 +1,26 @@
+From: Tobias Deiminger <tobias.deiminger@linutronix.de>
+Date: Fri, 30 Jan 2026 01:55:37 +0100
+Subject: Link libusb as shared system library
+
+The hab_log_parser tool requires libusb. Upstream hardcodes static linking.
+ We want to link the system shared library instead and must thus change the
+ related cmake find function.
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/libusb_dynlink.patch]
+---
+ src/tools/hab_log_parser/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tools/hab_log_parser/CMakeLists.txt b/src/tools/hab_log_parser/CMakeLists.txt
+index 086496e..067d728 100644
+--- a/src/tools/hab_log_parser/CMakeLists.txt
++++ b/src/tools/hab_log_parser/CMakeLists.txt
+@@ -3,7 +3,7 @@ add_executable(hab_log_parser
+     usbhid.c
+ )
+ 
+-find_cst_dependency_library("libusb-1.0.a" libusb_DIR LIBUSB_LIB LIBUSB_INCLUDE_DIR)
++find_cst_dependency_library("libusb-1.0.so" libusb_DIR LIBUSB_LIB LIBUSB_INCLUDE_DIR)
+ 
+ if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
+     find_cst_dependency_library("libhidapi.a" hidapi_DIR LIBHIDAPI_LIB LIBHIDAPI_INCLUDE_DIR)
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0012-fix-openssl-4-asn1-opaque.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0012-fix-openssl-4-asn1-opaque.patch
new file mode 100644
index 000000000000..8cb5abc3cb31
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0012-fix-openssl-4-asn1-opaque.patch
@@ -0,0 +1,43 @@
+From: Andrej Shadura <andrew.shadura@collabora.co.uk>
+Date: Tue, 2 Jun 2026 12:00:00 +0200
+Subject: Fix FTBFS with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 makes ASN1_INTEGER (aka struct asn1_string_st) fully opaque.
+Direct access to the ->data and ->length members is no longer allowed.
+
+Replace the direct struct member accesses in get_certificate_serial_number_length()
+with the public accessor functions ASN1_STRING_get0_data() and
+ASN1_STRING_length(), which have been available since OpenSSL 1.1.0 and are
+compatible with all supported Debian releases.
+
+Bug-Debian: https://bugs.debian.org/1138459
+Upstream-Status: Pending
+Origin: Debian [https://salsa.debian.org/collabora-team/imx-code-signing-tool/-/blob/fb2961efc88b9b6f37e98a5feed26873713299ee/debian/patches/fix-openssl4-asn1-opaque.patch]
+---
+ src/lib/common/openssl_helper.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/common/openssl_helper.c b/src/lib/common/openssl_helper.c
+index 36017ff..7a6980e 100644
+--- a/src/lib/common/openssl_helper.c
++++ b/src/lib/common/openssl_helper.c
+@@ -1234,7 +1234,7 @@ int get_signature_size(const EVP_PKEY *pkey, size_t *sig0_size,
+ int get_certificate_serial_number_length(X509 *cert)
+ {
+     ASN1_INTEGER *serial_number = NULL;
+-    uint8_t *serial_bytes = NULL;
++    const uint8_t *serial_bytes = NULL;
+     int serial_length = 0;
+ 
+     if (!cert)
+@@ -1251,8 +1251,8 @@ int get_certificate_serial_number_length(X509 *cert)
+     }
+ 
+     /* Get the raw data of the serial number */
+-    serial_bytes = serial_number->data;
+-    serial_length = serial_number->length;
++    serial_bytes = ASN1_STRING_get0_data(serial_number);
++    serial_length = ASN1_STRING_length(serial_number);
+ 
+     /* Check if the serial number is negative (MSB of first byte is set) */
+     if (serial_bytes[0] & 0x80)
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0013-convlb-remove-redundant-NULL-definition.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0013-convlb-remove-redundant-NULL-definition.patch
new file mode 100644
index 000000000000..2bc7ca55b3a4
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0013-convlb-remove-redundant-NULL-definition.patch
@@ -0,0 +1,31 @@
+From: Fabio Estevam <festevam@gmail.com>
+Date: Sun, 26 Jul 2026 09:15:12 -0300
+Subject: [PATCH] convlb: Remove redundant NULL definition
+
+convlb.c includes standard headers that already define NULL. Defining it
+again is unnecessary and Clang rejects the redefinition because the project
+enables warnings as errors:
+
+convlb.c:24:9: error: 'NULL' macro redefined [-Werror,-Wmacro-redefined]
+
+Remove the local definition and use the one supplied by the standard headers.
+
+Upstream-Status: Pending
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ src/tools/convlb/convlb.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/tools/convlb/convlb.c b/src/tools/convlb/convlb.c
+index 0a0197e..2459359 100644
+--- a/src/tools/convlb/convlb.c
++++ b/src/tools/convlb/convlb.c
+@@ -21,8 +21,6 @@
+                                 GLOBALS
+ =============================================================================*/
+ 
+-#define NULL ((void *)0)
+-
+ #define TEMPFILENAME ".convlb.tmp"
+ 
+ char *toolname = NULL;
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0014-fix-pointer-sign-errors-with-clang.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0014-fix-pointer-sign-errors-with-clang.patch
new file mode 100644
index 000000000000..19a4814f9043
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst/0014-fix-pointer-sign-errors-with-clang.patch
@@ -0,0 +1,57 @@
+From: Fabio Estevam <festevam@gmail.com>
+Date: Sun, 26 Jul 2026 09:31:41 -0300
+Subject: [PATCH] Fix pointer sign errors with Clang
+
+Clang diagnoses mismatches between pointers to char, signed char, and
+unsigned char. Since warnings are treated as errors, these mismatches break
+the build.
+
+Keep the signed byte-sized values used for the -1 sentinel and make the
+receiving parameter types match them. Also use const char pointers for
+string literals.
+
+Upstream-Status: Pending
+Signed-off-by: Fabio Estevam <festevam@gmail.com>
+---
+ src/lib/front_end/csf_cmd_ins_key.c             | 10 +++++-----
+ src/tools/image_verifier/ahab_image_verifier.c | 2 +-
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lib/front_end/csf_cmd_ins_key.c b/src/lib/front_end/csf_cmd_ins_key.c
+index b9dc4b4..ffb001b 100644
+--- a/src/lib/front_end/csf_cmd_ins_key.c
++++ b/src/lib/front_end/csf_cmd_ins_key.c
+@@ -48,2 +48,2 @@ static int32_t process_installkey_arguments(
+-    quadruple_t *uuid, uint8_t *fuse_version, uint8_t *check_all_signatures,
+-    uint8_t *fast_boot);
++    quadruple_t *uuid, uint8_t *fuse_version, int8_t *check_all_signatures,
++    int8_t *fast_boot);
+@@ -108,2 +108,2 @@ static int32_t process_installkey_arguments(
+-    quadruple_t *uuid, uint8_t *fuse_version, uint8_t *check_all_signatures,
+-    uint8_t *fast_boot)
++    quadruple_t *uuid, uint8_t *fuse_version, int8_t *check_all_signatures,
++    int8_t *fast_boot)
+@@ -527,7 +527,7 @@ int32_t cmd_handler_installsrk(command_t* cmd)
+     uint8_t *srk_key_data = NULL;
+     size_t num_tables = 1;
+     size_t srk_table_offset = 0;
+-    uint8_t *sd_alg_str = NULL;
++    const char *sd_alg_str = NULL;
+     srk_entry_t *temp_srk_entry = NULL;
+ 
+     PRINT_V("Install SRK\n");
+diff --git a/src/tools/image_verifier/ahab_image_verifier.c b/src/tools/image_verifier/ahab_image_verifier.c
+index 5d693ba..0b939f7 100644
+--- a/src/tools/image_verifier/ahab_image_verifier.c
++++ b/src/tools/image_verifier/ahab_image_verifier.c
+@@ -436,7 +436,7 @@ static void parse_container_header_flags(uint32_t flags, uint8_t version)
+  */
+ static enum parse_error_e display_header(struct ahab_container_header_s *header)
+ {
+-    uint8_t *tag = NULL;
++    const char *tag = NULL;
+ 
+     /* Check for NULL header */
+     if (header == NULL)
+-- 
+2.50.1
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
deleted file mode 100644
index c9e73a83b437..000000000000
--- a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "i.MX code signing tool"
-DESCRIPTION = "Code signing support that integrates the HABv4 and AHAB library for i.MX processors"
-LICENSE = "Apache-2.0 AND BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "\
-    file://LICENSE.bsd3;md5=14aba05f9fa6c25527297c8aac95fcf6 \
-    file://LICENSE.hidapi;md5=e0ea014f523f64f0adb13409055ee59e \
-    file://LICENSE.openssl;md5=3441526b1df5cc01d812c7dfc218cea6 \
-"
-
-DEPENDS = "byacc-native flex-native openssl"
-
-# debian: 3.4.0+dfsg-2
-DEBIAN_PGK_NAME = "imx-code-signing-tool"
-DEBIAN_PGK_VERSION = "${PV}+dfsg"
-
-SRC_URI = "\
-    ${DEBIAN_MIRROR}/main/i/${DEBIAN_PGK_NAME}/${DEBIAN_PGK_NAME}_${DEBIAN_PGK_VERSION}.orig.tar.xz \
-    file://0001-fix-missing-makefile-rule-dependency.patch \
-"
-
-SRC_URI[sha256sum] = "342c0c028658a4a859fe70578b58c3b07e17bee0c7e3a13d063d4791e82c2dee"
-
-S = "${UNPACKDIR}/${DEBIAN_PGK_NAME}-${DEBIAN_PGK_VERSION}"
-
-EXTRA_OEMAKE = 'CC="${CC}" LD="${CC}" AR="${AR}" OBJCOPY="${OBJCOPY}"'
-
-inherit siteinfo
-
-do_compile() {
-    oe_runmake -C code/obj.linux${SITEINFO_BITS} OSTYPE=linux${SITEINFO_BITS} ENCRYPTION=yes COPTIONS="${CFLAGS} ${CPPFLAGS}" LDOPTIONS="${LDFLAGS}"
-    oe_runmake -C add-ons/hab_csf_parser COPTS="${CFLAGS} ${CPPFLAGS} ${LDFLAGS}"
-}
-
-do_install () {
-    install -d ${D}${bindir}
-    install -m 755 ${S}/code/obj.linux${SITEINFO_BITS}/cst ${D}${bindir}/
-    install -m 755 ${S}/code/obj.linux${SITEINFO_BITS}/srktool ${D}${bindir}
-    install -m 755 ${S}/add-ons/hab_csf_parser/csf_parser ${D}${bindir}
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
new file mode 100644
index 000000000000..60b27a6c92a3
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
@@ -0,0 +1,47 @@
+SUMMARY = "i.MX code signing tool"
+DESCRIPTION = "Code signing support that integrates the HABv4 and AHAB library for i.MX processors"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "\
+    file://licenses/LICENSE.bsd3;md5=1ef4297097d818a9787ed775218c133f \
+"
+
+DEPENDS = "bison-native flex-native json-c openssl"
+
+DEBIAN_PKG_NAME = "imx-code-signing-tool"
+DEBIAN_PKG_VERSION = "${PV}+dfsg"
+
+SRC_URI = "\
+    ${DEBIAN_MIRROR}/main/i/${DEBIAN_PKG_NAME}/${DEBIAN_PKG_NAME}_${DEBIAN_PKG_VERSION}.orig.tar.xz \
+    file://0001-check-return-value-of-fgets.patch \
+    file://0002-use-ntohl-for-big-endian-compatibility.patch \
+    file://0003-link-libjson-c-dynamically.patch \
+    file://0004-fix-format-errors-on-32-bit-targets.patch \
+    file://0005-fix-add-key-message-digest.patch \
+    file://0006-unbreak-pki-scripts.patch \
+    file://0007-fix-shell-syntax.patch \
+    file://0008-fix-scripts-shebang.patch \
+    file://0009-load-pkcs11-engine-dynamically.patch \
+    file://0010-link-libhidapi-libusb-dynamically.patch \
+    file://0011-link-libusb-dynamically.patch \
+    file://0012-fix-openssl-4-asn1-opaque.patch \
+    file://0013-convlb-remove-redundant-NULL-definition.patch \
+    file://0014-fix-pointer-sign-errors-with-clang.patch \
+"
+SRC_URI[sha256sum] = "fd92a1a9faa10fb81bbf752c7ee1e257f17e1ec4c2964f8a47adf8a3eaa7df41"
+
+S = "${UNPACKDIR}/${DEBIAN_PKG_NAME}-${DEBIAN_PKG_VERSION}"
+
+OECMAKE_SOURCEPATH = "${S}/src"
+
+# CST_INSTALL only controls installation of internal static libraries, not tools.
+EXTRA_OECMAKE = "\
+    -DCST_INSTALL=OFF \
+    -DFLEX_TARGET_ARG_COMPILE_FLAGS=--noline \
+    -DBISON_TARGET_ARG_COMPILE_FLAGS=--no-lines \
+    -DJSONC_INCLUDE_DIR=${STAGING_INCDIR} \
+"
+
+inherit cmake
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


