Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E99FC54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 16:28:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.78187.1674750518273664141
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 08:28:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HY4YR9Vw;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id j17so1535083wms.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 08:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxw7yq8wiQp2svvgdqCxy9fCM66gdWFtvixzGIkq8MM=;
        b=HY4YR9VwYkoorLyq4WHj5Z9db7Fg50hStkv/PhtSFi93WIM1SJWh5/i9ZnWdmRiifB
         xGHlCifJ92PdrYTbiQt3QcdXRaikxhwOBR7SO1spkAFj+3CldGJ2HMG008ZqfmB9tBLh
         dPthjPuOrRV48DBuCigfRsbUJTEG3981CLN4Kf+rAQT9u69QtFN/8fedkoK1+B3FhSTu
         lmHEQNStMAqSBKL4vTw7bQwGj+lfP7F1sLS3taQg17ECl62G7bZSxhUhZpgoUhudaQ4r
         MDN6w9Tuh9BdGwk9mUe3TQ1lQw92zmpZl+/FtcJ3EMnwRvgxVNOwIyizNBa8388QREeF
         tbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxw7yq8wiQp2svvgdqCxy9fCM66gdWFtvixzGIkq8MM=;
        b=3LFjQcm36o15TD3XQst8k5ZgHJVV+6Yg4o51Oxo0HLwDIlXkeJ1CudQ33Nz3z+fBet
         kF7whRwtj84oxeuXOhS5UfXJE9MZdJ8+N70PfcVIWtaKNn01HLTZhYu36zu3xPCzwp5a
         VFQrEMtsivABS1vl9HoZs2CxT51nq0dPlcThaP9GJ1YTej814nGXhutkD058rOEkRh5t
         8iKhrZQY9jbL4wYN5vbIJShV4bZuBRJA2noZJ/vipfOffzyldGEUqsV+04RFejxRovnR
         2T4tjRPAzCfC1OR+Tt0E2pZrkdkODqAf0csJnT92I9K/b2dnVwupedIMKo78xpzSD+wx
         65rg==
X-Gm-Message-State: AFqh2krdjM6mS1ykv3TavD981rbK3Vce10qTObDw+q/6n2JC0lXbAgV9
	b3cUXAFM5qAHig9Vli77NaqVNELVJ9M=
X-Google-Smtp-Source: AMrXdXvW14PB325mwgCqnEf+P9tsitnBapaOkznsKijhKBBKYHDSrIZ+KduwzoF9GB1mh92iLCXbTg==
X-Received: by 2002:a05:600c:511f:b0:3da:f97b:2ab0 with SMTP id o31-20020a05600c511f00b003daf97b2ab0mr37444904wms.14.1674750516309;
        Thu, 26 Jan 2023 08:28:36 -0800 (PST)
Received: from localhost.localdomain ([5.148.102.211])
        by smtp.gmail.com with ESMTPSA id b5-20020a05600c150500b003dafb0c8dfbsm2155432wmg.14.2023.01.26.08.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 08:28:35 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] keyutils: Upgrade 1.6.1 -> 1.6.3
Date: Thu, 26 Jan 2023 16:28:24 +0000
Message-Id: <20230126162824.10848-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 16:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100796

Move SRC_URI to git as there's no tarball for 1.6.3. Fix failing tests
when busybox is providing `head`. Pull in reproducibility fix from Arch
Linux. Remove autoconf inherit as this is a simple Makefile package. Add
manpages support via inherit so man-db is updated. Add missing ptest
dependencies.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...re-to-the-SOURCE_DATE_EPOCH-standard.patch | 30 +++++++++
 ...in_trusted-Failure-command-is-failed.patch | 27 ++++++++
 ...c.sh-update-regex-for-getting-endian.patch | 14 ++--
 ...se-head-n1-for-busybox-compatibility.patch | 64 +++++++++++++++++++
 .../{keyutils_1.6.1.bb => keyutils_1.6.3.bb}  | 17 +++--
 5 files changed, 139 insertions(+), 13 deletions(-)
 create mode 100644 meta-oe/recipes-security/keyutils/files/0001-Adhere-to-the-SOURCE_DATE_EPOCH-standard.patch
 create mode 100644 meta-oe/recipes-security/keyutils/files/0001-tests-builtin_trusted-Failure-command-is-failed.patch
 create mode 100644 meta-oe/recipes-security/keyutils/files/0002-tests-Use-head-n1-for-busybox-compatibility.patch
 rename meta-oe/recipes-security/keyutils/{keyutils_1.6.1.bb => keyutils_1.6.3.bb} (74%)

