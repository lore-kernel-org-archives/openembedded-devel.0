Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.2250.1595580554853807205
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2020 01:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 06O8nDmp019836
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2020 01:49:13 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 24 Jul 2020
 01:49:12 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mariadb: upgrade to 10.5.4
Date: Fri, 24 Jul 2020 01:49:12 -0700
Message-ID: <20200724084912.27693-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id 06O8nDmp019836
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From: Mingli Yu <mingli.yu@windriver.com>

* Remove one backported patch
* Remove SRC_URI[md5sum]
* Rebase two patches to fix fuzz warnings
* Add curl depends to fix below error:
  | ./mariadb-10.5.4/storage/maria/libmarias3/libmarias3/marias3.h:26:10:=
 fatal error: curl/curl.h: No such file or directory

* Fixes:
  | mv: cannot stat '/build/tmp/work/corei7-64-wrs-linux/mariadb/10.5.4-r=
0/image/lib/security': No such file or directory

* Disable rocksdb engine for arm64 to workaround undefined reference
  to `crc32c_arm64' as https://jira.mariadb.org/browse/MDEV-23137

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ve_10.4.12.bb =3D> mariadb-native_10.5.4.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         | 14 ++++---
 ...-breakage-from-lock_guard-error-6161.patch | 32 ----------------
 .../mysql/mariadb/c11_atomics.patch           | 37 +++++++++++++------
 ...Lists.txt-fix-gen_lex_hash-not-found.patch | 26 +++++++------
 .../{mariadb_10.4.12.bb =3D> mariadb_10.5.4.bb} |  2 +-
 6 files changed, 50 insertions(+), 61 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.12.bb =3D> mariadb=
-native_10.5.4.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-brea=
kage-from-lock_guard-error-6161.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.12.bb =3D> mariadb_10.5.4=
.bb} (87%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb b/meta-o=
e/recipes-dbs/mysql/mariadb-native_10.5.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index 95f5acba1..33649e8b7 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -18,11 +18,9 @@ SRC_URI =3D "https://downloads.mariadb.org/interstitia=
l/${BP}/source/${BP}.tar.gz
            file://c11_atomics.patch \
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
-           file://0001-Fix-build-breakage-from-lock_guard-error-6161.pat=
ch \
            file://0001-Fix-library-LZ4-lookup.patch \
           "
-SRC_URI[md5sum] =3D "97d7c0f508c04a31c138fdb24e95dbc4"
-SRC_URI[sha256sum] =3D "fef1e1d38aa253dd8a51006bd15aad184912fce31c446bb6=
9434fcde735aa208"
+SRC_URI[sha256sum] =3D "26db2becc9cec37e99a4e73390bd2eaa74568e21f9cf1103=
59f4f68b37154c72"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
=20
@@ -87,6 +85,10 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
                  -DCAT_EXECUTABLE=3D`which cat` \
                  -DCMAKE_AR:FILEPATH=3D${AR}"
=20
+# disable rocksdb engine for arm64 to workaround the undefined reference=
 to `crc32c_arm64(unsigned int, unsigned char const*, unsigned int)'
+# check https://jira.mariadb.org/browse/MDEV-23137 for more details
+EXTRA_OECMAKE_append_aarch64 =3D " -DPLUGIN_ROCKSDB=3DNO"
+
 # With Ninja it fails with:
 # make: *** No rule to make target `install'.  Stop.
 OECMAKE_GENERATOR =3D "Unix Makefiles"
@@ -169,8 +171,10 @@ do_install() {
         mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d=
)}; then
-        mv ${D}/lib/security ${D}/${libdir}
-        rmdir --ignore-fail-on-non-empty ${D}/lib
+        if [ -f ${D}/lib/security ]; then
+            mv ${D}/lib/security ${D}/${libdir}
+            rmdir --ignore-fail-on-non-empty ${D}/lib
+        fi
     fi
 }
=20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-fr=
om-lock_guard-error-6161.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-F=
ix-build-breakage-from-lock_guard-error-6161.patch
deleted file mode 100644
index 87c70617a..000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lock=
_guard-error-6161.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Subject: [PATCH] Fix build breakage from lock_guard error (#6161)
-
-Summary:
-This change fixes a source issue that caused compile time error which
-breaks build for many fbcode services in that setup. The size() member
-function of channel is a const member, so member variables accessed
-within it are implicitly const as well. This caused error when clang
-fails to resolve to a constructor that takes std::mutex because the
-suitable constructor got rejected due to loss of constness for its
-argument. The fix is to add mutable modifier to the lock_ member of
-channel.
-
-Pull Request resolved: https://github.com/facebook/rocksdb/pull/6161
-
-Differential Revision: D18967685
-
-Pulled By: maysamyabandeh
-
-Upstream-Status: Backport
-
-fbshipit-source-id:698b6a5153c3c92eeacb842c467aa28cc350d432=20
---- a/storage/rocksdb/rocksdb/util/channel.h
-+++ b/storage/rocksdb/rocksdb/util/channel.h
-@@ -60,7 +60,7 @@ class channel {
-=20
-  private:
-   std::condition_variable cv_;
--  std::mutex lock_;
-+  mutable std::mutex lock_;
-   std::queue<T> buffer_;
-   bool eof_;
- };
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-o=
e/recipes-dbs/mysql/mariadb/c11_atomics.patch
index 169986130..36217f9aa 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
@@ -1,7 +1,7 @@
-Author: Vicen=C8=9Biu Ciorbaru <vicentiu@mariadb.org>
-Date:   Fri Dec 21 19:14:04 2018 +0200
-
-   Link with libatomic to enable C11 atomics support
+From 976468458d53d8bb71acf48ddfc852a60557acb9 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vicen=3DC8=3D9Biu=3D20Ciorbaru?=3D <vicentiu@mariadb.o=
rg>
+Date: Thu, 23 Jul 2020 00:02:21 -0700
+Subject: [PATCH] Link with libatomic to enable C11 atomics support
=20
    Some architectures (mips) require libatomic to support proper
    atomic operations. Check first if support is available without
@@ -9,10 +9,18 @@ Date:   Fri Dec 21 19:14:04 2018 +0200
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ configure.cmake      | 20 +++++++++++++++++++-
+ mysys/CMakeLists.txt |  4 ++++
+ sql/CMakeLists.txt   |  4 ++++
+ 3 files changed, 27 insertions(+), 1 deletion(-)
=20
+diff --git a/configure.cmake b/configure.cmake
+index a355214..6ee595f 100644
 --- a/configure.cmake
 +++ b/configure.cmake
-@@ -926,7 +926,25 @@ int main()
+@@ -865,7 +865,25 @@ int main()
    long long int *ptr=3D &var;
    return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
  }"
