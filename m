Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7181.1793914843410281157
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 13:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=pKo3Z3mz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5769c6b3e2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L7Pke506338
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Nov 2026 13:40:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Dqxeyg0q3KSkFjRYIkiJzK
	gckiRSOHL4wzsZ0S9h+Zw=; b=pKo3Z3mzzAd7vikcZDR4SMcafrRuOStBywLJmq
	XllVoVpC3LeaFFJJom/isuOnRrPm/Rs+pvGeB9lQiPH60l2ywtxgyhWkR7eThyJV
	dwiMP3m41peyBOrR7YXE+Rgf3A2T32YG5Ke1Cf7oi+wgW8rqPiDUI6C3dEln1cM3
	OvcX0CVjQYPEQFmGB/NTBn0Ij0DkhboiEAap6JwOvdNlAn9NPg+GNc7c6IyaBvbq
	NWf3M4jfFPR2yrCJg2K2X7ZRoOVWKpGegPRA6Zw6cblV0dI9hjX41qvuGXzyNlFc
	UUT7B5OsNOfficwZtas0CSDFNlTUjXnFwenOCHmJhrG8Zmzw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021111.outbound.protection.outlook.com [52.101.57.111])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hrakyjscr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:40:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTZ2+YQJV5NLBQsB5KDbCginY52sAj92SeqdkGBJzs0d5NHzboG/iPgyWyYY+ZojXpuX+L/r8rAkQAAOqFNY5ar4qsDE9cDJ2EPzX+S0kmyEEf/7d2AEnOmp4f3QvjeHWVlEVRLGnRBgSHtmbSpwPLFabGbkvAcaeAglgRGKsAkusr8oqK/Rh+gJ+SakSb4LJzu6M20Lmnmoc8hrxnqZ/b5WXXioL8ujtYoFDZZusx8ubeRvuhgOpM3Fx9t1GVgNRLyxhSXx4McvzufpZ70vPhRBXQM0sm5NaLD3Dh1iRDOk039BQUVYqn3bKmjTBJVi9NhKQSpiBCH0rSzKcabCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dqxeyg0q3KSkFjRYIkiJzKgckiRSOHL4wzsZ0S9h+Zw=;
 b=WRj0xfu6CJVFNDpXvMOCw3VFq+yKQ2G7H5dmhgRou5EBFXpnvidBiOuK/Y+TvAttvUXkq8Qp1WX/GG+lM7c4/XcahMiUhNLxbW1gbH2PeWP6AwVSMxyW51XC02dz/Wxj9+7IRo4NtMCrDNiACvV/iqlX8aPWyekoeiao+JGyAl+Qy2i96ju2dhC5x8um4VqEj6xkTOtYeKZo9PM5hJ4Z7+jClgiwrah6b4QpkaPLIZ89v1OmmGQRxYbhl1n0oCxD7hahsP32WSDOF3BhNbhmcSNGS8YRwmJduOPgEJhRL5BpjoSlzhgb1LF33HOvGPs1boLTBSlVXR0RHYsnpxBK4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by PH7PR11MB8549.namprd11.prod.outlook.com (2603:10b6:510:308::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 21:40:39 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 21:40:39 +0000
Content-Type: multipart/alternative;
 boundary="------------8lEVIa7qC89NP9Ry7fbNDFJh"
Message-ID: <f7611e26-69b5-4813-99e0-7e34502d53ef@windriver.com>
Date: Thu, 5 Nov 2026 16:40:37 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH 1/1] libyuv: use GNUInstallDirs for install
 destinations
To: Kanksha Paturi <Kanksha.Paturi@windriver.com>,
        openembedded-devel@lists.openembedded.org
