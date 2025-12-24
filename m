Return-Path: <Liyin.Zhang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54D3E7544B
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:53:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.118168.1766569989287989583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Mh/RLAFM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=445348927d=liyin.zhang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO5Hnpj4160809
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=yPMDFI/shxpvKTHwq4HgHfnK+2XsYtWIKsJIPJvmwMk=; b=Mh/RLAFMK/k+
	bwOJmt0jFs55d0JdJGPO2sV/IZAZoROlN/mH2zmZULN6eCspQ9PGZUSExMexGuyN
	YjJviTBIn2SCDW4SbuYC+8IOKg5IX9oODeIeYc5F6v7240TfnUZ9j+J3RtLuas2c
	a/kKTLXaA66H0cOu/6dOWF5wZ3TbllFtcKB3v4BXZ9fy8UnzeN3YTQfyRMnJNrjD
	9kqiE6kPwy2lqGnvs4UnY4TSRWv/i9m55sD5HSUDPXUOEBwmYbf6XEuAQS+fPyJ5
	yoU0HElFVaqujpSY5vmeyPYzaGDLbZyHKOobJ0fg9EAgQfOrVbI0oqaYReVTYiD3
	E9MFL0H50g==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5h0vm522-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Dec 2025 09:53:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knrbshkKyxjQYsLlxouujRn3K7l+OiuhZAeSmGv6oBzaphNZdCwVizGb8SxVK+CeXklb6uyCiBw5IdSXyEeKy2/TZ/Nj+OV8F18mE/Rkat04UE8d7Giv5OSwTAUlwnQdgcOEqpNPhcrjzZplkg4ViH4tPHjhwkUP7lDGNYiyu8dd40qLS9zFFAlu/D8hhKxIfNP8tO1w3TTYtxW551cfm/qHQsfOcARnlFxzxP7/Gb+a3LLJiWmLYRw+YhssiZQ1M0GSY9DwGOykVy9yDZCQGhXDuKBSyfbfMdleZx3iuHb5XY5YTpviZCJ4+Q55wgQsdDzOYe0+j0rk/Tc1R7/j8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPMDFI/shxpvKTHwq4HgHfnK+2XsYtWIKsJIPJvmwMk=;
 b=oMxX2DqGVsfXqUCbzdP89VxbGUDR/qTuHNfz9G/lxLfBmqOPUVPu7QrRka/oj4NGzZDCCUpYX27HQWMI/bkZwRtGHqNgTj/1H0254hi0yUFbm4maQkwZn0Cvifbr/g9TZ0H4KMNB0zdvouLuqfZVKn0BLWks8OrH69aO27eJ+YMCu4nDiSJAv35GgPCCj4BKxERfPKgZyWO6jrVdcx3c9lAYuQ18E6ivBkfuiPYZVGxctaAg1htW+PWFDH6tfsi5Zf7DY7Wr1sAYbMhRQfBYyOmZlFxeWNNZe5pl6F4UZKQUhtWT8/uHkFzihXQgYXnK+IeOpxTRp7DfqMSBvbwtvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB7077.namprd11.prod.outlook.com (2603:10b6:303:223::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 09:53:05 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 09:53:05 +0000
Message-ID: <bace2433-7944-4ec1-b0ec-5f3f5fe157bb@windriver.com>
Date: Wed, 24 Dec 2025 17:52:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][kirkstone][PATCH] apache2: upgrade
 2.4.65 -> 2.4.66
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        "valeria.petrov@spinetix.com" <valeria.petrov@spinetix.com>,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        Khem Raj <raj.khem@gmail.com>
References: <20251208205128.1274030-1-valeria.petrov@spinetix.com>
 <CYYPR11MB8430C5040A442964D7BE733BD7B2A@CYYPR11MB8430.namprd11.prod.outlook.com>
 <368bde00-9678-4748-ad9c-c04b99115a1c@gmail.com>
