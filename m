Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD6CC7619A
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:56:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.40072.1680213374359832679
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=qQddg0qW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=345388676c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32UL6xAC016963
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 21:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : from : to : cc : references : in-reply-to :
 mime-version; s=PPS06212021;
 bh=L2dJb87oPF70YxmaP3dv/ujS0pEwfkk0jrPS/yIxr/w=;
 b=qQddg0qW8uUl6Na6npgbQehZmMHZsVzQ+LN5gKKW5M04xio8YfovMO/Ih8Wgn7XQgvrv
 wmWDllUQqY1vYpLVRGqFSqO6bPWo3jNN4FV4KQ3NNU9o4XujMl2qXsAmryy+Mmww/QI/
 WNcSLaKr361s4Z9Q47pekIMkPGF6kyGly2rCVjRdDcZM00dGpzcv/8fyIOiZ2PezAUFv
 tgUQT/pflZoGtyB8ooj1qHp3lUrAsF9pho1PQs2btTDdyNhA3tyt6RzwWzxV3yG6d3nM
 O5JXzBTzDBkoWsomyOJzh49IRm+tTF1upJxOcdxIQC0KI1SrtDC0+YoT9DRRNcz9R3V4 PA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php6472ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 21:56:13 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32ULuCck021392
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 21:56:12 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php6472ag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 21:56:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUHl81TTa2SVRJQr+9dUMy1eapLWVRTKHQwhtl6mnvj9fgAa3VNm2xNrmPADuPWrl9MgxXEUrd0/SuGHs04YM4vQ2iTdYmY3tupG6oeUevaf+OhEqRsnJJHUVulMGcmT8eIsmoFNQOkgHvnLmvSyrFLJyH4kRZLOCNEPREY5Mq6I3lVOh3r1cVAeLPa1J+npv3tMwgm3Vkrwqgw4E6VZEdmr3mF5AWS3V09VzdY5etafD6ma1S1VK3CtXghNvby7bzr7YoZOr2RzmEkCLMe7nvKpkPjRI5ehSOAzKrObHg4me4+IUTCB08yEd1B9qiFc7cSlyHxxkPO8aKkgjKr8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2dJb87oPF70YxmaP3dv/ujS0pEwfkk0jrPS/yIxr/w=;
 b=CjObElEBmx8ylHZBhqeNUJfGPBqq4EQ4nRyBg06bnrAelg9BpC9b1gbc/myoPB2KU9zWGxL3lQTSxQj7Y5pBdPlGmsDd3rGguvALIPEcJU3+VYaJfr8/BsU8i2TykBxaLOBkzKBCfgdK4DlEfBdAaYRe+aVNXBCJO7QhftPzGGOr7TzZv8U5Jsl5zj6aBl9a2eE1pl8V4epgq+cp4dl1bX9SnWCwN3VG0Nr1Dc9ge7GM7naPO2yVcQcZ1Ck+f9NZbDPIIwdU4swKQ9SGpDlz29zyNSwgWUR8ufI5xgcEud7pmbAqtyqk873jLyF+mNNIY+p9CuCYNbCCO2UXaTTCrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB6503.namprd11.prod.outlook.com (2603:10b6:8:8c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.28; Thu, 30 Mar 2023 21:56:10 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 21:56:10 +0000
Content-Type: multipart/alternative;
 boundary="------------eVkMntMxRzPyNIuCQ9wJ7fR5"
Message-ID: <00ad165c-cf3e-e3f5-e0c9-46c9df882757@windriver.com>
Date: Thu, 30 Mar 2023 17:56:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [oe] Security Advisory - yasm - CVE-2021-33461: Propose mv
 yasm_git.bb yasm-native_git.bb
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
To: Khem Raj <raj.khem@gmail.com>,
        "Polampalli, Archana" <Archana.Polampalli@windriver.com>,
        "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <MW4PR11MB582294CA64F65F30BD08496984229@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1srMzGA-y8+6mdV1gtYWfsJYvafhKkwvUu_HN-M=NwBfAA@mail.gmail.com>
 <MW4PR11MB5822CE51AA941EF0BE37115284259@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1sqHdrf1mK=c7CHVpKF7htPYbGztaG77FXReLMPczgoD4Q@mail.gmail.com>
 <3c7d0ac3-642d-8bc6-87b4-cd0d0b6a704b@windriver.com>
In-Reply-To: <3c7d0ac3-642d-8bc6-87b4-cd0d0b6a704b@windriver.com>
X-ClientProxiedBy: BYAPR02CA0057.namprd02.prod.outlook.com
 (2603:10b6:a03:54::34) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB6503:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f6d12a-cb7f-4c1e-da3d-08db3169928b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DalTnemihPfDc3xG5+2AgHNnETbiZvBuQ+omKlI0Chfl8C4HIkWSeljHfOS28hpuwjGWyKXz/mnK80RlYPv67fttaeOYhRZM6Y3GJGnyoIL2Ahx1mtz4mnFMocdsp+P43gUvmHOkcMh7HpV6/HdF5PJTtkyHipTP5LOLwMCcpjecNwZO5fovv7a7JUaNGdCPhO+wSs70FicyqJPBFUooDCIOGNW2mQgd03zPt05ubfG/56uk6S+vm+M0UojwQnI7AmXbR7aoAfGL8uaRLDaSDTNHbGVWfXEX/W2O9A9lHfKiWbW9YMhh7o0TCet60mtOP4eZRVp2LISccQlcHchf9fmQWmiFUVGjpKwKscSApw/hbGPoHDuHlM7NL7QLjzg74wPh2r2dZw1tBMMebTayDKT9zutNhZSidYvbvOjC9fcajonTvVqblHO8+pTNhCQ+Sn1fWbtC6Svz0nyOD0vjd8UEzAA9KuUlmHVRpMv4HYs96Y3OEmOuXwpzQI8Zv+3UQgvDbzbiKdcPvB4nkDlvYZTCxKy4WSrcUrGJR4x7oIh5mor0jwqlWTP89D9j2qj016hLD3xf1AOtNDngvlu4/A6ma++f+yHvAlr3I/zW3aeEK8mHwE5E6Tq6nkXwwpfVCIH7A3r7Ys05SbSo58P5nad1T7cKNi6Q2xoQBCik+QQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39850400004)(376002)(346002)(366004)(396003)(451199021)(66574015)(2616005)(6486002)(83380400001)(966005)(186003)(6506007)(110136005)(316002)(4001150100001)(53546011)(478600001)(26005)(6666004)(15650500001)(2906002)(33964004)(6512007)(4326008)(86362001)(38100700002)(8936002)(5660300002)(66476007)(66946007)(41300700001)(8676002)(31696002)(36756003)(66556008)(166002)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NlV2d0toWGJ2UWRCUW95Y3RSeG40cythamR5U2lCOHF2UE1sQzM5eklrOHUz?=
 =?utf-8?B?VURyV0hmdktNcU10bmhtcXRvTnhQUFVEdWxBd1pRYXpudFp4T0FXcXQ4Z0JK?=
 =?utf-8?B?aDZNMXIwRS8xaTdDNHJ1OUZBOVpYdFhiK1BLck9UaGNIcUdMVUx2SzFEVldz?=
 =?utf-8?B?OUFVYXdPYVZjU21qTjhSUVV5dGlsdDdWcWpXUVdwWTdGelJFWHVyYW1lT2xG?=
 =?utf-8?B?RmJ3ZW5xSnMzSUk1YkVRYTdGQTRpbFFvcmNYWUV4Y3pKOFNvNkZJN211WkVT?=
 =?utf-8?B?MktZY1l5ZU5PRWgvVGdUUFljTkR0TFNicEdTY0dOcDhvbDJZWU96WFFCUU41?=
 =?utf-8?B?M2lXbkVZaFduRVB3VTJhWVVGTDNsRHFUTVpLeUQ3VW1hcDlBZVVOQzBsT0Iw?=
 =?utf-8?B?WlAwV2hsM1VtS1REMnllUXBPc01tUWYycW12Wk9kT3kvalU3OXZXUVdpK2hG?=
 =?utf-8?B?cjF5eWYxUjVSbmpoeHBhQUVkS3E4Z0hGTHBXbjlEZjI2RlJLZXdyNWdWS1FG?=
 =?utf-8?B?REZUUXBnd1pXRWlvZFVhQXR3c0Vud2ZxNTN6Z3doS3pDaDVnN093NWhoS3JL?=
 =?utf-8?B?b29lWDNFckVSSVlzSlhvRFRDNWlKWHBvZ2NhOWpFNTNPRVhFMzB5Wmdmd09K?=
 =?utf-8?B?WTZ1S2dqSXNjQmwxSjZkcWJqNVVjQmhsak45ZmU2N1g1a0JmbVhuWVJEZCtR?=
 =?utf-8?B?NUxkYW51M0w1bnZhVUduVm1yWHY4T3dvY1VqYmc3MzU4MkRKSDdaY3o5SEsx?=
 =?utf-8?B?VmFidTJMMHFRcGZucWtZeFFmd2RFcTk2Z1RQdnlUNW43bTdUZndBM0g5UFh3?=
 =?utf-8?B?UGJaSHVUbUltR2FPNGNWcllyaEdRRG12NTVOUmdQOVRLRDF1MlNzRXBVSVow?=
 =?utf-8?B?NjkwNW5oNmRQSTBGT3c4K3JPUVdaL3FWd1dQcng3ekJmRnlqTFYzU2ZUWExN?=
 =?utf-8?B?VTJuREhGZ0NxWFJVN3ZudzRJRjFJdW90SUxJY20xdVhPME1CZ0NTTUZGTFl0?=
 =?utf-8?B?TDNjWG55cTZSMHRlQ1QvYkR3dVVVS0FoQlNML0JjcDV6bTJWcHdHeHpvL1lu?=
 =?utf-8?B?N0tZZG9ncDNqaWd2V0s4R2RlRUsvUW1DMHphZWhSN1VDM2w5elVRbFBIV0lJ?=
 =?utf-8?B?MWN0RFlIeDVyNys2Tm1NOTdDeTV4NUdFN3ZUK1pjL1dkOXk0bHQzVUtSZjkz?=
 =?utf-8?B?WFRISVVQRjg2SkE1TVdlUUdPbmh4VEpiNUVYWkY2RGp2a2hiYzJJU05Sa1lq?=
 =?utf-8?B?MkZ4UFV0MVFpUkhrd3pGNWFaNW5lNFo4dGRVT0NyK3lyWEg3TUdiRy84QWVI?=
 =?utf-8?B?TVlvcElodWVqNVdHNWxReUxPdS9SSnZCMnkrME9Zdm5ReitWVHpwb0dHUDFD?=
 =?utf-8?B?SGVZSkRsOVVXdUlwb3hKcVF3eHlCVC9hNDdTV2RIcTB6K0p4eGxEZ0Vwdi9l?=
 =?utf-8?B?MnpIUTlQakdWZDJHYkpoUGhZTGIySEpiQTU4NEtsUUZRdjFYcVR5aHdQS0Mr?=
 =?utf-8?B?OG9zVUlSd3dPMG51STRZMlprWFBadnR4QWNrbkZOM1FNZGt2VnBWRTlBSFZx?=
 =?utf-8?B?blJHLzJCbkc2Qy9kYUVkQzlYL1dwRmROOE90ZjNZbFFEaEJNckJNcnR3b1ZR?=
 =?utf-8?B?VTZzWmswV0RRWi9KTjJNYWIzY2ZKYnprNVFDdDNndWhJaG5vZFpCNUFkZUln?=
 =?utf-8?B?SDRaOTNXdjAySVlBSnZsTFJwNjRwcExldSs5eit5Q2hjWUV4emFEMGJEME9G?=
 =?utf-8?B?bFF0T002UXFDTjVHbDFuVDhFRHVGUmRHdExrR3RuclVWNUVTeVM5OUpxQlVZ?=
 =?utf-8?B?RXdkSm5KMXF0T0JJS1hmYVZ6N0EzVUx3UHJ2ekh2L0NqYitySk9SM2s4cVNX?=
 =?utf-8?B?MVFJRWJZcEhKSU1aRXNjbU5wNDhwMTQveVAwY3ZPMTcvTURJYmo3SEE3TjVt?=
 =?utf-8?B?enFCamRTNnFFVHRxdWt4aFZ1dk1mOElLSExMZjJnQmU4MzZFOVZlV3Z4TW8r?=
 =?utf-8?B?TVN2akM0dEV1b2dOMFNoM3ZZTENFNHVFc1BySjVsem4xMDkyNDdNa0tXd0Qr?=
 =?utf-8?B?d1ozS1RaYjhhN1VXYmpYaUhaR0orREVKREZJWWYwTDZxUmIwaFlLbk5CY3JB?=
 =?utf-8?B?U0VLbnA2bStkV0NmMm4zZm1YUVJHc0d3TnJOUGFNOExZeFh2dE15d3c5WGlJ?=
 =?utf-8?B?Vnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f6d12a-cb7f-4c1e-da3d-08db3169928b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 21:56:10.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WLbCHmKLZkLuxQPGpCnJ0JuNgE2UZIfx/L7F3UXIaDWk7zgSba4BlmsaHCjCj5ifqL6bp+XVMQq+VHW5mcs2sW1qXYFYV5c43+t/Xink1LM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6503
