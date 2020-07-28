Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.8068.1595925405053577985
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06S8aD0Q002889
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2020 01:36:34 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Jul 2020
 01:36:04 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v3] mariadb: upgrade to 10.5.4
Date: Tue, 28 Jul 2020 01:36:03 -0700
Message-ID: <20200728083603.75632-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMKF1srMOdhSyWxhBxDKSkaUfTUzfeDA6m=2SB-LttecR6xs-A@mail.gmail.com>
References: <CAMKF1srMOdhSyWxhBxDKSkaUfTUzfeDA6m=2SB-LttecR6xs-A@mail.gmail.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 06S8aD0Q002889
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From: Mingli Yu <mingli.yu@windriver.com>

* Remove one backported patch
* Remove SRC_URI[md5sum]
* Rebase two patches to fix fuzz warnings
* Add curl depends to fix below error:
  | ./mariadb-10.5.4/storage/maria/libmarias3/libmarias3/marias3.h:26:10:=
 fatal error: curl/curl.h: No such file or directory

* update the pam_user_map.so install logic as below commit introduced in =
this new
  mariadb version
  236aed3f5f0 MDEV-21656: Wrong directory for pam_user_map.so JIRA:https:=
//jira.mariadb.org/browse/MDEV-17292

* Backport a patch to fix the undefined reference to `crc32c_arm64' on ar=
m64

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ve_10.4.12.bb =3D> mariadb-native_10.5.4.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         | 13 +++--
 ...-breakage-from-lock_guard-error-6161.patch | 32 -------------
 ...DB-undefined-reference-to-crc32c_arm.patch | 48 +++++++++++++++++++
 .../mysql/mariadb/c11_atomics.patch           | 37 +++++++++-----
 ...Lists.txt-fix-gen_lex_hash-not-found.patch | 26 +++++-----
 .../{mariadb_10.4.12.bb =3D> mariadb_10.5.4.bb} |  2 +-
 7 files changed, 97 insertions(+), 61 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.12.bb =3D> mariadb=
-native_10.5.4.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-brea=
kage-from-lock_guard-error-6161.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-Roc=
ksDB-undefined-reference-to-crc32c_arm.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.12.bb =3D> mariadb_10.5.4=
.bb} (87%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb b/meta-o=
e/recipes-dbs/mysql/mariadb-native_10.5.4.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index 95f5acba1..58f573e5e 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -18,11 +18,10 @@ SRC_URI =3D "https://downloads.mariadb.org/interstiti=
al/${BP}/source/${BP}.tar.gz
            file://c11_atomics.patch \
            file://clang_version_header_conflict.patch \
            file://fix-arm-atomic.patch \
-           file://0001-Fix-build-breakage-from-lock_guard-error-6161.pat=
ch \
            file://0001-Fix-library-LZ4-lookup.patch \
+           file://0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_=
arm.patch \
           "
-SRC_URI[md5sum] =3D "97d7c0f508c04a31c138fdb24e95dbc4"
-SRC_URI[sha256sum] =3D "fef1e1d38aa253dd8a51006bd15aad184912fce31c446bb6=
9434fcde735aa208"
+SRC_URI[sha256sum] =3D "26db2becc9cec37e99a4e73390bd2eaa74568e21f9cf1103=
59f4f68b37154c72"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
=20
@@ -169,8 +168,12 @@ do_install() {
         mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d=
)}; then
-        mv ${D}/lib/security ${D}/${libdir}
-        rmdir --ignore-fail-on-non-empty ${D}/lib
+        pam_so=3D$(find ${D} -name pam_user_map.so)
+        if [ x"${pam_so}" !=3D x ]; then
+            pam_dir=3D$(dirname ${pam_so})
+            mv ${pam_dir} ${D}/${libdir}
+            rmdir --ignore-fail-on-non-empty ${pam_dir%security}
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
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-un=
defined-reference-to-crc32c_arm.patch b/meta-oe/recipes-dbs/mysql/mariadb=
/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
new file mode 100644
index 000000000..1856c1af7
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined=
-reference-to-crc32c_arm.patch
@@ -0,0 +1,48 @@
+From d88ea260882ca414e940cd6af225617f00503f71 Mon Sep 17 00:00:00 2001
+From: Krunal Bauskar <krunalbauskar@gmail.com>
+Date: Mon, 27 Jul 2020 18:38:10 +0800
+Subject: [PATCH] MDEV-23137: RocksDB: undefined reference to crc32c_arm6=
4
+
+RocksDB fails to build on arm64: undefined reference to
+            `crc32c_arm64(unsigned int, unsigned char const*, unsigned i=
nt)'
+
+MariaDB uses storage/rocksdb/build_rocksdb.cmake to compile RocksDB.
+Said cmake missed adding crc32c_arm64 compilation target so if
+machine native architecture supported crc32 then complier would enable
+usage of function defined in crc32c_arm64 causing the listed error.
+
+Added crc32c_arm64 complition target.
+
+closes #1642
+
+Upstream-Status: Backport
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ storage/rocksdb/build_rocksdb.cmake | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/storage/rocksdb/build_rocksdb.cmake b/storage/rocksdb/build=
_rocksdb.cmake
+index 3f3dca7e990..7d2252c5f77 100644
+--- a/storage/rocksdb/build_rocksdb.cmake
++++ b/storage/rocksdb/build_rocksdb.cmake
+@@ -442,6 +442,16 @@ else()
+       util/crc32c_ppc.c
+       util/crc32c_ppc_asm.S)
+   endif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
++  # aarch
++  if(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
++    CHECK_CXX_COMPILER_FLAG("-march=3Darmv8-a+crc+crypto" HAS_ARMV8_CRC=
)
++    if(HAS_ARMV8_CRC)
++      message(STATUS " HAS_ARMV8_CRC yes")
++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=3Darmv8-a+crc+cryp=
to -Wno-unused-function")
++      list(APPEND ROCKSDB_SOURCES
++        util/crc32c_arm64.cc)
++    endif(HAS_ARMV8_CRC)
++  endif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
+ endif()
+ SET(SOURCES)
+ FOREACH(s ${ROCKSDB_SOURCES})
+--=20
+2.17.1
+
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