Cc: sumanth.gavini@windriver.com
References: <20261105181533.2975485-1-Kanksha.Paturi@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20261105181533.2975485-1-Kanksha.Paturi@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:a03:331::27) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|PH7PR11MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: 822ecfae-0e2c-4bfd-f9e7-08df3b856f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|13003099007|3023799007|8096899003|10067099003|56012099006|11063799006|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261009220027099003|261009221227099003|261102123227099003|261009223027099003|261009221727099003|261009223327099003|261026140227099003|261026121527099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: Ec88puEjPHp0BPhzn+7qQd1MGv+LPuWIQKODacbCbmpuEOc4NA1EDwKo0sDobrCcdkZ5PBm5LFt2ZL98qBF34C/lTzXApsWOiziSDsHI97Gi9EN489/XFoAfqEilkjyHWsWRxiDI0hUEPydETetn4d9pkBziSt9kjkElYW9UeFAOfR7CYQr4fins4GHuTI/ZqhbR1SKEERycKOVSp38pn6KRFdbZMtoHSHD4so7bTda/EHwDHgqKmcW262p0Cw6Fc+ebo8qRdJ0D2oSyzguYO7u4H4MPhPtO7DGri6gsHYwM4ekDu1zYCNqsXuE4E2iOmV3+kN97BjMQSA/G3XwNCM3ZTupk8XZaznEil01yPIO6ABUkEQYhc7i80yMwFdUWaihf0Q/MQ/2UsoEUKWaYwtgIH/JWYBDk3TrzHECPpONwlgDGof567aZGftTnPl45UKyr1mugw97QRwRfzetCmlqGOEsDUJa11EsPVCE2ygrtnbm0bHkTK0cyW5pnlthUMxhZZD9kMBR6M5RRVFt2C8nBEJifzN3dNIlQYHCl0ifKOJa+fARMZ4H8DcDN/pyfBYqAKIxUTMJcHrdZW8UwmFoQYjr9Q2WLPdvQKyh+Jyexz90znon9spHPq9tUN95z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(13003099007)(3023799007)(8096899003)(10067099003)(56012099006)(11063799006)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009220027099003)(261009221227099003)(261102123227099003)(261009223027099003)(261009221727099003)(261009223327099003)(261026140227099003)(261026121527099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qy9nK25Pcitvd3JtODk0VGVPdXNjSFhKVktaajYvTkRTcFRuQzZ1VjNyWFZa?=
 =?utf-8?B?S1dOdFBjZDJzeHAvVHRUN2RneUZJclNXeXpqNFZsT0FMeWx5UkdIY1RaWVY0?=
 =?utf-8?B?Zm5PWEt1aDdHTzRhMVpoU0d2UDZpdEJGRHNxZXpXcCswVUlVMG96UGlOemdz?=
 =?utf-8?B?VlgvRnRxVnJtc0FodFQ2N0JweW8yNmV3S05xZHBGVm5tRzE5c3JUZXNlUkJo?=
 =?utf-8?B?MWNITXZkZFlxTkI3R2VhcUY5MkcxbjdDNVp4RERDSmlkMXY3M2NOQWR5NzNT?=
 =?utf-8?B?TndqM3k2ZjFYSTRsd3UwVnJNWUxBVlZsRngvcEhKUlliNUNJaHY1S3d3K0dR?=
 =?utf-8?B?cWVJa0trb3lJTXFvSEJyREtBektlSWNkN2pKSXkvMnd1MFBsaEhzYWYwWmxC?=
 =?utf-8?B?bzRwZDFuK1JDZitnU2o1bzA3ZUpxS0tsOUVpUFJYTUgydDJXYitRYVk1cjdi?=
 =?utf-8?B?R0hCSUVEbkJBTkRLc0tYMzcyc1lxWDlseXFocVlpUTdmUk94T0s0dUJibzFW?=
 =?utf-8?B?L1RtU0RBN3cxalBvR3pxYURWWVNpak1Fb2tJVnpVcy9YTVQyQnplNGF5RlBD?=
 =?utf-8?B?amZwS2t0YkJLeGRQNVkvRnpBM0VzQmhFV0lQK3BKcG5DM1hDRGR3QjBRblN1?=
 =?utf-8?B?VmlMMjB3THErVVBxYTFPbXdIUG5yRzFhdDZpVGlmQnhsNjBvWGVXMWtWbUF1?=
 =?utf-8?B?VVBQaGNvc251cGIrR1RyQ3FaUzNqRmFvLzR3eGYyOWlwT0Q1SHcrcTJuREFK?=
 =?utf-8?B?eGlIUzloS1YzTE1sR1NwRHlpaWEzc0M0dURlcFhSQmViTEtuUWxoelZSSmNk?=
 =?utf-8?B?RlZQVC9YM1cyQVVIMk5xU1ZybTZwblNucVdRcUNaS290NVRmaVVkWStJL0pQ?=
 =?utf-8?B?dk1pK2NSRTBCSHFSK05qVWUvTG5CQ2dmTjg0QnZsSUlWcStQOElqUTYreiti?=
 =?utf-8?B?T1h1aDI1SmZYbk9IT3Y5MVdQTjYwZG1hSlozVHdvYWFQRGVLNWlqOVJFQ09t?=
 =?utf-8?B?d1BOMjVOQVhCRlNwZW5GdzE4NWJ2L1BFdnkzTXpBU2thYjB3MXorSlpkbFFH?=
 =?utf-8?B?VW9XaXJYYmgwUlpNb3MxNGdyV0dyQjJiVzM5Sktzamp2SnJZV2ZRRHlnWDBG?=
 =?utf-8?B?dXZVMjB1VHR1UUZqMFpZUjdTbEdiZGNZU1MvU0lRNWw5MnB3R0NocVVnamha?=
 =?utf-8?B?UWlMYytxWVI0eU4zMUpqYk4zUDN5UEt3SGxGTlJOQUNnTjBaWk1TUGRHbXVJ?=
 =?utf-8?B?MlJFenJ2Q0ZWaitSN2tiSWtWekFKSGhncFFxWkZuU1hrN3d3VjVqR0VZa2Ra?=
 =?utf-8?B?MVoxdnFSbnQvcUZCdldWVERHR2V0bXNYb2dGaE4yUDMxcmZFYjVGbTRkeFBz?=
 =?utf-8?B?em95T24yTFZUNTdYWlo0TUJDT3ZqaG9FWVMrd2E0U20yYWUveEZXSHhOVDZW?=
 =?utf-8?B?VnVHVDJidUdham9peWpjWjdmS0ZhY0Q2QkpjUnZ3UEJyRWx0TGR6L0RUSk9J?=
 =?utf-8?B?MUVvTlBFRlJiTiszeEwwT2QvT1NIK2ZydGZJeW9HS2RUbzlMT0xZUk1KRHg0?=
 =?utf-8?B?Z21HcUtzbHQvMm1FRFBuUDdFSjFYdUduUDRHQWgzOW9waXVvcE5PTUJka2w0?=
 =?utf-8?B?Y3RYVDZETG9GaVpPN2s4T2VLU0ZHc09DY3RXSHNOSXhpNkQrZ0NFcTk5ekVn?=
 =?utf-8?B?WDRxcUF2ODJSMVppOWZwRjM5blpFRVMrcUNZakV3YU5xTEpHaUxvMS9IaGIy?=
 =?utf-8?B?ZGN6Ty93SFFiS00xTEV1ZEx6QUZidFhxREtVNGducDNvNzJqQW1QclRZbFJq?=
 =?utf-8?B?UVpEcEs1ckR0eDRqS01OYWl1U0lmL0hYWEE4cU52bjd5VlNRd0xHQmJQOHQx?=
 =?utf-8?B?dnlFd05PU3N3TTk0Vjc4Wm1wdlFuS3hkVU1SSjJYdDBqb3JPUzZVRlVDK01B?=
 =?utf-8?B?ekVYUmQzdURYTkJPUm1nMjFRV01NRU1JNVRpN09lVFIreTBhWWhPeXEzM29q?=
 =?utf-8?B?RXNUV1pHWjN2dk5pVHlTU2R0ZnJoY2hKbTVIRjBsYTZHRUlYb3FrOEFiUlNP?=
 =?utf-8?B?WVlXR2EzeWVoRXRSVjc3STVQd09VMnhMbTQzNUdkaTJ5cHdtODMyeU1Mc3p2?=
 =?utf-8?B?UWJDL0hCUDhHVzU1S1JwYy9BTERDbHB5QTZydmZmQzhnWlNTN0huclNJM3N3?=
 =?utf-8?B?Q1BJVFFndVBMbmR5dUh6VlljaHhrRkpNSW9BaFJnUHZFMm9TN2ZrTTFwTjd6?=
 =?utf-8?B?NUR3YURNdU0yTDlKQkZCd0t0dWdqeGptVFl3WXlPL2VzM3NOZ3haYVlTUFZU?=
 =?utf-8?B?K0w4U2NBU0I5YjVoMVR2NGpoZmhWZjYyakh1THNQVzZoVzA0dzBYSGJ4bHNZ?=
 =?utf-8?Q?4oilgMjNiimfgT0M=3D?=
X-Exchange-RoutingPolicyChecked: xRj0jEqVgf9GrI38EZq8GjZz8pvg0xAR3mW9uU1Ws9NthoZ9+4YS9BoQ46v14XIj053BnfV6nSoWBhYuqXB6qrJtOXstCSTVpRvkfa2RCCNullORgEu6E99cxoA1YqQK7zGNd/NrdLYc1GQZl2+ImfMxLrpQs3Apse4gtMSX1jnq2c4MZOSGybeA+GbaPBEMzpWIyKXqSpZQ8F/qzLNVwFmVyp4p8wx1ebTxGLw08H5LpAHh++U94KgFKGwji2wG+e7RfHpXEGxK1widb5SpGUatypoUXMLTUNOVdHtPgXlwDTVrQe5E7rvOQvTk5r4gnLQWEn8IdNAZYuKES9CBSg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 822ecfae-0e2c-4bfd-f9e7-08df3b856f35
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 21:40:39.4097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /IaEId096qhKNb2xVIVVUJqup0nVT6tlduiYjjxqTuvlE3XChog6CtzqWQ6UoiLZhN2qHYEigbjtBPR2QtsykTgtGlNH5D89h4TOB65mlcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8549
X-Proofpoint-GUID: yBsMhTrTAmjUcr5U8U88rnDs-OVCARyr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX+KRmQBgOXoTK
 dR+A9PpK9WOIy2TvrjPRuVGvDFHEwMesosVFlXQXTKDIuUooohhvsHV1UukdItjMY5ZZZfIgZJN
 az1lzbJHjNOY1/VZ/7sEnlzN9uGBko45fF964cCeB50Rz67ayTDSk6mtFx86EvnuiSzN87eSylU
 oOpP3TzkFsCDsMjv5zH2lmrqbGl1f0IFy2aMwKWAwxPW28N66bSczFHfRXXkm6EVKVGm5OnJbkS
 X23tdUM2c+Hi6MpjWSPr7vKhg+OSMQNWEaaA+jy5wIvYz+MthmBna3PDTSfVysOY/zvunCsx6ei
 1WDJ/ixI+rxOVjiAGuFD3fCsvuDaRq/w0/Ni9/x0Wr4d9/Ki830cf3IwoKM0dJI8boDH95OPKXc
 uPs6EClu0rn8ID3dl1+gc6I4a2cE0gF7y1TElFkTmW2qsXnmMe35bMU82osmxgDvftM0yGfeCUR
 8Av9WCm20OtfKd14TrQ==
X-Proofpoint-ORIG-GUID: yBsMhTrTAmjUcr5U8U88rnDs-OVCARyr
X-Authority-Analysis: v=2.4 cv=a7ylZkSF c=1 sm=1 tr=0 ts=6aecf7da cx=c_pps
 a=tCAl8lrDRzME13Kae+DQfw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=1NWNoF9oAAAA:8
 a=y3kz6R_7AAAA:8 a=t7CeM3EgAAAA:8 a=Oh2cFVv5AAAA:8 a=YtZG7y6cae7mfOU4ivkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=qQ7WUwAlJUzEo_zcyjcA:9
 a=yhTQVDN40BWEQ6T9:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=97APRTa-CG6DvPMFVxHL:22 a=8BgCDjaxBFe8hGMl5QJ-:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfXw/QxA/gJglP0
 XQzLoKDLIGP6BSGxY4XKRy6PTIdTYNmHhOPrHKswfy8lXe7MXetueQTvBCE6Y6yc2Dcog71Hsku
 CLPiDYDpOHL9CNv6Z1+AW7iF+K8NpxDBQH0u+yBGKo3MEg53K++R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 21:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131952

--------------8lEVIa7qC89NP9Ry7fbNDFJh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6A5L7Pke506338

On 2026-11-05 13:15, Kanksha Paturi wrote:
> libyuv's CMakeLists.txt hardcodes the install destinations to bin, lib
> and include, so on multilib (lib64) targets the libraries are installed
> to the wrong location and are not packaged.
>
> Add a patch to use GNUInstallDirs (CMAKE_INSTALL_BINDIR,
> CMAKE_INSTALL_LIBDIR, CMAKE_INSTALL_INCLUDEDIR) so files are installed
> to the correct, platform-appropriate directories.
>
> Signed-off-by: Kanksha Paturi<Kanksha.Paturi@windriver.com>
> ---
>   .../recipes-multimedia/libyuv/libyuv.bb       |  4 +-
>   ...se-GNUInstallDirs-for-install-destin.patch | 46 ++++++++++++++++++=
+
>   2 files changed, 49 insertions(+), 1 deletion(-)
>   create mode 100644 meta-multimedia/recipes-multimedia/libyuv/libyuv/0=
001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch
>
> diff --git a/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb b/meta=
-multimedia/recipes-multimedia/libyuv/libyuv.bb
> index bc897830a7..f255626310 100644
> --- a/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
> +++ b/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
> @@ -4,7 +4,9 @@ SECTION =3D "libs"
>   LICENSE =3D "BSD-3-Clause"
>   LIC_FILES_CHKSUM =3D"file://LICENSE;md5=3D464282cfb405b005b9637f11103=
a7325"
>  =20
> -SRC_URI =3D "git://chromium.googlesource.com/libyuv/libyuv;protocol=3D=
https;branch=3Dmain"
> +SRC_URI =3D "git://chromium.googlesource.com/libyuv/libyuv;protocol=3D=
https;branch=3Dmain \
> +file://0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch=
 \
> +           "
>   SRCREV =3D "5a17753597d77dee881d9d93097ca2c2079e9409"
>   PV =3D "0.1+git"
>  =20
> diff --git a/meta-multimedia/recipes-multimedia/libyuv/libyuv/0001-CMak=
eLists.txt-use-GNUInstallDirs-for-install-destin.patch b/meta-multimedia/=
recipes-multimedia/libyuv/libyuv/0001-CMakeLists.txt-use-GNUInstallDirs-f=
or-install-destin.patch
> new file mode 100644
> index 0000000000..6f8cfb4cd3
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libyuv/libyuv/0001-CMakeLists.=
txt-use-GNUInstallDirs-for-install-destin.patch
> @@ -0,0 +1,46 @@
> +From 9eba4aec2de63b6e2e82826f0a2ebd12f1c28e5c Mon Sep 17 00:00:00 2001
> +From: Kanksha Paturi<Kanksha.Paturi@windriver.com>
> +Date: Tue, 27 Oct 2026 15:15:39 +0000
> +Subject: [PATCH] CMakeLists.txt: use GNUInstallDirs for install destin=
ations
> +
> +The install destinations were hardcoded to lib, bin and include. On
> +multilib systems the library directory can be lib64 (or similar), so
> +installing to a hardcoded lib puts the libraries in the wrong place.
> +
> +Use the GNUInstallDirs variables (CMAKE_INSTALL_BINDIR,
> +CMAKE_INSTALL_LIBDIR, CMAKE_INSTALL_INCLUDEDIR) so the files are
> +installed to the correct, platform-appropriate directories.
> +
> +Upstream-Status: Pending
Changes below seems sensible to me.
If this gets merged in meta-oe, please follow-up by sending the change=20
to the upstream
and updating the Upstream-status of the patch.

In general, you should at least open a bug upstream and better still=20
send a patch BEFORE
sending the patch to the Yocto layer. This way, we have fewer issues=20
stuck in Pending for months or years:

Oe-core has largely eliminated "pending" status patches by demanding=20
above behaviour:
https://valkyrie.yocto.io/pub/non-release/patchmetrics/


meta-oe hasn't done as well. Please be part of the solution (rather than=20
part of the precipitate!=C2=A0 (1))!

