Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCC6D111A5
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 20:49:41 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3858.1764190177179952428
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 12:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kUrHgq67;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-298039e00c2so2458465ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 12:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764190176; x=1764794976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCdz+m9nF96UsW/2sXt0XVHxIfvHoRCpX2LPR/11og0=;
        b=kUrHgq67148k1L6NfFv39b9CDXn1krc2PtB+BOmUomvlpkav6pypjcxcRm2VNZ6LjY
         9eL7zmYy8Rm9mkqql0jbm2DxRUp9v1powX8888lF8I3jky7ZTQj6qJOr+w3S9WPFkXih
         xvNR2MvP9D1SMfJih26kali6J3SocSc+z60CWiw3EAerWIY7Uv0Ij122D5xn+XP55aA9
         HK7JiOWJyaYngSCsQPBOlBEhNXHvlu12LoB9nyn4r+ADuaCPUueYvqGzLhzyUvVP6EVU
         bZWpXxZcZGqeanu/Ic//iBonSbiyfQltRcWZ36KeLvJtYqm0OwpFT9h6RRsRXaXMeDtf
         AKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764190176; x=1764794976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCdz+m9nF96UsW/2sXt0XVHxIfvHoRCpX2LPR/11og0=;
        b=mx5P3bwvFS13GgJsVdJMh/UWsGDYwUBmdB06xaW9I30PzNFXRXG/aF2Czym1QjDCdn
         7IohIYIJ7CPFAvYDXHKCnsenOSASauW7y/C8hJDMPUs29jrmE/pgP6ZfpJ8OIYWDPIDH
         8eukAEh3tVM3X7CeYuznRLfZdWHZt4rKVnkn8SFN/3FZodfousm2X6lgJJWg2YZ4qRE3
         gSDWK7nzgHcRcAlyQ8A2znWh2jhpwbQQ5p4BpIYj0YeZpw6bjTRweeDKu4ITOHfNcDwt
         PSYgR+yEBdUa1ujBZsUrlFW4mw8H/0jXqQPqHbP1L7E+Q+LTFKybTLu8tQlPhnn6kkQW
         PvOw==
X-Gm-Message-State: AOJu0YyQsVrPHomECH/WbS6bTdEbZYPuax58U7eez8PjRFQBe2jO9GsH
	1b5FEKRaBM+WXQuyL63ZVD3oKQdIUDr/rm66e9hH3DT2IwavOyisuM/VcMpaYw==
X-Gm-Gg: ASbGncsd2vR/BIOhDvK/dZOQyHFZKssQl8yMX9h2FqrTW38hwbYQ2AA3ACNZxMi5C71
	SMxKemTqoDOeRsEu66CeO6GeHq7yNz+tbEuo+4yP82z8p2cZdlOncs6/sGcRzw21v5EpAe4JeEr
	XWGwonPoNsBdxmMMzyaFtTzAWx9TeaL1GldSV3TeS2W5FUItaewF1EuYWCsP4VG05zroOJ1s4y1
	mvEtIinEJ/gnTJ5XxgpRsI7UZlxhp6GuTIQUqsu+3+8kL0sf50UHnO02OWpoKX3GzfcwZewt3RM
	+V2F7EGlm6QH6+zThWgIonT0D/jbnOQP3lvsb51+LImt1+wnQtkZSeYV3jnjuiIitv+8lho53wn
	s47wzvt0IWtKZzU/62IrWQGJp8zyfQkWsehaZeP28Ub2u9a+2odt1Eekc5aneQgHvVMel+mNwW1
	CLHMUp+hnltzGokmYvtArHQTc=
X-Google-Smtp-Source: AGHT+IFUOJo6UdIb4b1XXyjaTctdLodbKa+YiQUYoliVuYo/NJ8yjEgcXGygHogi2c1FTX7INePrkg==
X-Received: by 2002:a17:903:1b47:b0:295:8662:6a4e with SMTP id d9443c01a7336-29b6bf5c8d5mr245726995ad.47.1764190176348;
        Wed, 26 Nov 2025 12:49:36 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b111016sm202443635ad.6.2025.11.26.12.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 12:49:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][whinlatter][PATCH 9/9] rsyslog: upgrade 8.2506.0 -> 8.2510.0
Date: Thu, 27 Nov 2025 09:48:46 +1300
Message-ID: <20251126204847.1969339-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
References: <20251126204847.1969339-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 20:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122091

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Full Changelog:
   https://github.com/rsyslog/rsyslog/blob/v8-stable/ChangeLog

Avoid buildpath error:
   QA Issue: File /usr/lib/rsyslog/ptest/tests/.deps/liboverride_getaddrinfo_la-override_getaddrinfo.Plo
