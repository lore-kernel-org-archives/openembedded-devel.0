Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C25C52D7C
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:36:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.88217.1723221385792918161
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8951576705=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47952SA6022328
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Aug 2024 16:36:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v09rtw1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:36:24 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 479GaOBp021631;
	Fri, 9 Aug 2024 16:36:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v09rtw1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 16:36:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UExEuTY8663S5wCwaPoycqztr0F2jlb6vAXYH47O+vYZAcU7NjAta111YoaNRb8xjqkMI/L7TApwa97WyFMNkm9wDFbmG5RuolF8IIVcNafrtHlkbxyjIj5HOjqd0mVyhUBnmK+ZJ6VdNrNG4MjQsbuW2X2ck0uIAMV/+tviVv2+S/livxQpatznHwNHN71dMoKUCQKeV9krpjXwQadILflTzmKn6FmLgBIKOW0cmhHQE342fwbI0yH9WrKoQg5Wdk+d/OsUaqCWHQDaCs5eJLhTS1VW0Nw4zdN+aLV3miA5RQI9IMk2Jw14bIGRb+ozBVEPeqASYdohHLMMdaMNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMNPrpOGKWVhHKfbMi2YaASnTlLdgvwDlIBtGQHjYlo=;
 b=HUOLwKxgOnHmLnXm63FZzsGLmiq+XlO8cbqwEpr0qIcaFi526CaIaMGZIslSOYK5552Vy/0Wixm1OqHhuEpD6h1rSkpq6EnfESXSAl0EUdjEuJjpY1YhdlKx+yhln35lxbm9W4bOPl4Tu4jRhcsVY3FoernC9AR8ov3Di9JjzfFcR+XPwAbKNnRP9uqYU/kJOs68HCqKruGrybRSvJ2X2P9XJZL59KLzgsfoR0Qrdwchx+gz4aeWByzrd6NVgCrzPOwe9qAjoU6RpLETON/ZGFN44NNLUWxM+LiYcWbcysjCW02wiyvjuATjyqTW6W91Qby6PjlNi8/rV9MPuGeeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY5PR11MB6283.namprd11.prod.outlook.com (2603:10b6:930:21::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Fri, 9 Aug
 2024 16:36:21 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 16:36:21 +0000
Content-Type: multipart/alternative;
 boundary="------------9Js6HPDIFvD4csQHLUS4C071"
Message-ID: <864eb3e4-2102-45ae-98d5-26925b40af62@windriver.com>
Date: Fri, 9 Aug 2024 12:36:19 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [PATCH 15/60] liblinebreak: upgrade 1.2 -> 2.1
To: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
 <1722933994-32549-15-git-send-email-wangmy@fujitsu.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <1722933994-32549-15-git-send-email-wangmy@fujitsu.com>
X-ClientProxiedBy: YQXPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::21) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY5PR11MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 451a89f7-20fc-480c-8d47-08dcb8916687
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|4022899009|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?akNMSzZHbWo5NFFLSWVGKzZtL3g5bW5zckRDL29uOTBNUDNteXZQK3hjMGhx?=
 =?utf-8?B?c3ZkMHVVeFNRNVYvYU1PQWRDcGd6WHlzakd4dW12bmtCUHhPVktIMlBYZUY4?=
 =?utf-8?B?VExnQmtTRnptdU5sRUNuSU4zTis3M1h1TTcvNHhyL2ozNVc3YkpJdm4wWkhi?=
 =?utf-8?B?aEo4d25SSWxCWDY3Slh4Szh0MHg4U3BuVTFWbVRPRWZRVXZiRDlvc3ROcHJN?=
 =?utf-8?B?MVRLdEV0a3JZa2dydmcxYlBSY0NCejdGZ0tINTArZzkrcXkzdHJaRGlQTUVB?=
 =?utf-8?B?ZURqWWd3aDl0WisrY0hRajduaWd4UDN2TGRueThWZ28wVlRkTmxEM0JreTht?=
 =?utf-8?B?MFVzVDJBd0xaMlBQSExoMDNLcm9HSjRxcXo5U1J1ZENqNXI1cDdaakRBVk84?=
 =?utf-8?B?Q0FUejdiNVZncTVTUXBkOEVIVUVadTlhMnVEN2kxYVdKVzZVZ2FBcUVmcFhN?=
 =?utf-8?B?OTAyemFEQ2lyT2Evb29EbktEbm9HUHA1YlF6ZFR0akNBKzJlSXpSSmhnVjQw?=
 =?utf-8?B?Zi9rZTFvU2FVZys0T1dDNUZuNFhHQVVDM2xpVHY4bllmWHA5UEVYaTkxNEZa?=
 =?utf-8?B?SzRpeGEzYjZsTkVTWmJJRGduVWJrdkZCMTlham90R3JuT0Y5eExIYjVXb29T?=
 =?utf-8?B?VlR6ZmRYVHB1RC9pZUhDM29HK3Q4SVRyT0VucDk2b01jazNWR3cwOUJibjUv?=
 =?utf-8?B?MFJscENOY1RMc2dTZnBjdlhqNGRxbGRUSlM0R2JQZkhEb1lDTzhQTUV0SSt2?=
 =?utf-8?B?dWJFaDVPY2grbjBkT210dlR5YnpkY0hjdnJWK1JZSkJnckgxMGdZbzNhQTI0?=
 =?utf-8?B?WjErZEQ3Q3B2UkV6ZUVkT1hvTHlmTnBnSExFL2RSZDJORkUwVU44cE9pbU1h?=
 =?utf-8?B?cEF2NFhYYmt0UlRmR2hlZFhIellDN1FtNk4wam43ZFNXT25DYUpUekhYQkdG?=
 =?utf-8?B?K1R1cnJyYm83V3ZRNGlFUFdURm50NGF5cVQxQzZpeWRqR29ZRVpWeURwWWxD?=
 =?utf-8?B?NWxlQ1djNHdiSDNBU3Z6a3hHaDY3bXZOcG9SZW91RDYrOHRvaW9PREtiMzlS?=
 =?utf-8?B?U1ZESWpBb09ZOXNkK3k3ek5MS3hUWmo2SWs2a3pxNlhSRGt5RlpNMytFajJC?=
 =?utf-8?B?dFhhK2p1NWJPL21Qdjc0UWhRajBIN0R2Y050azIxUmJDYmxOMmd5SDdyNmNY?=
 =?utf-8?B?UVhONmxYOUFMWjB2aXZXYjZ0dFpvMFZJUWtadTF6cDJ2U0hxU1V0WDRPblJ2?=
 =?utf-8?B?L2FlVmRUY0M1SGlTWG9UWXZmZGVzWTNzeGFpOXoybmNSc0IyZWR0MmxBZ3cz?=
 =?utf-8?B?VytWMTVmTHBxUHhXaFAxajNDTlhHVU96WldrTHl3b0RVdVVNeFlSeG5CVHh0?=
 =?utf-8?B?RlpWcnFCNXlBS3ovdXJCRysvTko1bFcwVlNncGpQNnhHZmRTWjg3eVk3b2dK?=
 =?utf-8?B?bXNXYU45Ym1lZGNjcVFZQzdhOTVaNWFvN0Y1TnVLUk5jeU1LSjd4alI5TmQ0?=
 =?utf-8?B?R3VveTZBWjllZm56SzBqMTZ0UndXK1BheFBtcXhQaXcxSEtOYnNVeWoybGo1?=
 =?utf-8?B?RXhOcXZDMGU0blV1WHBIMUY3c3gvU1lPU1E3UTNzTWUxRTVMOFkxTmJpSEpQ?=
 =?utf-8?B?Vkl1bUNDc1R5cVdDU1B3b2ZLSlRMbUgvb091ZFhVNmJONUZFME8xbVkrSVhV?=
 =?utf-8?B?UnhWQ00weUkxZlJrNUNOZi80VXorSExQZFdoVU9YeklpMFBwSHM3RkYzU0tY?=
 =?utf-8?Q?4rybe31kyjkC6ojL4vSQNFKX1UE6gOTBOBCO8k7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Tm81dXM0em1nUWxWUkFFVmZXbUZBb3haSVF2dlpUTTRPbTFHL0lqNDY1ak5j?=
 =?utf-8?B?bUZYLzBBakswY1hSOXdzVTNVVzZqUVpnM2NQQkxTc1VuRnZ6K1RESFVkZlFU?=
 =?utf-8?B?VFR5YlZYWmlsbi96YWREaVI5QmR1ZEYxNVpGbjRjZE5NeDdsdzdzbWk3ajAr?=
 =?utf-8?B?M2RpRnJwQzhvNnljbnJqWXllMURkVFZEck9QSXVRRUZDRXJvWDhPU0dTSWxO?=
 =?utf-8?B?MUNsZnVHc0ZnRmg4TnhVM3pVYWFpWG5LZnFrZmw3Z1lTSVV6cThwYnF0alA4?=
 =?utf-8?B?SWs0TmErbDF1TEdrcGFPYm16NVpUU0JSTGJKbU9xcHFGbEgxeXB2NnlKYUxJ?=
 =?utf-8?B?QnZaejVUUTB4elVxTjJ6L0s5bll3eitjNm1yaWVETkUxTWdSZW9WWk1mSDQ1?=
 =?utf-8?B?Ym83V3dIQ0ZKTDd1aXBJNXY3aDJiODhEdWgyMmxNVWhsRVUwcXNmZHhCNm8z?=
 =?utf-8?B?Zmk2VTJYUHp0YWZ2RGZFeEJJVlluVi9VVHVRWm5lTU5LcGpMdVNnMitCVnNy?=
 =?utf-8?B?T0duaUxRMEI5T1lNZi8xNXJmZEp5eEZSQy9BWGNGdkRSVG5jb2xzY01JU3BM?=
 =?utf-8?B?L3BBd0tWaTRHNnc5eWNObG5UTnJyT1g4b2JEZW4wM25jRkxiMWVmS1R1enJr?=
 =?utf-8?B?c0ZMeW5nTmJOTzdPY3E5THd0V21KM1d1OFNXS3BuZktFMVBEOEl1SzRsNDNo?=
 =?utf-8?B?VHBrV09BSloyM3RVUzlScTFmQTZwNENsNlNaenlJb1EyQjFGZEs3aEhrWE1G?=
 =?utf-8?B?YS9Zbnpzaml1ZFNBUU8yaktBU05BTUJxSFN5Y1BIRW82YXY1QVBoQ0kva3BM?=
 =?utf-8?B?Qk5EdFNUUUtoK3ZoTlRUM1cvRXZMK21haGc4OFRtRk9IOGZuS1p1RkhQdkRR?=
 =?utf-8?B?MUFCSHNMVkw4dy94aTVPcUY1c1BiTkNYb3U0V0dKYUU2eU92WHB5K05yaWlV?=
 =?utf-8?B?LzFNZUxHc1VhY0t6RmZIdUdDRVBpNThWUnRtVE1hSlFlZXNCWkV1VnEwTUJU?=
 =?utf-8?B?bUw5RGx2cW1IYTZPelZVdE5SNlBuUHFqd2JYK0FNQXFHdkRROElFT0dYRTBU?=
 =?utf-8?B?dGZHWVgwSkh3OFpWQU1nQ0dEZ1JvU2d2b0ZQeGpiMmg3cndxN0ZJSVRlV0RU?=
 =?utf-8?B?eVRqbTJmVGRnZW1JMDJiN083V2pBT0lZcDJMTSs0alhjUHVzMFZOc0lRNzh1?=
 =?utf-8?B?dUxZbmhIcEI2K0MzczZJYkdkV3hkTUZaT2h6QzdzNGxkOVpGM1NJM2dhK3pM?=
 =?utf-8?B?cWgxRFhMS0w3NXowSWFnbDZGL2FucHdqUDRNeHMyYXRtZmtUUE9zcWJNMG95?=
 =?utf-8?B?NU5keXU1OWkvb2x3RXZFNjlqRGN6Sll1dloxODVyNStWMTUxZ3poa0twcWtK?=
 =?utf-8?B?L0ZuV3ZKOTZQTjIvK3NzaWJOUzNZTHlhTnV0eGhxUTZleENUQnB2VXgxTlJj?=
 =?utf-8?B?SGhiczIvaGc0VzZwK3dzWHhmOGN2cHhnRk9ybXl3MC9SUmxPSTNucFpHZ1I3?=
 =?utf-8?B?LzFMN2pQN0RuNk9IZ3F5QlhFS1BFMkRPbEcrQnlEeEZwMm9LVGFIMzIvZTFu?=
 =?utf-8?B?R0RncDJrRDBhaVVaU0dLRk53RE10ZHg5Mk50L251ejIzYmJhZDFLNnl5SW9k?=
 =?utf-8?B?d0tuQU1aUm1CREh6Ri9Mb2d3SHVjTHNZK2xDMGpzZ1JHdnlsZjRxaGJyTzFt?=
 =?utf-8?B?S1pnOHR2Qkl2STRCT3czbmJ3M0t1bXNNTU9jNG1OSk15MGw2b3A4dmRJWENI?=
 =?utf-8?B?VktXVU5JMEpHMGZxM2daTnFBTTY0SCtFdjFRTDVCejRnL050Q3FQZzQ5bVBO?=
 =?utf-8?B?c2VwblZ0bXZmcjNFd1FyL2NUVHRFSlVMMmt3dmJ0UmtoWERjbVd1MjFqQVl5?=
 =?utf-8?B?VE5uY2ZYUVIrYU5aYURlUk9MaU1WdlVEMUo1RUZDUXRpQ2dJcEVkVWdZS1U1?=
 =?utf-8?B?ZGFRd1J4dzZCclA0UzJZZy9WM0hWU3BDT1Q1K00rSUk1WCtoSElhTDdycWlr?=
 =?utf-8?B?WDdIbFRobmppMWk3aG9mK1NuVk5Ec1lZQWdaVlA2SExiL2RjWlpLSEgrbXRY?=
 =?utf-8?B?RDVOazIrMEFyNXFOb3Q2eU91ZnFvUk5tNVhSR2tyNGJ6MGJ1enFsMVZjcHJx?=
 =?utf-8?B?T3JwY1ZHanFBbE9lK1o4Rm9SeG9nOHphN3NTdldCeTZYN01YNnVUbEdjRzhK?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451a89f7-20fc-480c-8d47-08dcb8916687
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 16:36:21.0794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hn69I2zKZr0/ezw2dxtUcpsQ1cBD9/wwcnRCUwltI6rOgT8EjzJBklH6Oj4wdymcUKiS93nOaZ+CaOY9GftCO8xjgQSu3lC+8JlTw5cqb5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6283
X-Proofpoint-GUID: Rt6J6ZoL8vLX7TBmbgSmvYRckfjCxg_V
X-Proofpoint-ORIG-GUID: 1qRpYrXPKMClWBrH4A6_WDyWU4N0iAVl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_13,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408090119
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111725