https://valkyrie.yocto.io/pub/non-release/patchmetrics-meta-oe/


../Randy


1)=20
https://quotle.info/who-said/if-youre-not-part-of-the-solution-youre-part=
-of-the/



> +Signed-off-by: Kanksha Paturi<Kanksha.Paturi@windriver.com>
> +---
> + CMakeLists.txt | 9 +++++----
> + 1 file changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 77e0527f..9bec3ced 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -4,6 +4,7 @@
> +
> + cmake_minimum_required( VERSION 3.16 )
> + project ( YUV C CXX )	# "C" is required even for C++ projects
> ++include ( GNUInstallDirs )
> + option( UNIT_TEST "Built unit tests" OFF )
> +
> + include(CheckCSourceCompiles)
> +@@ -242,10 +243,10 @@ endif()
> +
> +
> + # install the conversion tool, .so, .a, and all the header files
> +-install ( TARGETS yuvconvert DESTINATION bin )
> +-install ( TARGETS ${ly_lib_static}						DESTINATION lib )
> +-install ( TARGETS ${ly_lib_shared} LIBRARY DESTINATION lib RUNTIME DE=
STINATION bin ARCHIVE DESTINATION lib )
> +-install ( DIRECTORY ${PROJECT_SOURCE_DIR}/include/		DESTINATION inclu=
de )
> ++install ( TARGETS yuvconvert DESTINATION ${CMAKE_INSTALL_BINDIR} )
> ++install ( TARGETS ${ly_lib_static} DESTINATION ${CMAKE_INSTALL_LIBDIR=
} )
> ++install ( TARGETS ${ly_lib_shared} LIBRARY DESTINATION ${CMAKE_INSTAL=
L_LIBDIR} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} ARCHIVE DESTINATION=
 ${CMAKE_INSTALL_LIBDIR} )
