Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EAFC433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 01:31:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.46372.1640741516294035970
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 17:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=VAxmi0JS;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8997a38be3=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BT1VfR4030373
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 17:31:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Ino72uFw3hwhWJ9bxifTV9M4NF9exiUPdkP4eYaVi/I=;
 b=VAxmi0JSD+KK6cjFk8NSDWXuF9YIxEbavOssu67ggAsUMnpI0C9DqFAbQpDoatnm4b0b
 x+zpMkVs9ZAq+zjUblTbH2F1AjBkbkVtFmMGjl+Wt5M7SlY0TZ8VaKj53IlIDY1XZ0iC
 zR970FgKYPvRdms2KREsrSTr6dkkzGXOUzLA8s6qEike3wEIxC/vxLHdDZ5AKD3fck/V
 gLE3lcGsOsijPYDxTvbDQpnbJhdIUkULWJwxlDsErJyDNsv0/vfuXN0JqkGla1z2OcLZ
 Pr+l6GHHJuGkSyqPQJgtri+mPXSgVhIS1392uPDFYEwUduQQg+Ju9q8SSGMBqkabH0fN RA==
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw8r3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 17:31:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjICHmL/u+5tezuYebvi9BmJqBZ+zWcBI/QUQFNEyRekkIGw8I+lEWs1M2umithX11DHkSAymSacJBXMSt1djJbOBTfNpxEF1XW+7IV247OOX1ARMc6OEAgbChAIlAfM2Vcm+23X7E06eXaw2G+2JUs5+oN4ZHd6l/OpVnWeriBRuJfyuwylNMQXNy1pyy7JCN6vazzn81JKZ8CvzlyeljINsAOtQH3OvJRwED8iRmrP4qumZErCCiIoW7mGNZ4ImcTo9yV0WcgfA85qihUzkNf2VBgWHAj6V1bA7l/yMVfyD/I0N/uT2NpGHvWzl0k9k3uKdbv5agWjeN7CLf91JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ino72uFw3hwhWJ9bxifTV9M4NF9exiUPdkP4eYaVi/I=;
 b=fc9fSIQ4OCk4KjHP8HTqbzitF9kLCw7JYJizVpgdmJLqb7EvkHx7f4yLDxDfOcYLIiWlNnEFdqHQ1HHSlsT4bcfCk9r/t8pWids9weIfTmWhGWsXUczcw4sh7Yv5uc0M6g0f4LEvQiPYKP0s8YGKpu7568jAdnSM/e15r/owc+mK3qg9JtQURfuIgMgvYjQa68L6Pp3DCkgkmntSUbFoYWkYAeEg6JGMUoAj7c0HfwYwIerw66EQLhkRGUfx0bBl4MpzeCCheAiEbEkaRFSu11HMNiDP8tGz1tUNFruQR6es4gXrIx/CJ4Us736Gvl2mNE6z50tjD8G4RK5q5W0LHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13)
 by MWHPR1101MB2126.namprd11.prod.outlook.com (2603:10b6:301:50::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.21; Wed, 29 Dec
 2021 01:31:50 +0000
Received: from CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::194c:57f8:b0cb:19b]) by CO1PR11MB4851.namprd11.prod.outlook.com
 ([fe80::194c:57f8:b0cb:19b%9]) with mapi id 15.20.4823.023; Wed, 29 Dec 2021
 01:31:50 +0000
Subject: Re: [oe] [hardknott][PATCH 0/4] Fix CVEs of xserver-xorg
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20211228092914.26470-1-kai.kang@windriver.com>
 <fd12d906-d5a8-a42f-0462-ed4a96f56d2e@windriver.com>
