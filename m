Return-Path: <chi.xu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034BACD37B3
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 05:52:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.25967.1694929959706514186
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Sep 2023 22:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nSUQri/8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=76249d0b61=chi.xu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38H5jBDf016056
	for <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 22:52:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=verMj
	EOOFcYQdXeoz/IH0W5XzbxzwKLAc5CQFOHXvC8=; b=nSUQri/8MUsV+mjMlzu7A
	SBbMIghkZuNzJTyjw7bRx3jlD7Tg5v7/2dxkbX4qeExr9mhX9UefBEoekuIu+CyE
	CDYHQn9Up8UDw9YKSVddlwTr8uJsxlC1yo6/mIb5dK3/6s2KOUzGSo7EWcvZTJwf
	9piYYdnllRLFF3fr4ErxtmpE8X3ddXaSgIRpwEd8vZ8FoqRF8ddq2J2NnQUXQ8iy
	0bEsTVoZ/eXKjFInYUsGv5kP04TvPVv5uXZJSBe2fkCvOVx5KjNLgBCDqadcZ3gS
	Gjo/nOnrQskxCclwbUCFfO1jxIOaaNkkn7eBrYBCLq1UxldexQnkAbyb9ELjeKi+
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t5bvfrbv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 16 Sep 2023 22:52:38 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Sat, 16 Sep 2023 22:52:37 -0700
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Sat, 16 Sep 2023 22:52:37 -0700
From: Chi Xu <chi.xu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] mariadb: Add ptest support
Date: Sun, 17 Sep 2023 13:52:37 +0800
Message-ID: <20230917055237.1038105-1-chi.xu@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aplVhIyNt_hW0RUQQSMTwszBsf0-bMw_
X-Proofpoint-ORIG-GUID: aplVhIyNt_hW0RUQQSMTwszBsf0-bMw_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_20,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309170052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 05:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104906

69 test cases in all, and all of them are PASS.

Test results:
root@intel-x86-64:~# ptest-runner mariadb
START: ptest-runner
2023-09-17T05:38
BEGIN: /usr/lib/mariadb/ptest
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
DURATION: 59
END: /usr/lib/mariadb/ptest
2023-09-17T05:39
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Chi Xu <chi.xu@windriver.com>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 +
 meta-oe/recipes-dbs/mysql/mariadb/run-ptest   | 20 ++++++++++++
 meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb  | 31 +++++++++++++++++++
 3 files changed, 52 insertions(+)
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
index 0000000000..2f905cd379
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/run-ptest
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# test case test-connect is excluded. Becasue this test case need following steps before running.
+# Without these steps, test case test-connect will fail.
+# 1. Disable 'skip-networking' in /etc/my.cnf
+#    $ sed -i '/skip-networking/s/^/#/g' /etc/my.cnf
+# 2. Restart mysqld.service
+#    $ systemctl restart mysqld
+# 3. Set password for MySQL user "root"
+#    $ mysql -u root
+#    MariaDB [(none)]> SET PASSWORD FOR "root"@"localhost" = PASSWORD("myReallyStrongPwd");
+#    MariaDB [(none)]> FLUSH PRIVILEGES;
+
+# If test-connect is included, please uncomment these lines.
+#export MASTER_MYPORT=3306
+#export MYSQL_TEST_HOST=127.0.0.1
+#export MYSQL_TEST_USER=root
+#export MYSQL_TEST_PASSWD=myReallyStrongPwd
+
+ctest --force-new-ctest-process -E test-connect | sed -u 's/\*\*\*/   /g' | awk '/Test +#/{gsub(/Passed/,"PASS"); gsub(/Failed/,"FAIL"); gsub(/Skipped/,"SKIP"); print $6": "$4; fflush();}'
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
index 87faabfa27..a4498fa44e 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.11.5.bb
@@ -1,5 +1,36 @@
 require mariadb.inc
 
+inherit ptest
+SRC_URI += "${@bb.utils.contains('PTEST_ENABLED', '1', 'file://run-ptest', '', d)}"
+DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'rsync-native', '', d)}"
+RDEPENDS:${PN}-ptest += "cmake sed perl-module-test-more"
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
2.35.5


