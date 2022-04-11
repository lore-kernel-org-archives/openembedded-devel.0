Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF94C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.61])
 by mx.groups.io with SMTP id smtpd.web11.26706.1649660978209739698
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 00:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=Y1RCpSoL;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.61,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fzlcfPWy1zEEO2CaI3wGtCmqnfvNb9728ppBYBwDi9YRF+EQPbwgVDB8KeSU7O9xQsY4/yNYhgKY+hiP5k4zlr57PWPCGTqHD8vQwYVdvZieRXgl60u2MBbtRlMIUogJ9Rc773vDcQO7BjlLUO2Rj2YdpjTFsPCNFRFW/rGVgp1dhYy4FqDs7Wj8bRl8RTGnUbVjji+AJSvrfS10j7Y4HCsYORX3vZY0FTGVQzFdBaXL9bvMVqxSCXMUXeVfJgIQxNATvj9U6D3zIU2nMV16QLDj8QnqRUTQHtvcI0hY5g5pmXbeaHufGrS1MKRb5Lbs0eIzG1eK1pfQ9alUqF07QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlpiBHX47TvdesMq8TZcMnfgDqC9BMO2uNvW6e+Idj4=;
 b=GFsL1d+N+qYciaEHW+WEkdA5RdK489JRL11gLq4yK5IjpeEWa1S88BztDaDB3e2nnTBmqcTJo7HMNX5UdYOJb1M3C0qONslDWvUJi9PBGrOkT4cE89b3nY8nhm5PfedXO4y2gDPs6xzdO6qdg3gF3vOTMhGHVycwDLN8h7XicbfrYV7eLp+LKhq6NuXZekp3p7wWopIdEM2YPPwAKONa/C2VqNNfyK/Q2IsFY4IjZ5XeH6mfzEZ5DcBK/lQ+4HiEEqKXrTCM+AR+ZoWbioS56znEwZzAGbGx+gt5Jz+0Vv7pSEaaw/g+aAY9ehlrWfGZUI+nkFmSo4GYv0LH0jM1xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlpiBHX47TvdesMq8TZcMnfgDqC9BMO2uNvW6e+Idj4=;
 b=Y1RCpSoLQ5T8dRFlrFapPUPOvTbCJi2bcy70tAoXaIFZLxBPrH5OQS6anE0q4KLUTFIwe8NSbwgTR79zO1w95D0ZYFfFeetGzN/KQroCZNZ04TyjriFRl6m3HlmtuDZlG9zhh/Bmi+D+/Ra1Q+Prup+d6DtBoKSAayZR89xsrZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by VI1PR08MB4560.eurprd08.prod.outlook.com (2603:10a6:803:f1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 07:09:33 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::454:7133:dd03:d8e]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::454:7133:dd03:d8e%4]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 07:09:33 +0000
Message-ID: <e70d3b29-90da-9468-437a-495ff3caaea2@weidmueller.com>
Date: Mon, 11 Apr 2022 09:09:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] grpc: add cmake support for target
Content-Language: en-US
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: 
 <20220408073004.20207-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CAJiuCccdcaYf19Qx8-p7uO5TRPxwiAuwJwhw=AmCR=45DZpVRw@mail.gmail.com>
 <568f92fd-be75-f0d3-5e3d-c4be0e4b6b76@weidmueller.com>
 <CAJiuCce=b-bX54gSxSsmLtQEgLdON0GSrVB3gSYCHQmULnynoA@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CAJiuCce=b-bX54gSxSsmLtQEgLdON0GSrVB3gSYCHQmULnynoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0336.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::6) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 331ef756-e0c2-407c-b428-08da1b8a3b03
