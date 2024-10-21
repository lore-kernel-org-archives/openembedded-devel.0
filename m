Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8492FD0E6C4
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 17:01:05 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.120])
 by mx.groups.io with SMTP id smtpd.web11.451.1729530061417993036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Oct 2024 10:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=iJKVrgzj;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.120, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buoO87qVhLVtfyJ5RMH9umxVtvweOeGhX669WGi7mwOuaekLmq9HWCe0A1mU/9Vr3vphQitQIXemQp6gqq4S501wRUabITaXWjo+qkFeY6gTakexw6+le5GP+rbS/8qBKc59NACd4gvkDL19t4Hxrk+LHXfSimTdapa9wUQ6J4lpfUU9KYhZ1U1m1hR5bR1GyPBfAIhC2OyWYc0MTCPjck/pGIqSitQoNWc5bXBHQWOeMgAKzUOsOQfC66haVLKpRFOX+cIXf6G+LKhHnWOByk5iGNRuAaEkOQQv2JAsu0U1bOOKU5WR//AS3pCLbWXvjDw9Abx5/g1PUYYwcM63zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMtwcwqPZFxTTBteEVt8lyElPXSBoOCKT2BFE9krztE=;
 b=GhxdsEjBHmQWZc9JvdAZxfk7OHaffj8RcqHKjRW6z/wIcKfLjbCUL4c6jsRw/W54uPAhwkQ+WkYHgHodp+cSMR6J+3jkCgqANb1eNTxPxt9rmfl/yeRbq57x/1KFEeVRqfxnoapZ5uDkhenRMphCAe6Z8nugOJ8qK8zeFiWz+mTzRdvUWkY5Sh4ls3QltnNj0Z7RCvWvy1miFZPC5FbIXKffHY9+OiDRBNUJUmPz/jsssiMLb9FlidjzqTpSw1PHv/6gU4CKResU/5yJjzOCmJ6Tb2tzhmn0EnxM/mLlz7LlJ5m8//sDNC8pDaVqljT3qx8kowbdnXJr8USJhkiF4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMtwcwqPZFxTTBteEVt8lyElPXSBoOCKT2BFE9krztE=;
 b=iJKVrgzjST1CMgj5rh7hmOW/ClI8i2KNpCg4h5XW8tqntlHZggfFZea0lQszPP/wOf/ZHX1JK2+5T0qDWPTk55EhZXXtz+fSoWYqg97wadIq1o9L3e0fD6xrCpQLk5YOJ9x8ncC+J6yD/ON/cuGqPFHC2MMiTIZGdNVG8dLf0xKReQYMvnAvG4Ip+/mTaCsJlxVwwUKBPtP+HgBW/Nb46QKwvHq1RP2BxiudLnysH4GYfuboO4g3BYbq+Bas6g+ko+Ayav2Tl7QmMrltGNn+EFfqYy0T/Rc3iW3NejlUgEvKzhOmBJg5+TnhaHR7w2iGB4hn001Jk0dKdm3XtKYgAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB8904.eurprd06.prod.outlook.com (2603:10a6:800:1e0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Mon, 21 Oct
 2024 17:00:57 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8069.024; Mon, 21 Oct 2024
 17:00:57 +0000
Message-ID: <dcd59bb1-3893-4b77-8792-10e13217c3d7@vaisala.com>
Date: Mon, 21 Oct 2024 20:00:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v2] fluentbit: fix building with wasm
 support
