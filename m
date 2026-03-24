Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEDCF532EC
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 08:06:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14835.1774339553997871871
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 01:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=j4gVHacA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7543dbf287=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O5Z2OK2164585
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 01:05:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=OdtrAVfypMNtFgXfxUGRdUPR2SlpOkeHWAHP9koZebw=; b=j4gVHacAMEEr
	USAYMJk1BPtowlAMPkktJ+IjGyNSVc413J1DLav1KuLrjh2EIJ2F0tW+5AAPzug0
	mlN0dQceGz6tgSFOB/DYprU1RaKsJdPwL74hiJVS/gdF71m2EpaVo1UORKOtMqt7
	78MUt0oDLQADsqpvy/4cZ6QklkjVMMjs+i4iBGFZXtCxHIa5KVdoFEORKersDiyj
	NYEAw1Km/zKDOoGqJxkUaGBZexV0uRlFGYo8KWjtLpeMHnmtL1LDxbCmQIfBrEEg
	4QZaVs/7A/eQmC/qjqurTNmnoz+bMIkbjun/E9r5Wzwd3OJXBolDU5ruFrkpR7++
	ttUnmCYP7g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012018.outbound.protection.outlook.com [52.101.43.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1tuctqvw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 01:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdrxnGua3BsyWjHJCN4Zsq/d4EzOsqCVgBj+z8wg7m+x72BkF5mKWq1KwreYILw6ReTJ3ENcfK5ue6i8/A6tmHydgaxpH4i5wSk78kZfctuwjrOpdHo2H2zxvthml2StTussVLzZsmBe4JMWTJ5PN/q+iUDwww5m25Ko4TBFXAeR5GHPHFWx8JjTTmu1YCssLjZukv8KRNO1W/sQ+Zv6kpJX5tNnhfdaOETpvZrHnryMlQWCyVHN0SXzTMe4a7N9mYCEWNavasNTgPrE3u9tUx8I6oEGvqnE/LUiSUXmSQjTv+jAtnFnfhERfENTaToSwT7i8CCNMYmHMy0aB0xFrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdtrAVfypMNtFgXfxUGRdUPR2SlpOkeHWAHP9koZebw=;
 b=c348yTXrCbBRve+Y2KKjVSC5Igi26KSAMDP0TQgJXP0SqAFdbau0MOwrzwwo/tJcXHucqK7ETbaP6qbHOiqmK8kkLOlBU8iIrabVmf7x7rjD88OKEuDxM6WlZUIIi1N3R6a4tKOB9bbqlewOocf8saf7YLxMCuUJ6IE5BHbDxPcz2cRQsAYGIMjT+KtaSsI3CHh2gmTYU4cECTc+FYZRBI7KpVMMUnU5aR6+UV11atvu+ig/9NXinNjK1Ey2aQZxgVQuFyslMRjgQfEpR1Zdh+NxkxIEWotra6JTjhSa5mFdT6T0eGYuM31Ohoemn0nL/DPV85FVqvTPdfUE9WqNTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SA1PR11MB8523.namprd11.prod.outlook.com (2603:10b6:806:3b5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 08:05:51 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 08:05:50 +0000
Message-ID: <8b2343c3-f3de-442a-8e9a-548afdfa5c1c@windriver.com>
Date: Tue, 24 Mar 2026 16:05:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][PATCH] postgresql: add ptest support
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20260324071621.3104812-1-guocai.he.cn@windriver.com>
 <b5a48fa9-8a5e-4530-89d9-4c7d939c4b45@gmail.com>
Content-Language: en-US
From: "He, Guocai" <guocai.he.cn@windriver.com>
In-Reply-To: <b5a48fa9-8a5e-4530-89d9-4c7d939c4b45@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SE2P216CA0123.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::8) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SA1PR11MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d21c036-5766-4999-2aa7-08de897c2a0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	/4jCKCpFgidF2CLCsM1zELBaIGS2Afsfkvzw9VgX8xNaoOktzaAbbL8JuM0J42rdfaZ3MdmSazJHRXNfy6HyrCWkmxh2KYZez0fNRICEytrSWEKMfRgGGjIZdafRf7FtNFbixMUI4Sy3oRrhUpmP978ckTiHl8M5Rp3FPr9MuUhbhgJ2DJGWyjzdZ/28xZrrXBsPiDAYlhPpVqosUnZZMx78D/HsoBaOe/9QXWLwwKnuUVGG5J+PDdZj5GbtkKXyibAXvcOszLAEr5sDTh0Et+xRB+yAG44/+oDkhxhjwbKRHCpkGntLp1PB3nY9Lv4Mv0H7u11vYI8HxWhTXpI/frsXQVhcbpGil+ncTCApf+/G2QMyJTd4bO0ADnxD1BweGmh+/eMXqxOSZLM8fYnEVjvsZwUHBIPZf2MrUcKPFs5EtxnpoBUp1R2zCVeZ7CAZHOs7auqcY8TXNq0vv7XonhDZ5HHt0TstKScA+JCvFadyR43jsvB7FdznI3L4kCfhLZECLB2Yafbo8pZgtVO/xKXaxGKJCrXJD3Y3qwYwOnCWDdYLOko6U7netKlsx4Zlp4Zml0sKCrsDLRDTovvQF0npqWwZio7VFAQA1YjiOqa7AqHwKEyvArk6lAtHsgQTDrdR97ecJ2Be+cETmWv4GzwV//hKdTlGsMylgWiJJSFSrGABUDMEt24ZjI0vaKpO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NkxLR0RRQ3JycEJkSGFjMFRkdFNHVjdqNW1taE5YZkZLR1ZmVGdKWGYwQ1RP?=
 =?utf-8?B?K2hFNkxYc2ZjMGpreXI5Z2VCbmdMeVhDc3BsOXpuMW53OGcydzlTa3FtbmpE?=
 =?utf-8?B?UWVjY1lHTHJkQXVYZDZxdVJqdlMzc3hUT3VkZWZGTEFQeXlORTdMTlVXRGtt?=
 =?utf-8?B?S3hGWEFYY0Z2Z0s3Qng0QldMZzFCb2N5NmljOXNHSDlha05CdlFXcTJjaWpQ?=
 =?utf-8?B?ZGZiMW9kRElwOXNSZVNoSnMrK2ZqTmNtYzB4b2ZjWjBiQWt0MG5qempCY0hO?=
 =?utf-8?B?KyswWTRDVGoxeVBtUVdMYnQweVlKUFJyNkhacVJSWEx0UkVwWStSeUFqWURr?=
 =?utf-8?B?cXdUMTVxQlJ0RWtyemh6OExudWp0c1F0cFBnNlFYVGt6RjN1TWRxVnNFUXpx?=
 =?utf-8?B?bmNGUnVZSFlMeDhiV0p3ZGczS2lLN3lXQXdWY3UxN041RnNJSlMvT3ZFMWJj?=
 =?utf-8?B?dkRiTUtMLzZrSjZXWDhJZWFmN25KenliQmdFcnpPTFlPMWduQnU2OWdWNmFZ?=
 =?utf-8?B?Y1Q1L1FSSVM2SXJ0bFhZZkFsbXlna0VHNnlrbkNXYlVSamNYRlpuKzdrS0Nx?=
 =?utf-8?B?Mmt3V1pvNEFRTGtuSlF3Z0x4UzVHZlFTL3ZpMXc2VExRVGdhcFl2dS9CYnho?=
 =?utf-8?B?eFovNUl0Nm9xUXFXSmFFTGNIYWR3RDVwcjg2Q3F1dGRxWS9JTlo2dDNFcVFX?=
 =?utf-8?B?K1paK1RlMXhzOXRjcWgvSlQ3Tk9Ia213N1hlY3dXOTAyRk5CdGpyb3hqOG5I?=
 =?utf-8?B?a3pnM2pJN2tsMlA5Yk52SS9MajgwdXNtTVVEaXNvU2VXMy9ZdDNvRk5ZWWtq?=
 =?utf-8?B?MUt5NTJTNjkyckZ6MGEydHB5U0lVSy9PQ2VLRVRaRnBEMk5CWUlFSW9zSkpa?=
 =?utf-8?B?Sk9jQzRFTXhJUUlaSTR3MmJaMHc5K0YzMnJhaWpKYk9SbXhPVFNGNXRKemJI?=
 =?utf-8?B?Nkd4Ym15Y2FJWnpyVEN6c2lMUDdiUW1PM2RsaG9oUGFtZEJ1SnhkVThCOHVp?=
 =?utf-8?B?VDlCeitsaWkzUjNXdXhtRU1RaWRBYlh0N25venlEcklYNi80ekVHeHpnZXNG?=
 =?utf-8?B?YVExNnRDcHcxekdjZk45dituY0VsVkM4WXpSdUgxM0hYQ1FybzUrMS9CRmpG?=
 =?utf-8?B?SDhzaUs2R2gzNzExcndkT0tPeUZadWpjbkVIam9LWlJ3R1FPYWNJN2pmb29n?=
 =?utf-8?B?RjR6SVhrU0d3YkQ2c21PUXhGbkFFVmtEdnR2bHdtejJSNDIrOGZjY093cHRs?=
 =?utf-8?B?cnNSYkxIbWNLNXlnaFBTN0VTTTFBWHNTSXFzQkZ0aEl0N3J1aEVZK3hVSXVW?=
 =?utf-8?B?RjBxOXNoNU9mbUZDVXl3dkI3OU5yS2FjdndMSFN4WjZycVRCZ1UvcUxXOHBJ?=
 =?utf-8?B?dUdrT3NQcERUZVg0SUFQZ1VUTFdvQlRldWlYZHFZMnpMYVAyNk5LUDZ5Y1lQ?=
 =?utf-8?B?TVk0Um1OMmlhb0lCZG9MSlpDb1hrVVBtYjhtNzRTWkdRcThQZjlsZ2hiTXJY?=
 =?utf-8?B?SXc2bWVZOTIyNmJ2WW1xK08wVk9WR1Jrek0vcjhhYjN3RGs3ZWlOcXRkRUwy?=
 =?utf-8?B?bUgxb25JV1krVVExODlIWWdkbUZWS0ZsRkp3S1R5NGtab0ZudU1OMnNDWlZQ?=
 =?utf-8?B?L0ZndUlaZ3RaOVNhWnh2TXkrbkJEdU96QkpJTHFiWDgvaGlFa0lvOHk4dWc0?=
 =?utf-8?B?N2paMzVOM29hNjlMejdGcCtxdDhlZGlnWERhaTl6RmIvcVpnTmFYaCtROS9w?=
 =?utf-8?B?YjdqaE5KV1owcTFhdFRKYTJ2VXhBMzI4REwzbldKZFpyQWFYUEJneU0zemVw?=
 =?utf-8?B?cVc3VUQyRTZDM1YzR1h4YUpLRVR2UHM0dEJlZDNvMUJVdGhFb1E1SlJONWJ5?=
 =?utf-8?B?b05ySGZocll5K2hzazNVbVEwQkxoT25vcDdJYnI3a3VNSVpKaWN6VWMxc3BW?=
 =?utf-8?B?cVdHRFUrV2VWUFB4a2puZjZPaXQzM1ZBK1F1dUd1Rk5jR21nUCs5N1ZsZ0Fu?=
 =?utf-8?B?QmhzYVZ6UHdMZHhiRnBOeUVyYXM3OEhHejJLcDlzYklmTkh5L0d5Mkdod1dP?=
 =?utf-8?B?ekh2dWV1a3dNU25nYzUzZW9mZUVxRkpWOVVRbFc2QmNJcnlpdW9OY2pvNHJj?=
 =?utf-8?B?QWdQSWFDTkdHOURQTTNTZnIraHVWNUpWNlZFM0tObTVqWFlpZ0VTdVpraE9B?=
 =?utf-8?B?WkRxNW5JdDZINjZyMFg3ODFyZ0VSYmdOMU1XRVBPbEMvWlJ5UVFlaWhxQmpD?=
 =?utf-8?B?V3pISVZGb3UyWEVJYjBHSkNyRk4yeHdhbW14NTVMeVJrcVZQSEhVMm0ydmhk?=
 =?utf-8?B?RDVtcWpqZXE2Wkt1VzhqRmhySWpiWm5UNlh3ZjhMci9XTzVBSGIzWkhPVUFx?=
 =?utf-8?Q?uUojrsM/qcwkaR9s=3D?=
