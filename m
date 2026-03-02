Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FC8D58E47
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 01:46:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.151139.1772415982397332584
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Mar 2026 17:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SQkAzCH6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7521d96bbd=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6220GRJW944804
	for <openembedded-devel@lists.openembedded.org>; Sun, 1 Mar 2026 17:46:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=BW27x/WFFuJAwgtWQi2oH5
	erlSP84dHolQIbmThLbNg=; b=SQkAzCH6Z/WgRLBvn6QW2EJc2nuAqpd3JBjIhG
	Siyr+QRoL7cgQyZFIadvV4cRBo9xGRF7Djki7+12cKPRtSpul1sq5dRA+IeK5g3I
	ONKpxX/Jc8t7aTKuMY5LH3P6MtJBq0/aTBHzojyDeANcRBK4B8FT5d2jowC9nCUH
	W2/MsMsaTPIa34fmP2ovBEfoJEJFSJAR5pVlcAGtPU0lIVeRaoPbhN8JLp0g60e4
	3pa//on+I3p4ZJjCi0RMb9jRrctxJCKsP+w39GMaM2q6ejeYHf6GPX5HpKnCcw3O
	CxTuYBi0AVilta3F3obL6BKf/UqpV62novxrUcrDGTzj8qUA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012057.outbound.protection.outlook.com [40.107.209.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh41gfc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 01 Mar 2026 17:46:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSJT7NQFTENcvgW12sEBjsTgHLFfP040XA4iq7C6005DMWU+6GsFAz9y/steFie+298SVwBTj6PYTluCzOHMcIrz73oV9oiD2qD03uu6+KoxndH8dqBMdikDd+pUXSsvMWV5LhNNfphzeLMGET7GjVnHFv/Bb00hLG9//2mhz2ScJt1zIN0n/K7s4tpOE0b7Cd+WF7pD44TLXJoEbQg9fgGe+9co7nPmDau46c0irictA/7mfC9vU6TsL46TOkKWtfzIhB3f+ctlPnNZqlggSoTukLIswlvZ7kU4E850l3rckU9QKVYIAg7zRC7QaLxVx2F0RVSsx0XHIvBK1NiYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BW27x/WFFuJAwgtWQi2oH5erlSP84dHolQIbmThLbNg=;
 b=HMyWZWN1u24nTiEZe/E3IkG+uOBuNjzzxTfsVYfyZVKZaEtE1EtNSEcubxhkV9E/GZPnZMuwZ5xJIp+Y/22nMajsRIxX8RWHOTmdTr6xunGHvhWMzNEfTixKq4+xX1/yfN0CDRWGOloL+vJBVRAsRh9N1c5+FBMrAvTjaZ+jcHdTAU2ZxYHRoGYkfDhpdl2224EIGrTq5879HSRs/35y/svmhQAgi42a4OeLTZWzcsmps70uiuKOTFJ0zH3dJ6LaLjCEAZJQ8wZrTXtAQoIEG+uoa90cjGKzWccEfowU1iLixFqQLxTSD/iFNr2EzOLTjx9214k7p7E4UVEmoxOcCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 01:46:18 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 01:46:18 +0000
Content-Type: multipart/alternative;
 boundary="------------gNhxDoGysULRPzM3WlWKvppn"
Message-ID: <e0292a8d-208b-4964-b750-5b21e15b6e27@windriver.com>
Date: Mon, 2 Mar 2026 09:46:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][PATCH] pavucontrol: add x11 to REQUIRED_DISTRO_FEATURES
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
References: <20260228054848.3197690-1-changqing.li@windriver.com>
 <WAP8BT.7MCV16N6W4811@t-online.de>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <WAP8BT.7MCV16N6W4811@t-online.de>
