Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web08.4018.1625565376537324120
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 02:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=OhVL4MYJ;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1m0hoH-0004V1-8f; Tue, 06 Jul 2021 11:56:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yrr7DzXBA64cVxlwraljm2MEhqAsqD4Ci4NPcSMvMC4=; b=OhVL4MYJaDm/VhiFuF/amOJBiv
	FVVzzWOObOA14DdtGak/qEWfRqPcqB09OL7pzn41UMIrYVyKSmhyeMliXM/PuUFWVHOx8Ya3EcuJX
	rm+YuVxEuW6McolKTMmxeqvnpJPpUeWXv/G0vqMNBE7ntJqwRifXgVryO+GjQXGa9uE9VMRoD+z5Q
	9k6ITGOCorKAzrL4NQdc0MXrjc+cHwQbTzI0PHyhWhB4zev+nwqwNxNSqzHtjgIj/GPZeTMqXZAJz
	ov9Y4tUrWrrXxYBcopqLvOiMKwthV5jCcKrr8uFlVeG9QUPRq4FzZAbzXixJnzVfMaZpQ776Dg55F
	V5/vr9ww==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1m0hoC-0005oC-MC; Tue, 06 Jul 2021 11:56:07 +0200
Subject: Re: [oe] [meta-oe][PATCH 1/2] mariadb: Use qemu to run cross-compiled binaries
To: Khem Raj <raj.khem@gmail.com>, =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55?=
 =?UTF-8?Q?i?= <zboszor@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210706065549.187176-1-zboszor@gmail.com>
 <CAMKF1srZS52Vt+YRVi-7WCzYOjBWAJH3Cy8PZCc2B8XgTgO2Xw@mail.gmail.com>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <ccf11a0f-eed1-553c-772f-2631618d0529@pr.hu>
Date: Tue, 6 Jul 2021 11:56:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srZS52Vt+YRVi-7WCzYOjBWAJH3Cy8PZCc2B8XgTgO2Xw@mail.gmail.com>
X-Spam-Score: -0.9 (/)
X-Scan-Signature: 1495b3eef5280b03f4d086122c971ab2
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210706095607Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 07. 06. 10:37 keltezéssel, Khem Raj írta:
> On Mon, Jul 5, 2021 at 11:56 PM Zoltán Böszörményi <zboszor@gmail.com> wrote:
>>
>> This way, mariadb does not depend on mariadb-native anymore.
>>
> 
> how does build time gets impacted ? you can count that native build is
> not needed but still it will be good to know.

The build time of mariadb itself does not change significantly,
it's around 15 minutes either way on our 16-core build machine.
Same amount of time for mariadb-native, which is saved now.

