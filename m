Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED91C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 14:01:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16117.1709741827769630467
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Jd+zXkbD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37956c3c62=william.lyu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4265UfhY003668
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Mar 2024 08:17:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=xSnQjLaD7JPpPcwpXGSZ0BgVzLsH3JKgzV/jxvq9vEA=; b=
	Jd+zXkbDPeCXl5dHy2x2p7sPY95F+bLS2O37i2qARAZZW4S8xJJInXZjg1+s8ssy
	5oJsccHfLH9erHIz2rt6ZwDt4QoXdh2s7VmrT//+ingdaS5Z5dafzn4yypEusVos
	pYqnw/kqznimu6y34HQsV7vKxvJeVqhbnMduyCYyKWh3/wk8P3dXk/Re0yuv40bQ
	HDac91kax1oZ9ZOY47UGDYwmgoH2Iewdo0c91vStss2S3dX2Gfs92OaeAd/K/uex
	rY/3FhMO2fwY0tUOTJkuHXrmk/NZa4ixqufc5s2+ZcQLGYZeDGxGfD/Wj4SlMMpr
	Ml2ktxMKxzoVO9zCEe+7MQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093v0nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:17:07 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 426GH6Pl005275;
	Wed, 6 Mar 2024 08:17:06 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm093v0nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 08:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CC7+0nUAqdAhvuBjB4cjUb61BTwLQBbbdXJROB/+xuqztVWIvqwqZLGKAxxe8kgg2oXyy3xsTZE3sEgihg/jgegzH6MXbfO3i6rW1jJD4x2moWjdU+uHJHZbj3yx4WfmE+GFYLxmsTQL01MOjPB2mrUJ+N0T64x9RfkyKRndiQG/tXjZxYbGLN36zD/qKWZU340Z5b78vWUeB3gCsr6Vp3Rk7zBNns1uhrCncvPWQ0cPTL22mAbJaadg1T+ilCkmmyLDbNSS6qS2FFVGv7SMfhtW9rbQ7BH/aV0wz+vBMWPjz3isjdgsapAB/5vN2LU1TI4cHoyPbzvHUfbe/mvtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSnQjLaD7JPpPcwpXGSZ0BgVzLsH3JKgzV/jxvq9vEA=;
 b=gc+4t4QTOMD4B/Jt+LB7/9cTZRF4r088omRA6J3fLjnfgSaqDqsEEs4s8919wmkSAgqzdUYG5s/L3oDhboA6DdYBuMyUm8io1mZtqt5G1E8HrQSbGoHUQ6xJ9JIFwOmgWTtP804RbwSv1476k9mys9PIOp34w8mV0hqQnyFUGAJ+VvldMBgLjp9a7/xdzVjtjj+OnIVePh0NKjGYySNIpu8xE9WYbg67mJ1hSQfV5+1tgrxiFaBe2DzyL5z3boHyOltim0nDCXwaBjTwwJZ2u4QVsHRLPcgUTaf9JrfxiYD7i35iPwPn2N7X0u27XT1KimmRZf5UoVZRICytcBwIew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 by CO1PR11MB4866.namprd11.prod.outlook.com (2603:10b6:303:91::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Wed, 6 Mar
 2024 16:17:03 +0000
Received: from LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379]) by LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379%4]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 16:17:03 +0000
Message-ID: <ac50295f-6e8f-4ac6-b9b7-bfd7f86451d4@windriver.com>
Date: Wed, 6 Mar 2024 11:17:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-filesystems][PATCH] e2tools: Add ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <20240222134140.2367805-1-William.Lyu@windriver.com>
 <CAMKF1spgXkbYj446g_ujSO41hrR9kUx14SF-iyw1y33-4Y7x3g@mail.gmail.com>
 <LV3PR11MB8767C8BB2545D95BF7131C3FEE5E2@LV3PR11MB8767.namprd11.prod.outlook.com>
 <CAMKF1spywovBtYyEUOd5paR-4sSpe-aXLe8tY2jzg13mvSO03g@mail.gmail.com>
 <550e0375-89cc-4ec0-b16d-5a7882fd3a08@windriver.com>
 <3d1bd8f4-1e81-478e-96ad-f2956c065a50@windriver.com>
 <CAMKF1spUjLnzLuOh=doaMRx++MVEjVoXbz7p4Z5NV=FqbdPAxA@mail.gmail.com>
 <c5f6672d-9173-46c5-b455-06cb48fed3da@windriver.com>
 <CAMKF1spQ_cNhb8trCRQVH5-GooXEyBfpMeOat2qpkjaFb+_FmQ@mail.gmail.com>