--------------9Js6HPDIFvD4csQHLUS4C071
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47952SA6022328

On 2024-08-06 4:45 a.m., wangmy via lists.openembedded.org wrote:
> License-Update: Copyright year updated from 2008 to 2008-2011
>
> Signed-off-by: Wang Mingyu<wangmy@fujitsu.com>
> ---
>   .../{liblinebreak_1.2.bb =3D> liblinebreak_2.1.bb}             | 5 ++=
---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-oe/recipes-support/liblinebreak/{liblinebreak_1.2.bb =3D>=
 liblinebreak_2.1.bb} (69%)

Hello,

Do you or does anyone actually use this library?


I was going to remove it with this commit log:


Subject: [PATCH] liblinebreak: remove obsolete library

liblinebreak has no users in meta-oe or in the layer index:
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddep=
ends%3Aliblinebreak
so remove it.

The upstream is has not been maintained for some time:
https://vimgadgets.sourceforge.net/liblinebreak/
and they say that liblinebreak has been superceded by libunibreak,
an equivalent library that works in more languages:
https://vimgadgets.sourceforge.net/libunibreak/
but since there are no users, libunibreak=C2=A0 was not packaged.

../Randy



>
> diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b=
/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
> similarity index 69%
> rename from meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
> rename to meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
> index 539b58bc5..c6caf450a 100644
> --- a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
> +++ b/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
> @@ -2,11 +2,10 @@ DESCRIPTION =3D "Liblinebreak is an implementation of=
 the line breaking algorithm