> qemu dependency also means that qemu usermode has to be supported for
> this to work, which maybe troublesome on some
> newer or lesser known architectures but perhaps thats a fine compromise perhaps.
> 
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta-oe/recipes-dbs/mysql/mariadb.inc         | 27 ++++----
>>   .../mysql/mariadb/cross-compiling.patch       | 25 -------
>>   ...Lists.txt-fix-gen_lex_hash-not-found.patch | 67 -------------------
>>   meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb  |  4 +-
>>   4 files changed, 15 insertions(+), 108 deletions(-)
>>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> index 18b025070..7b1f537fb 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -12,7 +12,6 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>>              file://mysql-systemd-start \
>>              file://configure.cmake-fix-valgrind.patch \
>>              file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
>> -           file://sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
>>              file://0001-disable-ucontext-on-musl.patch \
>>              file://c11_atomics.patch \
>>              file://clang_version_header_conflict.patch \
>> @@ -21,7 +20,6 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>>              file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
>>              file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
>>              file://sys_futex.patch \
>> -           file://cross-compiling.patch \
>>              file://ssize_t.patch \
>>              file://mm_malloc.patch \
>>             "
>> @@ -60,8 +58,6 @@ SYSTEMD_AUTO_ENABLE_${PN}-setupdb ?= "enable"
>>   ALLOW_EMPTY_${PN}-setupdb ?= "1"
>>   FILES_${PN}-setupdb = "${sysconfdir}/init.d/install_db"
>>
>> -EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
>> -
>>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} setupdb"
>>   PACKAGECONFIG_class-native = ""
>>   PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
>> @@ -95,6 +91,8 @@ EXTRA_OECMAKE = "-DWITH_EMBEDDED_SERVER=ON \
>>                    -DCAT_EXECUTABLE=`which cat` \
>>                    -DCMAKE_AR:FILEPATH=${AR}"
>>
>> +EXTRA_OECMAKE_prepend_class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}/qemuwrapper "
>> +
>>   # With Ninja it fails with:
>>   # make: *** No rule to make target `install'.  Stop.
>>   OECMAKE_GENERATOR = "Unix Makefiles"
>> @@ -117,12 +115,18 @@ do_generate_toolchain_file_append_class-native () {
>>       sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d" ${WORKDIR}/toolchain.cmake
>>   }
>>
>> -do_compile_prepend_class-target () {
>> -    # These need to be in-tree or make will think they need to be built,
>> -    # and since we're cross-compiling that is disabled
>> -    cp ${STAGING_BINDIR_NATIVE}/comp_err ${S}/extra
>> -    cp ${STAGING_BINDIR_NATIVE}/comp_sql ${S}/scripts
>> +do_configure_prepend_class-target () {
>> +       # Write out a qemu wrapper that will be used by cmake
>> +       # so that it can run target helper binaries through that.
>> +       qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
>> +       cat > ${WORKDIR}/qemuwrapper << EOF
>> +#!/bin/sh
>> +$qemu_binary "\$@"
>> +EOF
>> +       chmod +x ${WORKDIR}/qemuwrapper
>> +}
>>
>> +do_compile_prepend_class-target () {
>>       if [ "${@bb.utils.contains('PACKAGECONFIG', 'krb5', 'yes', 'no', d)}" = "no" ]; then
>>           if ! [ -e ${B}/include/openssl/kssl.h ] ; then
>>               mkdir -p ${B}/include/openssl
>> @@ -132,11 +136,6 @@ do_compile_prepend_class-target () {
>>               echo "#endif" >>${B}/include/openssl/kssl.h
>>           fi
>>       fi
>> -    # workaround to handle out-of-source build from source package
>> -    yacc_files="sql_yacc.hh sql_yacc.cc sql_yacc_ora.hh sql_yacc_ora.cc"
>> -    for yacc_file in ${yacc_files}; do
>> -        cp ${S}/sql/${yacc_file} ${B}/sql/${yacc_file}
>> -    done
>>   }
>>
>>   SYSROOT_PREPROCESS_FUNCS += "mariadb_sysroot_preprocess"
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>> deleted file mode 100644
>> index 0f4815b18..000000000
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
>> +++ /dev/null
>> @@ -1,25 +0,0 @@
>> -This is not needed for OE builds
>> -
>> -building failed since native does not generate import_executables.cmake
>> -In fact, our building system will export the needed commands
>> -
>> -Upstream-Status: Inappropriate [configuration]
>> -
>> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> ---- a/CMakeLists.txt
>> -+++ b/CMakeLists.txt
>> -@@ -392,11 +392,6 @@ CHECK_PCRE()
>> -
>> - CHECK_SYSTEMD()
>> -
>> --IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
>> --  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to import_executables.cmake from a native build")
>> --  INCLUDE(${IMPORT_EXECUTABLES})
>> --ENDIF()
>> --
>> - #
>> - # Setup maintainer mode options. Platform checks are
>> - # not run with the warning options as to not perturb fragile checks
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
>> deleted file mode 100644
>> index 4cb044339..000000000
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch
>> +++ /dev/null
>> @@ -1,67 +0,0 @@
>> -From cfce1491827e5a581878b5e166bf4d30e6d90e07 Mon Sep 17 00:00:00 2001
>> -From: Mingli Yu <mingli.yu@windriver.com>
>> -Date: Thu, 23 Jul 2020 00:08:16 -0700
>> -Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
>> -
>> -Fix the below do_compile issue in cross-compiling env.
>> -| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_hash', needed by 'sql/lex_hash.h'.  Stop.
>> -| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_token', needed by 'sql/lex_token.h'.  Stop.
>> -
>> -Upstream-Status: Inappropriate [oe build specific]
>> -
>> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ----
>> - sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
>> - 1 file changed, 20 insertions(+), 10 deletions(-)
>> -
>> -diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
>> -index 0dc3caa..616017b 100644
>> ---- a/sql/CMakeLists.txt
>> -+++ b/sql/CMakeLists.txt
>> -@@ -52,11 +52,16 @@ ${CMAKE_BINARY_DIR}/sql
>> - ${CMAKE_SOURCE_DIR}/tpool
>> - )
>> -
>> --ADD_CUSTOM_COMMAND(
>> --  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>> --  COMMAND gen_lex_token > lex_token.h
>> --  DEPENDS gen_lex_token
>> --)
>> -+IF(NOT CMAKE_CROSSCOMPILING)
>> -+  ADD_CUSTOM_COMMAND(
>> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>> -+   COMMAND gen_lex_token > lex_token.h
>> -+   DEPENDS gen_lex_token)
>> -+ELSE()
>> -+  ADD_CUSTOM_COMMAND(
>> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>> -+   COMMAND gen_lex_token > lex_token.h)
>> -+ENDIF()
>> -
>> - ADD_CUSTOM_COMMAND(
>> -   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/sql_yacc_ora.yy
>> -@@ -345,11 +350,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
>> -   ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
>> - ENDIF()
>> -
>> --ADD_CUSTOM_COMMAND(
>> --  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>> --  COMMAND gen_lex_hash > lex_hash.h
>> --  DEPENDS gen_lex_hash
>> --)
>> -+IF(NOT CMAKE_CROSSCOMPILING)
>> -+  ADD_CUSTOM_COMMAND(
>> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>> -+   COMMAND gen_lex_hash > lex_hash.h
>> -+   DEPENDS gen_lex_hash)
>> -+ELSE()
>> -+  ADD_CUSTOM_COMMAND(
>> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
>> -+   COMMAND gen_lex_hash > lex_hash.h)
>> -+ENDIF()
>> -
>> - MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc COMPONENT Server)
>> - SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAGS "-DTZINFO2SQL")
>> ---
>> -2.17.1
>> -
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
>> index 8ae8241b0..57d7736ea 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
>> @@ -1,8 +1,8 @@
>>   require mariadb.inc
>>
>> -EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
>> +inherit qemu
>>
>> -DEPENDS += "mariadb-native bison-native boost libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
>> +DEPENDS += "qemu-native bison-native boost libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
>>
>>   PROVIDES += "mysql5 libmysqlclient"
>>
>> --
>> 2.31.1
>>
>>
>>
>> 
>>

