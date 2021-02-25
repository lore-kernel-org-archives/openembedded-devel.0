Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.5561.1614217614953156029
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 17:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 11P1kOFU006859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Feb 2021 17:46:40 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Feb 2021 17:46:26 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Wed, 24 Feb 2021 17:46:26 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] libssh2: remove the recipe since it moved to oe-core
Date: Wed, 24 Feb 2021 20:46:24 -0500
Message-ID: <20210225014625.397669-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...nviroment-to-decide-if-a-test-is-bui.patch |  46 ------
 ...ditionally-undefine-backend-m4-macro.patch |  30 ----
 .../libssh2/files/CVE-2019-17498.patch        | 131 ------------------
 .../recipes-support/libssh2/files/run-ptest   |   8 --
 .../recipes-support/libssh2/libssh2_1.9.0.bb  |  53 -------
 5 files changed, 268 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
 delete mode 100644 meta-oe/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
 delete mode 100644 meta-oe/recipes-support/libssh2/files/CVE-2019-17498.patch
 delete mode 100644 meta-oe/recipes-support/libssh2/files/run-ptest
 delete mode 100644 meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb

diff --git a/meta-oe/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch b/meta-oe/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
deleted file mode 100644
index 5ff9bf846..000000000
--- a/meta-oe/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From f9e3e2ee7b18ba5bb8efe083171f3e701eb0a663 Mon Sep 17 00:00:00 2001
-From: Your Name <you@example.com>
-Date: Mon, 28 Dec 2020 02:08:03 +0000
-Subject: [PATCH] Don't let host enviroment to decide if a test is build
-
-test ssh2.sh need sshd, for cross compile, we need it on target, so
-don't use SSHD on host to decide weither to build a test
-
-Upstream-Status: Inappropriate[oe specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/Makefile.am | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index dc0922f..6cbc35d 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -1,16 +1,12 @@
- AM_CPPFLAGS = -I$(top_srcdir)/src -I$(top_srcdir)/include -I$(top_builddir)/src
- LDADD = ../src/libssh2.la
- 
--if SSHD
- noinst_PROGRAMS = ssh2
- ssh2_SOURCES = ssh2.c
--endif
- 
- ctests = simple$(EXEEXT)
- TESTS = $(ctests) mansyntax.sh
--if SSHD
- TESTS += ssh2.sh
--endif
- check_PROGRAMS = $(ctests)
- 
- TESTS_ENVIRONMENT = SSHD=$(SSHD) EXEEXT=$(EXEEXT)
-@@ -38,4 +34,4 @@ if OPENSSL
- # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_encrypted_ed25519_key.c
- # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_ed25519_key_from_mem.c
- EXTRA_DIST += test_public_key_auth_succeeds_with_correct_rsa_openssh_key.c
--endif
-\ No newline at end of file
-+endif
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch b/meta-oe/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
deleted file mode 100644
index 1128c7ea0..000000000
--- a/meta-oe/recipes-support/libssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From efe7101786193eaddb749c0583af6b54aec6f289 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 2 Feb 2021 18:45:16 -0800
-Subject: [PATCH] configure: Conditionally undefine backend m4 macro
-
-Unlike the M4 builtin, this macro fails if macro is not defined
-therefore recover the behavior of the builtin.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index fe5054a..758f8c2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -127,7 +127,7 @@ fi
- m4_set_foreach([crypto_backends], [backend],
-   [AM_CONDITIONAL(m4_toupper(backend), test "$found_crypto" = "backend")]
- )
--m4_undefine([backend])
-+m4_ifdef([backend], [m4_undefine([backend])])
- 
- 
- # libz
--- 
-2.30.0
-
diff --git a/meta-oe/recipes-support/libssh2/files/CVE-2019-17498.patch b/meta-oe/recipes-support/libssh2/files/CVE-2019-17498.patch
deleted file mode 100644
index 001080072..000000000
--- a/meta-oe/recipes-support/libssh2/files/CVE-2019-17498.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-From dedcbd106f8e52d5586b0205bc7677e4c9868f9c Mon Sep 17 00:00:00 2001
-From: Will Cosgrove <will@panic.com>
-Date: Fri, 30 Aug 2019 09:57:38 -0700
-Subject: [PATCH] packet.c: improve message parsing (#402)
-
-* packet.c: improve parsing of packets
-
-file: packet.c
-
-notes:
-Use _libssh2_get_string API in SSH_MSG_DEBUG/SSH_MSG_DISCONNECT. Additional uint32 bounds check in SSH_MSG_GLOBAL_REQUEST.
-
-Upstream-Status: Backport
-CVE: CVE-2019-17498
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- src/packet.c | 68 ++++++++++++++++++++++------------------------------
- 1 file changed, 29 insertions(+), 39 deletions(-)
-
-diff --git a/src/packet.c b/src/packet.c
-index 38ab629..2e01bfc 100644
---- a/src/packet.c
-+++ b/src/packet.c
-@@ -419,8 +419,8 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
-                     size_t datalen, int macstate)
- {
-     int rc = 0;
--    char *message = NULL;
--    char *language = NULL;
-+    unsigned char *message = NULL;
-+    unsigned char *language = NULL;
-     size_t message_len = 0;
-     size_t language_len = 0;
-     LIBSSH2_CHANNEL *channelp = NULL;
-@@ -472,33 +472,23 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
- 
-         case SSH_MSG_DISCONNECT:
-             if(datalen >= 5) {
--                size_t reason = _libssh2_ntohu32(data + 1);
-+                uint32_t reason = 0;
-+                struct string_buf buf;
-+                buf.data = (unsigned char *)data;
-+                buf.dataptr = buf.data;
-+                buf.len = datalen;
-+                buf.dataptr++; /* advance past type */
- 
--                if(datalen >= 9) {
--                    message_len = _libssh2_ntohu32(data + 5);
-+                _libssh2_get_u32(&buf, &reason);
-+                _libssh2_get_string(&buf, &message, &message_len);
-+                _libssh2_get_string(&buf, &language, &language_len);
- 
--                    if(message_len < datalen-13) {
--                        /* 9 = packet_type(1) + reason(4) + message_len(4) */
--                        message = (char *) data + 9;
--
--                        language_len =
--                            _libssh2_ntohu32(data + 9 + message_len);
--                        language = (char *) data + 9 + message_len + 4;
--
--                        if(language_len > (datalen-13-message_len)) {
--                            /* bad input, clear info */
--                            language = message = NULL;
--                            language_len = message_len = 0;
--                        }
--                    }
--                    else
--                        /* bad size, clear it */
--                        message_len = 0;
--                }
-                 if(session->ssh_msg_disconnect) {
--                    LIBSSH2_DISCONNECT(session, reason, message,
--                                       message_len, language, language_len);
-+                    LIBSSH2_DISCONNECT(session, reason, (const char *)message,
-+                                       message_len, (const char *)language,
-+                                       language_len);
-                 }
-+
-                 _libssh2_debug(session, LIBSSH2_TRACE_TRANS,
-                                "Disconnect(%d): %s(%s)", reason,
-                                message, language);
-@@ -539,24 +529,24 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
-                 int always_display = data[1];
- 
-                 if(datalen >= 6) {
--                    message_len = _libssh2_ntohu32(data + 2);
--
--                    if(message_len <= (datalen - 10)) {
--                        /* 6 = packet_type(1) + display(1) + message_len(4) */
--                        message = (char *) data + 6;
--                        language_len = _libssh2_ntohu32(data + 6 +
--                                                        message_len);
--
--                        if(language_len <= (datalen - 10 - message_len))
--                            language = (char *) data + 10 + message_len;
--                    }
-+                    struct string_buf buf;
-+                    buf.data = (unsigned char *)data;
-+                    buf.dataptr = buf.data;
-+                    buf.len = datalen;
-+                    buf.dataptr += 2; /* advance past type & always display */
-+
-+                    _libssh2_get_string(&buf, &message, &message_len);
-+                    _libssh2_get_string(&buf, &language, &language_len);
-                 }
- 
-                 if(session->ssh_msg_debug) {
--                    LIBSSH2_DEBUG(session, always_display, message,
--                                  message_len, language, language_len);
-+                    LIBSSH2_DEBUG(session, always_display,
-+                                  (const char *)message,
-+                                  message_len, (const char *)language,
-+                                  language_len);
-                 }
-             }
-+
-             /*
-              * _libssh2_debug will actually truncate this for us so
-              * that it's not an inordinate about of data
-@@ -579,7 +569,7 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
-                 uint32_t len = 0;
-                 unsigned char want_reply = 0;
-                 len = _libssh2_ntohu32(data + 1);
--                if(datalen >= (6 + len)) {
-+                if((len <= (UINT_MAX - 6)) && (datalen >= (6 + len))) {
-                     want_reply = data[5 + len];
-                     _libssh2_debug(session,
-                                    LIBSSH2_TRACE_CONN,
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/libssh2/files/run-ptest b/meta-oe/recipes-support/libssh2/files/run-ptest
deleted file mode 100644
index 5fd7ec65f..000000000
--- a/meta-oe/recipes-support/libssh2/files/run-ptest
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-ptestdir=$(dirname "$(readlink -f "$0")")
-cd tests
-for test in simple ssh2.sh mansyntax.sh
-do
-	./../test-driver --test-name $test --log-file ../$test.log --trs-file ../$test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./$test
-done
diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb b/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
deleted file mode 100644
index 0b8ccbd21..000000000
--- a/meta-oe/recipes-support/libssh2/libssh2_1.9.0.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "A client-side C library implementing the SSH2 protocol"
-HOMEPAGE = "http://www.libssh2.org/"
-SECTION = "libs"
-
-DEPENDS = "zlib"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c5cf34fc0acb44b082ef50ef5e4354ca"
-
-SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
-           file://CVE-2019-17498.patch \
-           file://0001-configure-Conditionally-undefine-backend-m4-macro.patch \
-           file://run-ptest \
-"
-
-SRC_URI_append_ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
-
-SRC_URI[md5sum] = "1beefafe8963982adc84b408b2959927"
-SRC_URI[sha256sum] = "d5fb8bd563305fd1074dda90bd053fb2d29fc4bce048d182f96eaa466dfadafd"
-
-inherit autotools pkgconfig ptest
-
-EXTRA_OECONF += "\
-                 --with-libz \
-                 --with-libz-prefix=${STAGING_LIBDIR} \
-                "
-
-# only one of openssl and gcrypt could be set
-PACKAGECONFIG ??= "openssl"
-PACKAGECONFIG[openssl] = "--with-crypto=openssl --with-libssl-prefix=${STAGING_LIBDIR}, , openssl"
-PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGING_EXECPREFIXDIR}, , libgcrypt"
-
-BBCLASSEXTEND = "native nativesdk"
-
-# required for ptest on documentation
-RDEPENDS_${PN}-ptest = "man-db openssh"
-RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-en-us"
-
-do_compile_ptest() {
-	sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" tests/Makefile
-	oe_runmake check
-}
-
-do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
-	cp -rf ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/tests/mansyntax.sh  ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/tests/ssh2.sh  ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/tests/etc ${D}${PTEST_PATH}/tests/
-	mkdir -p ${D}${PTEST_PATH}/docs
-	cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
-}
-- 
2.27.0

