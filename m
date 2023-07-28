Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68C7EB64DD
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 07:24:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27665.1690529057112646352
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jul 2023 00:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=GL9qC8VS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6573ee0bc5=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36S5o9UV022400
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 07:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=dLyZBwhM92h0JWfLw2UHz4O+iHVs64nsAhos2AuZdAc=; b=
	GL9qC8VSUhbjOeXr0IVWtl/ZIXKYDEplvA4DcnaMj7efLALwaGbJHq+ONJDuIOAO
	+KEFTVb1ptHeGSSPnZtpQubrK8WG8cel62FS183/WH0Yn6DVmpmaxmTY0BFiXAVh
	55uDheiKPRUVZRCmlNfGSgdgCCJxfFuTfaeW4Vb0/HVqEz5GN8xu0lL38RFpsnMb
	Br/SBAaRxwS4YLh3vhtxhv+HseGHdmoYGaD+TTcGAgmJtdSiF1CR4yqipfO3/BZx
	fOPxkKIfbVfQpVxgHWs6GpQrtzNTUxnxolzkLH9AtZUuqXRETJfh8OXZyd5ktE48
	ya0mhgse1YGsj4N/28M2YA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0636dc5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 07:24:15 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 36S7OFpt024560;
	Fri, 28 Jul 2023 07:24:15 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s0636dc5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jul 2023 07:24:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYNjFztO5lbcqWngR0qHag2fJQb1lJq0+IXSQAKBKYQqal+fu05f9r4Od8UtM7xVlTkvezIbBaLILF0OP+DzvocuEkbJCyBWHugrNBD0GQ4Pa1E0DHwVWvtDrXgf6SUqTP35dIE5QG9fx71hOPdiPfLWAl/+Cqg1iQgIbITiBOqvwSybkfV2VEeS50kOZJnh+ROo1NMa4nkWbDy5vVwfPsf4Vq4ewgnHRmhx1FfVtCgyaTA4vJdsOEJaj7Wt9Vl+MtT66xc8tRpxPXy7Gw+f/S/SlinE5q3NTJyFGZ3v8tGCupoFq1zmsDO0UNFN3GFNrHtJehsmlo/m+0+jejocng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLyZBwhM92h0JWfLw2UHz4O+iHVs64nsAhos2AuZdAc=;
 b=Bbi+IcyggR/aD86wxVDj0lNBf67u+AMrkgt3BkOlUdc1VEPE6w66OTohCjty1DFRSPl7RsuUoZJ5yRvvwXnXUnzgoTEQ2hIjFEzaxHz0TYTcZlEdq/CPWunGF8vsiu0jm42z1KVtoiJ4nQ6fcXafzqvamUKpv/ebWC1sqlE/EBkAY6FfaGtglf7NN0e2h6Eh+8Okl2HJmigQPCaakfmrESpDIIFyXVkt+XYxnPHeszxzFq1hHvSXKiCyNoVVBBueg/nM7j3u/Hdo7kFaw6NopzcHOcZR4ZvreD/xw0WZpt4fOgGA301wsLtjtI5yfFY4WJ3k2WaVG4OXMxIqHdtFyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by BN9PR11MB5516.namprd11.prod.outlook.com (2603:10b6:408:105::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 07:24:12 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::219e:cc26:ef6d:1b4a%4]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 07:24:11 +0000
Message-ID: <5a40fd1b-c1e4-e81e-75ea-f3c84e883acc@windriver.com>
Date: Fri, 28 Jul 2023 12:51:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [meta-python][kirkstone][PATCH 1/1] python3-django: fix
 CVE-2023-36053
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        "akuster808@gmail.com" <akuster808@gmail.com>
Cc: "hari.gpillai@windriver.com" <hari.gpillai@windriver.com>
References: <20230727162141.3895146-1-narpat.mali@windriver.com>
 <540beea565ee4cd2e266557236a6c03ad0fe5d9e.camel@intel.com>
