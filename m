Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62171C43217
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.58])
 by mx.groups.io with SMTP id smtpd.web10.5289.1649422077719521756
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 05:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=wpKWJFny;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.58,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7jjCZHh0NuX61SHIa4r0EqmrUjFSpInM4hhfjBCwoc+QbRQTJt3hlgh5fnFxfHIPCtR9cWZtdw2uy5vtdN0xedaE/53vEY6WkjKO9G7ErogekDupwsLcnFUOnr+emGvJ03eQqVIS3DoaUSENwA9EwZ8fH2CY+wB7E2Fr2euYTPPkUas6XNu6Af/PzsfDz5TKTAUv08m5E4/76WiPgNLhnNh3A++PClae4DSPsvIc5SiU+uw2tlT2KxGM8R9zoy/yb2Ea78iN7TH64AvhKY6w7GyuR6kcAY3Pl7WSofuxBd63dUaH69WPWdzQW+6REeGaSzCt+66T/fVvw5Ysoievw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uW1tiHMMahlhtbeB9EJRoUoHcj1bRxDe/1UemwukuXI=;
 b=nR54PIZhkZtgR7Q+bcpA7PpPrFjvBu0dLZvZV1HjTjxb8/hSI280YfZrDOUxGFfaCJiBigVWSO7II9XnrByC8o53V+GieeyUKh4SNTAvE/akiu2dv0AYhG0uWtiDbAZxzVk8WxKbD/Okc8K60mQEzwptqtWh4MKLiwrQv5wcqlSW2384T4sYtUwmCRjeJj96MOxwSJCuz289ONzD6ygb2PHXhpj11OxRv76gB0COvKunANAXtXG9P+E7QFEkIV6fc27jh3kXVXapA1OZhEJ+GpsDBko2B078fPambXMlw6e02mJBHV6JHXjhp+KsYY1KBDLxYfLhQjP+AeoLWLb3bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uW1tiHMMahlhtbeB9EJRoUoHcj1bRxDe/1UemwukuXI=;
 b=wpKWJFny+0aCAdCsKcc7jdhE83ik3//oBuFlAkRH5fv9H/ItAfDqBSymPQGVe302YWrzkniC1zmZ2rvRwmvd3tp0IxGgFRS6o69o9XZ3txt96NNv+lJh8KZcG5KK5MNqg7r6rz3WMdHQsdom5xFsqqlpArOYsdrUyp20Crju3+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by GV1PR08MB7364.eurprd08.prod.outlook.com (2603:10a6:150:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 12:47:53 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::c53d:64fa:866b:b512%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 12:47:53 +0000
