Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web08.250.1617899795362379948
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O9ZxVtQK;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id s1-20020a4ac1010000b02901cfd9170ce2so643231oop.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GT4pquRryLo3hIKC7x7xE3id7Fcn39nw91eSEQyNPEM=;
        b=O9ZxVtQKUy2Iv2tluCO4k9qHyJAkdYy2WGVBbcacD1cwfF/K7p/DpYnsPLyNBRcyeu
         FT+n5t0wdpWhhSNwRct0xsVbnGXCcmqoMjJKxGBz8HFPYIrlz+gM8q/d5mIkGFi61FoO
         bZ4JyKuUyXPE7V2v29SK8arMeDv+zSddUMR5gcY01iCi0tR5b85IGdVKP0VP9QiG58Ak
         NqQdj/l7rOWFChIX9qBk46fnUllvr2/k4fXyRJC/ABZG1L0hmxjXxzqDGn3/22McJKsA
         UQadBViSVsGNfUyZ4IfWG2dmOQYfMoNcps1EsidopttnPiprrrZC+9jCtskCye8a2xJj
         CFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GT4pquRryLo3hIKC7x7xE3id7Fcn39nw91eSEQyNPEM=;
        b=VT9EYwMO/IqCAYn2LKB0N5i8HyfvEksm2OHldG9x/Q72hkuIsAIdy6k68GU8T6cWLE
         5tluxZTEgayDb93pv1cih1h8Arg/zf8M4ZLJ0GdFAilir5xxWtEiYqQlkR1incI9Z8RJ
         B4RsvZHP+OpHSrL+jZcsHV9TP8khVoAsojuoPoCqAufT2XOV4rbmu2ANrFrzUrrhXbgW
         fIdB9eacr7mUOh30YodRW6Nt9YxyOJA91yHPUG783wgtVMsYSCSKFXhZ9Hhs03JKHS5f
         erJKqzWgBqMvjsBhQklKf1z+XZ4Kb/JEpxo0Y+P6Pjo9HAzwGx4wDRCcqrNyWW0RTxqY
         ag7A==
X-Gm-Message-State: AOAM531K0EGepCzSRTyHSjvpPMMBMR29ZTXJ7Gh2F4WpdEWKLDbm5Vrb
	RmEuD/CM163xdc08ura4lRs0SjtfNVg=
X-Google-Smtp-Source: ABdhPJz/mUS7YQU1hzLyNMnlQTghteKCHX57/jZZd3WwCGQ3hlcHM0LZvpIAVtjD329zagP/aCFI4g==
X-Received: by 2002:a4a:6758:: with SMTP id j24mr8211816oof.84.1617899794489;
        Thu, 08 Apr 2021 09:36:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:33 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 23/64] rsyslog: fix some of the ptests
Date: Thu,  8 Apr 2021 09:35:30 -0700
Message-Id: <872701edb641379d700d1d13650b750c29758c17.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Yi Fan Yu <yifan.yu@windriver.com>

Run test as non-root 'tester'.
Add more rdepends for ptest.

Introduce a patch to skip checking for a libc header:
    sys/inotify

Python scripts no longer called with ./script.
Remove the need to add the correct shebang.
Ptest results:

    8.2102.0
===============
TOTAL: 424
PASS:  417
SKIP:  5
XFAIL: 0
FAIL:  2
XPASS: 0
ERROR: 0

Remaining failure related to relp:
* imrelp-tls-cfgcmd
* sndrcv_relp_tls-cfgcmd

the test expects an error "relp connect failed with return 10031",
but the connection seems to be established and working.

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9dda6b9608f3d8a06806b595a909d44bc00c377b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-tests-disable-the-check-for-inotify.patch | 46 +++++++++++++++++++
 .../rsyslog/rsyslog/run-ptest                 |  6 ++-
 .../rsyslog/rsyslog_8.2102.0.bb               | 15 +++---
 3 files changed, 60 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