Content-Language: en-US
From: "Mali, Narpat" <narpat.mali@windriver.com>
In-Reply-To: <540beea565ee4cd2e266557236a6c03ad0fe5d9e.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BY5PR17CA0061.namprd17.prod.outlook.com
 (2603:10b6:a03:167::38) To DM4PR11MB5550.namprd11.prod.outlook.com
 (2603:10b6:5:38b::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5550:EE_|BN9PR11MB5516:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e14b683-f2a2-42fe-55b0-08db8f3ba3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kd5UjHKviNIaNlNOPI5UXRNDuA/47NGmJcaTe54OIbowumpbyi2YIwkrRxIOCDgEezQO0UYBSkBWUCC2wpU8ko53mOtBw9VZP9KFltoHe+XcX9DJuRzR8E+0qaFLtrYBmxxmxxZLNbNTPxCuStvPKumCFhfUmVKVI0vx7GQ8iPJ3OWgBd7l0kRopkjEJNqPhtAwP17DpF7yVWNXEbYLTy9rEM38GJ4Q/H5WKB4FrZPPeNrd6V4stduTkNapyksyR78LgOO5ZmOyhsJOAYTs4pwHk2Q5tlJ69DyQDq0KL+o7PkUbGu0QWy3EvdwPS9daD2NEOKEdS1ae4k8ggfta0YP8itKkx7Wo94bqBvQ2BruG9wW1D28ereagYSxlMKUZASwMT6shKeAJ1gvoXvDZ+9Wm2BjHg/2YPKvVB/YlX39M5FAqJoHccf+cF/OYaKCeUMBgovNW3IUu59WEpWZSl1vQYwC35ts67cshUHFUnnu1pL2M9Kw+frwexkp7d+td0M1pJ0HZrxxP4xUp4YCNf0YD5ZQggBDstwZUlf4MJHJYm3ftf6sm9PsE3s57rGpemUbrbCM0HHBfDMUXO/BOa1+9zLVLXxkAvUs1LPsTuH3u+ntEWCRqF3VxWWoNAFqaJK6Go8OaD7U4RIJMXF89nMtb2348ngu8qc7WyrhmvXq0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39850400004)(366004)(376002)(396003)(451199021)(83380400001)(66899021)(2906002)(110136005)(2616005)(6666004)(30864003)(6486002)(55236004)(53546011)(26005)(6512007)(86362001)(966005)(478600001)(38100700002)(5660300002)(41300700001)(31686004)(66476007)(66946007)(6506007)(186003)(66556008)(31696002)(316002)(8676002)(36756003)(8936002)(4326008)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VjBDT2pldXdUcTIrR2NOL3d5emgrY3RRaDRIRWI0TmxnaUI2OVRzQ0kwUUVo?=
 =?utf-8?B?cDdzeDN1Z0o0MVQ2d0pMZDIrckxPL1ZIZEREK1Nkcm03ZXFTeFIrcHAvNnRN?=
 =?utf-8?B?Zy9kSmo5anVCKzNkR0hmb3N3aUkrVmpyc2cyT1lpakFLeDFQdWRLVTBlSUNB?=
 =?utf-8?B?ZGNwc2M2VWM5TCtkZzIvUjNXM2xtcHd4RVBYUGFzQUhrTktqU0xaQ2ZpYnBh?=
 =?utf-8?B?SFNPK3kxYmZNTy8yczVBMzFESXhtRThjbXdtOHcrNjVQTnJpc3NhN2ZGcnNH?=
 =?utf-8?B?Y3FDUC9Ta3JMTGNLWExraUZJc2hQRkZMQzBpd2dzMTRjOWUxQ0hMQ205aWwr?=
 =?utf-8?B?NmVkSjYyZUdZUjYzdUhaZUsrRHhYVWFVcmVHSWtBeGpBZEM2czVWVE1mK2hj?=
 =?utf-8?B?RG8xTTh0OWhoZ1FoUko4cnNuVnNLNlEyWVU3ckl2dTBaRy9mTVNEaGdmZnNj?=
 =?utf-8?B?RE9PRkN1cXIzazRPV1dXV3hlSHprTHA0OGVBRkUwNDd2SVRjVldYcmVFcGFJ?=
 =?utf-8?B?azVkbG5BeTFHVXMxVENRY0hja3FVV0t2REo0UkdTdVZDTWVFZVZ6amI5dzdM?=
 =?utf-8?B?YzZIY0ZVbU5Ca29xVDJyVGNuWTlOZUdFcDJNa2p0MTdFL3JrTnhLOTB1L1E1?=
 =?utf-8?B?SnhMM0ZSZnhOYUlkQzZaTTZvL1owRVFPTlhpdlRGaCt1Z3dPMEtjWXB0Tjl1?=
 =?utf-8?B?bnNBM3JKYkx5UDFyYzA5ZHNKakdPdDRhb3B3Q3kxdGpCeUlOdmRzZHlxd2h4?=
 =?utf-8?B?SjdVU1poblRXZGE5STFpdU9aYzlEeHU5VUNGY3hQODlvTkV4NVhjZFoySlJu?=
 =?utf-8?B?dlNQdDdQNUYwalFZM3h0YXQxMHRzdVY2eXA3RGtBWWc4SkROak5nSFB2QXZL?=
 =?utf-8?B?Z1J0QlNqQldENlVJSGUvTUYxQzZGUEgzYmRzL2UvSEJ3aXo5T0RPMGdRb0Q2?=
 =?utf-8?B?d0ZUalVYMW1ENTBlcW1QQ2NBbkNRd2o3SGxKK0VZRmZiVVpaYXdUbTdPYTJi?=
 =?utf-8?B?UUFlVUhRcVVFTkNrbWNobmFNVHE1eWdUOFA3ZjlHVG9pZllJM2lRSlJ2ODBD?=
 =?utf-8?B?Q0puVXI2bEVmMlhwR0VGNEN0OU56R1VUYkEyQnVqSTcyeHZXd0czZmNRcENV?=
 =?utf-8?B?Ym45Z2xmendGZ29UeEwwN3ZPQVkzQTZwM3hSTmJkQUUzbytUMExUbWRVbFFU?=
 =?utf-8?B?aTlPZXNldFNSTnRaanRoekpxVUFxZGVXTlA3NjRrTWdnb1dZOXI3MHRITzhB?=
 =?utf-8?B?c3h2ZFg1amVEeDBHWmh6UEFqamc2eTRJbEJRNEwzaVpFVVJTRThrMUN3aGpB?=
 =?utf-8?B?bEdZQjNoZGxCMThwODJNb0pzTk1RZzJ1eHhIckMvOEpTZzlkVjRSdzdEaFJX?=
 =?utf-8?B?cUhzbkVaQVNrUDd2Y3ZrZSttcXFjcVBZZ3RNMFY0WVM4Nno1cE9qdFVQdU14?=
 =?utf-8?B?elhoSkFPYklMTWRpS2VOZ0xSUThQSmVqSWQxQ1FPVXNqR3IxaDBhUGpvL3Iw?=
 =?utf-8?B?MnJxbmlnZDBZVkJIZlpsMU5hQUJwMkVrc2JZbU5zK2xPZzFLU2lMQWZnR21s?=
 =?utf-8?B?V3BncDM0WWVjdE05alVVQXZXRnpkVTBtaVFrTGFhdVdJUkRZYVZudFRQT3VZ?=
 =?utf-8?B?M3d1QkVQK1EwY2ZNNnB5SmF1NkxibmpNMTM2VWJidGdNUUZyeUxzNXdCclpR?=
 =?utf-8?B?SXVSZTlWQ214RkZvYlIrWkNVaGkyQmxLNUFNNUUxa2ZwUHRPWXFwc1p3alA3?=
 =?utf-8?B?eEhqVG13TnpacnF1RkdHU2xwbEhjdXJoWmovTXlRbUloQ254dFNaSDdwZHF3?=
 =?utf-8?B?UTkyNDY2MTZWZWhKeEh5WkEwQ0NCTkRRSUp1N3EzSjJGQUVicDdtdldrRC80?=
 =?utf-8?B?SVE3MVZHSldBQjc1K1RxSDhmbjFvNWxDK3FqRDFCd2FnU2xWZllnWGVEQjRs?=
 =?utf-8?B?aGwvTUV5WGRDZ1JqMjZVYkp0K0MvTlYxek15ZExaTmhSM0VINEhISmt6YzZq?=
 =?utf-8?B?MjFxTXo3SERtb0htZHBFR2RlV1Zua2xIUGZKanR4elBWTmlzQ0dMWmFOV1B6?=
 =?utf-8?B?S1NEby9JcThXTXgxR21xTmx4VE9ERmRkb1dESTJnVHRJQkpmenJweXVxa1lx?=
 =?utf-8?B?UWVST2hQQjdCdlAzY1lKRFBjdnFlZHROTW0rMnFkTHltbmE5eFpRU2lKTGEz?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e14b683-f2a2-42fe-55b0-08db8f3ba3bf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 07:24:11.7723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pb+LDjJfOryVrmgUDOs2ljfq9aCaF7iJrY/b8Itn3p8OhT4mPKvU3kBwhE6+mq+7zJwpZAcRahvtknNNQG1Alk/8J9PCNH36T3bWwVas+xM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5516
