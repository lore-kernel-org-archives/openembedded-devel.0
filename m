Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.234.1586563813789317865
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 17:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 03B0ABYr006358
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 17:10:11 -0700 (PDT)
Received: from vme.wrs.com (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Apr 2020
 17:10:10 -0700
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] rsyslog: 8.1911.0 -> 8.2002.0
Date: Fri, 10 Apr 2020 20:10:10 -0400
Message-ID: <20200411001010.2331-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add some error handling to run-ptests.

Fix up the new set-envvars script to that 36 new tests pass.
On qemux86-64/kvm the ptest results with extra filesystem
space and a timeout of 800 seconds are:
         1911   2002
 TOTAL:   389    408
 PASS:    339    357
 SKIP:     39     39
 XFAIL:     0      0
 FAIL:     11     12
 XPASS:     0      0
 ERROR:     0      0

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest          | 5 +++++
 .../rsyslog/{rsyslog_8.1911.0.bb => rsyslog_8.2002.0.bb}    | 6 ++++--
 2 files changed, 9 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.1911.0.bb => rsyslog_8.2002.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
index 3770a7506..aa698d85c 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/run-ptest
@@ -1,3 +1,8 @@
 #!/bin/sh
 #
+set -e
+set -o pipefail
+
+SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
+cd ${SCRIPTPATH}
 make -C tests -k check-TESTS
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb
index f82caf7b5..6a90614bf 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2002.0.bb
@@ -29,8 +29,8 @@ SRC_URI_append_libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[md5sum] = "154e33feb587216f2955050a8301104c"
-SRC_URI[sha256sum] = "e1f4776b1c62ad7220f4d624a89a96b0c3d4738006899356eaaef0f1f91ee104"
+SRC_URI[md5sum] = "fbe6d18205170e22bad470954d0dc874"
+SRC_URI[sha256sum] = "fe86c14d860da1202c76616feac0539ea5a40a4ad182d74b7d6d2419cc2381f8"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -131,6 +131,8 @@ do_install_ptest() {
     # fix the module load path with runtime/.libs
     find ${D}${PTEST_PATH}/${TESTDIR} -name "*.conf" -o -name "*.sh" -o -name "*.c" | xargs \
         sed -i -e 's:../plugins/.*/.libs/:../runtime/.libs/:g'
+    # fix the python3 path for tests/set-envar
+    sed -i -e s:${HOSTTOOLS_DIR}:${bindir}:g ${D}${PTEST_PATH}/tests/set-envvars
 }
 
 do_install_append() {
-- 
2.20.1