new file mode 100644
index 00000000000..552172d3974
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
@@ -0,0 +1,46 @@
+From 194e199ce08acc2192f6a63420ff24d9064666e5 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Sat, 27 Mar 2021 19:18:25 -0400
+Subject: [PATCH] tests: disable the check for inotify
+
+We don't need to check inotify.h.
+Assume it is present since it is part of the linux kernel
+since 2.6.13 [1].
+
+[1](https://kernelnewbies.org/Linux_2_6_13)
+
+(it would require installing the libc headers otherwise,
+ for the test  to detect /usr/include/sys/inotify.h.)
+
+Upstream-Status: Inappropriate[OE-specific]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ tests/diag.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/diag.sh b/tests/diag.sh
+index 6cd60ea88..7424f48c5 100755
+--- a/tests/diag.sh
++++ b/tests/diag.sh
+@@ -2672,7 +2672,7 @@ case $1 in
+ 		fi
+ 		;;
+ 	'check-inotify') # Check for inotify/fen support 
+-		if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
++		if true; then
+ 			echo [inotify mode]
+ 		elif [ -n "$(find /usr/include/sys/ -name 'port.h' -print -quit)" ]; then
+ 			grep -qF "PORT_SOURCE_FILE" < /usr/include/sys/port.h
+@@ -2687,7 +2687,7 @@ case $1 in
+ 		fi
+ 		;;
+ 	'check-inotify-only') # Check for ONLY inotify support 
+-		if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
++		if true; then
+ 			echo [inotify mode]
+ 		else
+ 			echo [inotify not supported, skipping...]
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
index aa698d85ce1..efa9ba3ed01 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
@@ -5,4 +5,8 @@ set -o pipefail
 
 SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
 cd ${SCRIPTPATH}
-make -C tests -k check-TESTS
+useradd tester  || echo "user already exists"
+ln -sf /usr/sbin/logrotate /usr/bin/logrotate
+su tester -c "make -C tests -k check-TESTS"
+userdel tester
+rm -f /usr/bin/logrotate
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
index 22059d1407b..921124024cb 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2102.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://www.rsyslog.com/download/files/download/rsyslog/${BPN}-${PV}.t
            file://rsyslog.service \
            file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
+           file://0001-tests-disable-the-check-for-inotify.patch \
 "
 
 SRC_URI_append_libc-musl = " \
@@ -80,11 +81,6 @@ PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
 PACKAGECONFIG[valgrind] = ",--without-valgrind-testbench,valgrind,"
 PACKAGECONFIG[imhttp] = "--enable-imhttp,--disable-imhttp,civetweb,"
 
-do_configure_prepend() {
-    sed -i -e 's|python |python3 |g' ${S}/tests/*.sh
-    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/tests/*.py
-    sed -i -e 's|/usr/bin/env python|/usr/bin/env python3|g' ${S}/tests/testsuites/*.py
-}
 
 TESTDIR = "tests"
 do_compile_ptest() {
@@ -97,6 +93,10 @@ do_install_ptest() {
     cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}
     cp -rf ${B}/${TESTDIR} ${D}${PTEST_PATH}
 
+    # give permissions to all users
+    # some tests need to write to this directory as user 'daemon'
+    chmod 777 -R ${D}${PTEST_PATH}/tests
+
     # do NOT need to rebuild Makefile itself
     sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
     # do NOT need to rebuild $(check_PROGRAMS)
@@ -195,8 +195,11 @@ VALGRIND_libc-musl_powerpc64le = ''
 VALGRIND_riscv64 = ""
 VALGRIND_riscv32 = ""
 
+# util-linux: logger needs the -d option
 RDEPENDS_${PN}-ptest += "\
   make diffutils gzip bash gawk coreutils procps \
-  libgcc python3-core python3-io \
+  libgcc python3-core python3-io python3-json \
+  curl util-linux shadow \
   "
+
 RRECOMMENDS_${PN}-ptest += "${TCLIBC}-dbg ${VALGRIND}"
-- 
2.17.1

