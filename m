Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.6987.1625064900146079261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jun 2021 07:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hA7sSti1;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2815b49594=tony.tascioglu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15UEsx3h025520
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 07:54:59 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g5a80wgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jun 2021 07:54:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CICd8bDXEghWfK8veMWcvj0mqsaxjYtqoZr+1LlEULcpTtspHjC1O8kcfEKrMsbOecacNB7uPYUE3jiG3xlY4+Pu7ONPPe2L6zFu+eTFzZZMb7tyzQMU6whj8wRHkv9LW9f4IB0oVhECD+bK+Zc3bAr+xoIpYtP/vcnyUOffgmxsD0s3lwF9O8GFEYWgglfj9nlXaxaRRUiS8IqW/aGq1wF+3SpIry/w01S1Npi5HPmvDRtfB0i1XWmgV5aR/a/UeXB1E/XDtxIWHE++wa1nQ9/m+azR8aRKjiMELVuVmUIEUX4LEzTw1KbHwRZ0Oxnnm+TQaeAs8W7Pia2A1gOeFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtkMsCYQBDU1s7Vk3chc2W06/qntGS7QsiBE8oWe+Cg=;
 b=CG4GLZfJDR/z2wc9lamZqNAy7QlBZf0Gq6aY16/xKJ3iiUZNNWNpFTm8Lf8UOiW5bMBlf5bvmJFCDO9IMjgIn2WPIwauOhUZ1ukFvFxffRU8OB5JFJ98fKO8GKaCSoREQof71kvdVW0WVy5cbpxO/IxO4FcKEKOJm1vjFdBUkHNV9lccPwBEfKZ1GteC2bdN23ejgw26vU1BSXxAEXb6OCtC4fdhuZ2UFs31HoBLD/gB2R4CmNKaUT0ZqacG7pChmrHyGJTZOtgpMZVNgCKPepB5Ew/2kWyWWMDIlHAynaek2J5VHpEyDcE2Tyge4f1YlqvygR501Su05Bd8tSVSDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtkMsCYQBDU1s7Vk3chc2W06/qntGS7QsiBE8oWe+Cg=;
 b=hA7sSti1zJqAI0+C42H6SZVQwPYTQa+F5wmnlUId92FCm5Syr82d8/EimZnsAeaZaQ6IQnaO5u1K3+B7vHLym59ipJrwPNBxq3ydgedHMUo7ZMeWLRiBBKekhkQmFdjbwXkg+Uu4hgUakJXEUxs0q7Y4J9XnqMbtP3bgLSCuRCA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4783.namprd11.prod.outlook.com (2603:10b6:a03:2af::8)
 by SJ0PR11MB5023.namprd11.prod.outlook.com (2603:10b6:a03:2de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 30 Jun
 2021 14:54:56 +0000
Received: from SJ0PR11MB4783.namprd11.prod.outlook.com
 ([fe80::643a:dbcb:bf31:3596]) by SJ0PR11MB4783.namprd11.prod.outlook.com
 ([fe80::643a:dbcb:bf31:3596%7]) with mapi id 15.20.4264.027; Wed, 30 Jun 2021
 14:54:55 +0000
Subject: Re: [oe] [meta-oe][PATCH] libyang: create recipe for libyang
To: openembedded-devel@lists.openembedded.org
References: <168D62FBA07D585D.13886@lists.openembedded.org>
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
Message-ID: <5b11228d-4beb-9e42-1080-1efe66fd8dbe@windriver.com>
Date: Wed, 30 Jun 2021 10:55:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <168D62FBA07D585D.13886@lists.openembedded.org>
X-Originating-IP: [5.25.166.245]
X-ClientProxiedBy: MN2PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:c0::16) To SJ0PR11MB4783.namprd11.prod.outlook.com
 (2603:10b6:a03:2af::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.108] (5.25.166.245) by MN2PR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:c0::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.12 via Frontend Transport; Wed, 30 Jun 2021 14:54:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00c0133c-06ee-41ed-4d21-08d93bd705e7
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5023:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5023479D57D5F6E2C70013A884019@SJ0PR11MB5023.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KmKu8VsMn71a+6+KFrSClddZSU0cZQ1crk9oOtaAsC5ZAiRKBcKGKNtuNMo+1GEn1Gp/lHiNTVmk27Ay6aThfKRaMaW5m4/WBF/ezkeexFasXGylt6z6jlmE/Jps7oKjx9YM1NoUR45Vl1AYjTgimTWedcxKMUE7e+43EwG3EpykjykSgN1t4Y44r6Ft54XZP/xE0l7gXqIbkGmtJwKZkUWLyuiYHeIFVjSIBIxR9EHEpsDWS/t6wdOzR15hRU4Kd0GsF4ehuaz7jYuW3GRpXeNmUYM4JfkBgMGfpWu/JnGZ8GrsqAUx170yjEB4kFf2hBw8OtHwRMKDVuTpiP0nvARQ8GjgmUA39w6g4d2X0pshyW8UH1hDhQ39jdqYWpsiS+kYFHioJHpSs7apXg74Nm3BKwToyfPiKy9mQtPyHtYHtsdglJ8nNdyWdNuvPQ5Dzhpu6MbbVuSvOW81aj3pQock9luEPhpE0cNgo21qPBjVqYmnVPAM4X/3Eg/ZIjEdgRvj+3aYeX5ASlAW00d9BVTpo58DabWJnNxs/ij0FTbrani8EeOsyIImLWlbDpfEtok7U5e05wR/sCeYLvYAs+uL/l49SB5FSXyrWC5U/t67hI6D4Ut4m2A9dueVP9PKu1kMSkJQ6tpfhuBKKuTVgxK5hxNWnFlapOczS1Bi8NDk8sLVmWNcaA8iRCU1boqY0R8kpwKIdeVU/28Y8jh8ZmPu/4CfCvgKikfvwiYLvc3GXmssGzzrjdZ4E5GjoukLUJnSP2vuKL8plEP+zHFMNHJYTGNucBq0p9GbAF8jJjasyZFnc3OEbvJseg87hPlrGnVprkGIWDXYS8ydTmuVyozgqjRMrl8Mw+9AVVdn00fIeTTe/Iz2xD6EuhkLqhmN3PcsYjXj1qi7CWwXBNcammq1G7QcI9tK2mhp1KNJEJg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(36756003)(6666004)(966005)(53546011)(19627235002)(8676002)(16526019)(44832011)(956004)(2616005)(6486002)(26005)(186003)(38350700002)(38100700002)(31686004)(33964004)(8936002)(2906002)(5660300002)(6916009)(66476007)(66556008)(52116002)(66946007)(498600001)(31696002)(166002)(86362001)(16576012)(30864003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NEFWRytLT0dZWkxKb3RGREZJTWlKQmxiODFXSEJjeDVTbld1anoyTlo2RzJy?=
 =?utf-8?B?ZUpHQUNWSUFTZ2x5SEUyNzgwdjVMWGtVQ1dJcXV0VkZyMFBIR2VzMTJMZzNZ?=
 =?utf-8?B?OXRsbzJIU3RPdjNJb1dvZEsyb1RqTjBoNkZpcUZqYVhFYXdYYzBYM3BNbDJW?=
 =?utf-8?B?VWJUZmoxQThCc21yZElGSDlPdVpxOW9aZWFoTURjTThFdzBWVHY2Y2FTNDFu?=
 =?utf-8?B?WFdNWE9Cd2NMdjZ6bzZDci9rN2pQc0VrRlpZNDJiSVhGZUE0QjRHZXZDSndn?=
 =?utf-8?B?M3Bkb3Bobm52MTE5Rks3S0JQaGE4bHRHaDg4eG53VndkODlhTytCSmhPa00w?=
 =?utf-8?B?TjVQcVVpK3MrNUVKaFd5QVZmNERzV2Nldkt2UlJqNTVpSCtxMzVCZGJoL2xU?=
 =?utf-8?B?dHhPMU42S2xDOVUwUFQzTDRDZDljT2dTb0J1NGxYMlBMVnFTQkZGdkZNRWY0?=
 =?utf-8?B?dEFPckJYTUFtdjA5Q2xEakJ6cXZqd2JpRVJMMmRFRDRobEZMM3FkUVJOMERy?=
 =?utf-8?B?SlVXSG9mMWhoR2srbUs3R3VpY241SVlKQTJCN1RqN1BWdzhlQWNWT0xhTlE4?=
 =?utf-8?B?M2ZaVXVKeWpOVjBCdHhBZkZsQTNVajhVeHhlNW01bHhWandpbTk5bjhLUFFl?=
 =?utf-8?B?NzFqZlBLeGhLNXk2Ujh2L0xGWWxEU0xLWm9vRWRLZmFDUEFUUU5uc2E3eWRu?=
 =?utf-8?B?WG0yRWdMT1lWdGRnSkU2UTc4cWU5YitjeXFIRTU5eTQ5TUxGcDU5MkM3MklU?=
 =?utf-8?B?OGxmdFJyQ0h6ZXFwWjlyRVFDSjJ2alhtSjNPaWY3VEFIbGpDaFo2YkQ0V2Q4?=
 =?utf-8?B?dFdXYi9HKzlkalVmV3ZGRGJsYzZ0VVVubHk0UFRWQWorTzluUVJOaU5YSzhy?=
 =?utf-8?B?Tmx1cHFjZHQ4SC9yaXZWVlY3dXN6ZkxzckFKVC9HV0lGQWJwaFNDK1d2ZjUy?=
 =?utf-8?B?STdpOHJ1RzVsaEVzbm5OVG00VEdyc2FvSzgvNXFJSFdGVzVuZHc1QVAzQ2NC?=
 =?utf-8?B?QUoyTFVucnpaby92ejFtZkVFd1dTZHROK0FRdEtsWVlyV2cyTzc2Rkd6bVFh?=
 =?utf-8?B?aE1mRjFMMWsreE1rNzdTTE82aE9VTGRaWmg5Y09FMWc0TmJkaWhJanN4WW40?=
 =?utf-8?B?ek9zaWFUS2RpS3EydzZvSW1ieXM5MHBpYkJnejFmQ1VWVTYzMmQxNDZvK0RP?=
 =?utf-8?B?VlpOSTJUM0hUV2JLb2d2YnQ5NmtzdS94NHhCRWxHd2t0UkJrSTQwSHNUOTZh?=
 =?utf-8?B?c3gxNExJcEFaQjRrYW9qQU80Znh0MzhQSXA2c202dWNQYk5yTFFpQiswdFdR?=
 =?utf-8?B?MXRBbERaS0MrbngrRlFONnQyUjdETGx4bTRJdXUrNTVzQ01ZSlNqSy9YbU1R?=
 =?utf-8?B?NVNzZWJFU0lYVlN0UkNGc3hvRDZmMExWTFVYaWI2QjMwWFBMRkMyQmxBTEd6?=
 =?utf-8?B?VVVIN3dwMy84YndpZk02WDdvSklmbk5qTXhjektCbnlLZzQrUFdRbmFZSFRi?=
 =?utf-8?B?Q2xXdWU1VnNTOTNMQUIxSnEvZ3Z3V1duQmY2RTB5OXlrMGQ4S21KZTBneGdG?=
 =?utf-8?B?ZE8wcWwrYjAraTlvM1VBSEJocm41WWtkNnd6UEc2N2pIZENLZFN1dXhDNVFm?=
 =?utf-8?B?OGxncVFaaEYwT2xLU3dnNzFZUjZYWFFIT3ZrSG42dlp1eFlsU25FUk05Rm5Z?=
 =?utf-8?B?a0FUQzB0cXozTkJpTlo1RzAwdXhrR2RXY1RWNURHUFpuaHJUb2E5NjJpNmMv?=
 =?utf-8?Q?xWEiXSAYhVk5KVKxt20dqQtXztJ25SWsGYTnyGN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c0133c-06ee-41ed-4d21-08d93bd705e7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 14:54:55.6640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cE70noMIDiWcrRme13+BALCYXtlR9JnqRVmtYKjp4jEBSdc1E0W5x1bTNvP0hoBxWHCRMNE/7IdIMlIrzVCHkf4p9iz2lEHM87tttSsElYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5023
X-Proofpoint-GUID: yMC87_rEQl0K6_xcBQa7VJh0rlsM501I
X-Proofpoint-ORIG-GUID: yMC87_rEQl0K6_xcBQa7VJh0rlsM501I
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-30_06:2021-06-29,2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300088
Content-Type: multipart/alternative;
 boundary="------------CCF862885F8C9664FC5810E2"
Content-Language: en-US

--------------CCF862885F8C9664FC5810E2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Here is the build status for this recipe.

As you can see, there are problems with targets that don't have support 
for valgrind, which is a dependency when ptests are enabled.

I'll send a v2 with a COMPATIBLE_HOST filter.

BUILDALL-QEMU LOG FOR libyang
START TIME: 2021-06-29_09:03:22
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.3 LTS
HOST KERNEL: 5.4.0-74-generic
===============
BUILD RESULTS:
[glibc]
FAIL: qemuriscv32
FAIL: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
FAIL: qemuriscv64
PASS: qemuppc64
PASS: qemux86
[musl]
FAIL: qemuriscv32
FAIL: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
FAIL: qemuriscv64
PASS: qemuppc64
PASS: qemux86
===============
PASSED: 16
FAILED: 6

Thanks, Tony

On 6/30/21 10:37 AM, Tony Tascioglu wrote:
> Add a new recipe, patches, and ptest coverage for libyang.
>
> The recipe follows from upstream, using the cmake build system.
>
> There were 2 small changes needed to get the package building:
>    - Remove call to pcre2-config
>    - Add missing import statement
>
> The recipe has a dependency on libpcre2, which satisfies the minimum
> requirements for libyang. In addition, for tests, cmocka is required
> during build and runtime, and valgrind is required in the runtime for
> some tests.
>
> Due to the way the library by default builds in a debug mode, release
> mode was specified. However, this disables building the built-in tests,
> so an EXTRA_OECMAKE was added based on whether or not ptests are enabled
> to specifiy the required extra flag.
>
> Binconfig-disabled is inherited since using pcre2-config directly is not
> suggested anymore. Cmocka as a dependency depends on whether ptests have
> been enabled. Since ptests are built with the main package, we need
> cmocka installed before the test are compiled if they are needed.
>
> Ptest coverage:
> The ptests come from the original tests included with the library.
> Ptests are in ctest format by default, so we compare the return code to
> print it in Yocto format. However, as each "test" target executable has
> multiple tests in it, the full stdout and stderr logs are saved for
> troubleshooting.
>
> Currently, several of the tests fail due to hardcoded paths in the
> executable binaries generated, this is an issue we will take upstream.
> For now, only the tests which work on a different target are enabled as
> the ptests. The list can be updated in the run-ptest script, which is
> portable shell compatible, without requiring bash.
>
> The recipe also has libyang-bin as a split package, which includes
> yanglint should it be needed.
> This recipe was tested using buildall-qemu as well as from within qemu
> in x86_64 and arm64.
>
> Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
> ---
>   ...byang-skip-pcre2-config-add-stdint-h.patch | 55 +++++++++++++++++++
>   .../libyang/libyang/run-ptest                 | 46 ++++++++++++++++
>   .../recipes-extended/libyang/libyang_2.0.7.bb | 33 +++++++++++
>   3 files changed, 134 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
>   create mode 100644 meta-oe/recipes-extended/libyang/libyang/run-ptest
>   create mode 100644 meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
>
> diff --git a/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
> new file mode 100644
> index 000000000..e3b2d0e02
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
> @@ -0,0 +1,55 @@
> +From c7f3e2a8fe530beec6103cb9071ccc41458879aa Mon Sep 17 00:00:00 2001
> +From: Tony Tascioglu <tony.tascioglu@windriver.com>
> +Date: Mon, 21 Jun 2021 12:34:22 -0400
> +Subject: [PATCH] libyang: fix initial build errors
> +
> +This patch addresses build errors seen when integrating libyang as a
> +recipe.
> +
> +The call to pcre2-config has been commented out. *-config calls are
> +being replaced by pkgconfig, and we want to avoid the binary config
> +calls. This call can safely be discarded since it is used to check
> +the version of libpcre2 on the system, and all recent YP builds meet
> +the minimum required version (v10.21).
> +
> +There is a missing include statement for stdint.h in utests.h which
> +causes build problems. stdint.h is required to be imported by cmocka.h
> +prior to the cmocka file. Adding the stdint allows it to build the
> +tests correctly
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
> +---
> + CMakeModules/FindPCRE2.cmake | 2 +-
> + tests/utests/utests.h        | 1 +
> + 2 files changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/CMakeModules/FindPCRE2.cmake b/CMakeModules/FindPCRE2.cmake
> +index 8f60daa2..ad014f14 100644
> +--- a/CMakeModules/FindPCRE2.cmake
> ++++ b/CMakeModules/FindPCRE2.cmake
> +@@ -12,7 +12,7 @@ FIND_PATH(PCRE2_INCLUDE_DIR pcre2.h)
> + FIND_LIBRARY(PCRE2_LIBRARY NAMES libpcre2.a pcre2-8)
> +
> + # Check required version
> +-execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
> ++# execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
> +
> + # Handle the QUIETLY and REQUIRED arguments and set PCRE_FOUND to TRUE if all listed variables are TRUE.
> + INCLUDE(FindPackageHandleStandardArgs)
> +diff --git a/tests/utests/utests.h b/tests/utests/utests.h
> +index 5bea0459..a256120c 100644
> +--- a/tests/utests/utests.h
> ++++ b/tests/utests/utests.h
> +@@ -23,6 +23,7 @@
> + #include <stddef.h>
> + #include <stdlib.h>
> +
> ++#include <stdint.h>
> + #include <cmocka.h>
> +
> + #include <string.h>
> +--
> +2.32.0
> +
> diff --git a/meta-oe/recipes-extended/libyang/libyang/run-ptest b/meta-oe/recipes-extended/libyang/libyang/run-ptest
> new file mode 100644
> index 000000000..1c9f8f47f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libyang/libyang/run-ptest
> @@ -0,0 +1,46 @@
> +#!/bin/sh
> +# Valid tests to run
> +tests="utest_binary \
> +       utest_bits \
> +       utest_common \
> +       utest_hash_table \
> +       utest_inet_types \
> +       utest_int8 \
> +       utest_json \
> +       utest_list \
> +       utest_merge \
> +       utest_metadata \
> +       utest_parser_yang \
> +       utest_parser_yin \
> +       utest_pattern \
> +       utest_printer_yang \
> +       utest_printer_yin \
> +       utest_range \
> +       utest_schema \
> +       utest_set \
> +       utest_string \
> +       utest_tree_data \
> +       utest_tree_schema_compile \
> +       utest_types \
> +       utest_xml \
> +       utest_xpath \
> +       utest_yang_types \
> +       utest_yanglib"
> +
> +# cd into right directory
> +ptestdir=$(dirname "$(readlink -f "$0")")
> +cd "$ptestdir"/tests || exit
> +
> +# Run specified tests
> +for f in $tests
> +do
> +    if test -e ./"$f"; then
> +        if ./"$f" > ./"$f".out 2> ./"$f".err; then
> +            echo "PASS: $f"
> +        else
> +            echo "FAIL: $f"
> +        fi
> +    else
> +        echo "SKIP: $f"
> +    fi
> +done
> diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
> new file mode 100644
> index 000000000..9cab6507e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "YANG data modeling language library"
> +DESCRIPTION = "libyang is a YANG data modelling language parser and toolkit written (and providing API) in C."
> +HOMEPAGE = "https://github.com/CESNET/libyang"
> +SECTION = "libs"
> +LICENSE = "BSD-3-Clause"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
> +
> +SRCREV = "69d9fff65abb58beb0bb6aa9ecacd572ca1dfc56"
> +
> +SRC_URI = "git://github.com/CESNET/libyang.git \
> +           file://libyang-skip-pcre2-config-add-stdint-h.patch \
> +           file://run-ptest \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +# Main dependencies
> +inherit cmake pkgconfig lib_package binconfig-disabled ptest
> +DEPENDS = "libpcre2"
> +DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}"
> +BINCONFIG = "${bindir}/pcre2-config"
> +
> +# Ptest dependencies
> +RDEPENDS_${PN}-ptest += "valgrind"
> +
> +EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
> +EXTRA_OECMAKE += " ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_BUILD_TESTS=ON', '', d)}"
> +
> +do_install_ptest () {
> +    cp -a ${B}/tests/ ${D}${PTEST_PATH}/
> +}
> +
>
> 
>