>   HOMEPAGE =3D"http://vimgadgets.sourceforge.net/liblinebreak/"
>   SECTION =3D "libs"
>   LICENSE =3D "Zlib"
> -LIC_FILES_CHKSUM =3D"file://LICENCE;md5=3D3715191da62bafb5cfc4ff36195b=
2ec3"
> +LIC_FILES_CHKSUM =3D"file://LICENCE;md5=3Df89a1ce02e2dba48c1c0a8e60384=
64c2"
>  =20
>   SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${=
PV}/liblinebreak-${PV}.tar.gz"
> -SRC_URI[md5sum] =3D "d18039259001ccb24b5dd4648c49c5ad"
> -SRC_URI[sha256sum] =3D "9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1=
a150af8b718d0c7b76"
> +SRC_URI[sha256sum] =3D "dd8cba554d260cf686865cc53d0c6be98102a80f56f815=
2ca5e7307bf06a66b8"
>  =20
>   UPSTREAM_CHECK_URI =3D"https://sourceforge.net/projects/vimgadgets/fi=
les/liblinebreak/"
>   UPSTREAM_CHECK_REGEX =3D "${BPN}/(?P<pver>\d+(\.\d+)+)"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111538):https://lists.openembedded.org/g/openembedd=
ed-devel/message/111538
> Mute This Topic:https://lists.openembedded.org/mt/107747837/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------9Js6HPDIFvD4csQHLUS4C071
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-08-06 4:45 a.m., wangmy via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1722933994-32549-15-git-send-email-wangmy@fujitsu.com">
      <pre wrap="" class="moz-quote-pre">License-Update: Copyright year updated from 2008 to 2008-2011

Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
---
 .../{liblinebreak_1.2.bb =&gt; liblinebreak_2.1.bb}             | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/liblinebreak/{liblinebreak_1.2.bb =&gt; liblinebreak_2.1.bb} (69%)</pre>
    </blockquote>
    <p>Hello,</p>
    <p>Do you or does anyone actually use this library?</p>
    <p><br>
    </p>
    <p>I was going to remove it with this commit log:</p>
    <p><br>
    </p>
    <p>Subject: [PATCH] liblinebreak: remove obsolete library<br>
      <br>
      liblinebreak has no users in meta-oe or in the layer index:<br>
      &nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Aliblinebreak">https://layers.openembedded.org/layerindex/branch/master/recipes/?q=depends%3Aliblinebreak</a><br>
      so remove it.<br>
      <br>
      The upstream is has not been maintained for some time:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://vimgadgets.sourceforge.net/liblinebreak/">https://vimgadgets.sourceforge.net/liblinebreak/</a><br>
      and they say that liblinebreak has been superceded by libunibreak,<br>
      an equivalent library that works in more languages:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://vimgadgets.sourceforge.net/libunibreak/">https://vimgadgets.sourceforge.net/libunibreak/</a><br>
      but since there are no users, libunibreak&nbsp; was not packaged.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:1722933994-32549-15-git-send-email-wangmy@fujitsu.com">
      <pre wrap="" class="moz-quote-pre">

diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
similarity index 69%
rename from meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
rename to meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
index 539b58bc5..c6caf450a 100644
--- a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
+++ b/meta-oe/recipes-support/liblinebreak/liblinebreak_2.1.bb
@@ -2,11 +2,10 @@ DESCRIPTION = &quot;Liblinebreak is an implementation of the line breaking algorithm
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://vimgadgets.sourceforge.net/liblinebreak/">&quot;http://vimgadgets.sourceforge.net/liblinebreak/&quot;</a>
 SECTION = &quot;libs&quot;
 LICENSE = &quot;Zlib&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=3715191da62bafb5cfc4ff36195b2ec3">&quot;file://LICENCE;md5=3715191da62bafb5cfc4ff36195b2ec3&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=f89a1ce02e2dba48c1c0a8e6038464c2">&quot;file://LICENCE;md5=f89a1ce02e2dba48c1c0a8e6038464c2&quot;</a>
 
 SRC_URI = &quot;${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}/liblinebreak-${PV}.tar.gz&quot;
-SRC_URI[md5sum] = &quot;d18039259001ccb24b5dd4648c49c5ad&quot;
-SRC_URI[sha256sum] = &quot;9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1a150af8b718d0c7b76&quot;
+SRC_URI[sha256sum] = &quot;dd8cba554d260cf686865cc53d0c6be98102a80f56f8152ca5e7307bf06a66b8&quot;
 
 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://sourceforge.net/projects/vimgadgets/files/liblinebreak/">&quot;https://sourceforge.net/projects/vimgadgets/files/liblinebreak/&quot;</a>
 UPSTREAM_CHECK_REGEX = &quot;${BPN}/(?P&lt;pver&gt;\d+(\.\d+)+)&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#111538): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/111538">https://lists.openembedded.org/g/openembedded-devel/message/111538</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/107747837/3616765">https://lists.openembedded.org/mt/107747837/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------9Js6HPDIFvD4csQHLUS4C071--