diff --git a/meta-oe/recipes-security/keyutils/files/0001-Adhere-to-the-SOURCE_DATE_EPOCH-standard.patch b/meta-oe/recipes-security/keyutils/files/0001-Adhere-to-the-SOURCE_DATE_EPOCH-standard.patch
new file mode 100644
index 000000000000..8984e6502fbb
--- /dev/null
+++ b/meta-oe/recipes-security/keyutils/files/0001-Adhere-to-the-SOURCE_DATE_EPOCH-standard.patch
@@ -0,0 +1,30 @@
+From 3f7f70c746277e1a89978166533374a8b9bd5407 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Wed, 25 Jan 2023 17:05:25 +0000
+Subject: [PATCH] Adhere to the SOURCE_DATE_EPOCH standard
+
+Adhere to the SOURCE_DATE_EPOCH standard and use it's date when set
+otherwise fall back to the default behaviour.
+
+Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 599b1452a05a..7776b0f0d63d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -109,7 +109,7 @@ all: keyctl request-key key.dns_resolver cxx
+ ###############################################################################
+ #RPATH = -Wl,-rpath,$(LIBDIR)
+ 
+-VCPPFLAGS	:= -DPKGBUILD="\"$(shell date -u +%F)\""
++VCPPFLAGS	:= -DPKGBUILD="\"$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%F)\""
+ VCPPFLAGS	+= -DPKGVERSION="\"keyutils-$(VERSION)\""
+ VCPPFLAGS	+= -DAPIVERSION="\"libkeyutils-$(APIVERSION)\""
+ 
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-security/keyutils/files/0001-tests-builtin_trusted-Failure-command-is-failed.patch b/meta-oe/recipes-security/keyutils/files/0001-tests-builtin_trusted-Failure-command-is-failed.patch
new file mode 100644
index 000000000000..b78d7f7f28ae
--- /dev/null
+++ b/meta-oe/recipes-security/keyutils/files/0001-tests-builtin_trusted-Failure-command-is-failed.patch
@@ -0,0 +1,27 @@
+From 714542f009860e1652bc06d05ab939290374a114 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Thu, 26 Jan 2023 08:27:12 +0000
+Subject: [PATCH 1/2] tests: builtin_trusted: Failure command is `failed`
+
+Upstream-Status: Pending
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ tests/features/builtin_trusted/runtest.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/features/builtin_trusted/runtest.sh b/tests/features/builtin_trusted/runtest.sh
+index 27910b5fa8e7..437f5ad1d6b2 100644
+--- a/tests/features/builtin_trusted/runtest.sh
++++ b/tests/features/builtin_trusted/runtest.sh
+@@ -24,7 +24,7 @@ id_key --to=blk %:.blacklist
+ # There should be at least one built-in trusted key for module signing.
+ list_keyring $btk
+ expect_keyring_rlist bkeys
+-if [ `echo $bkeys | wc -w` = 0 ]; then fail; fi
++if [ `echo $bkeys | wc -w` = 0 ]; then failed; fi
+ 
+ # Check we can't add random keys to those keyrings
+ marker "TRY ADDING USER KEYS"
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch b/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch
index 728f46433186..769118e422de 100644
--- a/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch
+++ b/meta-oe/recipes-security/keyutils/files/0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch
@@ -1,4 +1,4 @@
-From 935a31dd6f14bd1aff735495f0fdbae4ca05c695 Mon Sep 17 00:00:00 2001
+From b84ecc2e3e56a25a3efd56c8942ad6bab3ff9ba1 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Fri, 2 Dec 2022 15:35:40 +0800
 Subject: [PATCH] tests/toolbox.inc.sh: update regex for getting endian
@@ -14,22 +14,22 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
-index 1964450..e827e20 100644
+index 8bf0db6f6d87..7ea2f253ba7d 100644
 --- a/tests/toolbox.inc.sh
 +++ b/tests/toolbox.inc.sh
 @@ -13,10 +13,10 @@
  echo === $OUTPUTFILE ===
  
  endian=`file -L /proc/$$/exe`
--if expr "$endian" : '.* MSB \+\(executable\|shared object\).*' >&/dev/null
-+if expr "$endian" : '.* MSB .*\(executable\|shared object\).*' >&/dev/null
+-if expr "$endian" : '.* MSB \+\(pie executable\|executable\|shared object\).*' >&/dev/null
++if expr "$endian" : '.* MSB .*\(pie executable\|executable\|shared object\).*' >&/dev/null
  then
      endian=BE
--elif expr "$endian" : '.* LSB \+\(executable\|shared object\).*' >&/dev/null
-+elif expr "$endian" : '.* LSB .*\(executable\|shared object\).*' >&/dev/null
+-elif expr "$endian" : '.* LSB \+\(pie executable\|executable\|shared object\).*' >&/dev/null
++elif expr "$endian" : '.* LSB .*\(pie executable\|executable\|shared object\).*' >&/dev/null
  then
      endian=LE
  else
 -- 
-2.25.1
+2.39.0
 
