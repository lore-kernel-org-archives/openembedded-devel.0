Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E8EC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 06:38:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.84619.1677479914595360279
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Feb 2023 22:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=YU8tb/UT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=142213231d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31R6E3Pn004920
	for <openembedded-devel@lists.openembedded.org>; Sun, 26 Feb 2023 22:38:34 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=aCRc/iiJ4sgd0UGa78rJBxqrYphSl1HPksPziuPPTIY=;
 b=YU8tb/UTGlV8gwzOwPgBC3jbDz4v5Nz8V1aDnU4ZnGFjmc2lJqMBOap7VqFvGZog8hrn
 a6bm3J0NYgrgmf3E3lwTwC0+WGwaEIhi8FbqEnrnwlu3ELYrC98SUkY9InAdmr7SHufr
 ROtPEhR439+i3+YPn8+A+wWTx9inOXpO2z8UENP+gKF/Tp4soTEWqOo8/OS5+RAJYWcK
 DkY070V1w8cbA3PHxjzJgUFTptHW/iMqotmCRl4sPf8Hugc0Q5Jc5dX72gUX1bA4UYyR
 zVhcDDftmSSsMoZtBgHmJ6n1W9NRIRBZs6ZH8RFYlL+V6QDSDh1IhjOkBwe5C0eNqYjx Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqr9bs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 26 Feb 2023 22:38:33 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31R6cXe8023945
	for <openembedded-devel@lists.openembedded.org>; Sun, 26 Feb 2023 22:38:33 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqr9bs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 26 Feb 2023 22:38:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bl/patyCA4VDkJIHC3qTYK9jjtXm0+xEsMxPlc7CZOxETPFqIz0SFV7T9ArKtqx2LmgYJBuFFkM7Btvwqg138rJxYfPmkDJuyVZjRNB7pdfQMFKPl0LxF10FEEOjDG5z6V9pIfUxNaa65cuJZIIm9zWmWCNjZhd29aGOdFv0wVdjzpFtVoEKmAYDF2CJP6861px8ndbIH588SH4z1/FZAmuCiz/4HOcCLWRb66+QqEtRKhgwofmOC9bajVkrNabOq8hKdsXu30UDuktVSI8PufjhRDVz4pdgwgRGbnYR85KXpbwV+tTttv/Fy9PqLpwfByEd+Ej1l+kuY1NBal06KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCRc/iiJ4sgd0UGa78rJBxqrYphSl1HPksPziuPPTIY=;
 b=abl7lEFq/f6XB4wABRRVki3x58xsv6YFzjEafwGUQIov3v4OVMMd7h9ARSAV+8DdPMXr80U3oHHkQSc8AQvRX1uxh6mtOlNOJ7sF3wed7vjctst8fb6PH0y/h1UQYBO/LLYDYLL6zun1zw5UsZLo0LbXXJiL2rJyvs/q0GkdUbfI1F4NU42aUMBuFVMKuhKlq1k8AsaFiCIEDhxcIQEkqWMx2Sq2+j/A41KCf8ERd4qBzLKkPcZWmY3WHC5CsElxqdAAdbDpULRKVW05bOwIR/aBWVkc6GKD8o7FOWCL6zuPvE6N7f1v0EzrvuOAxWlaksSkdHEW074RdvAt8HcSyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.26; Mon, 27 Feb
 2023 06:38:30 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::524d:df89:5eb3:f545]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::524d:df89:5eb3:f545%7]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 06:38:30 +0000
Message-ID: <dc3f3357-cfa2-3d2e-85ec-918f80995885@windriver.com>
Date: Mon, 27 Feb 2023 14:38:24 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [kirkstone][meta-oe][PATCH V2] liblockfile: fix do_install
 failure when ldconfig is not installed
