Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.77])
 by mx.groups.io with SMTP id smtpd.web11.7446.1613657820561229434
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Feb 2021 06:17:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Lf6CcZfe;
 spf=pass (domain: windriver.com, ip: 40.107.244.77, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNdmQo5Z4JbIBuHGD7RhlCeZ+8Ib/+ShsrgXIXclYQsDk5SGJZUdPBoBWG8emJyMoVsfWGIw5xt+O4SNSJ1T17GofiSdf/OIf11hJmVNBJ3HMRizcYnjhH5fmVcuGetB24KgxNjB25d0O/W+UV26N+DJ7tCeCgUfH23SSe83pQ0X8yF3ontx8SCegUrNlDC9gG9x+Eq5v8PHPsjGD0flyF+i2bo4dFANtjdMdB1OqnADAbZ5+0+VEB+nwAgTetBXJKhKB7f9Abj/PjTy7Bo6DNJHs49Y0vHDXQvDisPKFtIIPBtiFu0NVxn2iSPEPACs5FbFJQoJNs5s4gmDZ9qjgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXFaKYxLf6vczCFvK0+fmVZBXea8dm8Hp8eRM+f7Oss=;
 b=egWB0Kv8eAYwGYPEvHlxdSnSubTHl2hrNbfC3zZnDbspWJBf7/mDJGyhrNiNbf7PLt8ioRlVGe7pZF7NxD9sYKMVJDKB1MpdMR+1psCuoJnSPdYxfWbIKgmbgC4WTmsR8gPXwAZnscr4a7mDryYkSlB/yXM1OYuSoWsPQmUfcZ26oE9xkUMhw5e3HiVj09SHGumxUpyROXIAozfNgxYHTsa8/rnv/L1u189O5kO1b3PbSfKOnUkmyM9qfQ6VYtcv7vocdiLbsZBGwRi+5brN9tqbYAoZ6FY5HJwrkKQnhS43CT82xee/+Bl5SMuBns5sdeJMkwGYGy9D0Ad3LwNp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TXFaKYxLf6vczCFvK0+fmVZBXea8dm8Hp8eRM+f7Oss=;
 b=Lf6CcZfeDGo8Zhji68IZIiWE5FMrCdEv63kxSS2w5ZbL9BVFYhr/oJqEUZpaWnfnFdbPI+wZ0Kkr+3KGbg3veLYhwYl29kCKoBPx256XmJ8hRpyI5/t4YRmW/Cm11L6YFbgHkG1eiVkPqcpks1cbuQZwu3NlOECp0i+bSBvfbig=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4353.namprd11.prod.outlook.com (2603:10b6:a03:1b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Thu, 18 Feb
 2021 14:16:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3846.042; Thu, 18 Feb 2021
 14:16:59 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-grpcio: Upgrade to 1.35.0
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210217215820.3761256-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1ee524af-4067-0c84-7744-db325864f355@windriver.com>
Date: Thu, 18 Feb 2021 09:16:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210217215820.3761256-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by SJ0PR03CA0224.namprd03.prod.outlook.com (2603:10b6:a03:39f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 14:16:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b7dab7f-2211-4ab8-1d5b-08d8d417da8b
X-MS-TrafficTypeDiagnostic: BY5PR11MB4353:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB435375966B22B1512D80710E9F859@BY5PR11MB4353.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fqyOLFifC5NcwjlIJrgHCxjTQsbR5IoHD8YXf76O+zmkp4mirOZWOF4y/bsXVXY7IVnLBsnN0+rU+tJ4LqsEek+pgW4b8qdFwoB/g8c03dsRfTpk3kWMTPBcT5aLoB97UDTUJ5NGVcj6GoALauChrATmMf2HlLmQKNXN0rfqU4XebexayM2A40o85iBeGnFgNdQyc+WYH/5IogELI8ZkfeqzASEBMIY4gNOj1ZvOMWKImfHafgB2TtiWYO91nuFJlwI5NSbIctD8QDSn/E2f6pwyo2fJrqu4nn5yLf5HOhexJU4K/w/My/tjDmGiEub3gsCGpQ3OiDrRNBwPPz0CoNU00loGJDEYf+QmUSCvRgNHN+bS12k7sF/YpefAg+4b98rqn/ORgBcCfbqLVr+qcXQ9jgTgm/MuRFtApG/gxTvUefJGhiQtk7zd9ex1Asf/IfjE7RCF32a0LuaJmpJdERJist1N2WR3+ZLiFD7Fs7xL3NzrD78q06TlIfr55A3wu8W+VPX6a/c7580iI6YsiZwm3Su9d4W1C8YYw3huZsDZXZp6MesrKy5cuFcV+YwInQnt8+ezQ/8aQYm3p9BwPBQUL5TrvjsbNPw/eLTMOPuFzlp0+bdkBywihNmk6aH/9CM818xq06DLM9HVBpHFUCFaC7eTUgVYQtbxloXBRujZHckENFnClMVcXYuIYuOP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(376002)(136003)(346002)(5660300002)(66476007)(956004)(2616005)(316002)(166002)(83380400001)(16526019)(30864003)(186003)(66946007)(66556008)(44832011)(6486002)(86362001)(966005)(26005)(478600001)(8936002)(52116002)(31696002)(33964004)(36756003)(2906002)(31686004)(16576012)(53546011)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eVJHSk5aM2VrSENkT09Ta2ZQaGowbUxEVWJmbjZoOFFwenFkZ0JCUkozNDBZ?=
 =?utf-8?B?WDFtMTlUTjBpcVVaUk1UQ1JVTm5EQVpJUTVrNTNlRkI3dnNrbURTOHZ1eFNF?=
 =?utf-8?B?Vjd1MzFSY0JpSDhsdkY2cVRzUmNENVo4cHRCVUpGekU2d3NRbnNsOWg4V0Ry?=
 =?utf-8?B?cnlLVUxZcE1RZVhLTTdxSUkzWVJ2THNJcnlLcGFIdmtoOHFHSHFRRnUreHJT?=
 =?utf-8?B?K1hBNjM2S1dBVnRRTWV6bVY3bVJiQmhORG1uVUcvY2l6dnBaZDZkYkdWVU1X?=
 =?utf-8?B?bFBVcUdoM2R6QW52VXhhZmpnajR2dWZZWkNSTWpEcUNZT3BWNldqM09XWTR4?=
 =?utf-8?B?WGVqK2QwOFY2ZDFXOUZVT0tBZ2pmY1YySXB6cVBMSU1DS0UwT05Vd003SXNv?=
 =?utf-8?B?clBENXJOUEN2QkJXNDRrNDRRd1B3ODNWYU1mWVhzUkRwTlNIWTBNMDFXSzE3?=
 =?utf-8?B?TjYreEwxRnV3NTNqM1NwTSs4bFhocmRGN0prRlYrMW4xWE9JYWZ2VnMxMlhp?=
 =?utf-8?B?MDYyZElUQ1luR1VIaUZ2RlhlcC93SUJYY3U2bTRpNkwzaC9FL1p3aUN2cDZ0?=
 =?utf-8?B?YjJzVEY3RTdVUkN5NmxNSzVCYXNkNWZJMGlvMUFlelM1YTBWSjdlY0xTYi9V?=
 =?utf-8?B?TDJ5NGhCbmJQMVpjTVorZkpleS8yalhKY1BlUzZLaFpPT2R4ajhrVGlaRm1y?=
 =?utf-8?B?YnRPcEN6MXBabjNRV1pOc1Fvd0NkWkQwTVBiNm9qaTBBRVNyS0s2WlA1VWo4?=
 =?utf-8?B?eGNWT3Z3STdCaVlNQ0Z5aWFkZUF5TW50eGo0RzFUZ25PU2g1YVF0SytGSzl0?=
 =?utf-8?B?ZVd1R0FWc2t3MDgvdFhTTTdFWDJ5VWRaczFZSkxkSUJFNkQ5a2hGTUkxZ0pQ?=
 =?utf-8?B?TjJnU1JsTTlzYm9jY0xyK2ZnZEUxdzlvUTVrL2l4OU5nbkZtR2Qyd1BOcW5s?=
 =?utf-8?B?NThUck9BZ2JMclJEc21aS2RtWFZzY3dud3JhZTdOYzZUK3ZudnBaRnY4WmlF?=
 =?utf-8?B?dTY2WG4rdGlmT0hXeElkdGVvQ1ZMVm1hN2NSaVVkYnNzTlNwQXVxek9HWDd6?=
 =?utf-8?B?cWsyNGNYYXJkaXp1cURhMVovLzBBMXYvSG5rd1ZTWHdYenlHaEJqMEVVNDFM?=
 =?utf-8?B?ZkR6dHptbXFTS0duWXdaR2FoRUFyUnJ1WTBHRnRLN3RNekZjSERGK0s5UmEz?=
 =?utf-8?B?dFBnWEZUNU1WU1lWd29EY0Y2Yys5ZmNpelV6THhYUXdQSlhyaFdmTTFJRDhF?=
 =?utf-8?B?WllEL0R4UXBxVnh4MkJ1d3RGQW4rbzBOVEtpaEd0eTNLMElaT3h2Y09hTGc5?=
 =?utf-8?B?WnNqazN4blNNZFp5ZjViQmY3WXo5UVl1SFJCYkdRUWJUTjQxYUJOZ1F1TGFi?=
 =?utf-8?B?NWsrVWpqVHlnemwxc2NqeDJKWFo1czA1anRrS3ppa25LemptWGVWOFVUdlZW?=
 =?utf-8?B?OVZFZEZxSVdHS0lRS3dadENVYUxub29vc1VscWhwbzBPK0ZNekY2eEpDeGpT?=
 =?utf-8?B?Tk9sRHRReGQ2YnVGTkd4RkxnN01iQ2YvZnJUWmlSa21IRzFJdlMzYUxnck80?=
 =?utf-8?B?T3IwbndoYXh0MGcvS3dia3AzdUFFc2w3eXFMMDhqUER6L01HZzFqMlZjcmZM?=
 =?utf-8?B?YjlVYnIzbVdGdlZjUlFqTVdUR0JNM2I3eHE5c0VQak44ZXN0SVZlSW10QjBm?=
 =?utf-8?B?NjQ3OXU3Wi9LREsxWmpHK3JoOTAwalFhM2orcjJQZzR3Q1NFVzMwNkMwQXNt?=
 =?utf-8?Q?7wwVfDQdf+HvsHU45MrKc9dngZP0AXRQ2nrRFpl?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7dab7f-2211-4ab8-1d5b-08d8d417da8b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 14:16:59.1540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juqGxAI6PpI1g1g9gVq4N750tAP+UqpnreXDSy6AO/FAaMweJN/GovkC9+0Is9XvKvHokIQBgaf+mA0ggfGZSYTn6IHJPSM3EOmZ021IqOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4353
Content-Type: multipart/alternative;
 boundary="------------C16C36CCCE127A5E59B898F8"
Content-Language: en-US

--------------C16C36CCCE127A5E59B898F8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-02-17 4:58 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Drop 0001-Fix-build-on-riscv32.patch, its upstreamed
> Forward port rest of the patches
> Use OPENSSL_NO_ASM with clang
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-Fix-build-on-riscv32.patch           | 65 --------------
>   ...-Do-not-mix-C-and-C-compiler-options.patch | 86 ++++++++++---------
>   .../ppc-boringssl-support.patch               |  4 +-
>   .../python3-grpcio/riscv64_support.patch      |  4 +-
>   ...cio_1.27.1.bb => python3-grpcio_1.35.0.bb} |  9 +-
>   5 files changed, 53 insertions(+), 115 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
>   rename meta-python/recipes-devtools/python/{python3-grpcio_1.27.1.bb => python3-grpcio_1.35.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
> deleted file mode 100644
> index 920fc1169d..0000000000
> --- a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -From 04e28fdda03b545a0f7b446a784ec2fa7249cbb8 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 29 Apr 2020 15:37:40 -0700
> -Subject: [PATCH] Fix build on riscv32
> -
> -Define __NR_mmap in terms of __NR_mmap2 and __NR_futex interms of
> -__NR_futex_time64 for rv32, since there calls dont exist for rv32
> -
> -Also recognise rv32 as a new 32bit platform
> -
> -Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/675]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - absl/base/internal/direct_mmap.h        | 5 +++++
> - absl/base/internal/spinlock_linux.inc   | 4 ++++
> - absl/synchronization/internal/waiter.cc | 4 ++++
> - 3 files changed, 13 insertions(+)
> -
> ---- a/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
> -+++ b/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
> -@@ -26,6 +26,10 @@
> -
> - #ifdef __linux__
> -
> -+#if !defined(__NR_mmap) && defined(__riscv) && __riscv_xlen == 32
> -+# define __NR_mmap __NR_mmap2
> -+#endif
> -+
> - #include <sys/types.h>
> - #ifdef __BIONIC__
> - #include <sys/syscall.h>
> -@@ -72,6 +76,7 @@ inline void* DirectMmap(void* start, siz
> - #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI__) || \
> -     (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) ||                   \
> -     (defined(__PPC__) && !defined(__PPC64__)) ||                             \
> -+    (defined(__riscv) && __riscv_xlen == 32)  ||                             \
> -     (defined(__s390__) && !defined(__s390x__))
> -   // On these architectures, implement mmap with mmap2.
> -   static int pagesize = 0;
> ---- a/third_party/abseil-cpp/absl/base/internal/spinlock_linux.inc
> -+++ b/third_party/abseil-cpp/absl/base/internal/spinlock_linux.inc
> -@@ -14,6 +14,10 @@
> - //
> - // This file is a Linux-specific part of spinlock_wait.cc
> -
> -+#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
> -+# define __NR_futex __NR_futex_time64
> -+#endif
> -+
> - #include <linux/futex.h>
> - #include <sys/syscall.h>
> - #include <unistd.h>
> ---- a/third_party/abseil-cpp/absl/synchronization/internal/waiter.cc
> -+++ b/third_party/abseil-cpp/absl/synchronization/internal/waiter.cc
> -@@ -24,6 +24,10 @@
> - #include <unistd.h>
> - #endif
> -
> -+#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
> -+# define __NR_futex __NR_futex_time64
> -+#endif
> -+
> - #ifdef __linux__
> - #include <linux/futex.h>
> - #include <sys/syscall.h>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
> index bff50a0a11..373669461b 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
> +++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
> @@ -1,26 +1,18 @@
> -From 2ef8a85933f3ac36b289979ff9edd49dd12d0d16 Mon Sep 17 00:00:00 2001
> +From de10fbc2386dcac3ab810c49b6977b2ee01bf426 Mon Sep 17 00:00:00 2001
>   From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 4 Aug 2017 09:04:07 -0700
> +Date: Wed, 17 Feb 2021 13:30:23 -0800
>   Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
>
>   EXTRA_ENV_COMPILE_ARGS is used both with CC and CXX
>   so using -std=c++11 or -std=gnu99 together will cause
>   build time errors espcially with clang
>
> -error: invalid argument '-std=gnu99' not allowed with 'C++'
> -
> -gcc7 ( defaults are -std=gnu11 and -std=gnu++14 )
> - as well clang default to these standards mode or newer
> -anyway
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -1. Keep '-std=c++11' and '-std=gnu99' to fix native build error
> +Keep '-std=c++11' to fix native build error
>   with old gcc (such as gcc 5.4.0 on ubuntu 16.04), for clang
>   we will remove them through GRPC_PYTHON_CFLAGS at do_compile
>   in bb recipe.
>
> -2. While export CC="gcc ", cc_args is None, it will
> +While export CC="gcc ", cc_args is None, it will
>   cause subprocess.Popen always return 1. On centos 8, if you don't
>   install package libatomic, there will be a native build error
>   `cannot find /usr/lib64/libatomic.so.1.2.0'.
> @@ -28,47 +20,57 @@ install package libatomic, there will be a native build error
>   Add no harm '-g' to cc_args if cc_args is empty.
>
>   Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   ---
> - setup.py                      | 6 +++++-
> + setup.py                      | 9 ++++++---
>    src/python/grpcio/commands.py | 5 ++++-
> - 2 files changed, 9 insertions(+), 2 deletions(-)
> + 2 files changed, 10 insertions(+), 4 deletions(-)
>
>   diff --git a/setup.py b/setup.py
> -index e950057..1b68221 100644
> +index 4b8c9d4..271b7b1 100644
>   --- a/setup.py
>   +++ b/setup.py
> -@@ -144,9 +144,13 @@ ENABLE_DOCUMENTATION_BUILD = os.environ.get(
> -
> - def check_linker_need_libatomic():
> -   """Test if linker on system needs libatomic."""
> -+  compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
> -+  if not cc_args:
> -+      cc_args = "-g"
> +@@ -172,8 +172,11 @@ def check_linker_need_libatomic():
> +     """Test if linker on system needs libatomic."""
> +     code_test = (b'#include <atomic>\n' +
> +                  b'int main() { return std::atomic<int64_t>{}; }')
> +-    cxx = os.environ.get('CXX', 'c++')
> +-    cpp_test = subprocess.Popen([cxx, '-x', 'c++', '-std=c++11', '-'],
> ++    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
> ++    if not cxx_args:
> ++      cxx_args = "-g"
>   +
> -   code_test = (b'#include <atomic>\n' +
> -                b'int main() { return std::atomic<int64_t>{}; }')
> --  cc_test = subprocess.Popen(['cc', '-x', 'c++', '-std=c++11', '-'],
> -+  cc_test = subprocess.Popen([compiler, cc_args, '-x', 'c++', '-std=c++11', '-'],
> -                              stdin=PIPE,
> -                              stdout=PIPE,
> -                              stderr=PIPE)
> ++    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++11', '-'],
> +                                 stdin=PIPE,
> +                                 stdout=PIPE,
> +                                 stderr=PIPE)
> +@@ -183,7 +186,7 @@ def check_linker_need_libatomic():
> +     # Double-check to see if -latomic actually can solve the problem.
> +     # https://github.com/grpc/grpc/issues/22491
> +     cpp_test = subprocess.Popen(
> +-        [cxx, '-x', 'c++', '-std=c++11', '-latomic', '-'],
> ++        [cxx, cxx_args, '-x', 'c++', '-std=c++11', '-latomic', '-'],
> +         stdin=PIPE,
> +         stdout=PIPE,
> +         stderr=PIPE)
>   diff --git a/src/python/grpcio/commands.py b/src/python/grpcio/commands.py
> -index 064dda9..a75d8b9 100644
> +index a8b2ff5..b928201 100644
>   --- a/src/python/grpcio/commands.py
>   +++ b/src/python/grpcio/commands.py
> -@@ -216,7 +216,10 @@ class BuildExt(build_ext.build_ext):
> -             when invoked in C mode. GCC is okay with this, while clang is not.
> +@@ -219,7 +219,10 @@ class BuildExt(build_ext.build_ext):
>                """
> -             # TODO(lidiz) Remove the generated a.out for success tests.
> --            cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++11', '-'],
> -+            compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
> -+            if not cc_args:
> -+                cc_args = "-g"
> -+            cc_test = subprocess.Popen([compiler, cc_args, '-x', 'c', '-std=c++11', '-'],
> -                                        stdin=subprocess.PIPE,
> -                                        stdout=subprocess.PIPE,
> -                                        stderr=subprocess.PIPE)
> +             try:
> +                 # TODO(lidiz) Remove the generated a.out for success tests.
> +-                cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++11', '-'],
> ++                cc_test, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
> ++                if not cc_args:
> ++                    cc_args = "-g"
> ++                cc_test = subprocess.Popen([cc_test, cc_args, '-x', 'c', '-std=c++11', '-'],
> +                                            stdin=subprocess.PIPE,
> +                                            stdout=subprocess.PIPE,
> +                                            stderr=subprocess.PIPE)
>   --
> -2.7.4
> +2.30.1
>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
> index 8ac2aef8c4..dadd3da85e 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
> +++ b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
> @@ -3,8 +3,8 @@ Let boringSSL compile on ppc32 bit
>   Upstream-Status: Pending
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> ---- a/third_party/boringssl/include/openssl/base.h
> -+++ b/third_party/boringssl/include/openssl/base.h
> +--- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
> ++++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
>   @@ -99,6 +99,9 @@ extern "C" {
>    #elif (defined(__PPC64__) || defined(__powerpc64__)) && defined(_LITTLE_ENDIAN)
>    #define OPENSSL_64_BIT
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
> index 8c9ffa21b7..7e071ae1e6 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
> +++ b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
> @@ -2,8 +2,8 @@ Add RISC-V 64bit support
>
>   Upstream-Status: Pending
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---- a/third_party/boringssl/include/openssl/base.h
> -+++ b/third_party/boringssl/include/openssl/base.h
> +--- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
> ++++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
>   @@ -108,6 +108,14 @@ extern "C" {
>    #elif defined(__mips__) && defined(__LP64__)
>    #define OPENSSL_64_BIT
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
> rename to meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
> index 129bb35bcc..198f548fa7 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
> @@ -9,10 +9,8 @@ DEPENDS += "${PYTHON_PN}-protobuf"
>   SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
>   SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
>                                   file://riscv64_support.patch \
> -                                file://0001-Fix-build-on-riscv32.patch \
>   "
> -SRC_URI[md5sum] = "ccaf4e7eb4f031d926fb80035d193b98"
> -SRC_URI[sha256sum] = "a899725d34769a498ecd3be154021c4368dd22bdc69473f6ec46779696f626c4"
> +SRC_URI[sha256sum] = "7bd0ebbb14dde78bf66a1162efd29d3393e4e943952e2f339757aa48a184645c"
>
>   RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
>                     ${PYTHON_PN}-setuptools \
> @@ -24,8 +22,11 @@ inherit pypi
>
>   export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY = "1"
>
> +# Disable asm in openssl due to use of gnu asm see
> +# third_party/boringssl-with-bazel/src/crypto/hrss/asm/poly_rq_mul.S
> +# this can only compile with gcc
>   do_compile_prepend_toolchain-clang() {
> -    export GRPC_PYTHON_CFLAGS='-fvisibility=hidden -fno-wrapv -fno-exceptions'
> +    export GRPC_PYTHON_CFLAGS='-fvisibility=hidden -fno-wrapv -fno-exceptions -DOPENSSL_NO_ASM'
>   }
>
>   CLEANBROKEN = "1"
> --
> 2.30.1
>
>
> 
>

--------------C16C36CCCE127A5E59B898F8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-02-17 4:58 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210217215820.3761256-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Drop 0001-Fix-build-on-riscv32.patch, its upstreamed
Forward port rest of the patches
Use OPENSSL_NO_ASM with clang

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210217215820.3761256-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-Fix-build-on-riscv32.patch           | 65 --------------
 ...-Do-not-mix-C-and-C-compiler-options.patch | 86 ++++++++++---------
 .../ppc-boringssl-support.patch               |  4 +-
 .../python3-grpcio/riscv64_support.patch      |  4 +-
 ...cio_1.27.1.bb =&gt; python3-grpcio_1.35.0.bb} |  9 +-
 5 files changed, 53 insertions(+), 115 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.27.1.bb =&gt; python3-grpcio_1.35.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
deleted file mode 100644
index 920fc1169d..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-Fix-build-on-riscv32.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 04e28fdda03b545a0f7b446a784ec2fa7249cbb8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-Date: Wed, 29 Apr 2020 15:37:40 -0700
-Subject: [PATCH] Fix build on riscv32
-
-Define __NR_mmap in terms of __NR_mmap2 and __NR_futex interms of
-__NR_futex_time64 for rv32, since there calls dont exist for rv32
-
-Also recognise rv32 as a new 32bit platform
-
-Upstream-Status: Submitted [<a class="moz-txt-link-freetext" href="https://github.com/abseil/abseil-cpp/pull/675">https://github.com/abseil/abseil-cpp/pull/675</a>]
-Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
----
- absl/base/internal/direct_mmap.h        | 5 +++++
- absl/base/internal/spinlock_linux.inc   | 4 ++++
- absl/synchronization/internal/waiter.cc | 4 ++++
- 3 files changed, 13 insertions(+)
-
---- a/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
-+++ b/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
-@@ -26,6 +26,10 @@
-
- #ifdef __linux__
-
-+#if !defined(__NR_mmap) &amp;&amp; defined(__riscv) &amp;&amp; __riscv_xlen == 32
-+# define __NR_mmap __NR_mmap2
-+#endif
-+
- #include &lt;sys/types.h&gt;
- #ifdef __BIONIC__
- #include &lt;sys/syscall.h&gt;
-@@ -72,6 +76,7 @@ inline void* DirectMmap(void* start, siz
- #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI__) || \
-     (defined(__mips__) &amp;&amp; _MIPS_SIM == _MIPS_SIM_ABI32) ||                   \
-     (defined(__PPC__) &amp;&amp; !defined(__PPC64__)) ||                             \
-+    (defined(__riscv) &amp;&amp; __riscv_xlen == 32)  ||                             \
-     (defined(__s390__) &amp;&amp; !defined(__s390x__))
-   // On these architectures, implement mmap with mmap2.
-   static int pagesize = 0;
---- a/third_party/abseil-cpp/absl/base/internal/spinlock_linux.inc
-+++ b/third_party/abseil-cpp/absl/base/internal/spinlock_linux.inc
-@@ -14,6 +14,10 @@
- //
- // This file is a Linux-specific part of spinlock_wait.cc
-
-+#if !defined(__NR_futex) &amp;&amp; defined(__riscv) &amp;&amp; __riscv_xlen == 32
-+# define __NR_futex __NR_futex_time64
-+#endif
-+
- #include &lt;linux/futex.h&gt;
- #include &lt;sys/syscall.h&gt;
- #include &lt;unistd.h&gt;
---- a/third_party/abseil-cpp/absl/synchronization/internal/waiter.cc
-+++ b/third_party/abseil-cpp/absl/synchronization/internal/waiter.cc
-@@ -24,6 +24,10 @@
- #include &lt;unistd.h&gt;
- #endif
-
-+#if !defined(__NR_futex) &amp;&amp; defined(__riscv) &amp;&amp; __riscv_xlen == 32
-+# define __NR_futex __NR_futex_time64
-+#endif
-+
- #ifdef __linux__
- #include &lt;linux/futex.h&gt;
- #include &lt;sys/syscall.h&gt;
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index bff50a0a11..373669461b 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -1,26 +1,18 @@
-From 2ef8a85933f3ac36b289979ff9edd49dd12d0d16 Mon Sep 17 00:00:00 2001
+From de10fbc2386dcac3ab810c49b6977b2ee01bf426 Mon Sep 17 00:00:00 2001
 From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-Date: Fri, 4 Aug 2017 09:04:07 -0700
+Date: Wed, 17 Feb 2021 13:30:23 -0800
 Subject: [PATCH] setup.py: Do not mix C and C++ compiler options

 EXTRA_ENV_COMPILE_ARGS is used both with CC and CXX
 so using -std=c++11 or -std=gnu99 together will cause
 build time errors espcially with clang

-error: invalid argument '-std=gnu99' not allowed with 'C++'
-
-gcc7 ( defaults are -std=gnu11 and -std=gnu++14 )
- as well clang default to these standards mode or newer
-anyway
-
-Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
-
-1. Keep '-std=c++11' and '-std=gnu99' to fix native build error
+Keep '-std=c++11' to fix native build error
 with old gcc (such as gcc 5.4.0 on ubuntu 16.04), for clang
 we will remove them through GRPC_PYTHON_CFLAGS at do_compile
 in bb recipe.

-2. While export CC=&quot;gcc &quot;, cc_args is None, it will
+While export CC=&quot;gcc &quot;, cc_args is None, it will
 cause subprocess.Popen always return 1. On centos 8, if you don't
 install package libatomic, there will be a native build error
 `cannot find /usr/lib64/libatomic.so.1.2.0'.
@@ -28,47 +20,57 @@ install package libatomic, there will be a native build error
 Add no harm '-g' to cc_args if cc_args is empty.

 Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
 ---
- setup.py                      | 6 +++++-
+ setup.py                      | 9 ++++++---
  src/python/grpcio/commands.py | 5 ++++-
- 2 files changed, 9 insertions(+), 2 deletions(-)
+ 2 files changed, 10 insertions(+), 4 deletions(-)

 diff --git a/setup.py b/setup.py
-index e950057..1b68221 100644
+index 4b8c9d4..271b7b1 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -144,9 +144,13 @@ ENABLE_DOCUMENTATION_BUILD = os.environ.get(
-
- def check_linker_need_libatomic():
-   &quot;&quot;&quot;Test if linker on system needs libatomic.&quot;&quot;&quot;
-+  compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
-+  if not cc_args:
-+      cc_args = &quot;-g&quot;
+@@ -172,8 +172,11 @@ def check_linker_need_libatomic():
+     &quot;&quot;&quot;Test if linker on system needs libatomic.&quot;&quot;&quot;
+     code_test = (b'#include &lt;atomic&gt;\n' +
+                  b'int main() { return std::atomic&lt;int64_t&gt;{}; }')
+-    cxx = os.environ.get('CXX', 'c++')
+-    cpp_test = subprocess.Popen([cxx, '-x', 'c++', '-std=c++11', '-'],
++    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
++    if not cxx_args:
++      cxx_args = &quot;-g&quot;
 +
-   code_test = (b'#include &lt;atomic&gt;\n' +
-                b'int main() { return std::atomic&lt;int64_t&gt;{}; }')
--  cc_test = subprocess.Popen(['cc', '-x', 'c++', '-std=c++11', '-'],
-+  cc_test = subprocess.Popen([compiler, cc_args, '-x', 'c++', '-std=c++11', '-'],
-                              stdin=PIPE,
-                              stdout=PIPE,
-                              stderr=PIPE)
++    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++11', '-'],
+                                 stdin=PIPE,
+                                 stdout=PIPE,
+                                 stderr=PIPE)
+@@ -183,7 +186,7 @@ def check_linker_need_libatomic():
+     # Double-check to see if -latomic actually can solve the problem.
+     # <a class="moz-txt-link-freetext" href="https://github.com/grpc/grpc/issues/22491">https://github.com/grpc/grpc/issues/22491</a>
+     cpp_test = subprocess.Popen(
+-        [cxx, '-x', 'c++', '-std=c++11', '-latomic', '-'],
++        [cxx, cxx_args, '-x', 'c++', '-std=c++11', '-latomic', '-'],
+         stdin=PIPE,
+         stdout=PIPE,
+         stderr=PIPE)
 diff --git a/src/python/grpcio/commands.py b/src/python/grpcio/commands.py
-index 064dda9..a75d8b9 100644
+index a8b2ff5..b928201 100644
 --- a/src/python/grpcio/commands.py
 +++ b/src/python/grpcio/commands.py
-@@ -216,7 +216,10 @@ class BuildExt(build_ext.build_ext):
-             when invoked in C mode. GCC is okay with this, while clang is not.
+@@ -219,7 +219,10 @@ class BuildExt(build_ext.build_ext):
              &quot;&quot;&quot;
-             # TODO(lidiz) Remove the generated a.out for success tests.
--            cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++11', '-'],
-+            compiler, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
-+            if not cc_args:
-+                cc_args = &quot;-g&quot;
-+            cc_test = subprocess.Popen([compiler, cc_args, '-x', 'c', '-std=c++11', '-'],
-                                        stdin=subprocess.PIPE,
-                                        stdout=subprocess.PIPE,
-                                        stderr=subprocess.PIPE)
+             try:
+                 # TODO(lidiz) Remove the generated a.out for success tests.
+-                cc_test = subprocess.Popen(['cc', '-x', 'c', '-std=c++11', '-'],
++                cc_test, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
++                if not cc_args:
++                    cc_args = &quot;-g&quot;
++                cc_test = subprocess.Popen([cc_test, cc_args, '-x', 'c', '-std=c++11', '-'],
+                                            stdin=subprocess.PIPE,
+                                            stdout=subprocess.PIPE,
+                                            stderr=subprocess.PIPE)
 --
-2.7.4
+2.30.1

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
index 8ac2aef8c4..dadd3da85e 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
@@ -3,8 +3,8 @@ Let boringSSL compile on ppc32 bit
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>

---- a/third_party/boringssl/include/openssl/base.h
-+++ b/third_party/boringssl/include/openssl/base.h
+--- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
++++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
 @@ -99,6 +99,9 @@ extern &quot;C&quot; {
  #elif (defined(__PPC64__) || defined(__powerpc64__)) &amp;&amp; defined(_LITTLE_ENDIAN)
  #define OPENSSL_64_BIT
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
index 8c9ffa21b7..7e071ae1e6 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/riscv64_support.patch
@@ -2,8 +2,8 @@ Add RISC-V 64bit support

 Upstream-Status: Pending
 Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---- a/third_party/boringssl/include/openssl/base.h
-+++ b/third_party/boringssl/include/openssl/base.h
+--- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
++++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
 @@ -108,6 +108,14 @@ extern &quot;C&quot; {
  #elif defined(__mips__) &amp;&amp; defined(__LP64__)
  #define OPENSSL_64_BIT
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
index 129bb35bcc..198f548fa7 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.35.0.bb
@@ -9,10 +9,8 @@ DEPENDS += &quot;${PYTHON_PN}-protobuf&quot;
 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch">&quot;file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch&quot;</a>
 SRC_URI_append_class-target = <a class="moz-txt-link-rfc2396E" href="file://ppc-boringssl-support.patch\file://riscv64_support.patch\-file://0001-Fix-build-on-riscv32.patch\">&quot; file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
-                                file://0001-Fix-build-on-riscv32.patch \
 &quot;</a>
-SRC_URI[md5sum] = &quot;ccaf4e7eb4f031d926fb80035d193b98&quot;
-SRC_URI[sha256sum] = &quot;a899725d34769a498ecd3be154021c4368dd22bdc69473f6ec46779696f626c4&quot;
+SRC_URI[sha256sum] = &quot;7bd0ebbb14dde78bf66a1162efd29d3393e4e943952e2f339757aa48a184645c&quot;

 RDEPENDS_${PN} = &quot;${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
@@ -24,8 +22,11 @@ inherit pypi

 export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY = &quot;1&quot;

+# Disable asm in openssl due to use of gnu asm see
+# third_party/boringssl-with-bazel/src/crypto/hrss/asm/poly_rq_mul.S
+# this can only compile with gcc
 do_compile_prepend_toolchain-clang() {
-    export GRPC_PYTHON_CFLAGS='-fvisibility=hidden -fno-wrapv -fno-exceptions'
+    export GRPC_PYTHON_CFLAGS='-fvisibility=hidden -fno-wrapv -fno-exceptions -DOPENSSL_NO_ASM'
 }

 CLEANBROKEN = &quot;1&quot;
--
2.30.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C16C36CCCE127A5E59B898F8--
