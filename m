Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29817C47DA7
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 01:13:34 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.1300.1705454009857280496
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 17:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MdM5c4nn;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5f00bef973aso108598807b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 17:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705454009; x=1706058809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oKwKBL8V2cPH1wG4KdKNcbYtsh8ZqOO9KCaualo16I=;
        b=MdM5c4nnt0LLjKbUWSfWTO15Orn1AVfOkUm4YH2W3yLqSggInD5Qa53yJdQjkhYTMx
         iEYMoAieppLJ/lotTX29dLx6It4khMhyn7Hj54UKyDH/6jWTThgIJ8W66bmxdyCeiclS
         TJUXD96FUix8g/TjWNXQW7HPUZWVSRIh8vkMbDBpXXwZaB6FeUlh2DH13O+x8NA4P3iI
         pFNbuPcu/BUzLA0lJqxYnktESRIojDjiWRtrNGuEDKrxxTU6Vv/8+LJoq7yXBrHMi+gf
         IsUAmzTTKFNQFgwfEUi0oq/DfApGPCt84JCxyrVygK48Ta7OrzPLjNIKk9Q1xEJSTLiN
         60GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705454009; x=1706058809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oKwKBL8V2cPH1wG4KdKNcbYtsh8ZqOO9KCaualo16I=;
        b=CMpbqUO8fFwQt+Jvs3gsDoJ/7AqvHk3/O1UePvv7GaES8TS0wMoWVXl0eD+MIPptLH
         LOBiZDttULLX3TM8Tzvs8hSymDtsUnd4ZfHpgAcGNZcBpB1nTSxI4QdkEocKjtO7Wf9x
         BCuZRii5elRe6F2HoDcoOunc1Jf78U988YmjuBr1MbhmPCuN7P9W0eaP4uyR6S5YqSKL
         u4J98+PROArXCYDD6E7FEa0GpWia6/mp7vUIBveB2P0eFdLgH8kIwnEicgjBIIzpZJqk
         ZhAs6y54Z1/MZFBQGqbtKTRLWkZ1R2MvaAaZH5Luo6yNZAAxpF+ojAwsamIjTwdZkrJc
         UplQ==
X-Gm-Message-State: AOJu0YxQslTRZY/KnEH+wBEJnGs4Y0q/h8clIpOkndWmz8Gk4SEMGli7
	Viwr71YUXZ9eaA4ZO60KeCwo4JVFmktYZw==
X-Google-Smtp-Source: AGHT+IHr6z0JQmQEXaHMGZVSW+Fkq4HAVK0hSBYzMTnsB3JZvbC7dfBE7JG9GGfXbKQjTxUTsFs/OQ==
X-Received: by 2002:a81:c745:0:b0:5f5:7710:3496 with SMTP id i5-20020a81c745000000b005f577103496mr6902480ywl.95.1705454008802;
        Tue, 16 Jan 2024 17:13:28 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:5290:e922:866d:63a6])
        by smtp.gmail.com with ESMTPSA id s188-20020a815ec5000000b005f06f997e22sm5426446ywb.50.2024.01.16.17.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 17:13:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 11/11] libssh: upgrade 0.10.5 -> 0.10.6
Date: Tue, 16 Jan 2024 20:13:20 -0500
Message-Id: <20240117011320.1856392-11-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240117011320.1856392-1-akuster808@gmail.com>
References: <20240117011320.1856392-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 01:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108321

From: Wang Mingyu <wangmy@fujitsu.com>

0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
refreshed for 0.10.6

Changelog:
==========
* Fix CVE-2023-6004: Command injection using proxycommand
* Fix CVE-2023-48795: Potential downgrade attack using strict kex
* Fix CVE-2023-6918: Missing checks for return values of MD functions
* Fix ssh_send_issue_banner() for CMD(PowerShell)
* Avoid passing other events to callbacks when poll is called recursively (#202)
* Allow @ in usernames when parsing from URI composes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1bea2e8c3053e7ecffb04adaaded54555f2afa0b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...pt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch | 10 ++++------
 ...MakeLists.txt-do-not-search-ssh-sshd-commands.patch | 10 ++++------
 .../libssh/{libssh_0.10.5.bb => libssh_0.10.6.bb}      |  2 +-
 3 files changed, 9 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.10.5.bb => libssh_0.10.6.bb} (96%)

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch b/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
index 19775fa529..d2d1fb5955 100644
--- a/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
+++ b/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
@@ -1,4 +1,4 @@
-From 0cade4573334571055127a2d4fe3641e2397948d Mon Sep 17 00:00:00 2001
+From 49a8ae4d6f77434ed9f7a601b9df488b921e4a22 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 20 Mar 2023 21:59:19 -0700
 Subject: [PATCH] libgcrypt.c: Fix prototype of des3_encrypt/des3_decrypt
@@ -18,15 +18,16 @@ TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/libssh/0.10.4-r0/git/
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/libgcrypt.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/libgcrypt.c b/src/libgcrypt.c
-index da5588ad..e482b654 100644
+index f410d997..e3f66781 100644
 --- a/src/libgcrypt.c
 +++ b/src/libgcrypt.c
-@@ -469,12 +469,12 @@ static int des3_set_key(struct ssh_cipher_struct *cipher, void *key, void *IV) {
+@@ -416,12 +416,12 @@ static int des3_set_key(struct ssh_cipher_struct *cipher, void *key, void *IV) {
  }
  
  static void des3_encrypt(struct ssh_cipher_struct *cipher, void *in,
@@ -41,6 +42,3 @@ index da5588ad..e482b654 100644
    gcry_cipher_decrypt(cipher->key[0], out, len, in, len);
  }
  
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
index 0c7f53029e..d6bc75c3a6 100644
--- a/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
+++ b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
@@ -1,4 +1,4 @@
-From d2525ba0bc7b11de12c54ea1a3d1eb862537136d Mon Sep 17 00:00:00 2001
+From 69a89e8f015802f61637fed0d3791d20a594f298 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 15 Mar 2023 16:51:58 +0800
 Subject: [PATCH] tests/CMakeLists.txt: do not search ssh/sshd commands on host
@@ -9,12 +9,13 @@ not required by unittests, we can skip the search.
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
 ---
  tests/CMakeLists.txt | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 22a36f37..aa32ca2e 100644
+index f5c30061..885c926a 100644
 --- a/tests/CMakeLists.txt
 +++ b/tests/CMakeLists.txt
 @@ -86,6 +86,7 @@ set(TEST_TARGET_LIBRARIES
@@ -25,7 +26,7 @@ index 22a36f37..aa32ca2e 100644
  # OpenSSH Capabilities are required for all unit tests
  find_program(SSH_EXECUTABLE NAMES ssh)
  if (SSH_EXECUTABLE)
-@@ -293,6 +294,7 @@ if (CLIENT_TESTING OR SERVER_TESTING)
+@@ -302,6 +303,7 @@ if (CLIENT_TESTING OR SERVER_TESTING)
  
      message(STATUS "TORTURE_ENVIRONMENT=${TORTURE_ENVIRONMENT}")
  endif ()
@@ -33,6 +34,3 @@ index 22a36f37..aa32ca2e 100644
  
  configure_file(tests_config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/tests_config.h)
  
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.5.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
similarity index 96%
rename from meta-oe/recipes-support/libssh/libssh_0.10.5.bb
rename to meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index f33987acf5..31f29c1b7d 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
            file://run-ptest \
           "
-SRCREV = "479eca13aaaa46b43e68c52186e3783f06ae6f34"
+SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