> ++install ( DIRECTORY ${PROJECT_SOURCE_DIR}/include/ DESTINATION ${CMAK=
E_INSTALL_INCLUDEDIR} )
> +
> + # create the .deb and .rpm packages using cpack
> + include ( CM_linux_packages.cmake )


--=20
# Randy MacLeod
# Wind River Linux

--------------8lEVIa7qC89NP9Ry7fbNDFJh
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-11-05 13:15, Kanksha Paturi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261105181533.2975485-1-Kanksha.Paturi@windriver.com">
      <pre wrap="" class="moz-quote-pre">libyuv's CMakeLists.txt hardcodes the install destinations to bin, lib
and include, so on multilib (lib64) targets the libraries are installed
to the wrong location and are not packaged.

Add a patch to use GNUInstallDirs (CMAKE_INSTALL_BINDIR,
CMAKE_INSTALL_LIBDIR, CMAKE_INSTALL_INCLUDEDIR) so files are installed
to the correct, platform-appropriate directories.

Signed-off-by: Kanksha Paturi <a class="moz-txt-link-rfc2396E" href="mailto:Kanksha.Paturi@windriver.com">&lt;Kanksha.Paturi@windriver.com&gt;</a>
---
 .../recipes-multimedia/libyuv/libyuv.bb       |  4 +-
 ...se-GNUInstallDirs-for-install-destin.patch | 46 +++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libyuv/libyuv/0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch

diff --git a/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb b/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
index bc897830a7..f255626310 100644
--- a/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
+++ b/meta-multimedia/recipes-multimedia/libyuv/libyuv.bb
@@ -4,7 +4,9 @@ SECTION = &quot;libs&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=464282cfb405b005b9637f11103a7325">&quot;file://LICENSE;md5=464282cfb405b005b9637f11103a7325&quot;</a>
 
-SRC_URI = &quot;git://chromium.googlesource.com/libyuv/libyuv;protocol=https;branch=main&quot;
+SRC_URI = &quot;git://chromium.googlesource.com/libyuv/libyuv;protocol=https;branch=main \
+           <a class="moz-txt-link-freetext" href="file://0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch">file://0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch</a> \
+           &quot;
 SRCREV = &quot;5a17753597d77dee881d9d93097ca2c2079e9409&quot;
 PV = &quot;0.1+git&quot;
 
diff --git a/meta-multimedia/recipes-multimedia/libyuv/libyuv/0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch b/meta-multimedia/recipes-multimedia/libyuv/libyuv/0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch
new file mode 100644
index 0000000000..6f8cfb4cd3
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libyuv/libyuv/0001-CMakeLists.txt-use-GNUInstallDirs-for-install-destin.patch
@@ -0,0 +1,46 @@
+From 9eba4aec2de63b6e2e82826f0a2ebd12f1c28e5c Mon Sep 17 00:00:00 2001
+From: Kanksha Paturi <a class="moz-txt-link-rfc2396E" href="mailto:Kanksha.Paturi@windriver.com">&lt;Kanksha.Paturi@windriver.com&gt;</a>
+Date: Tue, 27 Oct 2026 15:15:39 +0000
+Subject: [PATCH] CMakeLists.txt: use GNUInstallDirs for install destinations
+
+The install destinations were hardcoded to lib, bin and include. On
+multilib systems the library directory can be lib64 (or similar), so
+installing to a hardcoded lib puts the libraries in the wrong place.
+
+Use the GNUInstallDirs variables (CMAKE_INSTALL_BINDIR,
+CMAKE_INSTALL_LIBDIR, CMAKE_INSTALL_INCLUDEDIR) so the files are
+installed to the correct, platform-appropriate directories.
+
+Upstream-Status: Pending</pre>
    </blockquote>
    Changes below seems sensible to me.<br>
    If this gets merged in meta-oe, please follow-up by sending the
    change to the upstream<br>
    and updating the Upstream-status of the patch.<br>
    <br>
    In general, you should at least open a bug upstream and better still
    send a patch BEFORE<br>
    sending the patch to the Yocto layer. This way, we have fewer issues
    stuck in Pending for months or years:<br>
    <br>
    Oe-core has largely eliminated &quot;pending&quot; status patches by demanding
    above behaviour:<br>
    <a class="moz-txt-link-freetext" href="https://valkyrie.yocto.io/pub/non-release/patchmetrics/">https://valkyrie.yocto.io/pub/non-release/patchmetrics/</a><br>
    <p><br>
    </p>
    <p>meta-oe hasn't done as well. Please be part of the solution
      (rather than part of the precipitate!&nbsp; (1))!&nbsp;</p>
    <p><a class="moz-txt-link-freetext" href="https://valkyrie.yocto.io/pub/non-release/patchmetrics-meta-oe/">https://valkyrie.yocto.io/pub/non-release/patchmetrics-meta-oe/</a></p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>1)
