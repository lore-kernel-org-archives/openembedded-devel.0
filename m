Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9C4D71DEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Sep 2017 02:24:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v852OvB5024075
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Sep 2017 19:24:57 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 4 Sep 2017 19:24:55 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Sep 2017 10:24:10 +0800
Message-ID: <1504578250-4534-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-oe][PATCH] psqlodbc: add recipe
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
X-List-Received-Date: Tue, 05 Sep 2017 02:24:55 -0000
Content-Type: text/plain

This package provides a driver that allows ODBC-enabled applications to
access PostgreSQL database.

This recipe was removed in commit
ec9e5ed06256ad92c818474cdb490dc0d3a0d0a3

Since its dependency postgresql already unblacklisted, so add it back.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../psqlodbc-donot-use-the-hardcode-libdir.patch   |  26 ++++
 .../files/psqlodbc-fix-for-ptest-support.patch     | 148 +++++++++++++++++++++
 ...bc-remove-some-checks-for-cross-compiling.patch | 118 ++++++++++++++++
 meta-oe/recipes-support/psqlodbc/psqlodbc.inc      |  50 +++++++
 .../psqlodbc/psqlodbc_09.05.0300.bb                |  14 ++
 5 files changed, 356 insertions(+)
 create mode 100644 meta-oe/recipes-support/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
 create mode 100644 meta-oe/recipes-support/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
 create mode 100644 meta-oe/recipes-support/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch
 create mode 100644 meta-oe/recipes-support/psqlodbc/psqlodbc.inc
 create mode 100644 meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb

diff --git a/meta-oe/recipes-support/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch b/meta-oe/recipes-support/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
new file mode 100644
index 0000000..7eda038
--- /dev/null
+++ b/meta-oe/recipes-support/psqlodbc/files/psqlodbc-donot-use-the-hardcode-libdir.patch
@@ -0,0 +1,26 @@
+[PATCH] do not use the hardcode libdir
+
+Upstream-status: Pending
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9b88d4c..df5ad7a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -140,7 +140,7 @@ if test "$with_libpq" != yes; then
+ 	if test -d "$with_libpq"; then
+ 		PATH="$PATH:$with_libpq/bin"
+ 		CPPFLAGS="$CPPFLAGS -I$with_libpq/include"
+-		LDFLAGS="$LDFLAGS -L$with_libpq/lib"
++		LDFLAGS="$LDFLAGS -L$with_libpq/${base_libdir}"
+ 	else
+ 		if test -x "$with_libpq"; then
+ 			PG_CONFIG=$with_libpq
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch b/meta-oe/recipes-support/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
new file mode 100644
index 0000000..a8f14e7
--- /dev/null
+++ b/meta-oe/recipes-support/psqlodbc/files/psqlodbc-fix-for-ptest-support.patch
@@ -0,0 +1,148 @@
+Subject: [PATCH] psqlodbc: fixes for ptest support
+
+* Fix the LIBODBC since we don't use ODBC_CONFIG.
+* Fix the path for driver.
+* Add the default info of postgresql server.
+* Fix the output format for ptest.
+* Fix the results and exe dir.
+
+Upstream-Status: Inappropriate [OE ptest specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ test/Makefile.in    |  2 +-
+ test/odbcini-gen.sh |  8 ++++----
+ test/runsuite.c     | 26 +++++++++++++-------------
+ 3 files changed, 18 insertions(+), 18 deletions(-)
+
+diff --git a/test/Makefile.in b/test/Makefile.in
+index 8710616..fcb470e 100644
+--- a/test/Makefile.in
++++ b/test/Makefile.in
+@@ -18,7 +18,7 @@ CFLAGS = @CFLAGS@
+ ODBC_CONFIG = @ODBC_CONFIG@
+ PROVE = @PROVE@
+ 
+-LIBODBC := $(shell $(ODBC_CONFIG) --libs)
++LIBODBC = -lodbc
+ 
+ all: $(TESTBINS) runsuite reset-db
+ 
+diff --git a/test/odbcini-gen.sh b/test/odbcini-gen.sh
+index d2c2c87..6068d9d 100755
+--- a/test/odbcini-gen.sh
++++ b/test/odbcini-gen.sh
+@@ -6,7 +6,7 @@
+ outini=odbc.ini
+ outinstini=odbcinst.ini
+ 
+-drvr=../.libs/psqlodbcw
++drvr=@LIBDIR@/psqlodbca
+ driver=${drvr}.so
+ if test ! -e $driver ; then
+ 	driver=${drvr}.dll
+@@ -33,10 +33,10 @@ Driver          = psqlodbc test driver
+ Trace           = No
+ TraceFile               =
+ Database                = contrib_regression
+-Servername              =
+-Username                =
++Servername              = localhost
++Username                = postgres
+ Password                =
+-Port                    =
++Port                    = 5432
+ ReadOnly                = No
+ RowVersioning           = No
+ ShowSystemTables                = No
+diff --git a/test/runsuite.c b/test/runsuite.c
+index 583cf35..fd2a90e 100644
+--- a/test/runsuite.c
++++ b/test/runsuite.c
+@@ -51,7 +51,7 @@ bailout(const char *fmt, ...)
+ 
+ /* Given a test program's name, get the test name */
+ void
+-parse_argument(const char *in, char *testname, char *binname)
++parse_argument(const char *in, char *testname, char *binname, const char *inputdir)
+ {
+ 	const char *basename;
+ #ifdef WIN32
+@@ -65,7 +65,7 @@ parse_argument(const char *in, char *testname, char *binname)
+ 	if (strchr(in, DIR_SEP) == NULL)
+ 	{
+ 		strcpy(testname, in);
+-		sprintf(binname, "exe%c%s-test", DIR_SEP, in);
++		sprintf(binname, "%s%cexe%c%s-test", inputdir, DIR_SEP, DIR_SEP, in);
+ 		return;
+ 	}
+ 
+@@ -127,7 +127,7 @@ int main(int argc, char **argv)
+ 	failures = 0;
+ 	for (i = 1, j = 1; i <= numtests; i++, j++)
+ 	{
+-		parse_argument(argv[j], testname, binname);
++		parse_argument(argv[j], testname, binname, inputdir);
+ 		if (runtest(binname, testname, i, inputdir) != 0)
+ 			failures++;
+ 	}
+@@ -157,29 +157,29 @@ runtest(const char *binname, const char *testname, int testno, const char *input
+ #ifndef WIN32
+ 	snprintf(cmdline, sizeof(cmdline),
+ 			 "ODBCSYSINI=. ODBCINSTINI=./odbcinst.ini ODBCINI=./odbc.ini "
+-			 "%s > results/%s.out",
+-			 binname, testname);
++			 "%s > %s/results/%s.out",
++			 binname, inputdir, testname);
+ #else
+ 	snprintf(cmdline, sizeof(cmdline),
+-			 "%s > results\\%s.out",
+-			 binname, testname);
++			 "%s > %s/results\\%s.out",
++			 binname, inputdir, testname);
+ #endif
+ 	rc = system(cmdline);
+ 
+ 	diff = rundiff(testname, inputdir);
+ 	if (rc != 0)
+ 	{
+-		printf("not ok %d - %s test returned %d\n", testno, testname, rc);
++		printf("FAIL: %d - %s\n\ttest returned %d\n", testno, testname, rc);
+ 		ret = 1;
+ 	}
+ 	else if (diff != 0)
+ 	{
+-		printf("not ok %d - %s test output differs\n", testno, testname);
++		printf("FAIL: %d - %s\n\ttest output differs\n", testno, testname);
+ 		ret = 1;
+ 	}
+ 	else
+ 	{
+-		printf("ok %d - %s\n", testno, testname);
++		printf("PASS: %d - %s\n", testno, testname);
+ 		ret = 0;
+ 	}
+ 	fflush(stdout);
+@@ -196,7 +196,7 @@ rundiff(const char *testname, const char *inputdir)
+ 	char	   *result;
+ 	size_t		result_len;
+ 
+-	snprintf(filename, sizeof(filename), "results/%s.out", testname);
++	snprintf(filename, sizeof(filename), "%s/results/%s.out", inputdir, testname);
+ 	result = slurpfile(filename, &result_len);
+ 
+ 	outputno = 0;
+@@ -244,8 +244,8 @@ rundiff(const char *testname, const char *inputdir)
+ 	 * files and print the smallest diff?
+ 	 */
+ 	snprintf(cmdline, sizeof(cmdline),
+-			 "diff -c %s/expected/%s.out results/%s.out >> regression.diffs",
+-			 inputdir, testname, testname);
++			 "diff -c %s/expected/%s.out %s/results/%s.out >> regression.diffs",
++			 inputdir, testname, inputdir, testname);
+ 	if (system(cmdline) == -1)
+ 		printf("# diff failed\n");
+ 
+-- 
+2.8.2
+
diff --git a/meta-oe/recipes-support/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch b/meta-oe/recipes-support/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch
new file mode 100644
index 0000000..1d98818
--- /dev/null
+++ b/meta-oe/recipes-support/psqlodbc/files/psqlodbc-remove-some-checks-for-cross-compiling.patch
@@ -0,0 +1,118 @@
+Subject: [PATCH] remove some checks for cross-compiling
+
+some lib check is not suitable for
+cross-compiling, so remove them.
+
+Upstream-Status: Inappropriate [not a real bug,just for cross-compiling]
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac | 66 +++++++-----------------------------------------------------
+ 1 file changed, 7 insertions(+), 59 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index df5ad7a..b72bd4c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -46,57 +46,19 @@ AC_ARG_WITH(iodbc, [  --with-iodbc[[=DIR]]	  [[default=no]] DIR is the iODBC bas
+ if test "$with_iodbc" != no; then
+ 	with_unixodbc=no
+ 	AC_DEFINE(WITH_IODBC, 1, [Define to 1 to build with iODBC support])
+-	if test "$with_iodbc" = yes; then
+-		AC_PATH_PROGS(ODBC_CONFIG, iodbc-config)
+-	else
+-		ODBC_CONFIG=$with_iodbc
+-	fi
+-	if test ! -x "${ODBC_CONFIG}/bin/iodbc-config"; then
+-		if test ! -x "${ODBC_CONFIG}"; then
+-			AC_MSG_ERROR([iodbc-config not found (required for iODBC build)])
+-		fi
+-	else
+-		ODBC_CONFIG=${ODBC_CONFIG}/bin/iodbc-config
+-	fi
+ fi
+ 
+ if test "$with_unixodbc" != no; then
+ 	AC_DEFINE(WITH_UNIXODBC, 1,
+             [Define to 1 to build with unixODBC support])
+-	if test "$with_unixodbc" = yes; then
+-		AC_PATH_PROGS(ODBC_CONFIG, odbc_config)
+-	else
+-		ODBC_CONFIG=$with_unixodbc
+-	fi
+-	if test ! -x "${ODBC_CONFIG}/bin/odbc_config"; then
+-		if test ! -x "${ODBC_CONFIG}"; then
+-			AC_MSG_ERROR([odbc_config not found (required for unixODBC build)])
+-		fi
+-	else
+-		ODBC_CONFIG=${ODBC_CONFIG}/bin/odbc_config
+-	fi
+ fi
+ 
+ #
+ # ODBC include and library
+ #
+-
+-if test "$ODBC_CONFIG" != ""; then
+-	if test "$with_iodbc" != no; then
+-		ODBC_INCLUDE=`${ODBC_CONFIG} --cflags`
+-		CPPFLAGS="$CPPFLAGS ${ODBC_INCLUDE}"
+-		# Linking libiodoc is rather problematic
+-		[ODBC_LIBDIR=`${ODBC_CONFIG} --libs | sed -e "s/^\(-L\|.*[ \t]-L\)\([^ \n\r\f\t]*\).*$/-L\2/"`]
+-		LDFLAGS="$LDFLAGS ${ODBC_LIBDIR}"
+-	else
+-		ODBC_INCLUDE=`${ODBC_CONFIG} --include-prefix`
+-		CPPFLAGS="$CPPFLAGS -I${ODBC_INCLUDE}"
+-		# Linking libodoc is rather problematic
+-		ODBC_LIBDIR=`${ODBC_CONFIG} --lib-prefix`
+-		LDFLAGS="$LDFLAGS -L${ODBC_LIBDIR}"
+-	fi
+-	AC_MSG_NOTICE([using $ODBC_INCLUDE $ODBC_LIBDIR])
+-fi
++ODBC_LIBS="-lodbcinst"
++LIBS="$LIBS ${ODBC_LIBS}"
++AC_MSG_NOTICE([using $ODBC_INCLUDE $ODBC_LIBS])
+ 
+ #
+ # SQLCOLATTRIBUTE_SQLLEN check
+@@ -176,18 +138,10 @@ PGAC_ARG_BOOL(enable, pthreads, yes,
+ # Find libpq headers and libraries
+ #
+ 
+-if test -z "$PG_CONFIG"; then
+-  AC_PATH_PROGS(PG_CONFIG, pg_config)
+-fi
+-
+-if test -n "$PG_CONFIG"; then
+-  pg_includedir=`"$PG_CONFIG" --includedir`
+-  pg_libdir=`"$PG_CONFIG" --libdir`
+-  CPPFLAGS="$CPPFLAGS -I$pg_includedir"
+-  LDFLAGS="$LDFLAGS -L$pg_libdir"
+-fi
+-
+-
++pg_includedir=""
++pg_libdir=""
++CPPFLAGS="$CPPFLAGS"
++LDFLAGS="$LDFLAGS"
+ 
+ # 1. Programs
+ 
+@@ -211,12 +165,6 @@ if test "$with_iodbc" != no; then
+                  [AC_MSG_ERROR([iODBC library "iodbcinst" not found])])
+ fi
+ 
+-if test "$enable_pthreads" = yes; then
+-  AC_CHECK_LIB(pthreads, pthread_create,
+-               [],
+-	       [AC_CHECK_LIB(pthread, pthread_create)])
+-fi
+-
+ AC_CHECK_LIB(pq, PQsetSingleRowMode, [],
+ 	      [AC_MSG_ERROR([libpq library version >= 9.2 is required])])
+ 
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-support/psqlodbc/psqlodbc.inc b/meta-oe/recipes-support/psqlodbc/psqlodbc.inc
new file mode 100644
index 0000000..5337b45
--- /dev/null
+++ b/meta-oe/recipes-support/psqlodbc/psqlodbc.inc
@@ -0,0 +1,50 @@
+SUMMARY = "ODBC driver for PostgreSQL"
+DESCRIPTION = "\
+ This package provides a driver that allows ODBC-enabled applications to \
+ access PostgreSQL databases.  ODBC is an abstraction layer that allows \
+ applications written for that layer to access databases in a manner \
+ that is relatively independent of the particular database management \
+ system. \
+ . \
+ You need to install this package if you want to use an application that \
+ provides database access through ODBC and you want that application to \
+ access a PostgreSQL database.  This package would need to be installed \
+ on the same machine as that client application; the PostgreSQL database \
+ server can be on a different machine and does not need any additional \
+ software to accept ODBC clients. \
+"
+SECTION = "libs"
+HOMEPAGE = "http://psqlodbc.projects.postgresql.org/"
+
+DEPENDS += "postgresql unixodbc"
+
+EXTRA_OECONF = "\
+    ac_cv_lib_ltdl_lt_dlopen=no \
+    ac_cv_lib_pq_PQconnectdb=yes \
+    --with-unixodbc=yes \
+    --with-libpq=${STAGING_LIBDIR}/.. \
+    --enable-pthreads \
+    --disable-unicode \
+    LIBS="-lpthread" \
+"
+
+inherit autotools pkgconfig ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/test
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    cp -a --no-preserve=ownership ${B}/test/exe ${S}/test/expected ${D}${PTEST_PATH}
+    install -m 0755 ${B}/test/reset-db ${D}${PTEST_PATH}
+    install -m 0755 ${B}/test/runsuite ${D}${PTEST_PATH}
+    install -m 0755 ${S}/test/odbcini-gen.sh ${D}${PTEST_PATH}
+    install -m 0755 ${S}/test/sampletables.sql ${D}${PTEST_PATH}
+    sed -i -e 's|@LIBDIR@|${libdir}|' ${D}${PTEST_PATH}/odbcini-gen.sh
+}
+
+FILES_${PN} += "${libdir}"
+
+# The tests need a local PostgreSQL server running
+RDEPENDS_${PN}-ptest = "postgresql"
diff --git a/meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb b/meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb
new file mode 100644
index 0000000..6e1c8ab
--- /dev/null
+++ b/meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb
@@ -0,0 +1,14 @@
+require ${PN}.inc
+
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://license.txt;md5=6db3822fc7512e83087ba798da013692"
+
+SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions/src/${BPN}-${PV}.tar.gz \
+    file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
+    file://psqlodbc-donot-use-the-hardcode-libdir.patch \
+    file://psqlodbc-fix-for-ptest-support.patch \
+    file://run-ptest \
+"
+
+SRC_URI[md5sum] = "4c6e0b22187d7bb1c998ffac89e50f6b"
+SRC_URI[sha256sum] = "9521f328bf28aaaf5c8488dc89792b614f9d6271742c0baf9bb41c97537764a8"
-- 
2.7.4