diff --git a/meta-oe/recipes-security/keyutils/files/0002-tests-Use-head-n1-for-busybox-compatibility.patch b/meta-oe/recipes-security/keyutils/files/0002-tests-Use-head-n1-for-busybox-compatibility.patch
new file mode 100644
index 000000000000..900f2f0ec917
--- /dev/null
+++ b/meta-oe/recipes-security/keyutils/files/0002-tests-Use-head-n1-for-busybox-compatibility.patch
@@ -0,0 +1,64 @@
+From 5e660f246bb04560692ac9fc144574732c7e19e7 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Thu, 26 Jan 2023 08:28:16 +0000
+Subject: [PATCH 2/2] tests: Use `head -n1` for busybox compatibility
+
+Upstream-Status: Pending
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ tests/keyctl/session/valid/runtest.sh | 4 ++--
+ tests/keyctl/show/noargs/runtest.sh   | 2 +-
+ tests/toolbox.inc.sh                  | 2 +-
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/keyctl/session/valid/runtest.sh b/tests/keyctl/session/valid/runtest.sh
+index 4c831314c0b0..456e9f32de23 100644
+--- a/tests/keyctl/session/valid/runtest.sh
++++ b/tests/keyctl/session/valid/runtest.sh
+@@ -17,7 +17,7 @@ then
+     expect_key_rdesc rdesc "keyring@.*@.*@.*@_ses[^@]*\$"
+ 
+     # check the session keyring ID is shown
+-    seskeyring="`tail -2 $OUTPUTFILE | head -1`"
++    seskeyring="`tail -2 $OUTPUTFILE | head -n1`"
+     if ! expr "$seskeyring" : "Joined session keyring: [0-9]*" >&/dev/null
+     then
+ 	failed
+@@ -30,7 +30,7 @@ new_session qwerty keyctl rdescribe @s "@"
+ expect_key_rdesc rdesc "keyring@.*@.*@.*@qwerty"
+ 
+ # check the session keyring ID is shown
+-seskeyring="`tail -2 $OUTPUTFILE | head -1`"
++seskeyring="`tail -2 $OUTPUTFILE | head -n1`"
+ if ! expr "$seskeyring" : "Joined session keyring: [0-9]*" >&/dev/null
+ then
+     failed
+diff --git a/tests/keyctl/show/noargs/runtest.sh b/tests/keyctl/show/noargs/runtest.sh
+index d5072716c76a..a6d8b6b585c4 100644
+--- a/tests/keyctl/show/noargs/runtest.sh
++++ b/tests/keyctl/show/noargs/runtest.sh
+@@ -31,7 +31,7 @@ then
+ fi
+ 
+ # the first key listed (line 2) should be a keying (the session keyring) ...
+-keyring1="`grep -n keyring $OUTPUTFILE | cut -d: -f1 | head -1`"
++keyring1="`grep -n keyring $OUTPUTFILE | cut -d: -f1 | head -n1`"
+ if [ "$keyring1" != "4" ]
+ then
+     failed
+diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
+index 7ea2f253ba7d..a461a73daaa3 100644
+--- a/tests/toolbox.inc.sh
++++ b/tests/toolbox.inc.sh
+@@ -229,7 +229,7 @@ function check_notify ()
+     if [ "$1" = "-2" ]
+     then
+ 	shift
+-	my_logline="`tail -2 $watch_log | head -1`"
++	my_logline="`tail -2 $watch_log | head -n1`"
+     else
+ 	my_logline="`tail -1 $watch_log`"
+     fi
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
similarity index 74%
rename from meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
rename to meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
index 019118f38b41..6cdfef9d118e 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.1.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.3.bb
@@ -12,18 +12,24 @@ LICENSE = "LGPL-2.1-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENCE.GPL;md5=5f6e72824f5da505c1f4a7197f004b45 \
                     file://LICENCE.LGPL;md5=7d1cacaa3ea752b72ea5e525df54a21f"
 
-inherit siteinfo autotools-brokensep ptest
+inherit manpages ptest
 
-SRC_URI = "http://people.redhat.com/dhowells/keyutils/${BP}.tar.bz2 \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git;protocol=https;branch=master \
            file://keyutils-test-fix-output-format.patch \
            file://keyutils-fix-error-report-by-adding-default-message.patch \
            file://run-ptest \
            file://fix_library_install_path.patch \
            file://0001-tests-toolbox.inc.sh-update-regex-for-getting-endian.patch \
+           file://0001-Adhere-to-the-SOURCE_DATE_EPOCH-standard.patch \
+           file://0001-tests-builtin_trusted-Failure-command-is-failed.patch \
+           file://0002-tests-Use-head-n1-for-busybox-compatibility.patch \
            "
+SRCREV = "cb3bb194cca88211cbfcdde2f10c0f43c3fb8ec3"
 
-SRC_URI[md5sum] = "919af7f33576816b423d537f8a8692e8"
-SRC_URI[sha256sum] = "c8b15722ae51d95b9ad76cc6d49a4c2cc19b0c60f72f61fb9bf43eea7cbd64ce"
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[manpages] = ""
 
 EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall' \
     NO_ARLIB=1 \
@@ -40,7 +46,6 @@ EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall' \
     "
 
 do_install () {
-    install -d ${D}/${libdir}/pkgconfig
     oe_runmake DESTDIR=${D} install
 }
 
@@ -50,7 +55,7 @@ do_install_ptest () {
 }
 
 
-RDEPENDS:${PN}-ptest += "lsb-release"
+RDEPENDS:${PN}-ptest += "bash lsb-release make"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
 RDEPENDS:${PN}-ptest:append:libc-musl = " musl-utils"
 
-- 
2.39.0


