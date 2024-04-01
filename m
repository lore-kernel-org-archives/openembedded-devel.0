Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED9BCD1283
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 09:22:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33605.1711963349281107989
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 02:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lmk/BCpj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4821fd9b1d=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4315q3S2009309;
	Mon, 1 Apr 2024 09:22:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=jKymX
	cWirprjjmOtD/02bjvBtUc2z1JtR7Yn+S2b02M=; b=lmk/BCpjzWcqlCeN3nvvL
	os9YhtTAftEMIAdyB7+JdLEnlyXk/Foti7OFv/5wnhXUKgX8NWK/UlV7WthSOq8L
	kaVUpOInUkDIAVG1/WebFVvciYMdB9t+vZgK61dzyYtFhfzhrXxaXJicprikI+S0
	njQt9pzbmfhk5Oh9vlZlq9bBo38Ls6+0V8xOAnnRFIY8kJoRe0WP5K1RevJ8Orj3
	Sf5FM5ulTJK1WBceZ0fXGdYjEYIXJvrF+X53hcdY4qEWA6jDbNwFquv93kvhQOZv
	AaYYlxzulkmcd2ie/jBspv5lAqH+ur4Zm5VEkRrxqaxlsVlPcxIVdRjq7312n0IN
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x69q6sq5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 01 Apr 2024 09:22:27 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 1 Apr 2024 02:22:25 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Mon, 1 Apr 2024 02:22:25 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] freeradius: 3.0.26 -> 3.2.3
Date: Mon, 1 Apr 2024 02:22:25 -0700
Message-ID: <20240401092225.3866820-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7SIHnRP-lh9J7n_Iat9mB5zTf9Ck9O9g
X-Proofpoint-GUID: 7SIHnRP-lh9J7n_Iat9mB5zTf9Ck9O9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_06,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404010067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 09:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109697

From: Robert Yang <liezhi.yang@windriver.com>

* Add --without-rlm_json to fix:
  configure: error: set --without-rlm_json to disable it explicitly

* Add --without-rlm_cache_redis to fix:
  configure: error: set --without-rlm_cache_redis to disable it explicitly.

* Drop 0017-add-python.m4-for-detecting-python-3.10.patch and add
  0017-Add-acinclude.m4-to-include-required-macros.patch to fix python3 related
  build errors

* Rebased other patches for 3.2.3.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...configure.ac-allow-cross-compilation.patch |  32 +-
 .../0006-Avoid-searching-host-dirs.patch      | 331 +++++++-------
 ..._python-add-PY_INC_DIR-in-search-dir.patch |  19 +-
 ...ncludedir-instead-of-hardcoding-usr-.patch |  21 +-
 ...nclude.m4-to-include-required-macros.patch |  61 +++
 ...-python.m4-for-detecting-python-3.10.patch | 427 ------------------
 ...eeradius_3.0.26.bb => freeradius_3.2.3.bb} |   9 +-
 7 files changed, 278 insertions(+), 622 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0017-Add-acinclude.m4-to-include-required-macros.patch
 delete mode 100644 meta-networking/recipes-connectivity/freeradius/files/0017-add-python.m4-for-detecting-python-3.10.patch
 rename meta-networking/recipes-connectivity/freeradius/{freeradius_3.0.26.bb => freeradius_3.2.3.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch b/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
index e5442360b..3635412d3 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0003-configure.ac-allow-cross-compilation.patch
@@ -12,26 +12,28 @@ Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 
-update to new version 3.0.17 to fix patch warning
+Update to new version 3.0.17 to fix patch warning
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Rebased for 3.2.3
+Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
  src/modules/rlm_krb5/configure.ac | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/modules/rlm_krb5/configure.ac b/src/modules/rlm_krb5/configure.ac
-index a0f510cfb3..d2f3eca03e 100644
+index 9ee6379ea4..1dad481da8 100644
 --- a/src/modules/rlm_krb5/configure.ac
 +++ b/src/modules/rlm_krb5/configure.ac
-@@ -140,7 +140,8 @@ if test x$with_[]modname != xno; then
- 		FR_SMART_CHECK_LIB(krb5, krb5_is_thread_safe)
- 		if test "x$ac_cv_lib_krb5_krb5_is_thread_safe" = xyes; then
- 			AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <krb5.h>]], [[return krb5_is_thread_safe() ? 0 : 1]])],
--				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])])
-+				[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])],
-+				[AC_MSG_WARN(cross compiling: not checking)])
- 		fi
- 	else
- 		krb5threadsafe=""
--- 
-2.25.1
-
+@@ -143,7 +143,8 @@ if test "$krb5threadsafe" != "no"; then
+ 	FR_SMART_CHECK_LIB(krb5, krb5_is_thread_safe)
+ 	if test "x$ac_cv_lib_krb5_krb5_is_thread_safe" = xyes; then
+ 		AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <krb5.h>]], [[return krb5_is_thread_safe() ? 0 : 1]])],
+-			[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])])
++			[krb5threadsafe="-DKRB5_IS_THREAD_SAFE"], [AC_MSG_WARN([[libkrb5 is not threadsafe]])],
++			[AC_MSG_WARN(cross compiling: not checking)])
+ 	fi
+ else
+ 	krb5threadsafe=""
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch b/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
index 8fd0dca44..510136da1 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0006-Avoid-searching-host-dirs.patch
@@ -10,189 +10,214 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+Rebased for 3.2.3
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- acinclude.m4                                                | 4 ++--
- src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac        | 4 ++--
- src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac   | 4 ++--
- src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac      | 4 ++--
- src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac      | 6 +++---
- src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac     | 2 +-
- src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac | 4 ++--
- src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac   | 4 ++--
- 8 files changed, 16 insertions(+), 16 deletions(-)
+ m4/fr_smart_check_include.m4                                |    2 +-
+ m4/fr_smart_check_lib.m4                                    |   22 ----------------------
+ src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac        |    4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac   |    4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac      |    4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac      |    6 +++---
+ src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac     |    2 +-
+ src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac |    4 ++--
+ src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac   |    4 ++--
+ 9 files changed, 15 insertions(+), 37 deletions(-)
 
-diff --git a/acinclude.m4 b/acinclude.m4
-index a953d0e1b6..ede143d3c2 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -115,7 +115,7 @@ dnl #
- dnl #  Try to guess possible locations.
- dnl #
- if test "x$smart_lib" = "x"; then
--  for try in /usr/local/lib /opt/lib; do
-+  for try in $smart_lib_dir; do
-     AC_MSG_CHECKING([for $2 in -l$1 in $try])
-     LIBS="-l$1 $old_LIBS"
-     CPPFLAGS="-L$try -Wl,-rpath,$try $old_CPPFLAGS"
-@@ -155,7 +155,7 @@ ac_safe=`echo "$1" | sed 'y%./+-%__pm%'`
+diff --git a/m4/fr_smart_check_include.m4 b/m4/fr_smart_check_include.m4
+index e7d4443f9c..2b69704f98 100644
+--- a/m4/fr_smart_check_include.m4
++++ b/m4/fr_smart_check_include.m4
+@@ -9,7 +9,7 @@ ac_safe=`echo "$1" | sed 'y%./+-%__pm%'`
  old_CPPFLAGS="$CPPFLAGS"
  smart_include=
  dnl #  The default directories we search in (in addition to the compilers search path)
 -smart_include_dir="/usr/local/include /opt/include"