Message-ID: <568f92fd-be75-f0d3-5e3d-c4be0e4b6b76@weidmueller.com>
Date: Fri, 8 Apr 2022 14:47:52 +0200
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
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CAJiuCccdcaYf19Qx8-p7uO5TRPxwiAuwJwhw=AmCR=45DZpVRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0030.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::43) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4482c9c1-50ea-4764-8413-08da195dff2d
X-MS-TrafficTypeDiagnostic: GV1PR08MB7364:EE_
X-Microsoft-Antispam-PRVS: 
	<GV1PR08MB7364200B53EC97EDDC99E0AFD7E99@GV1PR08MB7364.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JA6uIPFhHRE0GjvJZ5S+xp5Svlis+rb6pBPsEN6YG1M1x1kk1/hhuV1+422aS5452M1y5/GWLg6bZ80/eR/eIKJSQ+9JhSmeGKjEImITCNUnu1Bdg7U5vQ9Py0UWEF+Q4lQsxPmTMSke5tlq6zdsLbXOUe0XCix8CrR5741ITAiHh1ItZWR3aUo0KBWVA/wIunEwfCkowyfzsJ8E0k3u0mptnDSD/sHUHI4PcS8sDwM1+GaNLnfTNhWQkBW9sE1wlOCy8xXcyNiaCryfgCge43tXp4LLXJcoiL7YSNysP2UiNm6G20kzzygUYCtiHiX0LyB9RHLbUWbz4xIpxRtU/4P+fBcMx3HfI3YYOqSvYoSxhxMdZ3+D/onTkAKuqbRFD3R8IgiMrwZjSEH0Pj4NtCc0nk2wjToc1pRg+aOtJOKsYTHN60gs9NFRfv6PRgzyWrqygpEW98Zl3oYzY9aVD7qGyUx5Pvsct0jCK/N6S+r/kB+/FQtUby0gvj6N7vdtJoBjWvUNorVl3X8csBAdKqzpUjn4eJffVcAqO+oW+qwVX1B814gBZ1G8643GyFqwcaQ98lvN/0HpxCuCqS31JvRzb9+qq7gr8NAsfu0aw1nTIUc14ZuiK34DsxdUs3iA0f3tOQWw/PrLJgfWM0832RFt9HGmLaLmfSd9kXOtxTo/Qe+Mn0haHv2XbrfioqDMjZJqGN+U11m6Hl/FmAd81PSRth/c0MJh98z4/IiQzIdMx6MNpl3E0uusu0yMErgv4yyUn+q5bfyNfbFW5fjfY+EN+QRKcsfvzeOkNQn2d8+JkywZqntXzUNayKLNYAMmMwUIFqRZz2163vHPc9h/nw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(54906003)(5660300002)(31686004)(107886003)(2616005)(38350700002)(6916009)(186003)(26005)(2906002)(66574015)(31696002)(86362001)(8936002)(8676002)(4326008)(38100700002)(66946007)(66476007)(36756003)(66556008)(316002)(508600001)(6506007)(6512007)(6486002)(966005)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gwzjlUrqA//o5UPKGXplNHnv3UnuCbhMQ9Fgrd20YPC9Ug3wD56En97bQfNp?=
 =?us-ascii?Q?8ovwUt2GYeUR/ZcGIvXTrYjWUQye162/Dvlnb4hIG0yDBRp+0uSsBABBarof?=
 =?us-ascii?Q?aYwvifY+QegLWywts8WIHd4YRSevh2ZyEt+BuWNyr0VLhUTIX8GiqwBi6tI2?=
 =?us-ascii?Q?zbDv6czSpVm+RjNEsFFnGq04JAGpcChzhpAnx4mvGDdNNcRIOM0GVRVq6jRE?=
 =?us-ascii?Q?zYRSWCjQFSoajSptwShcWvCJ4ovTGb3yUFA3/KumhpwJTg7GGQZVWJZuk7jU?=
 =?us-ascii?Q?iqRBLOk01SDxtlTVZ/GEp9U7PwpOo4DW8IUlx/9mkrT6Jj5O+o1LUfmP+4Rj?=
 =?us-ascii?Q?NdBcmKPKldZbxxbs2bdF6AgiHaWFvoqdPjBtR5ZB4leGQswQj1QLVeHGfHWd?=
 =?us-ascii?Q?Mut2uEpJkR7SEiS3iS7/W/SRl0pAH4w7tr4oh1dbe/5B1iVJ27TB7l0wpBxN?=
 =?us-ascii?Q?PgxxvBhs8QxMR63J4dObMQO2lyxlItMKWyEPKvEKHqPbmC8LEDYqDaIiTRC8?=
 =?us-ascii?Q?2GW2ACTrl50N3RfsIRQ4zDu1BU+VExmf1A9kdRYebCJ+LnKHOcvgGZEfxaxz?=
 =?us-ascii?Q?/x4HGGXCj0r12OrQgn7zp6RMEnh1JcXhgUWCzw8M+3OH+5kh4N9lwu78WbGv?=
 =?us-ascii?Q?85raKfzO2eJkbyURkOJkCCp0sCx2qKaF1NvVUCJLoWRS8IgsUxPjPu/UCvHq?=
 =?us-ascii?Q?28Y1mLXX5ntGZ3xaWVpPpDd4GbvC/IF7Zhc/oFqmkRunqtG6CtPTeZx3g47Q?=
 =?us-ascii?Q?x8gMS5V8PWJ6v+Ob3BAhqYi6aJCVW6CBuWzLUrMosrks/hLwqeb2cUOTr7Rd?=
 =?us-ascii?Q?qT5mVarYoWpzmRNsbpJU807yAz2DFmUK8c3fqgV20hmo8CYNfoVdUGZsDM0p?=
 =?us-ascii?Q?tmO4jPcqb7u1IK5g7fiKaXpdCaqFzc82iKI+XKpbI4/IIND8vhVWVxa7pLPp?=
 =?us-ascii?Q?nGIerFHVb+FxF2KVX+3FTZrvySBmqNz1aB2VxojOEgM+TN6cCZsIR18DAQXJ?=
 =?us-ascii?Q?Y2JFMf7WXqqtRiGjgCRZ3t8uvIpnP5s51hgNLiWtO7YLM6/m3s9JLRy8RsSt?=
 =?us-ascii?Q?JHhBDIEIvqVdoJIfLGsvTZ2qE6Vv6V0aLc9dNUQgy3icin9HCw7Pzm+X/Gn0?=
 =?us-ascii?Q?nXPV8VtPNyBoJxKMRVR/tV9khe0XdtoCCuCX7ZUPtJBH+hjcxBW7JJs+19Pa?=
 =?us-ascii?Q?sQj5spSCPt9SjWBUaoKcEYi3lcnNbbkxjuEazMa7BWJOiI0Xow2a8FB94wR1?=
 =?us-ascii?Q?mIYZXCct+nQSUeI+959S+H3cy1mK4/siqL85dHMhpFEJZEKMJ2gPzNwK0wUR?=
 =?us-ascii?Q?uuzM6QEg6FpRO1jQ4dVqB0yKxd7sDid86DORF+zffT4q7UXq8ab0pHlKKR1H?=
 =?us-ascii?Q?Knggcu/z+XNozQLKhW3s7kT0pZ0fisyG4XXVEsGPzmetF0evbOLWu7v20nX8?=
 =?us-ascii?Q?V+id4qbqtbKKh7Trfxw12L6Wot49hlqvsJ6p4L1dTaOBS4OM8GUFNIWUXNgH?=
 =?us-ascii?Q?AqX+7UF9nZIwson3w68HgPeg65kDlKBq+AxIwF6cIrdkmjBY8JM/3tOgLFuY?=
 =?us-ascii?Q?s0DjhU9HKQI2n56YPHiRAJ+deiQD+qmDuNkzz7ars9cvIovn260riIWqqnrd?=
 =?us-ascii?Q?GnqX7zRGLqVmqR8i9U2LfEajaLc9ncN7kbxnWdgTHT3lxT8pWEL814pC9TE1?=
 =?us-ascii?Q?Lw/Qk2sSOytO6nTv4kEgoY/HsXc+as2IvUUKnJa8uOzMzsC0H8L8at4jSmMw?=
 =?us-ascii?Q?OjrTgc/jBmup7/OIU3F/KnM3Jw39O/o=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4482c9c1-50ea-4764-8413-08da195dff2d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 12:47:53.1578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LuYsqVx84/dZN4+vVy4YhvH4rslPieIAzdS5BNd0EbKvucepisHhYNZN7KOY2TwPvyfdjCO4Eitj2N3+2w6HZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7364
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96477

