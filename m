Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9074CE835E
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 15:34:52 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.107])
 by mx.groups.io with SMTP id smtpd.web11.58072.1727710487004098261
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 08:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=VuOo+pHG;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.241.107, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhkO12iBob5hseDdDBogu49j+Sn2CF0mEZMqqMPoKuvwJBVaGT6lubzF558F8NfzIl3/ry7OZC7ycHF+yQTnEOXju0Q+hHZp0YLBHs5cGemhiV2ZW4ixxSFKDcJvZRIXib+raGg+jlwq2KGFmoG3jl1BR9VCIhP7WA7qtgY16PC5GcaciAqTYL1k3tCik0ZrLob/kHO1JOZjuD/5ok0qu8FWZ2a/2XI7DL8ILzg0aihBojrcgo+Fr2LyMd55d4Q7ghIGxr5dCY27h1q7xzieibAa4vXDxuV7XxH28g6nfITyxDETjbE0qnXAXctK4Gq8vyDj4Yiy3ouNfv0ZIGg08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGKPdCl4maiWNKWPOaCgcYEBWjnd80nrUr5OVwtBcmk=;
 b=Dc8cmGZwhmnVIh+V4EMjOABxoG1Oo0RsEdeHSXMZDaPChlcfz1IWRp5zYP1VxgM8FhHneO4Noos8NPwkJK6GPnGbXvwJR0DUNZuoEINd9bngCLn5+GiDHVji/e0Jg2IpPQSbNizw6vJE5Zlk3OVz2NQQ1QK4m862i3UiGNPBhYtGoxUvAlGq22x+GryeMZ0S17EpaHEcAp0s0nM6W0UR4xuLRibZt68gWmfNRihr+4SFfKxGLNKjX2zv8eTm/TX6lWjE1i8g98UeYUGcfTFckDKIYKOqaxBCrRHc5veUAN4EPmdjkpThPTgHQlbXsX+JA2NeKBORLEqS+g4xPJRxgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGKPdCl4maiWNKWPOaCgcYEBWjnd80nrUr5OVwtBcmk=;
 b=VuOo+pHGFDcRDLqsI9EIgSJ6Db0zMA4npscXZjgQ7JG2X6rGCi8Z3fPxTdviH2J/0wzExMPQpQqOlY9WkRgOcccFV3Ip566J2u5qrP1Df6g3N/L4tl09VXIXpxarcS5zvp63CgAYpQF6UZI72zV15kOS1m0HaOAWyd4ivzIpYzy3pzuv+2rdlmqIXbCD8qThlQcRqZY4fgCrDcFsv/4kGPr7zworq/4t9uymVMRJtBrkljctmDXnHVDY1mo30dGs7+cz+Z9KyAcIHqmwv2ihDKHeiywIsuDQ9P+pVqR5nY4lbVWE1bpwHkOI2w49fAC2nO/S6BXZBFqLvR1Rxn7+Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AM7PR06MB6405.eurprd06.prod.outlook.com (2603:10a6:20b:117::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 15:34:43 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 15:34:43 +0000
Message-ID: <5853cef6-3edf-4614-9b0e-fd572b6286d4@vaisala.com>
Date: Mon, 30 Sep 2024 18:34:41 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 1/4] mysql-python: Remove obsolete recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240930120524.2051403-1-niko.mauno@vaisala.com>
 <CAMKF1sp_0-6Ep9av_PMS37EfDxKz4vA7UswcY4nPbgPzTjLd+Q@mail.gmail.com>
