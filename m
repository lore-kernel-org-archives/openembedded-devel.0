Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0234BC77B61
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 02:09:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4271.1681178974824891038
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 19:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=IvuxMtFp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3465c4dfd5=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33B21Vh9031354
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 19:09:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=DWr6eSHQmnhLghTMhYGrOlJq2dULXnfnfD3dcmbJjR8=;
 b=IvuxMtFpgGnQAzzlhN/KLAn5BFIHb5h9QF34jd+zyyhbSwwjtysiCZd8kLHl8t0qPhRs
 p1HP0uH6opZGYzPX89gRBRDjIMfDoRcvimIlJKFfcm2SIzwUPQioGTtVzfSwnkfvrRkk
 PzsKTjbRnqOZ4+zPZo9aSIkFJfB2K78g0XDySz5pOP75mac0iuZyl3mgVAnvkDbFLzbo
 xDKZ56j7+DhUf9yUqjpuT5z1GX/GutYhxu0mXbrtv3m7m/nvAjULoMpyZkdFruq+tRFK
 aZtTIdmP8C3PwBeDtojIODqMZ+Csh/kJ7k7Z24lD/qNfHXFIaz4114SfJtCJnNuK4FoT ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pu7snj9m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 19:09:34 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33B29X6J013922
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 19:09:33 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pu7snj9m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Apr 2023 19:09:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fqGLtvzMH4+gIAKILMwFlSmySTtUyueHLE4lq+lqiY4xQsTR7OXBOl/wvvpwDa0ZZxZsA6+ec4lwJQK92+nL2HOQk2Ep5HBmZNwwsXtJEDQkOSiYAxq3IOWhVmnKdaobsRR93UJZC0+vNJYswaQtPoG9PC+0T+oGl4p7qvNd0nDRK3VhEYDAC+W1+46307JfDJYRjDEFJPQ4wzF4rKniq2ozVPP6nAKmnr1wxB2s/wJdoIO2JgiGwHI6qpFmTyMcpoRGqCLlaP6IpSrXv9Elg4BmzIkS7z+bHppuyXiOxikCu+zHr2RkOZhNVRjvAXaYGZIpVVIZjcV/lbRfFALCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWr6eSHQmnhLghTMhYGrOlJq2dULXnfnfD3dcmbJjR8=;
 b=mxEu5DPbG5kVdPOLWmzYOP7jqcGTDZaD6W4uGT9dk+5kT1kygrF0ZNMy7rMH1kquamPEMLvbemvPK3mWj6BQ4CPZEtK2YYqiwIegglV5SshWlhmsPkSYXZIVRCT/E0SBpLe3Kri+Ffjnc3zMAJ8ajErJ0BGaDP0ud7icZe/T3C4NRabbCGybc2j/tebT2kBph6GNhsfTZIcDGVJ9oo9WllfvHcZndQIOypbfetL37zjeZg47kBOTFkkvkoMRnfzjZ5QFhzGEdXGfkvsolN9BdY2loMr5gYXCi+FXTnIG3rVFobwe/HdiBxQB+6amPpFI4tlVT/6gtn4QA484+7lsoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 IA0PR11MB7332.namprd11.prod.outlook.com (2603:10b6:208:434::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.35; Tue, 11 Apr 2023 02:09:28 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b701:6f31:1d4:98c4]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b701:6f31:1d4:98c4%3]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 02:09:28 +0000