Hi Clement,

Am 08.04.2022 um 14:25 schrieb Cl=C3=A9ment P=C3=A9ron:
> Hi Stefan,
>=20
> On Fri, 8 Apr 2022 at 09:30, Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>>
>> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>>
>> The CMake gRPC config checks for binaries and fails if a binary (plugin)
>> is missing. Fix the problem in the code and add the CMake gRPC config
>> back to the target package.
>=20
> Thanks for your patch, I'm still using gRPC 1.35 + your previous similar =
patch.
> I'm trying to bump to gRPC 1.45.1 + these patches.
>=20
> My recipe use CMake and depends on grpc and grpc-native:
> PACKAGECONFIG[grpc] =3D "-DCONFIG_GRPC=3DON,-DCONFIG_GRPC=3DOFF,grpc grpc=
-native"
>=20
> But unfortunately CMake doesn't find the grpc_cpp_plugin.

This is the correct behavior of my patch because the grpc_cpp_plugin=20
from the cross build isn't usable during cross build. You need the=20
grpc_cpp_plugin from the host and therefore have to search the=20
grpc_cpp_plugin by yourself during cross compile [1].

My first patch was rejected and therefore I create a minimal patch which=20
only make the CMake gRPC config usable.

>=20
> | -- Using gRPC 1.45.1
> ....
> | CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
> |   Error evaluating generator expression:
> |
> |     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
> |
> |   No target "gRPC::grpc_cpp_plugin"
> |
> |
> | CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
> |   Error evaluating generator expression:
> |
> |     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
> |
> |   No target "gRPC::grpc_cpp_plugin"
> |
> |
> | CMake Error at modules/grpc/CMakeLists.txt:37 (add_custom_command):
> |   Error evaluating generator expression:
> |
> |     $<TARGET_FILE:gRPC::grpc_cpp_plugin>
> |
> |   No target "gRPC::grpc_cpp_plugin"
>=20
> Here is my CMake source file:
>=20
> # Find Protobuf installation Yocto SDK doensn't support protobuf-config.c=
make
> # for the moment
> set(protobuf_MODULE_COMPATIBLE TRUE)
> find_package(Protobuf REQUIRED)
> message(STATUS "Using protobuf ${Protobuf_VERSION}")
> set(_PROTOBUF_LIBPROTOBUF protobuf::libprotobuf)
>=20
> # Find gRPC installation Looks for gRPCConfig.cmake file installed by gRP=
C's
> # cmake installation.
> find_package(gRPC CONFIG REQUIRED)
> message(STATUS "Using gRPC ${gRPC_VERSION}")
> set(_REFLECTION gRPC::grpc++_reflection)
> set(_GRPC_GRPCPP gRPC::grpc++)
>=20
> # Get full path of protobuf/gRPC compiler
> set(_PROTOBUF_PROTOC $<TARGET_FILE:protobuf::protoc>)
> set(_GRPC_CPP_PLUGIN_EXECUTABLE $<TARGET_FILE:gRPC::grpc_cpp_plugin>)

You have to search the binaries if you cross compile [1]:

if(CMAKE_CROSSCOMPILING)
   find_program(_GRPC_CPP_PLUGIN_EXECUTABLE grpc_cpp_plugin)
else()
   set(_GRPC_CPP_PLUGIN_EXECUTABLE $<TARGET_FILE:gRPC::grpc_cpp_plugin>)
endif()

>=20
> Do you have an example of how you look for gRPC in your recipe?

This isn't possible because you use a target and not a variable.

[1] https://github.com/grpc/grpc/blob/master/examples/cpp/cmake/common.cmak=
e

Regards
   Stefan

