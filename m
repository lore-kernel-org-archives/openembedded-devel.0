Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B5BC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 06:43:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.3241.1642574611799409697
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 22:43:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=IQIiN9a6;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80187a8ac3=zhe.he@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20J6W14K019779
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 22:43:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=wWmDEI1srnmOZf6updjaS15aaVpyOastMovgeZp/YMg=;
 b=IQIiN9a6UVmVudIKrFH/uvKvMGMhazM1kPLO/fqyqfzD0XSn0aru1nwtptHMUtaPs/fU
 D9L81BEenU2mj1frCduCrRdU5U+/pyfD50Spxy8OviSoVa5IHAZpnZUKCSerg7zHXsS2
 xSzO+W3VuK65WNk8I59aDHeYI1SYpPwopV4l7PxoVZ6iKASFNrw5iLv4KCfw6a20szDx
 FthWNzR8raBQvVh4/0Sd1mPnjAhCetI7qBCWhHZG/iFaQqueZgkqXwJogtdfnh5gM3Re
 0NnkSGvanjoNLeMhsAdlGhC8+FPZ0cGzU4Eo0qza/to0RG5Fas+ZcQ3PyfzbEfyHwJ3M pA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dn5v1senn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 22:43:31 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20J6hUDE012504
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 22:43:30 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dn5v1senk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jan 2022 22:43:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QI1u5BL+Nth0gEXvDdliMsVm3nlv37X+LRK/N6Xnkv1D3FziQS8MDVbHuNpFRYyvzRx2MVAU5R+dW533B5p+f5cM8k6nvasPKkcaAKWOwq0jiT7zDQquZf0+CWa6FR8YU9dJColFDQcg+B2z3UdFK6StMvxxWmka9NkTzFqIOWL7AvzXiGPa6ubTiZM2SfZqajM6SIvM2UYamx4MDgkin5la+yyTtVD9s1IkkM/fmpns/QDRwnTq78jwKG8FEJoiZiMhFUUjQkWIzET1WN4ZcrXw5qpTpWkYHsmkpp/is9C0ZPZiMjtAluPSx5kqVKh2MIAOKiGlSgw75ucSrnp6SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWmDEI1srnmOZf6updjaS15aaVpyOastMovgeZp/YMg=;
 b=NHgjq1ljcqu0AmG+iwcQXJrYsfIPnzn6nqkLwmf6tUtVncDPBTqyhgG6z1KulXFPaQrurdFYgHOK/4M7GLmh5/bOgg62q4c28a5qJ7/ypG3VuQ58GLBhD1Uh+RHTQ1KTBf84avmDcrOR28OsFxhlRGGCZo0AtCnB9qx9ACv6pvPD0MrdxoIrnj6sybQCXXZ23ZdXDVHUGQ7HMkcW0+H8XvbGyrNqJBcL0cjdoXVzo23HfIcz5dxBRaNrlkSueJmSaSSNbQ1RuTX+0SaOAjWFwsXX7NdAIh+TLok8jH/o93Kc94AzWaTySJtjuYuBg/pdI78GlPwjW5V8asTtuZEYeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM6PR11MB3194.namprd11.prod.outlook.com (2603:10b6:5:5c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 06:43:28 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::a917:745f:993c:1e9d%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 06:43:28 +0000
Subject: Re: [oe][meta-oe][hardknott][PATCH] protobuf: Fix static init fiasco
 on 3.15.2
From: He Zhe <zhe.he@windriver.com>
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20220112081106.9277-1-zhe.he@windriver.com>
 <08998377-20d8-8f4f-b76e-f6d4f4ce3178@gmail.com>
 <16CAF13AAF79FC83.30699@lists.openembedded.org>
Message-ID: <e809f24f-8dcb-9d93-e11d-5f510336dd9a@windriver.com>
Date: Wed, 19 Jan 2022 14:43:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16CAF13AAF79FC83.30699@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-ClientProxiedBy: SG2P153CA0050.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::19)
 To MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bddc82ea-63de-4a8b-6586-08d9db16ffd8
