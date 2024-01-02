Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBEEC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:02:55 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.24325.1704178970804694574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="144906434"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="144906434"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:02:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1761ED7AC6
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:02:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 08D3DB4E3E
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:02:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 954C2200838B6
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:02:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2ADFF1A0070;
	Tue,  2 Jan 2024 15:02:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libssh: upgrade 0.10.5 -> 0.10.6
Date: Tue,  2 Jan 2024 15:02:33 +0800
Message-Id: <1704178953-7826-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--7.381600-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/ySrLqyE6Ur/jlq8SLDWROodXGTbsQqHbkotx
	jghoBojmu6ugQu2EHewZ6AKZ5CDJjq0L8k+oKf2MHWRJEfGP5nlezmeoa8MJ8z5UrbfJU1A8e33
	Dc034IzwqqtDuUtwyfIrxadHfzoJWbRev5+PfDD/y3h9RQZ4StME5XPQnBzGXvpLsd+70hTFmeC
	LE2iu14Lj+FTPGFTGwmEKHz5YiYlQJtPHo4WMLBqqHmm/V4M/Pzvw8i1YocQ9AALVzeWYQcFV2n
	PDrzspKLijzT5kwmq3eVrfbA6W+BRtybdvWAMHw3QqJN4m15UF9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO0UQCQtpNwWeizaGzTuc3oIPHge4hKcCOdpgKpUuF63a1QKqhoP07qb
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107993

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
---
 ...pt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch | 10 ++++------
 ...MakeLists.txt-do-not-search-ssh-sshd-commands.patch | 10 ++++------
 .../libssh/{libssh_0.10.5.bb => libssh_0.10.6.bb}      |  2 +-
 3 files changed, 9 insertions(+), 13 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.10.5.bb => libssh_0.10.6.bb} (96%)

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch b/meta-oe/recipes-support/libssh/libssh/0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch
index 19775fa52..d2d1fb595 100644
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
index 0c7f53029..d6bc75c3a 100644
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
index f33987acf..31f29c1b7 100644
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


