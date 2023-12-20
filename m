Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0926AC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 08:55:06 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.17820.1703062497043726100
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 00:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Qo+ouAee;
 spf=pass (domain: mvista.com, ip: 209.85.210.45, mailfrom: vanusuri@mvista.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6d9f7af8918so4636789a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 00:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1703062495; x=1703667295; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+JaSWSEU1ytH72MsfMRhthdc06jo6UuCytqgtuot3A=;
        b=Qo+ouAee1DvqnesYhzo7lJrqlyBtu5V5V/bwGIw0NI6apqT1g7QUCYovpZGqvaTlqC
         A34xT4pMYsnEBqKbp+AdHqJI6Dp8Yf4hL7JdGQbpQPFj3rIDSJceLNH4vbj3uCR+eb4B
         XVprEoG/wqOMK382u2wDbMJbl649mt2wskVN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703062495; x=1703667295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+JaSWSEU1ytH72MsfMRhthdc06jo6UuCytqgtuot3A=;
        b=Z7FCe1jJ/pgp/gsdOu7jOUFgVqy3z1XUlyzP5LXk8NGzfcbUrq/UEH3o9mUsU3Ybql
         4zExcnb1hS2/5hhKuuBxSa8aZ5PChwTMHUKrh7R+EA9RpJ6ZXqOyfjCY8g7vCGA3Mdw+
         PTfg7Z4djc7PD07GbC5hgp33J9Ndm32awBrYHdd1KLLQeqh/wk+FJrWelLumMAy33s/9
         j6AgyoKkmsLCVK1IjENwQ94CtoXewuWX7K04zs/mF+5TKE52LREFj+XhotunwgmtLNaq
         cZqEVcP5mR1VxWk1VtO8CZNDjPCW8UhZQSd8lyRgLEnDPR1P52icbwEUe0iYJZlSdICS
         Z5sw==
X-Gm-Message-State: AOJu0Yyr0ddc/fGU+viBamDs8BqSNROTLcUatz2boed824F1OdP9DQD1
	GvKRXfBiXEANoPLwbplValx7zglsniCvS73pwGU=
X-Google-Smtp-Source: AGHT+IGz69jG5CWd789G2rJ70YAKB8ILxrW37kJy5mAb4kcqjewjVlXCxwBSxxfIZCRlYh1n78A9vA==
X-Received: by 2002:a9d:7601:0:b0:6db:9d0f:9c02 with SMTP id k1-20020a9d7601000000b006db9d0f9c02mr2559859otl.22.1703062495496;
        Wed, 20 Dec 2023 00:54:55 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1cb2:ae:9c0e:43e0:a383:ef58])
        by smtp.gmail.com with ESMTPSA id fe16-20020a056a002f1000b006d3dd365a76sm7254213pfb.2.2023.12.20.00.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 00:54:55 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Yi Zhao <yi.zhao@windriver.com>
Subject: [meta-oe][kirkstone][PATCH v3 2/4] libssh: add ptest
Date: Wed, 20 Dec 2023 14:24:36 +0530
Message-Id: <20231220085438.97520-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220085438.97520-1-vanusuri@mvista.com>
References: <20231220085438.97520-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 08:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107651

From: Vijay Anusuri <vanusuri@mvista.com>

Results:
$ ptest-runner libssh
START: ptest-runner
2023-03-16T02:56
BEGIN: /usr/lib/libssh/ptest
PASS: torture_bind_config
PASS: torture_buffer
PASS: torture_bytearray
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
PASS: torture_moduli
PASS: torture_options
PASS: torture_packet
PASS: torture_packet_filter
PASS: torture_pki
PASS: torture_pki_ecdsa
PASS: torture_pki_ed25519
PASS: torture_pki_rsa
PASS: torture_push_pop_dir
PASS: torture_rand
PASS: torture_session_keys
PASS: torture_temp_dir
PASS: torture_temp_file
PASS: torture_threads_buffer
PASS: torture_threads_crypto
PASS: torture_threads_init
PASS: torture_threads_pki_rsa
PASS: torture_tokens
DURATION: 24
END: /usr/lib/libssh/ptest
2023-03-16T02:56
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>

Ref: https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/nanbield-nut&id=bf49bdea290ba8cf18f3fd6b47d1d71dfe499948

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ....txt-do-not-search-ssh-sshd-commands.patch | 38 +++++++++++++
 .../recipes-support/libssh/libssh/run-ptest   | 53 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.4.bb   | 21 ++++++--
 3 files changed, 109 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/run-ptest

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
new file mode 100644
index 000000000..0c7f53029
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
+---
+ tests/CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 22a36f37..aa32ca2e 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -86,6 +86,7 @@ set(TEST_TARGET_LIBRARIES
+ 
+ add_subdirectory(unittests)
+ 
++if (CLIENT_TESTING OR SERVER_TESTING)
+ # OpenSSH Capabilities are required for all unit tests
+ find_program(SSH_EXECUTABLE NAMES ssh)
+ if (SSH_EXECUTABLE)
+@@ -293,6 +294,7 @@ if (CLIENT_TESTING OR SERVER_TESTING)
+ 
+     message(STATUS "TORTURE_ENVIRONMENT=${TORTURE_ENVIRONMENT}")
+ endif ()
++endif ()
+ 
+ configure_file(tests_config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/tests_config.h)
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh/run-ptest b/meta-oe/recipes-support/libssh/libssh/run-ptest
new file mode 100644
index 000000000..159994e9b
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/run-ptest
@@ -0,0 +1,53 @@
+#!/bin/sh
+
+# Valid tests to run
+tests="torture_bind_config \
+       torture_buffer \
+       torture_bytearray \
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
+       torture_moduli \
+       torture_options \
+       torture_packet \
+       torture_packet_filter \
+       torture_pki \
+       torture_pki_ecdsa \
+       torture_pki_ed25519 \
+       torture_pki_rsa \
+       torture_push_pop_dir \
+       torture_rand \
+       torture_session_keys \
+       torture_temp_dir \
+       torture_temp_file \
+       torture_threads_buffer \
+       torture_threads_crypto \
+       torture_threads_init \
+       torture_threads_pki_rsa \
+       torture_tokens \
+	  "
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
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
index 3a57a728a..801644d95 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
@@ -6,16 +6,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.10"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.10 \
+           file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
+           file://run-ptest \
+          "
 SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake ptest
 
-PACKAGECONFIG ??= "gcrypt"
+PACKAGECONFIG ??= "gcrypt ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[gssapi] = "-DWITH_GSSAPI=1, -DWITH_GSSAPI=0, krb5, "
 PACKAGECONFIG[gcrypt] = "-DWITH_GCRYPT=1, -DWITH_GCRYPT=0, libgcrypt, "
+PACKAGECONFIG[tests] = "-DUNIT_TESTING=1, -DUNIT_TESTING=0, cmocka"
 
 ARM_INSTRUCTION_SET:armv5 = "arm"
 
@@ -26,4 +30,15 @@ EXTRA_OECMAKE = " \
     -DWITH_EXAMPLES=0 \
     "
 
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
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


