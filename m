Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAC6C0018A
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 17:27:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.84.1698859643482357479
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 10:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TsrFXpHW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9669806969=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A1GPxLl030555
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Nov 2023 10:27:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=uI9/b
	In6uwupYcECcsrcYNKguOUpxoHuCbZTM8x7uJ8=; b=TsrFXpHW517WpOTv1t5LG
	3dydA1jLr2d4m8/LnDpR1MMXIqdC5aT3rTJ9Z4qWb6rn7LW+uQcQRgZLxNtMfULj
	KcRcLYPSHsXpt+NL/c0Ivh5uqwYsK9AC49L5irpOFLcUl06Q1YbTFTtYWZnXqEcS
	g9oLCmlYH6uGQs3rMo3u3ZqvNuocv3fYt13qa+aWt4vOmI+32l0TtaJSnxVIJk2v
	ps0Kbwq8TIvjJVx7JvBoxqiT7HEhIwSgKm4z6nE/AMXkurN3HOJ7AYlR3FEszeab
	P2xR+YNnYt0GJKlNRb0psJ8h9y+6+c8Z9GQxz9ol3m07ibOKaLsnWTNEBG/tCo3H
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u11tfvx2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 10:27:22 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 1 Nov 2023 10:27:23 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][mickledore][PATCH 1/1] libssh: upgrade 0.10.4 -> 0.10.5
Date: Wed, 1 Nov 2023 17:27:04 +0000
Message-ID: <20231101172704.3962116-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: w5MCLQwVJWzL1CO9q7PHKb8s4RA6bhLf
X-Proofpoint-ORIG-GUID: w5MCLQwVJWzL1CO9q7PHKb8s4RA6bhLf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_15,2023-11-01_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311010134
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 17:27:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105824

From: Yi Zhao <yi.zhao@windriver.com>

Changelog:
https://git.libssh.org/projects/libssh.git/tag/?h=libssh-0.10.5

* Generate cases list dynamically in run-ptest.
* Install missing file to fix ptest failure.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b0833f1f3ec78f16a79d9ff66cdd19da93496018)
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../recipes-support/libssh/libssh/run-ptest   | 42 ++-----------------
 .../{libssh_0.10.4.bb => libssh_0.10.5.bb}    |  5 ++-
 2 files changed, 7 insertions(+), 40 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.10.4.bb => libssh_0.10.5.bb} (85%)

diff --git a/meta-oe/recipes-support/libssh/libssh/run-ptest b/meta-oe/recipes-support/libssh/libssh/run-ptest
index 159994e9b..6346b72d5 100644
--- a/meta-oe/recipes-support/libssh/libssh/run-ptest
+++ b/meta-oe/recipes-support/libssh/libssh/run-ptest
@@ -1,53 +1,17 @@
 #!/bin/sh
 
-# Valid tests to run
-tests="torture_bind_config \
-       torture_buffer \
-       torture_bytearray \
-       torture_callbacks \
-       torture_channel \
-       torture_config \
-       torture_crypto \
-       torture_hashes \
-       torture_init \
-       torture_isipaddr \
-       torture_keyfiles \
-       torture_knownhosts_parsing \
-       torture_list \
-       torture_misc \
-       torture_moduli \
-       torture_options \
-       torture_packet \
-       torture_packet_filter \
-       torture_pki \
-       torture_pki_ecdsa \
-       torture_pki_ed25519 \
-       torture_pki_rsa \
-       torture_push_pop_dir \
-       torture_rand \
-       torture_session_keys \
-       torture_temp_dir \
-       torture_temp_file \
-       torture_threads_buffer \
-       torture_threads_crypto \
-       torture_threads_init \
-       torture_threads_pki_rsa \
-       torture_tokens \
-	  "
-
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd "$ptestdir"/tests || exit
 
-# Run specified tests
+tests=$(find * -type f -name 'torture_*')
+
 for f in $tests
 do
-    if test -e ./"$f"; then
+    if test -x ./"$f"; then
         if ./"$f" > ./"$f".out 2> ./"$f".err; then
             echo "PASS: $f"
         else
             echo "FAIL: $f"
         fi
-    else
-        echo "SKIP: $f"
     fi
 done
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
similarity index 85%
rename from meta-oe/recipes-support/libssh/libssh_0.10.4.bb
rename to meta-oe/recipes-support/libssh/libssh_0.10.5.bb
index 4b2ced5e5..f33987acf 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.4.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://0001-libgcrypt.c-Fix-prototype-of-des3_encrypt-des3_decry.patch \
            file://run-ptest \
           "
-SRCREV = "e8322817a9e5aaef0698d779ddd467a209a85d85"
+SRCREV = "479eca13aaaa46b43e68c52186e3783f06ae6f34"
 
 S = "${WORKDIR}/git"
 
@@ -34,12 +34,15 @@ EXTRA_OECMAKE = " \
 do_compile:prepend () {
     if [ ${PTEST_ENABLED} = "1" ]; then
         sed -i -e 's|${B}|${PTEST_PATH}|g' ${B}/config.h
+        sed -i -e 's|${S}|${PTEST_PATH}|g' ${B}/config.h
     fi
 }
 
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -f ${B}/tests/unittests/torture_* ${D}${PTEST_PATH}/tests/
+    install -d ${D}${PTEST_PATH}/tests/unittests
+    cp -f ${S}/tests/unittests/hello*.sh ${D}${PTEST_PATH}/tests/unittests/
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.40.0


