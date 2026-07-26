Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117A3C531D0
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 03:13:46 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4838.1785035622720926215
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2026 20:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nlIdTpCn;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: festevam@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-971a7a7061bso871226241.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2026 20:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785035621; x=1785640421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLeC5+CDN+uSNRdIh+rjM6g1myWzhlPik3e4ciLwvYY=;
        b=nlIdTpCnySxXO4che5+sX8jed9x3lPM7aMsw4/5gOnLmO669FKyxhH1OMjZHs8wIiw
         kkGDL9urAKTmPHRcxl2lzeIIstMo90OxAQdR6jrgwem5/O7Zk6tAOUe73mNuKq29D/2v
         vfWYEB4RBSmJTKaLhjhGY5V671bXb1ZeY4IaOhD7K8FmY2A97oqFaUj8aDO8YJv0BbXu
         31Ldn2o7kQWHYqlhgZm+mpNl6+VYtUdmrXo5QzAgWA7zXnPwHvFIQyo8Cj3GqA0npXYc
         PVd2J9u2MN1YjbnTjjUOpbqGhoqM9j7Kdom9j+BvHI3g3eQ2l3VzmLvF1fxmGJYtKy8S
         O5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785035621; x=1785640421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLeC5+CDN+uSNRdIh+rjM6g1myWzhlPik3e4ciLwvYY=;
        b=cgB/T94o1SZMLP3ho21dUHEOfW5fG4HxVvBfTvlG54EgXJ6180eTH0LiDQ7JYCtGVD
         zgS1blYnHhjPBL1TKKlaPlMN9sAA42SC5SqZCaT28tM7rzDiqcyykEIsoch5DjgSBWjO
         aIrtwCc08xyH70TYVFOTKpFJ68ghC0zEUtLH0XOBDwicyL/PRVESbCNBE9eiX6C/SEVB
         mvcxfOpTcaXcZyFtUbCCbTvAQoPDCYOPVu8r1aHigtBuKCzKs1V/FnrdnE+wl7mZF+B/
         FOSiBlGqGXK3p4WR43jThQpknokCxm/fdd7rQWyhxEIg8wXDjmW77gkFuDEBeSpm6VQt
         5lVQ==
X-Gm-Message-State: AOJu0YzKae2MJu5wimu4Rwf35lZWihOiRqL2lZ1h7hA+fxiWrLVQC10a
	eW0iYelK63YfMiXTzn/WklOAMMHC8r4OtKLBGQ1xRI2KPKACA3gAGOinVBgdsg==
X-Gm-Gg: AR+sD10vrKqq8xLxCKu4UzCj8ZjwmRkKVdA8IZS7J+AwjLC95FKDswyKs95icTK6JbI
	tEPAY9QsQ9X58OIzDbVshDYxRbZJ1DgLtVrNr2RGQ4VqrfJNnaTl5x9z/jSQjarPesHfSBOuHjJ
	z2ZFgTIC9J/z0naGpt7F2ng/jWTPoEhIAy+EsbHRJAWszLIozvLhDY6eKkeMB3JK+B8D7w7PWzl
	NNSJvamK4VYBfEZ2MqWFTe2lwYTPT8C6dv6UBnSe4Fxs+V3ErZ/TuDmpIvQt/77woPMzuiX4ZYM
	GlY+IqQxNpdrFcwL4D5lxixqm+Gg2j4Smrt0jy4xj/Ew6XsBPSqLAWyGptp8R10VqEPric2fBKN
	/DT3GKksd8bSzNnBLBc6LiGxs85I9gspIaDzHJbKaPdhHS2ZsuLRSImTMPwdncLM4zXcqRp+RLl
	3nIynfQePfZ0xePo3TqeldspijUmmNyb1m5dA/CmlELYodf7zesg==
X-Received: by 2002:a05:6102:4194:b0:631:2973:5c2c with SMTP id ada2fe7eead31-75040abd835mr2565453137.21.1785035621471;
        Sat, 25 Jul 2026 20:13:41 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:7dd:bf94:624c:9fa8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-750362ea9aesm2787967137.9.2026.07.25.20.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 20:13:40 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] imx-cst: upgrade 3.4.1 -> 4.0.1
Date: Sun, 26 Jul 2026 00:13:33 -0300
Message-ID: <20260726031333.1318399-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2026 03:13:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128450

CST 4.0.1 replaces the custom Makefile build with CMake. Inherit the
cmake class, use the source src directory, and switch the parser
dependency from byacc to bison. Add json-c and point CMake at its staged
headers.

Disable installation of internal CST static libraries. Suppress line
directives from flex and bison generated sources to avoid embedding build
paths in the output.

Refresh source and license checksums and account for json-c's MIT
license. Drop the obsolete Makefile race fix.

Import Debian's check_return_values.patch from its packaging repository:

https://salsa.debian.org/collabora-team/imx-code-signing-tool

It handles fgets() failures required by the warning-as-error build.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../0001-check-return-value-of-fgets.patch    | 101 ++++++++++++++++++
 ...fix-missing-makefile-rule-dependency.patch |  45 --------
 .../recipes-support/imx-cst/imx-cst_3.4.1.bb  |  42 --------
 .../recipes-support/imx-cst/imx-cst_4.0.1.bb  |  36 +++++++
 4 files changed, 137 insertions(+), 87 deletions(-)
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fgets.patch
 delete mode 100644 meta-oe/recipes-support/imx-cst/imx-cst/0001-fix-missing-makefile-rule-dependency.patch
 delete mode 100644 meta-oe/recipes-support/imx-cst/imx-cst_3.4.1.bb
 create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb

diff --git a/meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fgets.patch b/meta-oe/recipes-support/imx-cst/imx-cst/0001-check-return-value-of-fgets.patch
new file mode 100644
index 000000000000..be3165f3d982
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
+
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
index 000000000000..826943fe09c3
--- /dev/null
+++ b/meta-oe/recipes-support/imx-cst/imx-cst_4.0.1.bb
@@ -0,0 +1,36 @@
+SUMMARY = "i.MX code signing tool"
+DESCRIPTION = "Code signing support that integrates the HABv4 and AHAB library for i.MX processors"
+LICENSE = "Apache-2.0 AND BSD-3-Clause AND MIT"
+
+LIC_FILES_CHKSUM = "\
+    file://licenses/LICENSE.bsd3;md5=1ef4297097d818a9787ed775218c133f \
+    file://licenses/LICENSE.json-c;md5=de54b60fbbc35123ba193fea8ee216f2 \
+    file://licenses/LICENSE.openssl;md5=3441526b1df5cc01d812c7dfc218cea6 \
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