X-Proofpoint-ORIG-GUID: 0jJ3OHS6STVCEejI8cg-L9kOIkYFDPBA
X-Proofpoint-GUID: 0uUiVNKZULyqlyvFh6AuRqh148W217Sl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_13,2023-03-30_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303300173
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 21:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101846

--------------eVkMntMxRzPyNIuCQ9wJ7fR5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32UL6xAC016963

+ Anuj for meta-intel-qat use of yasm-native.

On 2022-10-13 10:05, Randy MacLeod wrote:
> On 2022-10-13 02:33, Khem Raj wrote:
>>
>>
>> On Wed, Oct 12, 2022 at 10:59 PM Polampalli, Archana=20
>> <Archana.Polampalli@windriver.com=20
>> <mailto:Archana.Polampalli@windriver.com>> wrote:
>>
>> =C2=A0=C2=A0=C2=A0 Hi Khem Raj,
>>
>> =C2=A0=C2=A0=C2=A0 I Have seen the link, issue is in Open.
>>
>> =C2=A0=C2=A0=C2=A0 Could you please confirm open embedded is going to =
provide the fix.
>>
>>
>> If someone in community signs up for it then yes
>
>
> and in this case, the community is us (Wind River and other folks=20
> using yasm in OE)
> so that may be you providing the fix Archana.
>
> I'll explain more offline.


