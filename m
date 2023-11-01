Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A008AC4167D
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 04:46:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.424.1698813996765497051
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Oct 2023 21:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ofWYJAwh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9669bac9c4=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A13waJY016079
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 21:46:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:cc:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=Z6AN5dk4lQZTR7B1R6J
	HLvtBZBGqePk0gxLx8AkTc8o=; b=ofWYJAwh4tK+WOPY8c/5d8YXJlaK/MMlMp6
	+y/iy2baxmxF7nzex47qXYecH/6hlTWu1M32+LWmqLiylr6XHKl7YMshcND1mef0
	xlV82Lbbx7I8g1LPgYzKfEFYYK94aLVX56e6XrKCsvKQZGrEVrcPz1ZBFNh94bnS
	gn9yN2IGhWk0+cxrHKT8v/QEQzQkHA+UbMBwU0KER9Eca3estCH/wVgk2gmY5P2g
	QjE2ooZ3rDR+5NJhrSSJEzWjkVc4FU06EOSOVVUjiLTxOtRV/xvdP9QvRVMAdbyx
	WdP3vI/JUDhaOQDJBMXfjS9v0kOBkt5H7BlkTjorsn5uOkQVhkQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u11tfv415-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Oct 2023 21:46:36 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3A14kZia027462;
	Tue, 31 Oct 2023 21:46:35 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u11tfv414-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 21:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=By+9HDk0hPrkavUOVktYholdedeiVHXKccoM2Q5KVZyFz5ZXPCkG1I6XN9u7KwR81lRN0V7qSVIZTEsGQNvhPUE3KGcZWaq15tWyIMgUN6eNIe3mJUL5IclJowKXTd5oYbnT8x/dIGvtPFZnxYFSnXzqX9+4tsZNH7tS6YRsv/3SeLiX2fQllblYtUwsEANgeP2rFo0lLJS3lMiYjAi8NUju/enayp3W17pO4Q5DhfXYOs2fmej8dBaJu3un/qZJvIM2gKp9j71vBnpHFUnVQ7uoujbTCyUwGkGbkLgLrsAX6auR7RQmI1OaUxH0kkhDaxru5dSHfSM+FboH3pNTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6AN5dk4lQZTR7B1R6JHLvtBZBGqePk0gxLx8AkTc8o=;
 b=D2P3LX3gQAESvp+OAOeGGJgQamBnea1kiC+BV/xMaThZUTpg0HOVjYl6Ak3Ecz0miHbEb2lCKf4pJpQpV/gJJsyraGy9eEWB0Mt0GszRU6LLZvSHdJp2eXTAQMLg2WqSVAww71q4UyPJBr2UfiUAySSUzFL+unrXComOrcE+9ieYZkqvoGSOBkwkt6ON2xdyun2Ecw9GF/tfEeRWsgcfQZD8bAaGUz1YbwJlOfzy1psMZj8bmGQxE7gcJHcFLrKAG4Au5VVlkVZjK0oPRLxvGWFocUcngbuWEk+Vto28dShIamfmVygNM1oiiYO9ijTfovXi+Hyon7rQOcIVoSbjtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 SJ2PR11MB8514.namprd11.prod.outlook.com (2603:10b6:a03:56b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Wed, 1 Nov
 2023 04:46:31 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::4657:c76c:d491:3c23]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::4657:c76c:d491:3c23%6]) with mapi id 15.20.6907.032; Wed, 1 Nov 2023
 04:46:30 +0000
Content-Type: multipart/alternative;
 boundary="------------bha7ixeJ70KZSnQenOQusZtK"
Message-ID: <04b6c2c2-d3be-ab27-db41-6f33fd9f85b9@windriver.com>
Date: Wed, 1 Nov 2023 12:46:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][PATCH] python3-nacl: Add recipe for the latest
 release of PyNaCl
Content-Language: en-US
To: Derek Straka <derek@asterius.io>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230929213521.2140103-1-derek@asterius.io>
 <9963595d-863c-bf40-4b6e-65310524e932@windriver.com>
 <CAMKF1sqBa2zX4eLgAssL0OoWgW+zkmmShzqRig7rXy_igit9bg@mail.gmail.com>
 <CADNbA1pGVinKu+K3=-p=6091wz1=VCb3rqSMon62V6NwUjkZhA@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CADNbA1pGVinKu+K3=-p=6091wz1=VCb3rqSMon62V6NwUjkZhA@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|SJ2PR11MB8514:EE_