<a class="moz-txt-link-freetext" href="https://quotle.info/who-said/if-youre-not-part-of-the-solution-youre-part-of-the/">https://quotle.info/who-said/if-youre-not-part-of-the-solution-youre-part-of-the/</a><br>
      <br>
      <br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20261105181533.2975485-1-Kanksha.Paturi@windriver.com">
      <pre wrap="" class="moz-quote-pre">
+Signed-off-by: Kanksha Paturi <a class="moz-txt-link-rfc2396E" href="mailto:Kanksha.Paturi@windriver.com">&lt;Kanksha.Paturi@windriver.com&gt;</a>
+---
+ CMakeLists.txt | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 77e0527f..9bec3ced 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,6 +4,7 @@
+ 
+ cmake_minimum_required( VERSION 3.16 )
+ project ( YUV C CXX )	# &quot;C&quot; is required even for C++ projects
++include ( GNUInstallDirs )
+ option( UNIT_TEST &quot;Built unit tests&quot; OFF )
+ 
+ include(CheckCSourceCompiles)
+@@ -242,10 +243,10 @@ endif()
+ 
+ 
+ # install the conversion tool, .so, .a, and all the header files
+-install ( TARGETS yuvconvert DESTINATION bin )
+-install ( TARGETS ${ly_lib_static}						DESTINATION lib )
+-install ( TARGETS ${ly_lib_shared} LIBRARY DESTINATION lib RUNTIME DESTINATION bin ARCHIVE DESTINATION lib )
+-install ( DIRECTORY ${PROJECT_SOURCE_DIR}/include/		DESTINATION include )
++install ( TARGETS yuvconvert DESTINATION ${CMAKE_INSTALL_BINDIR} )
++install ( TARGETS ${ly_lib_static} DESTINATION ${CMAKE_INSTALL_LIBDIR} )
++install ( TARGETS ${ly_lib_shared} LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR} )
++install ( DIRECTORY ${PROJECT_SOURCE_DIR}/include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR} )
+ 
+ # create the .deb and .rpm packages using cpack
+ include ( CM_linux_packages.cmake )
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------8lEVIa7qC89NP9Ry7fbNDFJh--