X-Exchange-RoutingPolicyChecked: 
	ZYy8RrcFhMJMU5iTgnNjMZvmW+1CYFQ9jVs0NXKVeFOGSN9djhl59QOGQgShC3LZRr6vm2fidBqeoFfpUTqhh8TFxNlYkSToFls/QANa5fkn/81mKiy4KIRXAHhBOL62ovLaFfFrREq/uHB+uWKbdF+k12Yu7WzuyGnXyjnWPxi3IwqbYS50daAYMiYaf50JuGfo7loegcL/JFpCdHf4HMQGGWvukymdunLPo2G2+r+3XLmhbnEpVH7VGSauJnNEFaXAgSkQOCS61qDrO1LwxK7JMzHpt5Dxptu7uNWZDkliw5LyMaFbivsLxwscJ7ZOSNpTomNkuWy6KKWdCHT04A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d21c036-5766-4999-2aa7-08de897c2a0f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 08:05:50.9087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4U3I5vxR4M+bmu96lJYKv0ZhxT0RCJ3jWAzOtkpu5KIZ+wtH5CAikRdnKO4968SLD5Hpx7uCByOF57+oUzRHStorKnX6hsvNlC7iZ6DYpMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8523
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: -udUVYzL-gZsJxBojnH3-aw33MczQ_Nn
X-Proofpoint-ORIG-GUID: bw6-gDYNEDnqMgNvveKrrnedBCpi_b9T
X-Authority-Analysis: v=2.4 cv=deCNHHXe c=1 sm=1 tr=0 ts=69c245e1 cx=c_pps
 a=aTmL5QNlyH7IpnOKEqsBOA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=epTmVMiNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=d5gOx9S_cMNTlYEONBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA2NCBTYWx0ZWRfX/Rmirw0X0LXc
 t4kHNVcg+u1M2ysgQjKhAx17OWiLGLNsd4HUoEgX2gZUsLn3sHfXljE6fjpPhukT+TtefXc1S5j
 g7fL2ed1R2aSSz+NGOG3CR+11M5aTyMUgjj9UZ0HY89jeBYqQVBbaNfepsZgA2l561bHzIHdY2F
 0tIiUDsxF0sxwhnSUFU4VsL0reTKGBaRW7bKdt1LenVV9bRrRplmIMiAo8cxiZD2yicVIHek2rD
 qiN+51eMm7iT+9sqhrS+j6xh0TsKl+JZ0BMOv8YHrSlMo/uBjQw8r9tO3/0C7gXtPBWxxOMRr0v
 FyzAtVzODM1NC7TBc6Frg9V4+Rt5dtao5hxbWgv78yOZm4pxxDd1tptvkInaS6DR7ZfxpVQbDzk
 q7TxttpDerX2VsxGLgqeIrqNH6r7nydGfwuplbCL9lSvLyQlHMhxzP1qzogxMtvXNcpWYDr8DeE
 b1Wqfhfh6RyzlFHi/dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240064
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62O5Z2OK2164585
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 08:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125545