The yasm CVEs have come up again. Sigh.

Upstream seems not to be interested in fixing CVEs:

https://github.com/yasm/yasm/commits/master


We only need yasm-native (1) so does anyone object to
moving this recipe to yasm-native_git.bb ? This small change
would make it clear that images/tagets/machines are not _directly_=20
vulnerable
due to the fuzzing errors people are generating which result in CVEs.


../Randy


meta-oe.git on =EE=82=A0 master [$?]
=E2=9D=AF rg yasm
meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb
18:DEPENDS =3D " yasm-native"

meta-oe/recipes-devtools/yasm/yasm_git.bb
3:HOMEPAGE =3D "http://www.tortall.net/projects/yasm/"
13:SRC_URI =3D "git://github.com/yasm/yasm.git;branch=3Dmaster;protocol=3D=
https \

meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
310:=C2=A0=C2=A0=C2=A0 yasm \

meta-oe.git on =EE=82=A0 master [$?]
=E2=9D=AF rg yasm ../meta-browser.git/
../meta-browser.git/meta-firefox/recipes-browser/firefox/firefox_68.9.0es=
r.bb
8:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 yasm=
-native nasm-native unzip-native \

../meta-browser.git/meta-firefox/recipes-browser/firefox/firefox/fixes/pr=
e-generated-old-configure.patch
8213:+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 { echo "configure: error: Building ICU requires=20
either yasm or a GNU assembler. If you do not have either of those=20
available for this platform you must use --without-intl-api" 1>&2; echo=20
"configure: error: Building ICU requires either yasm or a GNU assembler.=20
If you do not have either of those available for this platform you must=20
use --without-intl-api" 1>&5; exit 1; }


meta-oe.git on =EE=82=A0 master [$?]
=E2=9D=AF rg yasm ../meta-intel-qat.git/
../meta-intel-qat.git/recipes-extended/qat/qat17_4.20.0-00001.bb
10:DEPENDS +=3D "boost udev zlib openssl yasm-native"
182:# yasm encodes path to the input file and doesn't provide any option=20
to workaround it.



>
> ../Randy
>
>>
>>
>> =C2=A0=C2=A0=C2=A0 Regards,
>> =C2=A0=C2=A0=C2=A0 Archana
>>
>>
>> ----------------------------------------------------------------------=
--
>> =C2=A0=C2=A0=C2=A0 *From:* Khem Raj <raj.khem@gmail.com <mailto:raj.kh=
em@gmail.com>>
>> =C2=A0=C2=A0=C2=A0 *Sent:* Thursday, October 13, 2022 4:00 AM
>> =C2=A0=C2=A0=C2=A0 *To:* Polampalli, Archana <Archana.Polampalli@windr=
iver.com
>> <mailto:Archana.Polampalli@windriver.com>>
>> =C2=A0=C2=A0=C2=A0 *Cc:* openembedded-devel@lists.openembedded.org
>> <mailto:openembedded-devel@lists.openembedded.org>
>> =C2=A0=C2=A0=C2=A0 <openembedded-devel@lists.openembedded.org
>> <mailto:openembedded-devel@lists.openembedded.org>>
>> =C2=A0=C2=A0=C2=A0 *Subject:* Re: [oe] Security Advisory - yasm - CVE-=
2021-33461
>> =C2=A0=C2=A0=C2=A0 [Please note: This e-mail is from an EXTERNAL e-mai=
l address]
>>
>>
>> =C2=A0=C2=A0=C2=A0 On Wed, Oct 12, 2022 at 10:24 AM Polampalli, Archan=
a
>> =C2=A0=C2=A0=C2=A0 <archana.polampalli@windriver.com
>> <mailto:archana.polampalli@windriver.com>> wrote:
>> =C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0 > HI,
>> =C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0 > Could you please confirm is there any security fi=
x providing=20
>> for CVE-2021-33461.
>>
>> =C2=A0=C2=A0=C2=A0 seems to be open https://github.com/yasm/yasm/issue=
s/161
>> <https://github.com/yasm/yasm/issues/161>
>>
>> =C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0 > Regards,
>> =C2=A0=C2=A0=C2=A0 > Archana
>> =C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0 > =C2=A0=C2=A0=C2=A0 >
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#99156):=20
>> https://lists.openembedded.org/g/openembedded-devel/message/99156
>> Mute This Topic: https://lists.openembedded.org/mt/94286070/3616765
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:=20
>> https://lists.openembedded.org/g/openembedded-devel/unsub=20
>> [randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

--=20
# Randy MacLeod
# Wind River Linux

--------------eVkMntMxRzPyNIuCQ9wJ7fR5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32UL6xAC016963

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">+ Anuj for meta-intel-qat use of
      yasm-native.<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2022-10-13 10:05, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:3c7d0ac3-642d-8bc6-87b4-cd0d0b6=
a704b@windriver.com">On
      2022-10-13 02:33, Khem Raj wrote:
      <br>
      <blockquote type=3D"cite">
        <br>
        <br>
        On Wed, Oct 12, 2022 at 10:59 PM Polampalli, Archana
        &lt;<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Archana.=
Polampalli@windriver.com">Archana.Polampalli@windriver.com</a>
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Archana.Polampa=
lli@windriver.com">&lt;mailto:Archana.Polampalli@windriver.com&gt;</a>&gt=
; wrote:
        <br>
        <br>
        &nbsp;&nbsp;&nbsp; Hi Khem Raj,
        <br>
        <br>
        &nbsp;&nbsp;&nbsp; I Have seen the link, issue is in Open.
        <br>
        <br>
        &nbsp;&nbsp;&nbsp; Could you please confirm open embedded is goin=
g to provide
        the fix.
        <br>
        <br>
        <br>
        If someone in community signs up for it then yes
        <br>
      </blockquote>
      <br>
      <br>
      and in this case, the community is us (Wind River and other folks
      using yasm in OE)
      <br>
      so that may be you providing the fix Archana.
      <br>
      <br>
      I'll explain more offline.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>The yasm CVEs have come up again. Sigh.<br>
    </p>
    <p>Upstream seems not to be interested in fixing CVEs:<br>
    </p>
    <p><a class=3D"moz-txt-link-freetext" href=3D"https://github.com/yasm=
/yasm/commits/master">https://github.com/yasm/yasm/commits/master</a></p>
    <p><br>
    </p>
    <p>We only need yasm-native (1) so does anyone object to <br>
      moving this recipe to yasm-native_git.bb ? This small change<br>
      would make it clear that images/tagets/machines are not _directly_
      vulnerable<br>
      due to the fuzzing errors people are generating which result in
      CVEs.</p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <p>meta-oe.git on =EE=82=A0 master [$?] <br>
      =E2=9D=AF rg yasm<br>
      meta-multimedia/recipes-multimedia/aom/aom_3.4.0.bb<br>
      18:DEPENDS =3D &quot; yasm-native&quot;<br>
      <br>
      meta-oe/recipes-devtools/yasm/yasm_git.bb<br>
      3:HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://ww=
w.tortall.net/projects/yasm/">&quot;http://www.tortall.net/projects/yasm/=
&quot;</a><br>
      13:SRC_URI =3D
      &quot;git://github.com/yasm/yasm.git;branch=3Dmaster;protocol=3Dhtt=
ps \<br>
      <br>
      meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb<br>
      310:&nbsp;&nbsp;&nbsp; yasm \<br>
      <br>
      meta-oe.git on =EE=82=A0 master [$?] <br>
      =E2=9D=AF rg yasm ../meta-browser.git/<br>
../meta-browser.git/meta-firefox/recipes-browser/firefox/firefox_68.9.0es=
r.bb<br>
      8:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; yasm-native nasm-native unzip-native \<br>
      <br>
../meta-browser.git/meta-firefox/recipes-browser/firefox/firefox/fixes/pr=
e-generated-old-configure.patch<br>
      8213:+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { echo &quot;configure: error: Building ICU
      requires either yasm or a GNU assembler. If you do not have either
      of those available for this platform you must use
      --without-intl-api&quot; 1&gt;&amp;2; echo &quot;configure: error: =
Building
      ICU requires either yasm or a GNU assembler. If you do not have
      either of those available for this platform you must use
      --without-intl-api&quot; 1&gt;&amp;5; exit 1; }<br>
      <br>
      <br>
      meta-oe.git on =EE=82=A0 master [$?] <br>
      =E2=9D=AF rg yasm ../meta-intel-qat.git/<br>
      ../meta-intel-qat.git/recipes-extended/qat/qat17_4.20.0-00001.bb<br=
>
      10:DEPENDS +=3D &quot;boost udev zlib openssl yasm-native&quot;<br>
      182:# yasm encodes path to the input file and doesn't provide any
      option to workaround it.<br>
      <br>
      <br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:3c7d0ac3-642d-8bc6-87b4-cd0d0b6=
a704b@windriver.com">
      <br>
      ../Randy
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        <br>
        &nbsp;&nbsp;&nbsp; Regards,
        <br>
        &nbsp;&nbsp;&nbsp; Archana
        <br>
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;
        -----------------------------------------------------------------=
-------
        <br>
        &nbsp;&nbsp;&nbsp; *From:* Khem Raj &lt;<a class=3D"moz-txt-link-=
abbreviated" href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raj.khem@gmail.=
com">&lt;mailto:raj.khem@gmail.com&gt;</a>&gt;
        <br>
        &nbsp;&nbsp;&nbsp; *Sent:* Thursday, October 13, 2022 4:00 AM
        <br>
        &nbsp;&nbsp;&nbsp; *To:* Polampalli, Archana
        &lt;<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Archana.=
Polampalli@windriver.com">Archana.Polampalli@windriver.com</a>
        <br>
        &nbsp;&nbsp;&nbsp; <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Archana.Polampalli@windriver.com">&lt;mailto:Archana.Polampalli@windr=
iver.com&gt;</a>&gt;
        <br>
        &nbsp;&nbsp;&nbsp; *Cc:* <a class=3D"moz-txt-link-abbreviated" hr=
ef=3D"mailto:openembedded-devel@lists.openembedded.org">openembedded-deve=
l@lists.openembedded.org</a>
        <br>
        &nbsp;&nbsp;&nbsp; <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:openembedded-devel@lists.openembedded.org">&lt;mailto:openembedded-de=
vel@lists.openembedded.org&gt;</a>
        <br>
        &nbsp;&nbsp;&nbsp; &lt;<a class=3D"moz-txt-link-abbreviated" href=
=3D"mailto:openembedded-devel@lists.openembedded.org">openembedded-devel@=
lists.openembedded.org</a>
        <br>
        &nbsp;&nbsp;&nbsp; <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:openembedded-devel@lists.openembedded.org">&lt;mailto:openembedded-de=
vel@lists.openembedded.org&gt;</a>&gt;
        <br>
        &nbsp;&nbsp;&nbsp; *Subject:* Re: [oe] Security Advisory - yasm -
        CVE-2021-33461
        <br>
        &nbsp;&nbsp;&nbsp; [Please note: This e-mail is from an EXTERNAL =
e-mail
        address]
        <br>
        <br>
        <br>
        &nbsp;&nbsp;&nbsp; On Wed, Oct 12, 2022 at 10:24 AM Polampalli, A=
rchana
        <br>
        &nbsp;&nbsp;&nbsp; &lt;<a class=3D"moz-txt-link-abbreviated" href=
=3D"mailto:archana.polampalli@windriver.com">archana.polampalli@windriver=
.com</a>
        <br>
        &nbsp;&nbsp;&nbsp; <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:archana.polampalli@windriver.com">&lt;mailto:archana.polampalli@windr=
iver.com&gt;</a>&gt; wrote:
        <br>
        &nbsp;&nbsp;&nbsp; &gt;
        <br>
        &nbsp;&nbsp;&nbsp; &gt; HI,
        <br>
        &nbsp;&nbsp;&nbsp; &gt;
        <br>
        &nbsp;&nbsp;&nbsp; &gt; Could you please confirm is there any sec=
urity fix
        providing for CVE-2021-33461.
        <br>
        <br>
        &nbsp;&nbsp;&nbsp; seems to be open <a class=3D"moz-txt-link-free=
text" href=3D"https://github.com/yasm/yasm/issues/161">https://github.com=
/yasm/yasm/issues/161</a>
        <br>
        &nbsp;&nbsp;&nbsp; <a class=3D"moz-txt-link-rfc2396E" href=3D"htt=
ps://github.com/yasm/yasm/issues/161">&lt;https://github.com/yasm/yasm/is=
sues/161&gt;</a>
        <br>
        <br>
        &nbsp;&nbsp;&nbsp; &gt;
        <br>
        &nbsp;&nbsp;&nbsp; &gt;
        <br>
        &nbsp;&nbsp;&nbsp; &gt; Regards,
        <br>
        &nbsp;&nbsp;&nbsp; &gt; Archana
        <br>
        &nbsp;&nbsp;&nbsp; &gt;
        <br>
        &nbsp;&nbsp;&nbsp; &gt; &nbsp;&nbsp;&nbsp; &gt;
        <br>
        <br>
        <br>
        <br>
        -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
        <br>
        Links: You receive all messages sent to this group.
        <br>
        View/Reply Online (#99156):
        <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembe=
dded.org/g/openembedded-devel/message/99156">https://lists.openembedded.o=
rg/g/openembedded-devel/message/99156</a>
        <br>
        Mute This Topic:
        <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembe=
dded.org/mt/94286070/3616765">https://lists.openembedded.org/mt/94286070/=
3616765</a>
        <br>
        Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto=
:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owne=
r@lists.openembedded.org</a>
        <br>
        Unsubscribe:
        <a class=3D"moz-txt-link-freetext" href=3D"https://lists.openembe=
dded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/ope=
nembedded-devel/unsub</a>
        [<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:randy.macle=
od@windriver.com">randy.macleod@windriver.com</a>]
        <br>
        -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
        <br>
        <br>
      </blockquote>
      <br>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------eVkMntMxRzPyNIuCQ9wJ7fR5--