X-MS-TrafficTypeDiagnostic: DM6PR11MB3194:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB319479E93FE5BF66A28C21188F599@DM6PR11MB3194.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	G2Zs/Kn8tSxWo+QxefjYAXDX22BoRz+hXAH9EiCx6m3dxCFRq0xBQWGczgDl7SxeNVIgfKoUPRskIDcBx/vCNKFxr+7KDF3f9na4z4Xbt644F59aOTR85rhDqQRiX1LA0Bxks39SL7+rdcKPZWwsngCZ5VbXLqCANIelUVq3IpNDMmfc4V0Li6F6lyNi8gep/upaYV9q2qgj5RfsCaC5+bR/GsLKBcklDT7B49JkoCMYQkNXBN8U4jubqnjX/LYTbOKO4XDO3ShXbqaBnUMt0WAKUwIVHvXnqwXsKqUlO5RfSpUBk2UEd36QMWI8jy276++TNCpJ3RLS6QisMMbxSZN7T172maXfJd7gCuenQqPTcHxnsGoTgoSjIJ16OWoCqJBSVb6gkpLZ+HtFr4Us5f3njjVdwiY3fA2k1dx632UFd6oSGUxdUlL+6HMdvsFpqKHSsPHhr6E3Wd4K+j8oXovWZAZ8/7nzmTmmzwKQoiaNSY2JDEao50YxOmtbcF0kFXS0jpMbhrANsV8GiC5zcmi35llPYKEV7op2P99ZECQk9/jwWsgg1aqDpOKDfa48Q4yXp6AhJXWmBzPs3Zcle131yRnv00HpsQ1idcfizH6o5cczPA2n2u0qgqvhI/WBm+RSOW580vH10Q2x9UE76uyLZs7j9lEQLeZ66320XRp4ZOCwOsnsZnIIec2+h6q/CYp0jMUF1XADILIASAUvwhI10QfrzDtP+L5r9Lzf3BuBY2XmwqLmsFUf2VzHSZCTh+IXHcRj/i4QUJr4AErzUuPEtD/tTKj9vBH9BWSlbmQOSHf2iVf/0isHb9wTmuwO6/4keywTO4fIWUR2tC785BKZjEY6uNJzA3sVH7vfEpCBSep8pCz/g/0jnPRq0UbwPiuxudQep+qIbBbrEV8ySsWfkbFTu58/sADxCLthjd7AqM3duqSAJ1fG9eb1Qd2N
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31696002)(38350700002)(2616005)(8676002)(38100700002)(26005)(66946007)(66556008)(86362001)(83380400001)(6486002)(52116002)(508600001)(66476007)(53546011)(5660300002)(31686004)(36756003)(316002)(186003)(8936002)(6512007)(966005)(66574015)(6666004)(6506007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b0dQSFlOcStpbWxYOUhPSDlVaVJnN1M2SlpKU3Y4NkQ1MTU4K2h4V1ZZTUVE?=
 =?utf-8?B?Y0doTzFVd25ad2VXdHRPbjQ2Vkh5Mk1rS3VCeG5Ka0t6bW5xN0w0ckE4dUVZ?=
 =?utf-8?B?OUgxYVJNWEIyWlBuN2lPUzdrRkFZWkRvdUkyTDZmaFdkS2dvUmhFU2hsZFIy?=
 =?utf-8?B?K0ZYeHV3UkY4S3p4KzRuWk5vT2NPRFZEcjl1SDJDcVpJaFowMDNXSWhqWU5i?=
 =?utf-8?B?L3gzN3laWDd1aC8wZ1huaVAraHJsSEd3dmhOYU8zUTlDQUllWnJRbTN1QTNT?=
 =?utf-8?B?YUJvYXpIQXk3bE9TTnluNkcwUTd1M3g0bWlkVmZ3aGZzSEhJcWE1ZXZVODkw?=
 =?utf-8?B?QWJWWWticGxjYjJsRngwYUFZQ3B5bDVreC9XV0orYklmN2Rma3hpWEhQRjdV?=
 =?utf-8?B?b2JDNlArOW0weE5PSmVUQlR3T2Z3SG5SdTMrdnFCWGZuUmNxcnNPT2ZaMUhj?=
 =?utf-8?B?MklKQk9EVHFQaWJaV3lXOXJXZVl2Y0hSbFZYL1BoTTJodkNXcDZ1MUpiNkZF?=
 =?utf-8?B?MERCSXRYSkxmTUl4ZVRUSmc3ODArak9PQldRVE5lWWtvVVZ2bW9uL3FTVnov?=
 =?utf-8?B?Y1J3TXVTT0o2T2dERXY3MmFOaUxyMFZISSsvVElEbTQ1SmdIWndUM0RmYUk3?=
 =?utf-8?B?RkJNbjBkZGJZd1BRRWVDNlBWbW5iTnYxUHkwNXhqSnBXTHI5SmdCVXU5dGsv?=
 =?utf-8?B?Z0duMklYdFZLd1Jack1BMXdRMy9oWktsSkEzR3ExVFlmN2RVRENuaStnVWRU?=
 =?utf-8?B?VkFnRGw4TUNlMERLWTZuSytmZVZZc2FvMU1RakU0N1BERWJLaE00a0RuRCt5?=
 =?utf-8?B?KzVhdExCUXZ5Ti9WVWJSU3M4ZVFZN29kSUlMVUVnKy9tSkNiSTdZYklrZHBy?=
 =?utf-8?B?bGI0OVhybjRFVGlIa2F1V0s0NFEzUmhYYlNlRlk2anVFS0ptbUhneFVlNXU5?=
 =?utf-8?B?dFA3VnBudVlXYjdnUy9yd1BIUm1SMDZxN0t5aC9FN3VBVnNyR1l1S0Y0YnhN?=
 =?utf-8?B?U2o1RzcyUy9sR3djV00rNGR6MHo4SFZweHlieUhwT045c1k0SEl4ajYrc1pK?=
 =?utf-8?B?R05UM0JEZnU1Wm1VUVFpVWZwYlNNbkgxY29BTHRWM2JTZC9zaHlVWC9qNEJm?=
 =?utf-8?B?S0RmcjRBajZGYWJta25hVVZBVzU2ai9VbFFEWXY0QThCUWJrRGV5bjQ1ZFZ4?=
 =?utf-8?B?b25XMlRmZEo2YzROZ0VoZDhwa1FFNXZNbThKV3krUlBXL0FsTGdBTG1zYkth?=
 =?utf-8?B?TXlKbXpJbldGSDJDNFYyeXI5cGFZeU1peXJpLyt6SG1uWjRETXZJT2s4aHF0?=
 =?utf-8?B?cm9od3ZCNFdDS243K250WDNVNXdaSnJjMmdpL1lMeWVkNVFOOTJqRVJzK0hJ?=
 =?utf-8?B?NEhvNDVRMjRkMjNsWUlrQ09mWnBialBaelZrK0lOL1Y5d3hxcVZvQ0V5Q3pr?=
 =?utf-8?B?ckRORmRPbHk1TVlFT2NmemMrLzZiN2VLU1hZcmlRWWV6S3lIeUtKSklySUVV?=
 =?utf-8?B?ZnV1aEx0TUxxcW12TnlCNzN4Sld0d3hiU0dJb0tyYVc5dVZ5MVczYkZ1aWs0?=
 =?utf-8?B?SHBNbHppc2V1WDBRUzZXeS91a29xYzgvY0JMeGNQYU5qVmczYmZDNlM1SUow?=
 =?utf-8?B?Yko3bkhBbDFuSFR1SnlKL0szem5XVkFVbFlHakw2NEc3Vzg5UG1VY3gzSW54?=
 =?utf-8?B?WVVveHQ5UUd2UHZTdTRpbGtrQ1VuNTFYTm5TcmRmZkp0czFrSXpTYkdFNE41?=
 =?utf-8?B?YWF6YnltRmxaZHlaN0F6bnJzN3NjZ0xKaFo4Vkd3TVJyaUZCd0VaRm1MU2lX?=
 =?utf-8?B?QVgvZEg3bmtFSXVxM0pOZUwzWG5SaXlqZHdYcWhGT1JwRTNGdUlqbUhpeFRH?=
 =?utf-8?B?K0ZrUGY5bE1tU3ZYMXBHU3JNVUtkTkVhdSsxcXNmaitVWFlwMjBXT0hqVVlF?=
 =?utf-8?B?SnMyUnUwYmRPTU90TTExbVhZYUZIQXk4TThqV1djd2VUSVlHV0VqRjg4ekxr?=
 =?utf-8?B?bUI2ME54cllKdkszc28wTHhTTVBTZ1VpcHptQ3VPYzBIemtYK2wzRFU2VHJt?=
 =?utf-8?B?NUlpQjFXYWNlTFFmVVNzQnZ4cTAvOXdBcVc4bXh3b08ram41V0pMSVpkOXdh?=
 =?utf-8?B?ZVgvL01wbU44OGV3QU1uNTh6dVVnYytmdExnRG9zUHpFNlZMN0JTcTFzTnh5?=
 =?utf-8?Q?+iPoxNBLnQKRGXlAgrM2fwE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bddc82ea-63de-4a8b-6586-08d9db16ffd8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 06:43:27.9333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TsL1q3dqA6xMb+SzKo2J+p+qd/t7c8JsYwo6L7LvmLhv1BC9LgA8/5HnPJx7Uhh+DXBF4u7emJT+b3s2pNJACw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3194
X-Proofpoint-ORIG-GUID: J-bvI-4uYz_GJbnQt6pn6HTmdhyMBy5B
X-Proofpoint-GUID: uTZZcXD4L525zFCl8cQxazMQT_Fdl_H7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_05,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 mlxscore=0 adultscore=0 impostorscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201190036
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 20J6W14K019779
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 06:43:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94936



On 1/17/22 11:30 AM, He Zhe wrote:
>
> On 1/15/22 10:22 PM, akuster808 wrote:
>> On 1/12/22 12:11 AM, He Zhe wrote:
>>> The protobuf 3.15.2 suffers from the C++ "Static Initialization Fiasc=
o"
>>> issue. This patches makes the extension attributes have a higher
>>> priority than the attributes, so there's no possibility of random
>>> initialization orders.
>>>
>>> Signed-off-by: Jani Nurminen <jani.nurminen@windriver.com>
>>>
>>> Upstream-Status: Pending
>> Since this indicates "Pending", does this issue need to be fixed in
>> Master too?
> Thanks for reminding. Just sent one for master.

This has been merged in master. Can it be merged in hardknott?

Thanks,
Zhe

>
> Zhe
>
>> -armin
>>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>>> ---
>>>  ...r-init-prio-for-extension-attributes.patch | 81 +++++++++++++++++=
++
>>>  .../protobuf/protobuf_3.15.2.bb               |  1 +
>>>  2 files changed, 82 insertions(+)
>>>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-L=
ower-init-prio-for-extension-attributes.patch
>>>
>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower-in=
it-prio-for-extension-attributes.patch b/meta-oe/recipes-devtools/protobu=
f/protobuf/0001-Lower-init-prio-for-extension-attributes.patch
>>> new file mode 100644
>>> index 0000000000..9f4fd71796
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Lower-init-prio=
-for-extension-attributes.patch
>>> @@ -0,0 +1,81 @@
>>> +From 00362d12edf1b7fde723b041a4569dc659e65ad1 Mon Sep 17 00:00:00 20=
01
>>> +From: Jani Nurminen <jani.nurminen@windriver.com>
>>> +Date: Fri, 24 Sep 2021 09:56:11 +0200
>>> +Subject: Lower init prio for extension attributes
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=3DUTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +Added PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY in
>>> +code generation for extension attributes.
>>> +It has lower prio than PROTOBUF_ATTRIBUTE_INIT_PRIORITY to
>>> +ensure that extension attributes are initialized after
>>> +other attribute.
>>> +This is needed in some applications to avoid segmentation fault.
>>> +
>>> +Reported by Karl-Herman N=C3=A4slund.
>>> +
>>> +Signed-off-by: Jani Nurminen <jani.nurminen@windriver.com>
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: He Zhe <zhe.he@windriver.com>
>>> +---
>>> + src/google/protobuf/compiler/cpp/cpp_extension.cc | 2 +-
>>> + src/google/protobuf/port_def.inc                  | 7 +++++++
>>> + src/google/protobuf/port_undef.inc                | 1 +
>>> + 3 files changed, 9 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/src/google/protobuf/compiler/cpp/cpp_extension.cc b/src=
/google/protobuf/compiler/cpp/cpp_extension.cc
>>> +index 3792db81a..cbec19d30 100644
>>> +--- a/src/google/protobuf/compiler/cpp/cpp_extension.cc
>>> ++++ b/src/google/protobuf/compiler/cpp/cpp_extension.cc
>>> +@@ -174,7 +174,7 @@ void ExtensionGenerator::GenerateDefinition(io::=
Printer* printer) {
>>> +   }
>>> +=20
>>> +   format(
>>> +-      "PROTOBUF_ATTRIBUTE_INIT_PRIORITY "
>>> ++      "PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY "
>>> +       "::$proto_ns$::internal::ExtensionIdentifier< $extendee$,\n"
>>> +       "    ::$proto_ns$::internal::$type_traits$, $field_type$, $pa=
cked$ >\n"
>>> +       "  $scoped_name$($constant_name$, $1$);\n",
>>> +diff --git a/src/google/protobuf/port_def.inc b/src/google/protobuf/=
port_def.inc
>>> +index ae9fef425..f1d203707 100644
>>> +--- a/src/google/protobuf/port_def.inc
>>> ++++ b/src/google/protobuf/port_def.inc
>>> +@@ -154,6 +154,9 @@
>>> + #ifdef PROTOBUF_ATTRIBUTE_INIT_PRIORITY
>>> + #error PROTOBUF_ATTRIBUTE_INIT_PRIORITY was previously defined
>>> + #endif
>>> ++#ifdef PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
>>> ++#error PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY was previously de=
fined
>>> ++#endif
>>> + #ifdef PROTOBUF_PRAGMA_INIT_SEG
>>> + #error PROTOBUF_PRAGMA_INIT_SEG was previously defined
>>> + #endif
>>> +@@ -596,6 +599,10 @@
>>> + // Highest priority is 101. We use 102 to allow code that really wa=
nts to
>>> + // higher priority to still beat us.
>>> + #define PROTOBUF_ATTRIBUTE_INIT_PRIORITY __attribute__((init_priori=
ty((102))))
>>> ++// Some embedded systems get a segmentation fault if extension attr=
ibutes are
>>> ++// initialized with higher or equal priority as other attributes. T=
his gives
>>> ++// extension attributes high priority, but lower than other attribu=
tes.
>>> ++#define PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY __attribute__((i=
nit_priority((103))))
>>> + #else
>>> + #define PROTOBUF_ATTRIBUTE_INIT_PRIORITY
>>> + #endif
>>> +diff --git a/src/google/protobuf/port_undef.inc b/src/google/protobu=
f/port_undef.inc
>>> +index daef09bc4..d0c613b55 100644
>>> +--- a/src/google/protobuf/port_undef.inc
>>> ++++ b/src/google/protobuf/port_undef.inc
>>> +@@ -77,6 +77,7 @@
>>> + #undef PROTOBUF_ATTRIBUTE_WEAK
>>> + #undef PROTOBUF_ATTRIBUTE_NO_DESTROY
>>> + #undef PROTOBUF_ATTRIBUTE_INIT_PRIORITY
>>> ++#undef PROTOBUF_EXTENSION_ATTRIBUTE_INIT_PRIORITY
>>> + #undef PROTOBUF_PRAGMA_INIT_SEG
>>> +=20
>>> + // Restore macro that may have been #undef'd in port_def.inc.
>>> +--=20
>>> +2.17.1
>>> +
>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb b/m=
eta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb
>>> index 62c6ee0159..ac4e1ad84b 100644
>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb
>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.15.2.bb
>>> @@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/protocolbuffers/proto=
buf.git;branch=3Dmaster;protocol=3D
>>>             file://0001-protobuf-fix-configure-error.patch \
>>>             file://0001-Makefile.am-include-descriptor.cc-when-buildi=
ng-libp.patch \
>>>             file://0001-examples-Makefile-respect-CXX-LDFLAGS-variabl=
es-fix-.patch \
>>> +           file://0001-Lower-init-prio-for-extension-attributes.patc=
h \
>>>  "
>>>  S =3D "${WORKDIR}/git"
>>> =20
>>>
>>>
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94894): https://lists.openembedded.org/g/openembedd=
ed-devel/message/94894
> Mute This Topic: https://lists.openembedded.org/mt/88369203/3617042
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[zhe.he@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