Content-Language: en-US
From: "Zhang, Liyin (CN)" <liyin.zhang.cn@windriver.com>
In-Reply-To: <368bde00-9678-4748-ad9c-c04b99115a1c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4PR01CA0081.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB7077:EE_
X-MS-Office365-Filtering-Correlation-Id: 8012cedc-3a01-405c-67cb-08de42d23c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cllMZU5LM1Q5SllyaVFqeXE1Ny9qV3VabCtDSVhMTStGeGdQOUdrZGp6YnNz?=
 =?utf-8?B?WER0a04wYUlOTDQyRnZ3a3FlYzgrWFhVY3l3QkY2c2VIL1ZiUlNCalFYNFFN?=
 =?utf-8?B?aElEOTZIYkRTZE1KRmFtcTRPYjZaSkFxUTlUS3MxWmFwZ0E5TERlaCs0VDhj?=
 =?utf-8?B?YWZlNUgzbUhjWThYWDdDRHd6aEVEOVJMdXdSUzlKUTB3eFR0bGdYQjJBWGVY?=
 =?utf-8?B?RGxZa2ZvNisrWjkvYXYzTVR6Z2dRUTNrSmg3ZnBCbHc2b0dObVJ1UlVoajFJ?=
 =?utf-8?B?RlFMZ3pYQW11UWhCWG9hcHdvMzZUZllzU3MzbEZKU1V0TUVTUXlyNmpEQXJQ?=
 =?utf-8?B?Z1ZnanJiTHkyQ1Zldmlia2RKZE4xYWlJWWluenFsVWRXblJwdjVJQnpiWGNK?=
 =?utf-8?B?UllqcmVSbVhtQ2QvQXh3d2hPRHlnbmZUZHVkMGZSWHpLQSs5MzNua2xYVnU0?=
 =?utf-8?B?b3prV3gvdXB5d3c2cmZBaDhPRkFYbUd3RXpSeG10ZG1pN3pBZENPbVgwVDZw?=
 =?utf-8?B?djFrUnV5NWFzRER5Q3liVUZTN0VJc2dhSFBnK2RmOVdiVHZPSlUvRnJSdXUy?=
 =?utf-8?B?Y3h3QlVUUExHV09vcXZod0ZtMENjZUtmVHdxN1BMQ1hVZUxvam9rOFBHQjVy?=
 =?utf-8?B?UjhNMHNGWWovN0p6WE5Ob1FaR2FhSjRlZVpUdXJpYkFuZXJBbGRvTkVsU2Q1?=
 =?utf-8?B?NU15emxLUWFIRU9ZVlBaSlNQbll0OWR1TnlsbWd0WDIyVlYrbllTSEM0Y0xk?=
 =?utf-8?B?TUtCaFIvdkRadFhjNlViYTA1amZJWWdZVXJLeVl1azR3TWlPQ2tmb3NkeElV?=
 =?utf-8?B?VUFtaS8vd1ppUHpsT1ZUU05iSEtpL21jRGxMb1dVZjl5cWNrMmRNbXEvMlVH?=
 =?utf-8?B?dVJ5MmtnRDdXOERhMVhWK0cxQnE1SUFqTGwvbmtWZWw5MWFTbkl5V3JhZUl3?=
 =?utf-8?B?bDR5NWJCOEk2YkZsVTBSelZrQ2FlSDJGVzBrNm50UnlRZ1p1S3NpdDJ1dzdu?=
 =?utf-8?B?cXU0ZWF4cEx4RUdORkQrTG94ZEx1aW9OOGp6TUlidlNYR2Y0Y1R5eEpnYTR2?=
 =?utf-8?B?R1BMaDRHQ1IvT0xvcGdaT0lXZjNFdllad2gwVkRlTHd0dlMrWGx3SUw5aUZ1?=
 =?utf-8?B?L3JuTVdQbGhFUjZia1BhOFVRVE56NklFaVREaTkwVStvdEVhNjlTbHVna0o1?=
 =?utf-8?B?azVoSXNXR0s4L3J5dFlhQnFxRDJZQ0dXVG1neXNNaEE3OWlKZmZvSUNEKzhK?=
 =?utf-8?B?ZVk4bk1wclN4RUlvZmNuYmpEZFVpOTBSZTJBTmlibDNJWjVUdERRMEY4VFpt?=
 =?utf-8?B?Y3BzV3M2OURMM1dWOE1SN09rU2g5K0s3MVRzcTBHWGlweWJKTVpKVVMxS2tq?=
 =?utf-8?B?cUlhRFlRWVFqY2pkQVBSZEk5NWFLWnBOMUw4M2ZXWm94V1F1TXV4MW5pUWNO?=
 =?utf-8?B?dWZQY0tJejJsWjEycFdSY2pkRXAzT0luZWkvMmw2MTVFU2FHKzVUSUZkOTdL?=
 =?utf-8?B?a2I3anBSVXFZcTJjaHAxd2JpeXowSlZQZ2d5MGo0TGxHQzBrd2REemR0c0x1?=
 =?utf-8?B?ZER4eWRXMjR1MjZtNW1EdVQ1Si84cFBGMmRuRWJldEIwVVZPdHl0U2c4aGg2?=
 =?utf-8?B?cE92QnVFblpMRHl2b01OY3dKbENHUzdmVlFwN3Z4WjB4STQ1ZDVBRXMrUDht?=
 =?utf-8?B?ZE5mWFNyNkRua1FQU3NvN3ZBZ1cxSnh5MGNDTlYvT1NvTFJZaUJFZE80NXV0?=
 =?utf-8?B?VGlXRVJHNVQ4cm9CSlpNcTJmaVFKbXZMMnVYYksyWHNDZmFtMlpudnp2Tmov?=
 =?utf-8?B?cGxCdVZVUnFxTy9ocllOTUl6d2E4R1Zmd2Q5cHpmZ1Voblk4T1lVblg0bmY1?=
 =?utf-8?B?d3pGYkxieHJvNnRXM3BKNHB0b1lQSzJDVEhhSjkyNVp1Q1ppYzIxVit0NXAr?=
 =?utf-8?B?UytyTS9BRXJMaXBJeFNIWE84Z0txOEhHUjhBWng1cTlUSkt2NG0rWmhWeEpU?=
 =?utf-8?B?WFkzdHZGUFlBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYYPR11MB8430.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aEEraDFkUnlBRWlKMDRWbjR3ZDJCblhRQ2toMjZRRnN6Mi83aHRsK21LT21Z?=
 =?utf-8?B?a3BoSXBCSjFUblBRM09pc2ZYaEU3dWtOSFF6eHIwU0ZsWEFZSWltcVdYRURy?=
 =?utf-8?B?NHV0ckxST2RjOWdaTzc3dnlTWXVKYjI0L1cyV05zU0dRbGhvaU0zQjNOa2RI?=
 =?utf-8?B?TzJiVEQwN0NpWjAvMWJHVXhCVGVFMkxYRnppTmxtRFkvTzVua3ZldDV5TCtU?=
 =?utf-8?B?SWZSTm9rY2RYYUd3aFNsOEpDMytXS0Q1eXFsSmx0eC84VFlBTXhEODdGdmtx?=
 =?utf-8?B?TXZ1MWZxNWk0YnZza3k5QnVUdU5McXorWXFXTE03bUw1YnlvMU5WUVNHbEpC?=
 =?utf-8?B?OHdJcXh2UU9qMnVvVi9VZ3IwZXZ6VmcySTVhTFhOdjlRbVRiVmdwbXZNcDBk?=
 =?utf-8?B?V01EbVZkZVFXVUswdXR6OHluL0hUT1VLT0ozS0daaE8rM1RMMUcrNHUvWHVz?=
 =?utf-8?B?OGl3UnNLdUxlZnBoUlIyUDFDclFHQngzVzlGSDlpYytPdDRhcSs5anI3bmMy?=
 =?utf-8?B?TmtTU2hSVUlCWHk5dmRmVEQ5UUM0cUE1bU04Uk53dTJlMFplUFJQOVM3aHZK?=
 =?utf-8?B?NHgvck13R29FdjRXdmwzOHVpVFBmZVY5MGgwSm9JMU9laGhUckhJZTRGSDJK?=
 =?utf-8?B?Mkl3MG5hMUNDdGZxbzRLbDFNNEw5QjZZY1QybTJwN0V0MS9iTTM1cXRMMWZ0?=
 =?utf-8?B?R3pFUWtEZHduQldHL2gxb2RYakswQmlxMFRaY1A0QmpDT3B5VVpXZUFkZE5l?=
 =?utf-8?B?MC9VNjBnZHErc28xVDdXeE9mVE9PY0xmSkhqS2RnUWFtS0FqckYweXpJMHF2?=
 =?utf-8?B?eFk3WFNlZDIwbTJQdlo4bUZ4eDB0NTJkNWhtanFYWkc4UGJIYzU4UUZMb1NH?=
 =?utf-8?B?Z1YwaldMR0h2di9ZMitPS2g1Q2czamZwbHRSWUNIV1B6Y0NGN1dIcmU3Z3ly?=
 =?utf-8?B?T1c2ZGo4S2pYNGxEbGRMSGlJQmcrVmlmbFhyYmRuYXIxa2w0ZE10eDFkRTg2?=
 =?utf-8?B?T255ZUthOW1zVVRVQ2RCbjdDTUNrdnVUcEpSbzIySXkvRk1keVkwL0VBVXlS?=
 =?utf-8?B?NTl1cWFDWURHelVVSVIvQTZmSGg2YnBGSmppSHVkN2owSUE1ZEFRbTBmSDF3?=
 =?utf-8?B?NlJQbU5KV29MTkhJd3MreDN2ZmNPNkdndnNPUWd3WmRNbDJZQ2c5NlBUWDVI?=
 =?utf-8?B?UFF6NVpnUkdXRm1XU0txbjZ5WHJRNkdOTHh3U2ROcC9waHQ1eXR6Q055cnkr?=
 =?utf-8?B?SFdWbmh5T0kxMlpVSE50UXJxWm5ZSXZkbDljZWNUaXhtZWNQbmtlUTNHZUZx?=
 =?utf-8?B?OHJrNUNOOW85NlRZcUc3RUJzUXoyaWlCMkZWQURESUg1a3Z1Uk81b3B1NWxs?=
 =?utf-8?B?bmE1VC81Yk9MZTlQNDVtY0pLaWVKejR1bGt4V3Zwd0NkVzRlZnJ0ZkFqdHVE?=
 =?utf-8?B?YXVqbDIxbkNvSml4T1laNVpnMC9LMmtudU8rQ2NSbkljaXR5b3JJMXZNSXNS?=
 =?utf-8?B?czZ4RmQ1UWdTVWgzU2twQTRwYXkzM0hBMTJrYkxvdlV5WTIyLzJQODdTRjVE?=
 =?utf-8?B?TzFVVEI1YXFXbUJ2enBxVmlHd0V6YU5RK1VTaGZVL1R2VWh1M1Z2OE1lMDJm?=
 =?utf-8?B?cTdoa08xdXVRdUhFYUxBTkEzaUZEY0tOaVdMMjJ3TUxXMWNIRnY3WjM0aGlM?=
 =?utf-8?B?TGVScDdnZlJBdFdRMnk1cEtYK0E2MlZNcG1SaXRQTWg1RnFqOTZyUTNJbUk3?=
 =?utf-8?B?NUc1ZkNpWXlSWElCa1VCL1pUaDlFcGRXT3pIUXNIMzhmb1E2bWZBaXJpeEJn?=
 =?utf-8?B?TUZPeGhNQVBpbzdybzNXZVJWaWl4bFdKU2pHRVkydSsyK1pxZktpRU1kTW5k?=
 =?utf-8?B?YWFua1h4ZGlRQXBOMEF4SGRsWnlScFM1cXMrTEdYZjVMYWhEcW9wenpnZ1JP?=
 =?utf-8?B?OHFJdFczelJSOHBLQklhNUJGcHhQTTBYVWJYVUdxTmZrWVdjRkFwemU4Vml2?=
 =?utf-8?B?Qjg5QjZJa3JFbExzRjlyZGFYSE5ZVTg4a0tZeDZvbEY4U1RLcjhjdURQTEht?=
 =?utf-8?B?RnVReERyYkVteXQ1QjFsSHRGZW41aElhellmQkJGM25wOWhReGsvMEJDZGwv?=
 =?utf-8?B?cVZtaTl2cDhWcnA4LzRQUGdJWk1qODQvc01vSlZNcW9qZTlodjRKOW4wWmY2?=
 =?utf-8?B?UEJOS1c0dkRWeFlZUE1BYjRveHZDTVhZY2wxM25SenVqVHNDOXlHYVlBMmd2?=
 =?utf-8?B?OHgyZXhyaUROa0xlTTUxcjgwWlZDcStFeXBBUHI3Q1RpdGJQOVdid2tSVnZR?=
 =?utf-8?B?Kzg5djdmeE5uL1pKOTZkYW5VQnZNNnA5RXZ2TkFDR0xXOGZHMWMwZ1NIbjlp?=
 =?utf-8?Q?Un1mfGj9DAvIUHvI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8012cedc-3a01-405c-67cb-08de42d23c2f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 09:53:05.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fCL/5O/o5hSPe+WOu4prHUTUa1nzt8P5J2yelZbCBXSIIbmivFZU3IoVfbRHwWDd7/ZoHUUDv43OWFbR2FDDPyu3AnR5rAWAYGRlMUxfk+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7077
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: sR5yaZ7CX37rMz2jS9rT18PlNI7BFupG
X-Authority-Analysis: v=2.4 cv=I6Fohdgg c=1 sm=1 tr=0 ts=694bb804 cx=c_pps
 a=INYzEgT09ABq+JfORImVWw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=mV9VRH-2AAAA:8 a=NrUJFPGUAAAA:8
 a=pGLkceISAAAA:8 a=EgjA6SED1V3569uzDyoA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=liIJVMK5xV7nxcgYItiW:22
