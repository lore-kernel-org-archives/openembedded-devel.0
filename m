Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6166607AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Sep 2018 08:25:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8U8PU3b009022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 30 Sep 2018 01:25:30 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 30 Sep 2018 01:25:29 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Sun, 30 Sep 2018 16:25:28 +0800
Message-ID: <1538295928-350356-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: avoid recompiling program during running ptest
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Sep 2018 08:25:30 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* Previously there is below logic in rsyslog-8.37.0/tests/Makefile
  check-TESTS:

  After below commit in automake,
  8555e7b81 check: Make 'check-TESTS' target depend on test dependencies
  the logic changes to the below:
  check-TESTS: $(check_PROGRAMS)

  It will result in compiling program on
  target when run ptest on target, but
  actually there is no need to rebuild the
  program on target, so change it back to
  "check-TESTS:" to avoid recompiling.

* Update the path of abs_top_builddir
  to guarantee the test env is correct.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb
index fb15142..fbdf281 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.37.0.bb
@@ -86,10 +86,14 @@ do_install_ptest() {
 
     # do NOT need to rebuild Makefile itself
     sed -i 's/^Makefile:.*$/Makefile:/' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+    # do NOT need to rebuild $(check_PROGRAMS)
+    sed -i 's/^check-TESTS:.*$/check-TESTS:/' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
 
     # fix the srcdir, top_srcdir
     sed -i 's,^\(srcdir = \).*,\1${PTEST_PATH}/tests,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
     sed -i 's,^\(top_srcdir = \).*,\1${PTEST_PATH}/tests,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
+    # fix the abs_top_builddir
+    sed -i 's,^\(abs_top_builddir = \).*,\1${PTEST_PATH}/,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
 
     # valgrind is not compatible with arm and mips,
     # so remove related test cases if there is no valgrind.
-- 
2.7.4


