Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51F7CA0ECD
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 03:42:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4396.1694662946168056232
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Sep 2023 20:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ax27kGHa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76210d8c93=chi.xu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38E3fR2T013523
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 03:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=mY0hU
	BDvAF2jAW9iRMboQbfMCBlg9UahKDakq2l0LeU=; b=Ax27kGHaG3319234tglnq
	kXfFsPe/Uh+8fS8g8Wr7U+HqpaOMGwE6I0ifh0fFajtkcZb3GOJefOmFTc09wRtb
	j5QJiQP1UCndc8yskZ3Qe3xmBzSmdPmgXlQTw/8BbWRUts5CAxmnWuZyOlgZ52B5
	xB6ZEapPxtwppJ78/E/zN0Jl5EMNMJHUtIORplbedPbW643Gr7LUskdFXp05vqRn
	hJ/2tn8ctbeVAlgnoCI+y+NnTFkCYHUCcO2FtHJSh/6G89uPhzQH9e3LxBpURKqZ
	jCIiRMyI/0JMa0ZKo+ypCU2yH8gpqZTPuckJlniXJ9dWxqhdhTWbgpCfcNqJNENE
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t2y8mscgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 03:42:25 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 13 Sep 2023 20:42:24 -0700
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 20:42:23 -0700
From: Chi Xu <chi.xu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] mariadb: Add ptest support
Date: Thu, 14 Sep 2023 11:42:22 +0800
Message-ID: <20230914034222.3307772-1-chi.xu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OcDmS1JtMtQktLzDwLNIkBT0n9rKWSJP
X-Proofpoint-ORIG-GUID: OcDmS1JtMtQktLzDwLNIkBT0n9rKWSJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_19,2023-09-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309140030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 03:42:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104863

70 test cases in all, and all of them are PASS.
There are some specific steps before doing test,
please refer to the comments in run-ptest.

Test results:
root@intel-x86-64:~# ptest-runner mariadb
START: ptest-runner
2023-09-14T15:17
BEGIN: /usr/lib64/mariadb/ptest
PASS: strings
PASS: json
PASS: simple
PASS: skip
PASS: todo
PASS: skip_all
PASS: no_plan
PASS: bitmap
PASS: base64
PASS: my_atomic
PASS: my_rdtsc
PASS: lf
PASS: my_malloc
PASS: my_getopt
PASS: dynstring
PASS: byte_order
PASS: queues
PASS: stacktrace
PASS: crc32
PASS: my_vsnprintf
PASS: aes
PASS: ma_dyncol
PASS: my_decimal
PASS: json_lib
PASS: json_normalize
PASS: my_apc
PASS: explain_filename
PASS: mf_iocache
PASS: my_json_writer
PASS: innodb_fts
PASS: innodb_sync
PASS: ma_control_file
PASS: trnman
PASS: ma_test_loghandler
PASS: ma_test_loghandler_multigroup
PASS: ma_test_loghandler_multithread
PASS: ma_test_loghandler_pagecache
PASS: ma_test_loghandler_long
PASS: ma_test_loghandler_noflush
PASS: ma_test_loghandler_first_lsn
PASS: ma_test_loghandler_max_lsn
PASS: ma_test_loghandler_purge
PASS: ma_test_loghandler_readonly
PASS: ma_test_loghandler_nologs
PASS: ma_pagecache_single_1k
PASS: ma_pagecache_single_8k
PASS: ma_pagecache_single_64k
PASS: ma_pagecache_consist_1k
PASS: ma_pagecache_consist_64k
PASS: ma_pagecache_consist_1kHC
PASS: ma_pagecache_consist_64kHC
PASS: ma_pagecache_consist_1kRD
PASS: ma_pagecache_consist_64kRD
PASS: ma_pagecache_consist_1kWR
PASS: ma_pagecache_consist_64kWR
PASS: ma_pagecache_rwconsist_1k
PASS: ma_pagecache_rwconsist2_1k
PASS: pfs_instr_class
PASS: pfs_instr_class-oom
PASS: pfs_instr
PASS: pfs_instr-oom
PASS: pfs_account-oom
PASS: pfs_host-oom
PASS: pfs_timer
PASS: pfs_user-oom
PASS: pfs_noop
PASS: pfs
PASS: pfs_misc
PASS: dbug
PASS: test-connect
DURATION: 60
END: /usr/lib64/mariadb/ptest
2023-09-14T15:18
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Chi Xu <chi.xu@windriver.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 meta-oe/recipes-dbs/mysql/mariadb/run-ptest   | 19 ++++++++++++
 meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb  | 31 +++++++++++++++++++
 3 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/run-ptest

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 06f3e16054..cafc43e011 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -49,6 +49,7 @@ PTESTS_SLOW_META_OE = "\
     fftw \
     libusb-compat \
     rsyslog \
+    mariadb \
 "
 
 PTESTS_PROBLEMS_META_OE ="\
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/run-ptest b/meta-oe/recipes-dbs/mysql/mariadb/run-ptest
new file mode 100644
index 0000000000..57201035d4
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+# Becasue test case test-connect, please do following steps before testing.
+# Without these steps, test case test-connect will fail.
+# 1. Disable 'skip-networking' in /etc/my.cnf
+#    $ sed -i '/skip-networking/s/^/#/g' /etc/my.cnf
+# 2. Restart mysqld.service
+#    $ systemctl restart mysqld
+# 3. Set password for MySQL user "root"
+#    $ mysql -u root
+#    MariaDB [(none)]> SET PASSWORD FOR 'root'@localhost = PASSWORD("myReallyStrongPwd");
+#    MariaDB [(none)]> FLUSH PRIVILEGES;
+
+export MASTER_MYPORT=3306
+export MYSQL_TEST_HOST=127.0.0.1
+export MYSQL_TEST_USER=root
+export MYSQL_TEST_PASSWD=myReallyStrongPwd
+
+ctest --force-new-ctest-process | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
index 87faabfa27..2ef4e89064 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
@@ -1,5 +1,36 @@
 require mariadb.inc
 
+inherit ptest
+SRC_URI += "${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)}"
+DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'rsync-native', '', d)}"
+RDEPENDS:${PN}-ptest += "cmake"
+
+do_install_ptest () {
+    rsync -a ${B}/unittest ${B}/dbug ${D}${PTEST_PATH} \
+          --exclude CMakeFiles \
+          --exclude cmake_install.cmake \
+          --exclude Makefile \
+          --exclude=*.a \
+          --exclude=*.h \
+          --exclude=*.o \
+          --exclude=*.so \
+          --exclude=*.d \
+          --exclude=*.txt
+    install -m 0755 -d ${D}${PTEST_PATH}/storage
+    rsync -a ${B}/storage/maria ${B}/storage/perfschema ${B}/storage/innobase ${D}${PTEST_PATH}/storage \
+          --exclude CMakeFiles \
+          --exclude cmake_install.cmake \
+          --exclude Makefile \
+          --exclude=*.a \
+          --exclude=*.h \
+          --exclude=*.o \
+          --exclude=*.so \
+          --exclude=*.d \
+          --exclude=*.txt
+    cp -r ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
+    sed -i -e 's#${WORKDIR}##g' `find ${D}${PTEST_PATH} -name CTestTestfile.cmake`
+}
+
 DEPENDS += "mariadb-native bison-native boost libpcre2 curl ncurses \
             zlib libaio libedit libevent libxml2 gnutls fmt lzo zstd"
 
-- 
2.25.1