From: "Lyu, William" <william.lyu@windriver.com>
In-Reply-To: <CAMKF1spQ_cNhb8trCRQVH5-GooXEyBfpMeOat2qpkjaFb+_FmQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::10) To LV3PR11MB8767.namprd11.prod.outlook.com
 (2603:10b6:408:215::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8767:EE_|CO1PR11MB4866:EE_
X-MS-Office365-Filtering-Correlation-Id: f88c8b39-6dda-471f-da19-08dc3df8dbfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GjI0zpV8Mmr2MNE0Z+ZfLVAEQy6UrICF0GOqkuOIRGzZ+1gKMkCzfR9Gq8Fl0rz957Cs0uzgEl6sTLc0szNTmtjcXQIKrO34I4OiB8B42mSSNR8EWF511g2k+6GQPe2zJ09YhD6PdGutNsNqXb6WJzDDYXjW26h7YcMq1+WPRp4g1ZdqAerqbfM7DC6LIGg4XOzeCmP5dgG4xl/Yd9xyR/RwmEtirvUMvQWYg4DAqLPeRLWle3xor0PBhgMkJS55TijTAQdRfEwiYFs7n6r6Uwiq83jlHJzryh9/hqfnrP9b028S99eOpftoTsWJNhgig2YFPWoxhK/rQcW/eNmASo3nGZZqEoxAgWdZaXo2gQpwjqHEWdeB0LXaPFLp3OHoip+bSe342JuNFQ7Iv8YXalx/5+GRZ5IoOQCbq06OJt8d8MAUCtuD4zrjtiTLF4aefHKV8Frg2wPE06TLUqJLtxHt1Qy8Ag303nA9AjitAAODPpoerpB1FUAWTHWcZNK8UsQGh/Pm6mp4R02l4btjQFQI13yBmNor0oadosCdPRzg8mFoO3Vt3Shb3gn//MLWyKrnzIIODPL7QFJrtOMeWjmKXNblIOJNAKcw5+Hnf06mc++QAoZ/xZFtwBjnr3tU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8767.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RzlUcnZoRHg1dnk0cWhYSktwMlJzM3hoZjc3L2tWbzBPMUtVMFVHc3V5RnFy?=
 =?utf-8?B?TzRWRVluSXFqeHE0NHc0eXlrRkVtWi9xRTVOQUd6WXZ3MGcrQ2lURzloVjFN?=
 =?utf-8?B?cmRQZGpZbjV2a0V4SUg1MDJ1S3VNeDNMNm1MZHVlcGcwaVdlY085eVVkRWRv?=
 =?utf-8?B?R2Rpb0xoTXh2aVQ3N05oS1hrV3lpVlMzMms0clQ2K005Q21TUzRicHNjUFM1?=
 =?utf-8?B?OWNSWnlTVHJpZDNRNVJ0YTFaL1AyUWFWc2FvMHB5TzdBVWxVbHN5UzYzaHlB?=
 =?utf-8?B?WEFzWTZnYXFSeHorNjRJSUJ2OFIxbkZyUFhtS3JSeGJoVjVrd1BQYzBoRUNv?=
 =?utf-8?B?cUQ1VVZkNThkb3BDSEhVdGtXbGtLWGRpakJ2aGhQaXlUdXdUUk5ad3VDcjBv?=
 =?utf-8?B?MERMOTNUWDMzRFV3N2tVS0k4aVJVM3lqRCszNlRlKzJDZmRrQ3pSMWFzMHRm?=
 =?utf-8?B?VVk4RlZ2d1plWXp4T0h0a0h6RmpQbzM1Z0lLWHFWT2UrZ1lEckJxaXR6aFg1?=
 =?utf-8?B?NFBURGdHZWhQR09xZlFDMEdRSnFkU3UxY3NIbTBFNzdJL2xsbTZGcGtJTE1H?=
 =?utf-8?B?VkNEalpCcHpUQmQ4eUlrWVBYenRleE1JblFDbkdqUVp1Z2Q4MHI1TXA3QTdp?=
 =?utf-8?B?L1FwLzRyZHUrdnFUNGMrN3A0RFhJWldaUDZnWkE2cFlyMWRnbTYwMnBuZzVy?=
 =?utf-8?B?RHdFV1F5UVNXZ0k5eW1HV3FvZEhJQ2RXNWVvOTFuRmVlYWFTaC9XdGZqb2E3?=
 =?utf-8?B?OFNqOEtKZ1Y5b0ZVbDJIL0llTFRFODU1YmlHRndYeHAyNkozdGhzaktmL3BK?=
 =?utf-8?B?Lzl4Rnh5RU1kRm9HL1kwYlUzSFVHbm1FWWNuS0trNkYwWEVqaFJ6RXBLOGtk?=
 =?utf-8?B?NUROalQzMDQ4aE5zQ0VxdjU3YjAyaTNFUEV2MTQ3bGVOT2pDZS9oM1puVFRl?=
 =?utf-8?B?SmdobWswajZpLzVzaGYvaUEwZHBMd3diNEVsNmtjdW5tVUZyUXVMNVVTbWNh?=
 =?utf-8?B?emlyYk9TM2o3WVdWOU9ocUVka0NZOHM2WHZZZXNnUHJ0Qmg1MTY3NmtVVDBn?=
 =?utf-8?B?LzJhbE8zS2pYMTBkUjBlWGYrSWFlS3JKOFd1RitTUEV0OS9DWHN5UTk0UEhh?=
 =?utf-8?B?Z2hEMGpFZnJYTzNZRGNTZnk2QU12eTZkRGRHREZCWkYrcTc1MUdNbERMM0V1?=
 =?utf-8?B?UVRlUFVCZEg4Y1pMQlNrbSs0cnlhZytLZmxrQm9xdDViZTM3MGE4dkxmQmVl?=
 =?utf-8?B?WnRQWHVrbjZlOXFEL3hQVXVDdkhoUWVYWFpGekw1bzN4bHo3T3N2UVpUMkhS?=
 =?utf-8?B?ZUttNzQ2TmxrNlJBNXRVeXhKYjAzNFg2dTNCQWtJUzVjOER6Uk13SmhOaGxW?=
 =?utf-8?B?cDF2WDd1RTA1Y0dZZ3BuVUNudzdwYmZpdW9PaS8yTVhNRDJUUFJic0V0WDZE?=
 =?utf-8?B?WmxpUU9qRDlXOFplZVl2N044cEZTU0dSSnBBWEptbXFMZU80NDdqNjdyV0tr?=
 =?utf-8?B?NVdBN0JyUXVlSGd4S0hiaTB2T1F6UThuWndyMnVSZHpmdGJrcHAvdjdEL2p4?=
 =?utf-8?B?bk5mZG1PSWJ1RXpOMTcrU3FJSWhxZ1RnSlROcjU3bTV3Y1BFYURoWUc0Z0pm?=
 =?utf-8?B?NnFTZDFyeElYNDQ1b2g4K1ZicStCRGJmSVg3TEkvRWVKYW1renBmMS83bkQ3?=
 =?utf-8?B?Ym0zZ2tURjFRUEJWZG1BOTRjVW9mYzU1L3RVcUtxYzVtNUkxR0g4aWc2SnZO?=
 =?utf-8?B?ZkcrZkJZYlpVeEhTa3RHaHBRSnlUQ3l1U2FwaGEySG1kTDRqVmg2dDhsUnVQ?=
 =?utf-8?B?cTN1VUhIMW84ZGF0MVNGa1FyaUsxQm9jOUJEQVdONWRicUVJU0U1Z2FpcGhF?=
 =?utf-8?B?WVJWMXhmWmxXM3BkQ1Z2TXZYRTEybmZDaEFvUXN6bVFWRnFWZ3dzdG1JYjh1?=
 =?utf-8?B?Y2N3MVgxalpFY1VNV0ppTHBYMmoxSWJKQzlXbDk3cGdVQXJsL2N3eEQ5RkVp?=
 =?utf-8?B?b0l5RW4zeGpjM1ZqVlJHR25SOEU1eVhpOElaUGxlNlVZNXN4VWcySCtkcmVM?=
 =?utf-8?B?ZDIzOGJUUHp0MVI0UklSUUlSTjVxeTBuL1JuWVBkVVhXR1dCNDRoUnVxTUNu?=
 =?utf-8?B?RmlZZ29yU1RZNjhXZWpraytXbDVuaGI1a0x4RzNtckJoN1ZEMWFSMUl5N3ho?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88c8b39-6dda-471f-da19-08dc3df8dbfd
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 16:17:03.3247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3k3Zv+2XJt92ipuW1qFIxo/ofncX+TjA1xAXZMBm/p156kgJRjNJkNso5sA2C55kfwSir7n9j9OmozImLdcuyOtWrBCLMwDoxx8cYkTezpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4866
X-Proofpoint-GUID: 8Fqn8yjP3asNzRhff2ZAk1HSofpcDNis
X-Proofpoint-ORIG-GUID: YdQszzFyKKBTI6PZVuOSr6i-7PPjQ30R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_10,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060131
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4265UfhY003668
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Mar 2024 14:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109255

On 3/6/2024 11:02 AM, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>=20
>=20
> On Wed, Mar 6, 2024 at 8:00=E2=80=AFAM Lyu, William <William.Lyu@windrive=
r.com=20
> <mailto:William.Lyu@windriver.com>> wrote:
>=20
>     I see that you pushed a commit that adds command removing unnecessary
>     files and host paths in the e2tools recipe.
>=20
>     https://github.com/openembedded/meta-openembedded/commit/92b6825a870f=
de291b1244193dba8d7c1051c53f <https://urldefense.com/v3/__https://github.co=
m/openembedded/meta-openembedded/commit/92b6825a870fde291b1244193dba8d7c105=
1c53f__;!!AjveYdw8EvQ!e6G0IIki5XY3woNYM7gDk_0dr6qbokIInABiyDrDNNz86gFHeFJIR=
d-HfusuUIhMDeXgPrvG1hJ3yLbbeO1Q0w$>
>=20
>     I have tested this latest e2tools recipe locally using the latest pok=
y.
>     I built an image using "bitbake core-image-minimal" with e2tools and
>     its
>     ptest package. The build was successful (still no QA errors) and the
>     ptest for e2tools ran without any issue.
>=20
>     Are you still seeing the [file-rdeps] QA issues on the Yocto
>     Autobuilder?
>=20
> No
> This patch fixes the issue this is what I have been asking for all along

Thanks for fixing this issue!

This fix still comes to me as a surprise. There are still existing files=20
with "#!/bin/sh" as first line just like the "update.sample" before:

$ head run-ptest
#!/bin/sh
...

Would you mind directing me to where the [file-rdeps] checker is=20
defined? Is the autobuilder (AB) using "poky" or "yoe"? I would like to=20
do some investigation, because the [file-rdeps] QA checker was being=20
misleading. It was seemingly complaining about something - missing=20
/usr/bin/sh - other than the actual issue - something related to ".git".=20
I would like to see how [file-rdeps] checker code logic reached such=20
error message, and I would like to see how to potentially improve the=20
error reporting from this checker.

William

>=20
>=20
>     Thank you for removing the unnecessary files and improving the e2tool=
s
>     recipe.
>=20
>     On 3/4/2024 1:34 AM, Khem Raj wrote:
>      > CAUTION: This email comes from a non Wind River email account!
>      > Do not click links or open attachments unless you recognize the
>     sender and know the content is safe.
>      >
>      > its happening quite consistently now on all kinds of AB workers, s=
ee
>      > recent 4-5 failures on
>      >
>      > https://autobuilder.yoctoproject.org/typhoon/#/builders/88
>     <https://urldefense.com/v3/__https://autobuilder.yoctoproject.org/typ=
hoon/*/builders/88__;Iw!!AjveYdw8EvQ!e6G0IIki5XY3woNYM7gDk_0dr6qbokIInABiyD=
rDNNz86gFHeFJIRd-HfusuUIhMDeXgPrvG1hJ3yLbGuduvbQ$>
>      >
>      > On Sun, Mar 3, 2024 at 10:01=E2=80=AFPM Lyu, William
>     <William.Lyu@windriver.com <mailto:William.Lyu@windriver.com>> wrote:
>      >>
>      >> On 3/4/2024 12:41 AM, Lyu, William wrote:
>      >>> On 3/1/2024 4:52 PM, Khem Raj wrote:
>      >>>> CAUTION: This email comes from a non Wind River email account!
>      >>>> Do not click links or open attachments unless you recognize
>     the sender
>      >>>> and know the content is safe.
>      >>>>
>      >>>> On Fri, Mar 1, 2024 at 12:20=E2=80=AFPM Lyu, William
>      >>>> <William.Lyu@windriver.com <mailto:William.Lyu@windriver.com>>
>     wrote:
>      >>>>>
>      >>>>>> I am running into this error on some builders on AB
>      >>>>>>
>      >>>>>> stdio: ERROR: Task
>      >>>>>>
>     (/home/pokybuild/yocto-worker/meta-oe/build/meta/recipes-support/libe=
xif/libexif_0.6.24.bb <https://urldefense.com/v3/__http://libexif_0.6.24.bb=
__;!!AjveYdw8EvQ!e6G0IIki5XY3woNYM7gDk_0dr6qbokIInABiyDrDNNz86gFHeFJIRd-Hfu=
suUIhMDeXgPrvG1hJ3yLYrlPjd8Q$>:do_package_qa)
>      >>>>>> failed with exit code '1'
>      >>>>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: QA Issue:
>      >>>>>> /usr/lib/e2tools/ptest/git/.git/hooks/update.sample contained=
 in
>      >>>>>> package e2tools-ptest requires /usr/bin/sh, but no providers
>     found in
>      >>>>>> RDEPENDS:e2tools-ptest? [file-rdeps]
>      >>>>>
>      >>>>> File "update.sample" is from ".git" directory. I do not
>     actually need
>      >>>>> this
>      >>>>> file or anything from ".git" directory. I only need the
>     source tree
>      >>>>> for ptest
>      >>>>> to run.
>      >>>>>
>      >>>>> However, I am a bit confused about this QA issue because:
>      >>>>> -=C2=A0 =C2=A0I do not see any file that has "#!/usr/bin/sh". =
Even
>      >>>>> "update.sample" has
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0"#!/bin/sh" as the first line. There=
 are files in the
>     source
>      >>>>> tree (not
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0under ".git" directory) that have "#=
!/bin/sh" as the
>     first line.
>      >>>>> -=C2=A0 =C2=A0"/bin/sh" is referring to the default POSIX shel=
l, and
>     the "bash"
>      >>>>> in the
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0RDEPENDS:e2tools-ptest should alread=
y fulfill this runtime
>      >>>>> dependency,
>      >>>>> -=C2=A0 =C2=A0I am not yet able to reproduce this issue using =
poky. I
>     assume
>      >>>>> this is
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0because the QA Issue checker "file-r=
deps" in poky do
>     not check
>      >>>>> "sh" by
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0default (excerpt taken from
>     "meta/classes-global/insane.bbclass"):
>      >>>>>
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0if "file-rdeps" not in skip:
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ignored_file_rdeps =3D=
 set(['/bin/sh', '/usr/bin/env',
>      >>>>> 'rtld(GNU_HASH)'])
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.utils.contains('=
DISTRO_FEATURES', 'usrmerge',
>     True,
>      >>>>> False, d):
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ignored_=
file_rdeps |=3D set(['/usr/bin/sh'])
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.inherits_cl=
ass('nativesdk', d):
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ignored_=
file_rdeps |=3D set(['/bin/bash',
>     '/usr/bin/perl',
>      >>>>> 'perl'])
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.ut=
ils.contains('DISTRO_FEATURES', 'usrmerge',
>      >>>>> True, False, d):
>      >>>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ignored_file_rdeps |=3D set(['/usr/bin/bash'])
>      >>>>>
>      >>>>> William
>      >>>>
>      >>>> what distro features do you have enabled ? perhaps try it with =
and
>      >>>> without usermerge in DISTRO_FEATURES
>=20
>     For the sake of documentation and preventing confusion for anyone
>     stumbling upon this email thread, I would like to confirm if
>     "usermerge"
>     here is a typo. Is it correct that you meant "usrmerge"?
>=20
>     William
>=20
>      >>>> and rebuild this package after doing cleansstate to ensure its
>     being
>      >>>> rebuilt in both cases.
>      >>>
>      >>> I have not been able to reproduce this "QA Issue" error yet. Is =
it
>      >>> possible that the [file-rdeps] checker on the autobuilder (AB)
>     where you
>      >>> saw this issue is defined differently than the default poky? The
>      >>> following are the details regarding my previous and new builds.
>      >>>
>      >>> For my previous builds, there are no specified DISTRO_FEATURES. =
In
>      >>> conf/local.conf, I only added the following line. The build
>     command I
>      >>> used was "bitbake core-image-minimal".
>      >>>
>      >>> IMAGE_INSTALL:append =3D " libexif e2tools e2tools-ptest"
>      >>>
>      >>> I tried a new build with the following line added to
>     conf/local.conf.
>      >>>
>      >>> DISTRO_FEATURES:append =3D " usermerge"
>      >>>
>      >>> I also did "bitbake -c cleansstate e2tools" and "bitbake -c
>     cleansstate
>      >>> core-image-minimal" before each build.
>      >>>
>      >>> William
>      >>
>      >> Just in case the [file-rdeps] checker is somehow not working, I
>     removed
>      >> "bash" from "RDEPENDS:${PN}-ptest". I indeed get the following er=
ror
>      >> message as expected when building "bitbake core-image-minimal":
>      >>
>      >> ERROR: QA Issue: /usr/lib/e2tools/ptest/build/config.status
>     contained in
>      >> package e2tools-ptest requires /bin/bash, but no providers found =
in
>      >> RDEPENDS:e2tools-ptest? [file-rdeps]
>      >>
>      >> William
>      >>
>      >>>
>      >>>>
>      >>>>>
>      >>>>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: Fatal QA
>     errors were
>      >>>>>> found, failing task.
>      >>>>>> stdio: ERROR: Logfile of failure stored in:
>      >>>>>>
>     /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-po=
ky-linux/e2tools/0.1.0+git/temp/log.do_package_qa.3114961
>      >>>>>>
>      >>>>>> On Thu, Feb 22, 2024 at 5:56=E2=80=AFAM Lyu, William via
>      >>>>>> lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYd=
w8EvQ!e6G0IIki5XY3woNYM7gDk_0dr6qbokIInABiyDrDNNz86gFHeFJIRd-HfusuUIhMDeXgP=
rvG1hJ3yLZU9ZtVCw$>
>      >>>>>> <william.lyu=3Dwindriver.com@lists.openembedded.org
>     <mailto:windriver.com@lists.openembedded.org>> wrote:
>      >>>>>>>
>      >>>>>>> From: William Lyu <William.Lyu@windriver.com
>     <mailto:William.Lyu@windriver.com>>
>      >>>>>>>
>      >>>>>>> Signed-off-by: William Lyu <William.Lyu@windriver.com
>     <mailto:William.Lyu@windriver.com>>
>      >>>>>>> ---
>      >>>>>>>=C2=A0 =C2=A0 .../recipes-utils/e2tools/e2tools_git.bb
>     <https://urldefense.com/v3/__http://e2tools_git.bb__;!!AjveYdw8EvQ!e6=
G0IIki5XY3woNYM7gDk_0dr6qbokIInABiyDrDNNz86gFHeFJIRd-HfusuUIhMDeXgPrvG1hJ3y=
Laa6TMqBQ$> | 51
>      >>>>>>> ++++++++++++++++++-
>      >>>>>>>=C2=A0 =C2=A0 .../recipes-utils/e2tools/files/run-ptest=C2=A0=
 =C2=A0 =C2=A0|=C2=A0 5 ++
>      >>>>>>>=C2=A0 =C2=A0 2 files changed, 54 insertions(+), 2 deletions(=
-)
>      >>>>>>>=C2=A0 =C2=A0 create mode 100644
>      >>>>>>> meta-filesystems/recipes-utils/e2tools/files/run-ptest
>      >>>>>>>
>      >>>>>>> diff --git
>     a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>     <https://urldefense.com/v3/__http://e2tools_git.bb__;!!AjveYdw8EvQ!e6=
G0IIki5XY3woNYM7gDk_0dr6qbokIInABiyDrDNNz86gFHeFJIRd-HfusuUIhMDeXgPrvG1hJ3y=
Laa6TMqBQ$>
>      >>>>>>> b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>     <https://urldefense.com/v3/__http://e2tools_git.bb__;!!AjveYdw8EvQ!e6=
G0IIki5XY3woNYM7gDk_0dr6qbokIInABiyDrDNNz86gFHeFJIRd-HfusuUIhMDeXgPrvG1hJ3y=
Laa6TMqBQ$>
>      >>>>>>> index caf0025c8..a80b6f598 100644
>      >>>>>>> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>     <https://urldefense.com/v3/__http://e2tools_git.bb__;!!AjveYdw8EvQ!e6=
G0IIki5XY3woNYM7gDk_0dr6qbokIInABiyDrDNNz86gFHeFJIRd-HfusuUIhMDeXgPrvG1hJ3y=
Laa6TMqBQ$>
>      >>>>>>> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
>     <https://urldefense.com/v3/__http://e2tools_git.bb__;!!AjveYdw8EvQ!e6=
G0IIki5XY3woNYM7gDk_0dr6qbokIInABiyDrDNNz86gFHeFJIRd-HfusuUIhMDeXgPrvG1hJ3y=
Laa6TMqBQ$>
>      >>>>>>> @@ -9,17 +9,64 @@ SECTION =3D "base"
>      >>>>>>>=C2=A0 =C2=A0 LICENSE =3D "GPL-2.0-only"
>      >>>>>>>=C2=A0 =C2=A0 LIC_FILES_CHKSUM =3D
>      >>>>>>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>      >>>>>>>
>      >>>>>>> -DEPENDS +=3D "e2fsprogs"
>      >>>>>>> +DEPENDS +=3D "coreutils e2fsprogs"
>      >>>>>>>
>      >>>>>>>=C2=A0 =C2=A0 PV =3D "0.1.0+git"
>      >>>>>>>
>      >>>>>>>=C2=A0 =C2=A0 SRC_URI =3D " \
>      >>>>>>>
>      >>>>>>>
>     git://github.com/e2tools/e2tools;protocol=3Dhttps;branch=3Dmaster
>     <https://urldefense.com/v3/__http://github.com/e2tools/e2tools;protoc=
ol=3Dhttps;branch=3Dmaster__;!!AjveYdw8EvQ!e6G0IIki5XY3woNYM7gDk_0dr6qbokII=
nABiyDrDNNz86gFHeFJIRd-HfusuUIhMDeXgPrvG1hJ3yLZhJevx-g$> \
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \
>      >>>>>>>=C2=A0 =C2=A0 "
>      >>>>>>> +
>      >>>>>>>=C2=A0 =C2=A0 SRCREV =3D "fd092754a6b65c3a769f74f888668c066f0=
9c36d"
>      >>>>>>>
>      >>>>>>>=C2=A0 =C2=A0 S =3D "${WORKDIR}/git"
>      >>>>>>>
>      >>>>>>> -inherit autotools pkgconfig
>      >>>>>>> +inherit autotools pkgconfig ptest
>      >>>>>>> +
>      >>>>>>> +do_configure:prepend() {
>      >>>>>>> +=C2=A0 =C2=A0 git -C "${WORKDIR}/git" reset --hard HEAD
>      >>>>>>> +
>      >>>>>>> +=C2=A0 =C2=A0 # To install ptest for this package, special =
configuration
>      >>>>>>> needs to be
>      >>>>>>> +=C2=A0 =C2=A0 # done before do_configure(). So, do_configur=
e_ptest()
>     which
>      >>>>>>> is scheduled
>      >>>>>>> +=C2=A0 =C2=A0 # after do_configure() cannot be used.
>      >>>>>>> +
>      >>>>>>> +=C2=A0 =C2=A0 # We only do special configuration if we are
>     installing ptest
>      >>>>>>> for this
>      >>>>>>> +=C2=A0 =C2=A0 # package.
>      >>>>>>> +=C2=A0 =C2=A0 if [ "${@d.getVar('PTEST_ENABLED')}" -eq "1" =
]; then
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Since we guarantee run-time d=
ependency when
>     installing
>      >>>>>>> the ptest for
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # this package, we do not need =
the check macros under
>      >>>>>>> section "checks
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # for programs" in "configure.a=
c
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!e6G0=
IIki5XY3woNYM7gDk_0dr6qbokIInABiyDrDNNz86gFHeFJIRd-HfusuUIhMDeXgPrvG1hJ3yLa=
-bYwU0g$>". Plus, these check
>      >>>>>>> macros set the
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # ouput variables to incorrect =
values as these
>     checks are
>      >>>>>>> performed on
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the host environment. Still, =
we need these variables
>      >>>>>>> outputted from
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # these check macros. So, we in=
sert the following
>     lines to
>      >>>>>>> manually
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # set these output variables to=
 the correct value in
>      >>>>>>> "configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!e6G0=
IIki5XY3woNYM7gDk_0dr6qbokIInABiyDrDNNz86gFHeFJIRd-HfusuUIhMDeXgPrvG1hJ3yLa=
-bYwU0g$>".
>      >>>>>>> +
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Note that HAVE_DD_COMMAND and
>     HAVE_MKE2FS_COMMAND are
>      >>>>>>> only ever used
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # in tests/Makefile-files which=
 determines whether to
>      >>>>>>> include the test
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cases. As for output variable=
s CHMOD, DD, and
>     MKE2FS,
>      >>>>>>> they only
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # point to the programs which t=
est cases need to run.
>      >>>>>>> Since these
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # commands are guaranteed to be=
 present due to
>     RDEPENDS
>      >>>>>>> and are
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # guaranteed to be accessible u=
nder PATH environment
>      >>>>>>> variable on the
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # target, we only need to speci=
fy the name of
>     these programs.
>      >>>>>>> +
>      >>>>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 perl -i -0777 -pe 's/(^dnl\s*=
=3D+\s*^dnl\s*Checks for
>      >>>>>>> compiler flags\s*^dnl\s*=3D+)/
>      >>>>>>> +AC_SUBST([CHMOD], 'chmod')
>      >>>>>>> +AC_SUBST([DD], 'dd')
>      >>>>>>> +AC_SUBST([MKE2FS], 'mke2fs')
>      >>>>>>> +AM_CONDITIONAL([HAVE_DD_COMMAND], [true])
>      >>>>>>> +AM_CONDITIONAL([HAVE_MKE2FS_COMMAND], [true])
>      >>>>>>> +\1/ms' "${WORKDIR}/git/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!e6G0=
IIki5XY3woNYM7gDk_0dr6qbokIInABiyDrDNNz86gFHeFJIRd-HfusuUIhMDeXgPrvG1hJ3yLa=
-bYwU0g$>"
>      >>>>>>> +=C2=A0 =C2=A0 fi
>      >>>>>>> +}
>      >>>>>>> +
>      >>>>>>> +do_install_ptest() {
>      >>>>>>> +=C2=A0 =C2=A0 rm -rf "${D}${PTEST_PATH}/*"
>      >>>>>>> +=C2=A0 =C2=A0 cp -r ../build "${D}${PTEST_PATH}"
>      >>>>>>> +=C2=A0 =C2=A0 cp -r "${S}/build-aux" "${D}${PTEST_PATH}/bui=
ld"
>      >>>>>>> +=C2=A0 =C2=A0 cp -r "${S}" "${D}${PTEST_PATH}"
>      >>>>>>> +}
>      >>>>>>> +
>      >>>>>>> +RDEPENDS:${PN}-ptest +=3D "bash coreutils e2fsprogs e2tools=
 gawk
>      >>>>>>> make perl"
>      >>>>>>>
>      >>>>>>>=C2=A0 =C2=A0 BBCLASSEXTEND =3D "native"
>      >>>>>>> diff --git
>     a/meta-filesystems/recipes-utils/e2tools/files/run-ptest
>      >>>>>>> b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
>      >>>>>>> new file mode 100644
>      >>>>>>> index 000000000..3d4dd9cf3
>      >>>>>>> --- /dev/null
>      >>>>>>> +++ b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
>      >>>>>>> @@ -0,0 +1,5 @@
>      >>>>>>> +#!/bin/sh
>      >>>>>>> +
>      >>>>>>> +set -e
>      >>>>>>> +
>      >>>>>>> +make -C build check
>      >>>>>>> --
>      >>>>>>> 2.43.0
>      >>>>>>>
>      >>>>>>>
>      >>>>>>>=20
>=20

