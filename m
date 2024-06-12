Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A997DC27C78
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 01:28:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1067.1718155719875195325
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 18:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=689379b77b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C1Elkc010132
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 01:28:39 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2041.outbound.protection.outlook.com [104.47.73.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yme96392g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 01:28:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYMgPI/pnCFI+waWJwQBPrETjLbLjiZlFbPOnTXQiRneGa8Sf+I8e6fv8EuiOUTA8SvBEVix+pCMdDMM3+ACom9qS4sFAYeJh8ClExgQHhFLavAdRg8OP2DFZr5CKC+Plr3CFOcK5Ell+RMeC/wuLBxUJ5gZwrFGaGaJc/bE2EZHnsKfhbl4FR/VWiIvtzeptXwO5Rd2vA326eylNAPrasT5ko0hTbb197g192+jP0PxHI0rYzMpB8pMmTimgywLU+TTI1s0WYhv12Sg38aYTJCj6DDvYWb2qmze9HMHwIPidTMU1pY193wZChpBfW3ewaiT2XH9oZsVaancfKMMaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBlbp79H+uGE5wjF4ENkQYHIOEoQHpZo14ihSHKh7sg=;
 b=Fo9WxtSx+gUUg2MKwMD+pSqvr0HQPn6YsEuVaL9Ac/Cw1kbjvib1WykEKrk0ZykuAjZCOGvO/5hfSS6RiwaJlF+5MOVA7grU/saoOponrYXLDyOgcCuzHCjXHtH4FFHbu2VYGNn3mB3ahf3WvY8b8tJEt0uPYIdtg06uggeAbZQuAgh3uQXGzLl5NhuW5buYfJu6eUZ/LCWMbHJIVHcaOMyetjpdrotVdqr0axI8j6ZbUHfXOb/bmiXLppmGp/XdSeiKzxeUgm+Y0DugwP7cuo3pF3MML3oN5dzJ1nRlzy9N4h3tuDFyDtxF2flhjbKGJ+ssJC0qWYRdOrBS93Bs1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS0PR11MB7877.namprd11.prod.outlook.com (2603:10b6:8:f4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.37; Wed, 12 Jun 2024 01:28:34 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 01:28:34 +0000
Content-Type: multipart/alternative;
 boundary="------------NpzBqs2eHA8OQaJbzsZ9oXEI"
Message-ID: <ade9cfc6-c3f1-45a3-b0dc-4753cbd41910@windriver.com>
Date: Tue, 11 Jun 2024 21:28:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH] python3-pyyaml-include: support native and nativesdk
 build
To: openembedded-devel@lists.openembedded.org
References: <17D81D2FB17DDF02.11957@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <17D81D2FB17DDF02.11957@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::9) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS0PR11MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d34b43-dba7-49d5-698e-08dc8a7ef9d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U1h2N2E1eVd1WTJZQ1IyeUpwWENwRjJtQVdGTUQvaFBOUU92Wk9HZ1lsdGwx?=
 =?utf-8?B?bUpmRWNoUWFkZFI5UVhZaDJUWU4xaXRUUCtNdmM2NXQ0eG1KdVByZXJQS0dP?=
 =?utf-8?B?bUdraVJRbWVHejZvRWE1d1FsUVZ5YkJjSEE1eWJrVmY0M1ZPNFM2ODFIQmJo?=
 =?utf-8?B?RGtGRUNWR2FFQXpBVWdaTWY2am5YM1RLVDAvNXpHWGo1bGQvbzFYNmg0dEYx?=
 =?utf-8?B?ZUpuSmQwT1BnQ3F5aHpmNm1MWnFUMTBYOHoyVTVSMmprd2ZrbWlVUmZ6cU51?=
 =?utf-8?B?dTloQ3Q1aUdhSVFHN0MwVHVYbkF2Z05CNlk0VGtVY0l6akR5SGxVTktKamJC?=
 =?utf-8?B?Q1ZrY09IcXJnOTgzY1d0L25uUHY2K05YUm9WS0ZFK1NqbUdBT3dWdDhTaTdG?=
 =?utf-8?B?ZFZ2ZXNpdnQwRkxvZW9rOTRMbWNPVFljY3VMNEc1QzJld0ZsMHlhQ3Y0dUxY?=
 =?utf-8?B?WDdwb2pkb0EvK1RUWmhzSHBvN3JpcUVITEhheVdZTjYwL00rZUdpa3lpTyt3?=
 =?utf-8?B?Ujg4OU9pL2tkL3h2ekZsUEhXZnpBNDFSYW5DV0t1TFBhWDhlSndMOWg5eHdp?=
 =?utf-8?B?a1kzZUU3UGQ1WUowaTdkUXhJZEFmU25YbUNkTEk4MEFHSEJiV01nOW1oWnZm?=
 =?utf-8?B?SWhZRmdVREF4Z2I2dkRkczJzVi9MbnoxbTBKbDg4azRFcEVCakJ0YWd1aUw1?=
 =?utf-8?B?QWlqNklZTUt5b25MUFZMTmF0aGxGejVvRS9oTCsxOG9WVTJMMFMyNjFEbnEw?=
 =?utf-8?B?TkxsL2RrZWJxNlJNalN0aWdkaG1vb25sc0ZkWDFFU09KQ2w1allUQ3dhdG1y?=
 =?utf-8?B?Q1Z6bzJ1SENid0FJU3IrMTNlVjNINDNONEYzT0VMc3Q3dldPSzhSeGxDakgr?=
 =?utf-8?B?bHJZRExhalJ4SisxOXpkeU9vMkxiZGNuaHZodE5EMXJKcE5jUWxydm5qZEVO?=
 =?utf-8?B?ZDhMVHUwNWZ1UzRPSW9ZM3NQMmJ5Njl4NWUxbmd0QzgvaEJhZjhQZHVnbUh0?=
 =?utf-8?B?aHgxYmE4Y1psSkNmOURKMUNLTFlPbEIwbmhmT3pjYWlOU042bCtQR0s2REYv?=
 =?utf-8?B?d20xY3JFYjlQVjNML010S2pXV290MlVoNDVtOGJId0tHczU5RDBGMXRSenZz?=
 =?utf-8?B?a2FPdHd0bVhZRGtaaFJGYngrUG1Sc2VEM0ZaZmJyKy9LNXE2MnNvT1hodld5?=
 =?utf-8?B?OGVNVWNrSVg5YlpnS1B0Y0lldXczaTNvMXZ0TFVoSnI1UWoxeUZOSkNsdTRQ?=
 =?utf-8?B?RHpLUmhFZFU4ZytSL29CYTJaVjhRd3JMT2pSYWpTYWVEbVd0QTVCSEx2Wjln?=
 =?utf-8?B?bEhobmdzd2Nadk84VHF3YmVTVUgrVUxBQzdWOUhMbmdQcjY1TXB6Y1pWQkNF?=
 =?utf-8?B?QTVGeWR1NzVUeTVIOStwR3BkajZTeXg4a0dLcXF5Vy95QXRLeC9BVW9pcWlM?=
 =?utf-8?B?eVlVYURaNEVFY2RIMXpWZHdWUDNHcEsxRzRsb0JmNzFRc1NwM0NEem16YU1T?=
 =?utf-8?B?M0ZCWGU0VDBCbSt2L3ZKYzl5cVMvcU8rWXVjZDA2ZERBanB0UDRwcGJtd0wz?=
 =?utf-8?B?YkZFMjZDUWdMREI4aVA1Wm53NmNUdmRTa3p0VlFUbDZ6SnJTcDdOOGVkUmpR?=
 =?utf-8?B?cy9PVDZadWE0ckhseE9nS1k4QXJMTzlhSlE5UUczUSsxMS9MY1FKUGhXSStz?=
 =?utf-8?B?M0phb09zellFcEJGWnZBaS93TlluZm1EbUhzeHlCTzJSNXZaZjJ3N3dnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YVJRTENiMk42SGxWZVBnNlFtMFJjNElyM1Y3c2UzOVdyQ0Viblc3SEpIc2hn?=
 =?utf-8?B?enRoeVRpYlhLMHlLRXFrK0tHVnlJUElQYkxvcVoyYm1KRkFaWnRFMlZFVzFy?=
 =?utf-8?B?dk01TU1xVVlOMGtxbCtqWGRNSUZlWUxPaWxmaGNiTm1HSzVFMzV6bm5NY3M1?=
 =?utf-8?B?OVB6d1EyZnl0aGQyQituMUhmU1owR3FlTEVQZ1N3b1hYRFMrbWx6eFJFVjhu?=
 =?utf-8?B?ZUZZa1BqazJLUG55MDZkd1lxWEtHK1RSRFRpVWZjMnFJdkJsaFpTaU53M2tz?=
 =?utf-8?B?SzEvUFFubno2aVVvOExmWXNrWW9uRHJhMStrMHZPdmVsRFp2NGlCcmN2U2Rl?=
 =?utf-8?B?dkd3dE1Nd2Z6T1pUdE9uaHNkK2FPQjdwZGZ5WmkwZWZ0cnEwc081MEkvTG83?=
 =?utf-8?B?c0M1ek5nWGZMeG8wNkxWbUIzRzJGSmVpT3podVZmL3EreHpFQW9RV01aV0RL?=
 =?utf-8?B?eFN6d1NVMm1kT0g2WW1lYVlpd1ZOcWcvcDB4d3o0TTQrazJlc0MveVZ4VkRy?=
 =?utf-8?B?bkVoRHVUWmw2UnNMNHM2c1dLenVLY0ZRQnlLZk5rdnZwaWhWblQ4aTJJVFZB?=
 =?utf-8?B?T3ZteHoxRUFBc3FueUQvL0tvQWxTTnRxeGRuSkNzNjhxSExyY2R2VkxHakZz?=
 =?utf-8?B?RHZTdVd4V3Z1ZlRjVEF3RE5XZ2Y5YkhDT2dQejkrZkJHQ3B6VDhaM3hzTHVu?=
 =?utf-8?B?bjlSQk9ZdVZvZ2dIajdOUmZkcTAwTWJacTF4YThvSHZabEM5MVczNHhsWmhv?=
 =?utf-8?B?Vm5EMFlMS2pxK1FTOWMzVVNlL2IxWm54Z3p1V1RUWUUxSlRlK3VCS2xDWkQy?=
 =?utf-8?B?cjdiUWJZdFNMVWduVzI4THF2OHRoOHZkY2o0cjZ5bFM0YTdIYlhBQmNWM2R2?=
 =?utf-8?B?b3ZqcE5lc0tvMnN1aGlXY041bFpnMTVEV0VXWm9SRXQwcTFLc2dFempEb28w?=
 =?utf-8?B?bzBoREZtTlRxNU91aEpBVnRkZkltd1J1eW1BaDNMcE9GTS9pU0pIMGRUL2s5?=
 =?utf-8?B?bkxrMFRSM0xJVFRJdExHZDRWTlF3WDhkcXVsUldmUmNLSVVJMWVnY3cwUERx?=
 =?utf-8?B?LzI3cUJtbGh4ZzBPVlFkdDBXYUNGeWxZaDk0ZTRsNmN4S2t6d1Z0RVhhTVRH?=
 =?utf-8?B?VHZzQjUrSDJtQXpBaGJRU3FhUzRjMSsyQVNKclB6WmZRMEV4ZUpnUkhnYTBH?=
 =?utf-8?B?ZmQ5dHZJM3RYNG1YbndjWXNWTm1OVWlyTkFCSzQ5ZXg1R3QrZHdrTnQ3WEhk?=
 =?utf-8?B?c2xPa01IVTU0TVd6MVR2WEwxVWNSU2QrRnlFYjBmYlV5Sk1FQW1RczB5d2pu?=
 =?utf-8?B?bnovVzdrLzh3dTdNWnBHN0dxeTVTcWJKUDllcjlmZ3NhUnpyQ2Zxa2tpakNX?=
 =?utf-8?B?Zi9sOU5zLy82Z0tqQ2QzczZ1OHNLbkRDSnBPUUpKMS9GbFQ2SWtORVZFMy9p?=
 =?utf-8?B?N2lXWHhEMTRFUkhlMVcrOVB2M0pMd3o0SFB6VnArak9PU1R0c2U0NEtKMHcw?=
 =?utf-8?B?eHhhOVY0R3piejA5NnVUc3l5ZWljSU1nNUx0VndaT05SSHRoNnkvMGRBS1F4?=
 =?utf-8?B?RFNCeGZQSUJpaGEyeWhIb2NrL2ozZXhkcW1Iek8wT2dRQzNzVUo5bGFkWUpz?=
 =?utf-8?B?T1hROWJaVWhreGV1NE9NUkhMd2JTR1E4aWkzaFQxbG9kRkloQmM5bTcwV3Jh?=
 =?utf-8?B?L1Evbjdma2l2ckIvbGtzTUJiTGVLbXdmUEowUU9rcVE1bDBuSE9lbVBMVW82?=
 =?utf-8?B?L0VrWlZ0K2xXcWZXVG1RcFllSDVOZjhRcDlYUFVmaVhQcGxZblB2b2l3RDRs?=
 =?utf-8?B?SHJsR3loaThvckJhL2NYOTRvQnRqbU5jTFc1RjE5NHFTZEs5aXY0WWxmb3ky?=
 =?utf-8?B?TERacm5xVTFZeGQzSE0wbEFQQVYvTytEWTlpemd4aEpzWFdrejBERDQ0ZXor?=
 =?utf-8?B?TU5Xc0NWZFZJZmdlTW90cGlwdWFVdkJRbjJaZE10Ri9ENTNvNy9PQVlKRm5w?=
 =?utf-8?B?OWxPM1ZXelNISWNxOERGdHpQZUJsMVQ5SFdqdzhhVDBjMXc0WWJDQXNaWWpK?=
 =?utf-8?B?RUwrZW0rQTBOZExQNFJua1pISHRIK1FZaHk4QSt0VVc2c2VvMlgzMGZMODc1?=
 =?utf-8?B?djE5dDZubXovYkdyN0FXNSsrWkc3d2h5U2NJTmx6a2VJTC9xVGtZbmhaWlNS?=
 =?utf-8?B?Y2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d34b43-dba7-49d5-698e-08dc8a7ef9d8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 01:28:34.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XCfdC3JsMmmHyvv+5wZnChYf8cfytdOsZAUhBbvVofLrv7SjJb5fESILTckaqzp5n9iazNxZSXBErTtSLSWIf7YRVKpYHrBD68dj2gHv/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7877