X-MS-TrafficTypeDiagnostic: VI1PR08MB4560:EE_
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB456013C4BB813031BD8CA670D7EA9@VI1PR08MB4560.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fHGOh/VKKlA68+Ydeok3/p8txQg0Bxub5nG8ZTmTvW41IohYSE22MNrdhlJvOhtJh/7ggYFFx7xW9bCRRwf7v3gJRLCL3w5nQwbVE+fG5XsAu9inEFCe+j5wEjPjKNheTIq0iy+a+kK5T0Ze6WygnsOvAZF0VTThJJZB33rnDcjrtIRniNdiRv8UTjzCFdy3PFfvOGuoWfDsdL2cw8yGh6UJgA8yT8ZBWo1UciCVzxKXKOAzXzgw+xD2+whpP2HT96yRZ2M1G0AXAjmgGFu+kZgvLhOq3Q58bCgEzKSruuP2mg7w/M2ffwadYlzpJbn8vDOSpeZ5mXiKW9Gu0UT2TCjfB1mxW9/4uw+wFRu0iw8FWFxlUA0dft5YzLOf5KzPDDPL1Udr7IoFli6D6rx7RKylFY3XzJwCC4Aja+fo2ymImQbVMRSaUNReAlb7Ah4H368C0r/9+km9vHasahozyIwimI/669V9PdMhDb5tQOTcB+deG+KZftY0nm8cfUm3yMwj93AmO/LctmStscBotB9bOnVuYcZOoaG5OMk/ZDecleV3zFgnmBAyq+wT8XCmxzmmSoMVnYCKZsNIoY6C/uswl7DIuEdDjOfcym+eVWbcU0gwFpER3mHq5uTfxlorjAmkSuAxot4ziUMjhNBdbNwNwJPg8Iiv9HRmfUFaHKIr3REWSuhXFP+wWr/Vuk6PDoY2ht23M+zChMnQQWSw4xRQi/tnTxSqTNeBJbt10HwAb07DiY+Dtyi/EIi2o/BgJHUWpDRZ/3/k8tfgz7R94GImP2kGbBvdaOOqiPzmokZ3OeEqqcO+j++L9fO8UQEGOnLmsYpdeJfxYf7ZWTNyzw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(54906003)(966005)(508600001)(2906002)(86362001)(36756003)(6916009)(31696002)(316002)(4326008)(8676002)(38100700002)(6486002)(66476007)(66556008)(66946007)(38350700002)(8936002)(5660300002)(52116002)(186003)(26005)(6506007)(66574015)(2616005)(31686004)(6512007)(107886003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?f95ZXvS77vO/mYfz6Ztm1IQxeF92KHdcr7ClLoCSeS61s2aP1YFsso99vcHX?=
 =?us-ascii?Q?kvql27iLo7pa3V1GJsNKDWuBK7GorBgHOaN+dJQ1N5mlTcinOc0xKsTklSwB?=
 =?us-ascii?Q?BBBsSbLfaxjZep69IgQ9gyfZIbRrki7/FJrqFfqfOlkI1n+Bq5mwhA7r4BW8?=
 =?us-ascii?Q?9jGZf4yF8qAyKHszLUQ84DheVmjURuwfdT/DydUbPG9+gnoA/c1fYsm5QtTf?=
 =?us-ascii?Q?yY441/OBrPHZtqc1s7fWOKMA+IqAA2ru7FyVGKbec9+iPq821CWy8FMWZ2N2?=
 =?us-ascii?Q?NJAUPSlmTLHBPXgQRQ8v+8vlyIvl6s8uhcPIlELdz6HkdyKqfNWvKXWI1Qgz?=
 =?us-ascii?Q?r/SJ2bGjKRJiRBkA6ST0g3H0ia8715wz4YP0mHd9vs0ThkWkhlZSA2mUfFFv?=
 =?us-ascii?Q?69jSIf5FPz8S5NyLpRBpboKxImbbkfLEaJid3jo2+hq4G+OoERV+Z2pEMpPi?=
 =?us-ascii?Q?3JNAuRsm9+nHzjR+5OyowIje1B4AdJImEvIu/vFzLmgG5ZbLGdopMcqKxfIo?=
 =?us-ascii?Q?fs+n/CLai9bgmmaTgZ5Ifgeeo6WRFy18XBu8uM0+mNm8idsnjXRaLZkYm7wm?=
 =?us-ascii?Q?zG9oCV3FRmXSPesZqDjrMUUl5/6e67GaIxUA9/3gj6+grSMlrM3PyYFY0//H?=
 =?us-ascii?Q?w834MtwDhBTjd/PQl32whAsvq+pquEa/4PgttjDg3nt/0xKLX5isBEOwvuEx?=
 =?us-ascii?Q?jjGupvcVZzb+759uPYNosyS6DcRueeXVjA7NzU2aiJReNYpd2H9UrZFp153m?=
 =?us-ascii?Q?QBxN3xMpdD1gWzWG6B64iIxzequC1zrYsBm5v3jUEzA7GnnNvrVLTuRNYEe+?=
 =?us-ascii?Q?hfdK6pbAyTadDiSU6617xr9MMYyBrCxI1di5/eHkSMGtxATgrc0pO8Y32doA?=
 =?us-ascii?Q?PIOJiDdtfLCtuKOmtgUS+QFtur/uGcDLplj0GmhIg7wV32CSVs/qbDJjP2RA?=
 =?us-ascii?Q?btmpsojCPf3u2CVePprN/VxBfyHMpLbVwhzXaIK/EzzPV2S4A1t7oWCN/0jj?=
 =?us-ascii?Q?EY9tv2Kk7t2ArJevz5tS29XSgyKj7JjiwvimrdZu+9ZfTgRI5qQ9aQQeLqgy?=
 =?us-ascii?Q?5wJd42KJF9WBD4sU14eEPA3Z9isEu2Oqh/kUQdagLHJ7R1+TzBNlrgFGwUKP?=
 =?us-ascii?Q?o/0D9ml9hw6+CNrNGnrg1eSuD0yw2b6LKnvX3ELmME8Q0My7TZMr0UMveMHF?=
 =?us-ascii?Q?TBgBXiButigacTgwW7mn+8Mr4rYpTzJ+i72vfAmd/IQGZFbE1LNWWTl3P+Mh?=
 =?us-ascii?Q?6TQiM5VOYGqGxxl99wBa6TteqRm8kLjWH8GDUdDPQOVvRjeIT1js0WLVnJHt?=
 =?us-ascii?Q?o7brvGHVNRaeoVhDj6/MOzHPLeiVUgdWibGWOP3weXFwWfVD0lHqDXEuL460?=
 =?us-ascii?Q?w68QyRIj2XYyUrUU2ykidJuwpS5QvREsTatsmb//8x+kkGDTdxZhLg5uZM26?=
 =?us-ascii?Q?dDrEs6UXOmoXrobr3c/0iik38xnReycurqN6eq8zdxnwjbXyRevPKBDJhGIC?=
 =?us-ascii?Q?5ik3T5e7SUNx9Vph59fOcgUGsMAKQRSO5ClfXAFacmciNBfDYsMpoPEF3VJb?=
 =?us-ascii?Q?DxPBeBNC714zqUgOvGpyXDE7d6yMNDqtq8t4s6kisKf96HaBXIsdARi1bBZu?=
 =?us-ascii?Q?YbaO9mpzV5S+e1Gw2zqrb333coT6SNwEnuHEZj7+jy39o15XxlGANC+lOrOX?=
 =?us-ascii?Q?JclWv6K7Ogc7oCDOOujOlgFpfbqV9+uGBRB/QkjY1Jed6MG0IrQNkLn2+Z9e?=
 =?us-ascii?Q?2aoofaj2UgC/EgaL5ZIBhIYYim1Bsrg=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 331ef756-e0c2-407c-b428-08da1b8a3b03
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 07:09:33.6975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lkC/wNvwWRKpPadSXWjf6gn5m1Y7MdftnRJGVRTW6f1kIJ1a9Nb8/9WJA/2+Ut+5ylXjz3+uyYY8IjfzDNbueQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4560
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96546

Hi Clement,

Am 08.04.2022 um 21:12 schrieb Cl=C3=A9ment P=C3=A9ron:
> Hi Stefan,
>=20
> On Fri, 8 Apr 2022 at 14:47, Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>>
>> Hi Clement,
>>
>> Am 08.04.2022 um 14:25 schrieb Cl=C3=A9ment P=C3=A9ron:
>>> Hi Stefan,
>>>
>>> On Fri, 8 Apr 2022 at 09:30, Stefan Herbrechtsmeier
>>> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>>>>
>>>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>>>
>>>> The CMake gRPC config checks for binaries and fails if a binary (plugi=
n)
>>>> is missing. Fix the problem in the code and add the CMake gRPC config
>>>> back to the target package.
>>>
>>> Thanks for your patch, I'm still using gRPC 1.35 + your previous simila=
r patch.
>>> I'm trying to bump to gRPC 1.45.1 + these patches.
>>>
>>> My recipe use CMake and depends on grpc and grpc-native:
>>> PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grpc gr=
pc-native"
>>>
>>> But unfortunately CMake doesn't find the grpc_cpp_plugin.
>>
>> This is the correct behavior of my patch because the grpc_cpp_plugin
>> from the cross build isn't usable during cross build. You need the
>> grpc_cpp_plugin from the host and therefore have to search the
>> grpc_cpp_plugin by yourself during cross compile [1].
>>
>> My first patch was rejected and therefore I create a minimal patch which
>> only make the CMake gRPC config usable.
>>
>>>
>>> | -- Using gRPC 1.45.1
>>> ....
>>> | CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
>>> |   Error evaluating generator expression:
>>> |
>>> |     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
>>> |
>>> |   No target "gRPC::grpc_cpp_plugin"
>>> |
>>> |
>>> | CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
>>> |   Error evaluating generator expression:
>>> |
>>> |     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
>>> |
>>> |   No target "gRPC::grpc_cpp_plugin"
>>> |
>>> |
>>> | CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
>>> |   Error evaluating generator expression:
>>> |
>>> |     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
>>> |
>>> |   No target "gRPC::grpc_cpp_plugin"
>>>
>>> Here is my CMake source file:
>>>
>>> # Find Protobuf installation Yocto SDK doensn't support protobuf-config=
.cmake
>>> # for the moment
>>> set(protobuf_MODULE_COMPATIBLE TRUE)
>>> find_package(Protobuf REQUIRED)
>>> message(STATUS "Using protobuf ${Protobuf_VERSION}")
>>> set(_PROTOBUF_LIBPROTOBUF protobuf::libprotobuf)
>>>
>>> # Find gRPC installation Looks for gRPCConfig.cmake file installed by g=
RPC's
>>> # cmake installation.
>>> find_package(gRPC CONFIG REQUIRED)
>>> message(STATUS "Using gRPC ${gRPC_VERSION}")
>>> set(_REFLECTION gRPC::grpc++_reflection)
>>> set(_GRPC_GRPCPP gRPC::grpc++)
>>>
>>> # Get full path of protobuf/gRPC compiler
>>> set(_PROTOBUF_PROTOC $<TARGET_FILE:protobuf::protoc>)
>>> set(_GRPC_CPP_PLUGIN_EXECUTABLE $<TARGET_FILE:gRPC::grpc_cpp_plugin>)
>>
>> You have to search the binaries if you cross compile [1]:
>>
>> if(CMAKE_CROSSCOMPILING)
>>     find_program(_GRPC_CPP_PLUGIN_EXECUTABLE grpc_cpp_plugin)
>> else()
>>     set(_GRPC_CPP_PLUGIN_EXECUTABLE $<TARGET_FILE:gRPC::grpc_cpp_plugin>=
)
>> endif()
>=20
> Thanks this fix my issue
>=20
> Tested-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

Thanks for the test. Maybe you could comment to the grpc pull request to=20
get attention.

>>> Do you have an example of how you look for gRPC in your recipe?
>>
>> This isn't possible because you use a target and not a variable.
>=20
> Maybe a dumb question but how protobuf-compiler handle this?

I don't know. The recipe use autotools and not cmake at the moment. The=20
CMake project have a module for protobuf [2] to create the targets. The=20
grpc example use the same code as above to find the program if you cross=20
compile.

>> [1] https://github.com/grpc/grpc/blob/master/examples/cpp/cmake/common.c=
make

[2] https://cmake.org/cmake/help/latest/module/FindProtobuf.html

Regards
   Stefan