To: patrick.wicki@subset.ch, raj.khem@gmail.com
CC: openembedded-devel@lists.openembedded.org
References: <20241017070839.39476-1-patrick@subset.ch>
 <CAMKF1spGmL-v7izu2-zJQ=KmxE=qf2QwVQe_sGE-9exGhMeHhw@mail.gmail.com>
 <6358f89f72cfdc608818f24cbc9f282fbe99e240.camel@subset.ch>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <6358f89f72cfdc608818f24cbc9f282fbe99e240.camel@subset.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::19) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: 2205c49a-e834-47b6-8730-08dcf1f1eeaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1OdeYCkBQqK+v0/K5byhStkCR43N96TtD18dT5vHViOnLM0JZon4QnLBs3n7?=
 =?us-ascii?Q?+/IXbcXtWL+maRRduNYACDanVycbydBBdwxuxCTQwlGtvuUZZuJQialw5bgP?=
 =?us-ascii?Q?aotROSR64XjUBLiW8xxXfNs3HsHpuU86DUEX4Ndv0uaHhVxACd/Hoj801Hyb?=
 =?us-ascii?Q?qlKpI0NFhuE1AUUTDsFU0MtPuuqONt+OJzXETefQx/bnTdzxIWXDg+XGgidh?=
 =?us-ascii?Q?/wtzBnaLTVdDzBlz8RyqHgkZojjEv1f+WSOatN4umc/naMs3reDsF/1yVKRZ?=
 =?us-ascii?Q?Y1zTVX3AFc5myrSyh0vLYD0NYxSwGdSEn+CRwBCb3vjvLz0FZZNvXvXKr5gr?=
 =?us-ascii?Q?r3U1NXNVn/rsFlVBWPJXl3L7PPk0O8t/4ywjSNUanaosKD9QnvEak+XpEZEd?=
 =?us-ascii?Q?Om3SlyRcnPGvdmlgI7B197KP+E3p5kxDqEcpU4Yk8oOCZcmO+R938lzppDlC?=
 =?us-ascii?Q?ww2edmS7Fu4OMmHY22g6FjTAgma3t0fU4fg6ZJi2ed9H0jj8luJeB/HKz+0L?=
 =?us-ascii?Q?h8VMvvfEKbbh8jcE1KDppZbADuHB0JLLLs0Hgs2UYeWxA2FuIdJV3b9JGFSZ?=
 =?us-ascii?Q?pyUQVynFdftETwzLNa9n782utyp73wjXHv3swWJifwAg0LDYgDKAkoQXFOi3?=
 =?us-ascii?Q?I+Qt5PYDMUah/CrUnrtxjHVtoUUV23UMu/go+gII00I0SOC+TQ8jS41RGo82?=
 =?us-ascii?Q?ZXnmk0wMxnSIVBN7dUUIJsNt4377iCMoIazVqAW0Z9qZo+vEKb5QvVTcxTRv?=
 =?us-ascii?Q?AfWDTf5OMMFhju7Ru+Z6j287fdAV4bvzCY7Y8esAryKS9GXeD2Jzgog6BSvH?=
 =?us-ascii?Q?e2NKtKEH3p+KH75+o5syF8Xpq28z5hhZH1DjbUYckdVAED9whMht4j+WxIAx?=
 =?us-ascii?Q?w+n7Y/xr9H9GVXOECQC7ejbjzz1hPEJoSezia9l1ioBaYBbPGSlqM+TocnmU?=
 =?us-ascii?Q?lPQEQHSSBaTH+KT2wWjeFjmO8APQSsj5xUGH9AiZXsDDD9mLBcXcBkpJLK4e?=
 =?us-ascii?Q?wObeGSzdnrGl1cy1/PL+3VvtRSgd/7YZqB0eVWPGJxMjFhkYYLt9ZYXhKZ3B?=
 =?us-ascii?Q?gkX9dRzNRZr3OXSRePIOnSEzLZeBOM5vZuh1ZkfMZcBIVhy9R+ec0dZWVZ6W?=
 =?us-ascii?Q?a5vFMjOEdz7jH4jQvlJM98ahsDL3+bG01JdrlTbFYxVb+/vNV4qJ38fU6q3z?=
 =?us-ascii?Q?SqVkyRkySNl86QHpT7zLtrwxhTAIEc3KgEpZRda4yJFNUZbPqjjYMfSz2snV?=
 =?us-ascii?Q?Zn9dtszXK3p4/9thvPDF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cL3UqG4R3PqwNCs3hp5zghuyjY2dWGP6GfZ4RVtli6ZjQxJMv7r6nWwP6zTy?=
 =?us-ascii?Q?nh6aYIlcmaOQO2Y2tr3Yl67P1HHDRwp2H14u1vVMDOHhC1UmumEnAJ9zPkRI?=
 =?us-ascii?Q?Yl12uwbJ3tetyBDHNrED4ieleSszYj1wXofIryQC9QHQUwu+tGx1s9NyfhVv?=
 =?us-ascii?Q?EC9TDYZsgxlH4Xj2MQAaPBvWK2EQmkFsQWU8VuB4HrDq6tl3hutySsNYQ+pl?=
 =?us-ascii?Q?pQRyeOGluR3T4OL0HDyns84Z2xTM1JmDPvAIyHRtGGE5fJkVxuLV0ApIaH0y?=
 =?us-ascii?Q?q5HUXkpVaLcxLZM84CkQ9Wqla04Q2N5s2twgYMnlr+aQBQ1/Mus8dT5BwNIk?=
 =?us-ascii?Q?VgFInMcJ61BH4bFaHPl7cfapB/1auuEz4Yfq7h2bPfy4q42UavMPdUnH5B4n?=
 =?us-ascii?Q?bD1y5Oa1vChkOXS3I2Hp+C1C7YA6WFENqx7vzh7WNQ+aNKycNew5HqZggKgi?=
 =?us-ascii?Q?wD0SlXbTQTNT3/iZh2eU2Wympmc2s4f3dCyYlkxf7K5xd2JMKgG3/JWh2XkV?=
 =?us-ascii?Q?QgDhzYG/+yVu+FB0IvEAjAfXVU8aXD6Gcjbz/gtDiVbuKopyd7ueVX0ojO0P?=
 =?us-ascii?Q?TNUw7lUWxhLrwPJzUIRQHk4pASDfePywdBTBTyeILIWsXqS0K2tx3mURxERY?=
 =?us-ascii?Q?N4/alD6qAhHFFWuPemyqE6vi4874HAdmy6D8sTvadWNm7MGAirtMxBoKCyPd?=
 =?us-ascii?Q?RvBFTZzkjI8x6HZYq8sh1ZzzsFkqx+EoVEB8ElU0AaVX+QCX+DVkQ88iI4wR?=
 =?us-ascii?Q?nde1KtlzZipWIgzhA/lBU7VKznrKhB0yIvyK1QEpyhK2Tf3CbdrXuMCqXlFC?=
 =?us-ascii?Q?yuGClSwwR3r7VBCsWQ5SnuJkzl01eee9OWkKIcDqvJyLMiBACAVIwzms5n5b?=
 =?us-ascii?Q?XmPPQ2WGEc7ul4IxE5WB4uuchPac2qbOeqUuiss4w4/IV54G/WeO/0rfwQYU?=
 =?us-ascii?Q?3C9PurdD0bVj+vLo2X4Y5VjzEvUKOSBzD8hyeMugt4dlvnLzInNSzTO59Kqt?=
 =?us-ascii?Q?A2nm/6DkN4vg7XzJzu3G5BPSFDJF1FakwXfNoz1ubKms5aBiIy9pH8OCFIUb?=
 =?us-ascii?Q?0kjJGYo8ELdJEIo3UpAa9ngmWJo/3o/qGh3F2/M1HKuNuKbVQBbSK7dBHELM?=
 =?us-ascii?Q?PbY/xjHGm72KaCkng4OvyEh8VHAA0sONiCYGOla5lmtYT856dyXrot6mVrsN?=
 =?us-ascii?Q?DTP6xvajD3hjultNdR6tRZfqF7w0jpifz7Q9/RpkTPjRY3RjkOYeEr6fGCIU?=
 =?us-ascii?Q?aFkQU+obRoiCQAiWmXctIjaZurOlUBa+/3lR4TChMdhgvANFUqpSBKJO0bLK?=
 =?us-ascii?Q?hEF+bPdxv7K7Bkh3VbwfJDlNi8D/3gLzb6896oHamhDify/rYmkTZi7+kgLL?=
 =?us-ascii?Q?7Z8zEYv5ZMLvR0pXRKBPIeJ3gmmSKUktFVo0SgGnu3AN6zM/YE15DkmwQPhD?=
 =?us-ascii?Q?zq2xKo0IhS1nsA4ZRy/OfR4z41mKn6AE+bRXr3FvBpHT4XE6cb4JaLB7eoKm?=
 =?us-ascii?Q?EaN/vzOMMGF1AF1K8CvNQqzSE9Pv7kO96gNzuScii91FPSPY1Vf9+QCQJWmd?=
 =?us-ascii?Q?TPXINd5RuUYWKTfQSnCPaACxsFgCdbAM+WAkIPkERHqY11QNoRDXwHzCUk+J?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2205c49a-e834-47b6-8730-08dcf1f1eeaa
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 17:00:57.3999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnCdwp3irDNYMiMBGPQriNuWJklVA2Za9sVomqcyXaEWkgvYcXersAzhL262Nbqrj5BruDLL6ViNvAEMUV55gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8904
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Oct 2024 17:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113081

