Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED11E103E2FE
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 01:49:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12350.1773280154248066488
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 18:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jQgGqys3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75313bcc0b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C1lRua837104
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 18:49:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QYQR3GdOFCx1sASdtOsy
	I+jqsQwTzcumcojf8dsOziI=; b=jQgGqys3/GAbZ67gri+tEbA0UmPoQmidc83h
	T6VNL8JcVsIp0/DbW9GIl3k8qK7t5w79Ui6zV0uFZ5tTT3pALuZzRjjfJCeu3hYy
	6fOg1c65Wd43JRVCc0uELQIVwb57ot0UuJqa9bxHORVp7QuSYGRX/Yz69W0jZOVQ
	HyfGXP4SQ4Fsx1x0ZzBAeLqkHrW+6K8ZFwbE1xk18WbG1gcVyovseMOwvZvI+QAo
	4sFgWr99SiUvjQTmhb4Dj/YeqFGQpMiOiwGSIG4o3XNyQ8fj74qCZvGMelqpeHw8
	YZYupgNmry7h+Hza1yxt6gyY6p+0hXi2s9+P+T9/LXdg5DftgA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6t84tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 18:49:13 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 11 Mar 2026 18:49:13 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 11 Mar 2026 18:49:12 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libssh: Upgrade 0.11.3 -> 0.12.0
Date: Thu, 12 Mar 2026 09:49:11 +0800
Message-ID: <20260312014911.822219-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 8gFysnliMrFJIPtRGPBpkYN8m48KFhrV
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b21b99 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=nar8ntqeAAAA:8 a=t7CeM3EgAAAA:8
 a=R-XCW2FBCaIfJSkxsAkA:9 a=RptMqvEBejqe73AKBt4K:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8gFysnliMrFJIPtRGPBpkYN8m48KFhrV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAxMyBTYWx0ZWRfX/EuT2OoHqCSi
 q87RLF8mNv+E0DafWSml8yw5/iulGsj645Jn3WEsWuHHt3lN9ohxhaxm/ROFltOxZ0OSwV/sUmk
 WI3goh9DyHALquejdlGzLcjHWhK+FjN4Jfrf3KS3rW4ayBZoAT0vlXK5SFntDFu8PFVjHt6tv8f
 LJ/+YLT9I5ZRfP4Pev3lydRD1kK2xqG/rIDh3PZeUakKN7+vCsPZrFx1Z9qmVBlkoj0tqcMTfUA
 nPIEFXtlPwZzCtC2mOe+zvGt2pz7NSBiDe27Ryx5egsenWktXsli5IOmhlVBNWSfNFBcCJ7idw6
 BWFKbc4qUODZmkkbwy+nNHyNzlizhxXoVnfLm9j6gFWCfK7JkvG2HRkV/OHmOpnTiUDAwETM+hZ
 UhKifrO0IYbMIhtH1u1O8qAR4ast5dNz1Ic9S/jFsrq1oPAOlZHpmVxcxADJFYMLXtIie/MojD3
 rkNYjmWa0DA21s0qQEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120013
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 01:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125096

From: Mingli Yu <mingli.yu@windriver.com>

Changelog:
https://www.libssh.org/2026/02/10/libssh-0-12-0-and-0-11-4-security-releases/

Rebase 0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch to
avoid patch fuzz error.

 # ./run-ptest
PASS: torture_bignum
PASS: torture_bind_config
PASS: torture_buffer
PASS: torture_bytearray
PASS: torture_callbacks
PASS: torture_channel
PASS: torture_config
PASS: torture_config_match_localnetwork
PASS: torture_crypto
PASS: torture_forwarded_tcpip_callback
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
PASS: torture_pki_dsa
PASS: torture_pki_ecdsa
PASS: torture_pki_ed25519
PASS: torture_pki_rsa
PASS: torture_pki_sk_ecdsa
PASS: torture_pki_sk_ed25519
PASS: torture_pki_sshsig
PASS: torture_push_pop_dir
PASS: torture_rand
PASS: torture_server_direct_tcpip
PASS: torture_server_x11
PASS: torture_session_keys
PASS: torture_string
PASS: torture_temp_dir
PASS: torture_temp_file
PASS: torture_threads_buffer
PASS: torture_threads_crypto
PASS: torture_threads_init
PASS: torture_threads_pki_rsa
PASS: torture_tokens
PASS: torture_unit_server
PASS: torture_unit_sftp

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...akeLists.txt-do-not-search-ssh-sshd-commands.patch | 11 ++++-------
 .../libssh/{libssh_0.11.3.bb => libssh_0.12.0.bb}     |  4 ++--
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.11.3.bb => libssh_0.12.0.bb} (94%)

diff --git a/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
index 4803ff81d8..72353164f7 100644
--- a/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
+++ b/meta-oe/recipes-support/libssh/libssh/0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch
@@ -14,18 +14,18 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
-index 89b95d08..e481534c 100644
+index cf1adf56..713b1512 100644
 --- a/tests/CMakeLists.txt
 +++ b/tests/CMakeLists.txt
-@@ -96,6 +96,7 @@ set(TEST_TARGET_LIBRARIES
+@@ -138,6 +138,7 @@ set(TEST_TARGET_LIBRARIES
  
  add_subdirectory(unittests)
  
 +if (CLIENT_TESTING OR SERVER_TESTING)
  # OpenSSH Capabilities are required for all unit tests
  find_program(SSH_EXECUTABLE NAMES ssh)
- if (SSH_EXECUTABLE)
-@@ -345,6 +346,7 @@ endif (WITH_PKCS11_URI)
+ find_program(SSH_KEYGEN_EXECUTABLE NAMES ssh-keygen)
+@@ -440,6 +441,7 @@ endif ()
  file(COPY gss/kdcsetup.sh DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/gss FILE_PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE)
  
  message(STATUS "TORTURE_ENVIRONMENT=${TORTURE_ENVIRONMENT}")
@@ -33,6 +33,3 @@ index 89b95d08..e481534c 100644
  
  configure_file(tests_config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/tests_config.h)
  
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb b/meta-oe/recipes-support/libssh/libssh_0.12.0.bb
similarity index 94%
rename from meta-oe/recipes-support/libssh/libssh_0.11.3.bb
rename to meta-oe/recipes-support/libssh/libssh_0.12.0.bb
index 5928581312..632f60a049 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.12.0.bb
@@ -6,14 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dabb4958b830e5df11d2b0ed8ea255a0"
 
 DEPENDS = "zlib openssl"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable-0.11;tag=${BPN}-${PV} \
+SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=master;tag=${BPN}-${PV} \
            file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-commands.patch \
            file://run-ptest \
           "
 
 SRC_URI:append:toolchain-clang = " file://0001-CompilerChecks.cmake-drop-Wunused-variable-flag.patch"
 
-SRCREV = "301d0e16dfa8a5cac1cff956b6880ca90eb82864"
+SRCREV = "50313883f3a077458cde4ea95bf46bfeb0771b34"
 
 
 inherit cmake ptest
-- 
2.34.1