X-Proofpoint-GUID: DvT2I1iPw8_s6pQpbxBQ_3ccGQl1vO3I
X-Proofpoint-ORIG-GUID: DvT2I1iPw8_s6pQpbxBQ_3ccGQl1vO3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_13,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406120008
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 01:28:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110836

--------------NpzBqs2eHA8OQaJbzsZ9oXEI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

[oe] [PATCH] python3-pyyaml-include: support native and nativesdk build

oops, I forgot the meta-python prefix. fixing.

../Randy


On 2024-06-11 9:22 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   .../recipes-devtools/python/python3-pyyaml-include_1.3.2.bb     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
> index 3a5bd99a7..309d0ac59 100644
> --- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
> @@ -26,4 +26,4 @@ RDEPENDS:${PN}-ptest += " \
>       python3-pytest \
>       python3-unittest-automake-output \
>   "
> -
> +BBCLASSEXTEND = "native nativesdk"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110835):https://lists.openembedded.org/g/openembedded-devel/message/110835
> Mute This Topic:https://lists.openembedded.org/mt/106625252/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------NpzBqs2eHA8OQaJbzsZ9oXEI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">[oe] [PATCH] python3-pyyaml-include:
      support native and nativesdk build</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">oops, I forgot the meta-python prefix.
      fixing.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">../Randy<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 2024-06-11 9:22 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17D81D2FB17DDF02.11957@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 .../recipes-devtools/python/python3-pyyaml-include_1.3.2.bb     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
index 3a5bd99a7..309d0ac59 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_1.3.2.bb
@@ -26,4 +26,4 @@ RDEPENDS:${PN}-ptest += &quot; \
     python3-pytest \
     python3-unittest-automake-output \
 &quot;
-
+BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#110835): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/110835">https://lists.openembedded.org/g/openembedded-devel/message/110835</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106625252/3616765">https://lists.openembedded.org/mt/106625252/3616765</a>
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

--------------NpzBqs2eHA8OQaJbzsZ9oXEI--