Message-ID: <1d7d9bfb-e65b-712f-29ee-fe61d6b4f80e@windriver.com>
Date: Tue, 11 Apr 2023 10:09:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-xfce][PATCH 4/4] xfce4-screenshooter: 1.9.10 -> 1.10.3
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: Kai Kang <kai.kang@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <20230407091722.5576-1-kai.kang@windriver.com>
 <20230407091722.5576-4-kai.kang@windriver.com>
 <CAMKF1sqBB86gAtOkPZ=8WBPxup8Y46TzMc_LKJ0GC3rih9_jag@mail.gmail.com>
 <1aaac718-c8a9-dca7-ddc7-5a3a83f66def@windriver.com>
 <CAMKF1sre7ZvBPRaWCkhUo2gziUAT+5z8PPyPSRQnSYMc1LVMqQ@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1sre7ZvBPRaWCkhUo2gziUAT+5z8PPyPSRQnSYMc1LVMqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::40) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|IA0PR11MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: c7704d6f-3acb-49a8-02b3-08db3a31c7e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S4Tr8MYPidFqEINHdAs/8euQBFx0ZarFKAiK0KDb9dntdd8X9fZwkhGnyxSZaPaWWGn02fgDyvhNBg7CU61KpC3vIt2u00StTYZFnKw8foNEflGpl8gNE579Mpwac2YuCK8NJbXkqzUeOAnw7a9U/zoUC65Kw2U9ltB0FlrqNofkqKzdojxua6masN0yiXWffZkG+m3zTdNeZ/8d8WGFXqIFddnbBFsaqRuDLIXkeTvYbbH3XDG1CI87RfuLOXPwL7wxkcpeQM7AhHRRhkYJx2hIN9Q/hGL/AtbklWWqUTISJTK8xgmfv77Pamc9+2udFIyW3io5d4ES3bWalEhfy+VnQGX+eknoWiXhEkJVL1BzHQbyLHo35Tgo99RkPObDzuPyBgHNjhzO3o5eI7aNBPUc/fgRgDvxOVOzsFPOuv8592fOvfIH9N1XpFtYkqDqvn1nm2eBgWURk2wHCA/p4qvVICAoWp6WBA57arW1fOIr/Gvalq1Bwqi/uUvWqCy8EyDfGi8GAMBOwXUvu6IxOYti/S+3nj/dpKFrcJZ+AQL9alCE5LeTpTADnlWMD7CNSaGaXoppmPiUumeDQvrsbTlK+NXHcHlwX7sDu7ebGiJjj9f0tg08oUpT0TlAVZKR+3RQLH4n59jgD85d8oevO4hHNrubabQE0S0CN2pyfh0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39850400004)(136003)(346002)(396003)(376002)(451199021)(5660300002)(36756003)(86362001)(83380400001)(6506007)(31696002)(186003)(6512007)(2616005)(6486002)(26005)(966005)(53546011)(38100700002)(6666004)(8936002)(41300700001)(66946007)(66476007)(316002)(8676002)(66556008)(4326008)(478600001)(6916009)(31686004)(66899021)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S0FTNnVnclNuV0xCUmROakJEU2pzZVhua2NJUkVQanZROFVEVUpjMTVRUDJL?=
 =?utf-8?B?QWhSSUhhK0w5ZkFWN2hDMHhkVzJIeFhpMUU2U2hWL3pwSHNUOTU5TU9iTFZO?=
 =?utf-8?B?SmhDL1Q3NENIUXFkUUw0UUhJaTlWWnhUNiswYnQ2L1F3S3BsZjlmNExvNUJU?=
 =?utf-8?B?Q3lPWWxXWTF0MmVTU1FxbkxKazdnOG5kYTRoOG1RS2NlK25hUER6d29NTHRT?=
 =?utf-8?B?ZW9ZeWtpWHVVVzc2TGhyVVJtTUcydjVVdzJqYzZRMFozN1ZTT1F4U2ZZditU?=
 =?utf-8?B?N1dQR3R2YUZOVDR1bVZjQ3piWkRvcENsaUF1cVpZeUxzcnNwNzNPc1FkUk1O?=
 =?utf-8?B?TWlFWFNkNVJCR2ZmaGpsNVVrc1BqYkowT1ZVbWJpUnRYMnRRdmNCU0lOcTFv?=
 =?utf-8?B?SVNFSVQrK2FPMll3RFdPc1FJMHZiTklFSmEwMjBMVUJvWUNrb2YwWFlMQ1B2?=
 =?utf-8?B?NDlXTWJYY0RMUCt2YnZsanZESityZmN1eHM0dnF2UnFLWFdEMzQ0OTZOVW92?=
 =?utf-8?B?OHo0cnQ0NXNES2pLZE53LzVCL2dxOGgvd1RsNWVEVDRFUWNZaDFJMlFOZ1FC?=
 =?utf-8?B?cllMNzVaU3pFSlZNRmcwemJENmh2MS9EV1cxaThOdlJhTkk1aVkrbjRoYmFh?=
 =?utf-8?B?S0swdHFnYUJNR2V6b1VpRW5GaTI2c2dWYXFnbTJxUjRVdDlTcXlDVVA2QTFS?=
 =?utf-8?B?MVNuN2R2WmFOMFlJamY3cHZLSk0xdlhQeVB1V3A1MlRNb3hFQ3ZiSjM3WDJw?=
 =?utf-8?B?TjZpMW4rWldMaTNZdjVrVHY5R2Z4TXd3NXlHOWFMczBDekUxV0p6L1JMYy96?=
 =?utf-8?B?V0FzYkRnc3pEeXdJbHlMQWxwQUlEZmQ2Y2xYYmJZcjd0NEFnV1VVVXFDYi82?=
 =?utf-8?B?cURFZlAzWUNqYmVabW50S2lPTkRzcUNrQWpQNG9tL202enRhOFpvRVdCb2Mx?=
 =?utf-8?B?RVhHK2oxckpHT0s1ZUREV3JzRHE3VTFPbjBvVkNVVUJUUHFLUVJSMnFhR2Fw?=
 =?utf-8?B?UVBvbFY2VktrNTYzeVNKd1B4Q0NJWVkyK09EQlQ0dzJmTUJ1VGxVVnJDMitT?=
 =?utf-8?B?Nk50QnNQU1lnKzBUU21RbUJxRkJLUkxNWEhnd25pQUpORDJvejR5RE9uTTBo?=
 =?utf-8?B?M3NnRUlHMUZiUzhaQW5yakVBSTE0S1lOMWN5b2s4NHVOSTRhNEJ0UE9UUE9l?=
 =?utf-8?B?czFkRklSWnZHS1g3Q3pmMlRBVmF1K0xkTitSbWZNelRzVG5RWUQ1dU9EcGkz?=
 =?utf-8?B?VCtoNHRUZWRaMGZucVZEZXAwbW1md2tKUHNjYzh6VDlOb0J2Q2tXZ2N4TnBh?=
 =?utf-8?B?RWl6akI2R1MvWkM1dEJLaDFkazRUVEdKWUgwVmtmbXQrQmNIR0wzU2dnUEdK?=
 =?utf-8?B?MFRBNEZ0TjdCaW9OaXJPSjAyenVkNSsvclVDNUZwUmxnS2N0VkFMSW5qeWl3?=
 =?utf-8?B?U21PU2hZb1IrUWJzb3ZjdnBTOGpMN3Z5VlMwRytYTmt4MGljS2JTNkVweU5i?=
 =?utf-8?B?VHVYRnI2YStKWWZ4WVIrcXBzZ0s1SEpLS3phOXdpT0RCbVh3NzhFcHlzR0o1?=
 =?utf-8?B?cXlhenA2cW1qSUVyRXdFZnduNWx2eW9PNzF1cmE5U1VGR0J5c0JZTllhbG4v?=
 =?utf-8?B?QXNCUTBDUkNiNkx2Q2xhcjk4ak5pVjlIaHJybHBmQUhwQU5CM3AyMkM3S0xU?=
 =?utf-8?B?UERhcXBJNDhjMkY4N05PT1V5aC9sQUZ3M21YWTFrTS8vaXlxcStncW5VWEM5?=
 =?utf-8?B?NXlRK0xaTlpZOGxZaGVXMTdmS1cwdUhsT2VKa3BsZHZueWJGTzJhV0dqcXFK?=
 =?utf-8?B?M05RUGxDZFZ2cnBWVHRaQmRZOWROU3VDUXB6aVRoNS9nRnd5RHlyVTlyZjhz?=
 =?utf-8?B?TStONU55dDdjLzhidkloYVRsek9FMWhEQk9qcTE5aDBEcU1YdXZDbm1OQXBT?=
 =?utf-8?B?dEYzZnNlSTNVRUNhaXcvYm1HMFdSYmZjK2tHWHJyUXoyaU9wd09GdHBrVGoz?=
 =?utf-8?B?VFhsVWlMRU5zdmo3TXpHVHpoVktZZVR6R2F6YnJSSml0VXB5TmMzN2RMcUll?=
 =?utf-8?B?WFNRNUxwWUVFZmtSK2k1eGQ0OWowVVhlUFJtR2VHVHBDWjdKSWY2M0dqTVk3?=
 =?utf-8?Q?P/wsHIqp2L0BlcMbS0aO4SIwf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7704d6f-3acb-49a8-02b3-08db3a31c7e3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 02:09:28.6177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/MoZojpbxRupTpXdtvs1/1ngI78uyVIXAJ/KCKP6BzO4DQRODpf5y62q/IXKavE+QzzLZhW3v0KEtl086Xo2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7332