@@ -39,10 +47,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 =20
  IF(WITH_VALGRIND)
    SET(HAVE_valgrind 1)
+diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
+index 3d8a20e..42f1441 100644
 --- a/mysys/CMakeLists.txt
 +++ b/mysys/CMakeLists.txt
-@@ -78,6 +78,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings
-  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO} ${CRC3=
2_LIBRARY})
+@@ -129,6 +129,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIB=
RARY}
+  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO})
  DTRACE_INSTRUMENT(mysys)
 =20
 +IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
@@ -52,9 +62,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  IF(HAVE_BFD_H)
    TARGET_LINK_LIBRARIES(mysys bfd) =20
  ENDIF(HAVE_BFD_H)
+diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
+index 616017b..53575f6 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -178,6 +178,10 @@ ELSE()
+@@ -219,6 +219,10 @@ ELSE()
    SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
  ENDIF()
 =20
@@ -62,6 +74,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +  TARGET_LINK_LIBRARIES(sql atomic)
 +ENDIF()
 +
-=20
- IF(MSVC AND NOT WITHOUT_DYNAMIC_PLUGINS)
-=20
+ IF(MSVC)
+   SET(libs_to_export_symbols sql mysys dbug strings)
+   # Create shared library of already compiled object
+--=20
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen=
_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLi=
sts.txt-fix-gen_lex_hash-not-found.patch
index afc1be47b..4cb044339 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_ha=
sh-not-found.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_ha=
sh-not-found.patch
@@ -1,6 +1,6 @@
-From 796464015bffe6e0beca9e1c355b223512803c3e Mon Sep 17 00:00:00 2001
+From cfce1491827e5a581878b5e166bf4d30e6d90e07 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 27 Feb 2019 23:01:00 -0800
+Date: Thu, 23 Jul 2020 00:08:16 -0700
 Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
=20
 Fix the below do_compile issue in cross-compiling env.
@@ -10,18 +10,17 @@ Fix the below do_compile issue in cross-compiling env.
 Upstream-Status: Inappropriate [oe build specific]
=20
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
-
 ---
  sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
  1 file changed, 20 insertions(+), 10 deletions(-)
=20
 diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
-index c6910f46..bf51f4cb 100644
+index 0dc3caa..616017b 100644
 --- a/sql/CMakeLists.txt
 +++ b/sql/CMakeLists.txt
-@@ -50,11 +50,16 @@ ${WSREP_INCLUDES}
-=20
-=20
+@@ -52,11 +52,16 @@ ${CMAKE_BINARY_DIR}/sql
+ ${CMAKE_SOURCE_DIR}/tpool
+ )
 =20
 -ADD_CUSTOM_COMMAND(
 -  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
@@ -39,9 +38,9 @@ index c6910f46..bf51f4cb 100644
 +   COMMAND gen_lex_token > lex_token.h)
 +ENDIF()
 =20
- ADD_DEFINITIONS(-DMYSQL_SERVER -DHAVE_EVENT_SCHEDULER)
-=20
-@@ -370,11 +375,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
+ ADD_CUSTOM_COMMAND(
+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/sql_yacc_ora.yy
+@@ -345,11 +350,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
    ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
  ENDIF()
 =20
@@ -61,5 +60,8 @@ index c6910f46..bf51f4cb 100644
 +   COMMAND gen_lex_hash > lex_hash.h)
 +ENDIF()
 =20
- MYSQL_ADD_EXECUTABLE(mysql_tzinfo_to_sql tztime.cc COMPONENT Server)
- SET_TARGET_PROPERTIES(mysql_tzinfo_to_sql PROPERTIES COMPILE_FLAGS "-DT=
ZINFO2SQL")
+ MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc COMPONENT Server)
+ SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAGS "-=
DTZINFO2SQL")
+--=20
+2.17.1
+
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb b/meta-oe/recip=
es-dbs/mysql/mariadb_10.5.4.bb
similarity index 87%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
index c0b53379d..220b904b2 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb
+++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
@@ -2,7 +2,7 @@ require mariadb.inc
=20
 EXTRA_OECMAKE +=3D "-DSTACK_DIRECTION=3D-1"
=20
-DEPENDS +=3D "mariadb-native bison-native openssl ncurses zlib libaio li=
bedit libevent libxml2"
+DEPENDS +=3D "mariadb-native bison-native curl openssl ncurses zlib liba=
io libedit libevent libxml2"
=20
 PROVIDES +=3D "mysql5 libmysqlclient"
=20
--=20
2.17.1