These .deps directories are created at configure time and mainly used
in an interactive development environment. Remove test/.deps to eliminate
the error.

Drop: use-pkgconfig-to-check-libgcrypt.patch
since it's implemented upstream by:
   85e03c0e8 Replace libgcrypt-config with pkg-config
   8ba35bf6c Add missing libraries to pkg-config call
as per: https://github.com/rsyslog/rsyslog/pull/5406/commits

For musl, drop: 0001-Include-sys-time-h.patch
which oddly doesn't seem to be required to build any of: qemux86-64, qemuarm64,
and qemuarm.

Rebase other patches as needed.

ptest results for qemux86-64/kvm with extra FS space and 2 GB RAM:

   Version | Total | Passed | Failed | Skipped
   8.2506  |   485 |    479 |      0 |       6
   8.2510  |   497 |    491 |      0 |       6

rsyslog works when built with musl but there are lots of ptest failures:

   Version | Total | Passed | Failed | Skipped
   8.2506  |   485 |    306 |    172 |       7
   8.2510  |   497 |    310 |    180 |       7

Note that with this update the results are similarily bad. If someone is
interested and has time, they can work on improving the musl ptest results.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e730ee0c603df293ebe9218b8b9d79f8e617dd87)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../rsyslog/0001-Include-sys-time-h.patch     | 32 --------------
 ...-tests-disable-the-check-for-inotify.patch |  8 ++--
 ...-Pass-correct-parameter-type-to-send.patch | 18 ++++----
 .../use-pkgconfig-to-check-libgcrypt.patch    | 42 -------------------
 ...syslog_8.2506.0.bb => rsyslog_8.2510.0.bb} |  6 +--
 5 files changed, 16 insertions(+), 90 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
 delete mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2506.0.bb => rsyslog_8.2510.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
deleted file mode 100644
index 6ce8b7a9c8..0000000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-Include-sys-time-h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7baf35b88d742032a2dc456c396843e17e866f8e Mon Sep 17 00:00:00 2001
-From: Ming Liu <peter.x.liu@external.atlascopco.com>
-Date: Wed, 27 Jun 2018 14:04:57 +0800
-Subject: [PATCH] Include sys/time.h
-
-struct timeval is defined in sys/time.h with a musl libc.
-
-Upstream-Status: Inappropriate [musl libc specific]
-
-Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/msleep.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/tests/msleep.c b/tests/msleep.c
-index 98dbece..96f6950 100644
---- a/tests/msleep.c
-+++ b/tests/msleep.c
-@@ -26,11 +26,7 @@
- #include "config.h"
- #include <stdio.h>
- #include <stdlib.h>
--#if defined(__FreeBSD__)
- #include <sys/time.h>
--#else
--#include <time.h>
--#endif
- #if defined(HAVE_SYS_SELECT_H)
- #include <sys/select.h>
- #endif
-2.7.4
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
index a506b7a6dc..728cdace0c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-disable-the-check-for-inotify.patch
@@ -23,19 +23,19 @@ diff --git a/tests/diag.sh b/tests/diag.sh
 index a9c2a75..0b017c5 100755
 --- a/tests/diag.sh
 +++ b/tests/diag.sh
-@@ -2979,7 +2979,7 @@ case $1 in
+@@ -3683,7 +3683,7 @@
  		fi
  		;;
- 	'check-inotify') # Check for inotify/fen support 
+ 	'check-inotify') # Check for inotify/fen support
 -		if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
 +		if true; then
  			echo [inotify mode]
  		elif [ -n "$(find /usr/include/sys/ -name 'port.h' -print -quit)" ]; then
  			grep -qF "PORT_SOURCE_FILE" < /usr/include/sys/port.h
-@@ -2994,7 +2994,7 @@ case $1 in
+@@ -3698,7 +3698,7 @@
  		fi
  		;;
- 	'check-inotify-only') # Check for ONLY inotify support 
+ 	'check-inotify-only') # Check for ONLY inotify support
 -		if [ -n "$(find /usr/include -name 'inotify.h' -print -quit)" ]; then
 +		if true; then
  			echo [inotify mode]
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
index 884086bfc3..76749877b6 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch
@@ -21,12 +21,12 @@ diff --git a/tests/tcpflood.c b/tests/tcpflood.c
 index 5e6f13a..09cedbb 100644
 --- a/tests/tcpflood.c
 +++ b/tests/tcpflood.c