X-Proofpoint-GUID: fn_93Cwe4euT6HUKpBvulx0mSkIoRa0d
X-Proofpoint-ORIG-GUID: YgaAv5C1oV3ODgCvj-QgIrFWpueyt1kU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307280066
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 36S5o9UV022400
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 07:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104064

On 28-07-2023 06:42, Mittal, Anuj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Thu, 2023-07-27 at 16:21 +0000, Narpat Mali via
> lists.openembedded.org wrote:
>> From: Narpat Mali <narpat.mali@windriver.com>
>>
>> In Django 3.2 before 3.2.20, 4 before 4.1.10, and 4.2 before 4.2.3,
>> EmailValidator
>> and URLValidator are subject to a potential ReDoS (regular expression
>> denial of
>> service) attack via a very large number of domain name labels of
>> emails and URLs.
>>
>> Since, there is no ptest available for python3-django so have not
>> tested the patch
>> changes at runtime.
>>
>> References:
>> https://github.com/advisories/GHSA-jh3w-4vvf-mjgr
>> https://github.com/django/django/commit/454f2fb93437f98917283336201b40=
48293f7582
>>
>> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> ---
>>   .../python3-django/CVE-2023-36053.patch       | 261
>> ++++++++++++++++++
>>   .../python/python3-django_2.2.28.bb           |=C2=A0=C2=A0 4 +-
>>   2 files changed, 264 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-python/recipes-devtools/python/python3-
>> django/CVE-2023-36053.patch
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-django/CVE-
>> 2023-36053.patch b/meta-python/recipes-devtools/python/python3-
>> django/CVE-2023-36053.patch
>> new file mode 100644
>> index 0000000000..f0eb3d3ac2
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-django/CVE-2023-
>> 36053.patch
>> @@ -0,0 +1,261 @@
>> +From c2b8219080df1cfa07cf98f583decebe6a152fad Mon Sep 17 00:00:00
>> 2001
>> +From: Mariusz Felisiak <felisiak.mariusz@gmail.com>
>> +Date: Thu, 27 Jul 2023 14:51:48 +0000
>> +Subject: [PATCH] Fixed CVE-2023-36053
>> +
>> +-- Prevented potential ReDoS in EmailValidator and URLValidator.
>> +
>> +Thanks Seokchan Yoon for reports.
>> +
>> +CVE: CVE-2023-36053
>> +
>> +Upstream-Status: Backport
>> [https://github.com/django/django/commit/454f2fb93437f98917283336201b
>> 4048293f7582]
>> +
>> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>> +---
>> + django/core/validators.py                     |=C2=A0 7 +++++--
>> + django/forms/fields.py                        |=C2=A0 3 +++
>> + docs/ref/forms/fields.txt                     |=C2=A0 4 ++++
>> + docs/ref/validators.txt                       | 19
>> ++++++++++++++++++-
>> + docs/releases/2.2.28.txt                      |=C2=A0 9 +++++++++
>> + .../field_tests/test_emailfield.py            |=C2=A0 5 ++++-
>> + tests/forms_tests/tests/test_forms.py         | 19 +++++++++++++---
>> ---
>> + tests/validators/tests.py                     | 11 +++++++++++
>> + 8 files changed, 67 insertions(+), 10 deletions(-)
>> +
>> +diff --git a/django/core/validators.py b/django/core/validators.py
>> +index 2da0688..0d58642 100644
>> +--- a/django/core/validators.py
>> ++++ b/django/core/validators.py
>> +@@ -102,6 +102,7 @@ class URLValidator(RegexValidator):
>> +     message =3D _('Enter a valid URL.')
>> +     schemes =3D ['http', 'https', 'ftp', 'ftps']
>> +     unsafe_chars =3D frozenset('\t\r\n')
>> ++    max_length =3D 2048
>> +
>> +     def __init__(self, schemes=3DNone, **kwargs):
>> +         super().__init__(**kwargs)
>> +@@ -109,7 +110,7 @@ class URLValidator(RegexValidator):
>> +             self.schemes =3D schemes
>> +
>> +     def __call__(self, value):
>> +-        if isinstance(value, str) and
>> self.unsafe_chars.intersection(value):
>> ++        if not isinstance(value, str) or len(value) >
>> self.max_length:
> This seems incorrect ... You are reverting parts of this fix:
>
> https://github.com/django/django/commit/d9594c4ea57b6309d93879805302cec=
9ae9f23ff
>
> The original patch here:
>
> https://github.com/django/django/commit/454f2fb93437f98917283336201b404=
8293f7582
>
> isn't doing that.

