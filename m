Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3683.1793657550402879299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 14:12:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=mzHN7p9Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=576698308e=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K75ZZ1257119
	for <openembedded-devel@lists.openembedded.org>; Mon, 2 Nov 2026 14:12:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=rmq4cMyPMJuVnXAt84/lhA
	ikDCZvw0gyxTD0PNCR3pU=; b=mzHN7p9QKCN5xaV80TEw0jl1uDHS8ghOS6p2rI
	QV54CV8oaoqrpQ01q6UcNANHFAbt85BfpHTXKegPNbgdacxbKVjCQe7rMe7IpJe+
	RizXRzZl+laHQKyB6rw/pQ3ZIIiaBPWN31aacFYLCMUlRQmpKM/Do/X/5jhX1Sy8
	o+vhRgWjDZWNLaok4kxj0NlqMSqZXgCkDb4f+kYWt3K5G16fcalIzIWiLABI9nSA
	0DQYcRIwX/qawWFFhrLjLVACj7Dg1BgCJUpy3zM1eVNrc1lCqJGDNJRIQBqoQ+v7
	JKOQBlGroDWf3Z//WOhw7kFfRAP5OT7F8lJuY4rIHltzve+w==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021127.outbound.protection.outlook.com [40.93.194.127])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hnbm1k249-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 14:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=deJzP+Ey69fW9tD4lLi8OirXRY4O21PfbIRWnlmzrA7M01eUGL+vp5fmOOTEuy6lqrgvh9qI7eqVp+bmZI0J7/aEeDXu5HRtl9IPD83lyyYHUGMGdXy8K0fOu0XvABtKGQG2qwDKvEZ5I1ui7z15uS5SDTSDujnHgB69JMr8rSKDizpbSHj4Z5bsjz6Sof+Ql6huGbtmdSSQTy89FuhfiiqGkzmHUXUiJrL2q5Wngs9vXNwfQN0UDYkR2EE4s2QLwq96eckHufRnvV54qF+7CsJdRacrkctzRpZY2Eh6+kjNy5qN8j2TmChAp6FfoC/KcllsmFyicSylc4T8A3sCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmq4cMyPMJuVnXAt84/lhAikDCZvw0gyxTD0PNCR3pU=;
 b=p1efwxUnXNaSA3smcU2Dux17nuKcIi2Oj5cgK89C38Rr8qvh30RAuYLKYP2NmFZ+YqWItPU2uuO1jbMEvoMri0DJzRnZ5WlZeXcYKN729JNXnWiWirrsi4+peTXCjqrIWCKnulroupsGKujQNwJli1rmBmjqJ1CwAhje1wCMsXVDzckzMYQNFr09VWu6j4r3SSCDQiF4M2Byz0Leed480pifBXF3mD9Ky3iLJ7NQRyY/ZmV5RdhwQhq9wdxBvJ8M0YiLK6h9RpUA36H7x7ZOYrgT/LDCk8iaB6hmQaUcJ+ZVlKIsOJOWtKATBa6UKmccgrO71NjtvgqV/uQ+1ZX0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 DS0PR11MB6494.namprd11.prod.outlook.com (2603:10b6:8:c2::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 2 Nov 2026 22:12:24 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 22:12:24 +0000
Content-Type: multipart/alternative;
 boundary="------------Bx2o0300NjSBb0h02R4Ff0Bc"
Message-ID: <bf949ee3-541e-4d30-b936-4c3531c85819@windriver.com>
Date: Mon, 2 Nov 2026 16:12:21 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-python][PATCH] python3-pillow: patch CVE-2026-112393
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20261102211142.319090-1-kris.gavvala@windriver.com>
 <CANx9H-CZOy=w20RLOooL8=AJdd6_cZ2RpHCai-GwXGWRkzu47Q@mail.gmail.com>
