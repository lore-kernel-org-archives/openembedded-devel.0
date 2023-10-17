Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFF5CDB465
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 02:19:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.198987.1697509159867124807
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Oct 2023 19:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Tl6By1zg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8654aefd5e=chi.xu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39H1cTxQ017167
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 19:19:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=n9IOH
	1u18cgPvsGvz4hAPH9dH28bq6KKT6wzXqore3M=; b=Tl6By1zgopAFh5vW/QGXc
	9Rmz42/FSx7d+sR+WzByerkB7PKZ9EKlKygHsJ+L9mnm9sPZhuOCelxVC0nshwUz
	H3mKdMzqLKY7ojvvmrWnIuIgE7iyK4NsOEf9RhQIBWeGjizq5a7ommcPYNT6+l1M
	RWFGSuEFoCzmn8Bsh4G6BeBgVqh19ZvZ1sxk7w1OMtctUvm6BMaWXi/9pbx+WBMX
	a4WljGdSILyKukmZuyK/EIekdR8mFhLT43lGtB50CKF9AIDajEge04L8F7XKBpTe
	N/BPzrlcaa1KE5Skt6DKEfHdTbq6bVKcQrQlCcpggbL07ysZzlmJWsW5G/O5Wfbe
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tqp90tdv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Oct 2023 19:19:19 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 19:19:16 -0700
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 19:19:15 -0700
From: <chi.xu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] re2: Add ptest support
Date: Tue, 17 Oct 2023 10:19:17 +0800
Message-ID: <20231017021917.452598-1-chi.xu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: uTJTQWwiV2SaFwz9ryBPse9olZTJLmhg
X-Proofpoint-ORIG-GUID: uTJTQWwiV2SaFwz9ryBPse9olZTJLmhg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310170018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 02:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105548

From: Chi Xu <chi.xu@windriver.com>

Test results:
root@qemux86-64:~# ptest-runner re2 -t 7200
START: ptest-runner
2023-10-16T08:36
BEGIN: /usr/lib/re2/ptest
PASS: charclass_test
PASS: compile_test
PASS: filtered_re2_test
PASS: mimics_pcre_test
PASS: parse_test
PASS: possible_match_test
PASS: re2_test
PASS: re2_arg_test
PASS: regexp_test
PASS: required_prefix_test
PASS: search_test
PASS: set_test
PASS: simplify_test
PASS: string_generator_test
PASS: dfa_test
PASS: exhaustive1_test
PASS: exhaustive2_test
PASS: exhaustive3_test
PASS: exhaustive_test
PASS: random_test
DURATION: 2085
END: /usr/lib/re2/ptest
2023-10-16T09:11
STOP: ptest-runner
TOTAL: 1 FAIL: 0

And add re2 ptest to PTESTS_SLOW_META_OE.

Signed-off-by: Chi Xu <chi.xu@windriver.com>
---
 .../conf/include/ptest-packagelists-meta-oe.inc  |  1 +
 meta-oe/recipes-support/re2/re2/run-ptest        |  3 +++
 meta-oe/recipes-support/re2/re2_2023.03.01.bb    | 16 +++++++++++++---
 3 files changed, 17 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/re2/re2/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index a2b2ce4bc..92a5fdbc6 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -49,6 +49,7 @@ PTESTS_SLOW_META_OE = "\
     libusb-compat \
     rsyslog \
     mariadb \
+    re2 \
 "
 PTESTS_SLOW_META_OE:append:x86 = " kernel-selftest"
 PTESTS_SLOW_META_OE:append:x86-64 = " kernel-selftest"
diff --git a/meta-oe/recipes-support/re2/re2/run-ptest b/meta-oe/recipes-support/re2/re2/run-ptest
new file mode 100644
index 000000000..8bd5fd1ef
--- /dev/null
+++ b/meta-oe/recipes-support/re2/re2/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
diff --git a/meta-oe/recipes-support/re2/re2_2023.03.01.bb b/meta-oe/recipes-support/re2/re2_2023.03.01.bb
index 78bf695a4..fe210d510 100644
--- a/meta-oe/recipes-support/re2/re2_2023.03.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2023.03.01.bb
@@ -6,17 +6,27 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b5c31eb512bdf3cb11ffd5713963760"
 # tag 2023-03-01
 SRCREV = "241e2e430836e80f93d704d1f06cd3e7fe3100f5"
 
-SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/google/re2.git;branch=main;protocol=https \
+           ${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)} \
+          "
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake ptest
+RDEPENDS:${PN}-ptest += "cmake sed"
 
 EXTRA_OECMAKE += " \
 	-DBUILD_SHARED_LIBS=ON \
-	-DRE2_BUILD_TESTING=OFF \
+        ${@bb.utils.contains('PTEST_ENABLED', '1', '-DRE2_BUILD_TESTING=ON', '-DRE2_BUILD_TESTING=OFF', d)} \
 "
 
+do_install_ptest () {
+    cp -r ${B}/*_test ${D}${PTEST_PATH}
+    cp -r ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
+    sed -i -e 's#${B}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+    sed -i -e 's#${S}#${PTEST_PATH}#g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+}
+
 # ignore .so in /usr/lib64
 FILES:${PN} = "${libdir}"
 INSANE_SKIP:${PN} += "dev-so"
-- 
2.25.1