Content-Language: en-US
To: Changqing Li <changqing.li@eng.windriver.com>,
        akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20230224043904.3306228-1-changqing.li@windriver.com>
 <3e87d1a1-b6fa-808e-8511-17d203be0a52@gmail.com>
 <17478D4C50DAAC14.18951@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17478D4C50DAAC14.18951@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 376056de-d6bd-4fba-5f26-08db188d3d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8IcYLbzbfAPg14Ibe7NXSTSakxbNLWiAAT57DEJDwVo38sdeVe4pcK1QwltWWnZZ0sG+r8ZVfcFrrh4M8XUuTG5bT90L9BDikyIzf1n9AYBACSvLuEenNzgbMLVS2k6DKrr1iptIyiTutw8yhp8d1VHyEc0ZlzoVldErTMNlgz6Fy2T5TcmFXCuSAMcqoKrIl8vIjxKujoKNB6Drxst2q3iK4gagclmHmRJKqeB1ar0WpxwQGsM/KS8r2Qcl5XYVcJpJLcHcj/E5KMFz0iovZEoKBeadkT3drMWWJr/hINhDWEJCsf3NJOk2LK3HpxO/zzkFprMq/LVtDuVXLiwgum2Z3AhH5tAGYuEsKrM1J5/SZ2dFiocTwRva2/SBntXRrTgsHKkYPN0qBdm7MvSat06yfiD+2UrmxCkuh7BdWQiBNVqcP+2jGbDDOEUw5XVgtsMhxgDBTJg1iKa2qUaOaqpejwXoJAP/IHXz60xsNtvUYFg03bTpkB5ft1oBK58vWAhesYHcpG35Ji+KFDRd1sYhqB+rlmE7LZy1vZocPBOBIGKHi2E+G714Gqio+en2YX1bT+9OumEXUbfkhbTaeGl8V6/7n9d6tQi9Zj7fpKh6S8U+Be0fGoV3e5O6xw2zRmn7hR+JNK2lq9c1l/X3qu3hXr3kx6qczoyhuSJrCmQBlQviLwvXmA2D84fFrf3ERPqBi12HODvhAlxOJmr151dLcI+K4chfGbTKAnLHEPc/JjiDspXjORPkPfs0WnvS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(366004)(39850400004)(451199018)(186003)(38100700002)(83380400001)(8936002)(66556008)(8676002)(41300700001)(66476007)(2906002)(44832011)(5660300002)(66946007)(6506007)(478600001)(53546011)(6512007)(2616005)(26005)(6666004)(966005)(86362001)(316002)(110136005)(36756003)(66899018)(31696002)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RG1DUW1nVXNKWlc1UW9aTmQyaUxPSGIwVW5IK05pSVpib3dzNDV5ZXZXU2E5?=
 =?utf-8?B?UXl5ZjVGMkNXZVNEVTZSeGZXbHAwYzJxNG5CRjkwWEVWR0h4OE53VC9PM0wr?=
 =?utf-8?B?dytXcmFFbVkxYytnczVDSUovL1ZrOWFKL0F1eDVnaXZBdEtZMHpKOVVKTFhQ?=
 =?utf-8?B?VzUveEduTVlFZm1iUzQvMWZ4cUc5WUdXTXU2akxNTWhaNk4zU0J3RzhIYnZ5?=
 =?utf-8?B?Z2RFUU5RQVR6R0hSYlZhWXhiRjAydFdJbkJKUGN0Qzc5SGZGeGgwWURiWC9O?=
 =?utf-8?B?dUYzTDU1TlNuQStyNkZUR0l2cUdONWV4Q1BJTHFhS05PRXdRWjcvblVFdG50?=
 =?utf-8?B?cDZoOTZ2ODVkNEpyR0o3ZXdDNFVKcFNJK3BPTjZJS2d3VGZmRlVUblAxK1l0?=
 =?utf-8?B?alBpbnRYV29zUkhPUTFiaGtVNHJONWYrNnByUi9WZ0IreFIvQ0RsQ0ZpUWVN?=
 =?utf-8?B?Q2JQeVYxc2RzUTZycmM3TUdUQ1g3NnpBellDTmlYOTJXN2ZWWWNZY20rd1Zh?=
 =?utf-8?B?bXZlQWdYdm1nYlRncUJvYXNpeWRzWVRtbG8vSXM2aExoNExsN2FBNjhLTTBU?=
 =?utf-8?B?eWltSmZmOWlKbEpnclh4MCtGTVpWczFXWGR5ZzRNdzhLT1F4T3I4Ry9sZjZ1?=
 =?utf-8?B?Zi9NZUJCMld6WFVYMXR1QkFqY05JWGd4cjQ4OGZGYm1OZ0c1RSs4dnBYTzlT?=
 =?utf-8?B?MUNJLzdEQ1BUUHBJTlgwRjVyNk9KMm5nSHBENms5d2pjVUowU2NOOUE5ZDN4?=
 =?utf-8?B?M0tlc3NwcGhRVjJiYVMwL3c3dndNTkVnNFNqV1NPUEhVUjJhbWc2Qkd5dzhk?=
 =?utf-8?B?eWEzbkNKUEtRdkRSbjhibytkTk5jWnZkSFc5ZWNvSjd1TzVRbEl4MVI2eTgr?=
 =?utf-8?B?ZE42MkF2WTJFWVlYRVl6bTRNWnVtaXRmZnVOVXg5R3NNeE0vT1pWaEErTG9a?=
 =?utf-8?B?bmJyaHBNSS9xajdkbkJhcEdHQ1UzNHA2bmlobjdCcmNLQXRUWUg4d3dvUEVK?=
 =?utf-8?B?VDVIbEd0c1NMQkt2b0ZEVE9VSjg5V0JOdHQ3WVNvU3pVZnVRSTRrTDNDbkQv?=
 =?utf-8?B?UDIveGY4RHdZS3M5d21wdm1FK245ZENsREFYVDJreFYwSXRWZ3FYRUJ1ZHc4?=
 =?utf-8?B?Y21SY3NJeGh3K0lZNTlKcVp3UGNHcGdZWVZCd0orYTg5RUdQbVlzejB5MUtE?=
 =?utf-8?B?TFRjQkVaZEk2cW5LcXZGdWpHN2p3Q3ErK0liK0pYdXpCSmtyUEFsTmJkaGhQ?=
 =?utf-8?B?TUVFNmJScWpSN2NsUDRxQzJsS21iRTAwSHhmekJmUzk0bnJNVFdsSDlEZzFQ?=
 =?utf-8?B?NnRldFJ2TldTcXVINTdkaEE0TXZRdlBDemh4RW81MDV2MklLY0M2bDk5YmZr?=
 =?utf-8?B?dk1NbmZCSVVTUzYxV1A2Q1N1dmxCc2RUT0lpZnFIUmYyakllcWsvWW9QYlpZ?=
 =?utf-8?B?dFQyT29OaFVtYlI3Tm8yMHYvejBybms4MzdFdlBzSUNobXlJaWhrU0RxTVNZ?=
 =?utf-8?B?OVp3Yy9zWStlUFM0Z1MrclF6NWh0dmJ1czVzdFlQSDdHM0NFT2hhUCt0ZGFs?=
 =?utf-8?B?RkpKUzRmcnFnSVBncTFIVnFJSCtCcHF0Z285V0tvMFMvU1MrZzFGRnpqdU4x?=
 =?utf-8?B?YWgwL3B6YXgrZmZhNXRQemhhNjJtd051ZGdrVUcxVGo1T0tTOU1vV3V2WCtt?=
 =?utf-8?B?NmR0OG04Y2hHMGxKTy9RVUg1SGFyUlkvTHFrcDZIQ2pqWjh4aTNqM0duSVZ2?=
 =?utf-8?B?djZyVmVqdHFHeFU2bXU4MmtLeENoVnBvTEliNjRsUCtGcEhLV3QrWW8wbHRn?=
 =?utf-8?B?WFJNV2xGQ3NFbFJHVXlyWXFGWnFReXg5R3RkN0tOS3M1bGpVeGhyOXlzcHNB?=
 =?utf-8?B?VXEzZHNJNHV6b01mQ3orbmZZb1BuU0p4RmdwZUpqMzhlYlZvdmVlUk91dThy?=
 =?utf-8?B?QVJlVXNOT2hpUlZYdXU2NHA2QWRSd0VNLzBaa2tYWEVyaEhUT3RxWHNlSHdt?=
 =?utf-8?B?d3k4VFlsb1htQ3RMaG9pdGY4Y2xLbEg2TC81ajNSWkxJblNBaUg3WURMUkhi?=
 =?utf-8?B?UTNUbHRjOWRyd2RFMkFqemYxNWJPUHRyZUpxQXBLaFBhQXoyN0FUTkgwOHdR?=
 =?utf-8?B?anlhUmt0WTF6eVdnNnllbFNKRW9TenRMNFNhV1FLTXFJNkZGSStXdzA1VXZJ?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 376056de-d6bd-4fba-5f26-08db188d3d3c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 06:38:30.2535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mb+Opuffh1xJt0gmxtd7aNUSwlIb22Jky79GCbdXdse4c7qqHOcS+wOPmd5Iaq0jZDp3/oi/DA/Tx36yAhxtwEWPJzgAtuDeNVjGuYqe+oQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