-+smart_include_dir=
++smart_include_dir=""
  
  dnl #  Our local versions
  _smart_try_dir=
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
-index 44f84aa27e..23a1899591 100644
+index 0d94ee9bf6..6108e62054 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_db2/configure.ac
-@@ -61,14 +61,14 @@ if test x$with_[]modname != xno; then
- 		esac])
- 
- 	dnl Check for SQLConnect in -ldb2
--	smart_try_dir="$ibmdb2_lib_dir /usr/local/db2/lib /usr/IBMdb2/V7.1/lib"
-+	smart_try_dir="$ibmdb2_lib_dir"
- 	FR_SMART_CHECK_LIB(db2, SQLConnect)
- 	if test "x$ac_cv_lib_db2_SQLConnect" != xyes; then
- 		fail="$fail libdb2"
- 	fi
- 
- 	dnl Check for sqlcli.h
--	smart_try_dir="$ibmdb2_include_dir /usr/local/db2/include /usr/IBMdb2/V7.1/include"
-+	smart_try_dir="$ibmdb2_include_dir"
- 	FR_SMART_CHECK_INCLUDE(sqlcli.h)
- 	if test "x$ac_cv_header_sqlcli_h" != xyes; then
- 		fail="$fail sqlcli.h"
+@@ -58,14 +58,14 @@ AC_ARG_WITH(ibmdb2-dir,
+ 	esac])
+ 
+ dnl Check for SQLConnect in -ldb2
+-smart_try_dir="$ibmdb2_lib_dir /usr/local/db2/lib /usr/IBMdb2/V7.1/lib"
++smart_try_dir="$ibmdb2_lib_dir"
+ FR_SMART_CHECK_LIB(db2, SQLConnect)
+ if test "x$ac_cv_lib_db2_SQLConnect" != xyes; then
+ 	FR_MODULE_FAIL([libdb2])
+ fi
+ 
+ dnl Check for sqlcli.h
+-smart_try_dir="$ibmdb2_include_dir /usr/local/db2/include /usr/IBMdb2/V7.1/include"
++smart_try_dir="$ibmdb2_include_dir"
+ FR_SMART_CHECK_INCLUDE(sqlcli.h)
+ if test "x$ac_cv_header_sqlcli_h" != xyes; then
+ 	FR_MODULE_FAIL([sqlcli.h])
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
-index 4c2fd7ba9e..10c864def5 100644
+index 5aa7b4b6ee..2eda5b6cc5 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_firebird/configure.ac
-@@ -60,14 +60,14 @@ if test x$with_[]modname != xno; then
- 		esac])
- 
- 	dnl Check for isc_attach_database in -lfbclient
--	smart_try_dir="$firebird_lib_dir /usr/lib/firebird2/lib /usr/local/firebird/lib"
-+	smart_try_dir="$firebird_lib_dir"
- 	FR_SMART_CHECK_LIB(fbclient, isc_attach_database)
- 	if test "x$ac_cv_lib_fbclient_isc_attach_database" != xyes; then
- 		fail="$fail libfbclient"
- 	fi
- 
- 	dnl Check for ibase.h
--	smart_try_dir="$firebird_include_dir /usr/lib/firebird2/include /usr/local/firebird/include"
-+	smart_try_dir="$firebird_include_dir"
- 	FR_SMART_CHECK_INCLUDE(ibase.h)
- 	if test "x$ac_cv_header_ibase_h" != xyes; then
- 		fail="$fail ibase.h"
+@@ -58,14 +58,14 @@ AC_ARG_WITH(firebird-dir,
+ 	esac])
+ 
+ dnl Check for isc_attach_database in -lfbclient
+-smart_try_dir="$firebird_lib_dir /usr/lib/firebird2/lib /usr/local/firebird/lib"
++smart_try_dir="$firebird_lib_dir"
+ FR_SMART_CHECK_LIB(fbclient, isc_attach_database)
+ if test "x$ac_cv_lib_fbclient_isc_attach_database" != xyes; then
+ 	FR_MODULE_FAIL([libfbclient])
+ fi
+ 
+ dnl Check for ibase.h
+-smart_try_dir="$firebird_include_dir /usr/lib/firebird2/include /usr/local/firebird/include"
++smart_try_dir="$firebird_include_dir"
+ FR_SMART_CHECK_INCLUDE(ibase.h)
+ if test "x$ac_cv_header_ibase_h" != xyes; then
+ 	FR_MODULE_FAIL([ibase.h])
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
-index d26ac9c431..6e4500e948 100644
+index d96216aca8..88cbc469f7 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_iodbc/configure.ac
-@@ -61,14 +61,14 @@ if test x$with_[]modname != xno; then
- 		esac])
- 
- 	dnl Check for SQLConnect in -liodbc
--	smart_try_dir="$iodbc_lib_dir /usr/lib /usr/lib/iodbc /usr/local/lib/iodbc /usr/local/iodbc/lib/iodbc"
-+	smart_try_dir="$iodbc_lib_dir"
- 	FR_SMART_CHECK_LIB(iodbc, SQLConnect)
- 	if test "x$ac_cv_lib_iodbc_SQLConnect" != xyes; then
- 		fail="$fail libiodbc"
- 	fi
- 
- 	dnl Check for isql.h
--	smart_try_dir="$iodbc_include_dir /usr/include /usr/include/iodbc /usr/local/iodbc/include"
-+	smart_try_dir="$iodbc_include_dir"
- 	FR_SMART_CHECK_INCLUDE(isql.h)
- 	if test "x$ac_cv_header_isql_h" != xyes; then
- 		fail="$fail isql.h"
+@@ -58,14 +58,14 @@ AC_ARG_WITH(iodbc-dir,
+ 	esac])
+ 
+ dnl Check for SQLConnect in -liodbc
+-smart_try_dir="$iodbc_lib_dir /usr/lib /usr/lib/iodbc /usr/local/lib/iodbc /usr/local/iodbc/lib/iodbc"
++smart_try_dir="$iodbc_lib_dir"
+ FR_SMART_CHECK_LIB(iodbc, SQLConnect)
+ if test "x$ac_cv_lib_iodbc_SQLConnect" != xyes; then
+ 	FR_MODULE_FAIL([libiodbc])
+ fi
+ 
+ dnl Check for isql.h
+-smart_try_dir="$iodbc_include_dir /usr/include /usr/include/iodbc /usr/local/iodbc/include"
++smart_try_dir="$iodbc_include_dir"
+ FR_SMART_CHECK_INCLUDE(isql.h)
+ if test "x$ac_cv_header_isql_h" != xyes; then
+ 	FR_MODULE_FAIL([isql.h])
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
-index df36da77bf..31359041c7 100644
+index d36aecbda6..201a623d4e 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_mysql/configure.ac
-@@ -140,7 +140,7 @@ if test x$with_[]modname != xno; then
- 
- 	dnl # Check for libmysqlclient_r
- 	if test "x$have_a_libmysqlclient" != "xyes"; then
--	    smart_try_dir="$mysql_lib_dir /usr/lib /usr/lib/mysql /usr/local/lib/mysql /usr/local/mysql/lib/mysql"
-+	    smart_try_dir="$mysql_lib_dir"
- 	    FR_SMART_CHECK_LIB(mysqlclient_r, mysql_init)
- 	    if test "x$ac_cv_lib_mysqlclient_r_mysql_init" = "xyes"; then
- 			have_a_libmysqlclient='yes'
-@@ -149,7 +149,7 @@ if test x$with_[]modname != xno; then
- 
- 	dnl # Check for libmysqlclient
- 	if test "x$have_a_libmysqlclient" != "xyes"; then
--	    smart_try_dir="$mysql_lib_dir /usr/lib /usr/lib/mysql /usr/local/lib/mysql /usr/local/mysql/lib/mysql"
-+	    smart_try_dir="$mysql_lib_dir"
- 	    FR_SMART_CHECK_LIB(mysqlclient, mysql_init)
- 	    if test "x$ac_cv_lib_mysqlclient_mysql_init" = "xyes"; then
- 			have_a_libmysqlclient='yes'
-@@ -243,7 +243,7 @@ if test x$with_[]modname != xno; then
-     fi
- 
-     if test "x$have_mysql_h" != "xyes"; then
--		smart_try_dir="$mysql_include_dir /usr/local/include /usr/local/mysql/include"
-+		smart_try_dir="$mysql_include_dir"
- 		FR_SMART_CHECK_INCLUDE(mysql/mysql.h)
- 		if test "x$ac_cv_header_mysql_mysql_h" = "xyes"; then
- 	    	AC_DEFINE(HAVE_MYSQL_MYSQL_H, [], [Define if you have <mysql/mysql.h>])
+@@ -138,7 +138,7 @@ fi
+ 
+ dnl # Check for libmysqlclient_r
+ if test "x$have_a_libmysqlclient" != "xyes"; then
+-    smart_try_dir="$mysql_lib_dir /usr/lib /usr/lib/mysql /usr/local/lib/mysql /usr/local/mysql/lib/mysql"
++    smart_try_dir="$mysql_lib_dir"
+     FR_SMART_CHECK_LIB(mysqlclient_r, mysql_init)
+     if test "x$ac_cv_lib_mysqlclient_r_mysql_init" = "xyes"; then
+ 		have_a_libmysqlclient='yes'
+@@ -147,7 +147,7 @@ fi
+ 
+ dnl # Check for libmysqlclient
+ if test "x$have_a_libmysqlclient" != "xyes"; then
+-    smart_try_dir="$mysql_lib_dir /usr/lib /usr/lib/mysql /usr/local/lib/mysql /usr/local/mysql/lib/mysql"
++    smart_try_dir="$mysql_lib_dir"
+     FR_SMART_CHECK_LIB(mysqlclient, mysql_init)
+     if test "x$ac_cv_lib_mysqlclient_mysql_init" = "xyes"; then
+ 		have_a_libmysqlclient='yes'
+@@ -242,7 +242,7 @@ if test "x$have_mysql_h" != "xyes"; then
+ fi
+ 
+ if test "x$have_mysql_h" != "xyes"; then
+-	smart_try_dir="$mysql_include_dir /usr/local/include /usr/local/mysql/include"
++	smart_try_dir="$mysql_include_dir"
+ 	FR_SMART_CHECK_INCLUDE(mysql/mysql.h)
+ 	if test "x$ac_cv_header_mysql_mysql_h" = "xyes"; then
+ 	AC_DEFINE(HAVE_MYSQL_MYSQL_H, [], [Define if you have <mysql/mysql.h>])
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
-index 3b45da582a..03e6607d2b 100644
+index f31b7d2c5a..67bbf66df5 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_oracle/configure.ac
-@@ -68,7 +68,7 @@ if test x$with_[]modname != xno; then
-     dnl # Check for header files
-     dnl ############################################################
+@@ -66,7 +66,7 @@ dnl ############################################################
+ dnl # Check for header files
+ dnl ############################################################
  
