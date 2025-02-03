Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD820C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 07:59:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.82994.1738569561991440973
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 23:59:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MRVkVpYv;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21634338cfdso97152935ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 23:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738569561; x=1739174361; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFbdKJuKPxfD2UfHDCvPVZHtIFgVskWblqXhGO+wcfk=;
        b=MRVkVpYvGMk5s3ERg2UOtNe7axuPiR/SGmQ9M8yV/IAiFbXRp7uMy55wyh5vWmCDza
         J6Ji8zE2FsJfmpYknSkPVmKnYmG6zxBhA56IoEQVYIOYXq7xDh/A35h0ODKIem8cNXkF
         e0Js+wzV1vyxzpJoHE9M54o2qSqeUwQSXkMKT454LiGXSnBqSGaV2IaQDSfiE2LsJnuJ
         b3Yq5tXb0oDL2cUFQo2o+qRmSzrxJRnLSjuOFxlk2B9CsjG2SHWemKRYZrTCLnBa8fFC
         fdMxELOSI88Wwyw9rLBalE94KEpnIjAhgt7/4lYiEcV1V4FNlWZf4g5++yHcNyg6VHOi
         jSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738569561; x=1739174361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFbdKJuKPxfD2UfHDCvPVZHtIFgVskWblqXhGO+wcfk=;
        b=oPa9ruGZ4/8B+a77NrfnewoTxtAMnCJe9gYa2etQ7AFud3ZWUlezI3jKEWGDIHOk2+
         kQj2XQOtsfCHWN2pFY29noAS369TRmQELYLtMWHSNu+wWJeXIkVluRbPc6dGl8QsGfSq
         e8GKx8nfPdxxj7goc59CVH9aLIXE8JJ1An7rsNvY12q6esf4peDfS742h4OaeY+GewQT
         t+lAau7gXR9/i5Fs7cavZQopyLKTJy0lMkq4NRFAoxn1bnPjKtWx0MuBX2FH0Xg99uHe
         gfmKxikhh10Qi6NBcEsSI8wQbXbV9ikRufBnrW8R/lZe8oXdbZGOXnrHaUHoGwoubFVe
         G6Ew==
X-Gm-Message-State: AOJu0YxFYBlIKqDWEIBIPB8qbbHoJyIw5JjFSr9ZeWHXUQ7X2hRcmNLh
	4H28CyQLWNPiCIx7GvHL2SH9exX0jObBbdUghDofA3MRwPFTpWepCYQU9Q==
X-Gm-Gg: ASbGncvlQQO9O9qINt7WE8KOFitBoVlsIdS8e0l6BuDUe3vl42dopmgd2Yu87jHOsYm
	9RbomzQQmHZ0EyNQoCjUo3RW6bqTtEnMRE25vtiPBRQgSkZSCVDCRw4OJWywMOLLnh3aS2JDUka
	X0nnKTyRIoOpwH7SHfbtrmFiJUJCxn4w0yT1bzBw2+GrYXYmm5KmG5Jh4nxyBPIiDUKE/UGa39E
	3YyqeypsZo/znSte/7dnJ3cqZ3R0WIEdl2WZ82skEtzIl1jBoYuuYIAX5PJShDOdthHn9xsZ0VL
	zJ692oDZ6QLvNVg5tZ9kHUt5oVRdQGJfwbqzb4U=
X-Google-Smtp-Source: AGHT+IH3pwS5dPBtN+NB83vgrZLP0wlCfAi6V2XQZ0tcgcry5Z+eGwGyEzAP6pEydLCtVJFyeUf/OA==
X-Received: by 2002:a05:6a00:2a08:b0:725:f282:1f04 with SMTP id d2e1a72fcca58-72fd0c6cf0dmr32694679b3a.18.1738569560833;
        Sun, 02 Feb 2025 23:59:20 -0800 (PST)