X-Proofpoint-GUID: PF7Ikk1hKJ7bn-pmpmhweaira5QvFBEg
X-Proofpoint-ORIG-GUID: lO3SkY0GFTejFHMvhwBT4Efc0aicpHNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302270051
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31R6E3Pn004920
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 06:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101261


On 2/27/23 10:25, Changqing Li wrote:
>
> On 2/26/23 01:19, akuster808 wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> whats in V2?
>
> In V2, I changed to a better solution and upstream it.
>
> https://github.com/miquels/liblockfile/pull/21
>
> Regards
>
> Sandy

Hi,

Sorry, this patch still have issue,=C2=A0 please ignore this V2,=C2=A0 I =
need=20
resend an V3.

Regards
Sandy

>
>>
>> -armin
>>
>> On 2/23/23 11:39 PM, Changqing Li wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> liblockfile do_install task will fail since syntax error when ldconfi=
g
>>> is not installed on the host.
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>> =C2=A0 ...install-failure-on-host-without-ldco.patch | 62=20
>>> +++++++++++++++++++
>>> =C2=A0 .../liblockfile/liblockfile_1.14.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>> =C2=A0 2 files changed, 63 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-fix=
-install-failure-on-host-without-ldco.patch
>>>
>>> diff --git=20
>>> a/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-f=
ix-install-failure-on-host-without-ldco.patch=20
>>> b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-f=
ix-install-failure-on-host-without-ldco.patch=20
>>>
>>> new file mode 100644
>>> index 000000000..5103f910d
>>> --- /dev/null
>>> +++=20
>>> b/meta-oe/recipes-extended/liblockfile/liblockfile/0001-Makefile.in-f=
ix-install-failure-on-host-without-ldco.patch
>>> @@ -0,0 +1,62 @@
>>> +From 0f78a746fee8553082c73beb2217d08fc5aaaa83 Mon Sep 17 00:00:00 20=
01
>>> +From: Changqing Li <changqing.li@windriver.com>
>>> +Date: Fri, 24 Feb 2023 02:57:35 +0000
>>> +Subject: [PATCH] Makefile.in: fix install failure on host without=20
>>> ldconfig
>>> +
>>> +* fix syntax error when ldconfig is not installed on host
>>> +
>>> +when ldconfig is not installed on the build host, install will=20
>>> failed with
>>> +error:
>>> +ln -sf nfslock.so.0.1=20
>>> /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/=
lib64/nfslock.so.0
>>> +install -m 644 lockfile.h maillock.h=20
>>> /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/=
include
>>> +if test=20
>>> "/mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image" =3D=
=20
>>> ""; then ; fi
>>> +if [ "mail" !=3D "" ]; then\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -g ma=
il -m 2755 dotlockfile=20
>>> /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/=
bin;\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -g ro=
ot -m 755 dotlockfile=20
>>> /mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image/usr/=
bin;=20
>>> \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> +/bin/sh: -c: line 1: syntax error near unexpected token `;'
>>> +/bin/sh: -c: line 1: `if test=20
>>> "/mnt/tmp-glibc/work/core2-64-wrs-linux/liblockfile/1.14-r0/image" =3D=
=20
>>> ""; then ; fi'
>>> +
>>> +* only run ldconfig when it exists
>>> +
>>> +Upstream-Status: Submitted=20
>>> [https://github.com/miquels/liblockfile/pull/21]
>>> +
>>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> +---
>>> + Makefile.in | 5 +++--
>>> + 1 file changed, 3 insertions(+), 2 deletions(-)
>>> +
>>> +diff --git a/Makefile.in b/Makefile.in
>>> +index bfa0acb..e29763e 100644
>>> +--- a/Makefile.in
>>> ++++ b/Makefile.in
>>> +@@ -9,6 +9,7 @@ NFSVER=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0.1
>>> + CFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D @CFLAGS@ -I.
>>> + LDFLAGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D @LDFLAGS@
>>> + CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D @CC@
>>> ++LDCONFIG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D @LDCONFIG@
>>> +
>>> + prefix=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D $(DESTDIR)@prefix@
>>> + exec_prefix =3D @exec_prefix@
>>> +@@ -58,7 +59,7 @@ install_shared:=C2=A0=C2=A0=C2=A0 shared install_s=
tatic=20
>>> install_common
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(libdir)/liblockfile=
.so.$(SOVER)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ln -s liblockfile.so.$(SOVER)=20
>>> $(libdir)/liblockfile.so.$(MAJOR)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ln -s liblockfile.so.$(SOVER) $(libdir)/liblockfile.so
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if test "$(DESTDIR)" =3D ""; then @LDCONFIG@; fi
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if test "$(DESTDIR)" =3D "" -a -n "$(LDCONFIG)"; then=20
>>> $(LDCONFIG); fi
>>> +
>>> + install_common:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 install -d -m 755 -g root -p $(includedir)
>>> +@@ -79,7 +80,7 @@ install_nfslib:=C2=A0=C2=A0=C2=A0 nfslib
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 install -m 755 nfslock.so.$(NFSVER) $(nfslockdir)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ln -sf nfslock.so.$(NFSVER) $(libdir)/nfslock.so.0
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if test "$(DESTDIR)" =3D ""; then @LDCONFIG@; fi
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if test "$(DESTDIR)" =3D "" -a -n "$(LDCONFIG)"; then=20
>>> $(LDCONFIG); fi
>>> +
>>> + clean:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 rm -f *.a *.o *.so *.so.* dotlockfile
>>> +--
>>> +2.32.0
>>> +
>>> diff --git=20
>>> a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb=20
>>> b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
>>> index bac3a2c0b..eefc25dc4 100644
>>> --- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
>>> +++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.14.bb
>>> @@ -10,6 +10,7 @@ SRC_URI =3D=20
>>> "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.14.orig.tar.gz =
\
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-Makefile.in-add-DESTDIR.pa=
tch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-Makefile.in-install-nfsloc=
k-libs.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://liblockfile-fix-install-so-to-m=
an-dir.patch \
>>> +=20
>>> file://0001-Makefile.in-fix-install-failure-on-host-without-ldco.patc=
h=20
>>> \
>>> =C2=A0 "
>>>
>>> =C2=A0 SRC_URI[md5sum] =3D "420c056ba0cc4d1477e402f70ba2f5eb"
>>>
>>>
>>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101260): https://lists.openembedded.org/g/openembed=
ded-devel/message/101260
> Mute This Topic: https://lists.openembedded.org/mt/97200207/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