--    smart_try_dir="$oracle_include_dir /usr/local/instaclient/include"
-+    smart_try_dir="$oracle_include_dir"
+-smart_try_dir="$oracle_include_dir /usr/local/instaclient/include"
++smart_try_dir="$oracle_include_dir"
  
-     if test "x$ORACLE_HOME" != "x"; then
+ if test "x$ORACLE_HOME" != "x"; then
  	smart_try_dir="${smart_try_dir} ${ORACLE_HOME}/include"
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
-index 8ac1022e89..d46c0f66bf 100644
+index 46587e4099..b41c51bda7 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_postgresql/configure.ac
-@@ -45,7 +45,7 @@ if test x$with_[]modname != xno; then
- 	  esac ]
- 	)
- 
--	smart_try_dir="$rlm_sql_postgresql_include_dir /usr/include/postgresql /usr/local/pgsql/include /usr/include/pgsql"
-+	smart_try_dir="$rlm_sql_postgresql_include_dir"
- 	FR_SMART_CHECK_INCLUDE(libpq-fe.h)
- 	if test "x$ac_cv_header_libpqmfe_h" != "xyes"; then
- 		fail="$fail libpq-fe.h"
-@@ -94,7 +94,7 @@ if test x$with_[]modname != xno; then
- 		  ])
- 	fi
- 
--	smart_try_dir="$rlm_sql_postgresql_lib_dir /usr/lib /usr/local/pgsql/lib"
-+	smart_try_dir="$rlm_sql_postgresql_lib_dir"
- 	FR_SMART_CHECK_LIB(pq, PQconnectdb)
- 	if test "x$ac_cv_lib_pq_PQconnectdb" != "xyes"; then
- 		fail="$fail libpq"
+@@ -43,7 +43,7 @@ AC_ARG_WITH(rlm-sql-postgresql-include-dir,
+ 		;;
+ 	esac])
+ 
+-smart_try_dir="$rlm_sql_postgresql_include_dir /usr/include/postgresql /usr/local/pgsql/include /usr/include/pgsql"
++smart_try_dir="$rlm_sql_postgresql_include_dir"
+ FR_SMART_CHECK_INCLUDE(libpq-fe.h)
+ if test "x$ac_cv_header_libpqmfe_h" != "xyes"; then
+ 	FR_MODULE_FAIL([libpq-fe.h])
+@@ -95,7 +95,7 @@ else
+ 		])
+ fi
+ 
+-smart_try_dir="$rlm_sql_postgresql_lib_dir /usr/lib /usr/local/pgsql/lib"
++smart_try_dir="$rlm_sql_postgresql_lib_dir"
+ FR_SMART_CHECK_LIB(pq, PQconnectdb)
+ if test "x$ac_cv_lib_pq_PQconnectdb" != "xyes"; then
+ 	FR_MODULE_FAIL([libpq])
 diff --git a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