-@@ -836,7 +836,7 @@ int sendMessages(struct instdata *inst)
- 			}
- 			lenSend = sendPlainTCP(socknum, buf, lenBuf, &error_number);
- 		} else if(transport == TP_UDP) {
--			lenSend = sendto(udpsockout, buf, lenBuf, 0, &udpRcvr, sizeof(udpRcvr));
-+			lenSend = sendto(udpsockout, buf, lenBuf, 0, (const struct sockaddr *)&udpRcvr, sizeof(udpRcvr));
- 			error_number = errno;
- 		} else if(transport == TP_TLS) {
- 			if(sockArray[socknum] == -1) {
+@@ -865,7 +865,7 @@
+             }
+             lenSend = sendPlainTCP(socknum, buf, lenBuf, &error_number);
+         } else if (transport == TP_UDP) {
+-            lenSend = sendto(udpsockout, buf, lenBuf, 0, &udpRcvr, sizeof(udpRcvr));
++            lenSend = sendto(udpsockout, buf, lenBuf, 0, (const struct sockaddr *)&udpRcvr, sizeof(udpRcvr));
+             error_number = errno;
+         } else if (transport == TP_TLS) {
+             if (sockArray[socknum] == -1) {
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
deleted file mode 100644
index f5ae65fb58..0000000000
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/use-pkgconfig-to-check-libgcrypt.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d2dd13d930c91e45417c7361908f0af75e0e6c00 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Wed, 18 Jun 2014 13:46:52 +0800
-Subject: [PATCH] use pkgconfig to check libgcrypt
-
-Upstream-Status: Inappropriate [configuration]
-
-libgcrypt does no longer provide libgcrypt-config, and provide
-*.pc, so we should use pkgconfig to check
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- configure.ac | 15 +--------------
- 1 file changed, 1 insertion(+), 14 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index f8c0ac8..794bfb3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1217,20 +1217,7 @@ AC_ARG_ENABLE(libgcrypt,
-         [enable_libgcrypt=yes]
- )
- if test "x$enable_libgcrypt" = "xyes"; then
--	AC_PATH_PROG([LIBGCRYPT_CONFIG],[libgcrypt-config],[no])
--        if test "x${LIBGCRYPT_CONFIG}" = "xno"; then
--           AC_MSG_FAILURE([libgcrypt-config not found in PATH])
--        fi
--        AC_CHECK_LIB(
--		[gcrypt],
--        	[gcry_cipher_open],
--        	[LIBGCRYPT_CFLAGS="`${LIBGCRYPT_CONFIG} --cflags`"
--        	LIBGCRYPT_LIBS="`${LIBGCRYPT_CONFIG} --libs`"
--        	],
--        	[AC_MSG_FAILURE([libgcrypt is missing])],
--        	[`${LIBGCRYPT_CONFIG} --libs --cflags`]
--        	)
--	AC_DEFINE([ENABLE_LIBGCRYPT], [1], [Indicator that LIBGCRYPT is present])
-+	PKG_CHECK_MODULES(LIBGCRYPT, libgcrypt)
- fi
- AM_CONDITIONAL(ENABLE_LIBGCRYPT, test x$enable_libgcrypt = xyes)
- AM_CONDITIONAL(ENABLE_RSCRYUTIL, test x$enable_libgcrypt = xyes || test x$enable_openssl_crypto_provider = xyes)
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2510.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2510.0.bb
index bcac76a231..c92c11d8f3 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2506.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2510.0.bb
@@ -22,17 +22,15 @@ SRC_URI = "https://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://rsyslog.conf \
            file://rsyslog.logrotate \
            file://rsyslog.service \
-           file://use-pkgconfig-to-check-libgcrypt.patch \
            file://run-ptest \
            file://0001-tests-disable-the-check-for-inotify.patch \
            file://0001-tests-tcpflood.c-Pass-correct-parameter-type-to-send.patch \
 "
 
 SRC_URI:append:libc-musl = " \
-    file://0001-Include-sys-time-h.patch \
     file://disable-omfile-outchannel.patch \
 "
-SRC_URI[sha256sum] = "6d6fd0257c95e756765d4d585a833d54dd3a0e5eeb8308b862a81b368a74bb7b"
+SRC_URI[sha256sum] = "a70a9834186859539a6a4d1c7b3f68c23897e805829b764a45e92cb0cc95e66a"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -92,6 +90,8 @@ TESTDIR = "tests"
 do_compile_ptest() {
     echo 'buildtest-TESTS: $(check_PROGRAMS)' >> ${TESTDIR}/Makefile
     oe_runmake -C ${TESTDIR} buildtest-TESTS
+    # buildpaths: remove .deps/*, an unneeded compile dependency automake artifact.
+    rm -rf ${B}/${TESTDIR}/.deps
 }
 
 do_install_ptest() {