The CMake failure which occurs during fluentbit do_configure, seems to be

   | CMake Error at src/CMakeLists.txt:550 (install):
   |   install DIRECTORY given unknown argument "/etc/fluent-bit/".

which occurs inside "upstart" specific segment at https://github.com/fluent=
/fluent-bit/blob/v3.1.9/src/CMakeLists.txt#L550

I looked to me like the preceding condition on line 543:

    elseif(IS_DIRECTORY /usr/share/upstart)

is not cross-compile friendly, and during the failed test, presumably the b=
uild host happened to have a /usr/share/upstart directory which caused the =
condition being evaluated as true.

I've now submitted a patch which should mitigate this issue, and also fixes=
 potential for similar kind of issue with systemd init manager case, when t=
he build host does not have systemd specific /lib/systemd/system directory.

-Niko

On 21.10.2024 15.29, Patrick Wicki via lists.openembedded.org wrote:
> I've been unable to reproduce this failure on my end unfortunately. In
> my understanding, the contents of the patched file should not even
> affect the build at all unless the "wasm" PACKAGECONFIG is enabled,
> which is not the case by default.
>=20
> I'm open to suggestions. Otherwise, I think we can skip this patch and
> wait for upstream to update the WASM runtime, which should fix it too.
>=20
> On Thu, 2024-10-17 at 11:54 -0700, Khem Raj via lists.openembedded.org
> wrote:
>> it fails in configure -
>> https://valkyrie.yoctoproject.org/#/builders/81/builds/66/steps/14/logs/=
stdio
>>
>> On Thu, Oct 17, 2024 at 12:09=E2=80=AFAM Patrick Wicki via
>> lists.openembedded.org
>> <patrick.wicki=3Dsubset.ch@lists.openembedded.org> wrote:
>>>
>>> From: Patrick Wicki <patrick.wicki@siemens.com>
>>>
>>> Add patch for the wasm runtime that fixes building for x86.
>>>
>>> Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
>>> ---
>>>  =C2=A0...d-cmake-try_run-when-cross-compiling.patch | 42
>>> +++++++++++++++++++
>>>  =C2=A0.../fluentbit/fluentbit_3.1.9.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>  =C2=A02 files changed, 43 insertions(+)
>>>  =C2=A0create mode 100644 meta-oe/recipes-
>>> extended/fluentbit/fluentbit/0002-wasm-avoid-cmake-try_run-when-
>>> cross-compiling.patch
>>>
>>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-
>>> wasm-avoid-cmake-try_run-when-cross-compiling.patch b/meta-
>>> oe/recipes-extended/fluentbit/fluentbit/0002-wasm-avoid-cmake-
>>> try_run-when-cross-compiling.patch
>>> new file mode 100644
>>> index 000000000..419e85903
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-wasm-avoid-
>>> cmake-try_run-when-cross-compiling.patch
>>> @@ -0,0 +1,42 @@
>>> +From 5b6d274664f92a6c6083f4d27a1b1604a326f22c Mon Sep 17 00:00:00
>>> 2001
>>> +From: Patrick Wicki <patrick.wicki@siemens.com>
>>> +Date: Sat, 5 Oct 2024 21:36:12 +0200
>>> +Subject: [PATCH] wasm: avoid cmake try_run when cross-compiling
>>> for x86
>>> +
>>> +This fixes building the wasm micro runtime used when enabling wasm
>>> +support in fluentbit.
>>> +cmake try_run does not work when cross-compiling because the test
>>> program
>>> +cannot be executed:
>>> +
>>> +| CMake Error: try_run() invoked in cross-compiling mode, please
>>> set the following cache variables appropriately:
>>> +|=C2=A0=C2=A0=C2=A0 TEST_WRGSBASE_RESULT (advanced)
>>> +| For details see .../fluentbit/3.1.9/build/TryRunResults.cmake
>>> +|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Write linear memory base addr to x86 G=
S register disabled
>>> +| -- Configuring incomplete, errors occurred!
>>> +
>>> +Since we cannot run the test program, assume that the instruction
>>> is not
>>> +available and disable the option.
>>> +
>>> +This patch is no longer needed once fluentbit updates WAMR, as
>>> it's been
>>> +fixed in
>>> https://github.com/bytecodealliance/wasm-micro-runtime/pull/3066.
>>> +
>>> +Upstream-Status: Pending
>>> [https://github.com/fluent/fluent-bit/pull/8744]
>>> +
>>> +Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
>>> +---
>>> + .../build-scripts/config_common.cmake=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>> 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/lib/wasm-micro-runtime-WAMR-1.3.0/build-
>>> scripts/config_common.cmake b/lib/wasm-micro-runtime-WAMR-
>>> 1.3.0/build-scripts/config_common.cmake
>>> +index e73ebc85f..c2504e007 100644
>>> +--- a/lib/wasm-micro-runtime-WAMR-1.3.0/build-
>>> scripts/config_common.cmake
>>> ++++ b/lib/wasm-micro-runtime-WAMR-1.3.0/build-
>>> scripts/config_common.cmake
>>> +@@ -408,7 +408,7 @@ if (WAMR_BUILD_STATIC_PGO EQUAL 1)
>>> +=C2=A0=C2=A0 add_definitions (-DWASM_ENABLE_STATIC_PGO=3D1)
>>> +=C2=A0=C2=A0 message ("=C2=A0=C2=A0=C2=A0=C2=A0 AOT static PGO enabled=
")
>>> + endif ()
>>> +-if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1)
>>> ++if (WAMR_DISABLE_WRITE_GS_BASE EQUAL 1 OR CMAKE_CROSSCOMPILING)
>>> +=C2=A0=C2=A0 add_definitions (-DWASM_DISABLE_WRITE_GS_BASE=3D1)
>>> +=C2=A0=C2=A0 message ("=C2=A0=C2=A0=C2=A0=C2=A0 Write linear memory ba=
se addr to x86 GS register
>>> disabled")
>>> + elseif (WAMR_BUILD_TARGET STREQUAL "X86_64"
>>> diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
>>> b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
>>> index fc67236d3..d42a9a964 100644
>>> --- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
>>> +++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.1.9.bb
>>> @@ -21,6 +21,7 @@ SRCREV =3D
>>> "431fa79ae27edaef8d050a7af6f038f4400193a1"
>>>  =C2=A0SRC_URI =3D "\
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 git://github.com/fluent/fluent-
>>> bit.git;branch=3D3.1;protocol=3Dhttps \
>>>     =20
>>> file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch
>>>  =C2=A0\
>>> +
>>> file://0002-wasm-avoid-cmake-try_run-when-cross-compiling.patch=C2=A0\
>>>     =20
>>> file://0002-flb_info.h.in-Do-not-hardcode-compilation-directorie.patch
>>>  =C2=A0\
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'syst=
emd', '',
>>> 'file://0003-Disable-installing-systemd-service-file.patch',=C2=A0d)} \
>>>  =C2=A0"
>>> --
>>> 2.47.0
>>>
>>>
>>>
>>>
>>
>>
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113076): https://lists.openembedded.org/g/openembedde=
d-devel/message/113076
> Mute This Topic: https://lists.openembedded.org/mt/109059531/3618471
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [n=
iko.mauno@vaisala.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