On 3/24/26 15:36, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 3/24/26 08:16, guocai he via lists.openembedded.org wrote:
>> From: Guocai He <guocai.he.cn@windriver.com>
>>
>> Add ptest infrastructure to run the PostgreSQL standard regression tes=
t
>> suite (pg_regress) on the target system.
>>
>> Test logs:
>> root@qemux86-64:~# ptest-runner postgresql
>> START: ptest-runner
>> 2026-03-24T02:42
>> BEGIN: /usr/lib64/postgresql/ptest
>> ......
>> ......
>
> I'd like to ask just one confirmation question about this "....." here
>
> Is the output machine parseable, i.e. do the results have PASS:/FAIL:
> prefix, at least as a final summary?
> The run-ptest script doesn't seem to do such conversion, so I'm just
> curious if the output is usable out of the box.

if one case fail, the logs like:

.......

not ok 78=C2=A0 =C2=A0 + triggers=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 38=
360 ms

......

# 1 of 224 tests failed.

>
>
>> All 224 tests passed.
>> waiting for server to shut down.... done
>> server stopped
>> DURATION: 853
>> END: /usr/lib64/postgresql/ptest
>> 2026-03-24T02:56
>> STOP: ptest-runner
>> TOTAL: 1 FAIL: 0
>>
>> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
>> ---
>>   .../include/ptest-packagelists-meta-oe.inc    |  1 +
>>   .../recipes-dbs/postgresql/files/run-ptest    | 53 +++++++++++++++++=
++
>>   meta-oe/recipes-dbs/postgresql/postgresql.inc | 42 ++++++++++++++-
>>   3 files changed, 95 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-oe/recipes-dbs/postgresql/files/run-ptest
>>
>> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/met=
a-oe/conf/include/ptest-packagelists-meta-oe.inc
>> index 4de602ac1c..0e395db48a 100644
>> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>> @@ -76,6 +76,7 @@ PTESTS_SLOW_META_OE =3D "\
>>       fftw \
>>       libusb-compat \
>>       mariadb \
>> +    postgresql \
>>       re2 \
>>       rocksdb \
>>   "
>> diff --git a/meta-oe/recipes-dbs/postgresql/files/run-ptest b/meta-oe/=
recipes-dbs/postgresql/files/run-ptest
>> new file mode 100644
>> index 0000000000..004cf2ba87
>> --- /dev/null
>> +++ b/meta-oe/recipes-dbs/postgresql/files/run-ptest
>> @@ -0,0 +1,53 @@
>> +#!/bin/sh
>> +#
>> +# PostgreSQL regression test runner for ptest
>> +#
>> +# This script initializes a temporary PostgreSQL database cluster,
>> +# starts a server instance, and executes the standard regression test
>> +# suite via pg_regress against the installed PostgreSQL binaries.
>> +#
>> +
>> +set -e
>> +
>> +PGDATA=3D/tmp/ptest_pgdata
>> +PTEST_PATH=3D$(dirname "$(readlink -f "$0")")
>> +TESTDIR=3D"${PTEST_PATH}/test"
>> +PGBIN=3D$(pg_config --bindir)
>> +PKGLIBDIR=3D$(pg_config --pkglibdir)
>> +
>> +cleanup() {
>> +    su - postgres -c "pg_ctl -D ${PGDATA} stop -m immediate" 2>/dev/n=
ull || true
>> +    rm -rf "${PGDATA}"
>> +}
>> +trap cleanup EXIT
>> +
>> +# Initialize the database cluster
>> +rm -rf "${PGDATA}"
>> +su - postgres -c "${PGBIN}/initdb -D ${PGDATA} --no-locale" || exit 1
>> +
>> +# Start the server
>> +su - postgres -c "pg_ctl -D ${PGDATA} -l ${PGDATA}/logfile start -w -=
t 120" || exit 1
>> +
>> +# Ensure the test directory is writable by the postgres user for
>> +# regression output files (regression.out, regression.diffs, results/=
).
>> +chown -R postgres:postgres "${TESTDIR}"
>> +
>> +# Prepare the tablespace test directory
>> +mkdir -p "${TESTDIR}/testtablespace"
>> +chmod 0700 "${TESTDIR}/testtablespace"
>> +chown postgres:postgres "${TESTDIR}/testtablespace"
>> +
>> +# Run the regression tests.
>> +# --dlpath points to the standard PostgreSQL package library director=
y
>> +# where regress.so and contrib modules (autoinc.so, refint.so, etc.)
>> +# are installed, so that CREATE FUNCTION ... AS tests can locate them.
>> +su - postgres -c "cd ${TESTDIR} && \
>> +    ${TESTDIR}/pg_regress \
>> +        --inputdir=3D. \
>> +        --bindir=3D${PGBIN} \
>> +        --dlpath=3D${PKGLIBDIR} \
>> +        --max-concurrent-tests=3D20 \
>> +        --schedule=3Dparallel_schedule"
>> +RESULT=3D$?
>> +
>> +exit ${RESULT}
>> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/r=
ecipes-dbs/postgresql/postgresql.inc
>> index 040b3d5e34..dfc624f07e 100644
>> --- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> +++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
>> @@ -29,6 +29,7 @@ SRC_URI =3D "https://ftp.postgresql.org/pub/source/v=
${PV}/${BP}.tar.bz2 \
>>       file://postgresql.pam \
>>       file://postgresql-setup \
>>       file://postgresql.service \
>> +    file://run-ptest \
>>   "
>>
>>   LEAD_SONAME =3D "libpq.so"
>> @@ -37,7 +38,7 @@ LEAD_SONAME =3D "libpq.so"
>>   export LDFLAGS_SL =3D "${LDFLAGS}"
>>   export LDFLAGS_EX_BE =3D "-Wl,--export-dynamic"
>>
>> -inherit autotools pkgconfig perlnative python3native python3targetcon=
fig useradd update-rc.d systemd gettext perl-version multilib_header
>> +inherit autotools pkgconfig perlnative python3native python3targetcon=
fig useradd update-rc.d systemd gettext perl-version multilib_header ptes=
t
>>
>>   CFLAGS +=3D "-I${STAGING_INCDIR}/${PYTHON_DIR}"
>>
>> @@ -184,6 +185,45 @@ do_compile:append() {
>>       done
>>   }
>>
>> +do_compile_ptest() {
>> +    oe_runmake -C src/test/regress all
>> +}
>> +
>> +do_install_ptest() {
>> +    mkdir -p ${D}${PTEST_PATH}/test
>> +
>> +    # Install pg_regress binary
>> +    install -m 0755 ${B}/src/test/regress/pg_regress ${D}${PTEST_PATH=
}/test/
>> +
>> +    # Install test schedules and resultmap
>> +    for f in parallel_schedule serial_schedule resultmap; do
>> +        [ -f ${S}/src/test/regress/$f ] && install -m 0644 ${S}/src/t=
est/regress/$f ${D}${PTEST_PATH}/test/
>> +    done
>> +
>> +    # Install SQL, expected, input, output, and data files
>> +    for d in sql expected input output data; do
>> +        if [ -d ${S}/src/test/regress/$d ]; then
>> +            cp -r ${S}/src/test/regress/$d ${D}${PTEST_PATH}/test/
>> +        fi
>> +    done
>> +
>> +    # Install the regress test shared library into the standard Postg=
reSQL
>> +    # package library directory (PKGLIBDIR) alongside contrib modules=
 such
>> +    # as autoinc.so and refint.so. This allows pg_regress --dlpath to
>> +    # resolve all required shared libraries from a single location.
>> +    install -d ${D}${libdir}/${BPN}
>> +    install -m 0755 ${B}/src/test/regress/regress.so ${D}${libdir}/${=
BPN}/
>> +
>> +    # Install run-ptest
>> +    install -m 0755 ${UNPACKDIR}/run-ptest ${D}${PTEST_PATH}/
>> +
>> +    # Set ownership to postgres user for running tests
>> +    chown -R postgres:postgres ${D}${PTEST_PATH}
>> +}
>> +
>> +RDEPENDS:${PN}-ptest +=3D "${PN} ${PN}-client ${PN}-contrib perl"
>
> ${PN} is part of this RDEPENDS implicitly, no need to add it separately
> (granted, it also does no harm by being here)
>
>
>> +FILES:${PN}-ptest +=3D "${libdir}/${BPN}/regress.so"
>> +
>>   # server needs to configure user and group
>>   usernum =3D "28"
>>   groupnum =3D "28"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#125542): https://lists.openembedded.org/g/openembe=
dded-devel/message/125542
>> Mute This Topic: https://lists.openembedded.org/mt/118479820/6084445
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [skandigraun@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--=20
Thanks
Guocai