Content-Language: en-US
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CAMKF1sp_0-6Ep9av_PMS37EfDxKz4vA7UswcY4nPbgPzTjLd+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVYP280CA0043.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::18) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AM7PR06MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d370029-9004-463d-6ae7-08dce16567ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SzFGQzJNKzB3aGhnZk95NFEzZUQvcmhrWEgvQWJMM3FaV2Y4NC9ZTHhwc0du?=
 =?utf-8?B?cTFXODNGODJaSHdqdEtuTWtoNGJOWVZ5dFBsallJcFFKYXRQZjFGRGhhdS9V?=
 =?utf-8?B?RzFUUmRvYWxGYkMrWlRhM1RTMk15RW1uazhpUVl1akVMWSt2aFhCL3hSY1VM?=
 =?utf-8?B?KzkrbGFtOGFnRG9GTXRJVzljVm80WU9mQ3c1bzBRZVVYcy9DcUNDcXBCbWNZ?=
 =?utf-8?B?OG1yZEQrSGs2NTg1dHMwQStjTVlGQXR0MHRvUTVNUnV0Rkx5OXo4TlJObEVj?=
 =?utf-8?B?SW50VG1yWFJzZ1dRZDc1WEllMVhNeC9KdmUwS25wMks0cWZVTkJ1RzEzSnUy?=
 =?utf-8?B?Tm8xc05Ga0tkdUxCcnNTaEwyanNaZVNuZGlTcmdjZGx3a2o1QnBaVXN6ZnNr?=
 =?utf-8?B?bjlvNVozQ21zcDAyTDA1WFQ5eXJDeFIwZitESUU4YWgzdDZpWnZBZGs3SHl0?=
 =?utf-8?B?ODhVSEd0QnpSUzJmVUxwWDA4Y3VLb2I3RmYzd0NGOENkZmdnVGFBdU82bnNJ?=
 =?utf-8?B?TXMxZmVzZGZOeHg3WWN0dG5Odm5QbWUyaFlJUkN6UG9uL2xkU0xRRzhodnB5?=
 =?utf-8?B?NXJvWEhVT00xVUtZTEk2WWcyaW40R05sdGhjTmpVVCtzVk1DREFXVXViMFZJ?=
 =?utf-8?B?bG1JMW54R09qbnVkUmVUTXZRVEJpMk9RUm92Z09rOTRWN3h1WEpKODQ4WGZz?=
 =?utf-8?B?Q1hkWGtJZGRvMjFVNWhqUGx6U0dTMWZ2cjQ3ZkRZTC94UGRQbHBseFJMd2wz?=
 =?utf-8?B?T1FOU29zZkJvWklzNy9FVGNRaENqcGVEdTBoVkJKM2NpZ0tveWFUV3g1UFo2?=
 =?utf-8?B?cVBBZjZ2bkNjR0duMUlQaEZnS0pveCtQMWl0UWhhT08xSWtBRFMyY1pZMFRw?=
 =?utf-8?B?bTZWck01TzArczlDZzlsZkFkV080T3lQODVMSGFJdkdWUTNsUlQrM1BtVVFp?=
 =?utf-8?B?WnhoMmJmYmp4L1Q4TFJRRUFQOEZNazJBeFJJYXhnbW12WVVpb1ZIeFppSllE?=
 =?utf-8?B?eEw0Z3lMSnBDaDRmOHU0K0c4MXhLRlk4YklhbTRMR0QrWVd4OEdmK0FuYjhv?=
 =?utf-8?B?czY3eml6c3JyZTYrVldaMmlzZUJnRjZEZ0RQMDRxZVBldFhnK1BTcXFHYVR1?=
 =?utf-8?B?bDZKMzFkc3kvMy8rd1FDYTUzVkViZ0VqOVFpcW54OGlzbW1TL1VsRU0xajNn?=
 =?utf-8?B?UUNrYTgvYTNTOVZwQW4wRUcwbEE0SlhqWHVDekpMUDFEVGJLelNpRmxmVmZN?=
 =?utf-8?B?MGsra0VmSFFzcWhvTkl6RHgwTWdpRHJzUXR6emZKMnFqWmdsREN3WDRLdTVq?=
 =?utf-8?B?U1MydEpVTk5UZWtQM000ZitvRVlKWWlxbTlYelVXY3FhakN3YmtDRW5wYWxJ?=
 =?utf-8?B?UzNaejJ6bm1vQldGSDZ5VTdVVkY1MlRLVHBOS1pGKy83c2xGS3hIaS9RdVJt?=
 =?utf-8?B?clNPM1U5c3J5TUZjZGVmalprQzVjdEZHT2dwR05EMkx0NzdEdmwySWFPMWJx?=
 =?utf-8?B?K2gyUlViZ0ZZYjlQeGFKZkprdUVHd3hBSSs1bzE4SUVJd3BIdnlFMW44Y3h6?=
 =?utf-8?B?bmgyeExRS0pGYzVEUXk2OURlRFNCcHRxMVczUm5CcXQyRVUyYmI3bTE1UmhM?=
 =?utf-8?B?VVIreWtrTGgxSDdrWWFLY1VFeVhWMDRNTlE4RDhacXN1L3UzWGwxR3J3WHRR?=
 =?utf-8?B?WnhocC84MnE2bVJIVWRJU3h4aWwxS0x2cmFCL2U3RzR1dDJYY25TdHB4THVQ?=
 =?utf-8?Q?RsTxGbA5QskoGyOPy8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVYvMDhjb3R6dU5HZERQSW5mRWMvd2UybUd0eTVqWnVYRTZYM2ZmaWl0cjc1?=
 =?utf-8?B?T2NMTmFGTW9ZR0NYN0lMWlozV084aXhXZUtBQ25BZnl5VEdiUnZtMElPRUpR?=
 =?utf-8?B?WFoySXJqQXRzQ1dOc0ZqMVIyZ1M5Z3k4QXB2Y3FxeW53WjVYREZ2a243SDJY?=
 =?utf-8?B?M3JxYjNPNWhmUnN6RFpESjF4Y1F5Q3VPMWtkbXF3T2hvblM1WjlBTzRVNGxN?=
 =?utf-8?B?TzA2ZzZudkJlTWFJVGdZUmY2aFdQUGFiQ2d3bXpmS3IvelJ2RnhyczNVTjBk?=
 =?utf-8?B?amtkdHFhVE94WW82SmRoaURNUzIyeDh2bGlXbml5NEFlc01BRVhGT0o5UEto?=
 =?utf-8?B?bWJ6Z010SmNRdkQ4WFpTMGdIcEh0WlVzbjRvN3NKaGtGSTZSb2FXQkpjeVhr?=
 =?utf-8?B?bWRKQ2t4ZU13aE9vUExBR1RtVmliN05OdW84dlc5blJvZVRYQzN0dDgwUWhs?=
 =?utf-8?B?bGRyeVQzSW9HVmw0NHhVbHpkSThjTkt4VjBEa3lTSnQ5UENYbGwyT2ExMEZs?=
 =?utf-8?B?amhyY0hCZnF5K2g2N2lFQU5PL3NyTXcrMHRBV2NhbFpMd0l0S05JeWxHWXgv?=
 =?utf-8?B?RldGYnRucCsvVjdqYTJTd0RldkJsTTRleXRiZ1YxM1FDcW85L05QNXBaVWlR?=
 =?utf-8?B?TjBhSVBLVDBrQ3BEc3JoUUE3OCtSYnB1bC85YndLZXhPa2xVbzRaNVNrU29u?=
 =?utf-8?B?eDVCYTUzQkE0dWhsSm0yWXNLME5zK0tYU3pDMTIvRFAwVi9OS1pGWEpEclUv?=
 =?utf-8?B?a2hqRkdZSDhzQUozNlJCVmlYRnU1K05CdnU2ME5zOC9BOG8wL1l5VGFwNEg2?=
 =?utf-8?B?Ni84NU5hZ0tZZnY4b1gxbjE5Sm51SENOMXR0ZTY0Ri9uNXdwVUp2elVhcDhW?=
 =?utf-8?B?WDFMZGNaazBPWHBPc3J1bWEzcVl3UDFnZ3Vxb05KK1RoMVU3bEVWUlZTTzN6?=
 =?utf-8?B?WkRjWkZZSllKejVSc1BKTStrL1BhWVhHbjNVNm5kRlh3Nk9iVmNLQTU0cm5T?=
 =?utf-8?B?a3haZUEzbitHREpaK3pUMVNNSjh6aGxFbDFKZmJsbFZoMERQY085TjJMTE9R?=
 =?utf-8?B?aWpVOFhjaDZudURiaktJOGMyMjBzTnc2anpaMHJ3cXZOdzZBeVlkRHI3N210?=
 =?utf-8?B?ZTNtRVJTTXVLRDdTSk42Wk1vYWNWYVRNdzhkWm5IVG5JWTMzOHBMR3Z6QUlX?=
 =?utf-8?B?b3F4dFdMOTNiRC9Zend2OU96ZFNMV3IzUUhMYmZocW93MWFlOFZaeHhVL0Zi?=
 =?utf-8?B?TEN6Nmt4eHpCVE5LQnM0WmUvQW9ob2JlQ2pUSnU5ejBmWSt1eXd0VHViSWR5?=
 =?utf-8?B?TzZ2bFVGODl4eUZlUEZlY3NJclBHVjBLcW1BVGMxekkwN1lXcitndGhLVlY4?=
 =?utf-8?B?eE9ob3RsSmY4WUZQeTgrNmo2Vi83WVJ4NWkvVitJQjdKeFVvajkxVE0vTTZR?=
 =?utf-8?B?Tlg3bmdQK2ZEenBTTlNPMmhZNi9iZ2ZyMkJQTTcyVUFVbnVwYktYMDdraXpC?=
 =?utf-8?B?VS9FSUErRG1mZEtRUldQVnlEd1RJTDRDVzh0RFBSNGh2akRFeFpoZUdtVEVS?=
 =?utf-8?B?ZmFUTTNnWUZxSGVvS1NHVFVEc2RVZ3U0YTVacnMweW9CejNrSEh6UGdhNjRx?=
 =?utf-8?B?UUpDaFNGRXZJVWg4RFB1bENmSnVvQW1VZUUxVU5lWjlmditiK3FnWk5zQzlW?=
 =?utf-8?B?US9HY0ZPZkdyTXlnUlVqN0FEYzRYdTdxNnBCd1ZjY2k1Yi82ZXZhTUdXV01R?=
 =?utf-8?B?QkdxSWs3ZngwY0drUEJteU1TdmxaWDNmVkZxQlgxLzFXVGtMeHVQMnAzV0dq?=
 =?utf-8?B?VkVqanhpcHkrcUErUmo4VFdKQzdLcWZLeE8vY0dpUlRwM3dmbkgwS0pPSmtJ?=
 =?utf-8?B?VG5wbkJzUHFsMkhKeGM4VGN3R2RnYUhIUEFxMzUzU2NuVTZXWjRFVVdXK3Nt?=
 =?utf-8?B?RStnbGN2VmIwUW40S2xHMnJQVXVOSmxJU0hkT0JTWG5kRDZTNC9IM2hvVU4z?=
 =?utf-8?B?MzRlSnBvZ0EwZzVCWmEzNUVLMnhpYktJbEticzFPbG1VdktSSGlpM1JuNG1i?=
 =?utf-8?B?eTdsaGszQm5YREJ6YWo1SjVFVlEraW9Wa2EzTGN6SDdwZTY1MHk4Ym9HN2lS?=
 =?utf-8?B?dS96eDEwTWM2YjdPcEVjS1pzaEVIZTBEOUxiQStoR3Z0U0REVXJCai9FVU9x?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d370029-9004-463d-6ae7-08dce16567ca
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 15:34:43.0246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sGVJhJfvggEN0uEIuWGf8Pyk9FWFxv+P1zDbEuRX05lHTjgshHAjiICzEhi5UKcJbnPifhTdfFEJSTfNH83gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6405
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 15:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112607