--------------CCF862885F8C9664FC5810E2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="monospace">Here is the build status for this recipe.</font></p>
    <p><font face="monospace">As you can see, there are problems with
        targets that don't have support for valgrind, which is a
        dependency when ptests are enabled.</font></p>
    <p><font face="monospace">I'll send a v2 with a COMPATIBLE_HOST
        filter.<br>
      </font></p>
    <p><font face="monospace">BUILDALL-QEMU LOG FOR libyang<br>
        START TIME: 2021-06-29_09:03:22<br>
        HOSTNAME: ala-lpggp3<br>
        HOST OS: Ubuntu 18.04.3 LTS<br>
        HOST KERNEL: 5.4.0-74-generic<br>
        ===============<br>
        BUILD RESULTS:<br>
        [glibc]<br>
        FAIL: qemuriscv32<br>
        FAIL: qemuarmv5<br>
        PASS: qemumips<br>
        PASS: qemux86-64<br>
        PASS: qemuarm64<br>
        PASS: qemumips64<br>
        PASS: qemuarm<br>
        PASS: qemuppc<br>
        FAIL: qemuriscv64<br>
        PASS: qemuppc64<br>
        PASS: qemux86<br>
        [musl]<br>
        FAIL: qemuriscv32<br>
        FAIL: qemuarmv5<br>
        PASS: qemumips<br>
        PASS: qemux86-64<br>
        PASS: qemuarm64<br>
        PASS: qemumips64<br>
        PASS: qemuarm<br>
        PASS: qemuppc<br>
        FAIL: qemuriscv64<br>
        PASS: qemuppc64<br>
        PASS: qemux86<br>
        ===============<br>
        PASSED: 16<br>
        FAILED: 6</font></p>
    <p><font face="monospace">Thanks, Tony<br>
      </font></p>
    <div class="moz-cite-prefix">On 6/30/21 10:37 AM, Tony Tascioglu
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:168D62FBA07D585D.13886@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Add a new recipe, patches, and ptest coverage for libyang.