From: Kai <kai.kang@windriver.com>
Message-ID: <a897607f-41c3-8bfe-2e50-1e82079903b7@windriver.com>
Date: Wed, 29 Dec 2021 09:31:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <fd12d906-d5a8-a42f-0462-ed4a96f56d2e@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: HK2PR0401CA0022.apcprd04.prod.outlook.com
 (2603:1096:202:2::32) To CO1PR11MB4851.namprd11.prod.outlook.com
 (2603:10b6:303:9b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 134fa2ba-60c5-4c5a-0020-08d9ca6afc9e
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2126:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB212613062B691FAEAB2B84FE95449@MWHPR1101MB2126.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N79y46LuoYHNWtzrki24CIh+4aDF+0W2RGC4r8QvcCV5bM7RsSU9d1+wVOQDhIVWRrP7x7ydDOOkVRqlUhmFDQH4zISeHzpW1nkYEaa/dtkWELSY5zi95Icz2lMfYn+TneBzbKoIyAZ/NXabFg5ukXNKdDE+M8zNVGmd9zAUzofiPvmwdgqpoHzv0k06YSaKXyN51iAAnO9oU0eoqIKSnIYD+KFUShZFVE9eXbcdsf24sttWb18+pv+9/xGxHE8bZfTo7u2NyhtTcLL0LyhN5YMHUZG1jq8JJ7Ombo5hz5vxZfy/JO7VQSYwRqNBpPgk7FpKXRkcDmwr1KBrQ5qjaxZq25bopsffDb+NuhQvLmAnH65/+tAsgXaY5R6j99nEfwhx2UTuI7I9e4ZIBtzqxGw/CNt3SfBk5BQ9PgiJdisPjGSTwgP+hR0UUBmmlSe0knqC8l7DGaFDLGsQiWv6ZQcthuSS3cnOD3Ik5hPXgEmdv2VWDqCBGZK5yzb2gn+sllJDhWoTr7U4NKNujGL5Oe+CoTpz+nthz2zH86490hPzLsggNVVAV/UgNxpg5QQG6OqEpga/7uC3pDLKNB47I++GMHCQu2O8U7QeIFf4pmBuqxCnni0AVlfslTH1fR2Jd8mNmr57zT0ETC1qGw6mfOxIyJSv0jY02Ov4ESVcXVteH9sO80OVBFQnD8IxpaKn6vn8ngKBtZvTdBGwQP7cKFWIX8BVijF7pj6eqlXcEatEyK96XYpPhv/3yV6chXP9CeCwujdTZGTL50VvItKWjEfW5gwVgK0m2+Rsva6/51isDGamvp28qi/XKnAFLt72Of4zFic9VZ4aqs0qzq4DKf04XCSa40vdAhycnkmcp0YYGIPL8PF7yLckm2VJtnha
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4851.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(2906002)(26005)(38350700002)(31696002)(508600001)(966005)(316002)(6486002)(6512007)(8676002)(8936002)(186003)(66946007)(66556008)(66476007)(31686004)(2616005)(52116002)(86362001)(83380400001)(4001150100001)(6666004)(5660300002)(6506007)(53546011)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Yjk2d2dpNGFISEdvblc5YWdNdG01ZWJRd000Q3p6TERFa3F2dmVsVDdvRGNp?=
 =?utf-8?B?VDBkLzQyRWF3NmpRVHA2N3RZVzEzQkNRTyt0SnBTdnBXa25tM0tTYzRZc1lN?=
 =?utf-8?B?YmZJeXY1YlZBajBrekxMMVJqUDZHTXR4YUxOaWZodkdNT3RuNlVZZGN3UE8r?=
 =?utf-8?B?eWI0ZHRocWZzamdyejA5b0gwVUxaRlVVdGV1cnRzUFJjb0VjNEFreHJXWEtq?=
 =?utf-8?B?L1V2TnQwL04rOEEwa3Zwb0NVaHArZXQraytZMVRScG5WdkZFNW1DRkJvSHlo?=
 =?utf-8?B?cmlTbWRCOFphdEtDdGhnNnpTZmUwMjcyLzIzWnZJQjZ1V0x3NG5SUjFWRlBT?=
 =?utf-8?B?ak5pS3l5QkFUZFVxMjFVa1JVQ2pPUWVQSS80Q1NWblhvU00wOCs0M1krWEVr?=
 =?utf-8?B?K1pCd3ZMVmNNdTFpUXduK01BYXpjRWlod2dndkthMmVoM2xxb3ZiQU1LcGVs?=
 =?utf-8?B?Y2toeEo3R25zeFVKRnFhUmFLTm9oNXAyblhTUWpUWm4weTQxZ21vVjNZOHNm?=
 =?utf-8?B?M3pmVXZVRU84a2E3bENBRy81Y000T0puU0o1Vng3Qll6ZTJOWVhmN2E2dlNa?=
 =?utf-8?B?SmFDT0grSXpHNms0UUZ0NkhTdHBCUFY3bExuakxiL1hSRFVSZjJBS0tCbFBF?=
 =?utf-8?B?YVRYS2Q1YnBFc0lOd3oxMmtmVXJCTlBNZVUzZm9iVFRhajBvRHpnbjZqSkll?=
 =?utf-8?B?NENBaUNZMmpUTDNzekNOYjVscS91eUJWMDF1MDFGVjU0T3JSc2plV255QUIr?=
 =?utf-8?B?UjV6WWRHNDloT2lBejFoZFk2bWl6TXZ3dTFTWlRncmpXSm1CWTNMRnlpbkly?=
 =?utf-8?B?eHRnUzZSM1ZIaXdqY2NsaUc2SUFjK1ZRc0lQL1htUGF2U0t1NWJYWXRFRWpx?=
 =?utf-8?B?c1lQdU1DeUF3UVQ0VE94RnByZktGNndPaHIvem1yWTg5Z1MwYmFMY2NkNURL?=
 =?utf-8?B?aFRoUnZXK0tabURLc0RpdS9Ca0Y2bTdVbHRZUzJxVlE1elp1Q1M1blR3OSt6?=
 =?utf-8?B?eGp0eXNDMGczcGJJS1poeDBNTVA2c2lGUVdxTUdPazMzaVQvRXdwcEU1QXMy?=
 =?utf-8?B?cTcvOGYvaHlrWTlKOURLekJnYnNEWXg0N0hZSFJYSjdUWEE0UW81OXBVNS9N?=
 =?utf-8?B?UjZwbGJRRS9JSVM2NlE0T25QSWRmSVlOY3YzRis1MVR3QWFjUjM3OW5KV1Jj?=
 =?utf-8?B?MmpxUE5PN0xZVnNNSEJyWit5S0hrR2x2UTlSbnVRd3pZMklUcnM3QlBzSGsr?=
 =?utf-8?B?SVV4ODJBUG82eWpZYUtuc0tmemkxN1MyN2RCNllZdGZUM3REWUJxSkdTQ0JY?=
 =?utf-8?B?SDdOMGxJbkpnWnZTQmZveTdaMzlCemNqMlV5RWlnVDAxclNJWHBTbjFHOFF1?=
 =?utf-8?B?S2grSlZLWkU1dURQWVgyZ0ovWEE4QzhWUE41M09MN3NjU29wTTNuRkpLeDl0?=
 =?utf-8?B?Ykh5aUZLbTIrbFpzUlZWQU8yMUZHQ2VGZnVIWXU3RW91TUlxa2NnQjM2NXh6?=
 =?utf-8?B?V0pXR1Excnh1NEJtSjZRbXliYkx0Rm9lMWpNSy9seDZMZzZFVzRUakdNZ3NI?=
 =?utf-8?B?dy9WL0tpTUN3N21TV2NveXY1akFBV1UvcmRDaTRHS3hqZ0xMeC90aGwrQSt3?=
 =?utf-8?B?d044UFc0OWh5TFRuRkpDV0J4dklhdTRyS1E5aWdBem5lUGJidndUTUJOWXNa?=
 =?utf-8?B?eFBBMk5ZaXNwRSsxWHlQNFVxTWYvamlqeE5sTTBFUXRWdlA4RkpKWkV2N2dS?=
 =?utf-8?B?SjNIQU5HMHU0WVozU1dFc3haYXVFeW4rLytJMWFGdEZGSlduTm52Tyt2SER4?=
 =?utf-8?B?S0F5WC93SWp5L0RMRFV4SW9qZmZKd2JFcFF0T2NlVVNQVzN4SlR5M3A1WldQ?=
 =?utf-8?B?amVQdklUZ2FacVlIOWpFdEZ5dlQrbHFQb1NnSDJuWEdlTHh1QTNzaXdXV2Fi?=
 =?utf-8?B?RUpJOGZrbWU3ZksxcUU3VWUwZEo5ekVXUHhOYUpDNHJlc0JQczRkZWg4YStM?=
 =?utf-8?B?NEVPcCtyb3I5WGtpSk11enZvSGN0UHVxSGhsM0ZFblgrQWxrSWtQQjFoVHZ4?=
 =?utf-8?B?V2J3R0xmVnVXVzdRTEFUSGFpUzI3bE83dEc5MEhiN2Z2WUVUeUxwN3BnR1p2?=
 =?utf-8?B?ZjVxQTNEdjhtNEJwa3hvT1RLbUtmZ0FubzBtTkJDZU9xNmVPdEZrdUwvb0s4?=
 =?utf-8?Q?gb5DOFIeXnX7eZ2WAPOkrw0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 134fa2ba-60c5-4c5a-0020-08d9ca6afc9e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4851.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 01:31:50.5536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zO9WJqzEQrse4uFuKxs6XFT/SZM8s+ilBlvK87w6CXayEcsZ42x+9rJd3hjnuIgeuyBOqXJfSVSU5HeJSnGULQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2126
X-Proofpoint-ORIG-GUID: wG0p3IBo1i5450uDvTN21PLm1BTJ_4Fv
X-Proofpoint-GUID: wG0p3IBo1i5450uDvTN21PLm1BTJ_4Fv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_13,2021-12-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=516 clxscore=1011 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112290005
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1BT1VfR4030373
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Dec 2021 01:31:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94558

On 12/29/21 6:19 AM, Randy MacLeod wrote:
> On 2021-12-28 4:29 a.m., kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>>
>> Kai Kang (4):
>> =C2=A0=C2=A0 xserver-xorg: fix CVE-2021-4008
>> =C2=A0=C2=A0 xserver-xorg: fix CVE-2021-4009
>> =C2=A0=C2=A0 xserver-xorg: fix CVE-2021-4010
>> =C2=A0=C2=A0 xserver-xorg: fix CVE-2021-4011
>>
>> =C2=A0 .../xserver-xorg/CVE-2021-4008.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 59 +++++++++++++++++++
>> =C2=A0 .../xserver-xorg/CVE-2021-4009.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 50 ++++++++++++++++
>> =C2=A0 .../xserver-xorg/CVE-2021-4010.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 39 ++++++++++++
>> =C2=A0 .../xserver-xorg/CVE-2021-4011.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 40 +++++++++++++
>> =C2=A0 .../xorg-xserver/xserver-xorg_1.20.10.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 4 ++
>> =C2=A0 5 files changed, 192 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4008.patch
>
> Oops, wrong list, please re-send to:
> openembedded-core@lists.openembedded.org

OK. Thanks.

Kai

>
> ../Randy
>
>> =C2=A0 create mode 100644=20
>> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4009.patch
>> =C2=A0 create mode 100644=20
>> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4010.patch
>> =C2=A0 create mode 100644=20
>> meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-4011.patch
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94549):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/94549
>> Mute This Topic: https://lists.openembedded.org/mt/87992955/3616765
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>

--=20
Kai Kang
Wind River Linux