-index f10279fe1f..0081a338c8 100644
+index 3bdfae6032..ce68c312c6 100644
 --- a/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
 +++ b/src/modules/rlm_sql/drivers/rlm_sql_unixodbc/configure.ac
-@@ -61,14 +61,14 @@ if test x$with_[]modname != xno; then
- 		esac])
- 
- 	dnl Check for SQLConnect in -lodbc
--	smart_try_dir="$unixodbc_lib_dir /usr/local/unixodbc/lib"
-+	smart_try_dir="$unixodbc_lib_dir"
- 	FR_SMART_CHECK_LIB(odbc, SQLConnect)
- 	if test "x$ac_cv_lib_odbc_SQLConnect" != xyes; then
- 		fail="$fail libodbc"
- 	fi
- 
- 	dnl Check for sql.h
--	smart_try_dir="$unixodbc_include_dir /usr/local/unixodbc/include"
-+	smart_try_dir="$unixodbc_include_dir"
- 	FR_SMART_CHECK_INCLUDE(sql.h)
- 	if test "x$ac_cv_header_sql_h" != xyes; then
- 		fail="$fail sql.h"
--- 
-2.25.1
-
+@@ -58,14 +58,14 @@ AC_ARG_WITH(unixodbc-dir,
+ 	esac])
+ 
+ dnl Check for SQLConnect in -lodbc
+-smart_try_dir="$unixodbc_lib_dir /usr/local/unixodbc/lib"
++smart_try_dir="$unixodbc_lib_dir"
+ FR_SMART_CHECK_LIB(odbc, SQLConnect)
+ if test "x$ac_cv_lib_odbc_SQLConnect" != xyes; then
+ 	FR_MODULE_FAIL([libodbc])
+ fi
+ 
+ dnl Check for sql.h
+-smart_try_dir="$unixodbc_include_dir /usr/local/unixodbc/include"
++smart_try_dir="$unixodbc_include_dir"
+ FR_SMART_CHECK_INCLUDE(sql.h)
+ if test "x$ac_cv_header_sql_h" != xyes; then
+ 	FR_MODULE_FAIL([sql.h])
+diff --git a/m4/fr_smart_check_lib.m4 b/m4/fr_smart_check_lib.m4
+index 16ac5b3c5e..0f5e9fc6d6 100644
+--- a/m4/fr_smart_check_lib.m4
++++ b/m4/fr_smart_check_lib.m4
+@@ -64,28 +64,6 @@ if test "x$smart_lib" = "x"; then
+   LIBS="$old_LIBS"
+ fi
+ 
+-dnl #
+-dnl #  Try to guess possible locations.
+-dnl #
+-if test "x$smart_lib" = "x"; then
+-  for try in /usr/local/lib /opt/lib; do
+-    AC_MSG_CHECKING([for $2 in -l$1 in $try])
+-    LIBS="-l$1 $old_LIBS"
+-    CPPFLAGS="-L$try -Wl,-rpath,$try $old_CPPFLAGS"
+-    AC_TRY_LINK([extern char $2();],
+-		[$2()],
+-		[
+-		  smart_lib="-l$1"
+-		  smart_ldflags="-L$try -Wl,-rpath,$try"
+-		  AC_MSG_RESULT(yes)
+-		  break
+-		],
+-		[AC_MSG_RESULT(no)])
+-  done
+-  LIBS="$old_LIBS"
+-  CPPFLAGS="$old_CPPFLAGS"
+-fi
+-
+ dnl #
+ dnl #  Found it, set the appropriate variable.
+ dnl #
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch b/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
index cb71fb137..78259d7d7 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0007-rlm_python-add-PY_INC_DIR-in-search-dir.patch
@@ -16,18 +16,15 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/modules/rlm_python/configure.ac b/src/modules/rlm_python/configure.ac
-index 08ecb62518..d5c0944ff1 100644
+index c79c327064..5f4d274990 100644
 --- a/src/modules/rlm_python/configure.ac
 +++ b/src/modules/rlm_python/configure.ac