X-Proofpoint-GUID: ei8bHZspAa_IzPdNJZrqeMhe1A3NOtyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MiBTYWx0ZWRfX8nAt6YaLvrOs
 SLnUNDHdzZ0eSD3SBXn/NXVBQ15ZM9+M83uDjjubdc8f4SyLrmyaKeHHQBRlGH/RzmWuhOjbrJV
 7GvEIP9bVbx6K/Al5hzwdyyJr+zKC8e340h8ope7AuKTa8VjguGO1cCBm1SCXDYbTZFv5dKP5B2
 SRXEzpu9e7PvfpisP0SxhCIu/ZwOUpOWzgs1SRuIWMgy+wDi3r2p1Gem6zKaZ5Hfg5+N074QHFh
 VbQfO75vzWTjJ4K1zB9lqM7je73IvNmGBZ3cr9op0WVue4aPwl5enhtUE4sLRJA5WDhQTXjQFuJ
 A0dL7sTrnt7PNw8zhb5ak8udKVYlgQMiUD5ir4X2ZpgrwUXbRvpuRDDM5lk++L/yVARQIi+Xtaa
 AVECeDQ9QqMrJ5NefnxbbL8t6zh/8sTs4g22b6aS1s8L0wsBRJmwbUgIqJt7czmXB4ZYp6tI/B6
 ya5zBvLlxd8hcvSfJaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122881