Thanks Anuj for identifying this.

I am sending v2 for this so, please verify that as well.

../Narpat

>> +             raise ValidationError(self.message, code=3Dself.code)
>> +         # Check if the scheme is valid.
>> +         scheme =3D value.split('://')[0].lower()
>> +@@ -190,7 +191,9 @@ class EmailValidator:
>> +             self.domain_whitelist =3D whitelist
>> +
>> +     def __call__(self, value):
>> +-        if not value or '@' not in value:
>> ++        # The maximum length of an email is 320 characters per RFC
>> 3696
>> ++        # section 3.
>> ++        if not value or '@' not in value or len(value) > 320:
>> +             raise ValidationError(self.message, code=3Dself.code)
>> +
>> +         user_part, domain_part =3D value.rsplit('@', 1)
>> +diff --git a/django/forms/fields.py b/django/forms/fields.py
>> +index a977256..f939338 100644
>> +--- a/django/forms/fields.py
>> ++++ b/django/forms/fields.py
>> +@@ -542,6 +542,9 @@ class FileField(Field):
>> +     def __init__(self, *, max_length=3DNone, allow_empty_file=3DFals=
e,
>> **kwargs):
>> +         self.max_length =3D max_length
>> +         self.allow_empty_file =3D allow_empty_file
>> ++        # The default maximum length of an email is 320 characters
>> per RFC 3696
>> ++        # section 3.
>> ++        kwargs.setdefault("max_length", 320)
>> +         super().__init__(**kwargs)
>> +
>> +     def to_python(self, data):
>> +diff --git a/docs/ref/forms/fields.txt b/docs/ref/forms/fields.txt
>> +index 6f76d0d..3a888ef 100644
>> +--- a/docs/ref/forms/fields.txt
>> ++++ b/docs/ref/forms/fields.txt
>> +@@ -592,6 +592,10 @@ For each field, we describe the default widget
>> used if you don't specify
>> +     Has two optional arguments for validation, ``max_length`` and
>> ``min_length``.
>> +     If provided, these arguments ensure that the string is at most
>> or at least the
>> +     given length.
>> ++    ``empty_value`` which work just as they do for
>> :class:`CharField`. The
>> ++    ``max_length`` argument defaults to 320 (see
>> :rfc:`3696#section-3`).
>> ++
>> ++    The default value for ``max_length`` was changed to 320
>> characters.
>> +
>> + ``FileField``
>> + -------------
>> +diff --git a/docs/ref/validators.txt b/docs/ref/validators.txt
>> +index 75d1394..4178a1f 100644
>> +--- a/docs/ref/validators.txt
>> ++++ b/docs/ref/validators.txt
>> +@@ -125,6 +125,11 @@ to, or in lieu of custom ``field.clean()``
>> methods.
>> +     :param code: If not ``None``, overrides :attr:`code`.
>> +     :param whitelist: If not ``None``, overrides :attr:`whitelist`.
>> +
>> ++    An :class:`EmailValidator` ensures that a value looks like an
>> email, and
>> ++    raises a :exc:`~django.core.exceptions.ValidationError` with
>> ++    :attr:`message` and :attr:`code` if it doesn't. Values longer
>> than 320
>> ++    characters are always considered invalid.
>> ++
>> +     .. attribute:: message
>> +
>> +         The error message used by
>> +@@ -145,13 +150,17 @@ to, or in lieu of custom ``field.clean()``
>> methods.
>> +         ``['localhost']``. Other domains that don't contain a dot
>> won't pass
>> +         validation, so you'd need to whitelist them as necessary.
>> +
>> ++        In older versions, values longer than 320 characters could
>> be
>> ++        considered valid.
>> ++
>> + ``URLValidator``
>> + ----------------
>> +
>> + .. class:: URLValidator(schemes=3DNone, regex=3DNone, message=3DNone=
,
>> code=3DNone)
>> +
>> +     A :class:`RegexValidator` that ensures a value looks like a
>> URL, and raises
>> +-    an error code of ``'invalid'`` if it doesn't.
>> ++    an error code of ``'invalid'`` if it doesn't. Values longer
>> than
>> ++    :attr:`max_length` characters are always considered invalid.
>> +
>> +     Loopback addresses and reserved IP spaces are considered valid.
>> Literal
>> +     IPv6 addresses (:rfc:`3986#section-3.2.2`) and unicode domains
>> are both
>> +@@ -168,6 +177,14 @@ to, or in lieu of custom ``field.clean()``
>> methods.
>> +
>> +         .. _valid URI schemes:
>> https://www.iana.org/assignments/uri-schemes/uri-schemes.xhtml
>> +
>> ++     .. attribute:: max_length
>> ++
>> ++        The maximum length of values that could be considered
>> valid. Defaults
>> ++        to 2048 characters.
>> ++
>> ++        In older versions, values longer than 2048 characters could
>> be
>> ++        considered valid.
>> ++
>> + ``validate_email``
>> + ------------------
>> +
>> +diff --git a/docs/releases/2.2.28.txt b/docs/releases/2.2.28.txt
>> +index 854c6b0..ab4884b 100644
>> +--- a/docs/releases/2.2.28.txt
>> ++++ b/docs/releases/2.2.28.txt
>> +@@ -38,3 +38,12 @@ keep the old behavior, set
>> ``allow_multiple_selected`` to ``True``.
>> +
>> + For more details on using the new attribute and handling of
>> multiple files
>> + through a single field, see :ref:`uploading_multiple_files`.
>> ++
>> ++Backporting the CVE-2023-36053 fix on Django 2.2.28.
>> ++
>> ++CVE-2023-36053: Potential regular expression denial of service
>> vulnerability in ``EmailValidator``/``URLValidator``
>> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ++
>> ++``EmailValidator`` and ``URLValidator`` were subject to potential
>> regular
>> ++expression denial of service attack via a very large number of
>> domain name
>> ++labels of emails and URLs.
>> +diff --git a/tests/forms_tests/field_tests/test_emailfield.py
>> b/tests/forms_tests/field_tests/test_emailfield.py
>> +index 826524a..fe5b644 100644
>> +--- a/tests/forms_tests/field_tests/test_emailfield.py
>> ++++ b/tests/forms_tests/field_tests/test_emailfield.py
>> +@@ -8,7 +8,10 @@ class EmailFieldTest(FormFieldAssertionsMixin,
>> SimpleTestCase):
>> +
>> +     def test_emailfield_1(self):
>> +         f =3D EmailField()
>> +-        self.assertWidgetRendersTo(f, '<input type=3D"email" name=3D=
"f"
>> id=3D"id_f" required>')
>> ++        self.assertEqual(f.max_length, 320)
>> ++        self.assertWidgetRendersTo(
>> ++            f, '<input type=3D"email" name=3D"f" id=3D"id_f"
>> maxlength=3D"320" required>'
>> ++        )
>> +         with self.assertRaisesMessage(ValidationError, "'This field
>> is required.'"):
>> +             f.clean('')
>> +         with self.assertRaisesMessage(ValidationError, "'This field
>> is required.'"):
>> +diff --git a/tests/forms_tests/tests/test_forms.py
>> b/tests/forms_tests/tests/test_forms.py
>> +index d4e421d..8893f89 100644
>> +--- a/tests/forms_tests/tests/test_forms.py
>> ++++ b/tests/forms_tests/tests/test_forms.py
>> +@@ -422,11 +422,18 @@ class FormsTestCase(SimpleTestCase):
>> +             get_spam =3D BooleanField()
>> +
>> +         f =3D SignupForm(auto_id=3DFalse)
>> +-        self.assertHTMLEqual(str(f['email']), '<input type=3D"email"
>> name=3D"email" required>')
>> ++        self.assertHTMLEqual(
>> ++            str(f["email"]),
>> ++            '<input type=3D"email" name=3D"email" maxlength=3D"320"
>> required>',
>> ++        )
>> +         self.assertHTMLEqual(str(f['get_spam']), '<input
>> type=3D"checkbox" name=3D"get_spam" required>')
>> +
>> +         f =3D SignupForm({'email': 'test@example.com', 'get_spam':
>> True}, auto_id=3DFalse)
>> +-        self.assertHTMLEqual(str(f['email']), '<input type=3D"email"
>> name=3D"email" value=3D"test@example.com" required>')
>> ++        self.assertHTMLEqual(
>> ++            str(f["email"]),
>> ++            '<input type=3D"email" name=3D"email" maxlength=3D"320"
>> value=3D"test@example.com" '
>> ++            "required>",
>> ++        )
>> +         self.assertHTMLEqual(
>> +             str(f['get_spam']),
>> +             '<input checked type=3D"checkbox" name=3D"get_spam"
>> required>',
>> +@@ -2780,7 +2787,7 @@ Good luck picking a username that doesn&#39;t
>> already exist.</p>
>> + <option value=3D"true">Yes</option>
>> + <option value=3D"false">No</option>
>> + </select></li>
>> +-<li><label for=3D"id_email">Email:</label> <input type=3D"email"
>> name=3D"email" id=3D"id_email"></li>
>> ++<li><label for=3D"id_email">Email:</label> <input type=3D"email"
>> name=3D"email" id=3D"id_email" maxlength=3D"320"></li>
>> + <li class=3D"required error"><ul class=3D"errorlist"><li>This field =
is
>> required.</li></ul>
>> + <label class=3D"required" for=3D"id_age">Age:</label> <input
>> type=3D"number" name=3D"age" id=3D"id_age" required></li>"""
>> +         )
>> +@@ -2796,7 +2803,7 @@ Good luck picking a username that doesn&#39;t
>> already exist.</p>
>> + <option value=3D"true">Yes</option>
>> + <option value=3D"false">No</option>
>> + </select></p>
>> +-<p><label for=3D"id_email">Email:</label> <input type=3D"email"
>> name=3D"email" id=3D"id_email"></p>
>> ++<p><label for=3D"id_email">Email:</label> <input type=3D"email"
>> name=3D"email" id=3D"id_email" maxlength=3D"320"></p>
>> + <ul class=3D"errorlist"><li>This field is required.</li></ul>
>> + <p class=3D"required error"><label class=3D"required"
>> for=3D"id_age">Age:</label>
>> + <input type=3D"number" name=3D"age" id=3D"id_age" required></p>"""
>> +@@ -2815,7 +2822,7 @@ Good luck picking a username that doesn&#39;t
>> already exist.</p>
>> + <option value=3D"false">No</option>
>> + </select></td></tr>
>> + <tr><th><label for=3D"id_email">Email:</label></th><td>
>> +-<input type=3D"email" name=3D"email" id=3D"id_email"></td></tr>
>> ++<input type=3D"email" name=3D"email" id=3D"id_email"
>> maxlength=3D"320"></td></tr>
>> + <tr class=3D"required error"><th><label class=3D"required"
>> for=3D"id_age">Age:</label></th>
>> + <td><ul class=3D"errorlist"><li>This field is required.</li></ul>
>> + <input type=3D"number" name=3D"age" id=3D"id_age" required></td></tr=
>"""
>> +@@ -3428,7 +3435,7 @@ Good luck picking a username that doesn&#39;t
>> already exist.</p>
>> +         f =3D CommentForm(data, auto_id=3DFalse,
>> error_class=3DDivErrorList)
>> +         self.assertHTMLEqual(f.as_p(), """<p>Name: <input
>> type=3D"text" name=3D"name" maxlength=3D"50"></p>
>> + <div class=3D"errorlist"><div class=3D"error">Enter a valid email
>> address.</div></div>
>> +-<p>Email: <input type=3D"email" name=3D"email" value=3D"invalid"
>> required></p>
>> ++<p>Email: <input type=3D"email" name=3D"email" value=3D"invalid"
>> maxlength=3D"320" required></p>
>> + <div class=3D"errorlist"><div class=3D"error">This field is
>> required.</div></div>
>> + <p>Comment: <input type=3D"text" name=3D"comment" required></p>""")
>> +
>> +diff --git a/tests/validators/tests.py b/tests/validators/tests.py
>> +index 1f09fb5..8204f00 100644
>> +--- a/tests/validators/tests.py
>> ++++ b/tests/validators/tests.py
>> +@@ -58,6 +58,7 @@ TEST_DATA =3D [
>> +
>> +     (validate_email, 'example@atm.%s' % ('a' * 64),
>> ValidationError),
>> +     (validate_email, 'example@%s.atm.%s' % ('b' * 64, 'a' * 63),
>> ValidationError),
>> ++    (validate_email, "example@%scom" % (("a" * 63 + ".") * 100),
>> ValidationError),
>> +     (validate_email, None, ValidationError),
>> +     (validate_email, '', ValidationError),
>> +     (validate_email, 'abc', ValidationError),
>> +@@ -242,6 +243,16 @@ TEST_DATA =3D [
>> +     (URLValidator(EXTENDED_SCHEMES),
>> 'git+ssh://git@github.com/example/hg-git.git', None),
>> +
>> +     (URLValidator(EXTENDED_SCHEMES), 'git://-invalid.com',
>> ValidationError),
>> ++    (
>> ++        URLValidator(),
>> ++        "http://example." + ("a" * 63 + ".") * 1000 + "com",
>> ++        ValidationError,
>> ++    ),
>> ++    (
>> ++        URLValidator(),
>> ++        "http://userid:password" + "d" * 2000 +
>> "@example.aaaaaaaaaaaaa.com",
>> ++        None,
>> ++    ),
>> +     # Newlines and tabs are not accepted.
>> +     (URLValidator(), 'http://www.djangoproject.com/\n',
>> ValidationError),
>> +     (URLValidator(), 'http://[::ffff:192.9.5.5]\n',
>> ValidationError),
>> +--
>> +2.40.0
>> diff --git a/meta-python/recipes-devtools/python/python3-
>> django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-
>> django_2.2.28.bb
>> index 77a1a2a740..ec65a985da 100644
>> --- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
>> +++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
>> @@ -5,7 +5,9 @@ UPSTREAM_CHECK_REGEX =3D
>> "/${PYPI_PACKAGE}/(?P<pver>(2\.2\.\d*)+)/"
>>
>>   inherit setuptools3
>>
>> -SRC_URI +=3D "file://CVE-2023-31047.patch"
>> +SRC_URI +=3D "file://CVE-2023-31047.patch \
>> +            file://CVE-2023-36053.patch \
>> +           "
>>
>>   SRC_URI[sha256sum] =3D
>> "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104055):
>> https://lists.openembedded.org/g/openembedded-devel/message/104055
>> Mute This Topic: https://lists.openembedded.org/mt/100393892/3616702
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-devel/unsub [
>> anuj.mittal@intel.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