X-Proofpoint-GUID: H1AZfz2Py7YbWNOqRxYeO1plrTeZyato
X-Proofpoint-ORIG-GUID: _B3zxS0iVGqZko0mnWZVptmlEqNn_Vn9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_18,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=962 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304110018
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 33B21Vh9031354
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Apr 2023 02:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102052

On 4/10/23 14:36, Khem Raj wrote:
> On Sun, Apr 9, 2023 at 10:36=E2=80=AFPM Kai <kai.kang@windriver.com> wr=
ote:
>> On 4/7/23 23:41, Khem Raj wrote:
>>> On Fri, Apr 7, 2023 at 2:17=E2=80=AFAM Kai Kang <kai.kang@eng.windriv=
er.com> wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> Update xfce4-screenshooter from 1.9.10 to 1.10.3
>>>>
>>>> * update HOMEPAGE that goodies.xfce.org has been decommissioning
>>>> * content of license file has been updated
>>> Its vague and does not state what has changed. Can you add some more
>>> info towards what has changed ?
>> Hi Khem,
>>
>> According to
>>
>> https://gitlab.xfce.org/apps/xfce4-screenshooter/-/issues/70
>>
>> The current license for this component is out of date. Please see
>> xfce4-taskmanager Issue #49 for additional details & discussion.
>>
>> Briefly:
>>
>> Comparing the 17 years old file with the new one, we have:
>>
>>    - some whitespace changes
>>    - a new FSF address
>>    - some extra commas
>>
>> All references to GNU Library General Public License have been replace=
d
>> with GNU Lesser General Public License
>>
> This info would have been good in the commit message.