-@@ -98,7 +98,7 @@ if test x$with_[]modname != xno; then
+@@ -103,7 +103,7 @@ FR_MODULE_TEST_PASS_DO([
  
- 		old_CFLAGS=$CFLAGS
- 		CFLAGS="$CFLAGS $PY_CFLAGS"
--		smart_try_dir="$PY_PREFIX/include/python$PY_SYS_VERSION"
-+		smart_try_dir="$PY_PREFIX/include/python$PY_SYS_VERSION $PY_INC_DIR"
- 		FR_SMART_CHECK_INCLUDE(Python.h)
- 		CFLAGS=$old_CFLAGS
+ 	old_CFLAGS=$CFLAGS
+ 	CFLAGS="$CFLAGS $PY_CFLAGS"
+-	smart_try_dir="$PY_PREFIX/include/python$PY_SYS_VERSION"
++	smart_try_dir="$PY_PREFIX/include/python$PY_SYS_VERSION $PY_INC_DIR"
+ 	FR_SMART_CHECK_INCLUDE(Python.h)
+ 	CFLAGS=$old_CFLAGS
  
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch b/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
index 69125eb3c..efa5c53c9 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0011-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch
@@ -14,18 +14,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/modules/rlm_mschap/configure.ac b/src/modules/rlm_mschap/configure.ac
-index 0fd105d7e6..6ab15509e5 100644
+index 953336f475..77a18af55d 100644
 --- a/src/modules/rlm_mschap/configure.ac
 +++ b/src/modules/rlm_mschap/configure.ac
-@@ -75,7 +75,7 @@ if test x$with_[]modname != xno; then
-         mod_ldflags="-F /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks -framework DirectoryService"
-     fi
+@@ -77,7 +77,7 @@ else
+         FR_MODULE_FEATURE([opendirectory], [without opendirectory support])
+ fi
  
--    smart_try_dir="$winbind_include_dir /usr/include/samba-4.0"
-+    smart_try_dir="$winbind_include_dir =/usr/include/samba-4.0"
-     FR_SMART_CHECK_INCLUDE(wbclient.h, [#include <stdint.h>
- 					#include <stdbool.h>])
-     if test "x$ac_cv_header_wbclient_h" != "xyes"; then
--- 
-2.25.1
-
+-smart_try_dir="$winbind_include_dir /usr/include/samba-4.0"
++smart_try_dir="$winbind_include_dir =/usr/include/samba-4.0"
+ FR_SMART_CHECK_INCLUDE(wbclient.h, [#include <stdint.h>
+ 				#include <stdbool.h>])
+ if test "x$ac_cv_header_wbclient_h" != "xyes"; then
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0017-Add-acinclude.m4-to-include-required-macros.patch b/meta-networking/recipes-connectivity/freeradius/files/0017-Add-acinclude.m4-to-include-required-macros.patch
new file mode 100644
index 000000000..f5c399e58
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0017-Add-acinclude.m4-to-include-required-macros.patch
@@ -0,0 +1,61 @@
+From 40abff4062d0521cf2b2a8a4660a3d2933f86f9d Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 1 Apr 2024 09:09:07 +0000
+Subject: [PATCH] Add acinclude.m4 to include required macros
+
+* These micro files are in the m4 directories, but the aclocal didn't
+  add them to aclocal.m4 automatically, so add them to acinclude.m4
+  manually.
+
+* The runlog.m4 is added for python.m4.
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ acinclude.m4 |  8 ++++++++
+ m4/runlog.m4 | 17 +++++++++++++++++
+ 2 files changed, 25 insertions(+)
+ create mode 100644 acinclude.m4
+ create mode 100644 m4/runlog.m4
+
+diff --git a/acinclude.m4 b/acinclude.m4
+new file mode 100644
+index 0000000000..118b7f0e5f
+--- /dev/null
++++ b/acinclude.m4
+@@ -0,0 +1,8 @@
++m4_include([m4/fr_init_module.m4])
++m4_include([m4/ax_with_prog.m4])
++m4_include([m4/runlog.m4])
++m4_include([m4/python.m4])
++m4_include([m4/ax_compare_version.m4])
++m4_include([m4/libcurl_check_config.m4])
++m4_include([m4/ax_ruby_devel.m4])
++m4_include([m4/ax_prog_ruby_version.m4])
+diff --git a/m4/runlog.m4 b/m4/runlog.m4
+new file mode 100644
+index 0000000000..690efc3258
+--- /dev/null
++++ b/m4/runlog.m4
+@@ -0,0 +1,17 @@
++##                                                          -*- Autoconf -*-
++# Copyright (C) 2001-2018 Free Software Foundation, Inc.
++#
++# This file is free software; the Free Software Foundation
++# gives unlimited permission to copy and/or distribute it,
++# with or without modifications, as long as this notice is preserved.
++
++# AM_RUN_LOG(COMMAND)
++# -------------------
++# Run COMMAND, save the exit status in ac_status, and log it.
++# (This has been adapted from Autoconf's _AC_RUN_LOG macro.)
++AC_DEFUN([AM_RUN_LOG],
++[{ echo "$as_me:$LINENO: $1" >&AS_MESSAGE_LOG_FD
++   ($1) >&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_LOG_FD
++   ac_status=$?
++   echo "$as_me:$LINENO: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
++   (exit $ac_status); }])
+-- 
+2.35.5
+
diff --git a/meta-networking/recipes-connectivity/freeradius/files/0017-add-python.m4-for-detecting-python-3.10.patch b/meta-networking/recipes-connectivity/freeradius/files/0017-add-python.m4-for-detecting-python-3.10.patch
deleted file mode 100644
index 62a4869c9..000000000
--- a/meta-networking/recipes-connectivity/freeradius/files/0017-add-python.m4-for-detecting-python-3.10.patch
+++ /dev/null
@@ -1,427 +0,0 @@
-From f1418e1b46cb1cbd130935b76f5c78c577d1ad28 Mon Sep 17 00:00:00 2001
-From: Matthew Newton <matthew-git@newtoncomputing.co.uk>
-Date: Wed, 28 Sep 2022 23:49:32 +0100
-Subject: [PATCH] add python.m4 for detecting python > 3.10
-
-Upstream-Status: Backport
-[https://github.com/FreeRADIUS/freeradius-server/commit/86584d2753829756cc73aadce5d48f703af472b1]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/modules/rlm_python3/configure.ac |   4 +
- src/modules/rlm_python3/m4/python.m4 | 363 +++++++++++++++++++++++++++
- src/modules/rlm_python3/m4/runlog.m4 |  17 ++
- 3 files changed, 384 insertions(+)
- create mode 100644 src/modules/rlm_python3/m4/python.m4
- create mode 100644 src/modules/rlm_python3/m4/runlog.m4
-
-diff --git a/src/modules/rlm_python3/configure.ac b/src/modules/rlm_python3/configure.ac
-index bc0e97f9ba..90f2116e73 100644
---- a/src/modules/rlm_python3/configure.ac
-+++ b/src/modules/rlm_python3/configure.ac
-@@ -3,6 +3,10 @@ AC_INIT(rlm_python3.c)
- AC_REVISION($Revision$)
- AC_DEFUN(modname,[rlm_python3])
- 
-+m4_include([ax_compare_version.m4])
-+m4_include([runlog.m4])
-+m4_include([python.m4])
-+
- AC_ARG_WITH([]modname,
- [  --with-[]modname              build []modname. (default=yes)])
- 
-diff --git a/src/modules/rlm_python3/m4/python.m4 b/src/modules/rlm_python3/m4/python.m4
-new file mode 100644
-index 0000000000..78ca7635ab
---- /dev/null
-+++ b/src/modules/rlm_python3/m4/python.m4
-@@ -0,0 +1,363 @@
-+## ------------------------                                 -*- Autoconf -*-
-+## Python file handling
-+## From Andrew Dalke
-+## Updated by James Henstridge and other contributors.
-+## ------------------------
-+# Copyright (C) 1999-2021 Free Software Foundation, Inc.
-+#
-+# This file is free software; the Free Software Foundation
-+# gives unlimited permission to copy and/or distribute it,
-+# with or without modifications, as long as this notice is preserved.
-+
-+
-+# AM_PATH_PYTHON([MINIMUM-VERSION], [ACTION-IF-FOUND], [ACTION-IF-NOT-FOUND])
-+# ---------------------------------------------------------------------------
-+# Adds support for distributing Python modules and packages.  To
-+# install modules, copy them to $(pythondir), using the python_PYTHON
-+# automake variable.  To install a package with the same name as the
-+# automake package, install to $(pkgpythondir), or use the
-+# pkgpython_PYTHON automake variable.
-+#
-+# The variables $(pyexecdir) and $(pkgpyexecdir) are provided as
-+# locations to install python extension modules (shared libraries).
-+# Another macro is required to find the appropriate flags to compile
-+# extension modules.
-+#
-+# If your package is configured with a different prefix to python,
-+# users will have to add the install directory to the PYTHONPATH
-+# environment variable, or create a .pth file (see the python
-+# documentation for details).
-+#
-+# If the MINIMUM-VERSION argument is passed, AM_PATH_PYTHON will
-+# cause an error if the version of python installed on the system
-+# doesn't meet the requirement.  MINIMUM-VERSION should consist of
-+# numbers and dots only.
-+AC_DEFUN([AM_PATH_PYTHON],
-+ [
-+  dnl Find a Python interpreter.  Python versions prior to 2.0 are not
-+  dnl supported. (2.0 was released on October 16, 2000).
-+  m4_define_default([_AM_PYTHON_INTERPRETER_LIST],
-+[python python2 python3 dnl
-+ python3.11 python3.10 dnl
-+ python3.9 python3.8 python3.7 python3.6 python3.5 python3.4 python3.3 dnl
-+ python3.2 python3.1 python3.0 dnl
-+ python2.7 python2.6 python2.5 python2.4 python2.3 python2.2 python2.1 dnl
-+ python2.0])
-+
-+  AC_ARG_VAR([PYTHON], [the Python interpreter])
-+
-+  m4_if([$1],[],[
-+    dnl No version check is needed.
-+    # Find any Python interpreter.
-+    if test -z "$PYTHON"; then
-+      AC_PATH_PROGS([PYTHON], _AM_PYTHON_INTERPRETER_LIST, :)
-+    fi
-+    am_display_PYTHON=python
-+  ], [
-+    dnl A version check is needed.
-+    if test -n "$PYTHON"; then
-+      # If the user set $PYTHON, use it and don't search something else.
-+      AC_MSG_CHECKING([whether $PYTHON version is >= $1])
-+      AM_PYTHON_CHECK_VERSION([$PYTHON], [$1],
-+			      [AC_MSG_RESULT([yes])],
-+			      [AC_MSG_RESULT([no])
-+			       AC_MSG_ERROR([Python interpreter is too old])])
-+      am_display_PYTHON=$PYTHON
-+    else
-+      # Otherwise, try each interpreter until we find one that satisfies
-+      # VERSION.
-+      AC_CACHE_CHECK([for a Python interpreter with version >= $1],
-+	[am_cv_pathless_PYTHON],[
-+	for am_cv_pathless_PYTHON in _AM_PYTHON_INTERPRETER_LIST none; do
-+	  test "$am_cv_pathless_PYTHON" = none && break
-+	  AM_PYTHON_CHECK_VERSION([$am_cv_pathless_PYTHON], [$1], [break])
-+	done])
-+      # Set $PYTHON to the absolute path of $am_cv_pathless_PYTHON.
-+      if test "$am_cv_pathless_PYTHON" = none; then
-+	PYTHON=:
-+      else
-+        AC_PATH_PROG([PYTHON], [$am_cv_pathless_PYTHON])
-+      fi
-+      am_display_PYTHON=$am_cv_pathless_PYTHON
-+    fi
-+  ])
-+
-+  if test "$PYTHON" = :; then
-+    dnl Run any user-specified action, or abort.
-+    m4_default([$3], [AC_MSG_ERROR([no suitable Python interpreter found])])
-+  else
-+
-+  dnl Query Python for its version number.  Although site.py simply uses
-+  dnl sys.version[:3], printing that failed with Python 3.10, since the
-+  dnl trailing zero was eliminated. So now we output just the major
-+  dnl and minor version numbers, as numbers. Apparently the tertiary
-+  dnl version is not of interest.
-+  dnl
-+  AC_CACHE_CHECK([for $am_display_PYTHON version], [am_cv_python_version],
-+    [am_cv_python_version=`$PYTHON -c "import sys; print ('%u.%u' % sys.version_info[[:2]])"`])
-+  AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
-+
-+  dnl At times, e.g., when building shared libraries, you may want
-+  dnl to know which OS platform Python thinks this is.
-+  dnl
-+  AC_CACHE_CHECK([for $am_display_PYTHON platform], [am_cv_python_platform],
-+    [am_cv_python_platform=`$PYTHON -c "import sys; sys.stdout.write(sys.platform)"`])
-+  AC_SUBST([PYTHON_PLATFORM], [$am_cv_python_platform])
-+
-+  dnl emacs-page
-+  dnl If --with-python-sys-prefix is given, use the values of sys.prefix
-+  dnl and sys.exec_prefix for the corresponding values of PYTHON_PREFIX
-+  dnl and PYTHON_EXEC_PREFIX. Otherwise, use the GNU ${prefix} and
-+  dnl ${exec_prefix} variables.
-+  dnl
-+  dnl The two are made distinct variables so they can be overridden if
-+  dnl need be, although general consensus is that you shouldn't need
-+  dnl this separation.
-+  dnl
-+  dnl Also allow directly setting the prefixes via configure options,
-+  dnl overriding any default.
-+  dnl
-+  if test "x$prefix" = xNONE; then
-+    am__usable_prefix=$ac_default_prefix
-+  else
-+    am__usable_prefix=$prefix
-+  fi
-+
-+  # Allow user to request using sys.* values from Python,
-+  # instead of the GNU $prefix values.
-+  AC_ARG_WITH([python-sys-prefix],
-+  [AS_HELP_STRING([--with-python-sys-prefix],
-+                  [use Python's sys.prefix and sys.exec_prefix values])],
-+  [am_use_python_sys=:],
-+  [am_use_python_sys=false])
-+
-+  # Allow user to override whatever the default Python prefix is.
-+  AC_ARG_WITH([python_prefix],
-+  [AS_HELP_STRING([--with-python_prefix],
-+                  [override the default PYTHON_PREFIX])],
-+  [am_python_prefix_subst=$withval
-+   am_cv_python_prefix=$withval
-+   AC_MSG_CHECKING([for explicit $am_display_PYTHON prefix])
-+   AC_MSG_RESULT([$am_cv_python_prefix])],
-+  [
-+   if $am_use_python_sys; then
-+     # using python sys.prefix value, not GNU
-+     AC_CACHE_CHECK([for python default $am_display_PYTHON prefix],
-+     [am_cv_python_prefix],
-+     [am_cv_python_prefix=`$PYTHON -c "import sys; sys.stdout.write(sys.prefix)"`])
-+
-+     dnl If sys.prefix is a subdir of $prefix, replace the literal value of
-+     dnl $prefix with a variable reference so it can be overridden.
-+     case $am_cv_python_prefix in
-+     $am__usable_prefix*)
-+       am__strip_prefix=`echo "$am__usable_prefix" | sed 's|.|.|g'`
-+       am_python_prefix_subst=`echo "$am_cv_python_prefix" | sed "s,^$am__strip_prefix,\\${prefix},"`
-+       ;;
-+     *)
-+       am_python_prefix_subst=$am_cv_python_prefix
-+       ;;
-+     esac
-+   else # using GNU prefix value, not python sys.prefix
-+     am_python_prefix_subst='${prefix}'
-+     am_python_prefix=$am_python_prefix_subst
-+     AC_MSG_CHECKING([for GNU default $am_display_PYTHON prefix])
-+     AC_MSG_RESULT([$am_python_prefix])
-+   fi])
-+  # Substituting python_prefix_subst value.
-+  AC_SUBST([PYTHON_PREFIX], [$am_python_prefix_subst])
-+
-+  # emacs-page Now do it all over again for Python exec_prefix, but with yet
-+  # another conditional: fall back to regular prefix if that was specified.
-+  AC_ARG_WITH([python_exec_prefix],
-+  [AS_HELP_STRING([--with-python_exec_prefix],
-+                  [override the default PYTHON_EXEC_PREFIX])],
-+  [am_python_exec_prefix_subst=$withval
-+   am_cv_python_exec_prefix=$withval
-+   AC_MSG_CHECKING([for explicit $am_display_PYTHON exec_prefix])
-+   AC_MSG_RESULT([$am_cv_python_exec_prefix])],
-+  [
-+   # no explicit --with-python_exec_prefix, but if
-+   # --with-python_prefix was given, use its value for python_exec_prefix too.
-+   AS_IF([test -n "$with_python_prefix"],
-+   [am_python_exec_prefix_subst=$with_python_prefix
-+    am_cv_python_exec_prefix=$with_python_prefix
-+    AC_MSG_CHECKING([for python_prefix-given $am_display_PYTHON exec_prefix])
-+    AC_MSG_RESULT([$am_cv_python_exec_prefix])],
-+   [
-+    # Set am__usable_exec_prefix whether using GNU or Python values,
-+    # since we use that variable for pyexecdir.
-+    if test "x$exec_prefix" = xNONE; then
-+      am__usable_exec_prefix=$am__usable_prefix
-+    else
-+      am__usable_exec_prefix=$exec_prefix
-+    fi
-+    #
-+    if $am_use_python_sys; then # using python sys.exec_prefix, not GNU
-+      AC_CACHE_CHECK([for python default $am_display_PYTHON exec_prefix],
-+      [am_cv_python_exec_prefix],
-+      [am_cv_python_exec_prefix=`$PYTHON -c "import sys; sys.stdout.write(sys.exec_prefix)"`])
-+      dnl If sys.exec_prefix is a subdir of $exec_prefix, replace the
-+      dnl literal value of $exec_prefix with a variable reference so it can
-+      dnl be overridden.
-+      case $am_cv_python_exec_prefix in
-+      $am__usable_exec_prefix*)
-+        am__strip_prefix=`echo "$am__usable_exec_prefix" | sed 's|.|.|g'`
-+        am_python_exec_prefix_subst=`echo "$am_cv_python_exec_prefix" | sed "s,^$am__strip_prefix,\\${exec_prefix},"`
-+        ;;
-+      *)
-+        am_python_exec_prefix_subst=$am_cv_python_exec_prefix
-+        ;;
-+     esac
-+   else # using GNU $exec_prefix, not python sys.exec_prefix
-+     am_python_exec_prefix_subst='${exec_prefix}'
-+     am_python_exec_prefix=$am_python_exec_prefix_subst
-+     AC_MSG_CHECKING([for GNU default $am_display_PYTHON exec_prefix])
-+     AC_MSG_RESULT([$am_python_exec_prefix])
-+   fi])])
-+  # Substituting python_exec_prefix_subst.
-+  AC_SUBST([PYTHON_EXEC_PREFIX], [$am_python_exec_prefix_subst])
-+
-+  # Factor out some code duplication into this shell variable.
-+  am_python_setup_sysconfig="\
-+import sys
-+# Prefer sysconfig over distutils.sysconfig, for better compatibility
-+# with python 3.x.  See automake bug#10227.
-+try:
-+    import sysconfig
-+except ImportError:
-+    can_use_sysconfig = 0
-+else:
-+    can_use_sysconfig = 1
-+# Can't use sysconfig in CPython 2.7, since it's broken in virtualenvs:
-+# <https://github.com/pypa/virtualenv/issues/118>
-+try:
-+    from platform import python_implementation
-+    if python_implementation() == 'CPython' and sys.version[[:3]] == '2.7':
-+        can_use_sysconfig = 0
-+except ImportError:
-+    pass"
-+
-+  dnl emacs-page Set up 4 directories:
-+
-+  dnl 1. pythondir: where to install python scripts.  This is the
-+  dnl    site-packages directory, not the python standard library
-+  dnl    directory like in previous automake betas.  This behavior
-+  dnl    is more consistent with lispdir.m4 for example.
-+  dnl Query distutils for this directory.
-+  dnl
-+  AC_CACHE_CHECK([for $am_display_PYTHON script directory (pythondir)],
-+  [am_cv_python_pythondir],
-+  [if test "x$am_cv_python_prefix" = x; then
-+     am_py_prefix=$am__usable_prefix
-+   else
-+     am_py_prefix=$am_cv_python_prefix
-+   fi
-+   am_cv_python_pythondir=`$PYTHON -c "
-+$am_python_setup_sysconfig
-+if can_use_sysconfig:
-+  if hasattr(sysconfig, 'get_default_scheme'):
-+    scheme = sysconfig.get_default_scheme()
-+  else:
-+    scheme = sysconfig._get_default_scheme()
-+  if scheme == 'posix_local':
-+    # Debian's default scheme installs to /usr/local/ but we want to find headers in /usr/
-+    scheme = 'posix_prefix'
-+  sitedir = sysconfig.get_path('purelib', scheme, vars={'base':'$am_py_prefix'})
-+else:
-+  from distutils import sysconfig
-+  sitedir = sysconfig.get_python_lib(0, 0, prefix='$am_py_prefix')
-+sys.stdout.write(sitedir)"`
-+   #
-+   case $am_cv_python_pythondir in
-+   $am_py_prefix*)
-+     am__strip_prefix=`echo "$am_py_prefix" | sed 's|.|.|g'`
-+     am_cv_python_pythondir=`echo "$am_cv_python_pythondir" | sed "s,^$am__strip_prefix,\\${PYTHON_PREFIX},"`
-+     ;;
-+   *)
-+     case $am_py_prefix in
-+       /usr|/System*) ;;
-+       *) am_cv_python_pythondir="\${PYTHON_PREFIX}/lib/python$PYTHON_VERSION/site-packages"
-+          ;;
-+     esac
-+     ;;
-+   esac
-+  ])
-+  AC_SUBST([pythondir], [$am_cv_python_pythondir])
-+
-+  dnl 2. pkgpythondir: $PACKAGE directory under pythondir.  Was
-+  dnl    PYTHON_SITE_PACKAGE in previous betas, but this naming is
-+  dnl    more consistent with the rest of automake.
-+  dnl
-+  AC_SUBST([pkgpythondir], [\${pythondir}/$PACKAGE])
-+
-+  dnl 3. pyexecdir: directory for installing python extension modules
-+  dnl    (shared libraries).
-+  dnl Query distutils for this directory.
-+  dnl
-+  AC_CACHE_CHECK([for $am_display_PYTHON extension module directory (pyexecdir)],
-+  [am_cv_python_pyexecdir],
-+  [if test "x$am_cv_python_exec_prefix" = x; then
-+     am_py_exec_prefix=$am__usable_exec_prefix
-+   else
-+     am_py_exec_prefix=$am_cv_python_exec_prefix
-+   fi
-+   am_cv_python_pyexecdir=`$PYTHON -c "
-+$am_python_setup_sysconfig
-+if can_use_sysconfig:
-+  if hasattr(sysconfig, 'get_default_scheme'):
-+    scheme = sysconfig.get_default_scheme()
-+  else:
-+    scheme = sysconfig._get_default_scheme()
-+  if scheme == 'posix_local':
-+    # Debian's default scheme installs to /usr/local/ but we want to find headers in /usr/
-+    scheme = 'posix_prefix'
-+  sitedir = sysconfig.get_path('platlib', scheme, vars={'platbase':'$am_py_exec_prefix'})
-+else:
-+  from distutils import sysconfig
-+  sitedir = sysconfig.get_python_lib(1, 0, prefix='$am_py_exec_prefix')
-+sys.stdout.write(sitedir)"`
-+   #
-+   case $am_cv_python_pyexecdir in
-+   $am_py_exec_prefix*)
-+     am__strip_prefix=`echo "$am_py_exec_prefix" | sed 's|.|.|g'`
-+     am_cv_python_pyexecdir=`echo "$am_cv_python_pyexecdir" | sed "s,^$am__strip_prefix,\\${PYTHON_EXEC_PREFIX},"`
-+     ;;
-+   *)
-+     case $am_py_exec_prefix in
-+       /usr|/System*) ;;
-+       *) am_cv_python_pyexecdir="\${PYTHON_EXEC_PREFIX}/lib/python$PYTHON_VERSION/site-packages"
-+          ;;
-+     esac
-+     ;;
-+   esac
-+  ])
-+  AC_SUBST([pyexecdir], [$am_cv_python_pyexecdir])
-+
-+  dnl 4. pkgpyexecdir: $(pyexecdir)/$(PACKAGE)
-+  dnl
-+  AC_SUBST([pkgpyexecdir], [\${pyexecdir}/$PACKAGE])
-+
-+  dnl Run any user-specified action.
-+  $2
-+  fi
-+])
-+
-+
-+# AM_PYTHON_CHECK_VERSION(PROG, VERSION, [ACTION-IF-TRUE], [ACTION-IF-FALSE])
-+# ---------------------------------------------------------------------------
-+# Run ACTION-IF-TRUE if the Python interpreter PROG has version >= VERSION.
-+# Run ACTION-IF-FALSE otherwise.
-+# This test uses sys.hexversion instead of the string equivalent (first
-+# word of sys.version), in order to cope with versions such as 2.2c1.
-+# This supports Python 2.0 or higher. (2.0 was released on October 16, 2000).
-+AC_DEFUN([AM_PYTHON_CHECK_VERSION],
-+ [prog="import sys
-+# split strings by '.' and convert to numeric.  Append some zeros
-+# because we need at least 4 digits for the hex conversion.
-+# map returns an iterator in Python 3.0 and a list in 2.x
-+minver = list(map(int, '$2'.split('.'))) + [[0, 0, 0]]
-+minverhex = 0
-+# xrange is not present in Python 3.0 and range returns an iterator
-+for i in list(range(0, 4)): minverhex = (minverhex << 8) + minver[[i]]
-+sys.exit(sys.hexversion < minverhex)"
-+  AS_IF([AM_RUN_LOG([$1 -c "$prog"])], [$3], [$4])])
-diff --git a/src/modules/rlm_python3/m4/runlog.m4 b/src/modules/rlm_python3/m4/runlog.m4
-new file mode 100644
-index 0000000000..690efc3258
---- /dev/null
-+++ b/src/modules/rlm_python3/m4/runlog.m4
-@@ -0,0 +1,17 @@
-+##                                                          -*- Autoconf -*-
-+# Copyright (C) 2001-2018 Free Software Foundation, Inc.
-+#
-+# This file is free software; the Free Software Foundation
-+# gives unlimited permission to copy and/or distribute it,
-+# with or without modifications, as long as this notice is preserved.
-+
-+# AM_RUN_LOG(COMMAND)
-+# -------------------
-+# Run COMMAND, save the exit status in ac_status, and log it.
-+# (This has been adapted from Autoconf's _AC_RUN_LOG macro.)
-+AC_DEFUN([AM_RUN_LOG],
-+[{ echo "$as_me:$LINENO: $1" >&AS_MESSAGE_LOG_FD
-+   ($1) >&AS_MESSAGE_LOG_FD 2>&AS_MESSAGE_LOG_FD
-+   ac_status=$?
-+   echo "$as_me:$LINENO: \$? = $ac_status" >&AS_MESSAGE_LOG_FD
-+   (exit $ac_status); }])
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
rename to meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb
index e3730cfaa..7ea63a65d 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.26.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.3.bb
@@ -13,7 +13,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 DEPENDS = "openssl-native openssl libidn libtool libpcap libtalloc"
 
-SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0;;protocol=https \
+SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.2.x;lfs=0;;protocol=https \
     file://freeradius \
     file://volatiles.58_radiusd \
     file://radiusd.service \
@@ -34,12 +34,12 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://0014-Workaround-error-with-autoconf-2.7.patch \
     file://0015-bootstrap-check-commands-of-openssl-exist.patch \
     file://0016-version.c-don-t-print-build-flags.patch \
-    file://0017-add-python.m4-for-detecting-python-3.10.patch \
+    file://0017-Add-acinclude.m4-to-include-required-macros.patch \
 "
 
 raddbdir = "${sysconfdir}/${MLPREFIX}raddb"
 
-SRCREV = "d956f683d37ea40e7977cc5907361f3e6988a439"
+SRCREV = "db3d1924d9a2e8d37c43872932621f69cfdbb099"
 
 UPSTREAM_CHECK_GITTAGREGEX = "release_(?P<pver>\d+(\_\d+)+)"
 
@@ -69,6 +69,7 @@ EXTRA_OECONF = " --enable-strict-dependencies \
         --without-rlm_opendirectory \
         --without-rlm_redis \
         --without-rlm_rediswho \
+        --without-rlm_cache_redis \
         --without-rlm_sql_db2 \
         --without-rlm_sql_firebird \
         --without-rlm_sql_freetds \
@@ -103,7 +104,7 @@ PACKAGECONFIG[postgresql] = "--with-rlm_sql_postgresql,--without-rlm_sql_postgre
 PACKAGECONFIG[pcre] = "--with-pcre,--without-pcre,libpcre"
 PACKAGECONFIG[perl] = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --with-rlm_perl,--without-rlm_perl,perl-native perl,perl"
 PACKAGECONFIG[python3] = "--with-rlm_python3 --with-rlm-python3-bin=${STAGING_BINDIR_NATIVE}/python3-native/python3 --with-rlm-python3-include-dir=${STAGING_INCDIR}/${PYTHON_DIR},--without-rlm_python3,python3-native python3"
-PACKAGECONFIG[rest] = "--with-rlm_rest,--without-rlm_rest,curl json-c"
+PACKAGECONFIG[rest] = "--with-rlm_rest,--without-rlm_rest --without-rlm_json,curl json-c"
 PACKAGECONFIG[ruby] = "--with-rlm_ruby,--without-rlm_ruby,ruby"
 PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl"
 PACKAGECONFIG[rlm-eap-fast] = "--with-rlm_eap_fast, --without-rlm_eap_fast"
-- 
2.42.0


