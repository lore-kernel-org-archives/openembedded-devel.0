Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.65])
 by mx.groups.io with SMTP id smtpd.web11.46955.1595815152934805037
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 18:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DK5BPana;
 spf=pass (domain: windriver.com, ip: 40.107.92.65, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfvR+lTEldpjYxEsEsAlWTWExfaQrLJRi3Dl4jltSrumEnPzIM3iXa8+EVZaUMtk78bHOQbwTVgOaM0S4w2dImkfQMwfixgH4xFtr5R93U3A4sSGJWeEg7OQOC03I7GI4BjCL0l6vCYDKAHSayAtCQFaosTMdwPVz0dMSgiltD1ZJsnNoWOG4UW2Eis2ohtyoRlrceJ5eCFBa0m340KG0X/adAWP0HnO8cxvPhyinMEt92Nawv+x+Ijm4tS27aQ20pMf3rJKtHG8yRVeA4BmvazVQTXFeczMyj4F7SyuPlP5bdZYZ+SNAZ0XUlLzmpSLvQJP/nlZ0O2t6XTaYT0ivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4pnF9G2vZK/cNgA5fp+2TYd7ZyHPrN7Jp6nTIpBCrw=;
 b=M8GyVl/EF8RkRngcQNJwkFIENfa5Dh12zVsK5OU2X1bldhTvkvV2V6vh4hoo14Yky3i/1jw5PMo4Nzh6JgDFEm4l3ot4mrCMdUSR9tDRnMq6K7AG6f0c82sduKXl5hsvXdyQO11QfaBGB5GY4t018C4XYhZYgjF1t1eTbgR+dE4fox/aYDk0tZw1L1ES6eZs6h2Fbe3OzcLkoss8LptNlydMASWAGSjhWUcktgdGxxoQgJIoRFUls+D/8oSOzj83TV93JIywxtg1KSk61TGeKaDOo2MA49fiznOg7JNjWjjfeAU6Yj4UTJnvj5zV9dKm58kE1bGFEStmWQ4TphDqPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S4pnF9G2vZK/cNgA5fp+2TYd7ZyHPrN7Jp6nTIpBCrw=;
 b=DK5BPana6N7D72ZAvbltGY8EcMz4zqk3KF++WjsunSrtaSWT+Dkhp8B8sCxFsTJeEzW9UVbzB2f2kl/X3pfQFV6ghvpVDNdOJOcSkp0k1E4QMNAfTUsV+7G9UZNBFSXvZCws4XHEpLoZn8sYMpzVlt/y1gQwyHKzjMzrhsMYOJ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3718.namprd11.prod.outlook.com (2603:10b6:a03:fd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Mon, 27 Jul
 2020 01:59:10 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360%3]) with mapi id 15.20.3216.031; Mon, 27 Jul 2020
 01:59:10 +0000
Subject: Re: [oe] [meta-oe][PATCH] mariadb: upgrade to 10.5.4
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20200724084912.27693-1-mingli.yu@windriver.com>
 <CAMKF1srMOdhSyWxhBxDKSkaUfTUzfeDA6m=2SB-LttecR6xs-A@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <675a6bec-ffd2-f237-fe33-64632ec5cc38@windriver.com>
