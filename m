Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.49])
 by mx.groups.io with SMTP id smtpd.web11.1852.1596763086409013284
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 18:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AbbJgh/a;
 spf=pass (domain: windriver.com, ip: 40.107.92.49, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVKmM6zMWztOfPnBYTFywKHJnukXZ+YcddMwsKTc/oRzxvv5TDhTThc9BpMpW6rzWXQtw1e6MmpnzI+FCoRdZZsWxsF/xPfK2qm5RaaV3Jaoe15RKIk7NV9D1Tt00rn6VH204hLHIMGCjaY1s/NSuCbRxzscrli4V4gKIOFvsNGYys9MRnL6o96x3OzbaTJ98Hno8KNGcWWs2xhI9U4Ep3AurfYDF1xbMyaIRrVxFJro1AXnAo4Vy6CWULi6Q3ZebEqqmHaWQU/ASZwPV8+95CSqdfKxS+xvWu7lENpJ9EtDYR85gu2b/gMvzyaJ+xU+49M8iILY360DxNIY7rADog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nChlj6IhBfYUI+Yy6HhH1/X1LIKmJibeP6ncghRgCfA=;
 b=GMiY5C48/izOwzGBweX8Hkx/6ieOjQFz/2SFZIhhx0zs1rKLncmYje1ki5IWvvqMaRLg/NKTeT/wP1rUYhFudEGFxJFW2ZUDvps05A43FFtCRBNMPajd34NfoCrScdgRvOo14ZB6XJ8mtf2axHTzuWmZYHyQLY0p3HY7cL9xgrBb54OMPqnLACrammAYEoyGt0fuEOQt0qu3Qfq+2kwPma0WzRkG9g6vP897b4fNfsfgncgEWkH6Wv8cjZ5RGvbDhRZW7CVabpeDn7ite2RZvUUdnDQX11Nuo6MRfWgHWM2QwEih6AFU7MbHChl6gONRhztvnlEbQRwIc1rP0htLVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nChlj6IhBfYUI+Yy6HhH1/X1LIKmJibeP6ncghRgCfA=;
 b=AbbJgh/aZzaHYdPXbAdplQ+UkQT8BS8v2egX8P/Nb2Gnxtb4HDMdc+ClA/2MKS9/edn1OCu1TRyjhUtV1FY4tygS66i6X79odjqurYNd9bPFnYYBC3vVzFFTwbxtE2X0K3tdScVgIp8xSEPVuFg/W6YNra1unm6+Rokz6YVs2uE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Fri, 7 Aug
 2020 01:18:03 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360%3]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 01:18:03 +0000
Subject: Re: [oe] [meta-oe][PATCH v3] mariadb: upgrade to 10.5.4
To: akuster808 <akuster808@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <CAMKF1srMOdhSyWxhBxDKSkaUfTUzfeDA6m=2SB-LttecR6xs-A@mail.gmail.com>
 <20200728083603.75632-1-mingli.yu@windriver.com>
 <a1f87e75-190a-f400-ccae-f9140cfd4172@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <46062290-4cac-336f-e62a-894b16daca56@windriver.com>