The recipe follows from upstream, using the cmake build system.

There were 2 small changes needed to get the package building:
  - Remove call to pcre2-config
  - Add missing import statement

The recipe has a dependency on libpcre2, which satisfies the minimum
requirements for libyang. In addition, for tests, cmocka is required
during build and runtime, and valgrind is required in the runtime for
some tests.

Due to the way the library by default builds in a debug mode, release
mode was specified. However, this disables building the built-in tests,
so an EXTRA_OECMAKE was added based on whether or not ptests are enabled
to specifiy the required extra flag.

Binconfig-disabled is inherited since using pcre2-config directly is not
suggested anymore. Cmocka as a dependency depends on whether ptests have
been enabled. Since ptests are built with the main package, we need
cmocka installed before the test are compiled if they are needed.

Ptest coverage:
The ptests come from the original tests included with the library.
Ptests are in ctest format by default, so we compare the return code to
print it in Yocto format. However, as each &quot;test&quot; target executable has
multiple tests in it, the full stdout and stderr logs are saved for
troubleshooting.

Currently, several of the tests fail due to hardcoded paths in the
executable binaries generated, this is an issue we will take upstream.
For now, only the tests which work on a different target are enabled as
the ptests. The list can be updated in the run-ptest script, which is
portable shell compatible, without requiring bash.