On 12/24/2025 5:50 PM, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 12/24/25 10:44, Zhang, Liyin (CN) via lists.openembedded.org wrote:
>> Hi,
>>
>> May I ask why this CVE patch didn't merge in kirkstone branch?
>> https://git.openembedded.org/meta-openembedded/tree/meta-webserver/recipes-httpd/apache2?h=kirkstone
>> It is still apache2_2.4.65 in kirkstone.  We need this fix in kirkstone as well.
> It is in staging[1], but it arrived after the previous batch was merged.
> It is planned to be part of the next merge.
>
> [1]:
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/kirkstone-nut&id=46a6fbcdcb710e09d640f91609738e79b5a617eb
OK, got it. Thank you so much.
>> Thanks,
>> Liyin
>>
>> -----Original Message-----
>> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.openembedded.org> On Behalf Of Valeria Petrov via lists.openembedded.org
>> Sent: Tuesday, December 9, 2025 4:51 AM
>> To: openembedded-devel@lists.openembedded.org
>> Cc: Valeria Petrov <valeria.petrov@spinetix.com>; Khem Raj <raj.khem@gmail.com>
>> Subject: [oe] [meta-oe][scarthgap][kirkstone][PATCH] apache2: upgrade 2.4.65 -> 2.4.66
>>
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>> From: Valeria Petrov <valeria.petrov@spinetix.com>
>>
>> Security fixes:
>> - CVE-2025-66200
>> - CVE-2025-65082
>> - CVE-2025-59775
>> - CVE-2025-58098
>> - CVE-2025-55753
>>
>> See: http://www.apache.org/dist/httpd/CHANGES_2.4.66
>>
>> Signed-off-by: Valeria Petrov <valeria.petrov@spinetix.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../apache2/{apache2_2.4.65.bb => apache2_2.4.66.bb}            | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)  rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb => apache2_2.4.66.bb} (99%)
>>
>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
>> similarity index 99%
>> rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
>> rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
>> index 98b2215f44..0e96643fc3 100644
>> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.66.bb
>> @@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
>>              "
>>
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
>> -SRC_URI[sha256sum] = "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3"
>> +SRC_URI[sha256sum] = "94d7ff2b42acbb828e870ba29e4cbad48e558a79c623ad3596e4116efcfea25a"
>>
>>   S = "${WORKDIR}/httpd-${PV}"
>>
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#122879): https://lists.openembedded.org/g/openembedded-devel/message/122879
>> Mute This Topic: https://lists.openembedded.org/mt/116683862/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