X-ClientProxiedBy: TYCP286CA0050.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::8) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA1PR11MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: b36209d4-d9f1-47cb-0b9b-08de77fd7fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|18132099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	YXm8ALakIFGgopvpy5IFeVB0hi+Ia4yyplPuB2buJflmYLRfR7XwQ2RXz1tI0QyxkVPT+WnUOanAJnedrcECZCmyMVco7DS9l8CGxSavuZzNVCFgZPxfrhldT1oNdhwasVgYs5Qr7AlOP2I9wGH1XTi+8B0P83TVcBunnTH8kbGFF0h41q3/k4GVGrXs0T9XBRRVDk3Hdcw8MJOzGtfHrEAk3Qj17D5cojvUU+ccxXbPlcD2+aNlt9yfvGQfGLfwjx47hjRCq0y6HGKF0JRdguj7sUdH+PAacGHJzRUm5gsiLrLpepUCPS27jJT3uAFlnvabXWB7Xz3cEn+Ki1mQaKb+FafhvW5exdd+buaEcF41b8ddaApJyvG2TB7NkZm7AwgUA3NQsw3HnKqDdl9n5dhDvECpk6gYISi5dtUhSrMLH1kYp6VQTs4o2+C4Ser1Me6D1PXVAEA3GkGXtI51FAH1Kihyl6+QQrFdF8Ama/QM/A2gPV4UJBdOjP96UM+OaWcr7oE3jsfRnWvTqdkYeupkfw/Iw4AnGh2rJ0LyhOunGhs5eX2cyci3p6eQwR8xcA8LvSgU8vRj+Ku4tn/yPmvF1Sp2J3+KbIRvTnreeGcPB1jsECbX5EwA6VXJXj2wv7yhOUoXRCQl7ThAw57TGMTlNiiqoxBQTjXs2PuLOto=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(18132099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c1RWMmgvN1lDY2I3ZGEzRHRiMDdlQk5kUitIVEtZZUZpSjZNTGtMQ09XRXVW?=
 =?utf-8?B?eXlNb0tsSzNxTUgxa3NNQ3Q4U012M0FHaHpwNkFBdmVONThjVDl1eTZ1eTB2?=
 =?utf-8?B?LzF5Vk93NEhPMVRhSDl3M0xwcmNUWk9qMk84UXQwWnpBYkJNY3dwSzZxMlZM?=
 =?utf-8?B?L2p0ZFh1bE16NjYzdFFPQVBvdS85UTlSVGk5MHhpK2pQREJXdlJMTHVXS2V3?=
 =?utf-8?B?c1BEbEVhbUhRMkE4eS8wWVg2dUxyMzJZaU5sTDVwMXVORDRoYVdNWFJMMjVa?=
 =?utf-8?B?NlN5QVltbDYyTEV0Wi9hKzRXcyszNXQ0SDJtQW1ITzkrekRvZlNKa0lGZ29R?=
 =?utf-8?B?c0NOUnRZMWg3TlZhWlBkd3NYZVZjYUhwSldFNDgwazVvaExsRGdkQ0hBZmM4?=
 =?utf-8?B?SG5YdVo5dDhUS1FYV3BzSkNubWVrM1Rrc2RBQkthS2p3ZG5hODJJankxNW02?=
 =?utf-8?B?NFBNNmVDd1FIWnFSZVNPNk56MlQ3K1ozWEdVbnVXa3doMHhialV1Y2diK3Mr?=
 =?utf-8?B?eUJWdEJtblFqL0ZXSGZNTUhJTEhRL3I2QlRFQTlhNzZ1MUZDeFFPSHRENGw1?=
 =?utf-8?B?MGFrMTdDNXJuZDcvZXJyVnJEM2kyMFV3c1g4WTRwRTVxNHlyY3VkSHgvTm1O?=
 =?utf-8?B?TWphZjZBUGx1MHkvL3lYNGd3b3R1N3VtTms0dGZlYlNDSUZwS0ZFZENuVHRa?=
 =?utf-8?B?bTVMSlpJNmtYakVUV254WXloTCt6VWdOVDgydlFDa1ZMU3ppQ3R6Yk5yakxB?=
 =?utf-8?B?Q0I5dGpkL2pnRHAwTnpYTC9VY2pvR1NiMU14QlhMSXQvMVVlV3BzLzlkd3N2?=
 =?utf-8?B?YnJYa2V6SUJmU0ZvWmIwMkNOTFkvd3BBeXpGVFVMZ2laS2RpL1lQTTN3bXU3?=
 =?utf-8?B?bHc4Lzd1OE5YTzM3UzFFZmN2aDhSTnUvWTQxcmtnUVBUTmhlVGdVaWlZZThH?=
 =?utf-8?B?VmI0Z0U3RnNNUDJxRTkwL3BXRkVEM1FwWHlYMkhMcXpkdk9vQWFpMm9nV2xi?=
 =?utf-8?B?S3NJTUtHYi96TXcxUytSVUM2TzRrSGYvWm1HSHlHTzZLemN1dDZSZ0ZMamJ6?=
 =?utf-8?B?NytBenVjUk50eHVxMzBWTXA1eXFGUlJidXBDYU15Zm9adHZKMytISEJ5b0w1?=
 =?utf-8?B?d1VGSldQdTlTY1JjVjFFTkJwUTc0blBERHVkZDB4anlXNEdCYUtXQXdSN3B5?=
 =?utf-8?B?N3B5czJEK2FzRlNibWhCb0d5RXdOTkpkbkNrWFFmczk3M2lORXkvRmt3dklv?=
 =?utf-8?B?UTVYU21uc3NpUThobnk2dE5iR1Z0MSs2OFhqMEFoeWtVTDNRUnlScVRQQndy?=
 =?utf-8?B?ZkVZb3FuNklGWURkU1ZNUEZPNTlPelZNN0pQOTFsaU8vemx0bEIwajBmaGtV?=
 =?utf-8?B?aGpLUmpiTGNpWldJWGMrekN2a2JoWFJHSjFCWERiL1VIUkNyWFVaMmFubDRS?=
 =?utf-8?B?bWNvZEpmbGtHT3hnMTlaSHgrMi9HY21mZWRLRVZ5aUpVaDhaWDlsZFZZZUF3?=
 =?utf-8?B?VjZ0Tk9qMmI3ZkIyQjdVM3F6OEdadlJHU05Vd2Z1L0t3OHR5NjhpRi82YUww?=
 =?utf-8?B?OVptbTdVaG8wQnZ4Nlc5N1o1cks2WE9aL055WDdTaENVSi9ZMHVlWS9yTzJD?=
 =?utf-8?B?NjZJdjhwM1FZeHJib2M4dktwOE5XTVdVRzlzemJ6ak9BK3BHaDU3Y2ZacGNw?=
 =?utf-8?B?dm5FZUhUbkRYbVRhSFJnRnVlS1phNVhkczlMU1B4Z2pvVUMrV3pYMVhQZTQ0?=
 =?utf-8?B?TDR1T1ZFNEpJRTUvdlozbHdMeGJ3TnRGUVhqVlVNYk5mblRmclF5QllKcGgz?=
 =?utf-8?B?RVF4YU1jMXNxMzBlSzVRaHNEaFcxWTBnczRVWE0xQXhSRER1SHp4NlZ6UWNU?=
 =?utf-8?B?c25UdkQ2NWlzT3FNZHdaUHRVNkJTWjhHZDJNNFh6ZEduUTBLT1dLZ1ZCZnZC?=
 =?utf-8?B?ekxnUlgxMGxrdjJGMVVvaFdUcUFpeWVzSTBHb053ZVhqb1N5UjdoNVE4byt5?=
 =?utf-8?B?emVMTmJSczFlVWI2WCtKZVYwTXlSTmlFVHkzeURYNGJ2bElKRkI5K3Y2YVZ5?=
 =?utf-8?B?WTR0L0FodzhDNEd1NzlDeDI1SldzaWpIclJZQ05XUE83UWNTd1NoUEZLaE81?=
 =?utf-8?B?aDBVL0lPMGYyRm8vZHRVR3FkdzJGYkpaYndyT1c1anQwSEhGK0R3RENmQzEy?=
 =?utf-8?B?Q21LYXgyeWZGSVM4YjBTY3Y2dVdnNjN6YjVDcHFKNzBPQU5KeWVaRU9LUUJX?=
 =?utf-8?B?dVA4dkVBSG5admpNeFBZRWM5dXI5LzZ0SU5pV3pSSXpNMzRieVBYZHYrTVYy?=
 =?utf-8?B?YVFndDV0a3oxdks3R0NIOUxXYy9JbjFNclJiOFg4UVA1VnJrVTRQR0pKNEQ5?=
 =?utf-8?Q?lD7vnPyePIZktPII=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b36209d4-d9f1-47cb-0b9b-08de77fd7fb4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 01:46:18.8403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbAsX+WFAJXFw631X/wOHNGKIL2c3BSymb8HLY9mh0PzYIEXnrAfN7IJaTxxyXQa086qlZim4asRmQCkA4lfs9i9GurgTccsywFhPqCEAao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: kIkb_O8iXNqeI0v7GgAdEMr735P3VEP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDAxNCBTYWx0ZWRfXwYxVkfD4VZZQ
 Uv33U9TGd+9HShPcqKlE8YBMbcuXlpvrBfdffs1xFexWmopmNkLxnNIrpiX0mJSYWzqoCLfZufe
 MKxmF4gQIAa2Jk3qVzIiLxckjiNkCtRnV/Xz4CzzTZa5AfA4RHBfqRXGkr9zea2/kOJNC5NQG/a
 taV4PcBsNcQeUnSoHp1bR5bvs203Ya62yqHqJPCOxdCpqoMpwN17CtBeRR8cPgondimjrxNlNut
 KgVFpRHHATyoTUUFOk0HOasUlvqonMlxkgisrYUYGss/JfE8velVn+AZ6DIYrPGpiAmaeG9TTVm
 R8Sy25QFrjF5L5hAOsE3ccHw75rsNAsj0UvYLNgpxdTFK/h1r7p8an7rk4kJvOYC1Mq1OQx3v+H
 TGyrxxafRJzd7NUnWkBqriH6vZKc1ojtjlIQ/hIWZgXBxvIZwLqA4pOC9Ks+wx7UDGXcMvGropf
 Jc+T22q5ki2uEE/ywWw==
X-Proofpoint-GUID: oTvhUUZsybHDRnbCD1P_iLwGPmCRoeMp
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a4ebed cx=c_pps
 a=Ovo9riOs5JmVBBfNyWc1Cw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=ygfikJQSAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=SX1gRCW-5qvAhGijNrEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=YWkBsHufNW-QJOBPW5MA:9
 a=HHj-HSBjsrnS29j5:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=rfsfOhzgo-V0TFs3tIRs:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020014
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 01:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124796

--------------gNhxDoGysULRPzM3WlWKvppn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6220GRJW944804


On 3/2/26 05:35, Markus Volk wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Hi,
>
> I sent a fix that removed DISTRO_FEATURES =3D =C4=81=E2=82=AC=C5=93x11=C4=
=81=E2=82=AC=C2=9D from gtkmm4 and=20
> pangomm-2.48, which fixed this issue for me locally.
> Have you seen these patches or do you know if there is a problem with=20
> this approach?

Hi,

I had seen those patches, but it is send one month ago and not merged by=20
upstream,=C2=A0 so I guess maybe it is not accepted by upstream since som=
e=20
reason?

And one of my question for those patches is "could we just remove remove=20
x11 from REQUIRED_DISTRO_FEATURES for pangomm?".=C2=A0 I suppose we can o=
nly=20
remove it since=C2=A0pangomm

not need it,=C2=A0 but I don't know how to check it.=C2=A0=C2=A0Maybe ups=
tream not=20
accept the previous patch with similar reason?=C2=A0 =C2=A0So I resend th=
is patch.

But if you can ensure that x11 is not needed by=C2=A0pangomm, I think you=
r=20
previous patch is better to fix the issue.

//changqing

>
> I ask because I never received any feedback on these patches.
>
> On Sat, Feb 28 2026 at 13:48:48 +08:00:00, Changqing Li=20
> <changqing.li@windriver.com> wrote:
>> pavucontrol depends on gtkmm4, which require x11, so add x11 to=20
>> REQUIRED_DISTRO_FEATURES for pavucontrol, refer [1] [1]=20
>> https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next=
&id=3Daed20cd843fb00726d7c8da1aa19d238c2f9f195=20
>> <https://urldefense.com/v3/__https://git.openembedded.org/meta-openemb=
edded/commit/?h=3Dmaster-next&id=3Daed20cd843fb00726d7c8da1aa19d238c2f9f1=
95__;!!AjveYdw8EvQ!eI02cHdx4niPW2r8eVZTIRqvx2WhR4SG4ESEtz82G0D1nHKPJD2FpH=
rrLKBc_tb6ts7--x75rBmtL5xgYDMScqs$>=20
>> Signed-off-by: Changqing Li <changqing.li@windriver.com> ---=20
>> meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb=20
>> <https://urldefense.com/v3/__http://pavucontrol_6.2.bb__;!!AjveYdw8EvQ=
!eI02cHdx4niPW2r8eVZTIRqvx2WhR4SG4ESEtz82G0D1nHKPJD2FpHrrLKBc_tb6ts7--x75=
rBmtL5xgJ5Ry6ww$>=20
>> | 1 + 1 file changed, 1 insertion(+) diff --git=20
>> a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb=20
>> <https://urldefense.com/v3/__http://pavucontrol_6.2.bb__;!!AjveYdw8EvQ=
!eI02cHdx4niPW2r8eVZTIRqvx2WhR4SG4ESEtz82G0D1nHKPJD2FpHrrLKBc_tb6ts7--x75=
rBmtL5xgJ5Ry6ww$>=20
>> b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb=20
>> <https://urldefense.com/v3/__http://pavucontrol_6.2.bb__;!!AjveYdw8EvQ=
!eI02cHdx4niPW2r8eVZTIRqvx2WhR4SG4ESEtz82G0D1nHKPJD2FpHrrLKBc_tb6ts7--x75=
rBmtL5xgJ5Ry6ww$>=20
>> index b6b9a068a9..9e54f49dcb 100644 ---=20
>> a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb=20
>> <https://urldefense.com/v3/__http://pavucontrol_6.2.bb__;!!AjveYdw8EvQ=
!eI02cHdx4niPW2r8eVZTIRqvx2WhR4SG4ESEtz82G0D1nHKPJD2FpHrrLKBc_tb6ts7--x75=
rBmtL5xgJ5Ry6ww$>=20
>> +++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_6.2.bb=20
>> <https://urldefense.com/v3/__http://pavucontrol_6.2.bb__;!!AjveYdw8EvQ=
!eI02cHdx4niPW2r8eVZTIRqvx2WhR4SG4ESEtz82G0D1nHKPJD2FpHrrLKBc_tb6ts7--x75=
rBmtL5xgJ5Ry6ww$>=20
>> @@ -9,6 +9,7 @@ DEPENDS =3D "gtkmm4 pulseaudio json-glib" inherit meso=
n=20
>> features_check pkgconfig gettext ANY_OF_DISTRO_FEATURES =3D "opengl=20
>> vulkan" +REQUIRED_DISTRO_FEATURES =3D "x11" SRC_URI =3D=20
>> "http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz=20
>> <https://urldefense.com/v3/__http://www.freedesktop.org/software/pulse=
audio/$*7BBPN*7D/$*7BBP*7D.tar.xz__;JSUlJQ!!AjveYdw8EvQ!eI02cHdx4niPW2r8e=
VZTIRqvx2WhR4SG4ESEtz82G0D1nHKPJD2FpHrrLKBc_tb6ts7--x75rBmtL5xgQDs1EZk$>"=
=20
>> SRC_URI[sha256sum] =3D=20
>> "e93a7836c7307dcbc989e95fc7ec0878322514c475fabd90e89ed52fd4f15d32"
>> --=20
>> 2.34.1
--------------gNhxDoGysULRPzM3WlWKvppn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6220GRJW944804

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 3/2/26 05:35, Markus Volk wrote:<br=
>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:WAP8BT.7MCV16N6W4811@t-online.d=
e">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div id=3D"geary-body" dir=3D"auto">
          <div>Hi,</div>
          <div><br>
          </div>
          <div>
            <div>I sent a fix that removed DISTRO_FEATURES =3D =C4=81=E2=82=
=AC=C5=93x11=C4=81=E2=82=AC&#157;
              from gtkmm4 and pangomm-2.48, which fixed this issue for
              me locally.</div>
            <div>Have you seen these patches or do you know if there is
              a problem with this approach?</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Hi,&nbsp;</p>
    <p>I had seen those patches, but it is send one month ago and not
      merged by upstream,&nbsp; so I guess maybe it is not accepted by
      upstream since some reason?</p>
    <p>And one of my question for those patches is &quot;could we just re=
move
      remove x11 from REQUIRED_DISTRO_FEATURES for pangomm?&quot;.&nbsp; =
I suppose
      we can only remove it since&nbsp;pangomm</p>
    <p>not need it,&nbsp; but I don't know how to check it.&nbsp;&nbsp;Ma=
ybe upstream
      not accept the previous patch with similar reason?&nbsp; &nbsp;So I=
 resend
      this patch.</p>
    <p>But if you can ensure that x11 is not needed by&nbsp;pangomm, I th=
ink
      your previous patch is better to fix the issue.</p>
    <p>//changqing</p>
    <blockquote type=3D"cite" cite=3D"mid:WAP8BT.7MCV16N6W4811@t-online.d=
e">
      <div>
        <div id=3D"geary-body" dir=3D"auto">
          <div>
            <div><br>
            </div>
            <div>I ask because I never received any feedback on these
              patches.</div>
          </div>
        </div>
        <div id=3D"geary-quote" dir=3D"auto"><br>
          On Sat, Feb 28 2026 at 13:48:48 +08:00:00, Changqing Li
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:changqing.li@=
windriver.com">&lt;changqing.li@windriver.com&gt;</a> wrote:<br>
          <blockquote type=3D"cite">
            <div class=3D"plaintext" style=3D"white-space: break-spaces;"=
>pavucontrol depends on gtkmm4, which require x11, so add x11 to REQUIRED=
_DISTRO_FEATURES for pavucontrol, refer [1] [1]
<a href=3D"https://urldefense.com/v3/__https://git.openembedded.org/meta-=
openembedded/commit/?h=3Dmaster-next&amp;id=3Daed20cd843fb00726d7c8da1aa1=
9d238c2f9f195__;!!AjveYdw8EvQ!eI02cHdx4niPW2r8eVZTIRqvx2WhR4SG4ESEtz82G0D=
1nHKPJD2FpHrrLKBc_tb6ts7--x75rBmtL5xgYDMScqs$" moz-do-not-send=3D"true">
https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&am=
p;id=3Daed20cd843fb00726d7c8da1aa19d238c2f9f195</a> Signed-off-by: Changq=
ing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" moz-do-not-send=3D=
"true" class=3D"moz-txt-link-freetext">changqing.li@windriver.com</a>&gt;=
 --- meta-oe/recipes-multimedia/pulseaudio/<a href=3D"https://urldefense.=
com/v3/__http://pavucontrol_6.2.bb__;!!AjveYdw8EvQ!eI02cHdx4niPW2r8eVZTIR=
qvx2WhR4SG4ESEtz82G0D1nHKPJD2FpHrrLKBc_tb6ts7--x75rBmtL5xgJ5Ry6ww$" moz-d=
o-not-send=3D"true">pavucontrol_6.2.bb</a>
 | 1 + 1 file changed, 1 insertion(+) diff --git a/meta-oe/recipes-multim=
edia/pulseaudio/<a href=3D"https://urldefense.com/v3/__http://pavucontrol=
_6.2.bb__;!!AjveYdw8EvQ!eI02cHdx4niPW2r8eVZTIRqvx2WhR4SG4ESEtz82G0D1nHKPJ=
D2FpHrrLKBc_tb6ts7--x75rBmtL5xgJ5Ry6ww$" moz-do-not-send=3D"true">pavucon=
trol_6.2.bb</a>
 b/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"https://urldefense.co=
m/v3/__http://pavucontrol_6.2.bb__;!!AjveYdw8EvQ!eI02cHdx4niPW2r8eVZTIRqv=
x2WhR4SG4ESEtz82G0D1nHKPJD2FpHrrLKBc_tb6ts7--x75rBmtL5xgJ5Ry6ww$" moz-do-=
not-send=3D"true">pavucontrol_6.2.bb</a> index b6b9a068a9..9e54f49dcb
 100644 --- a/meta-oe/recipes-multimedia/pulseaudio/<a href=3D"https://ur=
ldefense.com/v3/__http://pavucontrol_6.2.bb__;!!AjveYdw8EvQ!eI02cHdx4niPW=
2r8eVZTIRqvx2WhR4SG4ESEtz82G0D1nHKPJD2FpHrrLKBc_tb6ts7--x75rBmtL5xgJ5Ry6w=
w$" moz-do-not-send=3D"true">pavucontrol_6.2.bb</a> +++ b/meta-oe/recipes=
-multimedia/pulseaudio/<a href=3D"https://urldefense.com/v3/__http://pavu=
control_6.2.bb__;!!AjveYdw8EvQ!eI02cHdx4niPW2r8eVZTIRqvx2WhR4SG4ESEtz82G0=
D1nHKPJD2FpHrrLKBc_tb6ts7--x75rBmtL5xgJ5Ry6ww$" moz-do-not-send=3D"true">=
pavucontrol_6.2.bb</a>
 @@ -9,6 +9,7 @@ DEPENDS =3D &quot;gtkmm4 pulseaudio json-glib&quot; inhe=
rit meson features_check pkgconfig gettext ANY_OF_DISTRO_FEATURES =3D &qu=
ot;opengl vulkan&quot; +REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot; SRC_=
URI =3D &quot;<a href=3D"https://urldefense.com/v3/__http://www.freedeskt=
op.org/software/pulseaudio/$*7BBPN*7D/$*7BBP*7D.tar.xz__;JSUlJQ!!AjveYdw8=
EvQ!eI02cHdx4niPW2r8eVZTIRqvx2WhR4SG4ESEtz82G0D1nHKPJD2FpHrrLKBc_tb6ts7--=
x75rBmtL5xgQDs1EZk$" moz-do-not-send=3D"true">http://www.freedesktop.org/=
software/pulseaudio/${BPN}/${BP}.tar.xz</a>&quot;
 SRC_URI[sha256sum] =3D &quot;e93a7836c7307dcbc989e95fc7ec0878322514c475f=
abd90e89ed52fd4f15d32&quot;
<div>-- </div>
2.34.1 </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------gNhxDoGysULRPzM3WlWKvppn--