Content-Language: en-US
From: Kris Gavvala <kris.gavvala@windriver.com>
In-Reply-To: <CANx9H-CZOy=w20RLOooL8=AJdd6_cZ2RpHCai-GwXGWRkzu47Q@mail.gmail.com>
X-ClientProxiedBy: PH8P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::34) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|DS0PR11MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: d128e304-777c-41e6-098f-08df392e5f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|4022899009|52116014|23010399003|1800799024|376014|6133799003|10067099003|18002099003|22082099003|261102123227099003|13003099007|8096899003|3023799007|4133799003|56012099006|4143699003|11063799006|261022115727099003|261022105027099003|261026121527099003|261026135527099003|261022075727099003|261021133027099003|261026140227099003|261009223027099003|261022113327099003|261026130827099003|261028144727099003|261021121427099003|38350700014|261021123027099003|261021130227099003|260925021311599003|260925022911599003|260925021911599003|261021135927099003;
X-Microsoft-Antispam-Message-Info: V47RD7BDCiuVaTRXBIvP4llLbi9CaXd9EKhXwr29zsfvR6jJpPSjoKgcxA0HZU9hLAz/0El0yrXjnSeEvaHp544ZSc0OqyxSzbpy7NTHJm65tO8GbyLDQVKa5qX7j3gau30JK0CJvuOuUE9BJvK6W8o+908PwBBekZ5D9svUaht3L9CTwU7hd+tJNxhjtqAm+6s51LjWrI4aQySYH7KmrkP/vBpDChEFh4s0Q5DXja/OVB3beJxaUYkBs5KvAYjUz7yXCHkiM84mumUNJ0wqKQZq3ZRJauTihNgrm3r4jgykKezXfKpFQomIoa417cMpR6HmaLqyb9vys0LqJ1kt4IsIPV5AqLXpu35JWQe13e4ABuWM4K/ISbL7gusGJO3LDMAP+XDqEV1J13RzMPpExC12nvc1F+xZJeqncg6CyeruWrC1PenRwZMYh3XorC55Nzk6m8qrb7MKKqagfMs9aGoGtwGb+GTLe/RXHRUzOxCHWbnh26eINjnvVCNodyEtjPoN6ttL97f4Hqj/s5K6WfJqYA9yUIcoH4CO8vzw1H5JwwDlGkyhLX8uIZ2pysPkj5O/DELy7wjQ4lzixzyUPsCWUMcZ13l0UKDRAuHNfRtitezpdY2GbTi2UfECkIXjj1isr/Qoxj8ll6W2jcr5DwAh860tbW59llXYuNDE/Xk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(52116014)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(261102123227099003)(13003099007)(8096899003)(3023799007)(4133799003)(56012099006)(4143699003)(11063799006)(261022115727099003)(261022105027099003)(261026121527099003)(261026135527099003)(261022075727099003)(261021133027099003)(261026140227099003)(261009223027099003)(261022113327099003)(261026130827099003)(261028144727099003)(261021121427099003)(38350700014)(261021123027099003)(261021130227099003)(260925021311599003)(260925022911599003)(260925021911599003)(261021135927099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUNIZWg2a3YvUUNXT2J5bzJsTWdrcy9EUUQwbkQyc2tNeURqRFYxdld5SFpm?=
 =?utf-8?B?cHpaMFdhZ3pBdWJLOGhDMUNhUytpblJoQkxTMm5DaUxISkJyVEpiUTU3ZXZ5?=
 =?utf-8?B?UHIxMmswOXk0N0RTd1B2eU52UFZrbzN6OGpSN3dWalQvSGp6eFFxUXJmejlv?=
 =?utf-8?B?WmNETitVL2VWUjFTek1Fd2VqakhBOTUzd0pnMGh3Q0xYUGFLOWhBMGt4bXhI?=
 =?utf-8?B?RzlNM0thY1Zna1o4am54eFBPQms0b1pIY3E2S3ozb0orbHliU2Z0blpGZHQ5?=
 =?utf-8?B?YjlOMy9jR0xYWnY1UnZoN2N1UzZJWHpjazFyb1lBa0MydHpiZkZudWE4bEdq?=
 =?utf-8?B?TFJacWtWdFVTZWJOQ3czdjJ5TVl1NDdMTkl4VjZZajJDdzlWeWE0QWlCb0wr?=
 =?utf-8?B?Z2NVVDNSK1pVUjNDSmZuY3dtRHB6QU5ucmh6K1pFemJDSVgvM1lEZjJaZkMz?=
 =?utf-8?B?dlR2OFkrWTlDL0NGMExJRnk2VHcvSC9ZWUltdVJidklIR1dKRlZOcmFzdFFO?=
 =?utf-8?B?dy9tSzhxUXdBb2c5UDFDZUh6TGptQ0ZsTnVHZ3BiVDRONVBLeDZOSXd1ekYv?=
 =?utf-8?B?OHlYbWZRcjZJWUp2dzh0SDdTVkJTWWZKb04xSmZ3RjZJYi9ySXVNQ0pBSUhK?=
 =?utf-8?B?R2htUlF1Mm5RcnJrb2NLYTBEMDhjWVIyWGg2QU9OdDJmV3V0a2lKbDFBOGhm?=
 =?utf-8?B?bGJWUEdHSloyL202Q0dTMjZCUDNaRW0raldsNUQwRTZNL3Vra1JpMElNZGtE?=
 =?utf-8?B?WU9NQkZ2eWpYdy9naTRqa1h6UjVNd0JNOGtybWpXUnNBTlN1L2xDRTVuMmJo?=
 =?utf-8?B?YXBCbXlVNTdiSDJZT1puaDRsTDNwWkpzcDhublROajVUQ3JnbUdDMlFCRjF5?=
 =?utf-8?B?QTVHS0RrcUc3WTVuQ2M2SGhyTEhKeVYycDB6RVZNVDdJZGMxYm9QaFluM3BY?=
 =?utf-8?B?aWxtZUFMNThXV3U4T29vTGRkTzV3SHMrcEpaSDJ3UFpvSWZjeEMyTUoxRmRo?=
 =?utf-8?B?enQ1ZVIzNGdIUlhYVW4ydEZsTS82L1V3MWwvWlNNTi9jd29GS1dWSzdVQ2Yr?=
 =?utf-8?B?QzBzTTM3ei9JUk9Kc3lBRmgrTGh2MzlhWkFIWlB4WEFjclc2ZWFJbnRVZmdz?=
 =?utf-8?B?NnpHaW9wME54b1pYaWZySXBpK2QzSE1hekxEcjBVWmJWcUtoYWdubklWZFpz?=
 =?utf-8?B?eUVVd005U1ZjRHR2VDAwdERsZFJUOVkrMVp5eGJWQjJwNjROems2YncxR1Vi?=
 =?utf-8?B?RDgvd1A4Nm9jbFF2dnpJMkE1cW9kdUp6S0hVR2J6WjRGODVXR0dBWjlPVUEx?=
 =?utf-8?B?N1g3N0RGem5DQTZRcEtaTW8yVlBPNDJJV0hiV1ZMTkttalBQeDRObFNVcnMv?=
 =?utf-8?B?WEFQQjJZTVpNWmFoTW8wbkFVY204ZU5JK3JuaTlJaWpaakNPdExBM2E1Q0E1?=
 =?utf-8?B?ZXhXaWVqaHR1TnVqTzh4aURJZi96dTFTMWNZM3JxazMvcnNDbHFuTmpKZEIz?=
 =?utf-8?B?eGdyaUdqajdIMDF0SUJSVVlEc29OU3krWGYybFYrYVBQWmZrWFp0TUF5ZzRi?=
 =?utf-8?B?dUU1cHk5TGV2ZS94ZkV3aGtYd3dEUUJBVDF1Q01XUUlBUk96VDdqVmhka3hi?=
 =?utf-8?B?SEptcmpXa2FLaCtLRktBNUNCbFVrLzRIczhiQ04wU3gxSEtTN2toZDZGSzdI?=
 =?utf-8?B?cHRyS2tDUklSd3I5MmNmT3BwcFY5VWtuR1cyNXJ6SDJaK3Y5YTk1czRiS2hL?=
 =?utf-8?B?VmxsbmU3M0JrYVRjZFRZK0M0aW9iM3IrUTBDMGZRMU5LZzcyZmtWdzZpT3Vo?=
 =?utf-8?B?ZnhHNjl6RDRrdjI2cFo4TmpqcFkwRzdWRzU5dFN3NkJpc3RqcG0vWWVvZWEy?=
 =?utf-8?B?QWsrd1A3ZWc5SWR5QXR5R0l4R0IwcFljMzVvZHF2c0JqQ0x4eEhpK0haNGpn?=
 =?utf-8?B?MmFMWVdMeWF6VlZpajNNZG1jazl5aDdyTWo3endXR2hscUc2YVlGaWFpaUcx?=
 =?utf-8?B?c25laXpmTUV3V2h5TE9MZUN0dmZERnFOTG1ZalNyY1FCWGh2RFBMV04yK080?=
 =?utf-8?B?T0pCWCtHdUJKVzA2djdtQ3E4OHN5UjZhc2EyeUxmVTV3d3VucmlLb3UrMUFX?=
 =?utf-8?B?ZWRSSkYxSG5pQXYwSWZMS25LUGVHTjlNcVBWQ085TC8xN3pGZUM1aEVRN1RD?=
 =?utf-8?B?VUo2UUJFTGprY21PN2pnNDRTMVM2T0RLUEN3ajhwbjZmbXROZTBxZFVIR1JP?=
 =?utf-8?B?Ujc4UDQySVEwSjFtUDZZOURKVGFZWkxXVG5odW1Da291SUJ5cE4zTUhnN1VB?=
 =?utf-8?B?SEI0c3Y0d3ExcmN4YUxLSFYxNm5XcytkQ1p5VXV5d0FPS3FRa216SDhGV1Fh?=
 =?utf-8?Q?YKbWGyt1ubnGVlPc=3D?=
X-Exchange-RoutingPolicyChecked: JZ9c3pORyAlEA4lgO79wEM0Cgzdsoq4pqB9iGcLcAdArz9Ponm/PkUNHGlM4pJgxc704C2qlryg526diyEvEymk5ecBiC515Q/tcZzjKIm7iL+9jf4gdIJhvdqPSOOwESVG6fEQqJ2PICLNZw1X4XJQXuFjnc4qSpAZHilnTb8xyhPJ+FISo7b3NMK3lF4B5fNPEoPKYsysDfeqpX+k4qS9erkQ3KfXsqd3+m2bxi75zMnT94fF4fYIHDsEetfNOjyLhPnKSwv879I6Mwdd2tWfhsM5ICMgnun4fkU0zhu1qGPs1vCYuuve58i6oW+LXvxRmGWl1fBt5lM/U73MSjg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d128e304-777c-41e6-098f-08df392e5f56
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 22:12:24.2257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpI9HLJNUWh0X1RC+DbEYObDdRKvKmWt7T/pHJvM2AbZKQNrJY3D3KOyhemxxxPRQK0RlK1tr4K1ktehR7gHCpJGfoeqO7qCIoCA2B0pXJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6494
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX1XrSzqttaNYs
 iG92xsWYH8NpnF/OZLm4UyiYBzJzdXhf+deoeZ4Yfb8ZWe9jr5oY5fAPFiNVTCscqzxkhGBYaqS
 iXCt4DXB1H8DarRUy9XlPYqwuoc3ikr8qg/EXdLaGqIHfp2AWdau8mwkfjSJuFafDsJ7fmaY+6s
 X+Um2QtYpBDd4RFVegHGUYv6O034b7v2emYAC+KBXGT2BSCEPLH12HG4xxzNdzCzp4IJhgThLU+
 UQFE/oJTxRnEPBNCjdA8fqzKrbKmUvsVpukucBHqBeMMceNNik/C2yqY7PCL7Zh8U3MPTbLDRlB
 z3AaFCQ8869yQsBQWARH9LOsk12cWNepn6nC4FGOAxJyji5WEqJ9XsvzL9ebnsJtFoIJfEU4qUh
 DBsEtAFiRLq/qo5yMpeSHIL/dKSr3XZ06NQP2souPERkmLixiAM7fgIC1n7v43obss1he/HzTr0
 ztc6bzV2qMRpjHtSYcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX1IoiMeuKJ+52
 pHE22sah6wssQKvFtNdxFHcoVS9Kg8e93nMJyzKIA5u6MKMAg61FTE0HyutOrLx2TpYp2YjKvlT
 ZyBy37rCnYC25NDf+uAGm/lcNJmQFf9A33R0Q60ImwX+7sn1Ct5z
X-Proofpoint-ORIG-GUID: z9twhCwfW9YlmkEdOSuPGzGyhHQZCsHv
X-Authority-Analysis: v=2.4 cv=RZsFmFtv c=1 sm=1 tr=0 ts=6ae90acd cx=c_pps
 a=wuCIV2M2hcCPwYkL8T+rjw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=0zhiEtMHAAAA:8 a=cVDaQKIVAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=FvlJRdF6AAAA:8 a=6gl_cCoBAAAA:8 a=pGLkceISAAAA:8 a=pSv9e8PshN0ObxsuqS8A:9
 a=lqcHg5cX4UMA:10 a=PRpDppDLrCsA:10 a=O9Trw71uoXUA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=qdaPzcSIHS-KCo7m72cA:9 a=MbgRabP5zKHqpvGC:21
 a=_W_S_7VecoQA:10 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=TA9h4Yh0XwLceAscMfMp:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=QLZTDCKk5HCdsrdKW35d:22
 a=Bor9z-CvbNo2M6AZn8_k:22
X-Proofpoint-GUID: lfVoznF_azarApZVX9KMkyQa0aSBnfZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 22:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131755

--------------Bx2o0300NjSBb0h02R4Ff0Bc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6A2K75ZZ1257119

Understood. I was going to send the patch to master before backporting=20
to stable releases, but if upgrading is better for master then I will do=20
that.

Thanks,

Kris Gavvala

On 11/2/26 3:37 PM, Tim Orling wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> There is a pillow 13.0.0 release and I would rather see an upgrade=20
> than patches. If this is for a stable release branch, please include=20
> the branch in the subject line, e.g. [wrynose].
>
> On Mon, Nov 2, 2026 at 13:12 Gavvala, Kris via openembedded-devel=20
> <Kris.Gavvala=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     This patch applies the upstream fix and related tests in commit [1]
>     to address the issue in [2].
>
>     [1]
>     https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f774=
65a61d90633f669013f4
>     <https://urldefense.com/v3/__https://github.com/python-pillow/Pillo=
w/commit/78c08bd4d9c08037f77465a61d90633f669013f4__;!!AjveYdw8EvQ!Yojr6Tb=
FBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjCI=
aCNLIw$>
>     [2]
>     https://github.com/python-pillow/Pillow/security/advisories/GHSA-33=
2p-7hrc-92wf
>     <https://urldefense.com/v3/__https://github.com/python-pillow/Pillo=
w/security/advisories/GHSA-332p-7hrc-92wf__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8=
doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjCE5CP-7g$>
>
>     Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
>     ---
>     =C2=A0.../python3-pillow/CVE-2026-112393.patch=C2=A0 =C2=A0 =C2=A0 =
| 124
>     ++++++++++++++++++
>     =C2=A0.../python/python3-pillow_12.3.0.bb
>     <https://urldefense.com/v3/__http://python3-pillow_12.3.0.bb__;!!Aj=
veYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhK=
YBBBDShpjtjSrBjCm5l_KMw$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +
>     =C2=A02 files changed, 125 insertions(+)
>     =C2=A0create mode 100644
>     meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.=
patch
>
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-11239=
3.patch
>     b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-11239=
3.patch
>     new file mode 100644
>     index 0000000000..cb9be3b33e
>     --- /dev/null
>     +++
>     b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-11239=
3.patch
>     @@ -0,0 +1,124 @@
>     +From 9b693ea929423da2bebef5523881ae3850c3877e Mon Sep 17 00:00:00
>     2001
>     +From: Jeffrey 'Alex' Clark <aclark@aclark.net>
>     +Date: Mon, 12 Oct 2026 21:18:41 -0400
>     +Subject: [PATCH] Fix heap buffer overflow in _tiffWriteProc when
>     saving TIFF
>     + to BytesIO
>     +
>     +libtiff seeks past the current end of data when writing the direct=
ory
>     +and writes tag values there. _tiffWriteProc sized its realloc() fr=
om
>     +state->size + size instead of the write position state->loc + size=
,
>     +so the first out-of-line tag value written after such a seek could
>     +overrun the allocation by up to the size of the directory. The byt=
es
>     +skipped by the seek were also never zeroed, leaking stale heap
>     +contents into the saved file.
>     +
>     +Size the buffer from the write position and zero the space added b=
y
>     +realloc, matching the semantics of writing to a real file. Reject
>     +writes where the position is still beyond the buffer for the
>     +non-reallocating case.
>     +
>     +Reported-by: carlini
>     +Reported-by: Tomer-PL
>     +Fixes: GHSA-332p-7hrc-92wf
>     +
>     +Co-authored-by: Copilot
>     <223556219+Copilot@users.noreply.github.com
>     <mailto:223556219%2BCopilot@users.noreply.github.com>>
>     +Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
>     +
>     +CVE: CVE-2026-112393
>     +Upstream-Status: Backport
>     [https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77=
465a61d90633f669013f4
>     <https://urldefense.com/v3/__https://github.com/python-pillow/Pillo=
w/commit/78c08bd4d9c08037f77465a61d90633f669013f4__;!!AjveYdw8EvQ!Yojr6Tb=
FBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjCI=
aCNLIw$>]
>     +
>     +Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
>     +---
>     + Tests/test_file_libtiff.py
>     <https://urldefense.com/v3/__http://test_file_libtiff.py__;!!AjveYd=
w8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBB=
DShpjtjSrBjB4c4M0WA$>=C2=A0
>     | 36 ++++++++++++++++++++++++++++++++++++
>     + src/libImaging/TiffDecode.c | 15 ++++++++++++++-
>     + 2 files changed, 50 insertions(+), 1 deletion(-)
>     +
>     +diff --git a/Tests/test_file_libtiff.py
>     <https://urldefense.com/v3/__http://test_file_libtiff.py__;!!AjveYd=
w8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBB=
DShpjtjSrBjB4c4M0WA$>
>     b/Tests/test_file_libtiff.py
>     <https://urldefense.com/v3/__http://test_file_libtiff.py__;!!AjveYd=
w8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBB=
DShpjtjSrBjB4c4M0WA$>
>     +index c9849a056..84e4299a1 100644
>     +--- a/Tests/test_file_libtiff.py
>     <https://urldefense.com/v3/__http://test_file_libtiff.py__;!!AjveYd=
w8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBB=
DShpjtjSrBjB4c4M0WA$>
>     ++++ b/Tests/test_file_libtiff.py
>     <https://urldefense.com/v3/__http://test_file_libtiff.py__;!!AjveYd=
w8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBB=
DShpjtjSrBjB4c4M0WA$>
>     +@@ -757,6 +757,42 @@ class TestFileLibTiff(LibTiffTestCase):
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save_bytesio("packbits")
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save_bytesio("tiff_lzw")
>     +
>     ++
>     ++=C2=A0 =C2=A0 def test_save_bytesio_seek_past_end(self, tmp_path:=
 Path) ->
>     None:
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # When writing the directory, libtiff=
 seeks past the end
>     of the data
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # written so far, and then writes the=
 tag values there.
>     Check that the
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # in-memory write buffer grows to fit=
, and that the
>     bytes that are
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # skipped over are zero, as they woul=
d be when writing
>     to a file.
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # 7 distinct bytes per row: PackBits =
emits 8 bytes per
>     row, so the strip
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # plus the header are exactly 64 KiB,=
 the initial size
>     of the buffer
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im =3D Image.new("L", (7, 8191))
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im.putdata([(i * 37) & 0xFF for i in =
range(7 * 8191)])
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 kwargs: dict[str, Any] =3D {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "compression": "packbit=
s",
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "description": "D" * 65=
535,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile =3D tmp_path / "temp.tif"
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im.save(outfile, **kwargs)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer_io =3D io.BytesIO()
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im.save(buffer_io, format=3D"tiff", *=
*kwargs)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert buffer_io.getvalue() =3D=3D ou=
tfile.read_bytes()
>     ++
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # odd-length tag values, so that libt=
iff pads between
>     them. Large enough
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 # that the buffer has to be reallocat=
ed
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im =3D hopper().resize((300, 300))
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 kwargs =3D {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "compression": "tiff_lz=
w",
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "description": "abcdef"=
,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "software": "xyz0",
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "tiffinfo": {315: "arti=
st", 33432: "copyright!"},
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im.save(outfile, **kwargs)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer_io =3D io.BytesIO()
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 im.save(buffer_io, format=3D"tiff", *=
*kwargs)
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert buffer_io.getvalue() =3D=3D ou=
tfile.read_bytes()
>     ++
>     +=C2=A0 =C2=A0 =C2=A0def test_save_ycbcr(self, tmp_path: Path) -> N=
one:
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0im =3D hopper("YCbCr")
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outfile =3D tmp_path / "temp.tif=
"
>     +diff --git a/src/libImaging/TiffDecode.c
>     b/src/libImaging/TiffDecode.c
>     +index 72e0d7b30..e21327f02 100644
>     +--- a/src/libImaging/TiffDecode.c
>     ++++ b/src/libImaging/TiffDecode.c
>     +@@ -88,10 +88,12 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf,
>     tsize_t size) {
>     +=C2=A0 =C2=A0 =C2=A0dump_state(state);
>     +
>     +=C2=A0 =C2=A0 =C2=A0to_write =3D min(size, state->size - (tsize_t)=
state->loc);
>     ++=C2=A0 =C2=A0 // libtiff may have seeked past the end of the buff=
er, e.g.
>     when writing the
>     ++=C2=A0 =C2=A0 // directory, so the required size is based on the =
current
>     location.
>     +=C2=A0 =C2=A0 =C2=A0if (state->flrealloc && size > to_write) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tdata_t new_data;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tsize_t newsize =3D state->size;
>     +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (newsize < (size + state->size)=
) {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 while (newsize < (size + (tsize_t)sta=
te->loc)) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (newsize > INT_=
MAX - 64 * 1024) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0retu=
rn 0;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     +@@ -105,9 +107,20 @@ _tiffWriteProc(thandle_t hdata, tdata_t buf,
>     tsize_t size) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// fail out
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // zero the new space, so that any by=
tes libtiff seeks
>     over without
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 // writing are 0 in the output, as th=
ey would be in a file
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset((UINT8 *)new_data + state->siz=
e, 0, newsize -
>     state->size);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state->data =3D new_data;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state->size =3D newsize;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_write =3D size;
>     ++=C2=A0 =C2=A0 } else if (to_write < 0) {
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "_tiffWriteProc",
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "Invalid Write at loc %=
" PRIu64 ", size: %" PRIu64,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 state->loc,
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (toff_t)state->size
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 );
>     ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
>     +=C2=A0 =C2=A0 =C2=A0}
>     +
>     +=C2=A0 =C2=A0 =C2=A0TRACE(("to_write: %d\n", (int)to_write));
>     +--
>     +2.43.0
>     +
>     diff --git
>     a/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
>     <https://urldefense.com/v3/__http://python3-pillow_12.3.0.bb__;!!Aj=
veYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhK=
YBBBDShpjtjSrBjCm5l_KMw$>
>     b/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
>     <https://urldefense.com/v3/__http://python3-pillow_12.3.0.bb__;!!Aj=
veYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhK=
YBBBDShpjtjSrBjCm5l_KMw$>
>     index 1c6668e53d..e4826da1a6 100644
>     --- a/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
>     <https://urldefense.com/v3/__http://python3-pillow_12.3.0.bb__;!!Aj=
veYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhK=
YBBBDShpjtjSrBjCm5l_KMw$>
>     +++ b/meta-python/recipes-devtools/python/python3-pillow_12.3.0.bb
>     <https://urldefense.com/v3/__http://python3-pillow_12.3.0.bb__;!!Aj=
veYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhK=
YBBBDShpjtjSrBjCm5l_KMw$>
>     @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D
>     "file://LICENSE;md5=3Da6f0ac3777cfc96ded1b825e32ae7c99"
>
>     =C2=A0SRC_URI =3D
>     "git://github.com/python-pillow/Pillow.git;branch=3Dmain;protocol=3D=
https;tag=3D${PV}
>     <https://urldefense.com/v3/__http://github.com/python-pillow/Pillow=
.git;branch=3Dmain;protocol=3Dhttps;tag=3D$*7BPV*7D__;JSU!!AjveYdw8EvQ!Yo=
jr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjS=
rBjACWFfxyA$>
>     \
>     file://0001-support-cross-compiling.patch \
>     + file://CVE-2026-112393.patch \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     =C2=A0SRCREV =3D "bb1d8e8ab8d29048624d96e3ee53cecf7c13d13d"
>
>     --=20
>     2.43.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#131753):
>     https://lists.openembedded.org/g/openembedded-devel/message/131753
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/131753__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7=
e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjD0zTu62g$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/122066176/924729
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1220=
66176/924729__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5=
A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjDmoU38zg$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8=
QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjC2b-x1sg$>
>     [ticotimo@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------Bx2o0300NjSBb0h02R4Ff0Bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Understood. I was going to send the patch to master before
      backporting to stable releases, but if upgrading is better for
      master then I will do that.&nbsp;</p>
    <p>Thanks,</p>
    <p>Kris Gavvala</p>
    <div class="moz-cite-prefix">On 11/2/26 3:37 PM, Tim Orling wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANx9H-CZOy=w20RLOooL8=AJdd6_cZ2RpHCai-GwXGWRkzu47Q@mail.gmail.com">
      
      <strong>
      </strong>
      <div style="border: 1pt solid rgb(156, 101, 0); padding: 2pt; background-position: 0% 0%; background-repeat: repeat; background-attachment: scroll; background-image: none; background-size: auto; background-origin: padding-box; background-clip: border-box;"><strong><class="msonormal" style="line-height:11pt"><span style="font-size: 11pt;">CAUTION:
              This email comes from a non Wind River email account!</span></class="msonormal"></strong><br>
        <class="msonormal" style="line-height:10pt3"><span style="font-size: 10pt;">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class="msonormal"></div>
      <div>
        <div dir="auto">There is a pillow 13.0.0 release and I would
          rather see an upgrade than patches. If this is for a stable
          release branch, please include the branch in the subject line,
          e.g. [wrynose].</div>
        <div><br>
          <div class="gmail_quote gmail_quote_container">
            <div dir="ltr" class="gmail_attr">On Mon, Nov 2, 2026 at
              13:12 Gavvala, Kris via openembedded-devel
              &lt;Kris.Gavvala=<a href="mailto:windriver.com@lists.openembedded.org" moz-do-not-send="true" class="moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              This patch applies the upstream fix and related tests in
              commit [1]<br>
              to address the issue in [2].<br>
              <br>
              [1] <a href="https://urldefense.com/v3/__https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjCIaCNLIw$" rel="noreferrer" target="_blank" moz-do-not-send="true">
https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4</a><br>
              [2] <a href="https://urldefense.com/v3/__https://github.com/python-pillow/Pillow/security/advisories/GHSA-332p-7hrc-92wf__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjCE5CP-7g$" rel="noreferrer" target="_blank" moz-do-not-send="true">
https://github.com/python-pillow/Pillow/security/advisories/GHSA-332p-7hrc-92wf</a><br>
              <br>
              Signed-off-by: Kris Gavvala &lt;<a href="mailto:kris.gavvala@windriver.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">kris.gavvala@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;.../python3-pillow/CVE-2026-112393.patch&nbsp; &nbsp; &nbsp; | 124
              ++++++++++++++++++<br>
              &nbsp;.../python/<a href="https://urldefense.com/v3/__http://python3-pillow_12.3.0.bb__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjCm5l_KMw$" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pillow_12.3.0.bb</a>&nbsp;
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;1 +<br>
              &nbsp;2 files changed, 125 insertions(+)<br>
              &nbsp;create mode 100644
              meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch<br>
              <br>
              diff --git
a/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch
b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch<br>
              new file mode 100644<br>
              index 0000000000..cb9be3b33e<br>
              --- /dev/null<br>
              +++
b/meta-python/recipes-devtools/python/python3-pillow/CVE-2026-112393.patch<br>
              @@ -0,0 +1,124 @@<br>
              +From 9b693ea929423da2bebef5523881ae3850c3877e Mon Sep 17
              00:00:00 2001<br>
              +From: Jeffrey 'Alex' Clark &lt;<a href="mailto:aclark@aclark.net" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">aclark@aclark.net</a>&gt;<br>
              +Date: Mon, 12 Oct 2026 21:18:41 -0400<br>
              +Subject: [PATCH] Fix heap buffer overflow in
              _tiffWriteProc when saving TIFF<br>
              + to BytesIO<br>
              +<br>
              +libtiff seeks past the current end of data when writing
              the directory<br>
              +and writes tag values there. _tiffWriteProc sized its
              realloc() from<br>
              +state-&gt;size + size instead of the write position
              state-&gt;loc + size,<br>
              +so the first out-of-line tag value written after such a
              seek could<br>
              +overrun the allocation by up to the size of the
              directory. The bytes<br>
              +skipped by the seek were also never zeroed, leaking stale
              heap<br>
              +contents into the saved file.<br>
              +<br>
              +Size the buffer from the write position and zero the
              space added by<br>
              +realloc, matching the semantics of writing to a real
              file. Reject<br>
              +writes where the position is still beyond the buffer for
              the<br>
              +non-reallocating case.<br>
              +<br>
              +Reported-by: carlini<br>
              +Reported-by: Tomer-PL<br>
              +Fixes: GHSA-332p-7hrc-92wf<br>
              +<br>
              +Co-authored-by: Copilot &lt;<a href="mailto:223556219%2BCopilot@users.noreply.github.com" target="_blank" moz-do-not-send="true">223556219+Copilot@users.noreply.github.com</a>&gt;<br>
              +Co-Authored-By: Claude Opus 5.5 &lt;<a href="mailto:noreply@anthropic.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">noreply@anthropic.com</a>&gt;<br>
              +<br>
              +CVE: CVE-2026-112393<br>
              +Upstream-Status: Backport [<a href="https://urldefense.com/v3/__https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjCIaCNLIw$" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/python-pillow/Pillow/commit/78c08bd4d9c08037f77465a61d90633f669013f4</a>]<br>
              +<br>
              +Signed-off-by: Kris Gavvala &lt;<a href="mailto:kris.gavvala@windriver.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">kris.gavvala@windriver.com</a>&gt;<br>
              +---<br>
              + Tests/<a href="https://urldefense.com/v3/__http://test_file_libtiff.py__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjB4c4M0WA$" moz-do-not-send="true">test_file_libtiff.py</a>&nbsp; | 36
              ++++++++++++++++++++++++++++++++++++<br>
              + src/libImaging/TiffDecode.c | 15 ++++++++++++++-<br>
              + 2 files changed, 50 insertions(+), 1 deletion(-)<br>
              +<br>
              +diff --git a/Tests/<a href="https://urldefense.com/v3/__http://test_file_libtiff.py__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjB4c4M0WA$" moz-do-not-send="true">test_file_libtiff.py</a> b/Tests/<a href="https://urldefense.com/v3/__http://test_file_libtiff.py__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjB4c4M0WA$" moz-do-not-send="true">test_file_libtiff.py</a><br>
              +index c9849a056..84e4299a1 100644<br>
              +--- a/Tests/<a href="https://urldefense.com/v3/__http://test_file_libtiff.py__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjB4c4M0WA$" moz-do-not-send="true">test_file_libtiff.py</a><br>
              ++++ b/Tests/<a href="https://urldefense.com/v3/__http://test_file_libtiff.py__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjB4c4M0WA$" moz-do-not-send="true">test_file_libtiff.py</a><br>
              +@@ -757,6 +757,42 @@ class
              TestFileLibTiff(LibTiffTestCase):<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;save_bytesio(&quot;packbits&quot;)<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;save_bytesio(&quot;tiff_lzw&quot;)<br>
              + <br>
              ++<br>
              ++&nbsp; &nbsp; def test_save_bytesio_seek_past_end(self, tmp_path:
              Path) -&gt; None:<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; # When writing the directory, libtiff seeks past
              the end of the data<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; # written so far, and then writes the tag values
              there. Check that the<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; # in-memory write buffer grows to fit, and that
              the bytes that are<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; # skipped over are zero, as they would be when
              writing to a file.<br>
              ++<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; # 7 distinct bytes per row: PackBits emits 8
              bytes per row, so the strip<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; # plus the header are exactly 64 KiB, the
              initial size of the buffer<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; im = Image.new(&quot;L&quot;, (7, 8191))<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; im.putdata([(i * 37) &amp; 0xFF for i in range(7
              * 8191)])<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; kwargs: dict[str, Any] = {<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;compression&quot;: &quot;packbits&quot;,<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;description&quot;: &quot;D&quot; * 65535,<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; }<br>
              ++<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; outfile = tmp_path / &quot;temp.tif&quot;<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; im.save(outfile, **kwargs)<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; buffer_io = io.BytesIO()<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; im.save(buffer_io, format=&quot;tiff&quot;, **kwargs)<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; assert buffer_io.getvalue() ==
              outfile.read_bytes()<br>
              ++<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; # odd-length tag values, so that libtiff pads
              between them. Large enough<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; # that the buffer has to be reallocated<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; im = hopper().resize((300, 300))<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; kwargs = {<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;compression&quot;: &quot;tiff_lzw&quot;,<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;description&quot;: &quot;abcdef&quot;,<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;software&quot;: &quot;xyz0&quot;,<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;tiffinfo&quot;: {315: &quot;artist&quot;, 33432:
              &quot;copyright!&quot;},<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; }<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; im.save(outfile, **kwargs)<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; buffer_io = io.BytesIO()<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; im.save(buffer_io, format=&quot;tiff&quot;, **kwargs)<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; assert buffer_io.getvalue() ==
              outfile.read_bytes()<br>
              ++<br>
              +&nbsp; &nbsp; &nbsp;def test_save_ycbcr(self, tmp_path: Path) -&gt;
              None:<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;im = hopper(&quot;YCbCr&quot;)<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;outfile = tmp_path / &quot;temp.tif&quot;<br>
              +diff --git a/src/libImaging/TiffDecode.c
              b/src/libImaging/TiffDecode.c<br>
              +index 72e0d7b30..e21327f02 100644<br>
              +--- a/src/libImaging/TiffDecode.c<br>
              ++++ b/src/libImaging/TiffDecode.c<br>
              +@@ -88,10 +88,12 @@ _tiffWriteProc(thandle_t hdata,
              tdata_t buf, tsize_t size) {<br>
              +&nbsp; &nbsp; &nbsp;dump_state(state);<br>
              + <br>
              +&nbsp; &nbsp; &nbsp;to_write = min(size, state-&gt;size -
              (tsize_t)state-&gt;loc);<br>
              ++&nbsp; &nbsp; // libtiff may have seeked past the end of the
              buffer, e.g. when writing the<br>
              ++&nbsp; &nbsp; // directory, so the required size is based on the
              current location.<br>
              +&nbsp; &nbsp; &nbsp;if (state-&gt;flrealloc &amp;&amp; size &gt;
              to_write) {<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tdata_t new_data;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tsize_t newsize = state-&gt;size;<br>
              +-&nbsp; &nbsp; &nbsp; &nbsp; while (newsize &lt; (size + state-&gt;size)) {<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; while (newsize &lt; (size +
              (tsize_t)state-&gt;loc)) {<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (newsize &gt; INT_MAX - 64 * 1024) {<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
              +@@ -105,9 +107,20 @@ _tiffWriteProc(thandle_t hdata,
              tdata_t buf, tsize_t size) {<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;// fail out<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return 0;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; // zero the new space, so that any bytes libtiff
              seeks over without<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; // writing are 0 in the output, as they would be
              in a file<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; memset((UINT8 *)new_data + state-&gt;size, 0,
              newsize - state-&gt;size);<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;state-&gt;data = new_data;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;state-&gt;size = newsize;<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;to_write = size;<br>
              ++&nbsp; &nbsp; } else if (to_write &lt; 0) {<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; TIFFError(<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;_tiffWriteProc&quot;,<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;Invalid Write at loc %&quot; PRIu64 &quot;, size: %&quot;
              PRIu64,<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; state-&gt;loc,<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (toff_t)state-&gt;size<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; );<br>
              ++&nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
              +&nbsp; &nbsp; &nbsp;}<br>
              + <br>
              +&nbsp; &nbsp; &nbsp;TRACE((&quot;to_write: %d\n&quot;, (int)to_write));<br>
              +-- <br>
              +2.43.0<br>
              +<br>
              diff --git a/meta-python/recipes-devtools/python/<a href="https://urldefense.com/v3/__http://python3-pillow_12.3.0.bb__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjCm5l_KMw$" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pillow_12.3.0.bb</a>
              b/meta-python/recipes-devtools/python/<a href="https://urldefense.com/v3/__http://python3-pillow_12.3.0.bb__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjCm5l_KMw$" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pillow_12.3.0.bb</a><br>
              index 1c6668e53d..e4826da1a6 100644<br>
              --- a/meta-python/recipes-devtools/python/<a href="https://urldefense.com/v3/__http://python3-pillow_12.3.0.bb__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjCm5l_KMw$" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pillow_12.3.0.bb</a><br>
              +++ b/meta-python/recipes-devtools/python/<a href="https://urldefense.com/v3/__http://python3-pillow_12.3.0.bb__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjCm5l_KMw$" rel="noreferrer" target="_blank" moz-do-not-send="true">python3-pillow_12.3.0.bb</a><br>
              @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =
              <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a6f0ac3777cfc96ded1b825e32ae7c99">&quot;file://LICENSE;md5=a6f0ac3777cfc96ded1b825e32ae7c99&quot;</a><br>
              <br>
              &nbsp;SRC_URI = &quot;<a class="moz-txt-link-freetext" href="git://">git://</a><a href="https://urldefense.com/v3/__http://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=$*7BPV*7D__;JSU!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjACWFfxyA$" rel="noreferrer" target="_blank" moz-do-not-send="true">github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV}</a>
              \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a class="moz-txt-link-freetext" href="file://0001-support-cross-compiling.patch">file://0001-support-cross-compiling.patch</a> \<br>
              +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class="moz-txt-link-freetext" href="file://CVE-2026-112393.patch">file://CVE-2026-112393.patch</a> \<br>
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br>
              &nbsp;SRCREV = &quot;bb1d8e8ab8d29048624d96e3ee53cecf7c13d13d&quot;<br>
              <br>
              -- <br>
              2.43.0<br>
              <br>
              <br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#131753): <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/message/131753__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjD0zTu62g$" rel="noreferrer" target="_blank" moz-do-not-send="true">
https://lists.openembedded.org/g/openembedded-devel/message/131753</a><br>
              Mute This Topic: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/mt/122066176/924729__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjDmoU38zg$" rel="noreferrer" target="_blank" moz-do-not-send="true">
                https://lists.openembedded.org/mt/122066176/924729</a><br>
              Group Owner: <a href="mailto:openembedded-devel%2Bowner@lists.openembedded.org" target="_blank" moz-do-not-send="true">
                openembedded-devel+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href="https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!Yojr6TbFBodsGm8doMeEs_UcyjH7e95BjPHg8QK8OTo5A3Dy0OcRIOfKF7EtrhKYBBBDShpjtjSrBjC2b-x1sg$" rel="noreferrer" target="_blank" moz-do-not-send="true">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:ticotimo@gmail.com" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">ticotimo@gmail.com</a>]<br>
              -=-=-=-=-=-=-=-=-=-=-=-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------Bx2o0300NjSBb0h02R4Ff0Bc--