On 30.9.2024 17.56, Khem Raj wrote:
> Thanks for the cleanup, it would be cool to shed some more perhaps. I
> had to resolve merge conflicts to get this staged into master-next,
> please check if all is ok on master-next

Hi Khem, glad if I can help.

To me the following three commits currently seem to be in good shape in 
master-next:
  - "lio-utils: Remove obsolete recipe"
  - "telepathy-idle: Remove obsolete recipe"
  - "cherokee: Remove obsolete recipe"

Unfortunately with two commits I noticed some issues, which I will try 
to detail below:

  - "openlmi-tools: Remove obsolete recipe" commit in master-next 
currently removes only the RDEPENDS line in 
meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb, it should 
remove also two more lines in that file which reference 
'packagegroup-meta-oe-extended-python2'. Furthermore, it doesn't remove 
meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb as it should.

Please see 
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=7b178cf9ea8fe2683741f75ebc220f0f70cb45f8 
vs. 
https://patchwork.yoctoproject.org/project/oe/patch/20240930120524.2051403-4-niko.mauno@vaisala.com/

  - "mysql-python: Remove obsolete recipe" commit in master-next 
currently removes only the recipe files 
meta-oe/recipes-dbs/mysql/mysql-python/0001-_mysql.c-fix-compilation-with-MariaDB-with-10.3.13.patch 
and meta-oe/recipes-dbs/mysql/mysql-python_1.2.5.bb (as it should), but 
it doesn't remove the two lines referencing 
'packagegroup-meta-oe-dbs-python2', nor the 
RDEPENDS:packagegroup-meta-oe-dbs-python2 declaration in 
meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb as it should.

Please see 
https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=1a5d5087f66ad3cea99473223971aab9391ffc94 
vs.
https://patchwork.yoctoproject.org/project/oe/patch/20240930120524.2051403-1-niko.mauno@vaisala.com/

Kind regards, Niko

