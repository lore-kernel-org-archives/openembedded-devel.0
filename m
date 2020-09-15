Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.9385.1600161589977856517
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 02:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: haiqing.bai@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08F9Jmdr023316
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 02:19:48 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 15 Sep 2020
 02:19:35 -0700
From: "haiqing" <haiqing.bai@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <haiqing.bai@windriver.com>
Subject: [oe][meta-oe][zeus][PATCH] rsyslog: fix wrong option of PACKAGECONFIG[valgrind]
Date: Tue, 15 Sep 2020 17:18:49 +0800
Message-ID: <20200915091850.215655-1-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The source configure.ac shows:
--enable-valgrind: Enable somes special code that rsyslog core developers
                   consider useful for testing.Do NOT use if you don't
                   exactly know what you are doing, except if told so
                   by rsyslog developers.
                   NOT to be used by distro maintainers for building regular
                   packages.

--without-valgrind-testbench:
                   Don't use valgrind in testbench

PACKAGECONFIG[valgrind] should use '--without-valgrind-testbench'
And after this fix, the code which removes the valgrind depended
ptest cases for arm,mips is no longer needed.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
index 8287d2b7f..5b8af8d37 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
@@ -74,7 +74,7 @@ PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
 PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
 PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
 PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
-PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
+PACKAGECONFIG[valgrind] = ",--without-valgrind-testbench,valgrind,"
 
 TESTDIR = "tests"
 do_compile_ptest() {
@@ -98,12 +98,6 @@ do_install_ptest() {
     # fix the abs_top_builddir
     sed -i 's,^\(abs_top_builddir = \).*,\1${PTEST_PATH}/,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
 
-    # valgrind is not compatible with arm and mips,
-    # so remove related test cases if there is no valgrind.
-    if [ x${VALGRIND} = x ]; then
-        sed -i '/udp-msgreduc-/d' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
-    fi
-
     # install test-driver
     install -m 644 ${S}/test-driver ${D}${PTEST_PATH}
 
-- 
2.23.0