Received: from LL-3020L.kpit.com ([2401:4900:5606:bd14:993e:924f:7e7b:fd7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6429a98sm8131034b3a.67.2025.02.02.23.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 23:59:20 -0800 (PST)
From: Virendra Thakur <thakur.virendra1810@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [meta-oe][kirkstone][PATCH] libssh: Add ptest
Date: Mon,  3 Feb 2025 13:26:10 +0530
Message-Id: <20250203075610.238451-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 07:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115236

From: Virendra Thakur <virendrak@kpit.com>

Enable ptest for libssh , this change is backported from upstream
scarthgap.

Reference: https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&id=bf49bdea290ba8cf18f3fd6b47d1d71dfe499948

~ # ptest-runner libssh
START: ptest-runner
2025-01-28T14:28
BEGIN: /usr/lib/libssh/ptest
PASS: torture_buffer
PASS: torture_callbacks
PASS: torture_channel
PASS: torture_config
PASS: torture_crypto
PASS: torture_hashes
PASS: torture_init
PASS: torture_isipaddr
PASS: torture_keyfiles
PASS: torture_knownhosts_parsing
PASS: torture_list
PASS: torture_misc
PASS: torture_options
PASS: torture_packet
PASS: torture_packet_filter
PASS: torture_pki
PASS: torture_pki_ecdsa
PASS: torture_pki_ed25519
PASS: torture_pki_rsa
PASS: torture_rand
PASS: torture_threads_buffer
PASS: torture_threads_crypto
PASS: torture_threads_init
PASS: torture_threads_pki_rsa
DURATION: 119
END: /usr/lib/libssh/ptest
2025-01-28T14:29
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 ....txt-do-not-search-ssh-sshd-commands.patch | 38 ++++++++++++++++
 .../recipes-support/libssh/libssh/run-ptest   | 45 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.8.9.bb    | 19 ++++++--
 3 files changed, 99 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/run-ptest

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
new file mode 100644
index 0000000000..91355d0c88
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
@@ -0,0 +1,38 @@
+From d2525ba0bc7b11de12c54ea1a3d1eb862537136d Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 15 Mar 2023 16:51:58 +0800
+Subject: [PATCH] tests/CMakeLists.txt: do not search ssh/sshd commands on host
+
+It will search ssh/sshd commands on host when configure. Since they are
+not required by unittests, we can skip the search.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+ tests/CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 22a36f37..aa32ca2e 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -48,6 +48,7 @@ set(TEST_TARGET_LIBRARIES
+
+ add_subdirectory(unittests)
+
++if (CLIENT_TESTING OR SERVER_TESTING)
+ if (CLIENT_TESTING)
+     find_package(socket_wrapper 1.1.5 REQUIRED)
+     find_package(nss_wrapper 1.1.2 REQUIRED)
+@@ -152,6 +153,7 @@ if (WITH_SERVER AND SERVER_TESTING)
+     add_subdirectory(pkd)
+ endif (WITH_SERVER AND SERVER_TESTING)
+
++endif ()
+ if (FUZZ_TESTING)
+     add_subdirectory(fuzz)
+ endif()
+-- 
+2.25.1
diff --git a/meta-oe/recipes-support/libssh/libssh/run-ptest b/meta-oe/recipes-support/libssh/libssh/run-ptest
new file mode 100644
index 0000000000..4ab3e5d141
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/run-ptest
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+# Valid tests to run
+tests="torture_buffer \
+       torture_callbacks \
+       torture_channel \
+       torture_config \
+       torture_crypto \
+       torture_hashes \
+       torture_init \
+       torture_isipaddr \
+       torture_keyfiles \
+       torture_knownhosts_parsing \
+       torture_list \
+       torture_misc \
+       torture_options \
+       torture_packet \
+       torture_packet_filter \
+       torture_pki \
+       torture_pki_ecdsa \
+       torture_pki_ed25519 \
+       torture_pki_rsa \
+       torture_rand \
+       torture_threads_buffer \
+       torture_threads_crypto \
+       torture_threads_init \
+       torture_threads_pki_rsa \
+       "
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+# Run specified tests
+for f in $tests
+do
+    if test -e ./"$f"; then
+        if ./"$f" > ./"$f".out 2> ./"$f".err; then
+            echo "PASS: $f"
+        else
+            echo "FAIL: $f"
+        fi
+    else
+        echo "SKIP: $f"
+    fi
+done
diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index 98910d3068..7d0fc2d32f 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -18,17 +18,19 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://004_CVE-2023-6004.patch \
            file://005_CVE-2023-6004.patch \
            file://006_CVE-2023-6004.patch \
+           file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
+           file://run-ptest \
           "
 SRCREV = "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake ptest
 
-PACKAGECONFIG ??= "gcrypt"
+PACKAGECONFIG ??= "gcrypt ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
 PACKAGECONFIG[gcrypt] = "-DWITH_GCRYPT=1, -DWITH_GCRYPT=0, libgcrypt, "
-
+PACKAGECONFIG[tests] = "-DUNIT_TESTING=1, -DUNIT_TESTING=0, cmocka"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
 EXTRA_OECMAKE = " \
@@ -44,6 +46,17 @@ do_configure:prepend () {
         || bbfatal "Failed to disable examples"
 }
 
+do_compile:prepend () {
+    if [ ${PTEST_ENABLED} = "1" ]; then
+        sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/config.h
+    fi
+}
+
+do_install_ptest () {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -f ${B}/tests/unittests/torture_* ${D}${PTEST_PATH}/tests/
+}
+
 TOOLCHAIN = "gcc"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