The recipe also has libyang-bin as a split package, which includes
yanglint should it be needed.
This recipe was tested using buildall-qemu as well as from within qemu
in x86_64 and arm64.

Signed-off-by: Tony Tascioglu <a class="moz-txt-link-rfc2396E" href="mailto:tony.tascioglu@windriver.com">&lt;tony.tascioglu@windriver.com&gt;</a>
---
 ...byang-skip-pcre2-config-add-stdint-h.patch | 55 +++++++++++++++++++
 .../libyang/libyang/run-ptest                 | 46 ++++++++++++++++
 .../recipes-extended/libyang/libyang_2.0.7.bb | 33 +++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
 create mode 100644 meta-oe/recipes-extended/libyang/libyang/run-ptest
 create mode 100644 meta-oe/recipes-extended/libyang/libyang_2.0.7.bb

diff --git a/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
new file mode 100644
index 000000000..e3b2d0e02
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/libyang-skip-pcre2-config-add-stdint-h.patch
@@ -0,0 +1,55 @@
+From c7f3e2a8fe530beec6103cb9071ccc41458879aa Mon Sep 17 00:00:00 2001
+From: Tony Tascioglu <a class="moz-txt-link-rfc2396E" href="mailto:tony.tascioglu@windriver.com">&lt;tony.tascioglu@windriver.com&gt;</a>
+Date: Mon, 21 Jun 2021 12:34:22 -0400
+Subject: [PATCH] libyang: fix initial build errors
+
+This patch addresses build errors seen when integrating libyang as a
+recipe.
+
+The call to pcre2-config has been commented out. *-config calls are
+being replaced by pkgconfig, and we want to avoid the binary config
+calls. This call can safely be discarded since it is used to check
+the version of libpcre2 on the system, and all recent YP builds meet
+the minimum required version (v10.21).
+
+There is a missing include statement for stdint.h in utests.h which
+causes build problems. stdint.h is required to be imported by cmocka.h
+prior to the cmocka file. Adding the stdint allows it to build the
+tests correctly
+
+Upstream-Status: Pending
+
+Signed-off-by: Tony Tascioglu <a class="moz-txt-link-rfc2396E" href="mailto:tony.tascioglu@windriver.com">&lt;tony.tascioglu@windriver.com&gt;</a>
+---
+ CMakeModules/FindPCRE2.cmake | 2 +-
+ tests/utests/utests.h        | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeModules/FindPCRE2.cmake b/CMakeModules/FindPCRE2.cmake
+index 8f60daa2..ad014f14 100644
+--- a/CMakeModules/FindPCRE2.cmake
++++ b/CMakeModules/FindPCRE2.cmake
+@@ -12,7 +12,7 @@ FIND_PATH(PCRE2_INCLUDE_DIR pcre2.h)
+ FIND_LIBRARY(PCRE2_LIBRARY NAMES libpcre2.a pcre2-8)
+ 
+ # Check required version
+-execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
++# execute_process(COMMAND pcre2-config --version OUTPUT_VARIABLE PCRE2_VERSION OUTPUT_STRIP_TRAILING_WHITESPACE)
+ 
+ # Handle the QUIETLY and REQUIRED arguments and set PCRE_FOUND to TRUE if all listed variables are TRUE.
+ INCLUDE(FindPackageHandleStandardArgs)
+diff --git a/tests/utests/utests.h b/tests/utests/utests.h
+index 5bea0459..a256120c 100644
+--- a/tests/utests/utests.h
++++ b/tests/utests/utests.h
+@@ -23,6 +23,7 @@
+ #include &lt;stddef.h&gt;
+ #include &lt;stdlib.h&gt;
+ 
++#include &lt;stdint.h&gt;
+ #include &lt;cmocka.h&gt;
+ 
+ #include &lt;string.h&gt;
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-extended/libyang/libyang/run-ptest b/meta-oe/recipes-extended/libyang/libyang/run-ptest
new file mode 100644
index 000000000..1c9f8f47f
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang/run-ptest
@@ -0,0 +1,46 @@
+#!/bin/sh
+# Valid tests to run
+tests=&quot;utest_binary \
+       utest_bits \
+       utest_common \
+       utest_hash_table \
+       utest_inet_types \
+       utest_int8 \
+       utest_json \
+       utest_list \
+       utest_merge \
+       utest_metadata \
+       utest_parser_yang \
+       utest_parser_yin \
+       utest_pattern \
+       utest_printer_yang \
+       utest_printer_yin \
+       utest_range \
+       utest_schema \
+       utest_set \
+       utest_string \
+       utest_tree_data \
+       utest_tree_schema_compile \
+       utest_types \
+       utest_xml \
+       utest_xpath \
+       utest_yang_types \
+       utest_yanglib&quot;
+
+# cd into right directory
+ptestdir=$(dirname &quot;$(readlink -f &quot;$0&quot;)&quot;)
+cd &quot;$ptestdir&quot;/tests || exit
+
+# Run specified tests
+for f in $tests
+do
+    if test -e ./&quot;$f&quot;; then
+        if ./&quot;$f&quot; &gt; ./&quot;$f&quot;.out 2&gt; ./&quot;$f&quot;.err; then
+            echo &quot;PASS: $f&quot;
+        else
+            echo &quot;FAIL: $f&quot;
+        fi
+    else
+        echo &quot;SKIP: $f&quot;
+    fi
+done
diff --git a/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
new file mode 100644
index 000000000..9cab6507e
--- /dev/null
+++ b/meta-oe/recipes-extended/libyang/libyang_2.0.7.bb
@@ -0,0 +1,33 @@
+SUMMARY = &quot;YANG data modeling language library&quot;
+DESCRIPTION = &quot;libyang is a YANG data modelling language parser and toolkit written (and providing API) in C.&quot;
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/CESNET/libyang">&quot;https://github.com/CESNET/libyang&quot;</a>
+SECTION = &quot;libs&quot;
+LICENSE = &quot;BSD-3-Clause&quot;
+
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad">&quot;file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad&quot;</a>
+
+SRCREV = &quot;69d9fff65abb58beb0bb6aa9ecacd572ca1dfc56&quot;
+
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="git://github.com/CESNET/libyang.git\+file://libyang-skip-pcre2-config-add-stdint-h.patch\+file://run-ptest\+">&quot;git://github.com/CESNET/libyang.git \
+           file://libyang-skip-pcre2-config-add-stdint-h.patch \
+           file://run-ptest \
+           &quot;</a>
+
+S = &quot;${WORKDIR}/git&quot;
+
+# Main dependencies
+inherit cmake pkgconfig lib_package binconfig-disabled ptest
+DEPENDS = &quot;libpcre2&quot;
+DEPENDS += <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('PTEST_ENABLED','1','cmocka','',d)}">&quot;${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}&quot;</a>
+BINCONFIG = &quot;${bindir}/pcre2-config&quot;
+
+# Ptest dependencies
+RDEPENDS_${PN}-ptest += &quot;valgrind&quot;
+
+EXTRA_OECMAKE = &quot;-DCMAKE_BUILD_TYPE=Release&quot;
+EXTRA_OECMAKE += &quot; ${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_BUILD_TESTS=ON', '', d)}&quot;
+
+do_install_ptest () {
+    cp -a ${B}/tests/ ${D}${PTEST_PATH}/
+}
+
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CCF862885F8C9664FC5810E2--