Date: Fri, 7 Aug 2020 09:16:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a1f87e75-190a-f400-ccae-f9140cfd4172@gmail.com>
X-ClientProxiedBy: HK0PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:203:b0::34) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK0PR03CA0118.apcprd03.prod.outlook.com (2603:1096:203:b0::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.17 via Frontend Transport; Fri, 7 Aug 2020 01:18:02 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fba08ac-0ee6-4e8b-1664-08d83a6fbb31
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3911E6DE107572FAEE6B6314F1490@BY5PR11MB3911.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6+pBLQKG92pbGc5LggAlJyZ70ljYhp04o+7cQLIO53Qo+y0vhNaN6FDOKE5TmxmJRc68EzqnG06bmS7tZBqdUk45ux17gcGpHd8iNuREfFqsJ9xzN8aIb0glRobAA/J8GFrtu6IVWbs52syDVXNvPvt+QjO3Fl+wsUVdj1pzXTC6lPAPpjfaELmnds5LFmolCj8wEYORQoylhpP988kBFOOQaoPYo3iS7mZJqLMm7VLkt23TZtT3vK79sSev7XvYcb3i2pF79urnpFsOJApAdzQ84baWwgcG2Ne7NGJeFBqPKwz4KsqcHcpIsgBSTdH4/uYM5LDY+NR6EDSkxjOXCJ3NIPXR3lJ6jtzZ1dYkMbT2aTv1CYs7XaZX6h1E+8UqYgCPX67PfJlqttPgd5v1U1oTlAw7DpWGqIaZkzM7apg9fwWmTzAfPXykV6kf3Qh229WAi5JUrGZ52lR6D0F5n1ryiw8voGtS+YZLeowM2O8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(136003)(346002)(39850400004)(396003)(366004)(52116002)(36756003)(966005)(956004)(2616005)(8676002)(8936002)(66946007)(86362001)(5660300002)(16576012)(66556008)(66476007)(31686004)(316002)(31696002)(6666004)(6486002)(2906002)(478600001)(53546011)(26005)(66574015)(30864003)(186003)(83380400001)(6706004)(16526019)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Q1LurkZQceHRuWK2rFCX4NvQSrx26qE2Z+Kep1ux4HbDAHsxE1d3ITuLsLKxRLfUrSFCvx5h5WwT5ny/1R0tOdcuN0wyFinSAzBATypdatqPR/IJoDt/ydq6USqrBruL53FTB0eBthRDqPfI6yZnE9/H2IEnxJpC56gHvjdv1MdHO1EIiD0eXwQP2dk250hPgl6JNClz+QGOJPkHwYDpoPaMdqF0DbpULvySLannv5OzDtqqjnDbCp94lW7G5cRtvH/RIcG2MAONGGJNCpqVUKQjhhoVelAMTs4q2IIq2GSgwIJbFZ74v4IhtY8uHQp04c/Bgya4e1Wr6c3TKAlJ7QRTzoCtDWbXix77xJQajeYRw8zQKFl4VGHzg7HaebnvxMRd9LBsTrLVmpa+lXZ5qLIzZxHVJ4LHOYrIwefinhB54TfonFe+w7tj0LJCLuVIdwD39eKMEVO4yuXsXzwBKXahbWc97Pfe0+AlMFfsulzfZKrzmEtKXNoZqgyZ2kTsHTzVcpzn5px0sioVUjyqiniu7cIcx0SDcrHq5W4O2D3pCwPER/aPU/cP17gvcT4PNWnKTNlZ8VrttHeWjxK2if886LEfLW9XKqLCtjqRBnsWWtWcyJ/C8gaodCoMy72PbpDMBk7fFmNo4EsUVMmRJw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fba08ac-0ee6-4e8b-1664-08d83a6fbb31
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 01:18:03.1601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pwom9/rOxVL+qcIQbUIL6tk/KMRSlRxJTIoRx+NCDRvuiNN1GxvFLvYuFr3hFtPgydVub/tNM7dbrge+hQD0PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3911
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Armin,

On 7/28/20 10:31 PM, akuster808 wrote:
> Mingli,
>=20
>=20
> On 7/28/20 1:36 AM, Yu, Mingli wrote:
>> From: Mingli Yu<mingli.yu@windriver.com>
>>
>> * Remove one backported patch
>> * Remove SRC_URI[md5sum]
>> * Rebase two patches to fix fuzz warnings
>> * Add curl depends to fix below error:
>>    | ./mariadb-10.5.4/storage/maria/libmarias3/libmarias3/marias3.h:26:=
10: fatal error: curl/curl.h: No such file or directory
>>
>> * update the pam_user_map.so install logic as below commit introduced i=
n this new
>>    mariadb version
>>    236aed3f5f0 MDEV-21656: Wrong directory for pam_user_map.so JIRA:htt=
ps://jira.mariadb.org/browse/MDEV-17292
>>
>> * Backport a patch to fix the undefined reference to `crc32c_arm64' on =
arm64
>=20
> What are the difference between the patch versions?

The v2 version is used to fix the issue reflected by=20
http://errors.yoctoproject.org/Errors/Details/424596/.

Both v1 and v2 are using below logic to disable rocksdb engine for arm64=
=20
to workaround the issue https://jira.mariadb.org/browse/MDEV-17292.
EXTRA_OECMAKE_append_aarch64 =3D " -DPLUGIN_ROCKSDB=3DNO"

But after I send out v2, I notice the issue=20
https://jira.mariadb.org/browse/MDEV-17292 is fixed, so I backport the=20
patch to generate v3 which used to backport a patch to fix the issue as=20
https://jira.mariadb.org/browse/MDEV-17292.

Thanks,

> -armin
>=20
>> Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>> ---
>>   ...ve_10.4.12.bb =3D> mariadb-native_10.5.4.bb} |  0
>>   meta-oe/recipes-dbs/mysql/mariadb.inc         | 13 +++--
>>   ...-breakage-from-lock_guard-error-6161.patch | 32 -------------
>>   ...DB-undefined-reference-to-crc32c_arm.patch | 48 ++++++++++++++++++=
+
>>   .../mysql/mariadb/c11_atomics.patch           | 37 +++++++++-----
>>   ...Lists.txt-fix-gen_lex_hash-not-found.patch | 26 +++++-----
>>   .../{mariadb_10.4.12.bb =3D> mariadb_10.5.4.bb} |  2 +-
>>   7 files changed, 97 insertions(+), 61 deletions(-)
>>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.4.12.bb =3D> mari=
adb-native_10.5.4.bb} (100%)
>>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-build-b=
reakage-from-lock_guard-error-6161.patch
>>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-=
RocksDB-undefined-reference-to-crc32c_arm.patch
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
>> index 95f5acba1..58f573e5e 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>> @@ -18,11 +18,10 @@ SRC_URI =3D"https://downloads.mariadb.org/interstit=
ial/${BP}/source/${BP}.tar.gz=20
>> file://c11_atomics.patch \ file://clang_version_header_conflict.patch=
=20
>> \ file://fix-arm-atomic.patch \ -=20
>> file://0001-Fix-build-breakage-from-lock_guard-error-6161.patch \=20
>> file://0001-Fix-library-LZ4-lookup.patch \ +=20
>> file://0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch =
\ "
>> -SRC_URI[md5sum] =3D "97d7c0f508c04a31c138fdb24e95dbc4"
>> -SRC_URI[sha256sum] =3D "fef1e1d38aa253dd8a51006bd15aad184912fce31c446b=
b69434fcde735aa208"
>> +SRC_URI[sha256sum] =3D "26db2becc9cec37e99a4e73390bd2eaa74568e21f9cf11=
0359f4f68b37154c72"
>>  =20
>>   UPSTREAM_CHECK_URI =3D"https://github.com/MariaDB/server/releases"
>>  =20
>> @@ -169,8 +168,12 @@ do_install() {
>>           mv ${D}${datadir}/doc/README ${D}${datadir}/doc/${PN}/
>>       fi
>>       if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false'=
, d)}; then
>> -        mv ${D}/lib/security ${D}/${libdir}
>> -        rmdir --ignore-fail-on-non-empty ${D}/lib
>> +        pam_so=3D$(find ${D} -name pam_user_map.so)
>> +        if [ x"${pam_so}" !=3D x ]; then
>> +            pam_dir=3D$(dirname ${pam_so})
>> +            mv ${pam_dir} ${D}/${libdir}
>> +            rmdir --ignore-fail-on-non-empty ${pam_dir%security}
>> +        fi
>>       fi
>>   }
>>  =20
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
>> -Pull Request resolved:https://github.com/facebook/rocksdb/pull/6161
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
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-=
undefined-reference-to-crc32c_arm.patch b/meta-oe/recipes-dbs/mysql/mariadb=
/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
>> new file mode 100644
>> index 000000000..1856c1af7
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefin=
ed-reference-to-crc32c_arm.patch
>> @@ -0,0 +1,48 @@
>> +From d88ea260882ca414e940cd6af225617f00503f71 Mon Sep 17 00:00:00 2001
>> +From: Krunal Bauskar<krunalbauskar@gmail.com>
>> +Date: Mon, 27 Jul 2020 18:38:10 +0800
>> +Subject: [PATCH] MDEV-23137: RocksDB: undefined reference to crc32c_ar=
m64
>> +
>> +RocksDB fails to build on arm64: undefined reference to
>> +            `crc32c_arm64(unsigned int, unsigned char const*, unsigned=
 int)'
>> +
>> +MariaDB uses storage/rocksdb/build_rocksdb.cmake to compile RocksDB.
>> +Said cmake missed adding crc32c_arm64 compilation target so if
>> +machine native architecture supported crc32 then complier would enable
>> +usage of function defined in crc32c_arm64 causing the listed error.
>> +
>> +Added crc32c_arm64 complition target.
>> +
>> +closes #1642
>> +
>> +Upstream-Status: Backport
>> +
>> +Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>> +---
>> + storage/rocksdb/build_rocksdb.cmake | 10 ++++++++++
>> + 1 file changed, 10 insertions(+)
>> +
>> +diff --git a/storage/rocksdb/build_rocksdb.cmake b/storage/rocksdb/bui=
ld_rocksdb.cmake
>> +index 3f3dca7e990..7d2252c5f77 100644
>> +--- a/storage/rocksdb/build_rocksdb.cmake
>> ++++ b/storage/rocksdb/build_rocksdb.cmake
>> +@@ -442,6 +442,16 @@ else()
>> +       util/crc32c_ppc.c
>> +       util/crc32c_ppc_asm.S)
>> +   endif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
>> ++  # aarch
>> ++  if(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
>> ++    CHECK_CXX_COMPILER_FLAG("-march=3Darmv8-a+crc+crypto" HAS_ARMV8_C=
RC)
>> ++    if(HAS_ARMV8_CRC)
>> ++      message(STATUS " HAS_ARMV8_CRC yes")
>> ++      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=3Darmv8-a+crc+cr=
ypto -Wno-unused-function")
>> ++      list(APPEND ROCKSDB_SOURCES
>> ++        util/crc32c_arm64.cc)
>> ++    endif(HAS_ARMV8_CRC)
>> ++  endif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
>> + endif()
>> + SET(SOURCES)
>> + FOREACH(s ${ROCKSDB_SOURCES})
>> +--
>> +2.17.1
>> +
>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta=
-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
>> index 169986130..36217f9aa 100644
>> --- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
>> @@ -1,7 +1,7 @@
>> -Author: Vicen=C8=9Biu Ciorbaru<vicentiu@mariadb.org>
>> -Date:   Fri Dec 21 19:14:04 2018 +0200
>> -
>> -   Link with libatomic to enable C11 atomics support
>> +From 976468458d53d8bb71acf48ddfc852a60557acb9 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Vicen=3DC8=3D9Biu=3D20Ciorbaru?=3D<vicentiu@mariadb.=
org>
>> +Date: Thu, 23 Jul 2020 00:02:21 -0700
>> +Subject: [PATCH] Link with libatomic to enable C11 atomics support
>>  =20
>>      Some architectures (mips) require libatomic to support proper
>>      atomic operations. Check first if support is available without
>> @@ -9,10 +9,18 @@ Date:   Fri Dec 21 19:14:04 2018 +0200
>>  =20
>>   Upstream-Status: Pending
>>   Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> +Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>> +---
>> + configure.cmake      | 20 +++++++++++++++++++-
>> + mysys/CMakeLists.txt |  4 ++++
>> + sql/CMakeLists.txt   |  4 ++++
>> + 3 files changed, 27 insertions(+), 1 deletion(-)
>>  =20
>> +diff --git a/configure.cmake b/configure.cmake
>> +index a355214..6ee595f 100644
>>   --- a/configure.cmake
>>   +++ b/configure.cmake
>> -@@ -926,7 +926,25 @@ int main()
>> +@@ -865,7 +865,25 @@ int main()
>>      long long int *ptr=3D &var;
>>      return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
>>    }"
>> @@ -39,10 +47,12 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
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
>> @@ -52,9 +62,11 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
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
>> @@ -62,6 +74,9 @@ Signed-off-by: Khem Raj<raj.khem@gmail.com>
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
>>   From: Mingli Yu<mingli.yu@windriver.com>
>> -Date: Wed, 27 Feb 2019 23:01:00 -0800
>> +Date: Thu, 23 Jul 2020 00:08:16 -0700
>>   Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
>>  =20
>>   Fix the below do_compile issue in cross-compiling env.
>> @@ -10,18 +10,17 @@ Fix the below do_compile issue in cross-compiling e=
nv.
>>   Upstream-Status: Inappropriate [oe build specific]
>>  =20
>>   Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>> -
>>   ---
>>    sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
>>    1 file changed, 20 insertions(+), 10 deletions(-)
>>  =20
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
>>  =20
>>   EXTRA_OECMAKE +=3D "-DSTACK_DIRECTION=3D-1"
>>  =20
>> -DEPENDS +=3D "mariadb-native bison-native openssl ncurses zlib libaio =
libedit libevent libxml2"
>> +DEPENDS +=3D "mariadb-native bison-native curl openssl ncurses zlib li=
baio libedit libevent libxml2"
>>  =20
>>   PROVIDES +=3D "mysql5 libmysqlclient"
>>  =20
>>
>>=20
>=20
