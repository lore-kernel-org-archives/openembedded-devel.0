Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.70])
 by mx.groups.io with SMTP id smtpd.web10.35738.1615212221870782693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 06:03:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Q7eoQFOz;
 spf=pass (domain: windriver.com, ip: 40.107.237.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NtnmgvhAfxmmj4KpqBN0Bh5i49z1zbsThBYnp6F2KhL92Ztjt4vjbLhyyWo4luTHofjNNiBjpMlI469AMtVVpOukRDpSPAC15pU/vYS+rb/LMT16b9sWTioIJr0W4Tr/eVxlyCo7L2ecZZAMcbWXsqYOi44qQRz20khYnL0ppfeqYzBc725XURAbSVCGMkN2GSSYnw+DKIDF2la1dnXyfbMv9u+GQtkSY0310uX+TSYzMdoBh0Vf9EOBdJ9rfwYJ82x/H3noEl3LZ8agjh5xzEGBq/x5T6n8RHBmnSsZNNJr6fk38ABdZF90ydpH6d8ylu7gzwGc18ns0X80mWiqlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LrDvKIM6YZvtCgcPw7cly1VjnW3z/s+/sUAq9ZMDFo=;
 b=SFoE3VWSulCDnLhueqYybfccEGTmjV1tXvZlL1oi1mJ+PZWLjKGi8QD3VS/aX1HxixQEC+eK/XYfdiSAsSFqGUKc6/tCx3MzU8FRjQfCB9kuH/NfcGUK1C59lrYHrLcetN7ZPUUtZm81Y78Q+oSy0KyY+Rvd/sULac846Nl7c1ZdPO2LLbDo5womMKBUUOjWGEYKA8jwAmtTJrh+Y86JrmDSRxAYu2kXfywizcjZgIZXPFuFkqFqCe2Ijz1Mo4NHN37nymCP0EYSX0YCOnN+Fvx7Thn/beNI8Kp6lEP0qLybfcHKbpMHhUE8eEpAPrwmP3Tp7ZE0KUd5XB3e1uu9Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LrDvKIM6YZvtCgcPw7cly1VjnW3z/s+/sUAq9ZMDFo=;
 b=Q7eoQFOz3oTGnTP4ggtmHNfUMrDQtAGZqy4stol60D5m4yxq5UvUbPxgIeTLIJ/Gb1ryhtbf2+wpn4F/UMWzIY2aXilE4uLg3NfPycudD58M4WsHPny0BZ8C1/FUXIUwmlG/6MtQLKLf2qolSkoMa+K9ig7pM+ezSfa+tB+cTuo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26; Mon, 8 Mar
 2021 14:03:20 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3890.037; Mon, 8 Mar 2021
 14:03:20 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-grpcio: Fix build on mips and musl
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210304044148.2032330-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7926ae18-41b3-6201-7046-7d03259890c5@windriver.com>
Date: Mon, 8 Mar 2021 09:03:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210304044148.2032330-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL0PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:208:2d::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL0PR03CA0003.namprd03.prod.outlook.com (2603:10b6:208:2d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 14:03:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbc299b6-2d48-4bbd-d36d-08d8e23aede0
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103D1EE360B8266776FD7359F939@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RNUx2yBkISC10bzDWwbl921gxWpEJ7Fq+7Oihe2GJGfoqP8CjOHrqBkaF8AvJKwY/nn1UUJ0zGjJ2YJ2AcnW/k8F7rKEKO2NJV/0/nzN/KkSPJPdv1rKUFxkveV+2/zp0HwllL9SUyPPBD2hMHnnInyHhIdKMCGsj8LBf3+ITTnpdbhoYD4rLXW7YA8pAczUNJIoSLIPgS0H5PlD+sgy3eOe9ESKcvoGebsZcf9DfttOuMPl9Evrdh97M0FsTOcxQDBDL1gEb9DBIC635o4kzBUiJw8iDo88xqnlWObsvREZsFtNU47rhHeg/KgX09RFRM6kkzk/RrF0ZktYYytUCspqQGA4Fp8i8t8pUBtQgE6RPLA97xBMPgqLZ7pZ8nBG+ivtbgYFI+yf2a93diGqdqknyLq5xMzFNOzaoatL8yz7zuHwSbrvMQaC02GbCiyCrhtkiE2atijfIG7PU8hiWYpp/OcsaKsHij3oiZGCaHFvRPqQdsX1PtHLvvH05TrJIzTXK77tKT8hZ9AMhNxA4VDkPmkbQjgSyoY5TCu3sqWMY4yt88woa0Lgt58hsiW7nhHaorGCIKgwoEUa5RM9+uApPBBun/ZiUuMXEnBF7txKvww6lPhRN2mwHseq+XHJhP+nJVkhHBk/9nZHXW/7zPyj2BpH5hOn2pAYn4WK0wtU0XPDc89Ybyg+mlz+XPBr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(346002)(136003)(396003)(44832011)(66476007)(2906002)(83380400001)(16526019)(26005)(66556008)(36756003)(31686004)(86362001)(31696002)(16576012)(8676002)(6486002)(8936002)(956004)(478600001)(53546011)(316002)(2616005)(33964004)(166002)(66946007)(186003)(966005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NklLYVQrWkJMRzUvNDhVVFF0R29ObXpBb2tsbzhRdTZVQi9vNndIekdPeXgv?=
 =?utf-8?B?QklzZjdmQUpVYTZBaVFJcDFKRy9OaE1WaHNDY2pSSWJxeC9yMWlBZzMrK0lU?=
 =?utf-8?B?YTBkZ3lQQVBVaFlIMml1RWJDVi8xUmRoelZJbkI3U3hDT2toRWdNZHJ6d2VR?=
 =?utf-8?B?Z2ZXT0JMWW1mSVQwSTVlMG8vdW9ORE43TEozdUFDRUJNR0pXYjlxbzZsWFFZ?=
 =?utf-8?B?ZFhodVQwS2gwbGhjelRxb29saENGV3dsSkJSQ3k1M0hTckpSalIzWUdHa21S?=
 =?utf-8?B?UkovY01aK0h1MEVJRVJ3SWh4eG56Zy9OZ2h1VHBiWHZPbFA1YkhPb0p6bHBi?=
 =?utf-8?B?YTRrbkRkYTVHS09lSnBRQUNZTzFuMjZQWHNDMjdsdUJYNmpsSHBsendZQ01m?=
 =?utf-8?B?VEVGZjBtbldJVnhDUVhOZkJMMnNEa2k1VUtTSUFNRWoxbVVENzQxWDZOQStR?=
 =?utf-8?B?U0s1c3FIRHJaNDh4R3FZbGp2RUpaanpjTnpnZlFtdEZhbThwSHdrOG9tYXNT?=
 =?utf-8?B?VHdaQ0pZcDhPMGVvc3NWMlRzTGRBU0UrSUprYUNJaEpOc1FNakJuaUNGU1F5?=
 =?utf-8?B?dHVJc2wxRHFLcEEwWnJiZ2Y4eVRHL0Y4T1NTdlAxc0hVb0l0eFI4d0tOZ3dq?=
 =?utf-8?B?OHVmaU50dElvbVcyN2FXTDYwMXVPYUVPa3pad0J2K05nQ09EZHRITU9NdGx2?=
 =?utf-8?B?L3YyQjJHM3g0T1JvNXhMeHJDYkRQUkxRTWpZS08yWVVSeHlUNHhTM0ZacXlC?=
 =?utf-8?B?QWttL2d0dWlpK1RXQzcyeklVQ1FFRmxmZmJ0UDRWY2tYVG9MbVhKa3poVzVO?=
 =?utf-8?B?Z1NrK1RIRXVabGllTzlTS1hvZGU4Z2JqUzlyVEc4TTRPTXNsbnVTaXNJc2VS?=
 =?utf-8?B?K2h2VWZOVDZOeDlNMG1aZWFEai9vZ2RoWkxTNitzTlVZYXpzUDlLN1pOam9X?=
 =?utf-8?B?Ukw4Y290Yk4xa0dVSzU4SGdVallid0JqS1c5Kzk4T2luMGpicTVMWWxZcDhk?=
 =?utf-8?B?QXlHQ2FpMFROS3QyVmZKR1dhcUJ3aUJuOVM5M2xUcFRVbTB1ajZtUStQRVp3?=
 =?utf-8?B?L1RmZHhIS0ozbVA2akQ0c2FDOFkrdmN2V21qV25uKzA2YWhiWGFlT0R1NHNs?=
 =?utf-8?B?MmNVUm1wR1ZyQ2VQTVJudVFsNEVXMDJUR3A4bExHTGRhV0hEMTJDK3R5c1BB?=
 =?utf-8?B?czV4VFdPY21GUE92bTUvcG9pazd0TTQ4MzFXN0tvRDlXWkJCTE9JY3dLMms1?=
 =?utf-8?B?MXF0eU9jUFdTL0FLY0hsNS9aSkh1MzJjcGRIaEZxd0kvOHRJakt4RDMwak9X?=
 =?utf-8?B?Zk1DbThhanZyRXNnaDA1WXJiQ0hWVGgwcHRHWjJDS2JGbVlDN0RKY3FrU0hV?=
 =?utf-8?B?bkZ5b0FMd0piSkYyYVMyVkNaejJlSlhXWFFIdXFHMVZCOXVidkNLbXJsSFdY?=
 =?utf-8?B?ZmNrYncrMis3WTE5YU5KYlRzK2d5R1BQRElTQ3ZLVHpxU0hsT1BnYllYRXJH?=
 =?utf-8?B?RkJGZzVXRFFiS3BkckRYdHk0aWE1NXRFYTA1QVNYeDQzM2xhNXV1QXZqbmNL?=
 =?utf-8?B?SlJwblcyZjBTd3c4eDE4RTltMmM3ZEhvOVo2WXBWNTVrM0o1NCs2MGJiTDdq?=
 =?utf-8?B?dk1rQWRRSFJuSVVDNEVuQ3JXTFZ6NnEyb2RmQ1NXQW92WGJNSmZ3dmpHRExF?=
 =?utf-8?B?aFNjNWNxUVpGNHkwWElJLzJqd1ZQdXZQSnBPSlNsSkROR0pDNGlDSVlkNTMr?=
 =?utf-8?Q?cbXhRO6t0eCmQcuaAbCdFwxWVLkH45v4lx3ye6x?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc299b6-2d48-4bbd-d36d-08d8e23aede0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 14:03:20.1958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTFNiwij9TrQ9aIs2mNZ0hJFBE42fl36Cuxg3kEbNnSFftAGn1FsnfF2TazD1aH0v34djCO6vhrvG+0tnQpl1UfPOl1UTJPS2dsISTD/Tkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------52C4CE239B345AF32285BAD4"
Content-Language: en-US

--------------52C4CE239B345AF32285BAD4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-03 11:41 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-absl-always-use-asm-sgidefs.h.patch  | 33 +++++++++++++++++++
>   .../python3-grpcio/mips_bigendian.patch       | 15 +++++++++
>   .../python/python3-grpcio_1.36.1.bb           |  2 ++
>   3 files changed, 50 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
>
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
> new file mode 100644
> index 0000000000..be516ca508
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
> @@ -0,0 +1,33 @@
> +From 8f21fdfb83b0fa844a9f1f03a86a9ca46642d85e Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 9 Apr 2020 13:06:27 -0700
> +Subject: [PATCH 1/2] absl: always use <asm/sgidefs.h>
> +
> +Fixes mips/musl build, since sgidefs.h is not present on all C libraries
> +but on linux asm/sgidefs.h is there and contains same definitions, using
> +that makes it portable.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + third_party/abseil-cpp/absl/base/internal/direct_mmap.h | 6 +-----
> + 1 file changed, 1 insertion(+), 5 deletions(-)
> +
> +--- a/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
> ++++ b/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
> +@@ -41,13 +41,9 @@
> +
> + #ifdef __mips__
> + // Include definitions of the ABI currently in use.
> +-#ifdef __BIONIC__
> +-// Android doesn't have sgidefs.h, but does have asm/sgidefs.h, which has the
> ++// bionic/musl C libs don't have sgidefs.h, but do have asm/sgidefs.h, which has the
> + // definitions we need.
> + #include <asm/sgidefs.h>
> +-#else
> +-#include <sgidefs.h>
> +-#endif  // __BIONIC__
> + #endif  // __mips__
> +
> + // SYS_mmap and SYS_munmap are not defined in Android.
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch b/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
> new file mode 100644
> index 0000000000..343f25a46e
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
> @@ -0,0 +1,15 @@
> +--- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
> ++++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
> +@@ -102,10 +102,10 @@ extern "C" {
> + #elif (defined(__PPC__) || defined(__powerpc__))
> + #define OPENSSL_32_BIT
> + #define OPENSSL_PPC
> +-#elif defined(__MIPSEL__) && !defined(__LP64__)
> ++#elif defined(__mips__) && !defined(__LP64__)
> + #define OPENSSL_32_BIT
> + #define OPENSSL_MIPS
> +-#elif defined(__MIPSEL__) && defined(__LP64__)
> ++#elif defined(__mips__) && defined(__LP64__)
> + #define OPENSSL_64_BIT
> + #define OPENSSL_MIPS64
> + #elif defined(__riscv)
> diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> index d374b54b34..3d875bf4ba 100644
> --- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
> @@ -10,6 +10,8 @@ SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
>   SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
>                                   file://riscv64_support.patch \
>                                   file://boring_ssl.patch \
> +                                file://mips_bigendian.patch \
> +                                file://0001-absl-always-use-asm-sgidefs.h.patch \
>   "
>   SRC_URI[sha256sum] = "a66ea59b20f3669df0f0c6a3bd57b985e5b2d1dcf3e4c29819bb8dc232d0fd38"
>
> --
> 2.30.1
>
>
> 
>

--------------52C4CE239B345AF32285BAD4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-03 11:41 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210304044148.2032330-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210304044148.2032330-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-absl-always-use-asm-sgidefs.h.patch  | 33 +++++++++++++++++++
 .../python3-grpcio/mips_bigendian.patch       | 15 +++++++++
 .../python/python3-grpcio_1.36.1.bb           |  2 ++
 3 files changed, 50 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
new file mode 100644
index 0000000000..be516ca508
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
@@ -0,0 +1,33 @@
+From 8f21fdfb83b0fa844a9f1f03a86a9ca46642d85e Mon Sep 17 00:00:00 2001
+From: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+Date: Thu, 9 Apr 2020 13:06:27 -0700
+Subject: [PATCH 1/2] absl: always use &lt;asm/sgidefs.h&gt;
+
+Fixes mips/musl build, since sgidefs.h is not present on all C libraries
+but on linux asm/sgidefs.h is there and contains same definitions, using
+that makes it portable.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+---
+ third_party/abseil-cpp/absl/base/internal/direct_mmap.h | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+--- a/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
++++ b/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
+@@ -41,13 +41,9 @@
+
+ #ifdef __mips__
+ // Include definitions of the ABI currently in use.
+-#ifdef __BIONIC__
+-// Android doesn't have sgidefs.h, but does have asm/sgidefs.h, which has the
++// bionic/musl C libs don't have sgidefs.h, but do have asm/sgidefs.h, which has the
+ // definitions we need.
+ #include &lt;asm/sgidefs.h&gt;
+-#else
+-#include &lt;sgidefs.h&gt;
+-#endif  // __BIONIC__
+ #endif  // __mips__
+
+ // SYS_mmap and SYS_munmap are not defined in Android.
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch b/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
new file mode 100644
index 0000000000..343f25a46e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
@@ -0,0 +1,15 @@
+--- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
++++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
+@@ -102,10 +102,10 @@ extern &quot;C&quot; {
+ #elif (defined(__PPC__) || defined(__powerpc__))
+ #define OPENSSL_32_BIT
+ #define OPENSSL_PPC
+-#elif defined(__MIPSEL__) &amp;&amp; !defined(__LP64__)
++#elif defined(__mips__) &amp;&amp; !defined(__LP64__)
+ #define OPENSSL_32_BIT
+ #define OPENSSL_MIPS
+-#elif defined(__MIPSEL__) &amp;&amp; defined(__LP64__)
++#elif defined(__mips__) &amp;&amp; defined(__LP64__)
+ #define OPENSSL_64_BIT
+ #define OPENSSL_MIPS64
+ #elif defined(__riscv)
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
index d374b54b34..3d875bf4ba 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.36.1.bb
@@ -10,6 +10,8 @@ SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch">&quot;file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch&quot;</a>
 SRC_URI_append_class-target = <a class="moz-txt-link-rfc2396E" href="file://ppc-boringssl-support.patch\file://riscv64_support.patch\file://boring_ssl.patch\+file://mips_bigendian.patch\+file://0001-absl-always-use-asm-sgidefs.h.patch\">&quot; file://ppc-boringssl-support.patch \
                                 file://riscv64_support.patch \
                                 file://boring_ssl.patch \
+                                file://mips_bigendian.patch \
+                                file://0001-absl-always-use-asm-sgidefs.h.patch \
 &quot;</a>
 SRC_URI[sha256sum] = &quot;a66ea59b20f3669df0f0c6a3bd57b985e5b2d1dcf3e4c29819bb8dc232d0fd38&quot;

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

--------------52C4CE239B345AF32285BAD4--