X-MS-Office365-Filtering-Correlation-Id: 402f1988-561d-4e18-f1f7-08dbda95843d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+eglMvtuoyR814DTqgUKlk8OhWrdKdX1isV5pOUWeR+I+NRZnpcjAC7zcd16qjB3B7+yhEXx3p2NKvT9Q+EpZ1uMZQi7LS+djwyitNhM3dHS4jVp8hYC9l+dRA7hN6raoq3SLYl+JU56gvzn+2BCyeIdew8pD5GqCff3krZ/zga8VlV0XQKKIbJ1iB8REO2DL9NY/tVprZW5N9auobAqVkUFsCakxy8evDi9cyRvXprRDHpaEh3CTeYqkT9FF/yHQyTW52vinFpUWhSwoUueFvZc6VV6IsnisNIuT2/oEcKWM2U0ozCu9bjBHoFq5jCNY5Ok5BrBlz9rHiM8CvGKM3b4PFNNVMSc+C0C0vG9tAQTYOrFo+RilGaGXqO1lGkOjcBwsYCo+obezEodTwxkN88JItxhF37Hup/p1+t6iGzbuCeImZaTZtsRCGdY5tYp0GM+bK+aTzQCGK4mdZ3NIn4VM7EV1G0NF/Tva+sLpfTkGiipSwvSa0ItE5nFr/YZi0hzs4UGKwjDiCUokx5EpqhkKkzyFxoNcQab1ce54ljknWntYm+k5MO4ieBn6tiF0MnW/wkPvQ0xkDLw/QC/EUpbRWUGvXfCyiP24LQ2eAeGdTXF3kuLt5+Nz1gvxHyADeYcr14e5dOCoWNe6HSaeg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(6029001)(396003)(39850400004)(346002)(366004)(136003)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6666004)(2616005)(26005)(53546011)(66899024)(33964004)(6506007)(6512007)(166002)(86362001)(38100700002)(36756003)(31696002)(5660300002)(66556008)(83380400001)(110136005)(66946007)(66476007)(4326008)(8676002)(8936002)(41300700001)(316002)(31686004)(6486002)(966005)(478600001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WTdNUUNsQVhiajNoMGNyUklrd0lmaUY3VUFCdUUrWVJFQnJjVFZmRjYxbmQ3?=
 =?utf-8?B?ZTM0NjhHbE5rQ3cxMWdhcnY2YmZwc3gxOEtlU3NmNzJlMGdobHE3TGtlSGhp?=
 =?utf-8?B?OTkweTBIVkhnVlN5TWZkY2tLUkpKVys5RXZjWlhXdVVlS2J5OUFTeXNaNjZU?=
 =?utf-8?B?b21GUFZuMWdUVEF1SFFnK2JFU0pCdncvYTdsN3A0YkE0eXNTWFpkYUVwZm9J?=
 =?utf-8?B?THg4NXFtbHM0dVB0U3NYTVZTbGphb1FYNjRIREl5RFdrTXh1eEtTN2hDYTVN?=
 =?utf-8?B?bUh2aDNPQjhKREpEN283anNDY3lyQjJtZndCaE5sOHVDNGVBWkE0ajNoWVhO?=
 =?utf-8?B?N1UwWmJXSk5INjJDdW43RFdrTm9JaVVQNFVuTTQrMFVxMXpYRUI4cTVPL1BT?=
 =?utf-8?B?SkQ5NUxhRDBqRjIwck83RTNNMGVrT3BUMGV4czNXT0doVUw1R1l3MXVYbEtj?=
 =?utf-8?B?Vm9SR2ZWNGt5OXRSa0ZNR3hOb0ptWHhaNkNYNXpHQ0Q4b3lWUnkwbWdualkv?=
 =?utf-8?B?WWd3RVp1S2tOY21IT2NNamVFR082ZzJxcW9PZktSMVFhRHlreWFabUJqSzhY?=
 =?utf-8?B?cmpoQXA3V0NsMDJQRHpiTDB0MlZzeW9raUhvenI1MElsUlRhckNKSmpBeGhS?=
 =?utf-8?B?QU44QXdlbzZJd2swVDNtbTc5bGU2WTdGaFE1NGhXS1BiUDlYajI0ODI0MlY2?=
 =?utf-8?B?am0xRCtEZW9jY1YxL2p0MEx4Y251VFIvY3N4MURoQnJQb2Y0a3JXTHRGaGxU?=
 =?utf-8?B?YnRhZ1pvQTF3Z0sxSlhXdnBRUmxZTWNRT1B3UEZQUWZaQ1p6SEpodlZNQ3pz?=
 =?utf-8?B?OTlkeE9SbFFtaitmcHlYNDZPSi9vVUtteDlZeXJWSWQ4Q3NCbXNZdEtUOFdI?=
 =?utf-8?B?ekZCRXRWK0prZmY2bWRhV2hPZGU4NVpUNTU3QjgweWpZU0xjRzQyWHN1WEtF?=
 =?utf-8?B?OHhSd1JRWkREY2JVL3JKK0M1NHRtVlBOdzF0Tmtia01HSUZkMW1mR0RySGY4?=
 =?utf-8?B?QnVyZVdJVGtwOHlYdjZkM2JWVFFqdzlOUWhodm1IU1JXQ3pnZHN6enpQM05r?=
 =?utf-8?B?OFJvNysxSWkrZnNOSTRwYzkwT2Q0ajMraEZRTDduTG0vMEFxYnZjaUhqeDNZ?=
 =?utf-8?B?SUhIRDUyZkxISUUyL0R0dXB4UFl5Zi95S1RjWFZFU2ZybSswWW1vaWVjV2lG?=
 =?utf-8?B?d1d3RFJyZi9MWGRERk1rTjJqcVFZemFyUFc3cWRuZG1vdmxmNTl4bER1cXlT?=
 =?utf-8?B?dkF4UWwvQjhmTWNZVkk3alJuVzhOREJYaGRqSnJGSzdyV29uNUIzSzU4WFpt?=
 =?utf-8?B?azl2WVBjdVlLb3FyTHBKVVora3BGTERsNlJKVGhxZkpSV0IySDlQaVBJbzRQ?=
 =?utf-8?B?bGFBMHFVd2N5akY2dXNqd3dXUGxPZWMyQ0ZIcG51T3ZtUTdRaVBDWDlJOGQz?=
 =?utf-8?B?OHZLVTQvRmFZM2Y5Zm92bVJhTXRUdlRFNmV0c0ZOVEZ0VlhwOUwxRUdFTWhi?=
 =?utf-8?B?UjZXa1ZmMEh5QTIyQzBIeE5ZNFdCQk1pUHFnZGdNTDNsalQ1NHRPNHd4WTlE?=
 =?utf-8?B?WFNKSzY0K3hxMkJXSTNhUHNEZTAzaE4yQVNCNTUrN0o5OHRVclBSVlpmWUVL?=
 =?utf-8?B?ZURtMVltRkZGRDJHeDNxd1V2bzJQWHhHUUxTNk5DN1B1Zk1RWHJuUitLR2JH?=
 =?utf-8?B?clNCN3VOejdFbUI1OTJHejIzSzNXb29lUWJUTVZxWnRvd1NMdkFmMW14SHox?=
 =?utf-8?B?SDYyNjBCU1pXT0crdC9oVnB6d05hRjcxSUhJbFRlV3lqdWRPbGt1dUFFUzBw?=
 =?utf-8?B?dGhkRVVudlMreWsyNnl4SUVZUWZKVjBCNkNPOUR4VUhKS0o2VVFwd3VUNEhL?=
 =?utf-8?B?TnVaZFZIV05IQkR2eXZtT2tBbVMvblJ4bGM4bmNXL0ZJV24xWWMvVTFKc0Vp?=
 =?utf-8?B?ZkZQVjFlTVp6enRrZHdkZVdoT2F5N3JWYWhFZUx2bGEvUDJieWRreG5hcVNP?=
 =?utf-8?B?TFREVmQyZE5JMkFzVlN4VDlGK3ZiUEN6cVNQYW9TaVZ0cjQxaVpNSGFtMDYy?=
 =?utf-8?B?RkZ2azFaMFY5SUNML1dJS05ZNmZ1S0xEalgrQ2NTVkF2cDVxa1J5aGhhM2tB?=
 =?utf-8?Q?YxniCQ7+5WDkrpYp3VQRnEV5i?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 402f1988-561d-4e18-f1f7-08dbda95843d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 04:46:30.7745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0CyGbULHN8GrdoRGFDrm2NUNQpDXbz16i5ZVrnqfA3rOoitdrrvWkv01NEE6VKXee8fnY+SPC+UOBGchES0+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8514
X-Proofpoint-GUID: Jj0PJbAOqr2NGG9Voa1u6yUxX0GpzpuC
X-Proofpoint-ORIG-GUID: tdURVqGMBLpoSVekOxJStTcW9E2QAMfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-01_01,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=887 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310240000 definitions=main-2311010040
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 04:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105813

--------------bha7ixeJ70KZSnQenOQusZtK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3A13waJY016079

On 11/1/23 11:56, Derek Straka wrote:
> Works for me.=C2=A0 I'd personally prefer to keep it in meta-python sin=
ce=20
> I'd rather not create a meta-virtualization=C2=A0dependency for=20
> my=C2=A0personal=C2=A0project, but I can be persuaded if it creates mor=
e work=20
> for=C2=A0others.

Yes, it will be kept in meta-python that both of the recipes are in=20
meta-python.

Regards,
Kai

>
> On Tue, Oct 31, 2023 at 10:49=E2=80=AFPM Khem Raj <raj.khem@gmail.com> =
wrote:
>
>     On Tue, Oct 31, 2023 at 7:32=E2=80=AFPM Kai <kai.kang@windriver.com=
> wrote:
>     >
>     > On 9/30/23 05:35, Derek Straka wrote:
>     > > Signed-off-by: Derek Straka <derek@asterius.io>
>     > > ---
>     > >=C2=A0 =C2=A0.../python/python3-nacl_1.5.0.bb
>     <https://urldefense.com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveY=
dw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af=
1n5o9oAW_t0d6nQw$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 25 +++++++++++++++++++
>     > >=C2=A0 =C2=A01 file changed, 25 insertions(+)
>     > >=C2=A0 =C2=A0create mode 100644
>     meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
>     <https://urldefense.com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveY=
dw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af=
1n5o9oAW_t0d6nQw$>
>     > >
>     > > diff --git
>     a/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
>     <https://urldefense.com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveY=
dw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af=
1n5o9oAW_t0d6nQw$>
>     b/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
>     <https://urldefense.com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveY=
dw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af=
1n5o9oAW_t0d6nQw$>
>     > > new file mode 100644
>     > > index 000000000..7d5292745
>     > > --- /dev/null
>     > > +++
>     b/meta-python/recipes-devtools/python/python3-nacl_1.5.0.bb
>     <https://urldefense.com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveY=
dw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af=
1n5o9oAW_t0d6nQw$>
>     > > @@ -0,0 +1,25 @@
>     > > +SUMMARY =3D "Python binding to the Networking and Cryptography
>     (NaCl) library"
>     > > +HOMEPAGE =3D "https://github.com/pyca/pynacl
>     <https://urldefense.com/v3/__https://github.com/pyca/pynacl__;!!Ajv=
eYdw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0=
Af1n5o9oAW9eTnCX1g$>"
>     > > +LICENSE =3D "Apache-2.0"
>     > > +LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3D8cc789b082b3d97e1ccc5261f8594d3f"
>     > > +
>     > > +PYPI_PACKAGE =3D "PyNaCl"
>     >
>     > It is exactly the same recipe with name python3-nacl_1.5.0.bb
>     <https://urldefense.com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveY=
dw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af=
1n5o9oAW_t0d6nQw$>
>     in the
>     > same directory. And I suggest to
>     > remove one of them and let the other one rprovides it if needed.
>
>     this seems fine to me. Please send a patch to remove old recipe and
>     add PROVIDES to new one
>
>     >
>     > Regards,
>     > Kai
>     >
>     >
>     > > +
>     > > +inherit pypi setuptools3
>     > > +
>     > > +SRC_URI[sha256sum] =3D
>     "8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08fb9220ba"
>     > > +
>     > > +DEPENDS +=3D "\
>     > > +=C2=A0 =C2=A0 libsodium \
>     > > +=C2=A0 =C2=A0 python3-cffi-native \
>     > > +=C2=A0 =C2=A0 python3-pip-native \
>     > > +"
>     > > +
>     > > +RDEPENDS:${PN}:class-target +=3D " \
>     > > +=C2=A0 =C2=A0 python3-cffi \
>     > > +=C2=A0 =C2=A0 python3-pycparser \
>     > > +"
>     > > +
>     > > +export SODIUM_INSTALL =3D "system"
>     > > +
>     > > +BBCLASSEXTEND =3D "native"
>     > > \ No newline at end of file
>     > >
>     > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     > > Links: You receive all messages sent to this group.
>     > > View/Reply Online (#105272):
>     https://lists.openembedded.org/g/openembedded-devel/message/105272
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/105272__;!!AjveYdw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKp=
ut2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af1n5o9oAW9BXbdMYw$>
>     > > Mute This Topic:
>     https://lists.openembedded.org/mt/101667089/3616933
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1016=
67089/3616933__;!!AjveYdw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_O=
rzFB0pFRF7WSBw9sofwN0Af1n5o9oAW_I2ufC_g$>
>     > > Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     > > Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rD=
Fp-P_OrzFB0pFRF7WSBw9sofwN0Af1n5o9oAW8cIkdseQ$>
>     [kai.kang@eng.windriver.com]
>     > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     > >
>     >
>     > --
>     > Kai Kang
>     > Wind River Linux
>     >
>

--=20
Kai Kang
Wind River Linux

--------------bha7ixeJ70KZSnQenOQusZtK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 3A13waJY016079

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 11/1/23 11:56, Derek Straka wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CADNbA1pGVinKu+K3=3D-p=3D6091wz=
1=3DVCb3rqSMon62V6NwUjkZhA@mail.gmail.com">
     =20
      <div dir=3D"ltr">Works for me.&nbsp; I'd personally prefer to keep =
it in
        meta-python since I'd rather not create a
        meta-virtualization&nbsp;dependency for my&nbsp;personal&nbsp;pro=
ject, but I
        can be persuaded if it creates more work for&nbsp;others.</div>
    </blockquote>
    <p>Yes, it will be kept in meta-python that both of the recipes are
      in meta-python.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CADNbA1pGVinKu+K3=3D-p=3D6091wz=
1=3DVCb3rqSMon62V6NwUjkZhA@mail.gmail.com"><br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 31, 2023 at
          10:49=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gm=
ail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On
          Tue, Oct 31, 2023 at 7:32=E2=80=AFPM Kai &lt;<a href=3D"mailto:=
kai.kang@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">kai.kang@windriver.com</a>&gt;
          wrote:<br>
          &gt;<br>
          &gt; On 9/30/23 05:35, Derek Straka wrote:<br>
          &gt; &gt; Signed-off-by: Derek Straka &lt;<a href=3D"mailto:der=
ek@asterius.io" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">derek@asterius.io</a>&gt;<br>
          &gt; &gt; ---<br>
          &gt; &gt;&nbsp; &nbsp;.../python/<a href=3D"https://urldefense.=
com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveYdw8EvQ!cM6NlZF43XGcQqc1vQI=
YJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af1n5o9oAW_t0d6nQw$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">python3-nacl_1.5.0=
.bb</a>&nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 25 ++++++++++++++++=
+++<br>
          &gt; &gt;&nbsp; &nbsp;1 file changed, 25 insertions(+)<br>
          &gt; &gt;&nbsp; &nbsp;create mode 100644
          meta-python/recipes-devtools/python/<a href=3D"https://urldefen=
se.com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveYdw8EvQ!cM6NlZF43XGcQqc1=
vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af1n5o9oAW_t0d6nQw$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">python3-nacl_1.5.=
0.bb</a><br>
          &gt; &gt;<br>
          &gt; &gt; diff --git a/meta-python/recipes-devtools/python/<a h=
ref=3D"https://urldefense.com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveY=
dw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af=
1n5o9oAW_t0d6nQw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">python3-nacl_1.5.0.bb</a>
          b/meta-python/recipes-devtools/python/<a href=3D"https://urldef=
ense.com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveYdw8EvQ!cM6NlZF43XGcQq=
c1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af1n5o9oAW_t0d6nQw$" re=
l=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">python3-nacl_=
1.5.0.bb</a><br>
          &gt; &gt; new file mode 100644<br>
          &gt; &gt; index 000000000..7d5292745<br>
          &gt; &gt; --- /dev/null<br>
          &gt; &gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"=
https://urldefense.com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveYdw8EvQ!=
cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af1n5o9oA=
W_t0d6nQw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>python3-nacl_1.5.0.bb</a><br>
          &gt; &gt; @@ -0,0 +1,25 @@<br>
          &gt; &gt; +SUMMARY =3D &quot;Python binding to the Networking a=
nd
          Cryptography (NaCl) library&quot;<br>
          &gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://urldefense.com=
/v3/__https://github.com/pyca/pynacl__;!!AjveYdw8EvQ!cM6NlZF43XGcQqc1vQIY=
JhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af1n5o9oAW9eTnCX1g$" rel=3D"n=
oreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/=
pyca/pynacl</a>&quot;<br>
          &gt; &gt; +LICENSE =3D &quot;Apache-2.0&quot;<br>
          &gt; &gt; +LIC_FILES_CHKSUM =3D
          <a class=3D"moz-txt-link-rfc2396E" href=3D"file://LICENSE;md5=3D=
8cc789b082b3d97e1ccc5261f8594d3f">&quot;file://LICENSE;md5=3D8cc789b082b3=
d97e1ccc5261f8594d3f&quot;</a><br>
          &gt; &gt; +<br>
          &gt; &gt; +PYPI_PACKAGE =3D &quot;PyNaCl&quot;<br>
          &gt;<br>
          &gt; It is exactly the same recipe with name <a href=3D"https:/=
/urldefense.com/v3/__http://python3-nacl_1.5.0.bb__;!!AjveYdw8EvQ!cM6NlZF=
43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af1n5o9oAW_t0d6n=
Qw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">python=
3-nacl_1.5.0.bb</a>
          in the<br>
          &gt; same directory. And I suggest to<br>
          &gt; remove one of them and let the other one rprovides it if
          needed.<br>
          <br>
          this seems fine to me. Please send a patch to remove old
          recipe and<br>
          add PROVIDES to new one<br>
          <br>
          &gt;<br>
          &gt; Regards,<br>
          &gt; Kai<br>
          &gt;<br>
          &gt;<br>
          &gt; &gt; +<br>
          &gt; &gt; +inherit pypi setuptools3<br>
          &gt; &gt; +<br>
          &gt; &gt; +SRC_URI[sha256sum] =3D
          &quot;8ac7448f09ab85811607bdd21ec2464495ac8b7c66d146bf545b0f08f=
b9220ba&quot;<br>
          &gt; &gt; +<br>
          &gt; &gt; +DEPENDS +=3D &quot;\<br>
          &gt; &gt; +&nbsp; &nbsp; libsodium \<br>
          &gt; &gt; +&nbsp; &nbsp; python3-cffi-native \<br>
          &gt; &gt; +&nbsp; &nbsp; python3-pip-native \<br>
          &gt; &gt; +&quot;<br>
          &gt; &gt; +<br>
          &gt; &gt; +RDEPENDS:${PN}:class-target +=3D &quot; \<br>
          &gt; &gt; +&nbsp; &nbsp; python3-cffi \<br>
          &gt; &gt; +&nbsp; &nbsp; python3-pycparser \<br>
          &gt; &gt; +&quot;<br>
          &gt; &gt; +<br>
          &gt; &gt; +export SODIUM_INSTALL =3D &quot;system&quot;<br>
          &gt; &gt; +<br>
          &gt; &gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
          &gt; &gt; \ No newline at end of file<br>
          &gt; &gt;<br>
          &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          &gt; &gt; Links: You receive all messages sent to this group.<b=
r>
          &gt; &gt; View/Reply Online (#105272): <a href=3D"https://urlde=
fense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/messag=
e/105272__;!!AjveYdw8EvQ!cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0=
pFRF7WSBw9sofwN0Af1n5o9oAW9BXbdMYw$" rel=3D"noreferrer" target=3D"_blank"=
 moz-do-not-send=3D"true">https://lists.openembedded.org/g/openembedded-d=
evel/message/105272</a><br>
          &gt; &gt; Mute This Topic: <a href=3D"https://urldefense.com/v3=
/__https://lists.openembedded.org/mt/101667089/3616933__;!!AjveYdw8EvQ!cM=
6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af1n5o9oAW_=
I2ufC_g$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">h=
ttps://lists.openembedded.org/mt/101667089/3616933</a><br>
          &gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bo=
wner@lists.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">o=
penembedded-devel+owner@lists.openembedded.org</a><br>
          &gt; &gt; Unsubscribe: <a href=3D"https://urldefense.com/v3/__h=
ttps://lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!=
cM6NlZF43XGcQqc1vQIYJhJ3jNKput2q3D1rDFp-P_OrzFB0pFRF7WSBw9sofwN0Af1n5o9oA=
W8cIkdseQ$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>https://lists.openembedded.org/g/openembedded-devel/unsub</a>
          [<a href=3D"mailto:kai.kang@eng.windriver.com" target=3D"_blank=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">kai.kang@eng.w=
indriver.com</a>]<br>
          &gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          &gt; &gt;<br>
          &gt;<br>
          &gt; --<br>
          &gt; Kai Kang<br>
          &gt; Wind River Linux<br>
          &gt;<br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------bha7ixeJ70KZSnQenOQusZtK--