OK. I'll add such info next time since it seems you have merged it.

Regards,
Kai

>
>> Regards,
>> Kai
>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>>    ...creenshooter_1.9.10.bb =3D> xfce4-screenshooter_1.10.3.bb} | 6=
 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>    rename meta-xfce/recipes-apps/xfce4-screenshooter/{xfce4-screensh=
ooter_1.9.10.bb =3D> xfce4-screenshooter_1.10.3.bb} (66%)
>>>>
>>>> diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screen=
shooter_1.9.10.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-scre=
enshooter_1.10.3.bb
>>>> similarity index 66%
>>>> rename from meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screens=
hooter_1.9.10.bb
>>>> rename to meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screensho=
oter_1.10.3.bb
>>>> index bb44ec782..10427dab3 100644
>>>> --- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter=
_1.9.10.bb
>>>> +++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter=
_1.10.3.bb
>>>> @@ -1,13 +1,13 @@
>>>>    SUMMARY =3D "Application to take screenshots"
>>>> -HOMEPAGE =3D "http://goodies.xfce.org/projects/applications/xfce4-s=
creenshooter"
>>>> +HOMEPAGE =3D "https://docs.xfce.org/apps/xfce4-screenshooter/start"
>>>>    SECTION =3D "x11/application"
>>>>    LICENSE =3D "GPL-2.0-only"
>>>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd791728a073bc009b4ffaf00=
b7599855"
>>>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fd=
af4a4263"
>>>>    DEPENDS =3D "xfce4-panel libxfce4util libxfce4ui gdk-pixbuf gtk+3=
 glib-2.0 libsoup-2.4 exo libxfixes xext virtual/libx11 libxml-parser-per=
l-native"
>>>>
>>>>    inherit xfce-app perlnative
>>>>
>>>> -SRC_URI[sha256sum] =3D "04b4178527f5b98cfe76ae427e95581067edf262a53=
0639d332f6db9a68292d7"
>>>> +SRC_URI[sha256sum] =3D "a454159847becfeca274a5b58c0e5817d4a260a2934=
5a37bbc3b4ff46f8f3818"
>>>>
>>>>    do_compile:prepend() {
>>>>        mkdir -p lib
>>>> --
>>>> 2.17.1
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#101981): https://lists.openembedded.org/g/openem=
bedded-devel/message/101981
>>>> Mute This Topic: https://lists.openembedded.org/mt/98121607/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [raj.khem@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>> --
>> Kai Kang
>> Wind River Linux
>>

--=20
Kai Kang
Wind River Linux