Date: Mon, 27 Jul 2020 09:58:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAMKF1srMOdhSyWxhBxDKSkaUfTUzfeDA6m=2SB-LttecR6xs-A@mail.gmail.com>
X-ClientProxiedBy: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend Transport; Mon, 27 Jul 2020 01:59:08 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97d2bb3b-fd8c-4312-e38f-08d831d0a71e
X-MS-TrafficTypeDiagnostic: BYAPR11MB3718:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB37187F8B7979130F3B74A143F1720@BYAPR11MB3718.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f6+FX67M/v0GWH3yagJ2jYekkZr2Ihj2JADY/7yil1XMsS2R9fJgghKzPxF6E3sI6Sq6oSkz/29a+ctKqnkCsHK16ZAkDrQelvmTbcKGoCl0ei902ZdxUU/IGnyMSH0T7YO8VU7M5lLulmSlNGN6FBWKipEvwP5ReIPYYHk8Lg+/LlXglD2Tw4adhxcCHroreJkGbEavStDfTitxY2a40tnoR8gUZmPO1wE00+MN/7f7DbFeJ3Rl11j3Z4+fA1p5OJCZWBsV5pE8UYL2vncoylhqxBd0yRbLn5fN/riX3fLyCuLz8hhe0jvoPxE7Vy5avuxvX6gL/HHvN6WQVLVIZR4luRK2eTiXn4po4PGwCqcYC53XPAgwPiyrq0RnAOWOMPDzhe9RCfyAe1u588xkO1vZcZ+mkShjcbpz7wuZltcl0lP+5jqZxk6eNSBPVk7iwXWYUsOjy5hBL7GuJdNbeY4sJw3kF9Nh2t+ZQd36nXA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(396003)(136003)(376002)(39830400003)(66476007)(66946007)(66556008)(5660300002)(31686004)(16576012)(966005)(86362001)(53546011)(52116002)(30864003)(8676002)(478600001)(316002)(31696002)(66574015)(4326008)(6916009)(16526019)(6706004)(26005)(956004)(2616005)(36756003)(8936002)(83380400001)(2906002)(6666004)(186003)(6486002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	kpE/6z3NPhqkWs0ofGsnd530vJwf3YiELaMiA+qr+2rBXfq7cZJZESPBxMWeIRTK+AltZ4jRRuL7LgxmfDiflS7G50FUS+imn7AmkHo0ai/YIhWe55WBlLEu6MnVMUnrZCj0lmSCDGX421IC0lCUnorOziNPJM/STsQaDiKJyQjqVg4rQFK/UIBpM+UH9Wg7nY3DGfF8skfmZuT7ND5CPNyY/4bUuL+H7FuTLP72eJwFJlwxyyMZNIV/T8lIugnbrRc68URb8YyEzyrNu3eJLOQ+/Ykv9oDWrFMBHjKxAm+GzV1lPgFLecRhG0ViFviV3O3dtNmkdTfWhWPdfHgg7wxaQyWihoOtSw9RNucjP8TNImudQP0Zsk9/fnKHkC1tsHdD/1PEtgdNMwPXFIx+9I83kyL96D3Uqslq54Z5kfa8yyXGE4g2B/F10xNY54EURVeZwDuevMTPaFAwWxzfPXKsSssXv5h/dxYqqMMcHDc=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d2bb3b-fd8c-4312-e38f-08d831d0a71e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 01:59:10.2111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7lANoYTgUZaOZBCjYN2GvfMGGuII3PjDM6BdSmmaE2c8FsgW46ckocAPgR+bUbnnglyUrAQr8mmcCqyPjKnDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3718
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/25/20 11:52 PM, Khem Raj wrote:
> On Fri, Jul 24, 2020 at 1:49 AM Yu, Mingli <mingli.yu@windriver.com> wro=
te:
>>
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> * Remove one backported patch
>> * Remove SRC_URI[md5sum]
>> * Rebase two patches to fix fuzz warnings
>> * Add curl depends to fix below error:
>>    | ./mariadb-10.5.4/storage/maria/libmarias3/libmarias3/marias3.h:26:=
10: fatal error: curl/curl.h: No such file or directory
>>
>> * Fixes:
>>    | mv: cannot stat '/build/tmp/work/corei7-64-wrs-linux/mariadb/10.5.=
4-r0/image/lib/security': No such file or directory
>>
>> * Disable rocksdb engine for arm64 to workaround undefined reference
>>    to `crc32c_arm64' as https://jira.mariadb.org/browse/MDEV-23137
>>
>=20
> fails on x86_64
>=20
> http://errors.yoctoproject.org/Errors/Details/424596/

Thank, I will try to reproduce the issue and then resolve it.

Thanks,

>=20
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   ...ve_10.4.12.bb =3D> mariadb-native_10.5.4.bb} |  0
>>   meta-oe/recipes-dbs/mysql/mariadb.inc         | 14 ++++---
>>   ...-breakage-from-lock_guard-error-6161.patch | 32 ----------------
>>   .../mysql/mariadb/c11_atomics.patch           | 37 +++++++++++++-----=
-
>>   ...Lists.txt-fix-gen_lex_hash-not-found.patch | 26 +++++++------
>>   .../{mariadb_10.4.12.bb =3D> mariadb_10.5.4.bb} |  2 +-
>>   6 files changed, 50 insertions(+), 61 deletions(-)
>>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.12.bb =3D> mari=
adb-native_10.5.4.bb} (100%)
>>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-b=
reakage-from-lock_guard-error-6161.patch
>>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.4.12.bb =3D> mariadb_10.=
5.4.bb} (87%)
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb b/meta=
-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
>> similarity index 100%
>> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.4.12.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-db=
s/mysql/mariadb.inc
>> index 95f5acba1..33649e8b7 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -18,11 +18,9 @@ SRC_URI =3D "https://downloads.mariadb.org/interstit=
ial/${BP}/source/${BP}.tar.gz
>>              file://c11_atomics.patch \
>>              file://clang_version_header_conflict.patch \
>>              file://fix-arm-atomic.patch \
>> -           file://0001-Fix-build-breakage-from-lock_guard-error-6161.p=
atch \
>>              file://0001-Fix-library-LZ4-lookup.patch \
>>             "
>> -SRC_URI[md5sum] =3D "97d7c0f508c04a31c138fdb24e95dbc4"
>> -SRC_URI[sha256sum] =3D "fef1e1d38aa253dd8a51006bd15aad184912fce31c446b=
b69434fcde735aa208"
>> +SRC_URI[sha256sum] =3D "26db2becc9cec37e99a4e73390bd2eaa74568e21f9cf11=
0359f4f68b37154c72"
>>
>>   UPSTREAM_CHECK_URI =3D "https://github.com/MariaDB/server/releases"
>>
>> @@ -87,6 +85,10 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>>                    -DCAT_EXECUTABLE=3D`which cat` \
>>                    -DCMAKE_AR:FILEPATH=3D${AR}"
>>
>> +# disable rocksdb engine for arm64 to workaround the undefined referen=
ce to `crc32c_arm64(unsigned int, unsigned char const*, unsigned int)'
>> +# check https://jira.mariadb.org/browse/MDEV-23137 for more details
>> +EXTRA_OECMAKE_append_aarch64 =3D " -DPLUGIN_ROCKSDB=3DNO"
>> +
>>   # With Ninja it fails with:
>>   # make: *** No rule to make target `install'.  Stop.
>>   OECMAKE_GENERATOR =3D "Unix Makefiles"
>> @@ -169,8 +171,10 @@ do_install() {
>>           mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
>>       fi
>>       if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false'=
, d)}; then
>> -        mv ${D}/lib/security ${D}/${libdir}
>> -        rmdir --ignore-fail-on-non-empty ${D}/lib
>> +        if [ -f ${D}/lib/security ]; then
>> +            mv ${D}/lib/security ${D}/${libdir}
>> +            rmdir --ignore-fail-on-non-empty ${D}/lib
>> +        fi
>>       fi
>>   }
>>
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-=
from-lock_guard-error-6161.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-F=
ix-build-breakage-from-lock_guard-error-6161.patch
>> deleted file mode 100644
>> index 87c70617a..000000000
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-breakage-from-lo=
ck_guard-error-6161.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -Subject: [PATCH] Fix build breakage from lock_guard error (#6161)
>> -
>> -Summary:
>> -This change fixes a source issue that caused compile time error which
>> -breaks build for many fbcode services in that setup. The size() member
>> -function of channel is a const member, so member variables accessed
>> -within it are implicitly const as well. This caused error when clang
>> -fails to resolve to a constructor that takes std::mutex because the
>> -suitable constructor got rejected due to loss of constness for its
>> -argument. The fix is to add mutable modifier to the lock_ member of
>> -channel.
>> -
>> -Pull Request resolved: https://github.com/facebook/rocksdb/pull/6161
>> -
>> -Differential Revision: D18967685
>> -
>> -Pulled By: maysamyabandeh
>> -
>> -Upstream-Status: Backport
>> -
>> -fbshipit-source-id:698b6a5153c3c92eeacb842c467aa28cc350d432
>> ---- a/storage/rocksdb/rocksdb/util/channel.h
>> -+++ b/storage/rocksdb/rocksdb/util/channel.h
>> -@@ -60,7 +60,7 @@ class channel {
>> -
>> -  private:
>> -   std::condition_variable cv_;
>> --  std::mutex lock_;
>> -+  mutable std::mutex lock_;
>> -   std::queue<T> buffer_;
>> -   bool eof_;
>> - };
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta=
-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
>> index 169986130..36217f9aa 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
>> @@ -1,7 +1,7 @@
>> -Author: Vicen=C8=9Biu Ciorbaru <vicentiu@mariadb.org>
>> -Date:   Fri Dec 21 19:14:04 2018 +0200
>> -
>> -   Link with libatomic to enable C11 atomics support
>> +From 976468458d53d8bb71acf48ddfc852a60557acb9 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Vicen=3DC8=3D9Biu=3D20Ciorbaru?=3D <vicentiu@mariadb=
.org>
>> +Date: Thu, 23 Jul 2020 00:02:21 -0700
>> +Subject: [PATCH] Link with libatomic to enable C11 atomics support
>>
>>      Some architectures (mips) require libatomic to support proper
>>      atomic operations. Check first if support is available without
>> @@ -9,10 +9,18 @@ Date:   Fri Dec 21 19:14:04 2018 +0200
>>
>>   Upstream-Status: Pending
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + configure.cmake      | 20 +++++++++++++++++++-
>> + mysys/CMakeLists.txt |  4 ++++
>> + sql/CMakeLists.txt   |  4 ++++
>> + 3 files changed, 27 insertions(+), 1 deletion(-)
>>
>> +diff --git a/configure.cmake b/configure.cmake
>> +index a355214..6ee595f 100644
>>   --- a/configure.cmake
>>   +++ b/configure.cmake
>> -@@ -926,7 +926,25 @@ int main()
>> +@@ -865,7 +865,25 @@ int main()
>>      long long int *ptr=3D &var;
>>      return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
>>    }"
>> @@ -39,10 +47,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>>    IF(WITH_VALGRIND)
>>      SET(HAVE_valgrind 1)
>> +diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
>> +index 3d8a20e..42f1441 100644
>>   --- a/mysys/CMakeLists.txt
>>   +++ b/mysys/CMakeLists.txt
>> -@@ -78,6 +78,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings
>> -  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO} ${CR=
C32_LIBRARY})
>> +@@ -129,6 +129,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_L=
IBRARY}
>> +  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO})
>>    DTRACE_INSTRUMENT(mysys)
>>
>>   +IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
>> @@ -52,9 +62,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>    IF(HAVE_BFD_H)
>>      TARGET_LINK_LIBRARIES(mysys bfd)
>>    ENDIF(HAVE_BFD_H)
>> +diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
>> +index 616017b..53575f6 100644
>>   --- a/sql/CMakeLists.txt
>>   +++ b/sql/CMakeLists.txt
>> -@@ -178,6 +178,10 @@ ELSE()
>> +@@ -219,6 +219,10 @@ ELSE()
>>      SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
>>    ENDIF()
>>
>> @@ -62,6 +74,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   +  TARGET_LINK_LIBRARIES(sql atomic)
>>   +ENDIF()
>>   +
>> -
>> - IF(MSVC AND NOT WITHOUT_DYNAMIC_PLUGINS)
>> -
>> + IF(MSVC)
>> +   SET(libs_to_export_symbols sql mysys dbug strings)
>> +   # Create shared library of already compiled object
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-g=
en_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLi=
sts.txt-fix-gen_lex_hash-not-found.patch
>> index afc1be47b..4cb044339 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_=
hash-not-found.patch
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_=
hash-not-found.patch
>> @@ -1,6 +1,6 @@
>> -From 796464015bffe6e0beca9e1c355b223512803c3e Mon Sep 17 00:00:00 2001
>> +From cfce1491827e5a581878b5e166bf4d30e6d90e07 Mon Sep 17 00:00:00 2001
>>   From: Mingli Yu <mingli.yu@windriver.com>
>> -Date: Wed, 27 Feb 2019 23:01:00 -0800
>> +Date: Thu, 23 Jul 2020 00:08:16 -0700
>>   Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
>>
>>   Fix the below do_compile issue in cross-compiling env.
>> @@ -10,18 +10,17 @@ Fix the below do_compile issue in cross-compiling e=
nv.
>>   Upstream-Status: Inappropriate [oe build specific]
>>
>>   Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> -
>>   ---
>>    sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
>>    1 file changed, 20 insertions(+), 10 deletions(-)
>>
>>   diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
>> -index c6910f46..bf51f4cb 100644
>> +index 0dc3caa..616017b 100644
>>   --- a/sql/CMakeLists.txt
>>   +++ b/sql/CMakeLists.txt
>> -@@ -50,11 +50,16 @@ ${WSREP_INCLUDES}
>> -
>> -
>> +@@ -52,11 +52,16 @@ ${CMAKE_BINARY_DIR}/sql
>> + ${CMAKE_SOURCE_DIR}/tpool
>> + )
>>
>>   -ADD_CUSTOM_COMMAND(
>>   -  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
>> @@ -39,9 +38,9 @@ index c6910f46..bf51f4cb 100644
>>   +   COMMAND gen_lex_token > lex_token.h)
>>   +ENDIF()
>>
>> - ADD_DEFINITIONS(-DMYSQL_SERVER -DHAVE_EVENT_SCHEDULER)
>> -
>> -@@ -370,11 +375,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
>> + ADD_CUSTOM_COMMAND(
>> +   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/sql_yacc_ora.yy
>> +@@ -345,11 +350,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
>>      ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
>>    ENDIF()
>>
>> @@ -61,5 +60,8 @@ index c6910f46..bf51f4cb 100644
>>   +   COMMAND gen_lex_hash > lex_hash.h)
>>   +ENDIF()
>>
>> - MYSQL_ADD_EXECUTABLE(mysql_tzinfo_to_sql tztime.cc COMPONENT Server)
>> - SET_TARGET_PROPERTIES(mysql_tzinfo_to_sql PROPERTIES COMPILE_FLAGS "-=
DTZINFO2SQL")
>> + MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc COMPONENT Server=
)
>> + SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAGS =
"-DTZINFO2SQL")
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb b/meta-oe/rec=
ipes-dbs/mysql/mariadb_10.5.4.bb
>> similarity index 87%
>> rename from meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb
>> rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
>> index c0b53379d..220b904b2 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.4.12.bb
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
>> @@ -2,7 +2,7 @@ require mariadb.inc
>>
>>   EXTRA_OECMAKE +=3D "-DSTACK_DIRECTION=3D-1"
>>
>> -DEPENDS +=3D "mariadb-native bison-native openssl ncurses zlib libaio =
libedit libevent libxml2"
>> +DEPENDS +=3D "mariadb-native bison-native curl openssl ncurses zlib li=
baio libedit libevent libxml2"
>>
>>   PROVIDES +=3D "mysql5 libmysqlclient"
>>
>> --
>> 2.17.1
>>
>>=20
